import threading
import time

MAX_COUNT = 10000000
THREADS = 2

class myThread(threading.Thread):
	counter = 0

	def __init__(self, threadID, counts):
		threading.Thread.__init__(self)
		self.threadID = threadID
		self.counts = counts
	def run(self):
		print("Starting " + repr(self.threadID))
		for i in range(self.counts):
			myThread.counter += 1
		print("End {} counter: {}".format(self.threadID, myThread.counter))

threads = []

for i in range(THREADS):
	# Create new threads
	t = myThread(i, int(MAX_COUNT/THREADS))
	threads.append(t)

for t in threads:
	# Start threads
	t.start();


# Wait for all threads to complete
for t in threads:
	t.join()

print("Counter value: {} Expected: {}".format(myThread.counter, MAX_COUNT))

