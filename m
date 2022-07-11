Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B463DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 17:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWhyRA8IOjSAcK5mkJLm8v3uOJnWQqUxRvrhQIO7X/4=; b=ZUDp8vgN3JNF6a
	jwASYXHRG5pfoXu2bIzh+TlMuFw3VMkj4Q2Dvjf+PZbknQ8NY5NXKaYKxORq5ue3KX3UzY6NonREN
	m1E0tldYX9A6lB+koW/LxvT+bkatFHejSo2rO/BPNgGdyJ1WgoV54Y/QYgHVHKfN3Dnh9Pl2Et7om
	KUHYYbHcEdz3dRxu7ZQyP3dw79ORMIqelK4XCtDWC8ZdusJBFicXFPvy45raL2Z0YnIxh1N090N3M
	CjIPCs0nxjuF4MCetQAP0rdZVHiv3ZqvecAr6fbdHGys5twaikM9jm+RiGX7uyefi3+P027agJ9M8
	rOVoNlJkyp/kP0GzcOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxMx-003XAt-Bf; Mon, 11 Jul 2022 17:38:51 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxMu-003X6Z-MW
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 17:38:50 +0000
Received: by mail-lj1-x234.google.com with SMTP id a10so5244031ljj.5
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 10:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zQj9SC9LzzvOt29hChR7g7E0Lc7GX6Hy0KSuYXInGDE=;
        b=f1TD0jljg/IWNfS09CDUXQ2i7XWpMyLwkZYu7JGV2gzXGa2UVnksceghpfLAy/UQC6
         AJ114v+NuGgFr7knklFFpz6ynue3oYETOfOm5R//r6OUBA7BELjDo5Wk3tlBs1wDb689
         O923kaNhZUnHvdp476b/5NIklZmtWSPbnYd5u8VIpENd0nwqvMtIwuwospT0OuzRRfFD
         yM6dWj90pCYNGJRTDqlWUJo/Nu7KHUnfX0Dzn2Dj1MmFEQJwptkhESV4I+WFwN4PRbMS
         wIrYu07ulUmuOQggE46pqVEpy2So5a9Vp6pUcKuZ+2W31x+Drf9hUABiGkzYO5DfaZ+C
         dJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zQj9SC9LzzvOt29hChR7g7E0Lc7GX6Hy0KSuYXInGDE=;
        b=5nwe6dAa9PMdsW3KQLCqExgbXb4FsO5/rog8fr4IrKVB9Lum8H5AAbPCKRejdGRPnf
         j4z8p8gNlDJRQW6Qpiq5jY6Ag5peTx71sOdus0Gu5yxaRfqpwpRxfuvMgZhLia16Ym6G
         Sv+M6oPj20npmDv/a2DTq+KDlQVq/Swd2bJc5FoqDPQSHRNAW7bq1FFBBDX+deO8cvM3
         xhzEAEmGZ+oFu2AitCRSA4KQXLFbGeAJuyhSa4uvy2LAD06AtV0fXRXfxPAao3ZL64rf
         VkrjMHI6KpYWT0gdF0VWeFvWRtHQBBCxui9V6DfNCr9IgXHKjo5WkpqtiN8ywSW1UQrv
         5CUA==
X-Gm-Message-State: AJIora91oL5eGG3azMdOaz8FzQ3usmkoh+xOrnbJztMbOp6em7mJ9ZOG
	gleV53RXqTB2lZULCCHa5PP3hqYH64zp5B5NG8atDQ==
X-Google-Smtp-Source: AGRyM1u0DMzzoMdO3sxBWXuOKwxHG4cPlzL7241+1VuSMH0ejamZIb6JycU8Bwpc+nLYSgUU3vNiSrLtM6MHva0BM8c=
X-Received: by 2002:a05:651c:2104:b0:25b:f4ed:db93 with SMTP id
 a4-20020a05651c210400b0025bf4eddb93mr10900111ljq.295.1657561118922; Mon, 11
 Jul 2022 10:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220710071117.446112-1-maskray@google.com>
In-Reply-To: <20220710071117.446112-1-maskray@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Jul 2022 10:38:25 -0700
Message-ID: <CAKwvOd=yTio6SDG-dEEB1W3nQdZZNk67x_DsiedmC5t95P8XNg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Pass -mno-relax only on lld < 15.0.0
To: Fangrui Song <maskray@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Khem Raj <raj.khem@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_103848_768263_17B00FE8 
X-CRM114-Status: GOOD (  13.57  )
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

On Sun, Jul 10, 2022 at 12:11 AM Fangrui Song <maskray@google.com> wrote:
>
> lld since
> https://github.com/llvm/llvm-project/commit/6611d58f5bbcbec77262d392e2923e1d680f6985
> (milestone: 15.0.0) has implemented some RISC-V linker relaxation.
> -mno-relax is no longer needed in KBUILD_CFLAGS/KBUILD_AFLAGS to
> suppress R_RISCV_ALIGN which older lld can not handle:
>
> ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax but the .o is already compiled with -mno-relax
>
> Signed-off-by: Fangrui Song <maskray@google.com>

Thanks for implementing relaxation in LLD for RISC-V!

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 34cf8a598617..7e4ceb2a0981 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -37,6 +37,7 @@ else
>  endif
>
>  ifeq ($(CONFIG_LD_IS_LLD),y)
> +ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
>         KBUILD_CFLAGS += -mno-relax
>         KBUILD_AFLAGS += -mno-relax
>  ifndef CONFIG_AS_IS_LLVM
> @@ -44,6 +45,7 @@ ifndef CONFIG_AS_IS_LLVM
>         KBUILD_AFLAGS += -Wa,-mno-relax
>  endif
>  endif
> +endif
>
>  # ISA string setting
>  riscv-march-$(CONFIG_ARCH_RV32I)       := rv32ima
> --
> 2.37.0.144.g8ac04bfd2-goog
>
>


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
