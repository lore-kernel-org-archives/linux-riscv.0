Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6B6C5DF85
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 16:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQmmFNa8AislJLcfOUYyfLv/WhoFCHOXG9jD5lOhfbY=; b=0vvR4x/Ky5p0xr
	3NbmWwxIy0XlMEW5ginN2LAvF1Nau/TMSBMwPvgRvuL64Zp/qgxbGXy3N/NE7aRxfKVVyqTsOei3E
	5KFT6UFAulNoGZ1mdrVFoYxZsNR+oJB0nPipjC1O/6YtGf6cAVCS6T8/Yi3/kMzKWl6rpT46oRVZp
	/OPPdokMTJcY5T7JIuxxeuWaFkREUQC84By0yvLv7k/8clbM163RlAyrqNZ5FRckfvpXQd0leGVyS
	ubNUTwzsPAwmXFis+NHCd/J6Rsli7SgejLLWnK+mSFbzQq7qrBcRPhUXYsqFDbNxrrzib2wl4nJJ5
	bNtb5o94J06W4FirsvDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjAa-0000000ABK6-26eq;
	Wed, 19 Aug 2026 16:29:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjAW-0000000ABJa-1heJ
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 16:29:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2A14D1A173C;
	Wed, 19 Aug 2026 16:29:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1AB25FF42;
	Wed, 19 Aug 2026 16:29:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75DD211C75909;
	Wed, 19 Aug 2026 18:29:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787156968; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=dA/9EZ9q53klXGxSMo1BE6kAbWq3qo7qffJ+f8rPyrY=;
	b=vW9kfX3tJSa4RM6w2+LuBmB03C7AuJy0pJfGTXDfgiKx4YLzGSSGKzSJ3ahMWzO/Ii9qUT
	h+xqWhkvcM4XV4hNxWZ/6MWHEV7JikuGagdGpJ9lSZLSdJcpJNAkneKh+pqrWAqEuEwyFu
	6TRr1MVf/NVKtvzfyix9EBaPI+u6h1/w/WvfYTgyXiXI1+SGmF8NAWAgREa4A+csCGSYTZ
	lEGvl5HDRSy9b7Zp8ppHPVriCHByMBmP1ZmuId4GSYG2qTZIRr/Z1X32/huTYcvvQH4ERW
	+WHVk3TZ6FFyVjUHDd94OE52JctQ+vdphM2KdrczT2UbBL9hGW0QB+xlQ/dOxQ==
Date: Wed, 19 Aug 2026 18:29:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: dlan@kernel.org, elder@riscstar.com, kr494167@gmail.com
Cc: linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: spacemit: handle regmap_test_bits() error return
Message-ID: <178715693830.130787.3002190547423884283.b4-ty@b4>
References: <20260724135803.81223-1-kr494167@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260724135803.81223-1-kr494167@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_092936_602721_C0A06244 
X-CRM114-Status: UNSURE (   8.87  )
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

On Fri, 24 Jul 2026 19:28:03 +0530, kr494167@gmail.com wrote:
> p1_rtc_read_time() called if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
> to check if the RTC was enabled.
> 
> regmap_test_bits() returns 1 if the bit is set, 0 if not set, and a
> negative error code (e.g. -EIO) if reading the control register fails.
> Using !regmap_test_bits(...) evaluates a negative error code as boolean
> false, causing I2C/regmap read failures to be ignored and incorrectly
> proceeding to read time registers from a failing device.
> 
> [...]

Applied, thanks!

[1/1] rtc: spacemit: handle regmap_test_bits() error return
      https://git.kernel.org/abelloni/c/092755367e1a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
