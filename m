Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA83C11F67
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 20:44:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA4E0613EC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 20:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA4E0613EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xH69CzkgIMsIxN6JjbYHkl2xH1LRn5Y/Wr53hvx7ziQ=; b=r6aeiEMzobNibY
	7anT5kswNSeWwPO/nud527ZZM91cHBLuzusv3LxPJEVltHr0YZfIUKJxyScXKVrNkRh9k01MffaCk
	ELnCZQV9Oj6RULpDkuZoZgIHAqDMVxhCd1DA2SJTRKSG5/C5xPqz2D6zOnJQIFi0Isb3b9cUuyucz
	VpHRN3YYxsuieCAztl1v54rswjycKr2TjPRFlubshxOhFQrf7BZVhuHqHDgtq6xuvrl3ddwfvT8P2
	s/uX3Z+daDCAQB4JR1GGlizfGuXWfN//imf9vC1bDr3bVt4ZZCq7xWPVUYTU4NXNnCiq5qXPSuurp
	NQTiSw4uSTvro/BLV7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz3YA-0017v3-71; Thu, 01 Jul 2021 20:44:42 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz3Y7-0017uZ-Mt
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 20:44:41 +0000
Received: by mail-pf1-x42c.google.com with SMTP id 17so6787506pfz.4
 for <linux-riscv@lists.infradead.org>; Thu, 01 Jul 2021 13:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kfTKujTp56n4/Ij0+Evkew8skmHtJZqhI4Y/035k1CI=;
 b=LhLN7bklFSTZy+QjE51qyuBP+kV9vN64LqJEhTxZD6qNB1yqXBPqcaxvquQdzDgeWI
 ONaRo+D0Xj52fjlFeOfVVqWEUGo8HD7QCEvT53F8lGl9JBaR5B9ZHtHig5sz7PWMgQiZ
 OVLwFNNVmKZlYp/XbGD3WUkY+4Z7/vheaYmm4k4abRm64Mrzm/ee3hIw7uqld2MWTOM6
 ELM+GccFq9AH4TakaVQJvmWH2k+2THnTTiwiQnlrYfRed5xTyOJkZkEz7OPHEgmHKZl2
 fzmYirK5VSrNRWT1moR4ABlm8kAghMB7KSVqkONJ/lbsFcn6/iL2xnHRTC2pQy7Qu+A+
 eEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kfTKujTp56n4/Ij0+Evkew8skmHtJZqhI4Y/035k1CI=;
 b=Pi+NjQRbVQDYpVPnemPfHzB1KZjoiAG1ggU6jZUSp1FWhDzLKfGeTmFvPci1Ay8avw
 JGpE9u69WmzEZqkVmIeKL7g6mN9a4QRGD6EYms5+8g+0klafH5wE1npA638Ja4XwmjaA
 RGusDRdg+SSqPVOviA7HY85ydOdX1G/uGyMv4CnmgbrfKwardYWujBDBWbqnurODY99v
 svWq4fhqZ+SpMaWjOMMgqv3b8+1ZYN9DvcWO5z1pmNIm5QZOryefBjq9LwmyLBjmYZ9k
 S4IItGvzObPV74Pe6dydVYW8Y2G+fxA/7/HfFT4gieA6z2BGLC8Q6zCiEUrmw1qPQG4d
 W0qw==
X-Gm-Message-State: AOAM530XZ6GmDoYo1/BmSFwUuCv6rkRyvjFbRkBsW7Q+6m7oEi9UrUyr
 IjtSy2hJ+bF0WtSlUhQGn1JiKg==
X-Google-Smtp-Source: ABdhPJxViOjAsWPoBf7lCbbGsP5Sl8JUz8Hl3rPEtVUcS2ghAIowpdgetZai2p0bOYzScptCkCAn8A==
X-Received: by 2002:a63:eb4f:: with SMTP id b15mr1431027pgk.2.1625172278698;
 Thu, 01 Jul 2021 13:44:38 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:8fd:ccc0:a9a:cf98])
 by smtp.gmail.com with ESMTPSA id s20sm11799054pjn.23.2021.07.01.13.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 13:44:37 -0700 (PDT)
Date: Thu, 1 Jul 2021 13:44:35 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Fu Wei <tekkamanninja@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
Message-ID: <20210701204435.GB963857@x1>
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
 <CAEUhbmXuxSePo22y_keGsqPWyCSAoUdTQPqCRJmYXS7rT4DhZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEUhbmXuxSePo22y_keGsqPWyCSAoUdTQPqCRJmYXS7rT4DhZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_134439_795874_24A638AB 
X-CRM114-Status: GOOD (  16.53  )
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

On Thu, Jul 01, 2021 at 10:25:12AM +0800, Bin Meng wrote:
> On Thu, Jul 1, 2021 at 8:23 AM Drew Fustini <drew@beagleboard.org> wrote:
> >
> > Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> > BeagleV Starlight JH7100 board [2].
> >
> > [1] https://github.com/starfive-tech/beaglev_doc/
> > [2] https://github.com/beagleboard/beaglev-starlight
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > ---
> >  MAINTAINERS                         |   8 +
> >  drivers/gpio/Kconfig                |   8 +
> >  drivers/gpio/Makefile               |   1 +
> >  drivers/gpio/gpio-starfive-jh7100.c | 425 ++++++++++++++++++++++++++++
> >  4 files changed, 442 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-starfive-jh7100.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index bc0ceef87b73..04fccc2ceffa 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17423,6 +17423,14 @@ S:     Supported
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> >  F:     drivers/staging/
> >
> > +SIFVE JH7100 SOC GPIO DRIVER
> 
> typo of SIFIVE, but it should be STARFIVE

Thank you!  My eyes should have caught that.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
