From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 25 Sep 2018 08:36:59 -0700 (PDT)
Subject: mmcqd/0 stuck at 100% CPU
In-Reply-To: <q3pnx2kspy.fsf@armitage.lysator.liu.se>
Message-ID: <mhng-9789543b-ece6-4f92-b4f6-ec6ebc258baf@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 24 Sep 2018 23:15:53 PDT (-0700), marcus at lysator.liu.se wrote:
>
> Arnd Bergmann <arnd@arndb.de> writes:
>
>>> I'm writing this mail to inform about an issue with the SDcard driver on
>>> the Hi5Unleashed board running Linux 4.15.18 (riscv-linux-4.15 branch
>>> from git + patch-4.15.18.xz from kernel.org).
>>
>> Can you try a newer kernel version?
>
> Only the 4.15 branch supports the H5U, and there are no further patches
> to that kernel line.  I can try this unofficial mix between 4.15 and
> 4.19-rc2:
> https://github.com/atishp04/riscv-linux/tree/4.19_fedora_success_sep11 
>
>
>> This part of the mmc stack was completely rewritten in 4.16
>> (after many years of not changing much), so the results will
>> be very different. If there is a bug in the driver, it may show
>> in a different way though.
>
> Ok, worth a try then.  Thanks.

FWIW, I'm pretty sure that we see worse behavior in the newer kernels than the 
older kernels.  Paul or Atish might know better, though, as I haven't poked 
this in a bit.

In other words: we know about the bug, but nobody has actually tracked it down 
yet because we don't have a stable enough version of all our drivers.  We're 
working on that :)

Sorry you got bit by this bug!
