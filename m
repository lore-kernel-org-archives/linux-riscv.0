Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D632FC47089
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUbgvbFq32WdhlOYDHOcgrkKrqgTpK4RJCYCQrV6M+M=; b=hMGvAvCR9McW2h
	50iuqX9Ykx0i7ep2pe2jjPK55QfIOf4BYKCtBsusuCuS2GSZFx9bxr4SeXxCAbPFcPkklvsG8XgUv
	TjYFWG0uKaJiYxWo9sd4AaO3UnDp61V3nvjPkXvPqW6wZcDEQuTs83TdvZ8Lq5OlEPmSRAqF1S49K
	Cuhji8L3BJTnwvBMed+/q7B24UBePE0lSsw4ZYhG2VuxcnZNHysbMZyeOg2E+6vQPIFUaytTxXFrR
	YHLcHYlpB09hOc0Gos1f2LHumCrP9fVYPmTlSTi0+xxJSPyaHxYU8CoD/JXSvwUlHpKNChFXojJm7
	7PXMYX8rpmOjQMxih7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Cjg-004C2G-TN; Mon, 05 Dec 2022 14:46:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Cjc-004BuU-W8
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 14:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1670251580; x=1701787580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mR+tA9ajFYArrwEF7cxAJbYpdeZOV3FQATUmv3J86uc=;
  b=uZ/V4DZHi5OMuwCLOuwcqXyLmtm/XjKFnCCuLVf88YGlXlSt7tYc4QDw
   WppaCruC7i8vGy1b+cGx6s7MnTlpm9yx770JrHKapOJ4Kw6A1BEgGYnK7
   4DNN1Pi71j++DKkoPV4OSFOi8aAdIIDj+wCjAVaLLmmuobtrlkPKZyct8
   Xu+C2G+UXciMplRImNxIO7j0XfuzwNKFpxIC2RBzg9M5ZQGxtX/3UrBOS
   t/M8f3xdKQ4u1iSqU7Mu3iufv8kb4E9kIYojtyYF3h9YLZwEI83Ohe858
   srJYoFao8pgH0P5yDfi5rCkzi9BCkQ5H3uludRep3JiTPYCVALUSagcry
   w==;
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="202640935"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Dec 2022 07:46:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Dec 2022 07:46:17 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Dec 2022 07:46:15 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>, <ajones@ventanamicro.com>,
	<aou@eecs.berkeley.edu>, <conor@kernel.org>, <corbet@lwn.net>,
	<guoren@kernel.org>, <heiko@sntech.de>, <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Heiko Stuebner
	<heiko.stuebner@vrull.eu>
Subject: [PATCH v2 2/3] RISC-V: resort all extensions in consistent orders
Date: Mon, 5 Dec 2022 14:45:25 +0000
Message-ID: <20221205144525.2148448-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205144525.2148448-1-conor.dooley@microchip.com>
References: <20221205144525.2148448-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_064621_065443_7A0B2D17 
X-CRM114-Status: GOOD (  11.62  )
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

Ordering between each and every list of extensions is wildly
inconsistent. Per discussion on the lists pick the following policy:

- The array defining order in /proc/cpuinfo follows a narrow
  interpretation of the ISA specifications, described in a comment
  immediately presiding it.

- All other lists of extensions are sorted alphabetically.

This will hopefully allow for easier review & future additions, and
reduce conflicts between patchsets as the number of extensions grows.

Link: https://lore.kernel.org/all/20221129144742.2935581-2-conor.dooley@microchip.com/
Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h | 12 +++++++-----
 arch/riscv/kernel/cpu.c        |  4 ++--
 arch/riscv/kernel/cpufeature.c |  6 ++++--
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b22525290073..ce522aad641a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -51,14 +51,15 @@ extern unsigned long elf_hwcap;
  * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
  * extensions while all the multi-letter extensions should define the next
  * available logical extension id.
+ * Entries are sorted alphabetically.
  */
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
+	RISCV_ISA_EXT_SSTC,
+	RISCV_ISA_EXT_SVINVAL,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
-	RISCV_ISA_EXT_SSTC,
-	RISCV_ISA_EXT_SVINVAL,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
@@ -66,11 +67,12 @@ enum riscv_isa_ext_id {
  * This enum represents the logical ID for each RISC-V ISA extension static
  * keys. We can use static key to optimize code path if some ISA extensions
  * are available.
+ * Entries are sorted alphabetically.
  */
 enum riscv_isa_ext_key {
 	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
-	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
 	RISCV_ISA_EXT_KEY_SVINVAL,
+	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
 	RISCV_ISA_EXT_KEY_MAX,
 };
 
@@ -90,10 +92,10 @@ static __always_inline int riscv_isa_ext2key(int num)
 		return RISCV_ISA_EXT_KEY_FPU;
 	case RISCV_ISA_EXT_d:
 		return RISCV_ISA_EXT_KEY_FPU;
-	case RISCV_ISA_EXT_ZIHINTPAUSE:
-		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
 	case RISCV_ISA_EXT_SVINVAL:
 		return RISCV_ISA_EXT_KEY_SVINVAL;
+	case RISCV_ISA_EXT_ZIHINTPAUSE:
+		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index db8b16ad9342..0bf1c7f663fc 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -185,12 +185,12 @@ arch_initcall(riscv_cpuinfo_init);
  * New entries to this struct should follow the ordering rules described above.
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
+	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
-	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
-	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 694267d1fe81..8a76a6ce70cf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -199,12 +199,13 @@ void __init riscv_fill_hwcap(void)
 				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
 				set_bit(*ext - 'a', this_isa);
 			} else {
+				/* sorted alphabetically */
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
+				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
+				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
-				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
-				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
 			}
 #undef SET_ISA_EXT_MAP
 		}
@@ -284,6 +285,7 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
  * This code may also be executed before kernel relocation, so we cannot use
  * addresses generated by the address-of operator as they won't be valid in
  * this context.
+ * Tests, unless otherwise required, are to be added in alphabetical order.
  */
 static u32 __init_or_module cpufeature_probe(unsigned int stage)
 {
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
