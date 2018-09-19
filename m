From: palmer@sifive.com (Palmer Dabbelt)
Date: Tue, 18 Sep 2018 18:45:12 -0700 (PDT)
Subject: Driver for HiFive-U MMC interface
In-Reply-To: <mvmworzdom8.fsf@suse.de>
Message-ID: <mhng-4e7e9fe4-3a36-415e-a1a5-b41493b806b1@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 06 Sep 2018 01:19:43 PDT (-0700), schwab at suse.de wrote:
> Further trying to boot git://github.com/riscv/riscv-linux#riscv-linux-4.18 on
> the HiFive-U I can't seem to find the necessary bits to drive the MMC
> interface.  Any pointers?

Paul is probably the best bet here, as he's working through our mess of 
out-of-tree drivers.  If you want to do it yourself then you'll have to 
forward-port the SPI driver from riscv-linux-4.15 (or wip-spi), fix the bugs, 
and then port the dependent drivers.

Sorry!
