Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31589C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 13:35:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD943221E2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 13:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD943221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TezwE6WAQP9R6tEwyYL4ClgAPLqownp/aOKz+L8agSU=; b=J3dkOShnQAE024hcda9JwNxEl
	/uoScrvPfTruurWGTSrcbYzywSFNob4VFb1KlAyFiOJY9LX039/G65DziOw0lSCtq6d7MVtZ1JrIh
	6x+bi+IQ4F0dby3KJv2FylCBPJ/+4srKq1LvK490LUSKIOwtneklIgS9hR80kmAI+1hiDAGe/H3Gl
	yDUxBjIRwniBUvY5NBnm97g3dEdyWCWvVt5aIwcLonPW3lAKHmW6Q4dz0nugCDdtDteflVCJfHbbp
	p7w7uziZtvyfEA0HhlIjH0o0oZeHo1+A8QZVTYsGQuggIJCoQ8yyC+2J0iJTktH7XOvAHvzFaJni6
	p1vR/a3AA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knM6C-0001Vq-9J; Thu, 10 Dec 2020 13:35:12 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knM69-0001Ub-3H
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 13:35:10 +0000
Received: by mail-yb1-xb42.google.com with SMTP id r127so4704178yba.10
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 05:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m1HP1yIoElif264wBbc+cWtKQMdT/dfCn4qH9f3uFvE=;
 b=D+sXkGE27BvA8k13Mm/sLNkyOydzvwrVUbzyCyveTzQBfOflUmMnRdlUbE1OB+XKYW
 xAmA/jH7hEgXzn/jR1xat4Jl1JTLn1LNyvDwFWOyN+rM5gvFGsX2gF5jV/1zz/+DHn1p
 8GwqJ0+PjdYQGgBrXHoSoUxg8xvd1nCCjoet1SqORFlbPMQik1j9l0AqIccpUl/qOtje
 DhtZol6YtZnv2IoYwJphso8ZDk/O+9P+Z33jGvem80h46ouMJ4798Sy1u3SBX/QLLlV6
 LNMi9s4YUIU75yhG9QY+FS/b5Mh2TAC3FkdofTj8hYhqsvsCtdyzYHTTOsVJyyrrAMxi
 yglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m1HP1yIoElif264wBbc+cWtKQMdT/dfCn4qH9f3uFvE=;
 b=sYyKGu4dvdMxa5fat7tTDNcyKUhAYaZq58jpnOSYHIm/5Sh87Hl8h7Z2TbH34BjuHq
 hZ7/7e7GfMm3EnZAFVjzV+wNLesapkXm+NV2ngusWZMBitC3/dyznS4+06WjB/3EfVMe
 +xHpU1cI+GNpubctTW3XaGL9+m/hfrzOKYMNlCNF+68brokOugIPJh/VaE29loc88UCq
 qhml3vwf7c97tJT2p08WJb6agTYPD6LQ0hV/PWYDkufvkAzYGyaaO0qU8R9aMD72Aoev
 j0slpM8V7qdH4a0OgdE9G+zV7zTo1lGMDag0LAU58BtfjwYwNr+p6xNYMd9YiYtNqmn5
 8C6g==
X-Gm-Message-State: AOAM531bsiuiYpTJNAxaY1XQC14KCRBUV8Y52tg24fPSnJO/sicp5BGP
 U/jV2a4kP0KqNTc8Ktpe3A/xBKd9h3+tzwmTmhQ=
X-Google-Smtp-Source: ABdhPJyr0TYOgXzMuicga7wyBOkKbBeJ/YheB2Zrk4q9fKy+qC4mFj82XZKUw2JcVTA3YVjJ1ocGnBF5j6BpIIbt1WI=
X-Received: by 2002:a25:bb50:: with SMTP id b16mr11643994ybk.152.1607607307674; 
 Thu, 10 Dec 2020 05:35:07 -0800 (PST)
MIME-Version: 1.0
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-10-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1607403341-57214-10-git-send-email-yash.shah@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 10 Dec 2020 21:34:55 +0800
Message-ID: <CAEUhbmVi7oVEJhyar+GyCVY=MrZri9h3DvQWOceZhcqFe544Kw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] riscv: dts: add initial board data for the SiFive
 HiFive Unmatched
To: Yash Shah <yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_083509_191841_230094E5 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: linux-pwm@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, andrew@lunn.ch,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, broonie@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, lee.jones@linaro.org,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 8, 2020 at 3:06 PM Yash Shah <yash.shah@sifive.com> wrote:
>
> Add initial board data for the SiFive HiFive Unmatched A00.
> This patch is dependent on Zong's Patchset[0].
>
> [0]: https://lore.kernel.org/linux-riscv/20201130082330.77268-4-zong.li@sifive.com/T/#u

I think the dependency should be put below --, not in the commit message itself

>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/Makefile                |   3 +-
>  .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 253 +++++++++++++++++++++
>  2 files changed, 255 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
>
> diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
> index 6d6189e..74c47fe 100644
> --- a/arch/riscv/boot/dts/sifive/Makefile
> +++ b/arch/riscv/boot/dts/sifive/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
> -dtb-$(CONFIG_SOC_SIFIVE) += hifive-unleashed-a00.dtb
> +dtb-$(CONFIG_SOC_SIFIVE) += hifive-unleashed-a00.dtb \
> +                           hifive-unmatched-a00.dtb

Otherwise LGTM:
Reviewed-by: Bin Meng <bin.meng@windriver.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
