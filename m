Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE23CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 18:40:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A03F7610CE
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 18:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A03F7610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6f3xUzD45HOZHvdUcPTGp3+7hldqaiTeMvaTQb61OaI=; b=A7fJxOri8VT/cb
	tSvRxqaQklTAV9xHKaOLXFdRbQQ2HruyojwteWKsUZVT2FDOglxGdxvltor5X3HJqKwn6PFyPcTUY
	9581nCjgrW7hy9Rzpl29NIdG5jzub8Ir8VFnP7z9HV37prGfeo+gTMv782I1BBBGXcw5Rp11027+k
	xjpzFxkoHNijJfR9kxUvaXsIV1h7ay+NGI7ZdussftkptktABVNWMdSY+pHJcxYJI9DXcSS0X9Tlo
	0XldWcOh+gVomUR32k+LP1lfVEc24Tr9mC0IpGLOB3G1q/UBXnbR8bt2fhxso8c7sB0lKaoNe3/2v
	x86xWWcv5Sm1FsPQVpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1majAM-000Jiz-8l; Wed, 13 Oct 2021 18:39:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1majAJ-000Ji2-5G
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 18:39:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 464F7610CE;
 Wed, 13 Oct 2021 18:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634150386;
 bh=MYmDHzJwPEJExLNeuOeTzwZwoQrh0px0zzcEL82qFSI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=aJIk7eMpMBRaG0bBdQfELLWRZ6Ukw1HNhei7KJ/CMaWjMZjuKdi4T0Tx/gPR+2Zrs
 yO4yOyNBvJnHUsaMkmHKxygt/0OEbGGgx3hsaf7DIDm+/j8JnoOum1wKdUw5E2jukO
 iRrRyWH+dtcGKkzC4l/slVj3ivX2GvpFT5SP2b52qB8fzpEbg7hf+7oYyjAT2JULPe
 ujetj2YMxC7FAL4syv1LbNL5hcbbWQ9QLS5eh4h2X6qDajL0E0THAapaLCS7ArVyyt
 PJ94Yio6uEao94UXFMfWcbEfor5X8zjyT/dwdlAS4pVg1nxzbyhnuIZCQ85raJ3nJh
 pM6oy5hIu+xpQ==
MIME-Version: 1.0
In-Reply-To: <20211012134027.684712-5-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-5-kernel@esmil.dk>
Subject: Re: [PATCH v1 04/16] dt-bindings: clock: starfive: Add JH7100 clock
 definitions
From: Stephen Boyd <sboyd@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Matteo Croce <mcroce@microsoft.com>, linux-kernel@vger.kernel.org
To: Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Date: Wed, 13 Oct 2021 11:39:44 -0700
Message-ID: <163415038497.936110.9558001474390705865@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_113947_242119_330F167B 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
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

Quoting Emil Renner Berthing (2021-10-12 06:40:15)
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Add all clock outputs for the StarFive JH7100 clock generator.
> 
> Based on work by Ahmad Fatoum for Barebox, with "JH7100_" prefixes added
> to all definitions.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

You need to add your Signed-off-by here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
