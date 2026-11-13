Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ECA606A338
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dimt1/xe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JLLY8SWexzuwtW2mLBCVH3Vvojejm2YQbcH+2SuDHoc=; b=dimt1/xecQIon6ooeCzDNQmSp1
	cLaEVSXDw+gaH9qGUjpGY511taAxHjT0jsyBkc1Uv6+f3F16DQVTS3QmrvLPI0HpPcjiABVSDayNI
	dp6WZ1WjquCtico5P4YrVNgFN/CUIHjz5OGLAyk4TQ8hGEwwO1KL7UNLN/6iVsJL4fnlpzhaTij8p
	so5ZPKu2XShKOxWSs445xXQ5Dhk09L/0EvxU7xaBUgMMoYhelLPLAmBvYmBIZkjcJVR4L54S3AlXr
	5iwUnf74CM0OfZUeQYj4p7diC4yV6hQUt4r2WgRXQYxJI1U1u4qY7bwBpOdjT6Y+4Fszr8MCfDkSG
	QRjCJU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlUT-0000000BrCE-0TbF;
	Fri, 13 Nov 2026 07:14:29 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlTt-0000000Bqt6-29wC
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 07:14:10 +0000
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CUTN059151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:30 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:30 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:30 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 17/19] riscv: errata: andes: generalize cache errata for Andes cores
Date: Fri, 13 Nov 2026 15:11:41 +0800
Message-ID: <20261113071143.1446167-18-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AD7CUTN059151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_231354_613878_4F8D87BF 
X-CRM114-Status: GOOD (  16.91  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Andes cache errata probe only runs on AX45MP: it matches
ANDES_AX45MP_MARCHID/MIMPID and then asks the Andes SBI extension
whether IOCP is missing. Other Andes cores that need CCTL-based cache
maintenance, such as the A27L2, which has neither IOCP nor Zicbom, are
silently skipped.

The IOCP_SW_WORKAROUND SBI call cannot simply be used on every Andes
core: OpenSBI checks the IOCP bit in mmsc_cfg[47], which only exists on
RV64 cores. RV32 cores such as the A45MP report IOCP in mmsc_cfg2
instead, and cores such as the A25/A27 do not support IOCP at all.

Keep the existing SBI-based check for AX45MP. On other Andes cores, use
the Andes CCTL operations for cache maintenance when the core does not
implement Zicbom.

As the probe is no longer only about IOCP, rename errata_probe_iocp()
to errata_probe_andes_cache(), ERRATA_ANDES_NO_IOCP to
ERRATA_ANDES_CACHE, and the ERRATA_ANDES prompt from "Andes AX45MP
errata" to "Andes errata".

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 arch/riscv/Kconfig.errata                    |  2 +-
 arch/riscv/errata/andes/errata.c             | 13 +++++++------
 arch/riscv/include/asm/errata_list_vendors.h |  2 +-
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3c43e065aa01..ca8e52bee497 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -1,7 +1,7 @@
 menu "CPU errata selection"
 
 config ERRATA_ANDES
-	bool "Andes AX45MP errata"
+	bool "Andes errata"
 	depends on RISCV_SBI
 	help
 	  All Andes errata Kconfig depend on this Kconfig. Disabling
diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index dcc9d1ee5ffd..530d2df216e0 100644
--- a/arch/riscv/errata/andes/errata.c
+++ b/arch/riscv/errata/andes/errata.c
@@ -39,7 +39,7 @@ static long ax45mp_iocp_sw_workaround(void)
 	return ret.error ? 0 : ret.value;
 }
 
-static void errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigned long impid)
+static void errata_probe_andes_cache(unsigned int stage, unsigned long arch_id, unsigned long impid)
 {
 	static bool done;
 
@@ -51,11 +51,12 @@ static void errata_probe_iocp(unsigned int stage, unsigned long arch_id, unsigne
 
 	done = true;
 
-	if (arch_id != ANDES_AX45MP_MARCHID || impid != ANDES_AX45MP_MIMPID)
-		return;
-
-	if (!ax45mp_iocp_sw_workaround())
+	if (arch_id == ANDES_AX45MP_MARCHID && impid == ANDES_AX45MP_MIMPID) {
+		if (!ax45mp_iocp_sw_workaround())
+			return;
+	} else if (riscv_isa_extension_available(NULL, ZICBOM)) {
 		return;
+	}
 
 	/* Set this just to make core cbo code happy */
 	riscv_cbom_block_size = 1;
@@ -69,7 +70,7 @@ void __init_or_module andes_errata_patch_func(struct alt_entry *begin, struct al
 	BUILD_BUG_ON(ERRATA_ANDES_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
 
 	if (stage == RISCV_ALTERNATIVES_BOOT)
-		errata_probe_iocp(stage, archid, impid);
+		errata_probe_andes_cache(stage, archid, impid);
 
 	/* we have nothing to patch here ATM so just return back */
 }
diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
index 02b5ab0d23a8..d2fbef69f421 100644
--- a/arch/riscv/include/asm/errata_list_vendors.h
+++ b/arch/riscv/include/asm/errata_list_vendors.h
@@ -4,7 +4,7 @@
 #define ASM_ERRATA_LIST_VENDORS_H
 
 #ifdef CONFIG_ERRATA_ANDES
-#define	ERRATA_ANDES_NO_IOCP 0
+#define	ERRATA_ANDES_CACHE 0
 #define	ERRATA_ANDES_NUMBER 1
 #endif
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
