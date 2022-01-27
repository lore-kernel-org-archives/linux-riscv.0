Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759DCC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qAyaWhyBJH3JJ8qClpX8COMoh4W+uzL1M6whHo1wIsU=; b=N0ssGfHuwDv/Ko
	2mSI6cQV1NVCuTJvm9rQSYpBA/t4lo+o4dQVwPxttEfRgnPY7B8pysASdaVfkyS8IJZRAklpE+rXT
	1Xz5tqFBmJ4nh2Az1X9o6mLuQuszSkvQ6oTLi6oPQUT6OzSt1PCUj1tF6OMeAqKon6efOC2z4ponP
	1G3MTHLHacMzJmkr4rh42FtW9Ra9c3E+/BOCLHA73QLK4GYG3Hs0r2/iIhzY6EJ/m3AItvaMIyKbc
	rU1a+6YRSRpNHGRurmVCeF/Gi49HuKYOa2VKBuV9FdYwGEfkeJmtAHpQ26OacCtlQuLdAMcVERP00
	cu9sBzP+1fnyqb2C9QOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6Wx-00GCY4-9R; Thu, 27 Jan 2022 15:17:47 +0000
Received: from out28-73.mail.aliyun.com ([115.124.28.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WT-00GC5x-Lg
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:19 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08545136|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0149326-0.000578924-0.984489;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85P.l_1643296632; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85P.l_1643296632)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:17:14 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 10/12] RISC-V: workaround Nuclei UX600 cores with broken SATP
 CSR
Date: Thu, 27 Jan 2022 23:16:45 +0800
Message-Id: <20220127151647.2375449-11-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071717_974913_C84A1637 
X-CRM114-Status: GOOD (  12.29  )
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

Current release of Nuclei UX600 CPU cores have two errata against RISC-V
Privledged Specification 1.10: one is left over mvendorid value (not the
JEDEC ID), the other, which is a more breaking one that needs to be
workaround in software, is that satp will accept written value with
MODE=9 (Sv48, which is not supported by UX600), and silently change it
to MODE=8 (Sv39). As current kernel MMU initialization code relies on
the behavior defined on the spec (reject write request with unsupported
MODE value and do not change the CSR's value at all) to detect the
existence of Sv48, the erratum breaks the Sv48 detection code.

As both two errata are to be fixed in the next revision, use the first
to detect the existence of the second at runtime, and force Sv39 when
these errata are detected.

Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
---
 arch/riscv/include/asm/vendorid_list.h |  1 +
 arch/riscv/mm/init.c                   | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 9d934215b3c8..47ff43795d70 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -6,5 +6,6 @@
 #define ASM_VENDOR_LIST_H
 
 #define SIFIVE_VENDOR_ID	0x489
+#define NUCLEI_OLD_VENDOR_ID	0x2d33
 
 #endif
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index cf4d018b7d66..0085b14ae265 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -28,6 +28,8 @@
 #include <asm/io.h>
 #include <asm/ptdump.h>
 #include <asm/numa.h>
+#include <asm/sbi.h>
+#include <asm/vendorid_list.h>
 
 #include "../kernel/head.h"
 
@@ -591,6 +593,21 @@ static __init void set_satp_mode(void)
 	u64 identity_satp, hw_satp;
 	uintptr_t set_satp_mode_pmd;
 
+	if (sbi_get_mvendorid() == NUCLEI_OLD_VENDOR_ID) {
+		/*
+		 * Old Nuclei UX600 processor releases have broken
+		 * implementation of SATP register which prevents
+		 * proper runtime detection of Sv48 existence. In
+		 * addition these processor releases have an old
+		 * vendor id instead of proper JEDEC ID.
+		 *
+		 * As these releases do not support Sv48 at all,
+		 * force Sv39 on them.
+		 */
+		disable_pgtable_l4();
+		return;
+	}
+
 	set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
 	create_pgd_mapping(early_pg_dir,
 			   set_satp_mode_pmd, (uintptr_t)early_pud,
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
