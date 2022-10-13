Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1D3C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 21:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HG6ljkl8JNsIC80udbv4+Q1XhZP97bL218wc2UfoHrA=; b=J2ITxrw4+Cx7Ph
	1gjo82iS7F8/otTSQ52hWmJjX0PBventMAqn9DCi0rQHnvG4za8G7OpZRQMzuj1AjJmr3JspfktdJ
	8jAUuDYvL8SY3NGalY/ZWFhiv2o47zzLUR1JW/BPU7kyA005lRmRQohIZLMrvSsCsPJR+OYibDzI8
	pXLyZOOiJjASDet+E3qXDgSWL1+x5q8ArQCydwHtBPLir+VNEMHjMyM5VMqHWOx+tidvw9qn8Af7e
	2yLAwotjbtayy8PJ5JpeTo57+8WuXtOlU6dhcNpzMvNPeCExTSE2ushHV2udMGX7wPgWbAV9IcXbB
	Fqs0vBzURFLKFgQ4rj1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj5p3-00CzLT-T9; Thu, 13 Oct 2022 21:32:57 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj5p0-00CzKE-5m
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 21:32:56 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AE64E240004;
	Thu, 13 Oct 2022 21:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665696769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/AFwraTNltNY+tI0PBTXwQEkN7fKXUqp2PHeW12J1CU=;
	b=mWXvztsizl1t1XyJvd9wFN4g8i+yrVCSumTwKEZ6wsyBNFkneyJiRh7zfc2Jd7OhWjByY+
	3/Azvd0wqEIs2oAB0Ee6MuJS7rHfY/ZalwVQSuRrj5cp3KKeia8K4J1ELCKEcAgAE2+FLb
	PcFFMdV0TOCtakoRGTgC70+EptFz/wgK1735qBbXwOzemESuWO6G71Pm3zqdr3R2fnVi8E
	Tod9s9Vjejz9hvGtk30Im9N9TZ87K/u4wBMRI1HkdcSH+dtZseBl47izGDyQYvFxEFnAMC
	BeyMl8oKDDb0gsKvcQa1UJ7kaeAAKhtKEWJEPVjcug6NRUKbdN+r0FFUbEI+Ew==
Date: Thu, 13 Oct 2022 23:32:48 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: mpfs: Use devm_clk_get_enabled() helper
Message-ID: <166569636075.1226796.3261311337977278707.b4-ty@bootlin.com>
References: <e55c959f2821a2c367a4c5de529a638b1cc6b8cd.1661329086.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e55c959f2821a2c367a4c5de529a638b1cc6b8cd.1661329086.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_143254_393031_6D039888 
X-CRM114-Status: UNSURE (   7.76  )
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

On Wed, 24 Aug 2022 10:18:25 +0200, Christophe JAILLET wrote:
> The devm_clk_get_enabled() helper:
>    - calls devm_clk_get()
>    - calls clk_prepare_enable() and registers what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code, the error handling paths and avoid the need of
> a dedicated function used with devm_add_action_or_reset().
> 
> [...]

Applied, thanks!

[1/1] rtc: mpfs: Use devm_clk_get_enabled() helper
      commit: 24fb316155a5f6ba278a8b110c60e67b79900356

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
