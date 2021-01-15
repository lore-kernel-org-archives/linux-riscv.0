Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1796C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 09:39:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CE0522583
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 09:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CE0522583
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0t6seoHnbaToCsDzEfyRDULaJUP59PmuX663IJDhK+8=; b=F64KWgd1a/eg+g1qwWLkB7ij1
	HDazFtmgWs87mcbz6RCMLpugcVqKppGq+mJi3049UyE9zAD7rbosqqisC30fYebUFWhuT3QOxe1Wl
	0N5pHrEdRPRQps+1TaDP4FICtg4WDluAsxYT60dIkl7dFTTxS32rEqADP8G+kGQOWEolvorhLavFJ
	/xVy/XuJL+v+lLMP9Mu6HFRHBKzcGFBfCMOheFIpIFzkmHOprPWeNkAdFkKGLrpoDToc8pk+BIq30
	7vfvpnCdia8fofPzGUmrF9DfG5f8YuZw98vZp5O4JbpM2Ns9YM8tuL7F2vLvcquNd7qaUOUggATtE
	icRacNsmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0LZz-0004vd-N9; Fri, 15 Jan 2021 09:39:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0LZx-0004ug-R6
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 09:39:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id c124so6729048wma.5
 for <linux-riscv@lists.infradead.org>; Fri, 15 Jan 2021 01:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imaj/ctA3L/wlWp3n7QdUSQrNtHtAb2R0yMsutlcFPY=;
 b=cgNHpF2O+P66n9VszplNB6gDRihOfYqmDe4a9OIAshp+cU/z6aXgBreHhneSyDALZB
 BFYGYyGUabYUiTlTHxRBvbTeYEGj5y+kFZ5f8osmjYQjsw8koD7JA2Krcm+uU5ZdCOXL
 6UPcAz0nGGLXfXm0bGER9yAs+cwACT/tfr1gxEPjNxsGj6M1OHAAKFSlXDLO/i73v669
 z9Iy84NcAxp0HiERnGCV2OdGBbHfRI2cyESBg8jBGFPVcrJtjpKUD8n2PBChgYLQ4+N+
 GmZdCzUZXwIvOg9O3aik1NfifD3b9uFRIEsjXiDJuW6HQpBfj2Sw6TVSc22OTr5CQlO6
 PHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imaj/ctA3L/wlWp3n7QdUSQrNtHtAb2R0yMsutlcFPY=;
 b=h0E7J4ptdtQqp0oHLJGnRwYfq34z57So6QTfYlvWM2owi5XMiTFwdpyvrVBmYOU27z
 jyWhG3NyYBUC8Ssi4NPiZNI5Xflg1sPhznxfRo2GbC93Rh0vIijn95jO5ALUucLqLSxA
 4mseqSPlcL+7Mo/9NslTZu+9+SlJkP7g5rpi3VUs5T9a8+Zm9PIpaB+Z5UjTe/JCZJlC
 K/b8Dg4XpHn0gRyn7Ea+UC1vkpG01+qg8ALakBJNiGu2egiT4riSQaz2uFXxrnN29pKg
 TQkvpGDt5OPAkYl4hvRlP9+NfshsfZfa1CMiOTpZDXXv04H/56mV9kndjfgFNhK9HpSJ
 +rSg==
X-Gm-Message-State: AOAM532QItJ7e/jcQHoFvDp9Ua/9LajyPjcUJxpsj+wzi9BdtArPtEJi
 RkWcn4g72MOsG8RzN5PI2ZSHcadUTJpQKe3Wk3VYfQ==
X-Google-Smtp-Source: ABdhPJzdRWu/TfyZ/Gd97tSU+o2o0bt1wD1y05MueGCvzmmH7EPSDgX4zaroWKovIWX7b3kAAonKNBo6s9Su7SNi1RQ=
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr7918821wmf.134.1610703572400; 
 Fri, 15 Jan 2021 01:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20210111212031.2422-1-vitaly.wool@konsulko.com>
In-Reply-To: <20210111212031.2422-1-vitaly.wool@konsulko.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Jan 2021 15:09:21 +0530
Message-ID: <CAAhSdy04Nm+ET3Oepe5zRyVWiWpZzmfe=0BrdOEPUHGEOF86Vw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: simplify BUILTIN_DTB processing
To: Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_043937_989848_D5125DD2 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 12, 2021 at 2:51 AM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
> Provide __dtb_start as a parameter to setup_vm() in case
> CONFIG_BUILTIN_DTB is true, so we don't have to duplicate
> BUILTIN_DTB specific processing in MMU-enabled and MMU-disabled
> versions of setup_vm().
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
>  arch/riscv/kernel/head.S | 4 ++++
>  arch/riscv/mm/init.c     | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 16e9941900c4..f5a9bad86e58 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -260,7 +260,11 @@ clear_bss_done:
>
>         /* Initialize page tables and relocate to virtual addresses */
>         la sp, init_thread_union + THREAD_SIZE
> +#ifdef CONFIG_BUILTIN_DTB
> +       la a0, __dtb_start
> +#else
>         mv a0, s1
> +#endif /* CONFIG_BUILTIN_DTB */
>         call setup_vm
>  #ifdef CONFIG_MMU
>         la a0, early_pg_dir
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 5b17f8d22f91..45faad7c4291 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -615,11 +615,7 @@ static void __init setup_vm_final(void)
>  #else
>  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  {
> -#ifdef CONFIG_BUILTIN_DTB
> -       dtb_early_va = (void *) __dtb_start;
> -#else
>         dtb_early_va = (void *)dtb_pa;
> -#endif
>         dtb_early_pa = dtb_pa;
>  }
>
> --
> 2.20.1
>

We can avoid the early DTB mapping for MMU-enabled case when
BUILTIN_DTB is enabled (same as previous discussion). Otherwise
looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
