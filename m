Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0517BCCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iL6ZTgqQWsRrDByezolHeaulE7a9i6JXHZNOzYsB+DI=; b=om0v8qUCO+x7KB
	84mB8Vt6QW8uf2qVylXAe4qZDHid1tvxddV1aHyheJhOiClJBRanvf91UpuqxOJegiqGL43Raufvl
	gSE8i4FDik5kgzB3v6tSmIU+3t0E28K/Yeup9X7eWvPHpIlAdRiiuBbu4MDg5x4d6fdNhsttLhHZP
	ReM440H+O3MOdV6ZRPrZm0HBjwbVR+4N0//e8/4qPP7quXMPMFnbYJDNqYx+F4fRLUgcCRRvt7o7T
	/fEGYxixdLRDaBhU4WdpLx2EgHBQO0o/gPWk+9PNe8nQSEqPyAnnwaZkg45B4gNTbpSjC0j5AxhF5
	99Uiys1diazgaOR3mLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2k6-00000000YAr-1wvA;
	Wed, 29 Oct 2025 09:45:22 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2k3-00000000Y8c-4BX8
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 09:45:21 +0000
X-UUID: f50830cab4ab11f0a38c85956e01ac42-20251029
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:388f82e1-4ff5-4309-a409-6fa73e35711b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:4c0e2d3b35af40567075f32366f56a80,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f50830cab4ab11f0a38c85956e01ac42-20251029
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1483650547; Wed, 29 Oct 2025 17:45:09 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	nicolas.schier@linux.dev,
	masahiroy@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Feng Jiang <jiangfeng@kylinos.cn>
Subject: [PATCH 2/2] riscv: Remove redundant judgment for the default build target
Date: Wed, 29 Oct 2025 17:44:29 +0800
Message-Id: <20251029094429.553842-2-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251029094429.553842-1-jiangfeng@kylinos.cn>
References: <20251029094429.553842-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_024520_858263_264760E6 
X-CRM114-Status: UNSURE (   5.54  )
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

The value of KBUILD_IMAGE is derived from $(boot-image-y),
so there's no need for redundant checks before this.

Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 arch/riscv/Makefile | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3998d4036f15..4c6de57f65ef 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -134,21 +134,6 @@ endif
 CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
 
 # Default target when executing plain make
-boot		:= arch/riscv/boot
-ifeq ($(CONFIG_XIP_KERNEL),y)
-KBUILD_IMAGE := $(boot)/xipImage
-else
-ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN_K210),yy)
-KBUILD_IMAGE := $(boot)/loader.bin
-else
-ifeq ($(CONFIG_EFI_ZBOOT),)
-KBUILD_IMAGE	:= $(boot)/Image.gz
-else
-KBUILD_IMAGE := $(boot)/vmlinuz.efi
-endif
-endif
-endif
-
 boot					:= arch/riscv/boot
 boot-image-y				:= Image
 boot-image-$(CONFIG_KERNEL_BZIP2)	:= Image.bz2
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
