Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B777C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 18:20:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0373613C0
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 18:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0373613C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wv0sGcz4NcWZdSSzmwsUyPsEwWyOCMyJdaYp57vYLn8=; b=gUpAvmPs37R3WyS6DPrsUd8tv
	Tzqz87BLtAHkft2bSOMwqtuDZn6TDpraygJ4ybWN5Sf1cPostQ+ZTXjFS7fuPp7BQYdD220IE1wzH
	xS3hE/R+s1CrGiO3LIifLGxQ8kDHpdSu4FslHjOyT0JTJX40PqgqvI0r3EjlPrDrRVKMjlOrIkVvt
	zhF73XKXkXUED47AtrQONJLQu9BT7yhIx9emCVsLRka04Cfm+gt2n7hlovYmIPkCAB3pseBn0x/ze
	ogRjz+47TwRe1UfHB4pfIu3TWQb503fRVQI8t5nanUgK4EcYbH8SdG0qgJL6/TmjcsOfZ4Uw7MPta
	/J6nwuIBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgAVR-00FPgs-FV; Mon, 10 May 2021 18:19:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgAVO-00FPgL-LL
 for linux-riscv@desiato.infradead.org; Mon, 10 May 2021 18:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uLEPdHE/lUDqSfzKgjlnQIQkgZHfxgrF+vujnKkyTIM=; b=eWxUUbZ56zShVU0Am5pf9TQLtm
 CuiCO0PNsMvNPph3PRcloMH0rP0B2QlwlUJR5mla6DK6NAgWmw+hzVbEU8T+i+TskH/Eo2NwGtFDc
 Vg1XHoQnEJUFe1MAG8l6jnv5gb1Rfv5okaBZq4ip+TOxhNxO76bCGX+dd9c/hP8q3Wj6D+o0NVT5w
 a1jYDxAVjxTr15SFiHrcRbYtfiAM/kGRcFwooENY86okJBlfSUSSw4Wwt7boLJOeFdxxL9eURd+su
 ECGiz9tTRglfjT/QYt/ASfodNOIkFUDkBld8/cAmER4V1dRg4Qh0aOejXSKjjiRl4/rU/WJLMG6jZ
 FKxxrt/A==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgAVL-0091wW-O1
 for linux-riscv@lists.infradead.org; Mon, 10 May 2021 18:19:45 +0000
Received: by mail-lf1-x135.google.com with SMTP id h4so24844374lfv.0
 for <linux-riscv@lists.infradead.org>; Mon, 10 May 2021 11:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uLEPdHE/lUDqSfzKgjlnQIQkgZHfxgrF+vujnKkyTIM=;
 b=cS3HdG8156DCaEKIJ+gTF1weCypb9gV1HaJjmr1Aqq0coGamkyOxKt3YpLZLmcRAOi
 zAKb2gl2KQnO+XP/itg7MwOmO/ebuGOZ044jSVLRZfBrIqC2t2jleOBLqT7xmc0Wc9B4
 C6CFtQrFxWqJ0cwLcve8MBErb+lO0oE+VQu4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uLEPdHE/lUDqSfzKgjlnQIQkgZHfxgrF+vujnKkyTIM=;
 b=MrSO2JiZG8n4M7vQlo66kfCNXFfy1DGtN0I4x0j84CHRldeILUO64aFH39FtEWh86b
 1EjH+ciK7WafWaaL53utRdcEdPRWCNqGvz7vtUEANaO40Vcc71zCr3lasF5fVRX6w8Rp
 8eax3sx4rFEw55qTQGGKAXJwoORBra+YLLDUcXdL+0IWOMUUojHpJydWUmWAy7yrnfbw
 tUsCqJtLjrO3ahk0Ex0xi7qFByorjTDByoen+JHs58+mriHDnozmft7i1w7VFw3Rbl1J
 LFlf5RCZW+SB3OOx8/scrVSgFD6q7oN5PNE6h/E9DKUrg+D9atvz1i542253b1ekftH+
 IC2Q==
X-Gm-Message-State: AOAM533754r+V+AOSTgLlReT3YMkPBNNJgKlGUehgZamT4sdKflu2pKF
 ubq7SaxbLpgFX5FzyN1sDnVVxa/vaYj2E6o4bnUgorAJ8z4LWQ==
