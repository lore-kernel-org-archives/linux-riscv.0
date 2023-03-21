Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24207C7618D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 11:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uv1e4aqA9HuZJs0B/EFhW92R0FmyGxNwViOr6Vm2dxQ=; b=dKBfFYLCrSISwJ
	rKKJEJh22D6mPuhKdivk7mP5rGCJso/6b8dK5jN6lRYFjFK0HxrFW1UZvKMHsasxpYQimou13IQOY
	HbpF+/8iXGy7WGuRbYzBTSXfJipc8lOSLbK3uwTx4Ax41gwgyo6Bb4L7j83OUrZwtmVfvoNslJ6Fo
	jKYL/V0dL/vxSvOBj1Llkni/BqA3l1z5UpcuRp6LxVTvYcLYqhwQxToOHoWzABENwyClr+X0L9MfS
	cyfpeE6aC6i0PU2+M6SKVF3vWURu2pw2Hj+FJlIMHXlL7qIz3YbrLxObz8DpFQBJgG6no+k0R0keT
	sxepra26imYchym7DGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peZr1-00C8Yr-2F;
	Tue, 21 Mar 2023 11:08:35 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peZqu-00C8W7-1V
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 11:08:31 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id DBDC25C01B6;
	Tue, 21 Mar 2023 07:08:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 21 Mar 2023 07:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1679396907; x=
	1679483307; bh=34g1rJ4eKpg7Mv3jK1Pi5YCKoRtvBAJ5vAexAPGkFH0=; b=Y
	K+9dSwiWN5z6O7qjaYxoOOE1GCx05bPaiar5IBe0GjOE2Gg72p2f1IvsY/C//OWx
	p7gSbGBNOoVVoloLCrHjB4SPaKQarMqBkqpg1FkmXpAYD0a9QUllqA+t/Zo5vaI/
	laKToT9DVbZp+Aq6xcH5Dn2+4uzMuFhnBzMzTRW/uvE7iuDXF228IBsD5u9Iz+e3
	bS96ZBzP00NWoXYZYiFBMW4xzi1+TMNAxsn81ZvIpwBF73jmbDczEyDK1jCTteAm
	KMqVvasp6Ub2ZXkViwPfjvitj4I2bu6zgxR7/5uZngv9z+Yg2ynUTvo7zOglVgc6
	v4fvrc5XV5TUVhAUuYVig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679396907; x=
	1679483307; bh=34g1rJ4eKpg7Mv3jK1Pi5YCKoRtvBAJ5vAexAPGkFH0=; b=W
	OwhmSW5w8OdUB4dg8PnaHDyMCfwhHm5a8sgXyqO0PVSFhO1MDiYQADBuCXpN7zk5
	pIYVpmA+kPdwRYhzhrn8dVTWB8GyioN19BZ5CxJu67Gs+EE0H0KFo7qWXHCmQ/vr
	vGGMnfuYBiOQKw2h5lSL8yQmvxH+IgJRd2JBa8bPLNI/6ucTd2xKPdK6vPai++Ex
	s7soBPUCCq5+8cZGQcgskcxjWoFOcykPujeauciWTd/oIA+gpah/wLNbT3e/BUBI
	zzhjGOmJ97oV+jghV+2ihL/1QGxZt3gex5MxlL5qMK0QXYhcmg3n+Jc82s2Dp2VR
	tK+HB0so+lUgPj9tsFPzA==
X-ME-Sender: <xms:K5AZZCCeDevojgzHlmqOuVkf0WVt3kA2sIdIMRFuR3L-rQB4PkHqZg>
    <xme:K5AZZMgvUx5G849LWNfilyZB8sYDAP2vMelYCjuzvxvrVrMQhjLzbCM8epM2kPjpK
    Cd0uiK-BnSzINKYBaY>
X-ME-Received: <xmr:K5AZZFlgGRribAerj9e29wl1EP7-_rCyXAz8VYm36-8_coo_poDgESEpHOb-1A9yu7wlIloJE48>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:K5AZZAxoTS4-Enr_LRenIV52tFK6fIf_OlFHQKHSpzkW1nSPiWJZjA>
    <xmx:K5AZZHTZw9GZ5wTscsriCuRaKtYrgA4YYHdEZ21X3aLPYcZOP8gksw>
    <xmx:K5AZZLZqmNXh8ihQi4efRYoI2-OCE32nFzBH6-eU5rYU-dDQGRvD8A>
    <xmx:K5AZZPaWlkVxBcFthA1CvCe63W6mpgde3lTCQwQhvk2iCfxxleGwFg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 07:08:26 -0400 (EDT)
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
Subject: [PATCH v3 2/4] dma-mapping: Provide a fallback dma_default_coherent
Date: Tue, 21 Mar 2023 11:08:11 +0000
Message-Id: <20230321110813.26808-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_040828_711043_A8D815E7 
X-CRM114-Status: UNSURE (   6.47  )
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
2.37.1 (Apple Git-137.1)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
