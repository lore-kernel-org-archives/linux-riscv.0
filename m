Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74BAC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 19:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2AkzWDMnta+Fn/j1dw6trciaIGhPRctR5i8KuuhJORc=; b=vJCI+jaCFAxpRo
	bUlOG2M3fRh4/UYgWAGfmI3Cwf+79PQsluoprhxTxtVbAxm49fG74Lo42Kf5FX3KhTRWO/doh2tIh
	aTn77iVQcDBycRwLv524M9vHgIrpQYr4o1hC2Ea330bYkJughwwOIu6QQ88HczJrFkcG4J4oFJowC
	dNg2qk0wTOPh4d9QDWKBCzXk1Y3TWcCkK7GthmIplgDMV8atX2cbcWHRSMOrF30uAYDpSipl/Ie3e
	rlvBnwhZ6M6GcoHwUHA/ylEtleIX5ao2ltZ5wh3SegW5uohWuKKWyXRGtL+Dj3yTxosx3uNhbXULx
	p5WGp7n+Ft3N9CfJcoRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz19n-0080Sx-T1; Sat, 26 Nov 2022 19:48:12 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz19k-0080Rj-61
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 19:48:09 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 5C2E55C0043;
	Sat, 26 Nov 2022 14:48:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 26 Nov 2022 14:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1669492087; x=1669578487; bh=WxeQ0lAHuyYH/JvUacQCXsHoL
	dHh41AbK/BFWlsX3M4=; b=NwhVCidjw1PRi+08H/StL0r26ZuCW0bTNx2YKncdI
	29maC4iHyIopvQL8gafncz7F8E1Gv6gksUAt1E28vD2hLLvxZFKwhTw8sIgj/BpG
	sOt6hYqMQcC7WLiOWimA6UMGiP28g0XJVN6BNSDCkmi/mVIj2V9WoMzfDxTIyBOg
	XrUiywY5fMCNC0KkztsDZbtjD9f/R4Zfn8uTjKiRfLlqYtk48QuyYYTV44YJSrkR
	R7FdUmEutw5XaQfU2z1j7BEkf9533qatt/cDd8MJj4Xr1jdWk8m+x+YKpr8GG884
	L/8bQX94jhStL6MX7l/pJALtusdevrXJJFtO+YfUZqENA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1669492087; x=1669578487; bh=WxeQ0lAHuyYH/JvUacQCXsHoLdHh41AbK/B
	FWlsX3M4=; b=WUsvxM/M+de56HMHmHoc1r+qoW4Pi7goIcWptJIdnVGY1AIE3O9
	evSGns24IGJRTSbFlMohg/9idV2FIvYP0TqCO990lZHR035QMrGgQfU1mw4Co/5q
	oaqiqYLrVZs5jlwE/caWoCrhn19tq7BVebimC6q8v4G57XLi35QkHzcclUPlTv7l
	+Taj4akjHTN59Oompk79Zra407yBAP2pV01OZVBnn5XKzsLTtus2FRRVWbNBlA4Y
	5ymkFpNNBvEBIV8b1XzvanYPe/oslO27k5sthKxW7HIj4k/CvfnPNrXt64YzBgVl
	atZRoYEPh+CoHUiRlOoVF8Czjqg6MLNIhyw==
X-ME-Sender: <xms:d22CYxnqzsEvi1S2YQX2Ie6avrk42NaxEMoynsntMzSOyHia7U-KPQ>
    <xme:d22CY80-bjDSqGVdchYtFYu6OrL5esWliKbpivT9eeJJzCk1H48YF4EGdqjoL-UsZ
    mUR9nFPXI9k_KdvZA>
X-ME-Received: <xmr:d22CY3pDuU3yD6bpiUn7pCMrGCvH3XVR1TbHsHzx65qq6LeT5D3MlUtmsa7YM78sWVKdVd97Mgz1fnlwrfESC2vI_00NQSYoKg7QNsonFlc31yXWrsYuSK7Uu40tp6XG_YfU_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieejgddufedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
    hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:d22CYxnD3M-bpB9-jJbG-VAHB5Bh_AzO4Pl_R8229A0-U_G9T7QD1Q>
    <xmx:d22CY_1Ll528ksUMZjc6X7v1aQfMeXowWZF0MwJrzDlI8efW6ah85g>
    <xmx:d22CYwtF0_vC05Za3PjN3y67ik--t9_9FTtKZ29o-jX3J9BIB-26zA>
    <xmx:d22CY_8Y1Ua_8mmxnHKgCESw9QkwKERcp0Q9eBp7P311TuINtVjakA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Nov 2022 14:48:06 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] irqchip/sifive-plic: Support wake IRQs
Date: Sat, 26 Nov 2022 13:48:05 -0600
Message-Id: <20221126194805.19431-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_114808_513652_22A21DC7 
X-CRM114-Status: GOOD (  10.30  )
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

The PLIC does not define any special method for marking interrupts as
wakeup-capable, so it should have the IRQCHIP_SKIP_SET_WAKE flag set.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/irqchip/irq-sifive-plic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 2f4784860df5..ff47bd0dec45 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -187,7 +187,8 @@ static struct irq_chip plic_edge_chip = {
 	.irq_set_affinity = plic_set_affinity,
 #endif
 	.irq_set_type	= plic_irq_set_type,
-	.flags		= IRQCHIP_AFFINITY_PRE_STARTUP,
+	.flags		= IRQCHIP_SKIP_SET_WAKE |
+			  IRQCHIP_AFFINITY_PRE_STARTUP,
 };
 
 static struct irq_chip plic_chip = {
@@ -201,7 +202,8 @@ static struct irq_chip plic_chip = {
 	.irq_set_affinity = plic_set_affinity,
 #endif
 	.irq_set_type	= plic_irq_set_type,
-	.flags		= IRQCHIP_AFFINITY_PRE_STARTUP,
+	.flags		= IRQCHIP_SKIP_SET_WAKE |
+			  IRQCHIP_AFFINITY_PRE_STARTUP,
 };
 
 static int plic_irq_set_type(struct irq_data *d, unsigned int type)
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
