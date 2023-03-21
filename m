Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49995C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 11:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PkqZdnLMZbWqODfQ8OFPEK9+yXLDKTAZQu7sAwdNH0g=; b=3euaGvVK7gCuAL
	sXFEXcV7ghZ1ioA0hOeLBbxarQZGa/TmQ34SzUoKY4fvcWVRfLeatI8pVYyquaMT7VNDwtyaHCkIV
	FZ1cxb0IKUyX9vdAfbtAMbUBbUjjyzEA2gX8YBHy5dI68byMJRBH9BMN1Mrb3q9TNm+s4zY4Gg3uy
	yzE1knP8ECMH0NJNS9cj9/XV4gxRjBxp+KfM1l7B8wi6TFjKTqZcpsq98RjM6cuwe/t7DsBRJQlmy
	PSHHCcz1cR4BN8OE/l9v6fD7VKc0YCzWQ1cSNxFRqLOkrGVa5zF6i3Z1V6REjkgWlXMHJAQ4W1jbn
	YiifmF1PbkW5uTptdVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peZr7-00C8a2-24;
	Tue, 21 Mar 2023 11:08:41 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peZqw-00C8Wn-1P
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 11:08:31 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id D49AA5C0100;
	Tue, 21 Mar 2023 07:08:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 21 Mar 2023 07:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1679396909; x=
	1679483309; bh=xty1DMHWS21lQRmeSpDxl+4CCE4XjxtL7XjtmR8nqy0=; b=0
	UoPN+QG7C1bqGiTWN8M+gr2WGRS9F29y8aRdjCzMMr4yroyCFAZG+3MTqNzR0ZiD
	S5ZLJFo9KL+t+u8PKbkIVsx3ak4xpwSWvQQRg1VYt1W6NcGczki7zgIrvcimQp8p
	9s5Rkgi5hSWw3EPYLaV7Lbz8mKoLcBw0TTGbKfDmWaaEqH+TcG2FPF7YZgpjx/TH
	jrCbjUuXnd1a+a2M4ajjoiEtGQA2XslZUI0kuLIGHgwYGY8y/0FB0Gb+/FFL6R7g
	koUe24E/go/e2UMVTGupP15fJKi4vG748BlibyW678ACI/AM5SbKyxBoWH6Qr2TL
	gHAbNgdQCvsx6UBdajAog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679396909; x=
	1679483309; bh=xty1DMHWS21lQRmeSpDxl+4CCE4XjxtL7XjtmR8nqy0=; b=J
	/xvX8RLujujOWnzb+wQhi5Se8NK6SvZKbknGTlOKa9Hn1evkACp/eE8IcSOasdjK
	L5w2qJZT/3HR2K2jTo5sN+M2wDJb052lIa/Fo8+3vqSr7TE4ZvLR62BAYfxBnTc4
	Q1lehIrPcgzjCk/6Jam7FveyPtiOe6jaFVKifg1TwBhhy82f4ITbBCIUG/mhFria
	nuZUqcpTGUu4Lc+0Q1NpnIETBbphoho604rRbfYAAnyE6gOCkRS+SelycvO1D+Je
	Zw0VToQ7dKx3WEIhuv2DwStbf8w8Ahvv6wEYt+jEEIRFqeJ5kRC+TuB0BEciEw3F
	GnG6lYsfURMLW3Trx+f4A==
X-ME-Sender: <xms:LZAZZLTwezUflS6T1EDsRtAHF0s12HJ1gLwdMgedmSGGMY_KSQVmPA>
    <xme:LZAZZMxQ7WXycx4HBEiGI_ZzjmDbnc4dO8L8utRhxzmWav4nbP4LuQYQdcL6WM40r
    FmTlkJ8VY_KEefFGnI>
X-ME-Received: <xmr:LZAZZA0HE_gGtxuA3DKeP235tA15-npR20iqsKfH5hhWSHUGj5FZM-RkZfCB5ALDMGuny-l6dAU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:LZAZZLAaT8PtN8RNAd953nnVvjtsqrtH3MUuai3ib9h97uUmUX91Gg>
    <xmx:LZAZZEhBLLH-mrASDpc4ujeA4bbFM6e1pNj3uAJMfLtwvSUV-ANo1Q>
    <xmx:LZAZZPoXxVEcaYCL0lnMwGqofAMs0P5ZAv51vTntPoTXcZ-NXjgaoA>
    <xmx:LZAZZDodGSm9u9AHM7SdGxmJnfGoidUeMzvceHFmj0V_69UtguE0Nw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 07:08:28 -0400 (EDT)
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
Subject: [PATCH v3 3/4] dma-mapping: Provide CONFIG_ARCH_DMA_DEFAULT_COHERENT
Date: Tue, 21 Mar 2023 11:08:12 +0000
Message-Id: <20230321110813.26808-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_040830_567422_B2B3F4D6 
X-CRM114-Status: UNSURE (   7.91  )
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
v3: Add comments
---
 kernel/dma/Kconfig   | 7 +++++++
 kernel/dma/mapping.c | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 56866aaa2ae1..6677d0e64d27 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -76,6 +76,13 @@ config ARCH_HAS_DMA_PREP_COHERENT
 config ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	bool
 
+#
+# Select this option if the architecture assumes DMA devices are coherent
+# by default.
+#
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
