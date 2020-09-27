Return-Path: <SRS0=E1a4=DE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB6EC4727F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 05:47:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD82207BC
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2020 05:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="23+9r0vu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="GbYBSAUk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AD82207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=lOiOITj7+MxZGbxNI1Zr9BkFkGvnHA/hYf5sSxtlx7A=; b=23+9r0vusYhEN4Q98kupiCt4j
	XA/3ow9LAK9Z+R8Q8RwGpBf/3aRv6bLGOj2fdz9JryMuC5ZSpwyRpXMSqkXGS4M6/KISg4ZUn0fqA
	FkpA7WWorDo7zy4fm5aY7kV5XRCRAVVMkLrHjfbCRqxxUy/T57gfhb31DZ+s+o5uZJtLV8svmOhEG
	91q+JHXZSNvM5kyHwG2ZQcVbJlkf8O97/mwTtFA8OO9fBOnDP5h8/LidFOAlwY8hZ3RgvejwZ5xct
	XO1tIYrd56qoyV06FwiaJxWGebkpLzf1Y0wTWF+aUVo2bgl6Zz4EB0I6yeyJpuY9GW/Z7qXdlTxO9
	8bq+nYSpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMPWM-0000p2-Rl; Sun, 27 Sep 2020 05:46:50 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMPWK-0000oU-3F
 for linux-riscv@lists.infradead.org; Sun, 27 Sep 2020 05:46:48 +0000
Received: by mail-pj1-x1041.google.com with SMTP id t7so1716076pjd.3
 for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2020 22:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TsLq3yTVB4OQmzkkPV+zv+aZeH19E2zG8aMl0EQ8nnk=;
 b=GbYBSAUkCQPmIP+raGcf3eamtVRS+l/iONJ306qd9Rpah5NT8Eb7Ywb6Nspazt+AG7
 0xOoE5g/cC37+bkkGe6sigT961/go64/C6I3N9jdscACO3d4YF/n+YdAdZT168FlRsh9
 a/cucMSR5wOMJwdZUJG9+SMlr5B5+7/GSHdKznfSQn9/OsEAAilY0XoWbkmaJK4gQykb
 OUqNK2D5T464acjJwO9+BARcGrZFY3P6e8QZU6fbCofLwhPiVv/SdgNFtyerhWaNZfsB
 /UhPK+omsU6phLX3TW7Lht7YLChlGaaqzC5EZuMeBCMQT6ZBSwBr6R5ZzgipQ/M8BCBv
 wEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TsLq3yTVB4OQmzkkPV+zv+aZeH19E2zG8aMl0EQ8nnk=;
 b=VfWasYx3CbRX7mlUuVJgW2OnAZPfVAtfJA3lIihtkz1qMnF2/2/XXbmqUR26kQ00lc
 osCsVWqOMNKKFK/fYQYJOffLNeB62Pf9XQC4vQ8Ta1S69g3W2jqXC38ltrW7V/6ENDey
 IBGIOWm44EWqXwrJbcKnUt69La6rRNakRBk1DBGqfPDWrbw3prIXobfXr7JBWsTMFAW5
 KviHLjoVl6w08EJdhli1r5mZRhBOCFe9GbsCo1/u7a5OKQJAvgDutOBvTvhOhSp7ik8D
 U8YWCOn1gnfJTu953oAlx0fvbIQ+zJ3qvlpU2rQJCMN4NCrbUVLywHFtBP95dhPnRSi8
 fGXw==
X-Gm-Message-State: AOAM530JT1WhaEa7hWhqSkWsagxv61eIIZLWO7MVz8f9t0rA2LHI9pNJ
 6sl/uXHUV3zQXEnyervW36XSWg==
X-Google-Smtp-Source: ABdhPJzRALxpjL/rjQnlHmfq5XBuWLKuRUeHGoir55DNUAAAMOJbV09wfugauxbLTs0LYJbMVeRM+A==
X-Received: by 2002:a17:90a:ebd7:: with SMTP id
 cf23mr4339711pjb.126.1601185605121; 
 Sat, 26 Sep 2020 22:46:45 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k3sm7389313pfp.41.2020.09.26.22.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 22:46:44 -0700 (PDT)
