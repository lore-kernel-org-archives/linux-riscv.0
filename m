Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570F8C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 12:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yI1vY+hm6Jf7+hcQMQGI8s7aCnOqeN55onXb+hYXxgU=; b=OVhGQoJEEOsD3V
	9CetSCU5truCudBr0rG1PMRUE2z1NR7Q8eo0YIDKTWRN0WLcsZQ1QTzLhduzXzHBTXskYbiVZ26NK
	uC8nHRPh0+lwDTmv4bN6AYhSb3gae3JSCDSP+Q45gOREhiuLGXg42QEn8OFm42NVO1tFceJrzP7s1
	90Ohff5A4Q7L+CWaF9LeKOv6mCzpXPG0oHo43d0uAA/p8U5ZzOBPPrM4IwhjEXhqS/E4fN9usl2qX
	hZhtV1hopgx2HUE6OyMsPYl5g5/WtJgjYzBI6p6GN+SQ+8445RuR9M/n9izBJh1ML1fVLIZGFKfIs
	vN8XF52L6YqKF3T3pAnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT06V-00EAP9-7P; Fri, 17 Feb 2023 12:44:43 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT06R-00EAMG-1S
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 12:44:41 +0000
Received: by mail-ed1-x533.google.com with SMTP id cn2so3806067edb.4
        for <linux-riscv@lists.infradead.org>; Fri, 17 Feb 2023 04:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G+TCL7vDnGQs9YnQSLWgcrln15qUSy2TwKtkHbStfYw=;
        b=FDjcJYZEGki5wZH7i6Se3eMXi+xp8N6A80rNn/yi97Ns9oLiD1LLoPV7VFeiHSoiZE
         IEpdr9IJHB0Ueswof/OFPNyVTz6fd1ms9j94LGL9V3gdQIi8uOck48yyaigbsCra7Y0M
         vnXazJK8kkS1+B6pC/dPYnMfTsWRt9LFvx1ADbGdN3a2ijqn/EHWUEvWJ+BUAOevAaJG
         HbwcIGF6fhyTChu4OWzafhe8bZKMfancP22MrMRMRKZZ5DeIuXNPEm9Qf1X8mRIzFlEZ
         2nmE8v5WjanUPK+5uSbXWPLTgBHMFrQXxq+GA/EP2zSGD9xJRPBXwx080QrlPa1isO7m
         fkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+TCL7vDnGQs9YnQSLWgcrln15qUSy2TwKtkHbStfYw=;
        b=MkU16dv/6xEGDQSOtlt7RG8Xrde/qmFX+l/EVOoyGkuIM1TuopUN1zX2aONfioLZ3H
         FfKfsmqZCXtpaWA5PdEcHvZYpD6ktV0i0gmJLbRmuqRDaA5uuw8zMc/oAC+j/CuJ/Jsp
         srOjByhyPW15ez5WTs0HRKb5pUxw9KYDhAhx19Msmqf64eQsf4iubbcZoBcxwCk8rvZP
         lGkFmPKG8ES/yyIWME0eVzg+OJCAWKlWMopXfkM8TL+yPfJZqV2A1/uIZv/HfRqHtk9M
         NRK861ZQA25lhByKX4JzPeG0RSR9HtaSatLnmUmJuS5dg3/lzpvUhlep8yymxTI98kMr
         uJkQ==
X-Gm-Message-State: AO0yUKXEy0g7fuKyHIm7a2gusjuEpSXfhX4U1iPVSTpHFQGYvwMvxURs
	e4TT7s598AZIs3TxHDhXvXloGQ==
X-Google-Smtp-Source: AK7set8IapZPrnpXmqeuv2/CaBSwGtJcbNCVCT9NTwRlQlptSHdCM6yPJOEdpjc7/1ZfvhFG5mV5Sw==
X-Received: by 2002:aa7:d612:0:b0:4ab:db9e:9682 with SMTP id c18-20020aa7d612000000b004abdb9e9682mr9049612edr.34.1676637875797;
        Fri, 17 Feb 2023 04:44:35 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id h11-20020a50cdcb000000b004aaa4da918fsm2213604edj.45.2023.02.17.04.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 04:44:35 -0800 (PST)
