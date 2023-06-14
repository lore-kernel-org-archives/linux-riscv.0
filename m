Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E79BEB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 17:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3bUz5mafuTEI+Nhoe7pVoKhqiJz4VnclwMGr4SW1YU=; b=Hww36nJTFNAz+Q
	5DZ7JjX7/cX1aoXK6uqMd113P2pTo8v1GVAEyXA5SmNitR21QeBC1CQDEVj7Xv95luyuUAGnbRXmG
	u8DP1OisUztm8qrR2ITj3Rs6XXqaN8jvhxAX5tCXvRJQaijtNA03f0kMM1rUDsgE0iSPXzrlHLCfp
	KGDxHjcfhKnUQhb8jrmvezOhZvAuFeOYnlpy05jl/sPEvnWhK1AyPb/COxALbBqBqaC74WZtwOy3+
	VXbJVkKNu90LvIY+Qqssj685WmmWIxmvnjEZK/mPoeNqjXzckPDE6V56zUOj8rCEGZwGc2LqiKAJa
	MnxQcedsA0itvCR1lUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Tx2-00CIfF-09;
	Wed, 14 Jun 2023 17:06:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Twz-00CIdc-0z
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 17:06:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D36CD638A3;
	Wed, 14 Jun 2023 17:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B11C433C8;
	Wed, 14 Jun 2023 17:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686762388;
	bh=IzRWhdBJbcEgHie+AfmJ1TfzRd1tYjsi5h/A0SNdze8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=smQcIBxnp+uHpcp3B4gZHVTHtsLsPvk7LzPNCHaPHXDdgWQfppJOBbHWv9OiMYr66
	 u0o41zBEh60PJysSMHJ86S6d/EkB7rB/QOMOe5h7x1qHDgNUqsdaorrRnRbtDtRFJJ
	 QKNUMDnIr91hos/JiBNnRg7o0RdVxQTX4xlOv3q3rj//YrQma9pOrbeW+TBcPLrr0N
	 7T1CvpFyG+ALpuyiSQGY+zhrEs5ddA/s9K6n6ltPGbEAMaBT3JueCPQBFSVE6FuTDp
	 zFAzI6bjX09kP3Hm1px4uVEvnPaVaOxWIOyzEhUcNPV64MZqSnHYQGeT/WDIq0Lw5m
	 kokFqBXz8U+kA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 2/3] riscv: mm: mark CBO relate initialization funcs as __init
Date: Thu, 15 Jun 2023 00:55:03 +0800
Message-Id: <20230614165504.532-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230614165504.532-1-jszhang@kernel.org>
References: <20230614165504.532-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_100629_384336_6C3897B1 
X-CRM114-Status: UNSURE (   8.66  )
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

The two functions cbo_get_block_size() and riscv_init_cbo_blocksizes()
are only called during booting, mark them as __init.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/mm/cacheflush.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index fca532ddf3ec..fbc59b3f69f2 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -104,9 +104,9 @@ EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 unsigned int riscv_cboz_block_size;
 EXPORT_SYMBOL_GPL(riscv_cboz_block_size);
 
-static void cbo_get_block_size(struct device_node *node,
-			       const char *name, u32 *block_size,
-			       unsigned long *first_hartid)
+static void __init cbo_get_block_size(struct device_node *node,
+				      const char *name, u32 *block_size,
+				      unsigned long *first_hartid)
 {
 	unsigned long hartid;
 	u32 val;
@@ -126,7 +126,7 @@ static void cbo_get_block_size(struct device_node *node,
 	}
 }
 
-void riscv_init_cbo_blocksizes(void)
+void __init riscv_init_cbo_blocksizes(void)
 {
 	unsigned long cbom_hartid, cboz_hartid;
 	u32 cbom_block_size = 0, cboz_block_size = 0;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
