From: atish.patra@wdc.com (Atish Patra)
Date: Wed, 19 Sep 2018 00:35:10 -0700
Subject: Driver for HiFive-U MMC interface
In-Reply-To: <mvmd0tavtmp.fsf@suse.de>
References: <mhng-4e7e9fe4-3a36-415e-a1a5-b41493b806b1@palmer-si-x1c4>
 <mvmd0tavtmp.fsf@suse.de>
Message-ID: <3f299fc2-e38b-ccc9-2e29-c4a456f1fee6@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 9/19/18 12:23 AM, Andreas Schwab wrote:
> On Sep 18 2018, Palmer Dabbelt <palmer@sifive.com> wrote:
> 
>> On Thu, 06 Sep 2018 01:19:43 PDT (-0700), schwab at suse.de wrote:
>>> Further trying to boot git://github.com/riscv/riscv-linux#riscv-linux-4.18 on
>>> the HiFive-U I can't seem to find the necessary bits to drive the MMC
>>> interface.  Any pointers?
>>
>> Paul is probably the best bet here, as he's working through our mess of
>> out-of-tree drivers.  If you want to do it yourself then you'll have to
>> forward-port the SPI driver from riscv-linux-4.15 (or wip-spi), fix the
>> bugs, and then port the dependent drivers.
> 
> At least on top of 4.17 it works pretty well (see
> git://github.com/andreas-schwab/riscv-linux#riscv-4.17), but the same
> drivers on top of 4.18 are very unstable.
> 
> Andreas.
> 
There were some network and DMA32 issues in 4.18. Here is my tree on top 
of 4.19-rc2. I use this for booting Fedora Gnome Desktop as well.

https://github.com/atishp04/riscv-linux/tree/4.19_fedora_success_sep11


Regards,
Atish
