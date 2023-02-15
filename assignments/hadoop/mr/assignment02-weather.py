from mrjob.job import MRJob

class MinTemperature(MRJob):

        def mapper(self, _, line):
                yield(line.split()[1][4:6], (float(line.split()[5]), float(line.split()[6])))

        def reducer(self, month, temp):
                ma_list = []
                mi_list = []
                dict_list = {
                        1: "Jan",
                        2: "Feb",
                        3: "Mar",
                        4: "Apr",
                        5: "May",
                        6: "Jun",
                        7: "Jul",
                        8: "Aug",
                        9: "Sep",
                        10: "Oct",
                        11: "Nov",
                        12: "Dec"
                }
                mn = dict_list[int(month)]
                for ele in temp:
                        ma_list.append(ele[0])
                        mi_list.append(ele[1])
                maxi_temp = max(ma_list)
                mini_temp = min(mi_list)
                yield ( mn, (maxi_temp, mini_temp) )

if __name__ == '__main__':
        MinTemperature.run()