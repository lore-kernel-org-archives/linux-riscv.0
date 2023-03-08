Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFF9C678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 13:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUFUbi6JvD5EcQqw/eHs3ipH5Zvi1R5LnvFzZhOrMKc=; b=C0mJ4mmPvrIKV6
	kca1nW/UKZ7BwvTDCHWMWxqcxuWlJ5z2Ozzh1DfIEGNNYvI5DeXk5xyD8ttfm6QR84IIcBBeqAl2H
	OLpCxRG/4BhJQqs5YllbxSA3u1LvxtOtTecyW6hR8Et/4EAZZnxCctENlIFbk7DRcDUz8VoR3yycq
	2lZVqOOryS1+Dpqs+4XbwSsul0ySGQEkQEZhF3UHD1FXt6oqRw9AaMgAFZSRA441BFaW6qQZlmvRa
	NOPeKM5fox943G+XBveyN5rCdH0WTgMGyZ4GGpzT3Gyk/KQJsq8nXwQQ6a4eZUVIFmGixm6lX1/vq
	zgOMLMJaBo0nsmi1uuFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZthh-0059hF-1R; Wed, 08 Mar 2023 13:19:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZthd-0059dd-R1
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 13:19:35 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pZthX-0007Ji-27; Wed, 08 Mar 2023 14:19:27 +0100
From: heiko@sntech.de
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 ajones@ventanamicro.com, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 2/2] riscv: mm: add pgprot_dmacoherent for zicbom
Date: Wed, 08 Mar 2023 14:19:35 +0100
Message-ID: <1772602.TLkxdtWsSY@diego>
In-Reply-To: <226aa2ae-dfa0-d947-0aaf-4407e0c0bc5b@codethink.co.uk>
References:  <20230307205834.1426289-1-ben.dooks@codethink.co.uk>
 <20230307205834.1426289-3-ben.dooks@codethink.co.uk>
 <226aa2ae-dfa0-d947-0aaf-4407e0c0bc5b@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_051933_912240_175D933F 
X-CRM114-Status: GOOD (  24.21  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Mittwoch, 8. M=E4rz 2023, 10:35:14 CET schrieb Ben Dooks:
> On 07/03/2023 20:58, Ben Dooks wrote:
> > If the system uses both ZICBOM and SVPBMT then currently SVPBMT will be
> > used for DMA allocated memory even though ZICBOM gives us the cache ops
> > to use cached memory and clean/flush them as needed by the DMA code.
> > =

> > Fix this by adding pgprot_dmacoherent() which is used by the allocator
> > code to map the dma memory, thus allowing the return of suitably mapped
> > memory for any use of dma_alloc_attrs() code. This s uses the added
> > riscv_page_dmacoherent() which will work out the correct page flags to
> > return using ALT_SVPBMT_ZICBOM() to runtime patch the right result.
> > =

> > Note, we can't just disable SVPBMT as it will be neede for things like
> > ioremap() which don't have assoicated cache management operations.
> > =

> > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > ---
> >   arch/riscv/include/asm/errata_list.h | 16 ++++++++++++++++
> >   arch/riscv/include/asm/pgtable-64.h  | 10 ++++++++++
> >   2 files changed, 26 insertions(+)
> > =

> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/=
asm/errata_list.h
> > index fb1a810f3d8c..49ed2e7984a7 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -62,6 +62,22 @@ asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
> >   		  "I"(ALT_SVPBMT_SHIFT),				\
> >   		  "I"(ALT_THEAD_PBMT_SHIFT))
> >   =

> > +#define ALT_SVPBMT_ZICBOM(_val, prot)					\
> > +asm(ALTERNATIVE_3("li %0, 0\t\nnop",					\
> > +		  "li %0, %1\t\nslli %0,%0,%3", 0,			\
> > +			RISCV_ISA_EXT_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
> > +		  "li %0, 0\t\nnop", 0,					\
> > +			RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,	\
> =

> so, I tink this needs to be selected on CONFIG_RISCV_DMA_NONCOHERENT
> as just having ZICBOM in the ISA isn't enough to actually use it, you'll
> need the dma-noncoherent.o being built to do the cache management.

CONFIG_RISCV_ISA_ZICBOM does a
	select RISCV_DMA_NONCOHERENT
same as CONFIG_ERRATA_THEAD_CMO

So dma-noncoherent gets build if you enable at least one of them.
What am I missing?


> > +		  "li %0, %2\t\nslli %0,%0,%4", THEAD_VENDOR_ID,	\
> > +			ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)	\
> > +		: "=3Dr"(_val)						\
> > +		: "I"(prot##_SVPBMT >> ALT_SVPBMT_SHIFT),		\
> > +		  "I"(prot##_THEAD >> ALT_THEAD_PBMT_SHIFT),		\
> > +		  "I"(ALT_SVPBMT_SHIFT),				\
> > +		  "I"(ALT_THEAD_PBMT_SHIFT))
> > +
> > +
> > +
> >   #ifdef CONFIG_ERRATA_THEAD_PBMT
> >   /*
> >    * IO/NOCACHE memory types are handled together with svpbmt,
> > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/a=
sm/pgtable-64.h
> > index 42a042c0e13e..e0d2e5fda5a4 100644
> > --- a/arch/riscv/include/asm/pgtable-64.h
> > +++ b/arch/riscv/include/asm/pgtable-64.h
> > @@ -126,10 +126,20 @@ static inline u64 riscv_page_io(void)
> >   	return val;
> >   }
> >   =

> > +static inline u64 riscv_page_dmacoherent(void)
> > +{
> > +	u64 val;
> > +
> > +	ALT_SVPBMT_ZICBOM(val, _PAGE_IO);
> > +	return val;
> > +}
> > +
> >   #define _PAGE_NOCACHE		riscv_page_nocache()
> >   #define _PAGE_IO		riscv_page_io()
> >   #define _PAGE_MTMASK		riscv_page_mtmask()
> >   =

> > +#define pgprot_dmacoherent(__prot) __pgprot(pgprot_val(__prot) | riscv=
_page_dmacoherent())
> > +
> >   /* Set of bits to preserve across pte_modify() */
> >   #define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ =
|	\
> >   					  _PAGE_WRITE | _PAGE_EXEC |	\
> =

> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
