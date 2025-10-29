Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139BACCF9E9
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wxnyO0S4wPCyZgGjCU1UPtBef8XE39SzCNHXzUmJrWg=; b=MmmUiSG2BrJtMf
	/CPPxioUVfSwU+mxQO0dAa1O3hVFFjmjUM+0X/efZRXbjOd0+nFZWblK/ot+8F/m3sPjLqjyDYVQd
	i1cEbRcBBI7ZrPfukYp2E6H984S/bKBugSdl25PyjuwI88OsBlM7+aPPUGYTpd+26JBIJElqScMe2
	sn5tlGkeGDwJHMwwOwisBr4vrZcqfPNdx3Zms6Cbac+Sbwfg4boVMP9rfi8BKp7P3TfTFHWQxQPvH
	oln6oGmoVdh02BpvG6/Uz9VsNwum0N1wlSrn8qhMJMa+gHl7KMueIlGZt80GpirNghigWks2hjZRE
	G3Vgr/tbzdi+D/bAHnxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2k4-00000000Y9t-0bEd;
	Wed, 29 Oct 2025 09:45:20 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2jz-00000000Y7w-1hEl
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 09:45:18 +0000
X-UUID: f15ae94ab4ab11f0a38c85956e01ac42-20251029
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3577bd4a-f6d2-4c19-9d45-08f70f7bd76e,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:524e2fa477effd2a1cd57698ae20ca6d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f15ae94ab4ab11f0a38c85956e01ac42-20251029
X-User: jiangfeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 89511226; Wed, 29 Oct 2025 17:45:03 +0800
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
Subject: [PATCH 1/2] riscv: Build loader.bin exclusively for Canaan K210
Date: Wed, 29 Oct 2025 17:44:28 +0800
Message-Id: <20251029094429.553842-1-jiangfeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_024515_770868_25302BE3 
X-CRM114-Status: UNSURE (   7.56  )
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

According to the explanation in commit ef10bdf9c3e6 ("riscv:
Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210"),
loader.bin is a special feature of the Canaan K210 and
is not applicable to other SoCs.

Fixes: e79dfcbfb902 ("riscv: make image compression configurable")
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
---
 arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index ecf2fcce2d92..3998d4036f15 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -159,7 +159,7 @@ boot-image-$(CONFIG_KERNEL_LZO)		:= Image.lzo
 boot-image-$(CONFIG_KERNEL_ZSTD)	:= Image.zst
 boot-image-$(CONFIG_KERNEL_XZ)		:= Image.xz
 ifdef CONFIG_RISCV_M_MODE
-boot-image-$(CONFIG_ARCH_CANAAN)	:= loader.bin
+boot-image-$(CONFIG_SOC_CANAAN_K210)	:= loader.bin
 endif
 boot-image-$(CONFIG_EFI_ZBOOT)		:= vmlinuz.efi
 boot-image-$(CONFIG_XIP_KERNEL)		:= xipImage
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
