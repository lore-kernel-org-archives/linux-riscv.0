Return-Path: <SRS0=GYez=4H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C57C34022
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2020 21:14:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE33F208C4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2020 21:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UHt63i1t";
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SN7ia8pa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE33F208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VKVfs6vZv3SQ2RrnXF5uFQP1/Hk2siSLvBq1d5qt0o4=; b=UHt63i1tSCUm3dkvF8bAAjuPq
	YXxO5wa7S4XCK3Ozr0ZPieA+U8E4t07jahxSB+CBxl9LvqxKucHydsFt8E7ytqk/Rbl1M1NbHgYag
	+OZmwDUTulQjuJ3tu/HsEW7Elu1SPWVkUdYYPYMxOzxncupS2oV7JORb2ZbKfNghu5KhTIHQEKj2s
	SJ9TeCHhKYpAKMnIRgzdch7A8w1/VmCIPUu75P7ZTORrnEAiTu11qNteVpCXXAIpCAAknUgjstwx7
	sUnq1iEwaf4EXMcO4j5pZ0hqsqakuu/ogdsaZm0jVyBLJWIn154QAtoNDynC+iicVsSuIt2/iVZiC
	GxRnHmg8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4WgC-0004Z7-Dv; Wed, 19 Feb 2020 21:14:48 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Wg9-0004Yo-8k
 for linux-riscv@lists.infradead.org; Wed, 19 Feb 2020 21:14:46 +0000
Received: by mail-pl1-x644.google.com with SMTP id g6so600149plt.2
 for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2020 13:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VKVfs6vZv3SQ2RrnXF5uFQP1/Hk2siSLvBq1d5qt0o4=;
 b=SN7ia8paDXSVGJb/cak2a/NQn4EmF3obbvd2/xOeVpV3LHiKovglVrFYCUdtltpJG3
 QLFj7g0pcy6WvGJDxUBHdHe71i5H8VTcT5N7ipuKzwiJvw3Xtk5nsqh7TWS7t5Ou2x2d
 6lJOKFI9vhoR2AE6dzXk1qZNEOA4Lkv9Ezs+FmCtJrc3eZrCng4BIdXUiwtBUY5Jdvt1
 Z7/7sVWzdKqYmsYvsfXyuFtaGShdcUeY0Cr4kODy5jR6+yX+D63rb7QmdGynjtIMLSZw
 ZIIdtGQiWKih+5taNfqfrd0dCW1YcDrNcit4tXuE6LdbPYUiwYYu08GWUv0kVh2NWlFD
 zRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VKVfs6vZv3SQ2RrnXF5uFQP1/Hk2siSLvBq1d5qt0o4=;
 b=jvsNWXuetdMzB23dYdI1YkjkivNLzIrH8IbXuFLZwzDCgHKYCwgUxxyWPf/3Ze1aus
 9OSCQfuFj+K2ZDkV3rokCK6SVLVxb9IimLPmlxRQOtpZtRopdIrWM/IbCRBttM6dDybF
 M1vFzzn+A8jfhIVLP5dstzPlOO5v9yER3SPUYw4pzKJiWgY2MHTYybklp/74Lq+VoLJO
 JtULkQIQfCB018Mbkoxa7E+oE5/3sn337e0L9ZL8DO2UL2Au3Ki+8kc+b6/jn3RObypM
 FchhSGWPg87q4Yk2KCDFDg3iILcpXRMzT6GqZRcLkhGHuAlg0zQP8RSfOEwrNphmTKMM
 nY+w==
X-Gm-Message-State: APjAAAWf/lQT1FfXxLnEB7gLXKDzkomvn9bm87lweBTL/DmUrSd9PyIG
 Z87y2bYsCCM7ZKu/vbMNWQVgth8XH7DTo9dOY4w=
X-Google-Smtp-Source: APXvYqw4bcorOQ4yV411CgINpFDrVaoFatUlZFe9w87+jxooicXnVuunZ6QgQ62bmrhZYDDH1KBXG6b0Lw/DRm1joEA=
X-Received: by 2002:a17:902:463:: with SMTP id
 90mr29190393ple.213.1582146884344; 
 Wed, 19 Feb 2020 13:14:44 -0800 (PST)
MIME-Version: 1.0
References: <CAHOvCC4y8x6_fBSAug3ecN+4QFiNJCooUt7Py9=J+NnBd4J8dQ@mail.gmail.com>
 <CH2PR13MB33684ED58B945BF678D508908C100@CH2PR13MB3368.namprd13.prod.outlook.com>
In-Reply-To: <CH2PR13MB33684ED58B945BF678D508908C100@CH2PR13MB3368.namprd13.prod.outlook.com>
From: JaeJoon Jung <rgbi3307@gmail.com>
Date: Thu, 20 Feb 2020 06:14:33 +0900
Message-ID: <CAHOvCC5EeHiB4wjhSoh2TikaGTDqzPEg3ZRRxpp1=sEUfV02Aw@mail.gmail.com>
Subject: Re: [bug report] GPIO & Hierarchy IRQ support for HiFive Unleashed
To: Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_131445_330981_B8AC86D4 
X-CRM114-Status: GOOD (  15.39  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Great, thanks!
I am interested in RISC-V and SiFive.
If I find another bug, I will report.
JaeJoon Jung.

On Wed, 19 Feb 2020 at 12:56, Yash Shah <yash.shah@sifive.com> wrote:
>
> > -----Original Message-----
> > From: JaeJoon Jung <rgbi3307@gmail.com>
> > Sent: 30 January 2020 21:47
> > To: Yash Shah <yash.shah@sifive.com>
> > Cc: linux-riscv <linux-riscv@lists.infradead.org>
> > Subject: [bug report] GPIO & Hierarchy IRQ support for HiFive Unleashed
> >
> > Hello Yash Shah,
> >
> > I am testing the your patch:
> > [PATCH v4 0/6] GPIO & Hierarchy IRQ support for HiFive Unleashed from
> > 2019-12-10 11:11 Yash Shah
> >
> > I found out that you repaired the generic GPIO using bgpio_init(...) API.
> > bgpio_init() has 9 parameters, and the last is flags.
> > The flag getting to bgpio_init() is must be BGPIOF_READ_OUTPUT_REG_SET.
> >
> > Because FU540 GPIOs have different input/output register, If GPIO direction
> > is input(SIFIVE_GPIO_INPUT_VAL), it must be read input
> > value(SIFIVE_GPIO_INPUT_EN).
> > If GPIO direction is output(SIFIVE_GPIO_OUTPUT_VAL), it must be read
> > output value(SIFIVE_GPIO_OUTPUT_EN).
> >
> > If The flag is 0, GPIO output value is being reset and the value is reading 0
> > always.
> >
> > diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c index
> > 23d5e22694d1..1de1af452fcb 100644
> > --- a/drivers/gpio/gpio-sifive.c
> > +++ b/drivers/gpio/gpio-sifive.c
> > @@ -206,7 +206,7 @@ static int sifive_gpio_probe(struct platform_device
> > *pdev)
> >                          NULL,
> >                          chip->base + SIFIVE_GPIO_OUTPUT_EN,
> >                          chip->base + SIFIVE_GPIO_INPUT_EN,
> > -                        0);
> > +                        BGPIOF_READ_OUTPUT_REG_SET);
> >         if (ret) {
> >                 dev_err(dev, "unable to init generic GPIO\n");
> >                 return ret;
> >
> > Yours,
> > JaeJoon Jung
>
> Thanks for the bug report. I will look into this and send a fix.
>
> - Yash

