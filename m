Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B4EC4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA6620708
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xYC8Kiam";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IGlvH/He"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AA6620708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LLvjP6UUF+mN2NFHQ/w8mCLk894u/K6BT448BmhIzQ4=; b=xYC8KiamK0TAM3BY6T9hRqDcY
	wB95sKdyXf2pP404bJ28keqaeUu59O9F12gNLiMlaDSXue16RKAyMMcv91I0NOptDVGZZsOEC5q5e
	zF2nqG23tJt41TlS7tm/muslXV3klrPXdtdWyMWbNMn5yzKEUozzBfqDJ8/l4J5RI09A3eI3N2iHd
	rKoweCxhcX3fgQwwHpcmS+lWa+zvBMr4TDQJpKG3IbWMJiMuc1HwIBfoIVJNE/S0CaH4aFslFFYWV
	dNwCUzN/Y2iQdsb0gxaLHWXD8duKjsagaZj0Pubwqjvz8RjdfdzyRVOA9z7oOSvRWik1T2Q/doFJo
	SsgbTSlNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXBWY-0004J6-7l; Mon, 26 Oct 2020 23:03:34 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXBWT-0004FU-At
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 23:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603753409; x=1635289409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rpPh1ri27/mV4Lq6GihXSvX59Cmyy4U53NNqLUWVVFg=;
 b=IGlvH/HeG+LtRaV9YRN/VJ92x3cba2Xbt5IlgvhW6e+2kqLjoheazKa4
 sW1k4tE7X3IClbO8GZrCFtEWXWaw9Z10Up+X6W49lJYIho/4KKBhLxPr2
 +SCivaneKgpreYsC5Y8azdPya3U/n+E6tRaDB0Ng+h9KlEA4yLVQqFKuW
 5EV34s13VQxzRapuie7tGx1zyifO+6Q5LDaThml/ORK27gZ6YyBj0KtL6
 GHRilGu/kY2wjPWoyrDcf4iHq4r9f1cDqC8idZ7XZfadax/iMkDzWSvxc
 h3S4iEtcZS0Q5No2RWoGmOeTp52XEQEbzIpu4vPsmBPYFAqNY7Yvtel/0 w==;
IronPort-SDR: upmBvvWfa2b8MmYHtzqu/BqkOl1YAZk4qwb3OWmRVkBz8Q8KNLXxZyJtY64PG/zF08rvh/1ZYP
 eovKyM4rqIXsWEQeZSixcDrHE288ygjSxu/f+cXPkVfHxCPMN9tpkTqQgBIfsHe8Y0BHaCOc8/
 H1knVJMdHIOeCfezAL5il2HBu/Vym8HSP4WMEa6m622CDWZS5oefiHvEmWwI65GZcaPoKObN4B
 GJY7amcMkWsk0AGmo7dnQY0jxcqcEaGcsiKs8/iV8DsGM6MhpQ3Cgu/fZbCNR/A83dQTFTtHi9
 w90=
X-IronPort-AV: E=Sophos;i="5.77,421,1596470400"; d="scan'208";a="152152909"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2020 07:03:24 +0800
IronPort-SDR: LUcWKsGyxMhMy14zInqMDnSWvfLodcW3JZm43fD96zVbcHRGq/jkMyPQqmKawb3/LQH2EKNkH6
 68itcHUR8Xwwv5Vo/ao/+1tgsmQFo+r8v44sW7uMNA0ifzfNDS5w5hhrR4yQGlaxdrzwim8RBe
 bIu9SGubi5/WfG5pmuBdctXpWGyr3ahj7O4Z/z3AzIvgp9VndisL9xZGGOrv1Pc82IALWjlrDX
 wSvQpsoUO/jqBe5rRTNxSiGlVEu2VVYYkXXfaRrnHfol12PqMWCBve/MdFLrLdrbM2gHsPxczG
 cRcC19KGip4DdpqeSITONqGB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 15:48:35 -0700
IronPort-SDR: rriut/QXTurmMnXEV+/wkdh18jeVeIaUuF5OpX2DpiAjha4uQ2m8xvQ2+CYVPztIlri/dGG9Fx
 sn4DjUGAMl9xld4i92d4WY0ChJTrDHbpMX+/nWTBiwVYjSvhmt8dWvvRfITcAe8aHbsJflfw31
 X7bMdmMoJiKhs3WflXZAL19ePomMnN9ectpJbqja3ffpDKFD6UTBM+ZaybUNAdN7ZoQ4QlFV6l
 1tP01QkDPJPYD5O1x+9fKaT5edDaRfBK6oaYcjCM8Jv0VUQ424prp5C290AGcHQRTt2fhXTuUe
 LPU=
WDCIronportException: Internal
Received: from 8223p12.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.110])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2020 16:03:25 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] RISC-V: Enforce protections for kernel sections early
Date: Mon, 26 Oct 2020 16:02:51 -0700
Message-Id: <20201026230254.911912-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026230254.911912-1-atish.patra@wdc.com>
References: <20201026230254.911912-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_190329_555710_AE8BAB41 
X-CRM114-Status: GOOD (  16.68  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, all memblocks are mapped with PAGE_KERNEL_EXEC and the strict
permissions are only enforced after /init starts. This leaves the kernel
vulnerable from possible buggy built-in modules.

Apply permissions to individual sections as early as possible.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/set_memory.h |  2 ++
 arch/riscv/kernel/setup.c           |  2 ++
 arch/riscv/mm/init.c                | 11 +++++++++--
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 4c5bae7ca01c..4cc3a4e2afd3 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -15,11 +15,13 @@ int set_memory_ro(unsigned long addr, int numpages);
 int set_memory_rw(unsigned long addr, int numpages);
 int set_memory_x(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
+void protect_kernel_text_data(void);
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
+static inline void protect_kernel_text_data(void) {};
 #endif
 
 int set_direct_map_invalid_noflush(struct page *page);
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 7d6a04ae3929..b722c5bf892c 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -22,6 +22,7 @@
 #include <asm/cpu_ops.h>
 #include <asm/early_ioremap.h>
 #include <asm/setup.h>
+#include <asm/set_memory.h>
 #include <asm/sections.h>
 #include <asm/sbi.h>
 #include <asm/tlbflush.h>
@@ -92,6 +93,7 @@ void __init setup_arch(char **cmdline_p)
 #if IS_ENABLED(CONFIG_RISCV_SBI)
 	sbi_init();
 #endif
+	protect_kernel_text_data();
 #ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
 #endif
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index ea933b789a88..5f196f8158d4 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -608,7 +608,7 @@ static inline void setup_vm_final(void)
 #endif /* CONFIG_MMU */
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
-void mark_rodata_ro(void)
+void protect_kernel_text_data(void)
 {
 	unsigned long text_start = (unsigned long)_text;
 	unsigned long text_end = (unsigned long)_etext;
@@ -617,9 +617,16 @@ void mark_rodata_ro(void)
 	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
 
 	set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
-	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
+}
+
+void mark_rodata_ro(void)
+{
+	unsigned long rodata_start = (unsigned long)__start_rodata;
+	unsigned long data_start = (unsigned long)_data;
+
+	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
 
 	debug_checkwx();
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
