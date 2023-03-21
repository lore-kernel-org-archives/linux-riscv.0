Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6BCC74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 11:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OsApOuLHOXhwZCoQoA6B5Z7Fr/+dJbhlz3n2y19GIg=; b=WAsD6F+KoofWz+
	H6mSGUtQgP+mP9CttP4ap+ydEeSi46w5tSBGyyVGTiTZg948l4UOXC3zXFiObkSZi/SRsUJINlpb1
	9bbWhvz/cEaeWiJB9MUV95EnGPg4zaZMsXQQO95dVGYKc7SpEfxV2jc6T+ZymTD8WFg4jh5wMRage
	vrVABWGRicpmE9XjFNq2/f2oC/FOL7GGayTAAHPvozTgR8Jn+QK+RKnJApl5cY6QraAhxNgto2YqR
	glgDSarD5IQ5it9jzimsT8cfSPBgMD5l5Gh0b49t0p5lluBiE8WTfOHUd4GXrXF3QqtP1JSa3VIIk
	RMoAjVJhijjOkQkPooRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peZr8-00C8aL-1o;
	Tue, 21 Mar 2023 11:08:42 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peZqy-00C8Xf-1K
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 11:08:34 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id CFE785C00CD;
	Tue, 21 Mar 2023 07:08:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 21 Mar 2023 07:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1679396911; x=
	1679483311; bh=RMUyY24KVPUr2kuw3Jz6nElWvCSULjyC1kNh/s6lQlQ=; b=E
	KCJqVU37dGL/jAYaoCalJYg8HEzX4Tk+7YXps1J67iMBQ14ON5M7rcgrCRRjJBJA
	1KR6BQ1HP8YgrUhpw6sXR4Mzlbxskn9LcK6TUdBWOJso9DFDNM2CwsRjoWSzzVdB
	kjdvIdDLBtuucjMqJzu7+sgu5GIfxj6/61EYO67ezJWw8B/2FLV9IjsE5M/uIhYt
	lI3jnHoaE1Nfypb9WGW+uie9F46BR2SD+iGW6nBVu6HjrpGmunga9YDH6Mum5UI+
	5QVtsSKEHAjAMhObwnxJqoI01qhNHh/3ZBErOb9MJwfoEQC6ioNwMh9qXJxwJHIH
	UbruH/r2VBGMxIyo9MVzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679396911; x=
	1679483311; bh=RMUyY24KVPUr2kuw3Jz6nElWvCSULjyC1kNh/s6lQlQ=; b=I
	8ij9zH8Vk9qa8A82aaFfxbWTmSjPHJsOeKLV3ABKaJokfgY65T/iOLHYC3VxhQmG
	KDFZh/LTNctR4BcO+ynAE4X47qXPidwM24+H/zbgcGNIF63KfLKBpzWKakoPIuQB
	65OdYabaVJagU6aM2QdCLj3MJb4d91mpfkY/xP59piH+HsrM1ZhB1A/IW3YhoC1t
	PvS3MoEflpvKe5l/dO45oHfJRFjMFzrT/qlWC/R3ilSo3vWnh8WYBgDOD3r1vPFX
	xzfkMVp5py5SGqBlP5FKELGBXJkWTr5IiAP0t4FEGOBgXSnT+9teYZloCrKXWKfM
	St8RmvzYjmvxchtbiCQow==
X-ME-Sender: <xms:L5AZZF0JTSX9CWLeGzNm34wTaNOyXmD9M64feYRDaKJwPqW9jdZ_Hw>
    <xme:L5AZZMGm6KeLLQ3CXwfdr0PIEbP0lrSWkr_YdvmozEGu5LiAXL--3le2LIQOPbc1F
    BPipS6eCWw1f0SHpPY>
X-ME-Received: <xmr:L5AZZF6-LJMfB8gaKJhhOCv4F0Kdcwbt0bWYpOIifuNsGglEAEgffOYEP-Gp__18B0a_5jgq5xU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:L5AZZC3uoCSqnFZgv1Y5WP87fRYtYCBEqRUjJ157T9Z_my_i7FKsbw>
    <xmx:L5AZZIGbQQLR_pvbKLnfln6ElnLSreM9hATAEPhe4UAkCPp7LQ-JTw>
    <xmx:L5AZZD-4d6FLIpmVdEg-y2na_DYd-ZooTmvUh_JbiXYVDBHzoYfZRQ>
    <xmx:L5AZZL9Y-EmhICS9i61ujCnyDI53kMfBXlvPb94IyO964ep1xUmkSQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 07:08:29 -0400 (EDT)
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
Subject: [PATCH v3 4/4] of: address: Always use dma_default_coherent for default coherency
Date: Tue, 21 Mar 2023 11:08:13 +0000
Message-Id: <20230321110813.26808-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_040832_896289_20122439 
X-CRM114-Status: GOOD (  10.58  )
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

As for now all arches have dma_default_coherent reflecting default
DMA coherency for of devices, so there is no need to have a standalone
config option.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v3: Squash setting ARCH_DMA_DEFAULT_COHERENT into this patch.
---
 arch/powerpc/Kconfig |  2 +-
 arch/riscv/Kconfig   |  2 +-
 drivers/of/Kconfig   |  4 ----
 drivers/of/address.c | 10 +---------
 4 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 57f5d2f53d06..824e00a1277b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -113,6 +113,7 @@ config PPC
 	#
 	select ARCH_32BIT_OFF_T if PPC32
 	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
+	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_COPY_MC			if PPC64
@@ -273,7 +274,6 @@ config PPC
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK	if PPC64
 	select NEED_SG_DMA_LENGTH
 	select OF
-	select OF_DMA_DEFAULT_COHERENT		if !NOT_COHERENT_CACHE
 	select OF_EARLY_FLATTREE
 	select OLD_SIGACTION			if PPC32
 	select OLD_SIGSUSPEND
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 36a5b6fed0d3..6425b5c5d6d4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -12,6 +12,7 @@ config 32BIT
 
 config RISCV
 	def_bool y
+	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
@@ -121,7 +122,6 @@ config RISCV
 	select MODULES_USE_ELF_RELA if MODULES
 	select MODULE_SECTIONS if MODULES
 	select OF
-	select OF_DMA_DEFAULT_COHERENT
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
 	select PCI_DOMAINS_GENERIC if PCI
diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 644386833a7b..e40f10bf2ba4 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -102,8 +102,4 @@ config OF_OVERLAY
 config OF_NUMA
 	bool
 
-config OF_DMA_DEFAULT_COHERENT
-	# arches should select this if DMA is coherent by default for OF devices
-	bool
-
 endif # OF
diff --git a/drivers/of/address.c b/drivers/of/address.c
index c105d66a1fa4..23ade4919853 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1103,15 +1103,7 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
 bool of_dma_is_coherent(struct device_node *np)
 {
 	struct device_node *node;
-	bool is_coherent = IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT);
-
-	/*
-	 * DT-based MIPS doesn't use OF_DMA_DEFAULT_COHERENT, but
-	 * might override the system-wide default at runtime.
-	 */
-#if defined(CONFIG_MIPS) && defined(CONFIG_DMA_NONCOHERENT)
-	is_coherent = dma_default_coherent;
-#endif
+	bool is_coherent = dma_default_coherent;
 
 	node = of_node_get(np);
 
-- 
2.37.1 (Apple Git-137.1)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