Date: Sat, 26 Sep 2020 22:46:44 -0700 (PDT)
X-Google-Original-Date: Sat, 26 Sep 2020 22:46:31 PDT (-0700)
Subject: Re: [PATCH v3] RISC-V: Check clint_time_val before use
In-Reply-To: <20200927053916.879116-1-anup.patel@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-0fd4eb79-05f0-49cd-8527-e5c74c65b7b1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_014648_202624_B2903494 
X-CRM114-Status: GOOD (  27.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, aou@eecs.berkeley.edu,
 anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 26 Sep 2020 22:39:16 PDT (-0700), Anup Patel wrote:
> The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
> because clint_time_val is used even before CLINT driver is probed
> at following places:
> 1. rand_initialize() calls get_cycles() which in-turn uses
>    clint_time_val
> 2. boot_init_stack_canary() calls get_cycles() which in-turn
>    uses clint_time_val
>
> The issue#1 (above) is fixed by providing custom random_get_entropy()
> for RISC-V NoMMU kernel. For issue#2 (above), we remove dependency of
> boot_init_stack_canary() on get_cycles() and this is aligned with the
> boot_init_stack_canary() implementations of ARM, ARM64 and MIPS kernel.
>
> Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
> for M-mode systems")
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
> Changes since v2:
>  - Take different approach and provide custom random_get_entropy() for
>    RISC-V NoMMU kernel
>  - Remove dependency of boot_init_stack_canary() on get_cycles()
>  - Hopefully we don't require to set clint_time_val = NULL in CLINT
>    driver with a different approach to fix.
> Changes since v1:
>  - Explicitly initialize clint_time_val to NULL in CLINT driver to
>    avoid hang on Kendryte K210
> ---
>  arch/riscv/include/asm/stackprotector.h |  4 ----
>  arch/riscv/include/asm/timex.h          | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
> index d95f7b2a7f37..5962f8891f06 100644
> --- a/arch/riscv/include/asm/stackprotector.h
> +++ b/arch/riscv/include/asm/stackprotector.h
> @@ -5,7 +5,6 @@
>
>  #include <linux/random.h>
>  #include <linux/version.h>
> -#include <asm/timex.h>
>
>  extern unsigned long __stack_chk_guard;
>
> @@ -18,12 +17,9 @@ extern unsigned long __stack_chk_guard;
>  static __always_inline void boot_init_stack_canary(void)
>  {
>  	unsigned long canary;
> -	unsigned long tsc;
>
>  	/* Try to get a semi random initial value. */
>  	get_random_bytes(&canary, sizeof(canary));
> -	tsc = get_cycles();
> -	canary += tsc + (tsc << BITS_PER_LONG/2);
>  	canary ^= LINUX_VERSION_CODE;
>  	canary &= CANARY_MASK;
>
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index 7f659dda0032..ab104905d4db 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -33,6 +33,19 @@ static inline u32 get_cycles_hi(void)
>  #define get_cycles_hi get_cycles_hi
>  #endif /* CONFIG_64BIT */
>
> +/*
> + * Much like MIPS, we may not have a viable counter to use at an early point
> + * in the boot process. Unfortunately we don't have a fallback, so instead
> + * we just return 0.
> + */
> +static inline unsigned long random_get_entropy(void)
> +{
> +	if (unlikely(clint_time_val == NULL))
> +		return 0;
> +	return get_cycles();
> +}
> +#define random_get_entropy()	random_get_entropy()
> +
>  #else /* CONFIG_RISCV_M_MODE */
>
>  static inline cycles_t get_cycles(void)

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

I'm going to wait for Damien to chime in about the NULL initialization boot
failure, though, as I'm a bit worried something else was going on.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
