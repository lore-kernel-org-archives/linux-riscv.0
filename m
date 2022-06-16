Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2A9C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 06:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFhOmgh5Y9Qa+B1UEhlJ3mziqG97brUP8ge0oSrAc0w=; b=NjEGfHrYjUWSNf
	vop2sLfqprVymcSN1w6SD7M9+BUarocxZqh7YbYgbzHyON2JPTMhrTfjK+MQpd7u0429IkVRMvf7M
	geHdo1P+qPZpLPKnbwCSI9kkxpBXWW2al+2o6l9+xcgrODVVugg/hsVSNsB57fslkejZ88ZlHuwVL
	Xs9PmTTw30h3vbPfiIrTcfR+gMFYDLZolHHQSD9Dcf3QJhs5y0d5jDtjp4m5CWcIlVIzA4sZou0rg
	/206Ia7HAF/m/8chP81z9+feg+q8kutFOh+ZJiWvYcYN0x+V6MMS7RVIrCQGMZ1k7/IJD0+aeh+g6
	yZLoxVw23LdGFa3feO3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jCA-000m6k-1I; Thu, 16 Jun 2022 06:41:34 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jBH-000lXl-Du; Thu, 16 Jun 2022 06:40:40 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id AFA5C3200B29;
	Thu, 16 Jun 2022 02:40:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 16 Jun 2022 02:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1655361637; x=1655448037; bh=zm
	ZeppPZ05wI/evFnRfJ039u6Qr5P+abvVXy/2awP+c=; b=GFay1IcafnQ4DMeWxc
	MzZ9RRX+pVxfMUiKQxg4Z0FcxFSJcbMjzG0tQKde4XlKB3bLxtW9Sw/4htLDu7TC
	o3lrdvDqC/9ZF/lxom7+wnxpLvUR3eMB9zmZlFpqSbvi1byuxZX2nHZTri3ZYKHT
	JF7FY90LAgBx4fV5G2r7XlrG54wpbU/NWl8u/Ejy9WCKNk11m6KCjyhusxqBbeyI
	nnOn0LoJSPTaaU9Ubp/F3iHO4ug2gm3Fed/T10PoEOI01h798mE6rHegTiXhatve
	9z9Orbg77qagT1UbL57I1rfjU5NacDqsTgyvIP1d5kFqNjSsu+3dyjagJzR4RsLp
	F09Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1655361637; x=1655448037; bh=zmZeppPZ05wI/
	evFnRfJ039u6Qr5P+abvVXy/2awP+c=; b=n1m1QpN+hpl1bdOl4OUaYK/103A7P
	Twup2+9q8fRn5Ye8KgKlGuTcFHU2rw83jveJC0+WviqoMkQB3wO12zHOKE6SQiUJ
	4Xfj/M/NC6w/thVE/1b0i5Hc+95B7dUozvVROm2yIFk+NoLJjGPCy1ScGwmdCqBJ
	0MSpJ+qV7Kj4MjH/IvYarVWNpA9wGL1UujPhuintHZbkm1eJOifooHMCNNKzasMP
	hxWICQLeYaWcxiANa3bZfCOHaOZAvKV67+tiZIeRUt8GjQhkddzTjRow7VXBMKfE
	7yr2ZNBFwLWuVBCQFnyfbCzCjmmt26UcLN1i3VnAqAHdU+683F3RGd5mA==
X-ME-Sender: <xms:ZNCqYgAChbAsQNhN6o2xke4d0Pix18PaxLNiPboAHW7H6FEzv_Nq6Q>
    <xme:ZNCqYij2Y8gySxJ6c9YnvC3dAChvvr905vTxAnoHUEhEfgOdvhJCsu4GlQmOTqNy7
    Yh4DlTynNQtpV0rGw>
X-ME-Received: <xmr:ZNCqYjkX-LUXELfIGO5KxYX4AUaCFjFBTCJxFPOReL-J6TwiF8vFZ11aQtW7NMV3opmrietIjUdYmvMZvcTWf_nnXSDcM9yPa4sjSTB2yAiFw-4EYTz1tZBG7VF27vP3CjlnXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ZNCqYmyF7nr-ZxSp4n58cp3zs9egIPQJFr-3ykxAmgO7kjs064lEPQ>
    <xmx:ZNCqYlSbQYeYVs6kJG6Yt_SHwlSTbV1tlQWeLqbgdx30Ky9vET-vfw>
    <xmx:ZNCqYhY30xKOJTTKF3uD2vax0OyN6gILUdENz1OmNSfQPr0uAJwoOA>
    <xmx:ZdCqYkILVPB3zhy6IBPtY3cBpW2Xxzxi2QniRFIJoYWoo2azRuMgfg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 02:40:36 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guo Ren <guoren@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Wei Xu <xuwei5@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/6] genirq: GENERIC_IRQ_IPI depends on SMP
Date: Thu, 16 Jun 2022 01:40:24 -0500
Message-Id: <20220616064028.57933-3-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616064028.57933-1-samuel@sholland.org>
References: <20220616064028.57933-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_234039_548726_B332D4CE 
X-CRM114-Status: GOOD (  11.57  )
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

The generic IPI code depends on the affinity mask being set for IPI
IRQs. The affinity mask will not be allocated if SMP is disabled.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - New patch to prevent GENERIC_IRQ_IPI from being selected on !SMP

 drivers/irqchip/Kconfig | 4 ++--
 kernel/irq/Kconfig      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 6f74c144a7cc..68be9eccc897 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -177,7 +177,7 @@ config MADERA_IRQ
 config IRQ_MIPS_CPU
 	bool
 	select GENERIC_IRQ_CHIP
-	select GENERIC_IRQ_IPI if SYS_SUPPORTS_MULTITHREADING
+	select GENERIC_IRQ_IPI if SMP && SYS_SUPPORTS_MULTITHREADING
 	select IRQ_DOMAIN
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 
@@ -322,7 +322,7 @@ config KEYSTONE_IRQ
 
 config MIPS_GIC
 	bool
-	select GENERIC_IRQ_IPI
+	select GENERIC_IRQ_IPI if SMP
 	select MIPS_CM
 
 config INGENIC_IRQ
diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index a2a8df39c2bc..db3d174c53d4 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -83,6 +83,7 @@ config IRQ_FASTEOI_HIERARCHY_HANDLERS
 # Generic IRQ IPI support
 config GENERIC_IRQ_IPI
 	bool
+	depends on SMP
 	select IRQ_DOMAIN_HIERARCHY
 
 # Generic MSI interrupt support
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
