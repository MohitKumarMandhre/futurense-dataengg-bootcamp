from mrjob.job import MRJob

class minmaxWeather(MRJob):

        """ The below mapper() function defines the mapper for MapReduce and takes
        key value argument and generates the output in tuple format .
        The mapper below is splitting the line and generating a word with its own
        count i.e. 1 """
        def mapper(self, _, line):

            ( WBANNO, LST_DATE, CRX_VN, LONGITUDE, LATITUDE, T_DAILY_MAX, T_DAILY_MIN, T_DAILY_MEAN, T_DAILY_AVG, P_DAILY_CALC) = line.split()
            month = str(LST_DATE)[4:6]
            yield month, T_DAILY_MIN, T_DAILY_MAX
                        
                        
        """ The below reducer() is aggregating the result according to their key and
        producing the output in a key-value format with its total count"""
        def reducer(self, month, T_DAILY_MIN, T_DAILY_MAX):
                yield( month, min(T_DAILY_MIN), max(T_DAILY_MAX) )

"""the below 2 lines are ensuring the execution of mrjob, the program will not
execute without them"""
if __name__ == '__main__':
        minmaxWeather.run()
