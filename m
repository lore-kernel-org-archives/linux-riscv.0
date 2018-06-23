From: hch@infradead.org (Christoph Hellwig)
Date: Sat, 23 Jun 2018 00:25:12 -0700
Subject: [PATCH 1/3] RISC-V: Don't include irq-riscv-intc.h
In-Reply-To: <20180622232006.12158-2-palmer@sifive.com>
References: <20180622232006.12158-1-palmer@sifive.com>
 <20180622232006.12158-2-palmer@sifive.com>
Message-ID: <20180623072512.GB25573@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Jun 22, 2018 at 04:20:04PM -0700, Palmer Dabbelt wrote:
> This file has never existed in the upstream kernel, but it's guarded by
> an #ifdef that's also never existed in the upstream kernel.  As a part
> of our interrupt controller refactoring this header is no longer
> necessary, but this reference managed to sneak in anyway.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
