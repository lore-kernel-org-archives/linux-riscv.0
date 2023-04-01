Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2030C76196
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzvTGrZtl/bWOFQQTX3DwoMDJ1utYOmNOvaHq+p0UWs=; b=3hG09b3952uYAW
	tyP5BvSjIR8yyNSYoIJaQt2tuLvLz9fwBg/KSBoO5KiG+gjnmvkwrv54wMcv7L6JaAaNHxDmQLoYV
	Bf0VyxOOwlH92Vfge36O7sDg/eD96CydUZLnVN7DwQ8JLE8YHh+lWaaBcaylsD5nW9036Z/gVDL92
	xyv2cEQy83R4AKOoProsnqerINbhHT/o0rnuSTyBK0AlXhqbreCMS40GTMA5aIlykdoxBIvr1apKO
	hongCuDV4wgkORYbjuY02L19Wohm7oxmq1H4Lks5Ns36d6tGaRghOGA8YzjFXB499iSCSYEG4bH9b
	EYbQ097KgzXn0jiepfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piXKu-00A5R9-0C;
	Sat, 01 Apr 2023 09:15:48 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piXKq-00A5PK-2t
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 09:15:46 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 3CDED5C0209;
	Sat,  1 Apr 2023 05:15:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 01 Apr 2023 05:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1680340542; x=
	1680426942; bh=6ZdUaz0bULSUdlfaxIi2pdkawZZOMF82ZopwMrFwfbc=; b=Z
	Yb64APEBRmQX6qnsbQ+gNGAqCe47A5ugfKPHsjoS0juWhirZbuCy5OqsbGVin0aQ
	MCprU8gXASeLV3u4fhQCB8Xmr6q9QR4w2HZJpdtlKTwu5UTiyxJEYkR+RtRyVRde
	UTwLtqN6qhUwO6xah+aI7dLJmA/yb8qsL05ZmqE47UppENL8RgKP+t5PLWHyEYgv
	sxhwSxbBQD+ye3z4TVmNgvmBGIE+aGU84qke6fbp70ckULSF34+i1MBOcxAd3u2K
	aob00h3PmgtGo76UIlwN0CqufBnhZt1E57/1uA+egkRWe6wX35P3VsqLKRW9J3oR
	P1NvJ1J8XM4zvQBVfbpog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680340542; x=
	1680426942; bh=6ZdUaz0bULSUdlfaxIi2pdkawZZOMF82ZopwMrFwfbc=; b=n
	2+Sns5MlCMh2CS5VbD4r4+tfWPBNZW4RfSSeYLJQ1wxvtWZeI+w//zhC/SBMe2wN
	Ue5yAxnK70ImQ5HLFWx9k1/JZJ3vvGMKku6U7/6tioBsUC5cTtJekxHafJNmyZMh
	hUfkRF+AkKbFh00IiA8DUKvrLFElH8m8uZF2yJcPjkaUmm3LnOm40eWxKN6e7AKe
	6MGiQItIbp/g9gx/F0//fNfDMvpcMLTWiAdmoCfZpKcNQGBEeeNXWetaW27oUc1G
	KardIf3w6xRRk8YcR5R5mVHjbM/0sHBYN3d2fSqnbAGZkeleeQp9xCv24tHbLrut
	ukVhLPN80yCeH5PYfwmtw==
X-ME-Sender: <xms:PvYnZKt-zWPqZrgcrFY6AOOemameG7W6-C2QSx77SsyR9Z2_z-CHNw>
    <xme:PvYnZPes5nXJmw3iDxG2X_9YZsQ7N179e2hdLMPN_9u0YkfajE3BixuH1pLuq-f4_
    zZOQ9VuePXcGexJ6VI>
X-ME-Received: <xmr:PvYnZFznsQ_q-aL2pCmlfQaEv0wP31Q8WUaTzsrnlD2q5ulJuw2TW78xT4Rpt5xy_cJjP_WDaI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeifedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:PvYnZFOWT9rX4KVETjZaH87LUHkf-7NkzbN_Qib2QMqlBWf03QhrHA>
    <xmx:PvYnZK9XuT8G4n4z6Lq2OJzsz3B2lX7isTLmDh7Lqzv4yP7p3BjP8w>
    <xmx:PvYnZNUr7L6sbtxlAO2w7uTxFHLdkyeMdR9I0B4bWla1dJma3HUUOA>
    <xmx:PvYnZMcuntpmBcB4d9JK6LDt8H-UanPzN6G1vOiuUwwUbjxBBLzSZQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 1 Apr 2023 05:15:40 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: iommu@lists.linux.dev
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
	devicetree@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v4 1/3] dma-mapping: Provide a fallback dma_default_coherent
Date: Sat,  1 Apr 2023 10:15:29 +0100
Message-Id: <20230401091531.47412-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230401091531.47412-1-jiaxun.yang@flygoat.com>
References: <20230401091531.47412-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_021545_342615_00F9B413 
X-CRM114-Status: UNSURE (   6.59  )
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

dma_default_coherent was decleared unconditionally at kernel/dma/mapping.c
but only decleared when any of non-coherent options is enabled in
dma-map-ops.h.

Guard the declaration in mapping.c with non-coherent options and provide
a fallback definition.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v3: Style fix
---
 include/linux/dma-map-ops.h | 2 ++
 kernel/dma/mapping.c        | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 41bf4bdb117a..31f114f486c4 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -269,6 +269,8 @@ static inline bool dev_is_dma_coherent(struct device *dev)
 	return dev->dma_coherent;
 }
 #else
+#define dma_default_coherent true
+
 static inline bool dev_is_dma_coherent(struct device *dev)
 {
 	return true;
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 68106e3791f6..80f9663ffe26 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -17,7 +17,11 @@
 #include "debug.h"
 #include "direct.h"
 
+#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
+	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
+	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
 bool dma_default_coherent;
+#endif
 
 /*
  * Managed DMA API
-- 
2.39.2 (Apple Git-143)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
