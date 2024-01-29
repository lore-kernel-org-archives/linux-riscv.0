Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B8BC47DA9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 09:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jh/qLo0zI8eQMBEHtZeTi91vuqhhlhkgR4ntIbsr+VQ=; b=ULA9lbPK75QPQs
	hvGbCcszTYH5aRovBZtHKE83OogHubA16qpAN7mem8HNsXTKYKMBuSn5yUtD6o0g+pNMOdj7x5u1y
	jQSj6RAwQ6XOROrkfDkm/dEdvGNH5Zt1SEOJ3vuet41DHBo30icDUIBb0JdSPSy5wu/9DsVgzCN1f
	tqBT/hq7BOjQtR5R6iBazMvt6y/RmOseIUyDbpmpY9P50I/Bwaeb9EA+17dHrLudnn37sFpds4Tkk
	VZSwKCCykS8F4rNFBYfqxUqKYx9kEjX6+KvS8dbU8vYwzvgiuIvaPSpBspOK0w+H1b0Bx5nH7CPDe
	gxg3pxzqSPLA6mhQuILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUNvZ-0000000C0sx-3Kir;
	Mon, 29 Jan 2024 09:27:41 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUNvM-0000000C0ig-2QBd;
	Mon, 29 Jan 2024 09:27:31 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 40T9Q4pt080023;
	Mon, 29 Jan 2024 17:26:04 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Jan 2024
 17:26:01 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <acme@kernel.org>, <adrian.hunter@intel.com>, <ajones@ventanamicro.com>,
        <alexander.shishkin@linux.intel.com>, <andre.przywara@arm.com>,
        <anup@brainfault.org>, <aou@eecs.berkeley.edu>,
        <atishp@atishpatra.org>, <conor+dt@kernel.org>,
        <conor.dooley@microchip.com>, <conor@kernel.org>,
        <devicetree@vger.kernel.org>, <evan@rivosinc.com>,
        <geert+renesas@glider.be>, <guoren@kernel.org>, <heiko@sntech.de>,
        <irogers@google.com>, <jernej.skrabec@gmail.com>, <jolsa@kernel.org>,
        <jszhang@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-perf-users@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <locus84@andestech.com>,
        <magnus.damm@gmail.com>, <mark.rutland@arm.com>, <mingo@redhat.com>,
        <n.shubin@yadro.com>, <namhyung@kernel.org>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <peterlin@andestech.com>,
        <peterz@infradead.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <rdunlap@infradead.org>, <robh+dt@kernel.org>, <samuel@sholland.org>,
        <sunilvl@ventanamicro.com>, <tglx@linutronix.de>,
        <tim609@andestech.com>, <uwu@icenowy.me>, <wens@csie.org>,
        <will@kernel.org>, <inochiama@outlook.com>, <unicorn_wang@outlook.com>,
        <wefu@redhat.com>
CC: Charles Ci-Jyun Wu <dminus@andestech.com>,
        Leo Yu-Chi Liang
	<ycliang@andestech.com>
Subject: [PATCH v8 01/10] riscv: errata: Rename defines for Andes
Date: Mon, 29 Jan 2024 17:25:44 +0800
Message-ID: <20240129092553.2058043-2-peterlin@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129092553.2058043-1-peterlin@andestech.com>
References: <20240129092553.2058043-1-peterlin@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 40T9Q4pt080023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_012729_166404_5029AF55 
X-CRM114-Status: GOOD (  11.77  )
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

Use "ANDES" rather than "ANDESTECH" to unify the naming
convention with directory, file names, Kconfig options
and other definitions.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Charles Ci-Jyun Wu <dminus@andestech.com>
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Changes v1 -> v2:
  - No change
Changes v2 -> v3:
  - Rewrite commit message (suggested by Conor)
Changes v3 -> v4:
  - Include Conor's Acked-by tag
Changes v4 -> v5:
  - Include Prabhakar's RB tag
Changes v5 -> v6:
  - No change
Changes v6 -> v7:
  - No change
Changes v7 -> v8:
  - No change
---
 arch/riscv/errata/andes/errata.c       | 10 +++++-----
 arch/riscv/include/asm/errata_list.h   |  4 ++--
 arch/riscv/include/asm/vendorid_list.h |  2 +-
 arch/riscv/kernel/alternative.c        |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index 17a904869724..f2708a9494a1 100644
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
@@ -50,7 +50,7 @@ static void errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigne
 
 	done = true;
 
-	if (arch_id != ANDESTECH_AX45MP_MARCHID || impid != ANDESTECH_AX45MP_MIMPID)
+	if (arch_id != ANDES_AX45MP_MARCHID || impid != ANDES_AX45MP_MIMPID)
 		return;
 
 	if (!ax45mp_iocp_sw_workaround())
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index ea33288f8a25..96025eec5631 100644
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
