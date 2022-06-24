Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5C1C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 19:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I022/7NdbB6RQtWZshdGS3CYXpbeLRAot34eS6iOhnA=; b=DgNiGBDx4fQT+0
	8UkNkWZdzyAQREgJNsPJj1YcNzEzegdHSCMzcYK34e+rtzMweF2zC9eW5DHaTtDpGJ7EzfFEGK+5N
	lePF+kL/cif72Mw84Lf8hbcU483XZHDNaaT4xqGMKrXRDxQDBH4a7qJ4aiX5AcVSqq/ZXq9nE6Nl5
	o9hhP1vvHDSpWyP/W+NaTCKxbFnd2RDfbt1dWOv4rG+UjBrcXzM73166ynPmuMjyJ38gB8Ctjav+a
	3U9ZNhWweDDMiMhA1oc9j/pwrpYI9X0H3yVF89B32Ea9LjS7gIcYL8yqztnmCMDrLiimuRaIcD2dt
	qNytTP7Mb1lzdzKtgYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4ox1-003d0m-MZ; Fri, 24 Jun 2022 19:26:43 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4owz-003czG-4W
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 19:26:42 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4C0AC100007;
	Fri, 24 Jun 2022 19:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656098798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oCsyFgTXZ2+6MS9SQR2SFiEyjV3pfsnA6bTV48U0IZQ=;
	b=GfoV+du9giy0BapImzO9HFE0YVlIMyChKTbjNuc7pBxFyj+9l6w8AxdB6Mt4/jyVV8Mexw
	PX4+27+/I2oRrV3zeBht9Aua1ip/TMlFSlZINpetguPCwzWZ6QOzLLDjDZpgqZMluXmz44
	S/QqA8a0noIXMRjvTZiSdRRTPmlEs0L9JbrXbA6pwpMuy/uLkeRdkzleeCxKUF8Av3PP8e
	hPheVbb9jfteazjHQ62d5TCbUGkWHzhM4XKTPq/I/Z2qK6PLW9ACKATqPY7sfYHVO9CceF
	zgCrLolU/CGjjqoyMXVw8EGO2kKfqTrLkF+VVWHvl458LY2ZpoOs0ellhdzm7g==
Date: Fri, 24 Jun 2022 21:26:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: a.zummo@towertech.it, conor.dooley@microchip.com
Cc: daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org, lewis.hanly@microchip.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] rtc: microchip: Add driver for PolarFire SoC
Message-ID: <165609877582.32831.3964876505949828769.b4-ty@bootlin.com>
References: <20220601123320.2861043-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220601123320.2861043-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_122641_379895_41A78E14 
X-CRM114-Status: GOOD (  12.43  )
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

On Wed, 1 Jun 2022 13:33:19 +0100, Conor Dooley wrote:
> Hey all,
> This is technically a v5 of [0], although a fair bit of time has
> passed since then. In the meantime I upstreamed the dt-binding, which
> was in the v1, and this patch depends on the fixes to the dt-binding
> and device tree etc which landed in v5.18-rc5.
> 
> The driver is quite substantially rewritten from the v1, as you wanted
> it to be switched to "binary" rather than calendar mode - so hopefully I
> have satisfied your concerns with the original driver. Specifically you
> had an significant issue with the counter being reset on startup & that
> is no longer the case.
> 
> [...]

Applied, thanks!

[1/2] rtc: Add driver for Microchip PolarFire SoC
      commit: 0b31d703598dc1993867597bbd45e87d824fc427
[2/2] MAINTAINERS: add PolarFire SoC's RTC
      commit: 1bdb08c180e8556d3d4cef844ea0f0bae79bb95d

Best regards,
-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