Date: Fri, 17 Feb 2023 13:44:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 6/8] RISC-V: Use Zicboz in clear_page when available
Message-ID: <20230217124434.t5v4zsoemrwuwbjf@orel>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-7-ajones@ventanamicro.com>
 <4a25cf89-bcf0-e78c-a8ab-7ba0c4f8e2bf@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a25cf89-bcf0-e78c-a8ab-7ba0c4f8e2bf@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_044439_113121_AD44E5D7 
X-CRM114-Status: GOOD (  56.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 17, 2023 at 10:18:26AM +0000, Ben Dooks wrote:
> On 09/02/2023 15:26, Andrew Jones wrote:
> > Using memset() to zero a 4K page takes 563 total instructions, where
> > 20 are branches. clear_page(), with Zicboz and a 64 byte block size,
> > takes 169 total instructions, where 4 are branches and 33 are nops.
> > Even though the block size is a variable, thanks to alternatives, we
> > can still implement a Duff device without having to do any preliminary
> > calculations. This is achieved by taking advantage of 'vendor_id'
> > being used as application-specific data for alternatives, enabling us
> > to stop patching / unrolling when 4K bytes have been zeroed (we would
> > loop and continue after 4K if the page size would be larger)
> > 
> > For 4K pages, unrolling 16 times allows block sizes of 64 and 128 to
> > only loop a few times and larger block sizes to not loop at all. Since
> > cbo.zero doesn't take an offset, we also need an 'add' after each
> > instruction, making the loop body 112 to 160 bytes. Hopefully this
> > is small enough to not cause icache misses.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >   arch/riscv/Kconfig                | 13 ++++++
> >   arch/riscv/include/asm/insn-def.h |  4 ++
> >   arch/riscv/include/asm/page.h     |  6 ++-
> >   arch/riscv/kernel/cpufeature.c    | 11 +++++
> >   arch/riscv/lib/Makefile           |  1 +
> >   arch/riscv/lib/clear_page.S       | 71 +++++++++++++++++++++++++++++++
> >   6 files changed, 105 insertions(+), 1 deletion(-)
> >   create mode 100644 arch/riscv/lib/clear_page.S
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 029d1d3b40bd..9590a1661caf 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -456,6 +456,19 @@ config RISCV_ISA_ZICBOM
> >   	   If you don't know what to do here, say Y.
> > +config RISCV_ISA_ZICBOZ
> > +	bool "Zicboz extension support for faster zeroing of memory"
> > +	depends on !XIP_KERNEL && MMU
> > +	select RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	   Enable the use of the ZICBOZ extension (cbo.zero instruction)
> > +	   when available.
> > +
> > +	   The Zicboz extension is used for faster zeroing of memory.
> > +
> > +	   If you don't know what to do here, say Y.
> > +
> >   config TOOLCHAIN_HAS_ZIHINTPAUSE
> >   	bool
> >   	default y
> > diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> > index e01ab51f50d2..6960beb75f32 100644
> > --- a/arch/riscv/include/asm/insn-def.h
> > +++ b/arch/riscv/include/asm/insn-def.h
> > @@ -192,4 +192,8 @@
> >   	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> >   	       RS1(base), SIMM12(2))
> > +#define CBO_zero(base)						\
> > +	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> > +	       RS1(base), SIMM12(4))
> > +
> >   #endif /* __ASM_INSN_DEF_H */
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> > index 9f432c1b5289..ccd168fe29d2 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -49,10 +49,14 @@
> >   #ifndef __ASSEMBLY__
> > +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> > +void clear_page(void *page);
> > +#else
> >   #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
> > +#endif
> >   #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)
> > -#define clear_user_page(pgaddr, vaddr, page)	memset((pgaddr), 0, PAGE_SIZE)
> > +#define clear_user_page(pgaddr, vaddr, page)	clear_page(pgaddr)
> >   #define copy_user_page(vto, vfrom, vaddr, topg) \
> >   			memcpy((vto), (vfrom), PAGE_SIZE)
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 74736b4f0624..42246bbfa532 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -280,6 +280,17 @@ void __init riscv_fill_hwcap(void)
> >   #ifdef CONFIG_RISCV_ALTERNATIVE
> >   static bool riscv_cpufeature_application_check(u32 feature, u16 data)
> >   {
> > +	switch (feature) {
> > +	case RISCV_ISA_EXT_ZICBOZ:
> > +		/*
> > +		 * Zicboz alternative applications provide the maximum
> > +		 * supported block size order, or zero when it doesn't
> > +		 * matter. If the current block size exceeds the maximum,
> > +		 * then the alternative cannot be applied.
> > +		 */
> > +		return data == 0 || riscv_cboz_block_size <= (1U << data);
> > +	}
> > +
> >   	return data == 0;
> >   }
> > diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> > index 6c74b0bedd60..26cb2502ecf8 100644
> > --- a/arch/riscv/lib/Makefile
> > +++ b/arch/riscv/lib/Makefile
> > @@ -8,5 +8,6 @@ lib-y			+= strlen.o
> >   lib-y			+= strncmp.o
> >   lib-$(CONFIG_MMU)	+= uaccess.o
> >   lib-$(CONFIG_64BIT)	+= tishift.o
> > +lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
> >   obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
> > diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> > new file mode 100644
> > index 000000000000..5b851e727f7c
> > --- /dev/null
> > +++ b/arch/riscv/lib/clear_page.S
> > @@ -0,0 +1,71 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2023 Ventana Micro Systems Inc.
> > + */
> > +
> > +#include <linux/linkage.h>
> > +#include <asm/asm.h>
> > +#include <asm/alternative-macros.h>
> > +#include <asm/hwcap.h>
> > +#include <asm/insn-def.h>
> > +#include <asm/page.h>
> > +
> > +#define CBOZ_ALT(order, old, new)	\
> > +	ALTERNATIVE(old, new, order, RISCV_ISA_EXT_ZICBOZ, CONFIG_RISCV_ISA_ZICBOZ)
> 
> I thought this was meant to be a CPUFEATURE_ZICBOZ thing for the
> alternatives?
> 
> I may also be missing something, but when backporting this to 5.19
> to test it on our system the "order" argument is in fact the vendor-id
> so this doesn't work as the alternatives don't get patched in at-all.

