Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006ACC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:13:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C64F20897
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:13:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WCXOiomj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/xYBWjJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C64F20897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zt2YHQRQd6s2M34olPgSQy/bM4tICDZOOXmF6xiqvjg=; b=WCXOiomjA5H8JsNc31hni4YeZ
	tygO3ezhQNzm6LLYYWWnuX3Jiaesl+0bklvvVCfCmoqAyW/7E9E9OGaE3ZJOKOafaY5zqectakM6G
	F4MhMq6HlqbZYkt/mM8qfo+WfaNgRLqjHSfGvHsHPw0vIu6ket+ZsPD0QuiYexNJvW77aeBITYiL6
	Zc5wA91L99iUDpZ342EC8jMyetP/i+qABcQS1iTGtNFWOR5ArYpotuOncgFbXfJkTEfsZX+/W/rR4
	IG0rBtc4bPZNyVvBdsa+ge815U7W7KuTM7lull5HrK3XV6F7OqBHgkaJOqpegAAzBl4z55uoA4yqT
	ev6sR72TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc8rQ-0001tz-HI; Mon, 09 Nov 2020 15:13:36 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc8rO-0001tD-CY
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 15:13:35 +0000
Received: by mail-pf1-x441.google.com with SMTP id c20so8438244pfr.8
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 07:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qHWsdF+9c9Znyw/+xmlrHFHZZNlg9caiciX5yI+PJqg=;
 b=h/xYBWjJerd+Nng65RxzaEks1xJhwINQyY9Kk84UP0ulcLuRhnmTobsVYl3EaoGFCr
 pmRS8cTieTCtPXnqRHSV81aivSlGEFes5pjpp+y+DAjSEjaETUwjo3t7vma6iGQpHtaA
 qr3Rn9lg5N9jeL+Hlgd6tevc5NbF3r5DuW9qEcUbSMWmIO/fU4BZwQndEgYRP4zocklU
 ZmgImOQ17grJhUCyvTmxMCR4ocfKILJSZMBwVVzqk1G/oTvwKehmO/xQB6rTtzYJHxxA
 46TfEl4s0YenH/OSsT0v8VTAoIXqo7BPVjX530QwGZRCIPobomB982/lQwc7wXvK3h1h
 zKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qHWsdF+9c9Znyw/+xmlrHFHZZNlg9caiciX5yI+PJqg=;
 b=BGo3TlMlE+ETuR2Tn3nUuNrBM4qnpdVd7vE9uc78dULhFhiMIee3etKMXxW0mDqjs8
 e+Xpx/5TKlC3+VyBv6UOK9fijF5XFtVc6qC3nmsRiHYwD59ESa2NdO9DpcdIU9HlaBc+
 VwkAP4jtYEHlpN2Q1i/P5T0hPdupXcEWMezSclVzh4C4oxfREOmEsjVIT6HEQk8I2Ubi
 +/DOo0o9CrjKxyYBHtmo5V12fiCumVvn8g8MOOBEkVHdsjLYybFKA9C3t62f0jK22hm3
 dLDhaBbBFuVGa9baa0eh/JmpUok7qLEKcvMSzNhAtI48btlULvkzcRKdNedgwFU1F+4I
 8Gdg==
X-Gm-Message-State: AOAM5326fdP+SK+xbYC0/aaT2zSBtArxcfwQvCbbSk2e/FqZheVPChXc
 ULC8m+L0dMrAesz7BDhM/Qa2fYQIPg5giRotg8g=
X-Google-Smtp-Source: ABdhPJzbzt1UYLvSnFqF0Z8uM3EiVS1ndggK5B8kpcpbTxvC1ovHRrCqnbQrmSaPrTMJIc851fa8tqkAO+ZtDX3BrV8=
X-Received: by 2002:a63:4511:: with SMTP id s17mr13179323pga.4.1604934812562; 
 Mon, 09 Nov 2020 07:13:32 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-2-damien.lemoal@wdc.com>
In-Reply-To: <20201107081420.60325-2-damien.lemoal@wdc.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2020 17:14:21 +0200
Message-ID: <CAHp75VfvUZ6h+JGCUQ65i7qFsugvbd3n=aCprgvp=geRSpQEhQ@mail.gmail.com>
Subject: Re: [PATCH 01/32] of: Fix property supplier parsing
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_101334_456188_D33BDBE0 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 7, 2020 at 10:14 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:

> @@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
>  DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> -DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")

Sorry, but the above doesn't sound right to me.
It's a generic code and you may imagine how many systems you broke by
this change.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
