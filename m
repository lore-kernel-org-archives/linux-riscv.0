From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 2 Jul 2018 06:32:33 -0700
Subject: [RFC] Cache flush via SBI
In-Reply-To: <CAAhSdy3=k52BYjiC+2S0RHk-hnPQXP0da-04aL-tb_O_XuvUEg@mail.gmail.com>
References: <CAAhSdy3=k52BYjiC+2S0RHk-hnPQXP0da-04aL-tb_O_XuvUEg@mail.gmail.com>
Message-ID: <20180702133233.GA25558@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Jul 02, 2018 at 05:42:01PM +0530, Anup Patel wrote:
> Hi All,
> 
> I have gone through various discussions around cache flush/invalidate
> operation not being part of RISC-V spec. Although, CPU designers can
> still provide these operations in an implementation specific way.
> Right?
> 
> My suggestion is to have SBI calls for cache flush/invalidate so that
> platform specific firmware can
> provide cache flush/invalidate in a more generic way. Thoughts??

No, we need to add them to the spec.  In fact Jacob just sent out
anothet proposal to isa-dev, but I haven't had the time to go back
and review it yet.
