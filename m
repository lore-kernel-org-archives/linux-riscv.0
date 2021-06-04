Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE4DC07E94
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 11:51:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD657613FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 11:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD657613FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROysGDfbhLvt0bpcEVxTQWEVtr++5zIuGxMnKzzEXs8=; b=3dqTOESkv+UdCJ
	oELkE1PUAipSFe69oJsY/9e+Y1zA/DuSsqrArkPwXnEGH/qF4OXHBORZzfhjO+A2lnajlHvRV8flu
	lYmUxQ2VrCFl34YLfU/rWTL4RaPpGFN7Hh8c5FjYqzXTM9X2AHYay+LZMGJPRpuhRpUuGgJzE945/
	9lyD9Se791Of/qDjaplrsEli7R2XJy8G7bUMvyHaVq4EsS/wjxUYWi/4UXUl1A1gzyz7UwKReK/7l
	hbE8aO2EDrUEMR43bbnoAwC8ZBFnnuK1B6lsqiMDIlyrWc1xRWLvgx46miMv62t/gynd2ezcKE4ha
	fnlFQ11TmFE/mTv1tvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp8M1-00DPE9-NQ; Fri, 04 Jun 2021 11:51:09 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp8Lz-00DPBu-Ct
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 11:51:08 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5547A20007;
 Fri,  4 Jun 2021 11:50:58 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v4 1/4] riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED
Date: Fri,  4 Jun 2021 13:49:47 +0200
Message-Id: <20210604114950.1446390-2-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210604114950.1446390-1-alex@ghiti.fr>
References: <20210604114950.1446390-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_045107_596178_168D7E0A 
X-CRM114-Status: UNSURE (   8.37  )
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

Make the physical RAM base address available for all kernels, not only
XIP kernels as it will allow to simplify address conversions macros.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/Kconfig | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b58596b141fc..3d8e7e4bb45c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -493,13 +493,8 @@ config STACKPROTECTOR_PER_TASK
 	def_bool y
 	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
 
-config PHYS_RAM_BASE_FIXED
-	bool "Explicitly specified physical RAM address"
-	default n
-
 config PHYS_RAM_BASE
 	hex "Platform Physical RAM address"
-	depends on PHYS_RAM_BASE_FIXED
 	default "0x80000000"
 	help
 	  This is the physical address of RAM in the system. It has to be
@@ -512,7 +507,6 @@ config XIP_KERNEL
 	# This prevents XIP from being enabled by all{yes,mod}config, which
 	# fail to build since XIP doesn't support large kernels.
 	depends on !COMPILE_TEST
-	select PHYS_RAM_BASE_FIXED
 	help
 	  Execute-In-Place allows the kernel to run from non-volatile storage
 	  directly addressable by the CPU, such as NOR flash. This saves RAM
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
