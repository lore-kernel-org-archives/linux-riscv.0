Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CD2C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 16:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1SQZ0mduMDB6NGSTOenSu7Qy2tPJVuV/f2T+uPIAWc=; b=aegfMw0H7NSzmm
	YL99DQNotV/oJMfxTELFj0HOMk4dMJEodqur7yzWk82B9jNarH+F9Yhy4tEUbZiz8j+IlndzhxE1o
	VeMVnenlz/mHNNPg68HQsq8ufk7BwIfBSClNMjdVCWtJd4qPC5zDGRdhOOfNubtC+ifRt5nuGo2LQ
	KdcJQhTn/+WCH/G3q7Uf/jsUoLjyMhoRX1N63uJ1nCDEXWOGqDSXIyzPCOZ3dzDYN+yNNc5OxX1YO
	sSA4nXO6Hx36+iPAr8I8Ji0dphj6a8zsafwibKtF2ZRZadyLJI3D/B8a6DBxxzMEecy/MevyKOMW0
	jrXTYIo20QfaR9aBpOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8PXr-009miD-HQ; Fri, 14 Jan 2022 16:35:19 +0000
Received: from mail-4018.proton.ch ([185.70.40.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8PXo-009mgl-25
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 16:35:17 +0000
Date: Fri, 14 Jan 2022 16:35:10 +0000
Authentication-Results: mail-4018.proton.ch; dkim=none
To: conor.dooley@microchip.com
From: conor dooley <mail@conchuod.ie>
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 broonie@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
 bin.meng@windriver.com, heiko@sntech.de, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com, atishp@rivosinc.com
Subject: Re: [PATCH v3 14/15] riscv: dts: microchip: add new peripherals to
 icicle kit device tree
Message-ID: <6vH-XrwcUvrBsf_iYIhoEE2BQluly7BTbPn097cV0fh2zo4xKmjsmf8__RoEQWL4XWXOddP8K9kPwpsqbHHPTqhrZbpQw4pl7DXp88MlQqI=@conchuod.ie>
In-Reply-To: <20220114151727.2319915-15-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
 <20220114151727.2319915-15-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_083516_284978_88E927CD 
X-CRM114-Status: UNSURE (   6.12  )
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
Reply-To: conor dooley <mail@conchuod.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add new peripherals to the MPFS, and enable them in the Icicle kit
> device tree:
>
> 2x SPI, QSPI, 3x GPIO, 2x I2C, Real Time Counter, PCIE controller,
> USB host & system controller.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../microchip/microchip-mpfs-icicle-kit.dts   |  53 ++++++
>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 168 ++++++++++++++++++
>  2 files changed, 221 insertions(+)
>
realised i forgot to run checkpatch, will fix the trailing whitespace

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
