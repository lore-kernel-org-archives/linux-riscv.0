From: atish.patra@wdc.com (Atish Patra)
Date: Wed, 1 Aug 2018 18:02:52 -0700
Subject: [PATCH 7/9] irqchip: add a RISC-V PLIC driver
In-Reply-To: <20180801141858.GA28203@lst.de>
References: <20180726143723.16585-1-hch@lst.de>
 <20180726143723.16585-8-hch@lst.de>
 <1b3f6066-0c7c-a5f5-75ad-559fe81091ee@wdc.com>
 <dc69d688-f765-74cc-3234-563fecff6002@wdc.com> <20180731165712.GA2521@lst.de>
 <dcb17e67-9f83-0ff5-a2c6-a6dd1b4d9c0d@wdc.com>
 <20180801141858.GA28203@lst.de>
Message-ID: <41a996bf-b591-db0c-718e-524743f348fd@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 8/1/18 7:14 AM, Christoph Hellwig wrote:
> I've pushed out an update to the riscv-irq-simple.2 branch to better
> handle with sparse contexid maps, please retry with that.
> 

I see you have changed the driver file name from irq-riscv-plic to 
irq-riscv-sifive along with default Y for SIFIVE_PLIC. I guess it was 
done because PLIC register spec is SIFIVE specific rather than RISC-V.

But can we keep the new kconfig option "SIFIVE_PLIC" enabled in 
driver/irqchip/Kconfig or arch/riscv/Kconfig for now to avoid breakage 
without linux_defconfig update.

With the config enabled, Qemu virt machine booting has no issues with 
riscv-irq-simple.2 branch. I am still looking at the crash from the 
hardware.

Regards,
Atish
