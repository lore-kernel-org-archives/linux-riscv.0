Return-Path: <SRS0=/pGw=AQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBDCC433DF
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 20:40:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1876220658
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 20:40:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kdv93vJl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j53MF7Ef"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1876220658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RnuEChZ9BqdIUxhszMdKDtJ2EP98XGKV5uZF22bGiXk=; b=kdv93vJlNvYUgtW1fGuIVuoul
	ckuGEp6gOhU93BScvlGBWr7Hufh73uZlMo8aOl2bFsx6WMJtUVOmkrLUxZlTa4NZnmLPp2HLiD1OG
	dvga4Oqzxa0X5hU3yOElw+JQDOjsM1hmsPLMvu0uz6AipxkWKGvxpiu+nNe2UmehLO4YUvv8GxAlx
	fdVVHKbpaWAWjwmth1dt7XhaSJIoAe1uewF9eaOEmLY7IPhMHR70DBUDkGXUDVty2N6uo20QXO+eG
	X+wPSCrKK4MNUaa3dIWK5Xc0Tp0R1PUdmfCqFRwcAjv0tfEsvotOI7+Dp/nZmldVnkU67hP76FYLy
	HEiGl8hLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsBRE-0001r6-Gq; Sun, 05 Jul 2020 20:40:36 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsBRC-0001qU-2m
 for linux-riscv@lists.infradead.org; Sun, 05 Jul 2020 20:40:34 +0000
Received: by mail-pl1-x643.google.com with SMTP id 72so3949116ple.0
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2020 13:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q9lFBU3d76A+AvC7/qqAJBRlf6HVmM0fTZD+IkpZgqM=;
 b=j53MF7EfkDpIVkrbnWBG49SQ/STTBmGcVbJNSxRrB8lv1l4ZMnKBmTWKjH2PjiJ93e
 1cEu/vd01vMJETyxI5n7qLiYFu7EX5pX9NMr/gQCHhrCAca7AapP7jP4N1BBW1gOAwBr
 mtb8MIB0lDM1JT80lAEQaJ4xb+tgJR5vQIDqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q9lFBU3d76A+AvC7/qqAJBRlf6HVmM0fTZD+IkpZgqM=;
 b=JAVpKKx5lk/MbAslHhEKNWC2UNLcn/WJYOLqSbW95wEb4KKUtSLvPuPXDooGYZWUJ1
 v9f+LTevpL32qNZ9DBrPkzePMyMDu+tHT2Vsj8moCPIWxX/lX9XM+tM1s6sEIZ5zR5ng
 csalypYXsp1ZAKZhk9OVa/JiWC/K5I57CvBZojnFl4O8z9FWN38xWCZsxLQdqRALJctI
 pvXKl+LiZ55U7MX7DSk27M23p5fklhtNkV307rFyw39+xsul3cWuoIQ8cUSrTew/k8Sx
 dWf+NUCE1YDS/+rQkVSTEPUzq6muR7gP+B7s6kJWzlE/Tif2CfovqVnY7F6XiUei+PoI
 srCQ==
X-Gm-Message-State: AOAM5327iAYPQiwzyekgd0LG1UtOmZuDCAsh7wFOb0aNcvLGM1dZ+gsL
 3zQJ1IVtogYEkS/lfDNVSrmj4w==
X-Google-Smtp-Source: ABdhPJyrWXBh3rxmwtUH1i70uMO24g4DdmDaRzUAGEXGlglnhpp2zI7U2R18YXFmrFfNNa3qnyReBg==
X-Received: by 2002:a17:90b:358e:: with SMTP id
 mm14mr51022580pjb.54.1593981631976; 
 Sun, 05 Jul 2020 13:40:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z5sm16925366pfn.117.2020.07.05.13.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 13:40:31 -0700 (PDT)
Date: Sun, 5 Jul 2020 13:40:30 -0700
From: Kees Cook <keescook@chromium.org>
To: guoren@kernel.org
Subject: Re: [RFC PATCH] riscv: enable per-task stack canaries
Message-ID: <202007051336.C9EA0ECF65@keescook>
References: <1593958397-62466-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593958397-62466-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_164034_180049_CD176FEE 
X-CRM114-Status: GOOD (  19.98  )
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
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jul 05, 2020 at 02:13:17PM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> After compare arm64 and x86 implementations, seems arm64's is more
> flexible and readable. The key point is how gcc get the offset of
> stack_canary from gs/el0_sp.
> 
> x86: Use a fix offset from gs, not flexible.
> 
> struct fixed_percpu_data {
>         /*
>          * GCC hardcodes the stack canary as %gs:40.  Since the
>          * irq_stack is the object at %gs:0, we reserve the bottom
>          * 48 bytes of the irq stack for the canary.
>          */
>         char            gs_base[40]; // :(
>         unsigned long   stack_canary;
> };

Yes, x86's compiler's implementation of "thread local" stack canary
isn't great for the kernel.

> arm64: Use -mstack-protector-guard-offset & guard-reg
> 
> ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
> prepare: stack_protector_prepare
> stack_protector_prepare: prepare0
>        $(eval KBUILD_CFLAGS += -mstack-protector-guard=sysreg            \
>                                -mstack-protector-guard-reg=sp_el0        \
>                                -mstack-protector-guard-offset=$(shell    \
>                        awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
>                                        include/generated/asm-offsets.h))
> endif
> 
> I prefer arm64, but x86 percpu_data design needs to be considered ?

I don't know riscv internals, so I leave that to y'all! :)

> After the discussion, let's continue the work for riscv gcc
> stack-protector.

I think you'll need some buy-in from GCC before this kernel patch can
land.

> Here is arm64 gcc's work [1].
> 
> [1] https://github.com/gcc-mirror/gcc/commit/cd0b2d361df82c848dc7e1c3078651bb0624c3c6

Can this kind of thing be made general-purposes, instead of having to
reimplement it each time there's a new arch wanting to do it?

> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Kees Cook <keescook@chromium.org>
> ---
>  arch/riscv/Kconfig                      |  7 +++++++
>  arch/riscv/Makefile                     | 10 ++++++++++
>  arch/riscv/include/asm/stackprotector.h |  3 ++-
>  arch/riscv/kernel/asm-offsets.c         |  3 +++
>  arch/riscv/kernel/process.c             |  2 +-
>  5 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4b0e308..4b4e833 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -394,6 +394,13 @@ config CMDLINE_FORCE
>  
>  endchoice
>  
> +config CC_HAVE_STACKPROTECTOR_SYSREG
> +	def_bool $(cc-option,-mstack-protector-guard=gpr -mstack-protector-guard-reg=tp -mstack-protector-guard-offset=0)

And, as I'm sure you realize, it's not supported by the riscv backend
yet:

riscv64-unknown-linux-gnu-gcc: error: unrecognized command line option '-mstack-protector-guard=gpr'; did you mean '-fstack-protector-strong'?
riscv64-unknown-linux-gnu-gcc: error: unrecognized command line option '-mstack-protector-guard-reg=tp'; did you mean '-fstack-protector-strong'?
riscv64-unknown-linux-gnu-gcc: error: unrecognized command line option '-mstack-protector-guard-offset=0'; did you mean '-fstack-protector-strong'?

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
