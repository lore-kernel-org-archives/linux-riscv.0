Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025F3C71153
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 04:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6YgNLkusKcxP6QBRSdiTUcHkoDPWm2+dw5rjwgMjTQ=; b=MlqEJqZi/YTlUi
	JAutVak+H/PRGPlfPSSZ9RCaSznQHwisEny8QGonm7v2B3WfeYz270pya2+Ri/28bUoEdBSXLtF2B
	rsNK7uaqiq969HcsQDs8dGpd8H11tZc9l3x4VU89IyXnaAgCYMvybUwqfJf4n8fVycGxNH1PnHnk6
	O8qXGmlXZgAZxK+J6kBtE8Jx7jELzB6qKW4x/+kDE2+MbAUiPllmrCFHURBrOYP8hxW9rwq3Yqoqe
	VW3zM03spie7fV6mkSfzzHsMCV2B+8BaKPFpWhrhATOySbcDEWciRIuaE0LnyMDp6bGuE8LoN8N/a
	hU6XdmbqZXS1bZb1ut7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfYrD-00HEkZ-1n;
	Mon, 11 Sep 2023 04:49:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfYr9-00HEjW-33;
	Mon, 11 Sep 2023 04:49:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B93E560F1D;
	Mon, 11 Sep 2023 04:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AC93C433CD;
	Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694407740;
	bh=B+BA/wventHVJsSezWS2OunhdTGAZAZ+4bFsflnSOAY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Z3zrXwT/q/hreCYxPS2EE70ljquRd84Fah9X6JkVO3NxaC9eDkqnJ4VHWw85v5dmT
	 Stotx/y+10r9bDYbshfInvSGWR8w7PxzWsKks/sIqhqc5ZnyVhbcF6AIQulFwrvMpj
	 DlsYPOQ605oic6i5NjHH///uQZIeo95OJe7AsQtDoleQvzpeIQUiPTcplU8/M6qBpd
	 D948Mv/Y1Y81wEQjMlHTjxT97AgBOwfgAjXS5VoAL/eqyJJC8pmmM1wcupo+BqB16h
	 A7zeLFelWhnQNvY+B64ILh3nvysOgtbYDft4kq/HRFHPVAyQVvdHxynMtFHIBdDHPn
	 B2BdLJUcHuAxQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 31C47E1F67F;
	Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 00/10] pwm: Constistenly name pwm_chip variables "chip"
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <169440774020.22573.10062500641878947449.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 04:49:00 +0000
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
X-CRM114-CacheID: sfid-20230910_214904_070265_1C41A078 
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

This patch was applied to chrome-platform/linux.git (for-next)
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
