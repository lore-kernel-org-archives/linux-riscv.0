From: hch@infradead.org (Christoph Hellwig)
Date: Thu, 22 Feb 2018 07:54:42 -0800
Subject: [PATCH] riscv: enable STRICT_DEVMEM by default
In-Reply-To: <1519314839.2861.1.camel@wdc.com>
References: <20180222153941.20826-1-hch@lst.de>
 <1519314839.2861.1.camel@wdc.com>
Message-ID: <20180222155442.GA7838@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Feb 22, 2018 at 03:54:01PM +0000, Bart Van Assche wrote:
> On Thu, 2018-02-22 at 07:39 -0800, Christoph Hellwig wrote:
> > No need to enable /dev/mem access on a new port.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  lib/Kconfig.debug | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 6088408ef26c..0c6c2aafe93a 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -1968,7 +1968,7 @@ config STRICT_DEVMEM
> >  	bool "Filter access to /dev/mem"
> >  	depends on MMU && DEVMEM
> >  	depends on ARCH_HAS_DEVMEM_IS_ALLOWED
> > -	default y if TILE || PPC || X86 || ARM64
> > +	default y if TILE || PPC || X86 || ARM64 | RISCV
>                                                  ^
> Did you perhaps intend "||" instead of "|"? With that change applied:
> 
> Reviewed-by: Bart Van Assche <bart.vanassche@wdc.com

Oops, yes.
