Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2D6C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbcaID3xIPRunXzDYWlvo31VC8DdA6QgbDumLNOihdo=; b=DsKWIZZcxFoGXO
	0u5BLR1HudpuDbrsgoHRrR7+Al24kXIZbR4Id+XG1aoJvqn0ILsLi7Uoey4XRsudayuy62Tq7xICQ
	dUo0/oUAnGrKscdG1uVo73LjKOCHuShnEaa+DKcnww4Sw8YJIBP7D8wnqo1LS2COpTtBFr5qrpT5s
	8oVbalnaEOSj6rx0vsqnP6Nv6JvCXHn/gunK8e9N+I7X+3w61tq8ISwsZ34b3dHIoNWmjchdGm2hZ
	7XuTDviGAV0wnch7g5KybNayX1esv6rXoyOLzwwyaxK5Abe3uSRCmV9v/BZ0AJnfpqrY+7OEQZgJB
	kuSpgFh/+e2LvcVu6pXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0aR-008Hga-Uh; Wed, 04 Jan 2023 10:01:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzRz-007lyF-1E
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:48:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1271EB815B8
	for <linux-riscv@lists.infradead.org>; Wed,  4 Jan 2023 08:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9778C43398
	for <linux-riscv@lists.infradead.org>; Wed,  4 Jan 2023 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672822119;
	bh=x+pZHCEf+gCp8ljkUtapLHlz3SrGepACquhwLvCQrwM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ct5OOGgVF7oZbygyWdBF0mCA6m0X8EGwV1yzkl4ttxcHSmohW8ZCz+s30CxC5lNPz
	 uTAViqApOSwR9nyd2iPQtA/exdh6s//FAvaR9MKnGGxMiIZaYtqTZO/s2Jqn4Zl8Fj
	 6CAkJLaImV0xxUJe0Vj/899X/TMO73rViHUUZJamPGZI5psmX44GDrRC7FaOXCFa5T
	 HXpnLWgTZA+qbxVzEdvyC1n4MIYhLFuEbLLXdcgjlAs0J84OwzS7IIaEbTCbaYJbKv
	 IOr/f4PQ+qlixJyHur4O3ztApmPW3+Fh4pBCQtdEC3zvMCol04gguEG+sEu0b0vwgz
	 OgZv5rY2CQTyg==
Received: by mail-ej1-f53.google.com with SMTP id jo4so80955974ejb.7
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 00:48:39 -0800 (PST)
X-Gm-Message-State: AFqh2krP+HSkIj4QWPFcGeqrMd2FDghT290F65O13C9JE2NlGe7bYmp2
	5d4H7JYh//XqwoZjbgfS58WwREnFQUb7FtZIFQ0=
X-Google-Smtp-Source: AMrXdXvxQagdXyWyFLKDic95BL/Fg668DmvP+3KepetHctDyaL+FsaSKkrQVJ+86bkwalde7/J5f4RxpIxHTDH7N/EU=
X-Received: by 2002:a17:906:33d4:b0:7c0:f7af:7c5e with SMTP id
 w20-20020a17090633d400b007c0f7af7c5emr3146027eja.406.1672822117921; Wed, 04
 Jan 2023 00:48:37 -0800 (PST)
MIME-Version: 1.0
References: <20230104074146.578485-1-uwu@icenowy.me> <20230104074146.578485-2-uwu@icenowy.me>
In-Reply-To: <20230104074146.578485-2-uwu@icenowy.me>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 4 Jan 2023 16:48:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQp1bOp9kfoOkbvNnSXQhzrCpG3rn8C+LPPoJtMCCDOdA@mail.gmail.com>
Message-ID: <CAJF2gTQp1bOp9kfoOkbvNnSXQhzrCpG3rn8C+LPPoJtMCCDOdA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] riscv: errata: cmo: add CMO macro variant with
 both VA and PA
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Samuel Holland <samuel@sholland.org>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_004843_513753_C5EF506E 
X-CRM114-Status: GOOD (  19.14  )
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

Thx for the patch! It's nice.

Reviewed-by: Guo Ren <guoren@kernel.org>

On Wed, Jan 4, 2023 at 3:42 PM Icenowy Zheng <uwu@icenowy.me> wrote:
>
> The standardized Zicbom extension supports only VA, however there's some
> vendor extensions (e.g. XtheadCmo) that can handle cache management
> operations on PA directly, bypassing the TLB lookup.
>
> Add a CMO alternatives macro variant that come with both VA and PA
> supplied, and the code can be patched to use either the VA or the PA at
> runtime. In this case the codepath is now patched to use VA for Zicbom
> and PA for XtheadCmo.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  arch/riscv/include/asm/errata_list.h | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 46adc1c9428f..bf80dd58145e 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -118,6 +118,9 @@ asm volatile(ALTERNATIVE(                                           \
>  #define THEAD_clean_A0 ".long 0x0255000b"
>  #define THEAD_flush_A0 ".long 0x0275000b"
>  #define THEAD_SYNC_S   ".long 0x0190000b"
> +#define THEAD_inval_PA_A0      ".long 0x02a5000b"
> +#define THEAD_clean_PA_A0      ".long 0x0295000b"
> +#define THEAD_flush_PA_A0      ".long 0x02b5000b"
>
>  #define ALT_CMO_OP(_op, _start, _size, _cachesize)                     \
>  asm volatile(ALTERNATIVE_2(                                            \
> @@ -144,6 +147,33 @@ asm volatile(ALTERNATIVE_2(                                                \
>             "r"((unsigned long)(_start) + (_size))                      \
>         : "a0")
>
> +#define ALT_CMO_OP_VPA(_op, _vaddr, _paddr, _size, _cachesize)         \
> +asm volatile(ALTERNATIVE_2(                                            \
> +       __nops(6),                                                      \
> +       "mv a0, %1\n\t"                                                 \
> +       "j 2f\n\t"                                                      \
> +       "3:\n\t"                                                        \
> +       "cbo." __stringify(_op) " (a0)\n\t"                             \
> +       "add a0, a0, %0\n\t"                                            \
> +       "2:\n\t"                                                        \
> +       "bltu a0, %2, 3b\n\t"                                           \
> +       "nop", 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,           \
> +       "mv a0, %3\n\t"                                                 \
> +       "j 2f\n\t"                                                      \
> +       "3:\n\t"                                                        \
> +       THEAD_##_op##_PA_A0 "\n\t"                                      \
> +       "add a0, a0, %0\n\t"                                            \
> +       "2:\n\t"                                                        \
> +       "bltu a0, %4, 3b\n\t"                                           \
> +       THEAD_SYNC_S, THEAD_VENDOR_ID,                                  \
> +                       ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)      \
> +       : : "r"(_cachesize),                                            \
> +           "r"((unsigned long)(_vaddr) & ~((_cachesize) - 1UL)),       \
> +           "r"((unsigned long)(_vaddr) + (_size)),                     \
> +           "r"((unsigned long)(_paddr) & ~((_cachesize) - 1UL)),       \
> +           "r"((unsigned long)(_paddr) + (_size))                      \
> +       : "a0")
> +
>  #define THEAD_C9XX_RV_IRQ_PMU                  17
>  #define THEAD_C9XX_CSR_SCOUNTEROF              0x5c5
>
> --
> 2.38.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
