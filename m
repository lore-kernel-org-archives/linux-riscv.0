Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AFFEE14A9
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 02:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HIFxRPmJWHrjre2NSJ8bjqMCasIPMjnHStfXlLljes=; b=GrH/0KtvQAtNhB
	tIwJCLjILh+beDxcrjQAWVKmAL5XPxX3VimENKMTcWrDRDn1fLlNQNSlkzgRrYSGQW2SOKhXFn/RL
	Yi9uu9K9EhnAcooV3mwpzriIhI88gHC+LhZcHiodLzTTCUMj5S6I8hhXqr9Ieh8d2dwSfhCp257K3
	l+Zqyt9VWtP2HPqQ0IwuOX+LWyJtN+mvG7Z91CrEKjiuyC4K5oRLIV4KqCVCUEzEKl+ogi0EQc5WN
	eFrSP/bqUtFcDuN6yJjnRmkj7VLiF2MwjOO1EXLdazGkJhszg18qoYHftZSbrB6PLmy5otOshymOw
	oHx6msu+TXUVzyVmvFpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe4bb-00BBKB-0Y;
	Thu, 07 Sep 2023 02:18:51 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe4bS-00BBH4-2x;
	Thu, 07 Sep 2023 02:18:46 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3872IAm6024109;
	Thu, 7 Sep 2023 10:18:10 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 7 Sep 2023
 10:18:05 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <conor.dooley@microchip.com>,
        <atishp@atishpatra.org>, <anup@brainfault.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: <ajones@ventanamicro.com>, <heiko@sntech.de>, <samuel@sholland.org>,
        <geert+renesas@glider.be>, <n.shubin@yadro.com>,
        <dminus@andestech.com>, <ycliang@andestech.com>,
        <tim609@andestech.com>, <locus84@andestech.com>, <dylan@andestech.com>,
        Yu Chien Peter Lin <peterlin@andestech.com>
Subject: [PATCH 1/4] riscv: errata: Rename defines for Andes
Date: Thu, 7 Sep 2023 10:16:32 +0800
Message-ID: <20230907021635.1002738-2-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230907021635.1002738-1-peterlin@andestech.com>
References: <20230907021635.1002738-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3872IAm6024109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_191843_394640_FE608CA8 
X-CRM114-Status: GOOD (  12.91  )
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

Using "ANDES" rather than "ANDESTECH" to unify the naming
convention with OpenSBI and U-Boot, and reduce the number
of characters per line.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
Hi Prabhakar,

Sorry for the churn.
We've made the decision to abbreviate andestech in our code, the former
is commonly used in documentation, comment and device tree compatible
string.
---
 arch/riscv/errata/andes/errata.c       | 10 +++++-----
 arch/riscv/include/asm/errata_list.h   |  4 ++--
 arch/riscv/include/asm/vendorid_list.h |  2 +-
 arch/riscv/kernel/alternative.c        |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index 197db68cc8da..d2e1abcac967 100644
--- a/arch/riscv/errata/andes/errata.c
+++ b/arch/riscv/errata/andes/errata.c
@@ -18,9 +18,9 @@
 #include <asm/sbi.h>
 #include <asm/vendorid_list.h>
 
-#define ANDESTECH_AX45MP_MARCHID	0x8000000000008a45UL
-#define ANDESTECH_AX45MP_MIMPID		0x500UL
-#define ANDESTECH_SBI_EXT_ANDES		0x0900031E
+#define ANDES_AX45MP_MARCHID		0x8000000000008a45UL
+#define ANDES_AX45MP_MIMPID		0x500UL
+#define ANDES_SBI_EXT_ANDES		0x0900031E
 
 #define ANDES_SBI_EXT_IOCP_SW_WORKAROUND	1
 
@@ -32,7 +32,7 @@ static long ax45mp_iocp_sw_workaround(void)
 	 * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP is missing and
 	 * cache is controllable only then CMO will be applied to the platform.
 	 */
-	ret = sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
+	ret = sbi_ecall(ANDES_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
 			0, 0, 0, 0, 0, 0);
 
 	return ret.error ? 0 : ret.value;
@@ -43,7 +43,7 @@ static bool errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigne
 	if (!IS_ENABLED(CONFIG_ERRATA_ANDES_CMO))
 		return false;
 
-	if (arch_id != ANDESTECH_AX45MP_MARCHID || impid != ANDESTECH_AX45MP_MIMPID)
+	if (arch_id != ANDES_AX45MP_MARCHID || impid != ANDES_AX45MP_MIMPID)
 		return false;
 
 	if (!ax45mp_iocp_sw_workaround())
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index e2ecd01bfac7..56ab40e64092 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -12,8 +12,8 @@
 #include <asm/vendorid_list.h>
 
 #ifdef CONFIG_ERRATA_ANDES
-#define ERRATA_ANDESTECH_NO_IOCP	0
-#define ERRATA_ANDESTECH_NUMBER		1
+#define ERRATA_ANDES_NO_IOCP 0
+#define ERRATA_ANDES_NUMBER 1
 #endif
 
 #ifdef CONFIG_ERRATA_SIFIVE
diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index e55407ace0c3..2f2bb0c84f9a 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -5,7 +5,7 @@
 #ifndef ASM_VENDOR_LIST_H
 #define ASM_VENDOR_LIST_H
 
-#define ANDESTECH_VENDOR_ID	0x31e
+#define ANDES_VENDOR_ID		0x31e
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 319a1da0358b..0128b161bfda 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -43,7 +43,7 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info
 
 	switch (cpu_mfr_info->vendor_id) {
 #ifdef CONFIG_ERRATA_ANDES
-	case ANDESTECH_VENDOR_ID:
+	case ANDES_VENDOR_ID:
 		cpu_mfr_info->patch_func = andes_errata_patch_func;
 		break;
 #endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
