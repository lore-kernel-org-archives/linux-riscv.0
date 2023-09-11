Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B45DC71153
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 04:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7mNkAiGavoVXmz8cp7sj1IzRX8/XgqorSA9Rgdo97M=; b=N+oOV7BbqemEny
	3TKghf3heSGJuhSmhj2v8Y/C1J1sSe2IGBbp0nQ2C025uqfs/Dl8gSvDgJimHgFsIGV9MC0LHZkYC
	7+qNTKWRO5msyPXpRtybOQM7DEdLbatABtIioeXR7sSyTiqjmrfZbxfdiDlpc+OoBhQz70XLOytzG
	mLV5iuRYm2FTc4NxbE41H9vkGgKHWvSA/MaligLOxUYR7WNfSAG4bNV5ojLT1JUb0nlJV7yEo3LyI
	pQcpvB2iwes/yySmK58ohrWg45Y5HEbWzSkOXPo5LylDQ1Jgfkkz/T32o7J6OGyqZqrrjMcub+DX+
	u7z6ljVF1ChrEX5a1aTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfYaW-00HDYB-25;
	Mon, 11 Sep 2023 04:31:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfYaP-00HDUj-1P;
	Mon, 11 Sep 2023 04:31:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6475CB80DDA;
	Mon, 11 Sep 2023 04:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3979EC433CD;
	Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694406700;
	bh=UepKFV/RYGBvPBdow3H0Kx6KiHwRlGChrZoa/xUHr6g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Lx9qX2N10++hfk0wbyInOwoEda8jSGtqfzDaHtPIys4N4GqOlzXvSj7ZhwEsFwyjP
	 AimXb0YGhDW4drnaLrnbf8UMfhOekC4fGjyHacUpPHDyv0ZMzDpwmJ5A7RUESvaADn
	 Mj2iLEs4vjYOUqwD3I8CcZnH/7J9O4E7P2du8TO3vLhgQbUtZwYzQd06/+2LSLbBQT
	 KYImvYc3MFKWvSynXJO5OdsTPq+bUXjgH3yO5+o2Lf1M3fqRA4r/LBDqYuWkDrRQgY
	 O7xANpP+sYrQvi3iinG7eOcBBQ0subiQgFVVUOpe9J+2pnElyGSQoWdZ10uk/3z9uU
	 EPN5NdbrqvX1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 23B43E1F67F;
	Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 00/10] pwm: Constistenly name pwm_chip variables "chip"
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <169440670014.22573.14581572371535756981.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 04:31:40 +0000
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: thierry.reding@gmail.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
 florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
 bleung@chromium.org, heiko@sntech.de, palmer@dabbelt.com,
 paul.walmsley@sifive.com, michael@walle.cc, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, linux-pwm@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, groeck@chromium.org,
 chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_213145_638405_74005A46 
X-CRM114-Status: UNSURE (   9.27  )
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

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Thierry Reding <thierry.reding@gmail.com>:

On Fri, 14 Jul 2023 22:56:13 +0200 you wrote:
> while working on an extension for the pwm framework, I noticed that some
> drivers and even the core only nearly consistently named all variables
> and struct members holding a pointer to a struct pwm_chip "chip":
> 
> $ git grep -Pho 'struct pwm_chip \**[a-z0-9_]+(*nla:[\(a-z0-9_])' v6.5-rc1 | sort | uniq -c | sort -n
>       1 struct pwm_chip *pwm
>       1 struct pwm_chip pwm
>       1 struct pwm_chip pwm_chip
>       2 struct pwm_chip *_chip
>       4 struct pwm_chip *c
>       8 struct pwm_chip *pc
>      57 struct pwm_chip chip
>     358 struct pwm_chip *chip
> 
> [...]

Here is the summary with links:
  - [05/10] pwm: cros-ec: Consistenly name pwm_chip variables "chip"
    https://git.kernel.org/chrome-platform/c/5996cdf132da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
