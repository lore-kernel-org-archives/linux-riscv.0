Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55396C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 15:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIqQLhp6i6pgNl1ku29SIqJou/YgQKDIJlTWJ5zm4VM=; b=0sMXd6P9uH5wMX
	9RRtIXJ3Gz/9Q/4r9jDGa+51JhrgyQu2mJbviYuo52taqjeNmxOseGMMtc7F0st8xAQKOEcKqWc3G
	wF0LhJGKThj8uwZQeZYc8ROsi1tlqWs9Q3PIDIzplPBU0GQYLfn3izeoMYr31XdRQBIPJqOJZ8ejI
	vjLGs00iPRbnXRWeaVBBkYyTkiat7ghp/z/UB9+IUrbFz5CUsDWb9N6Pp+/oYhuFqZfYAnPxNSCTR
	7wyfDffSUxonyPAtN6pM1h91U7ON0PXWphi5tSBG9MT1sD//Sl6ct0qFw6IDlUaxuKPwPvxVOKOjP
	dSyGC1+Lgv4qs+hyQcaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DTD-004snD-AM; Mon, 05 Dec 2022 15:33:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DT4-004sfc-4U; Mon, 05 Dec 2022 15:33:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 982B061188;
	Mon,  5 Dec 2022 15:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60959C433C1;
	Mon,  5 Dec 2022 15:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670254397;
	bh=tzjiy+hdnVlsMz5YqQs/g6G7XYddLJKQ9a3cMaWwiFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VOkftQm6ttXId2lm/OQ3M+JktSYRlz5Vzk/dFm8KQZ5O3PboyWaCHUyOwoBvgcwrj
	 hD+2W3xjA3h7PjPGdfGSK3zvPPf/SGJO1DP5ySPuFzOhOCzp7vMfwFq9Y2nT1LzaPo
	 pGfvlsC1680wFlPSAwP/3WRPnvSVnstTd9Txn8rqhgHIV8MW5Zlp4bxTzsXLqH7QYd
	 VmFDq0ErClG5Gy0fTAdanHUpYZjLtvNLGU2+0hCvPkIM6l6fGI+671Kt/Sz8+GsLAi
	 yWBZUGYchO6n8MZg122SgPpjoWXFxUcrELnoT+1a4pGRaAu7Zv/jdhTqcbJp+ZkunE
	 Vy6mmaobe/xHg==
Date: Mon, 5 Dec 2022 23:23:18 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 10/13] riscv: alternative: patch alternatives in the
 vDSO
Message-ID: <Y44M5vHaqglLvL3c@xhacker>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-11-jszhang@kernel.org>
 <CAJF2gTR5VW0m=czqF2cQOcX5Vstow6EsuT044_E4WLo-NeVCOg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTR5VW0m=czqF2cQOcX5Vstow6EsuT044_E4WLo-NeVCOg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_073323_885169_18E483A5 
X-CRM114-Status: GOOD (  27.23  )
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

On Mon, Dec 05, 2022 at 09:56:37AM +0800, Guo Ren wrote:
> Are there any patches that depend on it? Any existing utilization? My
> first idea is to let __vdso_flush_icache use it, the standard
> implementation is so heavy for user space JIT scenario, maybe vendors
> could give a custom one.

Hi Guo,

the 11th patch of swtiching cpu_relax() to riscv_has_extension_likely()
depends on this patch, the gettimeofday implementation calls cpu_relax()
which may use ZIHINTPAUSE extension, so we need to patch vDSO.

Thanks

