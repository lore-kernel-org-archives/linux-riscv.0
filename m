Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD446C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 11:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taHN/tPXTGRT5LRIw7+bEdyKVGeVP0S6Jup4aHIByyg=; b=0Pm0+zrhZ+vloC
	By6YzJe1GHEr9dojgzJMX+oEE4LaO9yA2cP7fMJ5rf8T2qS5QYMAc3OPcqhIs8gSHkMRzmQZB7fwV
	yZ31tBxnCRCGiQOvtQ2O9td26P8Vm8rrcwHe3MCRjJdYWHTcCxS3msGLoDsjGJ2HSuprgni+EddVG
	f3lD2upAhJUgukIbDcRNlGOKUQJ1SzcsYMGHwCjzjkHGRAUcaFX4OR0r2ylGs45+MAkb8m7CjMBAR
	MbIfPvAvduGJ6p8wkIZu+qEbC61xW9uI4izmdSty5wNISB4vLEyGX3OTQkPPAvxk/r9cYLgSjZj2h
	OT+HSl9uaAzDPFIvTJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peZr0-00C8YF-1H;
	Tue, 21 Mar 2023 11:08:34 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peZqu-00C8W0-1a
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 11:08:30 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id D503F5C0184;
	Tue, 21 Mar 2023 07:08:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 21 Mar 2023 07:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1679396905; x=
	1679483305; bh=SEVSeLr4YeKzVQBfQj2m8k28yjFkBt6zYOmqTsWGRHk=; b=S
	d/E4QvoCAIH/W+97abDyEMw5xpL7Hg8FuyKeiu1iHlTtZOSHAztvGF9TGawUgQ3d
	sJ2Dx4GHn4jxJfhL8uh9ueg5sTkYlIt4zdgT+Q85O+KDy9Zn7W+/ZiPWlnMAVZjK
	DRM0Ijt8tW18uUDl8wRilhFQhpVKPcLm4nr4ESUapC1tYQtr+Nw5vKbZuwFQDfT2
	7xerssL0lyG6dJM6eGnPa181OYknB4qfGyPiQv4oSyMBL4MEIzxiquCPC0y0CoI4
	QrNJpxAYoaPt21z0QaP/ozB2nxNpCrPyEu9GfnrP62t1hQhLgjYexPCPWTm3bhxM
	iNTYDpoyqNzA+EB9ZOOOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679396905; x=
	1679483305; bh=SEVSeLr4YeKzVQBfQj2m8k28yjFkBt6zYOmqTsWGRHk=; b=l
	fx1lZo1fUheuiOZQAr8yusL5cCSoywJ91zmVWTNTZk+zAFI0+9IDzjaTEEGlqRHU
	aRRVH7vGa3LjLUdKyxM0EYKtZcGjyyIuYeRR/wrSsja+HCynas1IqXdgkuEKIpim
	bppUUoKcJ37KbA65KJihkPZUSPbA/rPqa8ZYH4A/PdPKqTBgtYtLYKOmKSqgjgKA
	wNeHNiXwWa4lZsomYGn2/hCcsUUQuBNAYOBvmDDZ4R4+Z0obYnkuN8Zv1dB8B0Dy
	kwk1IwNq3Bsg4ndZEnl5k0FrOBmzcoPTeEsJU2UsnZgUmS/aTiCstLFOsM4W1jkr
	b+YBtJzdE7p+j78N1msiA==
X-ME-Sender: <xms:KZAZZDqYtFFzD2b58O9RftolKWh8ed7Qcc7xb6jDa-bEYsE9VlUH6Q>
    <xme:KZAZZNoIF_SOBXFt6w40XVFInf_LFd3w8kWJRDV4BcZMSh2EWG78F2oJso92EsIKX
    7blLfGd1A5PglCooqE>
X-ME-Received: <xmr:KZAZZAP5Gsyjc1jrhnubGTbhLdyOGPCuYkCeuhXvi05LcOWxJEH7gVMzfPBy0PCUwwHwPc5a820>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:KZAZZG4k3JDP2DBFMr-bJ-cvPvs_wujoA13_X0_IQXSqg-xVai9qDg>
    <xmx:KZAZZC4bIqwlHsUlZRwQfKlE4S4Ygu6R4Lb4UcQJvgP8bZIoOA0Dtw>
    <xmx:KZAZZOiCP2JtynJ6YPV0CiP7AsviWq6JlHloSKVISyA972e0hGSA2w>
    <xmx:KZAZZKgf3AAVmTHBDWuSAwgEUfLiLeYucgsikzoXMTKonpQAJ59Q8Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 07:08:23 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	tsbogend@alpha.franken.de,
	mpe@ellerman.id.au,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	robh+dt@kernel.org,
	hch@lst.de,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	linux-riscv@lists.infradead.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 1/4] of: address: Fix default coherency for MIPS
Date: Tue, 21 Mar 2023 11:08:10 +0000
Message-Id: <20230321110813.26808-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_040828_705067_6C4A762B 
X-CRM114-Status: UNSURE (   6.46  )
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

DT-based MIPS doesn't use OF_DMA_DEFAULT_COHERENT, but
might override the system-wide default at runtime.

Use dma_default_coherent to override default coherence for
MIPS.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/of/address.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 4c0b169ef9bf..c105d66a1fa4 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1105,6 +1105,14 @@ bool of_dma_is_coherent(struct device_node *np)
 	struct device_node *node;
 	bool is_coherent = IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT);
 
+	/*
+	 * DT-based MIPS doesn't use OF_DMA_DEFAULT_COHERENT, but
+	 * might override the system-wide default at runtime.
+	 */
+#if defined(CONFIG_MIPS) && defined(CONFIG_DMA_NONCOHERENT)
+	is_coherent = dma_default_coherent;
+#endif
+
 	node = of_node_get(np);
 
 	while (node) {
-- 
2.37.1 (Apple Git-137.1)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
