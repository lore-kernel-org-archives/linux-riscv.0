Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087F5C982EE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 19:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/vC2+S23lkXSafrKbk01KACKszAhmSWwtmn7LiYnCw=; b=h+WTG0kvOnisY/
	RfyFmNkJ3odSipg15yMvar3iTTGc1uz2428ZT+TLLDPWNcu6plblLL2116WULczvB32YmEvyd9m79
	KnZIwqTVq8sP+uZ+A40daEM9ep8om6N0TsIjnWcwLwgrm1rTouYKnDgcf4uacaA5WkgIADQJ4Jrcn
	Fl/uHDCCfdf0A00Y4Sd8lWGyiaCifpzEi8PHE7j7ORD0vmp01UvIP27jFEAlzn2cTfPwQfqHhJJFC
	umcyAaevrvMphtaSJeUz4DiLdFoQsr+AslJ5Qzle7Lpg5vHiIdl6wKFShYzulmN7wwv0882a3tVuo
	GcPyMIWtNkd86TYKxk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jgu-00000003EHu-3C4R;
	Mon, 21 Sep 2026 19:28:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jgr-00000003EH1-0djE
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 19:28:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0E5A8C5CD60;
	Mon, 21 Sep 2026 19:29:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9F1E5FFB2;
	Mon, 21 Sep 2026 19:28:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6433C103291F6;
	Mon, 21 Sep 2026 21:28:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790018910; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=2CJ7icff8JEtr2MIIttHYeL6xAW9xMU6iW5VZ8o8b1Y=;
	b=tx63j8gtO2LTknEcJl2VsugMfHDV7JkN140eNtrYk1J+a7OmNqx7hOWnSycxNKn6WxA3rI
	67IcochnkJqxkqTq9SmqcT3wVG2ztoIxlaNJrHsu+Jhut64wQu8jzet6X93DYSbtwIBgv1
	AD/k/7vLqexg9YfgMWGfFOPwCZzrYxI0jGE0DYTe1iXzYUW4zmsaVRJN1XFRKGAc1Bc0BI
	AYQ6I84cp+Tz5HM1tyM1/oiVahThYqQPhySlXEAPkj8HMlacfm719AU1bASL8ZrHNtgQ10
	PnaYqYYaFCMb/xm5DKd4MMBsH0IjHQqw1rFjM6JM1CSxI1Y87QHpC6Cc/7j/4w==
Date: Mon, 21 Sep 2026 21:28:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	Manush Prajwal <manushprajwal555@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: mpfs: fix unchecked devm_clk_get() error pointer in
 probe()
Message-ID: <179001890274.248925.9854410688320328698.b4-ty@b4>
References: <6a9d4b02.7d74b517.206c4c.75f8@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a9d4b02.7d74b517.206c4c.75f8@mx.google.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_122837_364559_0E9585A2 
X-CRM114-Status: UNSURE (   7.44  )
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

On Sun, 06 Sep 2026 16:44:09 +0530, Manush Prajwal wrote:
> devm_clk_get(&pdev->dev, "rtcref")'s return value was passed straight
> into clk_get_rate() without checking it for an error first, unlike the
> "rtc" clock a few lines above which is correctly checked with
> IS_ERR(). clk_get_rate() only guards against a NULL clk, not an error
> pointer:
> 
> 	if (!clk)
> 		return 0;
> 	...
> 	rate = clk_core_get_rate_recalc(clk->core);
> 
> [...]

Applied, thanks!

[1/1] rtc: mpfs: fix unchecked devm_clk_get() error pointer in probe()
      https://git.kernel.org/abelloni/c/ac41b05d15db

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
