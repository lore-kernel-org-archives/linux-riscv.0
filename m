Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DE3C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 09:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoiaP+XjEHDi1k8Grc+KjYKmVM20TkcUqkmJAdmfjys=; b=pKMOJ0fO+kE4PU
	n6edVdX4+zNJcmQKL1n8iJ1U0OOTQTOpgcWT1IZFfBTYHo1TDZ/fnfwIIAdURpUVipQY5XYUngsZc
	OUmATcdoS3M9urrYm8w+UsXsnV+BTTjGMPcmoNnQ7gqZYbqRjxRo/Uk4Yb8Ob0wmDh7WPgv3IyKNR
	jr5eygLi/1icdeZFEQLodTxTh0efUFzvkJqKPa+cRr1ht7rwlh+u+kU/Tv78HDEk9mb0CLOd/+Ejl
	kQ+K+WaA52ZuN9JPWJVya+nQFsQNGYx60iRkxF4c60p0iRM944iKF/bIjQvYKaP/FY3hQfXMFQaE9
	IF4xZGz+fJ6re6IoaPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p66vQ-00Dmhp-GE; Fri, 16 Dec 2022 09:22:40 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p66vO-00DmhF-JE
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 09:22:39 +0000
Received: by mail-pg1-x536.google.com with SMTP id 142so1383377pga.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 01:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v1fP5fRdrMizfsWMQ3E1/1TNzCxj+enzPNdKZzOn0UA=;
        b=omOeDYDPhBf+aN+VcZkjPgRWPHaeGx5XhwkZP6TBzejDSQ0jZtXfL+hHtoOXehm8Ul
         efAVknjUoJwvYOI0zvs6b8R7IPmTwjlLdOVUJLlv9HjtqYoGZtFEiO38GlV0NECbHIrS
         OIKxNJIGuCJLg4BsyqExaY8YvC5qJXqdBEmOzoFoQuMEI0pzpwAM4XgSLTTIm3qzccm3
         PCaNktneamtJh0ypbFSlRpzEzN9U/je1b5U/+l5UcovZrjeP/9yJJxjHK5UQ091cZhrq
         NcmaIjhgqyvfnLMtghWVf8uFe7l+M78yd6vI0shcrpn1GmTxTCfUJHIVJZVGQebvqDs9
         8ljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1fP5fRdrMizfsWMQ3E1/1TNzCxj+enzPNdKZzOn0UA=;
        b=I/VxHT+4cVbnKFbyibw1XsJfnzikbbp1f4aZRuHL922yRbFhU88LCAv4QJqeiAci0V
         HRYNxAvx9MeVQfJKKZCqIhEd8yRy0SHg3dfIV8q5vlAEa2UIn8zB4zT3vv/20EjUj2Oe
         +YhlsajTxjp/zKnd6KsJMAUwOvxPtbAyJ1mEcyd9tAbzpRYJ5cJ5kN4p4Zn+wnAw3KUz
         Ju1lkB92kPVMQR2WfLPZImo2iftdv0E00yRZgUCJzALl6TxWJdjIWUO0xT1hdYQx4qlZ
         QisjriJBnqp5VPZ5+6M9CGgTnFBzwHXeKRVqA4HT5jmB/unREjc1BYLC1lwHtODOc2OV
         rG0w==
X-Gm-Message-State: ANoB5pngsg36rai0uza93aQcB26eBGJ/5tGGazoaQxE3AEmXxQlyXXxz
	sqepp4LGYwLOuNT0QBmZfKAOLNf3k7F5omrKMqyP/w==
X-Google-Smtp-Source: AA0mqf7N87TIr/u2Xinh0I/i4Gx5SNh8dUb223ncD5i94MGrdKiCEfWYNI+lkK6pN7qAcudY2sEvz7g7NhlT96MUsJU=
X-Received: by 2002:a63:334e:0:b0:479:2227:3aa1 with SMTP id
 z75-20020a63334e000000b0047922273aa1mr1364607pgz.595.1671182556675; Fri, 16
 Dec 2022 01:22:36 -0800 (PST)
MIME-Version: 1.0
References: <20221207131731.1291517-1-william.qiu@starfivetech.com> <420d067c-665b-b247-b0cd-8ac242c19924@starfivetech.com>
In-Reply-To: <420d067c-665b-b247-b0cd-8ac242c19924@starfivetech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 16 Dec 2022 10:22:00 +0100
Message-ID: <CAPDyKFoosrm9CSi4s=YSxdg4xqv118wOFUAc5QRcOgtMCiX=DA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] StarFive's SDIO/eMMC driver support
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_012238_668910_AF59AE14 
X-CRM114-Status: GOOD (  21.68  )
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

On Fri, 16 Dec 2022 at 03:02, William Qiu <william.qiu@starfivetech.com> wrote:
>
>
>
> On 2022/12/7 21:17, William Qiu wrote:
> > Hi,
> >
> > This patchset adds initial rudimentary support for the StarFive
> > designware mobile storage host controller driver. And this driver will
> > be used in StarFive's visionfive-v2 board. The main purpose of adding
> > this driver is to accommodate the ultra-high speed mode of eMMC.
> >
> > The patch series is based on v6.1-rc5.
> >
> > -- William
> >
> > William Qiu (3):
> >   dt-bindings: mmc: Add bindings for StarFive
> >   mmc: starfive: Add sdio/emmc driver support
> >   riscv: dts: starfive: Add mmc node
> >
> >  .../bindings/mmc/starfive,jh7110-sdio.yaml    |  71 +++++++
> >  MAINTAINERS                                   |   6 +
> >  .../jh7110-starfive-visionfive-v2.dts         |  25 +++
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  38 ++++
> >  drivers/mmc/host/Kconfig                      |  10 +
> >  drivers/mmc/host/Makefile                     |   1 +
> >  drivers/mmc/host/dw_mmc-starfive.c            | 197 ++++++++++++++++++
> >  7 files changed, 348 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-sdio.yaml
> >  create mode 100644 drivers/mmc/host/dw_mmc-starfive.c
> >
> > --
> > 2.34.1
> >
>
> Hi Jaehoon/Ulf,
>
> Could you please help to review and provide comments on this patch series?
> Thank you in advance.

Hi William,

Looks like you have received plenty of good comments already and there
are a lot of things for you to update. That said, I think it makes
better sense for me to look at the next version instead.

>
> Best regards,
> William Qiu

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
