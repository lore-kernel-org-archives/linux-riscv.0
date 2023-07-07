Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E78EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 08:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w08tCN5s/YTXCIeCzVRjUrAEo4VnSxkYCdUnx66W/h4=; b=PMRITFuezdjUsh
	XGAa9PFqMStN6m6AO8wbK7AvhpxIXYwxSYmdedxjstjXER717oLIbpbbbgNegZK6D8c2Jo4WMFSpW
	dDMhOrpttCHGBn0sQu3kJX4HKx/piRwmcCOLpTM1TiW+zCMyY4oKhYS0GmBFDl7qYlTa6DsUBUgpc
	5Nu/WXDTiyAkk1rzMkqlB7s7hYRGsBZAcPNXe0Sd5Jc09QtkysyVtMOOM+CsdSjV+aKczsWaWNOd4
	obgZ9wb+s5v2BJF3zgpAGU2PZvnBkHnQ1tc+CFn3GETo/rUK809zHshFE7l2CXnteZ/BwgO8D/Lcn
	f0cNa/ROQrXeG0kcOo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHggW-003xr2-2O;
	Fri, 07 Jul 2023 08:19:24 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHggT-003xpU-2y
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 08:19:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qHgg8-0000hE-1u; Fri, 07 Jul 2023 10:19:00 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qHgg5-00Cgor-M5; Fri, 07 Jul 2023 10:18:57 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qHgg5-0002o2-13;
	Fri, 07 Jul 2023 10:18:57 +0200
Message-ID: <38ffed42bb021ea75bc662edd943a8e4ca92172b.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Aleksandr Shubin <privatesub2@gmail.com>, linux-kernel@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,  linux-riscv@lists.infradead.org
Date: Fri, 07 Jul 2023 10:18:57 +0200
In-Reply-To: <20230627082334.1253020-3-privatesub2@gmail.com>
References: <20230627082334.1253020-1-privatesub2@gmail.com>
	 <20230627082334.1253020-3-privatesub2@gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_011921_980871_1A441B59 
X-CRM114-Status: UNSURE (   7.28  )
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

On Di, 2023-06-27 at 11:23 +0300, Aleksandr Shubin wrote:
[...]
> +static int sun20i_pwm_probe(struct platform_device *pdev)
> +{
[...]
> +	sun20i_chip->rst = devm_reset_control_get(&pdev->dev, NULL);

Please use devm_reset_control_get_exclusive() directly.

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
