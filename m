Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC02BC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 07:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vD1giQbTogZ5i7YwTPrO7HRwBbCkGvS4q+R9V+Bu5rY=; b=gICr/Ow7fV80cg
	dbxUWk5Qt7+XhOilTz8w9uRfpsCFgxCLq3QEylX6N9h/RpQvw8Cp5BqJw/O4EOj52Lq+gkJLOY9VR
	40Bbd5/+l42Bl8O4kQArS/EYVmRRRg9yebpxtixjJ96T933Svlrj06YLVMYiLpBiSUHT2UkCXotGC
	x9i7/ZgibOOQJ8Gpp024ecDE8GOxuEHgThZokIvz11epsNUubUYdi6YIDoLV9kCnMLp3n+CX0rmKn
	xgcuhTCVbnB7+xseyZdZmTojJo0uR6GJGoGBT9RQsY4Qaqil2NOFcq565S69ZQEhDE7hNyemh+S1S
	PNxJ43lZNX5kRXMmBzWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8u-000MZu-U7; Thu, 06 Oct 2022 07:18:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8n-000MUD-Qh
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 07:17:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 53353B8200C;
	Thu,  6 Oct 2022 07:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0314EC433D7;
	Thu,  6 Oct 2022 07:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665040675;
	bh=8Lz5QrNESG5omW8wbab7hELS/76piojMbUm54X300LI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KMsgMjntB8QBpKSj/OwpDvzeZC0oQuw2e186kJD8lDrw2bUsLph94Bw2iP6w9t/p5
	 vfCG2PZaKRoA3hi1nXZGVUYxLxTMnBw4TdL3s/2vVe9XOHeXMlagj5MJ8sjjgoYqiT
	 u/iSC7qUW9ePnYTIiMCEaKpAysyiX1jeDj0uKzmKmBpuSRvsGsCzoIYZ+MiURkaOGp
	 TYlY35eLWx3AdaihEDRt1vP1YAMBQ1fsltXWyG4oBQYo3r5hlic2fVKaeL+Ntz4wfz
	 cQdh/g8iB3S9PJIYWmmDb7SA1z5dfNCTTah5z6N61moxkEiiMTLEHhnCxoTFqhATCO
	 JlGn9ksW+3jlQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] riscv: hwcap: make ISA extension ids can be used in asm
Date: Thu,  6 Oct 2022 15:08:13 +0800
Message-Id: <20221006070818.3616-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221006070818.3616-1-jszhang@kernel.org>
References: <20221006070818.3616-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_001758_034045_0405CBA5 
X-CRM114-Status: GOOD (  12.86  )
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

We will make use of ISA extension in asm files, so make the multi-letter
RISC-V ISA extension IDs macros rather than enums and move them and
those base ISA extension IDs to suitable place.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/hwcap.h | 45 +++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6f59ec64175e..6cf445653911 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -12,20 +12,6 @@
 #include <linux/bits.h>
 #include <uapi/asm/hwcap.h>
 
-#ifndef __ASSEMBLY__
-#include <linux/jump_label.h>
-/*
- * This yields a mask that user programs can use to figure out what
- * instruction set this cpu supports.
- */
-#define ELF_HWCAP		(elf_hwcap)
-
-enum {
-	CAP_HWCAP = 1,
-};
-
-extern unsigned long elf_hwcap;
-
 #define RISCV_ISA_EXT_a		('a' - 'a')
 #define RISCV_ISA_EXT_c		('c' - 'a')
 #define RISCV_ISA_EXT_d		('d' - 'a')
@@ -46,21 +32,36 @@ extern unsigned long elf_hwcap;
 #define RISCV_ISA_EXT_BASE 26
 
 /*
- * This enum represent the logical ID for each multi-letter RISC-V ISA extension.
+ * These macros represent the logical ID for each multi-letter RISC-V ISA extension.
  * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
  * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
  * extensions while all the multi-letter extensions should define the next
  * available logical extension id.
  */
-enum riscv_isa_ext_id {
-	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
-	RISCV_ISA_EXT_SVPBMT,
-	RISCV_ISA_EXT_ZICBOM,
-	RISCV_ISA_EXT_ZIHINTPAUSE,
-	RISCV_ISA_EXT_SSTC,
-	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
+#define RISCV_ISA_EXT_SSCOFPMF 		26
+#define RISCV_ISA_EXT_SVPBMT		27
+#define RISCV_ISA_EXT_ZICBOM		28
+#define RISCV_ISA_EXT_ZIHINTPAUSE	29
+#define RISCV_ISA_EXT_SSTC		30
+
+#define RISCV_ISA_EXT_ID_MAX		RISCV_ISA_EXT_MAX
+
+
+#ifndef __ASSEMBLY__
+#include <linux/jump_label.h>
+/*
+ * This yields a mask that user programs can use to figure out what
+ * instruction set this cpu supports.
+ */
+#define ELF_HWCAP		(elf_hwcap)
+
+enum {
+	CAP_HWCAP = 1,
 };
 
+extern unsigned long elf_hwcap;
+
+
 /*
  * This enum represents the logical ID for each RISC-V ISA extension static
  * keys. We can use static key to optimize code path if some ISA extensions
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
