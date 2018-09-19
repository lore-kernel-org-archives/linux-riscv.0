From: schwab@suse.de (Andreas Schwab)
Date: Wed, 19 Sep 2018 09:22:38 +0200
Subject: Driver for HiFive-U MMC interface
In-Reply-To: <mhng-4e7e9fe4-3a36-415e-a1a5-b41493b806b1@palmer-si-x1c4>
 (Palmer Dabbelt's message of "Tue, 18 Sep 2018 18:45:12 -0700 (PDT)")
References: <mhng-4e7e9fe4-3a36-415e-a1a5-b41493b806b1@palmer-si-x1c4>
Message-ID: <mvmd0tavtmp.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Sep 18 2018, Palmer Dabbelt <palmer@sifive.com> wrote:

> On Thu, 06 Sep 2018 01:19:43 PDT (-0700), schwab at suse.de wrote:
>> Further trying to boot git://github.com/riscv/riscv-linux#riscv-linux-4.18 on
>> the HiFive-U I can't seem to find the necessary bits to drive the MMC
>> interface.  Any pointers?
>
> Paul is probably the best bet here, as he's working through our mess of
> out-of-tree drivers.  If you want to do it yourself then you'll have to
> forward-port the SPI driver from riscv-linux-4.15 (or wip-spi), fix the
> bugs, and then port the dependent drivers.

At least on top of 4.17 it works pretty well (see
git://github.com/andreas-schwab/riscv-linux#riscv-4.17), but the same
drivers on top of 4.18 are very unstable.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
