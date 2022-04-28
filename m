Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D45C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 07:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=exe+lWuCm+/JKd44TVoV1pzpW50APH68Ej8F7d/nHoM=; b=Qu0MrdkxBatELH
	/96gjUiWsYVqo/e+rbkzWWV1Aa4PJpidj8WdPp1Ro1CWzBl/NcCMVoO27SaytphP2DroZv3/gcjra
	vmSH4MW5rZGMeij9EgdoMuZNY1fLfk6erLiVzyFI2XdKvgBVt2xmHQmpDjUK7a+Kvww5YiUZvZ6zu
	2q8l1QO7X+0dd/uZnSmKASXfLdqAoUrchGxJiVuJuUmjg/R4qEn6Oilgz71rHyDFrZrd0CMuUCnq9
	8lqwg7aIxU7SDgsgSXX+AO1x8x/Q5H+ru7H0Kb2bUmums84785EAguiUDoWeTyhdF+2o6mnggWDR1
	OdEj4isXOBPmJhiTZAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njyp4-005Ipq-Hb; Thu, 28 Apr 2022 07:44:22 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njyp2-005Ip6-Lt
 for linux-riscv@lists.infradead.org; Thu, 28 Apr 2022 07:44:21 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1njyol-0002pJ-Gl; Thu, 28 Apr 2022 09:44:03 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1njyoj-005iCw-PE; Thu, 28 Apr 2022 09:44:00 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1njyoh-0002VQ-OH; Thu, 28 Apr 2022 09:43:59 +0200
Message-ID: <23757fe6843e56b91a87d60eb0782ec6b64c10fd.camel@pengutronix.de>
Subject: Re: [PATCH 2/5] iommu/sun50i: Support variants without an external
 reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Date: Thu, 28 Apr 2022 09:43:59 +0200
In-Reply-To: <20220428010401.11323-3-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org>
 <20220428010401.11323-3-samuel@sholland.org>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_004420_753585_C61B8DB9 
X-CRM114-Status: UNSURE (   9.32  )
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

Hi Samuel,

On Mi, 2022-04-27 at 20:03 -0500, Samuel Holland wrote:
> The IOMMU in the Allwinner D1 SoC does not have an external reset line.
> 
> Only attempt to get the reset on hardware variants which should have one
> according to the binding. And switch from the deprecated function to the
> explicit "exclusive" variant.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
