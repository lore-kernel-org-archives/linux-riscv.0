Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283EEC2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 08:43:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 982CD2073C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 08:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FGIbXUwX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lN5cc08a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 982CD2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nx4ON9oq64H8sY8lxiW1dqBAIdwZOFGBS1pIR+EAtMU=; b=FGIbXUwXwIShKXp/zURtGIoNw
	xSu8SkW3K4JpwO2QFpc2ngOeH1MfJkFmM0lBJtTFO7jflvs01o/+KPeopj8pQtB58Os9VY/suHVtD
	cNoOyP2kslSXXYzdlX4UMd5UaFMbiA5ynSoAht5Yt2JK6SJ0S5xVg/B9lcNTWyHjhg/f7ZBjrMjzo
	ml3Pm0zpxPI2GSRtEjDFTfjT1MHY3a7hZrxRfNV0UGnUhZ2wyADiOx5rtOTO4fRRBGs8b5nO+hbLA
	1pqHnQpoSmm/i1aqF3GPYaxhZPfvJj2rb0e+i64Pzd0JJVxCFJmrwZvzWejIt7glXJEI11itzTmyx
	wkXUwqAXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khTvP-0005Xi-Fy; Tue, 24 Nov 2020 08:43:47 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khTvK-0005Vt-9j
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 08:43:45 +0000
Received: by mail-lf1-x142.google.com with SMTP id u19so27744590lfr.7
 for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2020 00:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AaOgVY3DT0axuPXm6Wf+nM+h8FcaH7ypPyzww8UGHiA=;
 b=lN5cc08a6CagxJpTMEus4nk8yN3LrNsf+6Fb1xG5jouQm5lQ9g0JNVT3AHjCbW1gGc
 QZkNd5wSRX8H/RmI0c/v09Ybd/WNDgtW0kdaD+AgYuFVr8nmG3xf0OnUfQYzhIUoBqcJ
 58A6Es0AU2RwJdzQ6Orj1gQLa5+/TmY8nOPDyKFDS6qPBMf+VEf8q37y8s87PeJ3/zaX
 iw6Pk8tGJZ7z6d1jfUBwNgdYEpQALn309O3FCy8sp9marTgkYzjLRqK8dVeMeCFJLX35
 PROf7S91HkoVlyMjJfFPWGroDxuBaltHv6OTVKyUJDYOEXywsQ1ze9tfB76Oh+0Q260U
 c9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AaOgVY3DT0axuPXm6Wf+nM+h8FcaH7ypPyzww8UGHiA=;
 b=rP2cQq0SjbzKkpuyX9s9FBhIbtHNJPSkDq1dZiSldwjgj5zWQkHs9XaxDVgNohEGEY
 4aeZg+zb+x+HYObCP7uM/DpLlp6FhyS4zQJsSU+3MOvzH3COIFh2XAA+EoHCvOOKU6u2
 dr/yGKIToFLCIqXmkHBG4ecuR52j9CEmmf6h8PGsv/NN6B319Fdjh/gn9QhfxjhIFNeM
 PAs1R+aWltXLV7Wmm/NkGQc3tmlqtETW7AY7RJ8p1fZ8OCBsIZRgmG58Lfw5VPPzNMQ0
 VEDefa9Qx9hPgaZwld9S2jdEg0LTuReLMvQ94DJYvrlbS+9BfxFNbBgl3UQgTXE5dRZJ
 H2MQ==
X-Gm-Message-State: AOAM530dc/aE8x7mW0sXUkdTu3wwVclc9zjyYSYSBeKwY+DoWSR6xkFj
 bJswOamMG9yTdL3713o+D5dfP0HI2tIQnKpsN5TJ5g==
X-Google-Smtp-Source: ABdhPJwfslqVfk1bAlpxvLALOaiPyZkEzCXcFjklOgHwERbpK3OuBSxE/8+9JiCpkPggMPoqlydmwwG1XchrhzX2p5A=
X-Received: by 2002:a19:8686:: with SMTP id i128mr1245870lfd.333.1606207420757; 
 Tue, 24 Nov 2020 00:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-21-damien.lemoal@wdc.com>
In-Reply-To: <20201107081420.60325-21-damien.lemoal@wdc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Nov 2020 09:43:30 +0100
Message-ID: <CACRpkdZhOxz5NhrkFxZ5G4aOrmBoAcQodOvqzNROQtXpHVQGDQ@mail.gmail.com>
Subject: Re: [PATCH 20/32] riscv: Add Kendryte K210 FPIOA pinctrl driver
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_034342_428781_DED8EDC9 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
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

On Sat, Nov 7, 2020 at 9:15 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:

> Add the pinctrl-k210.c pinctrl driver for the Kendryte K210 FPIOA
> (fully programmable IO array) to allow configuring the SoC pin
> functions. The K210 has 48 programmable pins which can take any of 256
> possible functions.
>
> This patch is inspired from the k210 pinctrl driver for the u-boot
> project and contains many direct contributions from Sean Anderson.
>
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

The kernel build robot is complaining about this patch so I'm waiting for
a new version.

Would also be nice if the maintainer could add some comments?

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
