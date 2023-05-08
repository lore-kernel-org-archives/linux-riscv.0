Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D5BC77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 03:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLpUF6S67Dh5fykQYsUUUBPiHTClQowW6aIBWtwmSHI=; b=BRGwa2z4NsG6f1
	ga71HUU8e8bgfRRB5aey00DvF23E88N7r8PJ3EtZvd8hn74sN/xZc8G6DKCuTeiwZ3yDt0tw53n3Z
	5Hqx8b3qkPgDVlDgdKJPpMHD5RhkmFCRlpgOcTrJduiQ028UdIaTFArgosW4aX801bCpGEFXx1sU7
	XhN9r262BUDwJj9vyNvMcqVXe6ACB5+GBnFqpZ131gCwI5krK/Rlh/E384AFk80YIquZIw4VCuc/2
	jfsnthi9u3WZNJnAHZQnCXRkYleMQq0mQOo+LcICcbOnztlDfrCV30sgyOdP0dN0KLpsMwBN/SM/g
	108rBBNh5A6RhacAdf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvroP-00H8sP-1p;
	Mon, 08 May 2023 03:45:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvroL-00H8qP-0e;
	Mon, 08 May 2023 03:45:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18DA361509;
	Mon,  8 May 2023 03:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D52DC4339B;
	Mon,  8 May 2023 03:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683517514;
	bh=V4OaoyYAS7xhFvpJhr4hI+GeBny+xjgc2/oaHMDC0JI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G/EwPAno7Zgs9szrsNpzjupe/h0bi/RZ5rZEC6T8AuzSUlH/7WUy/K9Y1Ut000k7q
	 WeYo1PokpcMmOaXBTL2L9zuzL3qrK5x5iUtJ9bqDkpUARCgrEk8V6Up4JQRQ8pDMLr
	 6WT+qCsz1tWzVRPOXwMs5zg/id4fcCZxHMvMVcjTLy2NmeZ4It38uuCVuMr14031j2
	 a5z/PzyIY5v7/OgtWPZ7btudIj3lXIAYsjIBPWj7+XsWQaicOiRZien+gQoa9TOYko
	 dDqaMBtst2eaeGbhm9FA0CKbBCQvnv/5PI4kaZ3ozIkk6py5BUeFovecfpNBBrCcHh
	 LRxRJu1TEtdDQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3ADA2E26D20;
	Mon,  8 May 2023 03:45:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 00/41] rtc: Convert to platform remove callback returning void
From: patchwork-bot+chrome-platform@kernel.org
Message-Id:  <168351751423.5651.18106995341642882418.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 03:45:14 +0000
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 linus.walleij@linaro.org, nicolas.ferre@microchip.com,
 claudiu.beznea@microchip.com, f.fainelli@gmail.com, bleung@chromium.org,
 kumba@gentoo.org, ulli.kroll@googlemail.com, vz@mleia.com,
 cw00.choi@samsung.com, krzysztof.kozlowski@linaro.org,
 conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 eddie.huang@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 miquel.raynal@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, vincent.sunplus@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, groeck@chromium.org,
 chrome-platform@lists.linux.dev, linux-riscv@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, patches@opensource.cirrus.com,
 kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_204517_315901_D2C13AC7 
X-CRM114-Status: GOOD (  12.48  )
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

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Sat,  4 Mar 2023 14:29:47 +0100 you wrote:
> Hello,
> 
> this patch series adapts the platform drivers below drivers/rtc to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.
> 
> [...]

Here is the summary with links:
  - [10/41] rtc: cros-ec: Convert to platform remove callback returning void
    https://git.kernel.org/chrome-platform/c/0d8742e61098

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
