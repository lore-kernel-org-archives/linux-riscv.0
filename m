Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B52CD37AF
	for <linux-riscv@archiver.kernel.org>; Sun, 10 May 2026 12:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6oZhix9F0wQ3awaq2AhV6uFw5PCam2oogZtMLvVkfA=; b=K5aoi8spS1s9Zb
	VjHia6R/ZMmPu0BOxSgf33Hj13hpBfbBxUV3R1jZW9jFZcqt1Pva1Y5HT4+jOmaL/Fcyz0gBeclCP
	KtkFoCOrjsZZRGZfjnHhenYDUcX18WyL3uYN0KI18APu9tSIHNqSGzys0ES+qQwvrJFSMLL2II9d+
	CSioTYYpAxIyamDSeyB2inK7WIzVmNsbdwZr+rmgl0wsfUT5nXsfTsqqe3Uxoa8Eo2/fk0+41FtSU
	TVbMOIiYIrG7XSyV03tJJ3zBn2CjGLCZUxxw8tMntXbFWRDv0LvBDOdoGHe5k/LsnanKLnNIoW0jU
	5/vaCoqxLLSLlljOgduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3CZ-0000000AhZM-0aaY;
	Sun, 10 May 2026 12:24:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3CW-0000000AhYQ-2K5r;
	Sun, 10 May 2026 12:24:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 465D644432;
	Sun, 10 May 2026 12:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775C3C2BCB8;
	Sun, 10 May 2026 12:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778415844;
	bh=NDt3RJVWprBMRZL1hBTLG//fICJZ2Q/u+HUTRUNib4Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AfWwBhQtpDxEhQxpko4dQ46hRgQTiqKB/8Ckyw078zeELmg7rpPomWKmGC78rcu4A
	 HKr39pjE0ucLVhCUrFO174K1CA7NUSZ08A2kx+n6pYCMIqRroe48AsBnaNkVYk6Pm7
	 9oeXMiN3uNqkcDsu1wT4uul/lXLyvGJPy76Q3aoyCWTVleyiX6nr9+ieFemMaZN+DA
	 KM0asltdqcRSqIDqg/JN4y/oIqj0cFmDDGdVvv3fgImXU6+A5PHKVWpOIG5TdeM8Ck
	 0sfCH3VwS67s6qcA1dPxDkFfmbkgJ2hWAL3ZDgltR0FeiJDx2jK+jg9wnVlyk534YF
	 xaU/m6IGfmQ9A==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Yixun Lan <dlan@kernel.org>, 
 Ze Huang <huang.ze@linux.dev>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260326-k1-usb3-v1-1-0c2b6adf5185@gmail.com>
References: <20260326-k1-usb3-v1-1-0c2b6adf5185@gmail.com>
Subject: Re: [PATCH] phy: spacemit: Remove incorrect clk_disable() in
 spacemit_usb2phy_init()
Message-Id: <177841584101.420676.11785245534258956583.b4-ty@kernel.org>
Date: Sun, 10 May 2026 17:54:01 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_052404_614108_BD904F48 
X-CRM114-Status: UNSURE (   4.99  )
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


On Thu, 26 Mar 2026 00:23:58 +0800, Felix Gu wrote:
> When clk_enable() fails, the clock was never enabled. Calling
> clk_disable() in this error path is incorrect.
> 
> Remove the spurious clk_disable() call from the error handling
> in spacemit_usb2phy_init().
> 
> 
> [...]

Applied, thanks!

[1/1] phy: spacemit: Remove incorrect clk_disable() in spacemit_usb2phy_init()
      commit: a4058c09dd6e28ec33316fd6eb45ddae4cab1f31

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
