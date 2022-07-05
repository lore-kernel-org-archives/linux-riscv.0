Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA445C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 10:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRe11J74E5LUhl9fQIJPZ+JxMtfFGGyOyrsWhJEGXPo=; b=bj4D/NcY0GLGq5
	pP3dtNaMywnaaghZlqEe4uc5jVHOjP2sYJyz/Q9k5ozSsJw2IVsAW1PbibJkPxTt6E6qvtot5BsRy
	c00A1TFnAzT/CDziYRO1/kOA9YSOIO8j4HbVcuaxeEDwZGJaSVm0G1NfPZPzUKpqicq7DKPnHUk6G
	N2ImBYScVceyHfO+rLij3XM3q8/JTMeqZB93a5+8kRQxqSaHOnaTzEvmIftdPWSOqflo3wv46VUMB
	TH18iNeaY/sITg2YhusKuGmYlXFhhlbaS1cPcEFU0/UbCl1+hf6NJ9PujmahhWmIXXJShwhzPVECu
	UqfqbMAAk1O0Ih6lHEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fR5-00H4FE-4Q; Tue, 05 Jul 2022 10:05:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fR1-00H4DH-0R
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 10:05:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A7112B81739;
	Tue,  5 Jul 2022 10:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560D9C341CB;
	Tue,  5 Jul 2022 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657015532;
	bh=Mg7Jc2LCDxRomq+uVQTfBNWd2Qq0EN+47Xu2WP2P0dk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mtd/22D9Z0meQz5AAxidpXgB8w3ndiMpvOfEXBd40jTKKp1CekB4IoCe3H/KfwciB
	 juL2qKTCAa4kT9EPLN2U60sCywLKjGjHVJc1LSiXp81aDLuYFGuR8uiKbPZy63ptam
	 MuUWQlmCW644rpiK5MLQbdiB+vjH6T7Y3iL56ltWWXVAyvd/OwQhLyWwsToBEoodbR
	 9Pn9MaUPI1+H8s30zvl69fZ3/wQ0dpyyt5I2H306A2eB8NJgxJW5PLsOp2OrZoap0Z
	 Kv+8xhqRGWSXFbx/L91Hv3mnvs9eEfgq143Cylzpr0/4iTRmHPSOVnotxvA29Q/kHu
	 oOpaNY801TLWQ==
From: guoren@kernel.org
To: palmer@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [RFC PATCH 1/4] riscv: Optimize satp_mode data type
Date: Tue,  5 Jul 2022 06:05:20 -0400
Message-Id: <20220705100523.1204595-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705100523.1204595-1-guoren@kernel.org>
References: <20220705100523.1204595-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_030535_236560_3A6F98FC 
X-CRM114-Status: GOOD (  11.36  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Fixup satp_mode data type. Use ulong instead of u64 for rv32
compatibility. Because the u64 type didn't cause any real problem, make
it as optimized.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 2 +-
 arch/riscv/mm/init.c             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1d1be9d9419c..edc68759b69d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -833,7 +833,7 @@ extern uintptr_t _dtb_early_pa;
 #define dtb_early_va	_dtb_early_va
 #define dtb_early_pa	_dtb_early_pa
 #endif /* CONFIG_XIP_KERNEL */
-extern u64 satp_mode;
+extern ulong satp_mode;
 extern bool pgtable_l4_enabled;
 
 void paging_init(void);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index d466ec670e1f..eea147b1a617 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -38,9 +38,9 @@ EXPORT_SYMBOL(kernel_map);
 #endif
 
 #ifdef CONFIG_64BIT
-u64 satp_mode __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_57 : SATP_MODE_39;
+ulong satp_mode __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_57 : SATP_MODE_39;
 #else
-u64 satp_mode __ro_after_init = SATP_MODE_32;
+ulong satp_mode __ro_after_init = SATP_MODE_32;
 #endif
 EXPORT_SYMBOL(satp_mode);
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
