Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5546EC05027
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 01:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3uV3e518LPv1YhdncetrTFATus5m6TSa4xDrlYUzFc=; b=VkGrcIP0W791HQ
	JRw9skiRL61HHHLTnedv0MtpUYZRUMlJUavE5wWvR3/6OwFRAOyymHlFVEvcxpCzs0VsYCvhkeXWw
	+XxZouSkJcMOt9nuNHFjlfsSsVyWoNSX/PfvxB3vjdi/rZy/YfeU6LafYFFBf5a9foW5b/dGxBZX3
	dMM35NMTFhv8SrQkH8QqP5p5dh4eLMRoVsPPr3ArP5Ds7iPncATDFwtsHXqawV2+W2uif2LHYVsUi
	3T6Ph0Yu3oAoVQNQpvfPHbem96AGkUzvDfcpm/BUCEYBM9lNaPrY4cGNqPFYQYRR2OOExlTEfXAQP
	rzG7wZ/ox35O5rWmLBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRNVz-00CkFH-Q6; Mon, 13 Feb 2023 01:20:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRNVx-00CkEY-0S
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 01:20:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BD2A1B80DE7
	for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1FFC4339E
	for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676251213;
	bh=tMn82ZFgecAOke6UY7vDBe002Fq1P54OXLQ/Ss8d7MY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CDadx8BK8ujuBS8OdbaYHormLblZTzajxc6ecVyodekjAiSOn9wzAPbhv7W0ftm0E
	 Ny+fMgzm6OIEdqiV57zaenus91gh5yo2M9tOYHyB1AiJvxglpJQPnJhrg9tt7DSBwO
	 SwqbCHU3r21RwdGiuFxIM9deTa6SVNX1ZVzjdsbfTFRUnfSG8jeverlb1Lhy6oWcXZ
	 vu7oVe7j5hO175IEU5ZlPRcG4zT89AMwxT2cHjN9AcYyWZL34mwCQNsTaChLuJRJk1
	 MJcRi9udcXGK0YAKjaJUZCWmRlgkY5gIKpoO2/9QHh8ftEIXwAjqamHblf+KtCT8hS
	 KFlko8t19bxAA==
Received: by mail-ej1-f43.google.com with SMTP id rp23so28249734ejb.7
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 17:20:13 -0800 (PST)
X-Gm-Message-State: AO0yUKX8EFz6w27JL9s0iEhxlOnyyVo/OVhE9XVjOTSEoQkeyxiiRGDU
	8XmfqicAi4Yh+jYSU942t1f9XwUMJ35O55rfAwU=
X-Google-Smtp-Source: AK7set8qmyH8LWQvKpy+BVdOAVhp0PQFwgzl+tpl/5bU6AF/bFHYEeTvmB/c1xtbDyPVXioudecilbEWcgUeLo4MESc=
X-Received: by 2002:a17:907:9710:b0:8af:3ddd:c43c with SMTP id
 jg16-20020a170907971000b008af3dddc43cmr4554736ejc.1.1676251211491; Sun, 12
 Feb 2023 17:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20230212021534.59121-1-samuel@sholland.org> <20230212021534.59121-3-samuel@sholland.org>
In-Reply-To: <20230212021534.59121-3-samuel@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 13 Feb 2023 09:19:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSMAhweKKaztFz1G3Y_PUJwAvugRSHhKM69pA-VqnCs3g@mail.gmail.com>
Message-ID: <CAJF2gTSMAhweKKaztFz1G3Y_PUJwAvugRSHhKM69pA-VqnCs3g@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Fix Zbb alternative IDs
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Christoph Muellner <christoph.muellner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_172017_379109_E6306EEE 
X-CRM114-Status: GOOD (  16.38  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Sun, Feb 12, 2023 at 10:15 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Commit 4bf8860760d9 ("riscv: cpufeature: extend
> riscv_cpufeature_patch_func to all ISA extensions") switched ISA
> extension alternatives to use the RISCV_ISA_EXT_* macros instead of
> CPUFEATURE_*. This was mismerged when applied on top of the Zbb series,
> so the Zbb alternatives referenced the wrong errata ID values.
>
> Fixes: 9daca9a5b9ac ("Merge patch series "riscv: improve boot time isa extensions handling"")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>
>  arch/riscv/include/asm/errata_list.h | 5 -----
>  arch/riscv/lib/strcmp.S              | 2 +-
>  arch/riscv/lib/strlen.S              | 2 +-
>  arch/riscv/lib/strncmp.S             | 2 +-
>  4 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index e158439029ce..274c6f889602 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -23,11 +23,6 @@
>  #define        ERRATA_THEAD_NUMBER 3
>  #endif
>
> -#define        CPUFEATURE_SVPBMT 0
> -#define        CPUFEATURE_ZICBOM 1
> -#define        CPUFEATURE_ZBB 2
> -#define        CPUFEATURE_NUMBER 3
> -
>  #ifdef __ASSEMBLY__
>
>  #define ALT_INSN_FAULT(x)                                              \
> diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> index 8148b6418f61..986ab23fe787 100644
> --- a/arch/riscv/lib/strcmp.S
> +++ b/arch/riscv/lib/strcmp.S
> @@ -9,7 +9,7 @@
>  /* int strcmp(const char *cs, const char *ct) */
>  SYM_FUNC_START(strcmp)
>
> -       ALTERNATIVE("nop", "j strcmp_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
> +       ALTERNATIVE("nop", "j strcmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
>
>         /*
>          * Returns
> diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
> index 0f9dbf93301a..8345ceeee3f6 100644
> --- a/arch/riscv/lib/strlen.S
> +++ b/arch/riscv/lib/strlen.S
> @@ -9,7 +9,7 @@
>  /* int strlen(const char *s) */
>  SYM_FUNC_START(strlen)
>
> -       ALTERNATIVE("nop", "j strlen_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
> +       ALTERNATIVE("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
>
>         /*
>          * Returns
> diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> index 7940ddab2d48..ee49595075be 100644
> --- a/arch/riscv/lib/strncmp.S
> +++ b/arch/riscv/lib/strncmp.S
> @@ -9,7 +9,7 @@
>  /* int strncmp(const char *cs, const char *ct, size_t count) */
>  SYM_FUNC_START(strncmp)
>
> -       ALTERNATIVE("nop", "j strncmp_zbb", 0, CPUFEATURE_ZBB, CONFIG_RISCV_ISA_ZBB)
> +       ALTERNATIVE("nop", "j strncmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
>
>         /*
>          * Returns
> --
> 2.37.4
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