X-Google-Smtp-Source: ABdhPJxs4LHfNXqgUxARz6fo8mRzkAZgx4ftO6ABggMu744wQqHYQJ+4SXfGJhXSiabP8RKsd02US/YzOyc1q9fHTjs=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr3615365lfn.407.1620670781305; 
 Mon, 10 May 2021 11:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210511002838.7b3cb1e7@xhacker>
In-Reply-To: <20210511002838.7b3cb1e7@xhacker>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Mon, 10 May 2021 20:19:30 +0200
Message-ID: <CAM4kBBJqF=AxTu50PF=EshLSyqn0=yeC2dwf4JJj_Grsi_Tccg@mail.gmail.com>
Subject: Re: [PATCH] riscv: code patching only works on !XIP_KERNEL
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_111943_807657_D2F338EC 
X-CRM114-Status: GOOD (  21.28  )
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

On Mon, May 10, 2021 at 6:35 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Some features which need code patching such as KPROBES, DYNAMIC_FTRACE
> KGDB can only work on !XIP_KERNEL. Add dependencies for these features
> that rely on code patching.

Since we can define extra RW sections to place some tiny code bits in
RAM, I would suggest that you hold back this patch for a while.
I am not going to support the idea of e. g. compiling KGDB support
into a XIP kernel, but disabling the whole HAVE_ARCH_JUMP_LABEL is
hardly the way to go.

Best regards,
   Vitaly

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> Hi,
>
> Currently, the RISCV_ERRATA_ALTERNATIVE also only works on !XIP_KERNEL
> but from the maillist it seem there's effort to make the co-exist, so
> I drop RISCV_ERRATA_ALTERNATIVE dependency on !XIP_KERNEL.
>
> Thanks
>
>  arch/riscv/Kconfig | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index a8ad8eb76120..61320b94ef97 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -60,11 +60,11 @@ config RISCV
>         select GENERIC_TIME_VSYSCALL if MMU && 64BIT
>         select HANDLE_DOMAIN_IRQ
>         select HAVE_ARCH_AUDITSYSCALL
> -       select HAVE_ARCH_JUMP_LABEL
> -       select HAVE_ARCH_JUMP_LABEL_RELATIVE
> +       select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
> +       select HAVE_ARCH_JUMP_LABEL_RELATIVE if !XIP_KERNEL
>         select HAVE_ARCH_KASAN if MMU && 64BIT
>         select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
> -       select HAVE_ARCH_KGDB
> +       select HAVE_ARCH_KGDB if !XIP_KERNEL
>         select HAVE_ARCH_KGDB_QXFER_PKT
>         select HAVE_ARCH_MMAP_RND_BITS if MMU
>         select HAVE_ARCH_SECCOMP_FILTER
> @@ -79,9 +79,9 @@ config RISCV
>         select HAVE_GCC_PLUGINS
>         select HAVE_GENERIC_VDSO if MMU && 64BIT
>         select HAVE_IRQ_TIME_ACCOUNTING
> -       select HAVE_KPROBES
> -       select HAVE_KPROBES_ON_FTRACE
> -       select HAVE_KRETPROBES
> +       select HAVE_KPROBES if !XIP_KERNEL
> +       select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> +       select HAVE_KRETPROBES if !XIP_KERNEL
>         select HAVE_PCI
>         select HAVE_PERF_EVENTS
>         select HAVE_PERF_REGS
> @@ -230,11 +230,11 @@ config ARCH_RV64I
>         bool "RV64I"
>         select 64BIT
>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
> -       select HAVE_DYNAMIC_FTRACE if MMU && $(cc-option,-fpatchable-function-entry=8)
> +       select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
>         select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
> -       select HAVE_FTRACE_MCOUNT_RECORD
> +       select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
>         select HAVE_FUNCTION_GRAPH_TRACER
> -       select HAVE_FUNCTION_TRACER
> +       select HAVE_FUNCTION_TRACER if !XIP_KERNEL
>         select SWIOTLB if MMU
>
>  endchoice
> --
> 2.31.0
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
