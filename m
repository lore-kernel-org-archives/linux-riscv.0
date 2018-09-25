From: marcus@lysator.liu.se (Marcus Comstedt)
Date: Tue, 25 Sep 2018 08:15:53 +0200
Subject: mmcqd/0 stuck at 100% CPU
In-Reply-To: <CAK8P3a3h4eBBWk0WTo6=b+Q0Q33M_6tQQyrwGorgYDNrBj3AwA@mail.gmail.com>
 (Arnd Bergmann's message of "Tue, 25 Sep 2018 07:48:14 +0200")
References: <q3worc5qfj.fsf@armitage.lysator.liu.se>
 <CAK8P3a3h4eBBWk0WTo6=b+Q0Q33M_6tQQyrwGorgYDNrBj3AwA@mail.gmail.com>
Message-ID: <q3pnx2kspy.fsf@armitage.lysator.liu.se>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org


Arnd Bergmann <arnd@arndb.de> writes:

>> I'm writing this mail to inform about an issue with the SDcard driver on
>> the Hi5Unleashed board running Linux 4.15.18 (riscv-linux-4.15 branch
>> from git + patch-4.15.18.xz from kernel.org).
>
> Can you try a newer kernel version?

Only the 4.15 branch supports the H5U, and there are no further patches
to that kernel line.  I can try this unofficial mix between 4.15 and
4.19-rc2:
https://github.com/atishp04/riscv-linux/tree/4.19_fedora_success_sep11 


> This part of the mmc stack was completely rewritten in 4.16
> (after many years of not changing much), so the results will
> be very different. If there is a bug in the driver, it may show
> in a different way though.

Ok, worth a try then.  Thanks.


  // Marcus


-- 
--------------------------------------------------------------------------
Marcus Comstedt                          Lysator Academic Computer Society
marcus at lysator.liu.se                    Link?ping University, Sweden   //
----------------------------------------------------------------------\X/-
