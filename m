Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70999C52D6F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 01:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=294bsneq6LVUbLr0r6qZL8alFq3WTkqlmB9IIuzewZg=; b=tQlEk6QosuDwVU
	r4ssY4IrQVyG/RLOLZYr8FsJqEQLBKnwkUn1T35zBJWGHAm1uqvJ9bW7Eeta9KY4WIUwiEzBMxhm6
	yti+nFebzbeKIqgqbi+59zNgQyGbpBn6IAQEtqzhcTZsdpyuzxwiYtzGoSIu+c4E867T3gbLRxx5M
	hfpqfY58FUYpM7Iqql1Dw9bLY0xYFvJC8x8ydHgLuLxM3mSUBDPqlMZCqtDF/vweTjoPDpe3RWSrO
	MRJuotfnF8kS+21pM/O9dMXrSHEUxt9nbKprfaDCriMnKa8bJihYc1DwE0QvCFpiyz+NB7GhpLjxV
	w4FCUP40x4u7CFzh8BWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwvw-0000000B0L6-0HD9;
	Thu, 22 Aug 2024 01:48:16 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwoF-0000000Az10-0CzG;
	Thu, 22 Aug 2024 01:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724290814;
	bh=0jpArWCYnQmFmqTNGxh5siqbEOIWInHJT4VyT0QJLDc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ja6jB0O2QLOuAABXTmnQYX69qJ/KZCKkgm1JhaCsUdPQAIvGXLS8po2ggQyPQ0H8Z
	 R80fD7MSrsEUs7cYcdsj0VPoEjeN3RjDMOzI1AuA3Wmxd3KYOUalGcQPsnQtFKInel
	 JA0feAUU1yZS+gJps+ZzgBkg51PVe+TDYzGaDe39JdTWJdPLZNFVe25ovcCKpDX3Qe
	 27u1pkF2veJ2E2Kzigy10dm+SWOHwFDMLfbXL6pDg1DUuu5z6WUjpSp5AfNcJ0WpHL
	 J6hrURu/OUxOGpU9835BNX/U+knk/GsbAqDrJ7FXriQI2KXwiUP5BLjJ03zcklJjiJ
	 fMK4XiL2v5jpw==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B20A264FDD;
	Thu, 22 Aug 2024 09:40:11 +0800 (AWST)
Message-ID: <98e7dd9ec454c1a8156ae74fe17ded7384dbe799.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/5] usb: aspeed_udc: Use devm_clk_get_enabled() helpers
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Lei Liu <liulei.rjpt@vivo.com>, Neal Liu <neal_liu@aspeedtech.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>,
 Daniel Mack <daniel@zonque.org>,  Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Conor
 Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>,  Bin Liu <b-liu@ti.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Cc: opensource.kernel@vivo.com
Date: Thu, 22 Aug 2024 11:10:11 +0930
In-Reply-To: <20240821121048.31566-2-liulei.rjpt@vivo.com>
References: <20240821121048.31566-1-liulei.rjpt@vivo.com>
	 <20240821121048.31566-2-liulei.rjpt@vivo.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_184019_351628_FA61C52C 
X-CRM114-Status: UNSURE (   7.26  )
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

On Wed, 2024-08-21 at 20:10 +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().
> 
> Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