> 
> On Mon, Dec 5, 2022 at 1:57 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Make it possible to use alternatives in the vDSO, so that better
> > implementations can be used if possible.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/include/asm/vdso.h     |  4 ++++
> >  arch/riscv/kernel/alternative.c   | 25 +++++++++++++++++++++++++
> >  arch/riscv/kernel/vdso.c          |  5 -----
> >  arch/riscv/kernel/vdso/vdso.lds.S |  7 +++++++
> >  4 files changed, 36 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
> > index af981426fe0f..b6ff7473fb8a 100644
> > --- a/arch/riscv/include/asm/vdso.h
> > +++ b/arch/riscv/include/asm/vdso.h
> > @@ -28,8 +28,12 @@
> >  #define COMPAT_VDSO_SYMBOL(base, name)                                         \
> >         (void __user *)((unsigned long)(base) + compat__vdso_##name##_offset)
> >
> > +extern char compat_vdso_start[], compat_vdso_end[];
> > +
> >  #endif /* CONFIG_COMPAT */
> >
> > +extern char vdso_start[], vdso_end[];
> > +
> >  #endif /* !__ASSEMBLY__ */
> >
> >  #endif /* CONFIG_MMU */
> > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> > index 9d88375624b5..eaf7ddaba54c 100644
> > --- a/arch/riscv/kernel/alternative.c
> > +++ b/arch/riscv/kernel/alternative.c
> > @@ -11,7 +11,9 @@
> >  #include <linux/cpu.h>
> >  #include <linux/uaccess.h>
> >  #include <asm/alternative.h>
> > +#include <asm/module.h>
> >  #include <asm/sections.h>
> > +#include <asm/vdso.h>
> >  #include <asm/vendorid_list.h>
> >  #include <asm/sbi.h>
> >  #include <asm/csr.h>
> > @@ -187,6 +189,27 @@ static void __init_or_module _apply_alternatives(struct alt_entry *begin,
> >                                 stage);
> >  }
> >
> > +static void __init apply_vdso_alternatives(void)
> > +{
> > +       const struct elf64_hdr *hdr;
> > +       const struct elf64_shdr *shdr;
> > +       const struct elf64_shdr *alt;
> > +       struct alt_entry *begin, *end;
> > +
> > +       hdr = (struct elf64_hdr *)vdso_start;
> > +       shdr = (void *)hdr + hdr->e_shoff;
> > +       alt = find_section(hdr, shdr, ".alternative");
> > +       if (!alt)
> > +               return;
> > +
> > +       begin = (void *)hdr + alt->sh_offset,
> > +       end = (void *)hdr + alt->sh_offset + alt->sh_size,
> > +
> > +       _apply_alternatives((struct alt_entry *)begin,
> > +                           (struct alt_entry *)end,
> > +                           RISCV_ALTERNATIVES_BOOT);
> > +}
> > +
> >  void __init apply_boot_alternatives(void)
> >  {
> >         /* If called on non-boot cpu things could go wrong */
> > @@ -195,6 +218,8 @@ void __init apply_boot_alternatives(void)
> >         _apply_alternatives((struct alt_entry *)__alt_start,
> >                             (struct alt_entry *)__alt_end,
> >                             RISCV_ALTERNATIVES_BOOT);
> > +
> > +       apply_vdso_alternatives();
> >  }
> >
> >  /*
> > diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> > index 123d05255fcf..1f47bc6566cf 100644
> > --- a/arch/riscv/kernel/vdso.c
> > +++ b/arch/riscv/kernel/vdso.c
> > @@ -22,11 +22,6 @@ struct vdso_data {
> >  };
> >  #endif
> >
> > -extern char vdso_start[], vdso_end[];
> > -#ifdef CONFIG_COMPAT
> > -extern char compat_vdso_start[], compat_vdso_end[];
> > -#endif
> > -
> >  enum vvar_pages {
> >         VVAR_DATA_PAGE_OFFSET,
> >         VVAR_TIMENS_PAGE_OFFSET,
> > diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> > index 150b1a572e61..4a0606633290 100644
> > --- a/arch/riscv/kernel/vdso/vdso.lds.S
> > +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> > @@ -40,6 +40,13 @@ SECTIONS
> >         . = 0x800;
> >         .text           : { *(.text .text.*) }          :text
> >
> > +       . = ALIGN(4);
> > +       .alternative : {
> > +               __alt_start = .;
> > +               *(.alternative)
> > +               __alt_end = .;
> > +       }
> > +
> >         .data           : {
> >                 *(.got.plt) *(.got)
> >                 *(.data .data.* .gnu.linkonce.d.*)
> > --
> > 2.37.2
> >
> 
> 
> -- 
> Best Regards
>  Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
