Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A482C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWIIlyOcK9jQPiiarqyRjDPAfvqQjZ/b21YLMiasqu4=; b=wu5wjKBuNdrjQD
	xtmlSRMqNup6E61eWTHEqpS86FfK6zaZSxORiTY4zpe1fnvbUh06FY4vcVL75fC6MbARMNo4rrBhC
	8S8jn5qIllgtj9htvwXLBzTaV+WMhN9XwQ0cibw/Y5wT+Tzm+C156LNPBAzLxgd27rfMSMruXNiIY
	vIlBJplXke4ICqP6vc0p0BRnkTqX+sFvN99t1dq9mTDv8rp677pGSzzpSQ+15AZXaCtm249/Q5UdA
	bkI1Ctrqs6Dv10byXtpBZ16OZUxD+9Agsm/oCC1W3HbSIJ/Ml4vB31wa5XuUOVdGoEK+LFLKllHob
	jluZwESrZOkeT6xlXZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV9uU-00GB9D-W9; Thu, 23 Feb 2023 11:37:15 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV9uS-00GB8D-DS
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 11:37:13 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 003183200344;
	Thu, 23 Feb 2023 06:37:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 23 Feb 2023 06:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1677152230; x=1677238630; bh=JC
	tc1LAvAhfDA4RG+C6XypPUVxwDMaGgizoOrWjZThg=; b=GaGS+u0+rSSVKUsd0i
	sqoeElcfMYYLQ6byq2QORQKnsEyh4C9ROAnOx5KCKLg+OK8S/bh5E6b2vISXmNHk
	GVyzyZ5ZcblpzFCCI+JrWZdEgID5xaAtzVeRyHqR2RhxwQ8/nsxMOhYkXTYHWv9X
	gu5/M31EZV00ws+MBFy7qOkrGQxKM/ZiaEONGv73b3j7ER339LSqQPtJDKdIaRlL
	HadjA9m4YYtPknnPRO3LIigtxwdJroHbAsYGfXGO3FWuZTO76BuDwmnsyaShBY43
	6edfXfb02cc4LKRKPTYuv7ROH01hV3qzMKSEng35z/DF4sXK24OGiABAvRnUCZU9
	H3Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677152230; x=1677238630; bh=JCtc1LAvAhfDA
	4RG+C6XypPUVxwDMaGgizoOrWjZThg=; b=XEXwTCTny+b8L3t8CwaoU6u0aDE61
	F4+JgeR6y6jkE3FZRhOZ6h9fBdNHQxArpyLqc6RH5mYylc9qBgtbRWMBuUdlt3zd
	nfMvWfZaTK9nGXEIN8tYbeK7Cxlq0lubZsrTS6dGLmvy9SCWiTqkukwv45wQq3/z
	KwiXX6jzGAT0huYCYPBU4R/6ldTwBT8kjoLZLab5Nt4g/dHfWbz/+OmVWiMCynNZ
	TkMHjwJCQe78ux6lkTDVMa8h1d+N3vhePV0YNE7jI+ZHm3rVjVyrXyEczaoNBzXg
	Zsg4m6S8x19lG4Zw2p1hSRdyTQpSxDZcjmKOhy260HWtIHadWdou5iOMw==
X-ME-Sender: <xms:5k_3Y6VfTDyIbHXW-IkEobTC3947Y3bdCvGsX8EoXuQDaEk14Lqfgg>
    <xme:5k_3Y2kThdS_OiHuEXX-dS1lAxh5SxFkP41bOub0FkFDyYGJkXQkugxFvX-018VOJ
    3FvAAYbxxR8mpoCdSY>
X-ME-Received: <xmr:5k_3Y-bxRfaSIW4pBiV_5krQMGEPwMEabpcwbRYFQ0y5vdLTAUO3rY9ap4oCMNkLTaG4JRt0lqU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekuddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:5k_3YxUPCGxhOjthwIDhT6mVOBkqXSX2GmIx8buR1W8Iss_zKg5PPA>
    <xmx:5k_3Y0kOm5aDTj3uWXYvwlf1C15owKbDTPp1KIwsh6-T8_T28rKFNQ>
    <xmx:5k_3Y2dHDWlFegs8mF3O8NLG8f3c4l7z8wyTFSQq0MSOvAQCGrcu_g>
    <xmx:5k_3Y-cBMACkQ2aoU5UYsAa4dDKAbeuwvZIsw5gCakdORlZa3ZSwfw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 06:37:07 -0500 (EST)
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
Subject: [PATCH v2 3/5] dma-mapping: Provide CONFIG_ARCH_DMA_DEFAULT_COHERENT
Date: Thu, 23 Feb 2023 11:36:42 +0000
Message-Id: <20230223113644.23356-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_033712_507200_8C7C9489 
X-CRM114-Status: UNSURE (   8.21  )
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

Provide a kconfig option to allow arches to manipulate default
value of dma_default_coherent in Kconfig.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 kernel/dma/Kconfig   | 3 +++
 kernel/dma/mapping.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 56866aaa2ae1..968108fdf9bf 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -76,6 +76,9 @@ config ARCH_HAS_DMA_PREP_COHERENT
 config ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	bool
 
+config ARCH_DMA_DEFAULT_COHERENT
+	bool
+
 config SWIOTLB
 	bool
 	select NEED_DMA_MAP_STATE
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 80f9663ffe26..9a4db5cce600 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -20,7 +20,7 @@
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
 	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
 	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
-bool dma_default_coherent;
+bool dma_default_coherent = IS_ENABLED(CONFIG_ARCH_DMA_DEFAULT_COHERENT);
 #endif
 
 /*
-- 
2.37.1 (Apple Git-137.1)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
