Return-Path: <SRS0=/pGw=AQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1588FC433E1
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 06:53:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA54D20771
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 06:53:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tu7/rGRT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ne2z+qSH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA54D20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bFsjRxfOMAtyqi/2xM900AJytPQeDiTT58uyvun9bLk=; b=Tu7/rGRTVrQqLyDoQonDcAUbM
	yKGPLUsAT643VfZoXJvteiBEDfSYc2NcJg7J8dGzCkBjYAVP8QVdbetfYWG0OZNIzjzawews3AS55
	PnRZ4M2/eGfQ8FZnQq4EVZMM3Lu+f73agCEWElDC8dk3Kt7150bHILkwqQEzGeLvcw61Tan6wf4Mu
	l+qRGiQX6Qh3NMkLsCx43NSROl43HvArr/XHiraondso89oCuq2wv0DXBvPqS5Msaif20abWiHEYu
	oscUanmbcTdKqeW/S0FDdphdwoXJjKBGecfmZfFkE7cNm2vzVRD0KfLXBciXte2dhTncBtPJ4hPQj
	D8/xml4ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jryXA-0001RT-9q; Sun, 05 Jul 2020 06:53:52 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jryX8-0001Qf-27
 for linux-riscv@lists.infradead.org; Sun, 05 Jul 2020 06:53:50 +0000
Received: by mail-pf1-x441.google.com with SMTP id z3so6379816pfn.12
 for <linux-riscv@lists.infradead.org>; Sat, 04 Jul 2020 23:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JvxcxMFQ+z/Z7/gkNAcYGUESMgFtHoka8cWR54DipYU=;
 b=Ne2z+qSHN+80RznDWRHc3AjAM2UPBtKQ9brbR1UrCmVSBFo0g+1y5TkhmDMzKmSgZP
 krA9nidCVFf8RpV/grAEtQ9tCrQ+JXhoqMs4C4vp2HruBK/0sSbtoEDTHPNQ99KR+hTG
 eln1fokzVe6vlHGpnsZ9cLvFXydX94tVBLzag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JvxcxMFQ+z/Z7/gkNAcYGUESMgFtHoka8cWR54DipYU=;
 b=jyrzjrarRkZqYa8GvfNZrup9vNm9rCiOgkNu7UCtEehkC7cTOwzmrIhHELiTbZNKcx
 /M8u0ZmyeLKsUE/aW5m0GOxEMx1wLSJB48azoCeuE2bwzC1RvgnNcOaMNRVJ9Sa2C6A6
 pw2f84dY5x+hxsD72iuJVZUUIpHam/flhHGCUochnOF7JVtoV3BAug7066srqETHrka5
 DNn1zOr42ZI5RYPyD7v70sgsZBalTe+Rez+0oFkLWXnkGCZFhv1r1exx5UenNLTYnU0x
 uSl41Dkv1nKOCSyBXf6HSQGmVdPIBzQq18GTPRL3k5pxu8U04o41jdnmgD/tn4B7H1Dw
 y3bw==
X-Gm-Message-State: AOAM531nMYYasRHuod9E8P/qUapBuG7xpNkG5dmrJuRUi5vFyrt/BPxs
 VfklZ6+d8JOr3uvXQM0uq3Sw2A==
X-Google-Smtp-Source: ABdhPJwY40cIqTQ8xrh1JWHjeKJiAehtBExz5u9w1b1MIL0amDYYhj6tELrp+Ty0FGCVT9meMhYHaQ==
X-Received: by 2002:a63:725c:: with SMTP id c28mr34562369pgn.156.1593932027330; 
 Sat, 04 Jul 2020 23:53:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j8sm16594574pfd.145.2020.07.04.23.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 23:53:46 -0700 (PDT)
Date: Sat, 4 Jul 2020 23:53:45 -0700
From: Kees Cook <keescook@chromium.org>
To: guoren@kernel.org
Subject: Re: [PATCH] riscv: Add STACKPROTECTOR supported
Message-ID: <202007042350.4C153C4F8@keescook>
References: <1593930255-12378-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593930255-12378-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_025350_139532_26EF457E 
X-CRM114-Status: GOOD (  21.99  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, anup@brainfault.org,
 palmerdabbelt@google.com, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Masami Hiramatsu <mhiramat@kernel.org>,
 zong.li@sifive.com, paul.walmsley@sifive.com, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org, Greentime Hu <green.hu@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jul 05, 2020 at 06:24:15AM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> =

> The -fstack-protector & -fstack-protector-strong features are from
> gcc. The patch only add basic kernel support to stack-protector
> feature and some arch could have its own solution such as
> ARM64_PTR_AUTH.
> =

> After enabling STACKPROTECTOR and STACKPROTECTOR_STRONG, the .text
> size is expanded from  0x7de066 to 0x81fb32 (only 5%) to add canary
> checking code.
> =

> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Bj=F6rn T=F6pel <bjorn.topel@gmail.com>
> Cc: Greentime Hu <green.hu@gmail.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/Kconfig                      |  1 +
>  arch/riscv/include/asm/stackprotector.h | 29 +++++++++++++++++++++++++++=
++
>  arch/riscv/kernel/process.c             |  6 ++++++
>  3 files changed, 36 insertions(+)
>  create mode 100644 arch/riscv/include/asm/stackprotector.h
> =

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index f927a91..4b0e308 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -63,6 +63,7 @@ config RISCV
>  	select HAVE_PERF_EVENTS
>  	select HAVE_PERF_REGS
>  	select HAVE_PERF_USER_STACK_DUMP
> +	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select IRQ_DOMAIN
>  	select MODULES_USE_ELF_RELA if MODULES
> diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include=
/asm/stackprotector.h
> new file mode 100644
> index 00000000..5962f88
> --- /dev/null
> +++ b/arch/riscv/include/asm/stackprotector.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_RISCV_STACKPROTECTOR_H
> +#define _ASM_RISCV_STACKPROTECTOR_H
> +
> +#include <linux/random.h>
> +#include <linux/version.h>
> +
> +extern unsigned long __stack_chk_guard;
> +
> +/*
> + * Initialize the stackprotector canary value.
> + *
> + * NOTE: this must only be called from functions that never return,
> + * and it must always be inlined.
> + */
> +static __always_inline void boot_init_stack_canary(void)
> +{
> +	unsigned long canary;
> +
> +	/* Try to get a semi random initial value. */
> +	get_random_bytes(&canary, sizeof(canary));
> +	canary ^=3D LINUX_VERSION_CODE;
> +	canary &=3D CANARY_MASK;

Does riscv have any kind of instruction counters or other trivial timers
that could be mixed in here? (e.g. x86's TSC)

> +
> +	current->stack_canary =3D canary;
> +	__stack_chk_guard =3D current->stack_canary;

What's needed for riscv to support a per-task canary? (e.g. x86's TLS or
arm64's register-specific methods)

> +}
> +#endif /* _ASM_RISCV_STACKPROTECTOR_H */
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 824d117..6548929 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -24,6 +24,12 @@
>  =

>  register unsigned long gp_in_global __asm__("gp");
>  =

> +#ifdef CONFIG_STACKPROTECTOR
> +#include <linux/stackprotector.h>
> +unsigned long __stack_chk_guard __read_mostly;
> +EXPORT_SYMBOL(__stack_chk_guard);
> +#endif
> +
>  extern asmlinkage void ret_from_fork(void);
>  extern asmlinkage void ret_from_kernel_thread(void);
>  =

> -- =

> 2.7.4
> =


But yes, as a starting point, better to have a single per-boot global
canary than none at all. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- =

Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
