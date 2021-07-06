Return-Path: <SRS0=x9rf=L6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE99EC07E9C
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 19:11:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74A8861C6C
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 19:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74A8861C6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=XVMTJCwmyD00CCMyTTbwsQb8SqT50TJ+9RZFNXJHZDk=; b=ZeOG/+3hNnUQjwjy3aIpLrvv04
	ogc4Vn+hi446h6JbKGsz9l700PTqrBo0nkGzxGypUE5mMG0EFViqSkNMpkx9JtNcCGRWsQ9IIQ3W0
	8ul0XTUQLK2WHrl/IOKeE+GRHr2IjWjfbd0rkNoPCOgcRdj+/2aIiMrFhnX2vThRZ+ckCorAyLktx
	O8shdIii93xQaaUNlLSwJ8GuF+PF/NBPRjO7T6MjHYYIYtC08ivmCoONooPkgEczYkbxJAUUkxhV/
	FNFqWML2vsStVHEbXyCZFGdkgW27wx+VOiYd9NhbGfuyW+3bulwtPAt7RztsFBVBLNEwBh/eeSbFa
	rpbHOg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0qT1-00Cdjr-RM; Tue, 06 Jul 2021 19:10:47 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0qSs-00CdhE-MG
 for linux-riscv@lists.infradead.org; Tue, 06 Jul 2021 19:10:40 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so2138722pjs.2
 for <linux-riscv@lists.infradead.org>; Tue, 06 Jul 2021 12:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7oV0ZSYNnlAyW14j31IWfCZB8bVAKuRWNWStdCvUjXk=;
 b=UMIqyKccdlLQQtwLZRueSGdJSYkBbZanLIGTHewjAej8JLIdemHkSMMy5gMgXk/m/b
 Jp+mPza1E9qaXU5/iw7h5FpCuEmNQ9L4qh8LK4ngKQfT9L5vukiPi/0R/k2Q+I2x0D6S
 DxIHQW3R3NmTu8lkxTo5kGdEqfbYWwAuBLIrGCQ++Y7OPyEns/A0naSezlybAftna0l4
 NmEKIqCyBWNe3O3/4UTYG/cVBmUT1v2ZG15N2dEI+PqDB5O0VNRWOKhAesA4b2TBlTXW
 gajNoBI94sPMsm3h1o3ykAJvvg9fGao+uqxKACvZKqm/4bVVVkBcwzK8TlVIn82dzG+H
 3YNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7oV0ZSYNnlAyW14j31IWfCZB8bVAKuRWNWStdCvUjXk=;
 b=Er3fzq2k34N+QP9YxZtWLgp7QxrA2kEhTtZwFesOpDKNChDqd4Og/WqhAHvsVQylwF
 KvcG1o+erwwUvtkrbyWJGRsl61MOJJU5SiPJfa0v8Okc8I3t23Ziz2J5//HC+h5QkITj
 nAPFdODvQlD2DmxJw2it7m1WaAgboMVPET3oPR/a175OKWDSHG3lUetE3oCZ6gPdyq0p
 3HSKpQGwtabg2lSoH3OJoufagVVhUEucK/dQtgnI534wfUcejJQOMWzzB7Pmxyc237oe
 MGhz1hoQ9X/BROm/Lpc7eIYsSF2UQw9XKrAY9or+wbdExq0XJavojkfhbek26KV4pgWb
 RknA==
X-Gm-Message-State: AOAM530LXXc+J1/kyyib46uoOqEnJVdDupuEfIHBRu0PkMiNkYE9SFkC
 i1jmPTruk6GMggBvfRfXHkOmcg==
X-Google-Smtp-Source: ABdhPJxDx9rhMSrtFZpfTqBSrtc20HCKJNq1/7bHrKN5piHoEsyPm6Hf4KDlMWx96sBZ4cetfY0iYg==
X-Received: by 2002:a17:902:da85:b029:129:b7a8:6ef8 with SMTP id
 j5-20020a170902da85b0290129b7a86ef8mr2201073plx.77.1625598637479; 
 Tue, 06 Jul 2021 12:10:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 30sm4311085pgq.31.2021.07.06.12.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 12:10:36 -0700 (PDT)
Date: Tue, 06 Jul 2021 12:10:36 -0700 (PDT)
X-Google-Original-Date: Mon, 05 Jul 2021 20:54:20 PDT (-0700)
Subject: Re: [PATCH] riscv: ptrace: add argn syntax
In-Reply-To: <20210620120151.17860-1-huan.xie@suse.com>
CC: oleg@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>,
 caou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, chongguiguzi@gmail.com, huan.xie@suse.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: chongguiguzi@gmail.com
Message-ID: <mhng-f13a3289-d21f-4f4a-a019-af8f3f56ae6c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_121038_857924_C73EB5EF 
X-CRM114-Status: GOOD (  21.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 20 Jun 2021 05:01:51 PDT (-0700), chongguiguzi@gmail.com wrote:
> This enables ftrace kprobe events to access kernel function
> arguments via $argN syntax.
>
> Signed-off-by: Jeff Xie <huan.xie@suse.com>
> ---
>  arch/riscv/Kconfig              |  1 +
>  arch/riscv/include/asm/ptrace.h | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 18ec0f9bb8d5..f9246a7d0a31 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -88,6 +88,7 @@ config RISCV
>  	select HAVE_PERF_REGS
>  	select HAVE_PERF_USER_STACK_DUMP
>  	select HAVE_REGS_AND_STACK_ACCESS_API
> +	select HAVE_FUNCTION_ARG_ACCESS_API
>  	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select IRQ_DOMAIN
> diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
> index 09ad4e923510..fdb59ee405ee 100644
> --- a/arch/riscv/include/asm/ptrace.h
> +++ b/arch/riscv/include/asm/ptrace.h
> @@ -141,6 +141,37 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
>
>  	return *(unsigned long *)((unsigned long)regs + offset);
>  }
> +
> +/**
> + * regs_get_kernel_argument() - get Nth function argument in kernel
> + * @regs:       pt_regs of that context
> + * @n:          function argument number (start from 0)
> + *
> + * regs_get_argument() returns @n th argument of the function call.
> + *
> + * Note you can get the parameter correctly if the function has no
> + * more than eight arguments.
> + */
> +static inline unsigned long regs_get_kernel_argument(struct pt_regs *regs,
> +						unsigned int n)
> +{
> +#define NR_REG_ARGUMENTS 8
> +	static const unsigned int argument_offs[] = {
> +		offsetof(struct pt_regs, a0),
> +		offsetof(struct pt_regs, a1),
> +		offsetof(struct pt_regs, a2),
> +		offsetof(struct pt_regs, a3),
> +		offsetof(struct pt_regs, a4),
> +		offsetof(struct pt_regs, a5),
> +		offsetof(struct pt_regs, a6),
> +		offsetof(struct pt_regs, a7),
> +	};
> +
> +	if (n < NR_REG_ARGUMENTS)
> +		return regs_get_register(regs, argument_offs[n]);
> +	return 0;
> +}
> +
>  #endif /* __ASSEMBLY__ */
>
>  #endif /* _ASM_RISCV_PTRACE_H */

This is on for-next.  I cleaned it up a bit to avoid leaking that 
#define.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