If I understood your follow-up message correctly, then you've already
determined that the 5.19 base needs more patches for this to be applied,
and it's now resolved.

> 
> > +
> > +/* void clear_page(void *page) */
> > +ENTRY(__clear_page)
> > +WEAK(clear_page)
> > +	li	a2, PAGE_SIZE
> > +
> > +	/*
> > +	 * If Zicboz isn't present, or somehow has a block
> > +	 * size larger than 4K, then fallback to memset.
> > +	 */
> > +	CBOZ_ALT(12, "j .Lno_zicboz", "nop")
> 
> I can't see how the CBOZ_ALT is checking for the CBOZ block
> size being bigger than 4k... I guess we should have also
> tested the block size is an exact multiple of page size?

I think you've resolved this as well with more patches in your backport.
But just to follow-up here, both checks, >= size and power-of-two, are
done elsewhere by other patches.

> 
> It would also be better if we just didn't enable it and printed
> an warn when we initialise and then never advertise the feature
> in the first place?

I'm not sure I understand this suggestion. We won't advertise the
feature when it isn't present, but if we compile a kernel that supports
it, then we need to have a fallback for when it isn't present. That's
what this does. It shouldn't warn, as it's not an error to boot a
zicboz capable kernel on a platform that doesn't have zicboz.

> 
> > +
> > +	lw	a1, riscv_cboz_block_size
> > +	add	a2, a0, a2
> > +.Lzero_loop:
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBOZ_ALT(11, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBOZ_ALT(10, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBOZ_ALT(9, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
> 
> I'm also wondering why we are using CBOZ_ALT past the first
> check. I don't see why it shouldn't just be a loop with a siz
> check like:
> 
> Lzero_loop:
> 	CBO_zero(a0)
> 	add	a0, a0, a1
> 	blge	a0, a2, .Lzero_done
> 	....
> 

Because then we wouldn't be implementing an unrolled loop :-)

> 
> If you wanted to do multiple CBO_zero(a0) then maybe testing
> and branching would be easier to allow a certain amount of
> loop unrolling.

I want to eliminate as many branches as possible. Alternatives
give me the ability to do that.

> 
> 
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBOZ_ALT(8, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	CBO_zero(a0)
> > +	add	a0, a0, a1
> > +	bltu	a0, a2, .Lzero_loop
> > +	ret
> > +.Lno_zicboz:
> > +	li	a1, 0
> > +	tail	__memset
> > +END(__clear_page)
> 
> Whilst this seems to work, I am not sure why and it probably wants
> more testing.

More testing is always a good idea, but I do know how it supposed to
work :-) Maybe I should add some more comments to make it more clear?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
