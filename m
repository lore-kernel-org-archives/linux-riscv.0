Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED04C07E95
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 21:15:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362406113A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 21:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362406113A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtPoAqZ7+ZS322ua7EtdV1stcHcte/zsLT8+vfVjPyY=; b=ds9JVoJ4dTsUmJ
	8b4TKQBrvXulGqOQrby6hCy8lo1YAwO2aQTFr4k3o7JmxmZ3Q5Q5BO4runGsI3tE/JKI+dTPRF2AN
	Op/LU3t/bMfjxik4v/kUW/3qZVwQ7eYiTCqHspX7SM0MVVJdDJmY34hjUUYhnvoeKAZo37eGvhdtu
	zFccI8dFnuxkWD7c5+tYCx8iFJ4SqISKEnnwiQe5XG1+MXyXQ0CU62QMBNq07Ph1aAXrN/DrEwSPd
	y3zu1YIbyeJw8rEwSxLoEcaLjKZkzWh4q2IdTkOnq5o2xmaxTB0JF4cJpDVEPxa+fH0ddOvYZpo4v
	rzBLvk7vPy229ggtAeUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5abe-00BM2Q-1t; Mon, 19 Jul 2021 21:15:18 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5aba-00BM1W-Od
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 21:15:16 +0000
Received: by mail-lf1-x132.google.com with SMTP id v6so32539767lfp.6
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 14:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qFtdMgkLQc2YmuYFFmmTPa+0DMBOVtiSjJ3Lih49niU=;
 b=PjN4k5YCt7OXpbK+2pKhpm3/sgq8JM1F+LN+BPin+vPlb9dwCGzD/QohlbVfOFPOa+
 o1EcQzRiUEDt9SbNaiU27ZMxHHwkAJ95IQIozEZJk/k6ybRO1ovJne0Joiev0k02VL5G
 46n8bf6C98J4iNNInP6cYM4JNNDXT6hEEn6EiBkaSdlDwGSId54lLNK8X/CY8WS/6wip
 jVcgViCXnK926ShISAWE966Hieue0qBiap3AzF4i3HfcDU/sM8ah7TvlD+PKZ5LMYAh8
 e/pcM6VdMAzXIn+vFdlP2DDA2vxAsQh7UEBOej2sVte0qIW7YyblcT0KtgrAE4YCylVy
 ndSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qFtdMgkLQc2YmuYFFmmTPa+0DMBOVtiSjJ3Lih49niU=;
 b=H+zm5hRkmuAj60WOkAA+WkdrYsfQnSQxRIVB2KRTwzetYir+DHLl40P+HMMj9PBfpv
 6ERNavVbUpS2Yh01QVV7b6evZRJcaOmuF79gm67y3KbSySE9MFdaJ7RG0nLzIbr6BZVf
 cKfrexgNACgfC6GsG2twWnP1BMNlSXEKQJ7rmjA1bk29cOaLTpiLF4d9CkopBdaypmsp
 2HkjPMTljWuHg/JVJpml+0qY4LGuWuseYz0UzwKwoKK5dCBRHJ5zk+CAPf4l7W76zm64
 +hyTB2HoMJtvcnQ8j4NZAIERbiOu5MbDWksif/RimIVBEoCGAL+WbvwtiSMM3GFZ74R+
 a04A==
X-Gm-Message-State: AOAM533qzwQ8PblOGBuFT5lUHVAYVAP0yzD5wGDZRt+zTcY7hINPMqxp
 U/K/7czE3WTkfX794HQLkQleGDSq7FsdUB5NnAGlhQ==
X-Google-Smtp-Source: ABdhPJwZTEZwg2PfbPx86qBrVr7N+QJgYAVbxrromBgvPBO1P7BqvRH7UQFyadoWHUi9Dtb947HxhWix5gbG0vQn+P0=
X-Received: by 2002:a19:4916:: with SMTP id w22mr20358536lfa.374.1626729309240; 
 Mon, 19 Jul 2021 14:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210719205247.1023289-1-twd2.me@gmail.com>
In-Reply-To: <20210719205247.1023289-1-twd2.me@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 19 Jul 2021 14:14:59 -0700
Message-ID: <CAKwvOdmNji0AbYUiOSfb5cLD+g7YCpXk4oDupa8gTfgzYmxvBg@mail.gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: build: Pass `-mattr` to `lld`
To: Wende Tan <twd2.me@gmail.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com, 
 Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_141514_864994_57565D6C 
X-CRM114-Status: GOOD (  16.51  )
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

On Mon, Jul 19, 2021 at 1:53 PM Wende Tan <twd2.me@gmail.com> wrote:
>
> Pass `-mattr` to `lld` so that it can generate proper machine code.
> By the way, it seems that `-march` does not work well now.
>
> Signed-off-by: Wende Tan <twd2.me@gmail.com>
> ---
>  arch/riscv/Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index bc74afdbf31e..bbc186a3ab45 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -52,9 +52,16 @@ riscv-march-$(CONFIG_ARCH_RV32I)     := rv32ima
>  riscv-march-$(CONFIG_ARCH_RV64I)       := rv64ima
>  riscv-march-$(CONFIG_FPU)              := $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)      := $(riscv-march-y)c
> +riscv-mattr-y                          := +m,+a
> +riscv-mattr-$(CONFIG_FPU)              := $(riscv-mattr-y),+f,+d
> +riscv-mattr-$(CONFIG_RISCV_ISA_C)      := $(riscv-mattr-y),+c
>  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>
> +ifeq ($(CONFIG_LD_IS_LLD),y)
> +       KBUILD_LDFLAGS += -mllvm -mattr=$(riscv-mattr-y)

We should prevent the proliferation of the compiler internal `-mllvm`
flags from Kbuild Makefiles; these are indicative of LLVM IR specific
issues with regards to LTO.  Can you please file a bug against LLVM
that `-mattr` should be encoded in the IR for LTO's sake?

See also:
commit 0236526d76b8 ("Makefile: lto: Pass -warn-stack-size only on LLD
< 13.0.0")
commit 2398ce80152a ("x86, lto: Pass -stack-alignment only on LLD < 13.0.0")

> +endif
> +
>  KBUILD_CFLAGS += -mno-save-restore
>  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
>
> --


--
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
