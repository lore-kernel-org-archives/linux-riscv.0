Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56F4C05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORI2ZRklUQnQXqn+mqp4tM9QCSvQ4F7wekHWoKAtkeM=; b=NHtAp1q2AsqZlB
	fjievwOXiu6AoEymiRZ3/nVuUrEq2XmVREnsdFpCqeDN7PhkUIPf5OOgaJg3OucLwStceq5Mo1iWB
	LFUg/s5ud6kTXd58o+OGxH6HjUphaRCR+U6i/75qELANH++kj3/RXlP/OOm22qU9L2M9FWf/rmhoc
	QzqkbF/gkK/9kznvybBg4eDoYJj7UaLM3RN1tyDrwhgZ2GyMx4cpXWXXM73gdrDUyx+uf861GBxCw
	dWXqi7QpjPaFPkCD6SBX03TtYzpn02vpgqMkPd4Zxgq4fP5m5ZY3DMZzjyG0FZI+kSUgUhxf9MIQI
	ASdOSzwLT1oSwL3DXSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKwOH-009oxe-Eh; Thu, 26 Jan 2023 07:09:45 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKwOD-009ovN-P4
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 07:09:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id mg12so2688991ejc.5
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 23:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7xO4nzooOx9Fnx6HScH7rLurtje8d12bXHWmpEv5B74=;
        b=gadZBxYJO1f5wW9BHOnzxkgvjwqHRKsrgOiwY/lVQ0gvSkp3vez3CfMDhmrZBj0Lnf
         ApIU7RzjhdyD0nEtrlKpMVRpY4guv1hDTbG5t0n9pOkQF46mnKthnCntYbSg95lxY1jI
         OLVogMxma5vLCly8q+wf23YJuxZEVpEWUa4+YwROhMDpS1xblGyh6j3lYTgr29CEqzXf
         dYbSDlrZQ3Udhf78smFXWuPhiWBf5Syeqey6MtwYxSME53NemkdQ1tIdMtUc2daHt6C8
         2aCXnFvsDTXExi+qISr73vwCrKaxXXVe2uhfD3QZSWXPypY8AqZVYN4lQM0S7VFc8oiY
         JsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xO4nzooOx9Fnx6HScH7rLurtje8d12bXHWmpEv5B74=;
        b=Jf9OXhAePDYWncebxWD/uVf4li6ARoEjmjWHhGAkCDu/3dtwq8JYbktGmj9c/qFoJE
         Xp1FVFnJx/haRUqA6h7tCGIUmOPLCJyQbq/OeWdwHbdJfDWqond9qQftJBQoHXB6ZDPZ
         fYePaY0iHS+zpDJ2quBe8w4A3BqJAWVuveYe+PxLUveG0Ea6ShibuvKNj8yFWjRpJcUR
         YGMmLY4hSxhUOK8GFhBVpWLonhCfkatBmGRLwqMrp/GAXhJQTlCQ6UuMuXRITiS56EX0
         ngfTEQKKv9/Gx8FzGHCxwj9R+odILOQxnbuuOkHiwQzUqL0ou6pyP/nEt6Kn9q+F7deh
         vOew==
X-Gm-Message-State: AO0yUKXk8EApIlqA+pO65122FxsHJIts5djpkoNP6hZ+WoPr/f5iAB7M
	2twSIgx2AJoNStfEIjueOhwCKw==
X-Google-Smtp-Source: AK7set8UO5ZMp8niAX/8UCCEoMCN0FdlHBc2NmZLARlIC9nX5SOBUFOEP5ISGyT650Bud2+n6mftyQ==
X-Received: by 2002:a17:907:3f28:b0:878:6643:974a with SMTP id hq40-20020a1709073f2800b008786643974amr1106863ejc.35.1674716972259;
        Wed, 25 Jan 2023 23:09:32 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906d11000b0085ca279966esm155442ejz.119.2023.01.25.23.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:09:31 -0800 (PST)
Date: Thu, 26 Jan 2023 08:09:30 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 09/13] riscv: switch to relative alternative entries
Message-ID: <20230126070930.wvqsrrcmcuq5vv2x@orel>
References: <20230115154953.831-1-jszhang@kernel.org>
 <20230115154953.831-10-jszhang@kernel.org>
 <20230120183418.ngdppppvwzysqtcr@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230120183418.ngdppppvwzysqtcr@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_230941_884506_6691060F 
X-CRM114-Status: GOOD (  24.72  )
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

On Fri, Jan 20, 2023 at 07:34:18PM +0100, Andrew Jones wrote:
> On Sun, Jan 15, 2023 at 11:49:49PM +0800, Jisheng Zhang wrote:
> ...
> >  #define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)		\
> > -	RISCV_PTR " " oldptr "\n"					\
> > -	RISCV_PTR " " newptr "\n"					\
> > -	REG_ASM " " vendor_id "\n"					\
> > -	REG_ASM " " newlen "\n"						\
> > -	".word " errata_id "\n"
> > +	".4byte	((" oldptr ") - .) \n"					\
> > +	".4byte	((" newptr ") - .) \n"					\
> > +	".2byte	" vendor_id "\n"					\
> > +	".2byte " newlen "\n"						\
> > +	".4byte	" errata_id "\n"
> >
> 
> Hi Jisheng,
> 
> This patch breaks loading the KVM module for me. I got "kvm: Unknown
> relocation type 34". My guess is that these 2 byte fields are inspiring
> the compiler to emit 16-bit relocation types. The patch below fixes
> things for me. If you agree with fixing it this way, rather than
> changing something in alternatives, like not using 2 byte fields,
> then please pick the below patch up in your series.

Hi Jisheng,

I'm poking again on this as I see this series is now working its way
to be merged into for-next. I'd rather avoid the bisection breakage
which will be present if we fix this issue afterwards by having a
v5 merged which addresses the issue in the correct patch order.

Thanks,
drew

> 
> From 4d203697aa745a0cd3a9217d547a9fb7fa2a87c7 Mon Sep 17 00:00:00 2001
> From: Andrew Jones <ajones@ventanamicro.com>
> Date: Fri, 20 Jan 2023 19:05:44 +0100
> Subject: [PATCH] riscv: module: Add ADD16 and SUB16 rela types
> Content-type: text/plain
> 
> To prepare for 16-bit relocation types to be emitted in alternatives
> add support for ADD16 and SUB16.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/module.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 76f4b9c2ec5b..7c651d55fcbd 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -268,6 +268,13 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
>  	return -EINVAL;
>  }
>  
> +static int apply_r_riscv_add16_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u16 *)location += (u16)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> @@ -282,6 +289,13 @@ static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
>  	return 0;
>  }
>  
> +static int apply_r_riscv_sub16_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u16 *)location -= (u16)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> @@ -315,8 +329,10 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
>  	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
>  	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
>  	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
> +	[R_RISCV_ADD16]			= apply_r_riscv_add16_rela,
>  	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
>  	[R_RISCV_ADD64]			= apply_r_riscv_add64_rela,
> +	[R_RISCV_SUB16]			= apply_r_riscv_sub16_rela,
>  	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
>  	[R_RISCV_SUB64]			= apply_r_riscv_sub64_rela,
>  };
> -- 
> 2.39.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
