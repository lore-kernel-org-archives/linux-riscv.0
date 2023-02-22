Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A386C636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jlvr5EGe/MwZPBLy1uTM+F2GYhBdhlNOxsOn3FV6dBk=; b=4dNXgodUIDu26p
	hk7GJ9jYqG9JEHMfOZS+Bh5X3uMzGn+5yag1fgpkFmXf3AAw6LOcSjGWbp9oLK7k6HNpHa23x2thV
	I+vvAFABKziFoz4up6MwxfGoVE4VzLl4FYNxNzAhOtrAvKCciLd8mMRaR9hI1sdLnX6INAeiPWd8m
	Gx7yfmmGzwWnJeOquGh5HasvrfY0qaK4y0VZFAH8iGbNqEK9uCy5CYibR1JGHKU280qPX6TZ/2L29
	3XVgiKe5AT8Xassn0C8UEi/KPjkgp0wvUAkl2BaNJu/sBygUwelDFeCCMwB574wtHmEJaLw0RVVVc
	DDAPdrSiZPGfeGFmlRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUpJG-00CXiQ-ST; Wed, 22 Feb 2023 13:37:26 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUpJE-00CXgV-7W
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 13:37:25 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 2EDC35C0121;
	Wed, 22 Feb 2023 08:37:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 22 Feb 2023 08:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1677073040; x=1677159440; bh=w9
	MPuL3xvzlmyepaLfzNP3Yd6NyYPIjuZVV4oO83i4c=; b=Z9k/56ZNql9SmQjH8z
	KTyQCSI1IZ1NM2Yj9JWpAzAz3hnbjCpGdshk3Ra8L0dbAefCWwUgoJrZlvDfu5T1
	K/L+D9sZ59n7AAk/yBR0zWYCFsxF+2h6jUuu798ERAg4iafehLBk1vvv5BkKxSZR
	T0WfKFm788ARSFTH+p39Ly6DMFpnvTP0M6waFf5vedhgMtuvRQ+L/PwnSP03bX5H
	8tkfMxiTlHLBHSe3bfLkOIIYFCEsz9uCx9wkgOEnPd39wOYMRpFeqXPnfuR5S+AJ
	bU7mWQssr0Pvse4r6RXHikUPkwQzEeO3X/UYeCCYPM53JxkqwgUmtyo9lP1Dmgd+
	ZC8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677073040; x=1677159440; bh=w9MPuL3xvzlmy
	epaLfzNP3Yd6NyYPIjuZVV4oO83i4c=; b=t0+fpHEADym4UyAXwv8RABDiQxR2Q
	4gr8wHJZ/37eH4oUG/xTdRNgRlf1o62QDvSv/LE8AUm4DxFsmz28+PSxKycYCmt3
	BgYtnw9uQFmqOLw9Mrz1XGlXRWR8T9OCRktL4UUFb07DJOe1giUUnt740OEhNoEn
	1UrMK+67Ean0yYV0Nz80kffJMD7kPvijn5HeBxEdFN1nmA6tfQP8mw5PpMbgWabU
	xaqwtrhLyYKPB7p/Lpdb+i7FQ06zm9ihVR/oN5F1KHXWIgVwUjTpENj+jEBUwfa0
	4l10PZDnOlS1lDOR3ssdXABDUnXL1sxi8eFIZUlEdwv5VKIKABV7BR82w==
X-ME-Sender: <xms:kBr2Y9vF38sk8KSl4mjKN2CSZdP9mX6NDkYIg3RHIWUfqoNj4eXXoQ>
    <xme:kBr2Y2cc5HFbjGy5ApPxiYayvruX5OJ3dnEpYORb_8SSmfGWOeoty1G4bzJ-lGtx2
    RbI8DTpHKRt-4XYf9Y>
X-ME-Received: <xmr:kBr2Ywz6-Oc_V1KF6Ja29VhdN9MgjUlTtz85DSyHQGBi4qJcPe3qATqQCqtG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:kBr2Y0OrnKXttDtdULg443FsoVFkMfvrthWFRORpU1rGbvl_XJbJsA>
    <xmx:kBr2Y9_hmn1P_0q-gWu6tjR5daETPTWMnamL6yces1lputUFA-WEiQ>
    <xmx:kBr2Y0UiW75n_mq7fWZ7wCdbjgVkgj8XbCn8GUeNAj-LXeHqA8mSbQ>
    <xmx:kBr2Y0VQQrGqFrijDkbKuBdoHlqNKzufSvpCs8jmv-uQitso-V00HA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 08:37:18 -0500 (EST)
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
Subject: [PATCH 1/3] dma-mapping: Provide a fallback dma_default_coherent
Date: Wed, 22 Feb 2023 13:37:10 +0000
Message-Id: <20230222133712.8079-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_053724_384243_11BA3B1D 
X-CRM114-Status: UNSURE (   7.07  )
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
but only decleared when any of non-coherent options is enabled in dma-map-ops.h.

Guard the declaration in mapping.c with non-coherent options and provide
a fallback definition.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 include/linux/dma-map-ops.h | 1 +
 kernel/dma/mapping.c        | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 41bf4bdb117a..0a1aaf7163b3 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -269,6 +269,7 @@ static inline bool dev_is_dma_coherent(struct device *dev)
 	return dev->dma_coherent;
 }
 #else
+#define dma_default_coherent true
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
2.37.1 (Apple Git-137.1)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
