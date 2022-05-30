Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D77C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 07:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LAVcP134ugpU1n0Re5QnrzX4zrscIz20S27K6NyKC4=; b=JWYoPm+RgA3UIS
	iwIHBEzfL8QJNiiUsKBB6g+19brof3aFUoW29r97exxkzXD6P/vitugEpA5KRG5dPeDYc1ylyDqHL
	ug/KU6NPA5V3So7v8AslKRBekptvfc3OjWeDfNyZw1mKho9nEquoHMMNxPHaixsPqdkXNotvfOyDV
	cXZ8yExQ5qCaC5MvhHdNJZDDPAMeyPi8WoNOoF/5fjFchAzvUu+IMD7RStozdSwPsFKT0k5FZiDWC
	OvpVOIbBDnVaB2n0T7hBdroNSrYqt0tAoid/NkwLpBsPvJOurV69hSBtvgY1mFXraAJxQGL0JWEUE
	xf0SS2vnAMtoajJGckrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvZV0-005eWW-B5; Mon, 30 May 2022 07:07:34 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvZUw-005eU5-Ht
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 07:07:32 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 40A7F1C0BAB; Mon, 30 May 2022 09:07:29 +0200 (CEST)
Date: Mon, 30 May 2022 09:07:28 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com,
	daire.mcnamara@microchip.com, lewis.hanly@microchip.com,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/2] rtc: Add driver for Microchip PolarFire SoC
Message-ID: <20220530070728.GH1363@bug>
References: <20220516082838.3717982-1-conor.dooley@microchip.com>
 <20220516082838.3717982-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220516082838.3717982-2-conor.dooley@microchip.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_000730_835331_FD413D62 
X-CRM114-Status: GOOD (  11.32  )
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

Hi!

> Add support for the built-in RTC on Microchip PolarFire SoC

> +#define CONTROL_UPLOAD_BIT	BIT(5)
> +#define CONTROL_DOWNLOAD_BIT	BIT(6)
> +#define CONTROL_DOWNLOAD_BIT	BIT(6)
> +#define CONTROL_WAKEUP_CLR_BIT	BIT(8)

Dup?

> +static void mpfs_rtc_start(struct mpfs_rtc_dev *rtcdev)
> +{
> +	u32 ctrl;
> +
> +	ctrl = readl(rtcdev->base + CONTROL_REG);
> +	ctrl &= ~(CONTROL_STOP_BIT | CONTROL_START_BIT);
> +	ctrl |= CONTROL_START_BIT;
> +	writel(ctrl, rtcdev->base + CONTROL_REG);
> +}

You don't need to clear bit just to set it.

> +	do {
> +		prog = readl(rtcdev->base + CONTROL_REG);
> +		prog &= CONTROL_UPLOAD_BIT;
> +	} while (prog);

Limit to XY iterations?

> +
> +static int mpfs_rtc_readalarm(struct device *dev, struct rtc_wkalrm *alrm)
> +{
> +	u32 mode = readl(rtcdev->base + MODE_REG);
> +	u64 time;
> +
> +	mode = readl(rtcdev->base + MODE_REG);

Dup?

> + if (mode & MODE_WAKE_EN) + alrm->enabled = true; + else + alrm->enabled = false; + 

enabled = ()?

Best regards,
										Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
