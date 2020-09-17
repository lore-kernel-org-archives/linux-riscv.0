Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C561C43463
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 22:38:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E84122087D
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 22:38:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="izDYmeAl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HPMN5y4i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E84122087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B8XCabI0G2rSV3u0e6aLT63udr01h1es1DWq8XeijNQ=; b=izDYmeAl7Fe/R3QyoDgPUgQEN
	4uZusPAQD0PNPMsqNA7du+2IK3Hmvm+YGwZwWbqbjiK4/d+rOObthR7WZ9ykgEUIyLxdftZKqdE8g
	vTdb/9R7jWbPwEkai/5WCUzGqqllAsEMKNlEfTLRypSebJIt9Knc4r4Kta7x7zvhHKUX34Nd1Twsp
	gBEQyAEw/vLHZDL92Qnko1fAT87A6aJUhDMN/vSB9c6SCTXjiIdtGcnpdf13ElCITKmycnrAXcJV1
	P88JW9Hbw5aYDdXESHkSUYrCHMMoM2kLXaZqrIvv5yvH0nByabuvQL0VjVsEW7WE8IiROnoqecR4Y
	v4L90aaLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ2XJ-0005lm-SW; Thu, 17 Sep 2020 22:37:53 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ2XC-0005fc-Kx
 for linux-riscv@lists.infradead.org; Thu, 17 Sep 2020 22:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600382266; x=1631918266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=442DvRpDFEIcCxIif/4Q8FsTmegEl5WBXsmfapV7ChU=;
 b=HPMN5y4iiMS8wV8vDWJTJ7P/Wt4iNQJJkfN/YeHmuzqJxcbwWPe//QRy
 ZJ2Oc+GTR44DASZh+o2XYQfFeHkufjYcbA8gN+G+j5vBK9d9wxyiiKB91
 W1mn6f6gVLNnLrbq5rIwlOF+/4XJjD4dDF4tFsUEeChmWnww4LSRF+aSw
 NYz8w23w1W9HMBAa8VLEQcCHYcocZ0wCJksDUH1V7EAzNVNXoTfEBKik3
 nCCql7Lp8fYiGSGM9MtH3NMuCCEjdc/0iPG5vn7KS/RL391xn8teSMVkj
 SHX0wmF6b+fyHQDIJFZWlxa7xj9G9Gs6ywlHcTD0a4U5wkHuqrlS8Mh00 w==;
IronPort-SDR: NZGKGOeRmY49rPoDCDg19csFrMkwsV3o+tabdYeW7kYORDb4DejF6AciPZF368zyJXtRPzdwMO
 D51lGfkVpx9uTSugGvsepAIKUSlZ9USNefQw9eQtaN9ke1J/At7/q0Oi9qMrGS7hiqS13UmdyQ
 Sc2uMHog237FwjWs3cep6nApokCLSBRNCgOSNHIISgt/YHmbi9jV6LBpZMLAKa7vJiGIj540Vx
 15nArPP7FuuWjzJixiko1r6Azjby5cfp+cy7T40Fpwy+9DVCJ/WtVaDDas3r23g2C3nlFoo4vl
 I3E=
X-IronPort-AV: E=Sophos;i="5.77,272,1596470400"; d="scan'208";a="257336261"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Sep 2020 06:37:43 +0800
IronPort-SDR: NtTpIw2z5aMlGj8FzvpgswwVxW0i/ihp/GttqkDx2/VGzDX2QtOs1XjOyqlTNFia7UyroNhSvv
 xibnBJ/tBOWQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 15:23:57 -0700
IronPort-SDR: wrXIzonbackQ6e9XZnFifGX9ISPiDEGGrJezt3qkhBAlbQc65qc4Oo3JxmZ3qiEUgdqG4lhSUU
 qiYx3gppgXVw==
WDCIronportException: Internal
Received: from use204338.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.39])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Sep 2020 15:37:43 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 7/7] RISC-V: Add page table dump support for uefi
Date: Thu, 17 Sep 2020 15:37:16 -0700
Message-Id: <20200917223716.2300238-8-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917223716.2300238-1-atish.patra@wdc.com>
References: <20200917223716.2300238-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_183746_869331_8F2FFA28 
X-CRM114-Status: GOOD (  16.93  )
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
Cc: linux-efi@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Maxim Uvarov <maxim.uvarov@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Anup Patel <anup@brainfault.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Ard Biesheuvel <ardb@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>, Borislav Petkov <bp@suse.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Heiko Carstens <hca@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Extend the current page table dump support in RISC-V to include efi
pages as well.

Here is the output of efi runtime page table mappings.

---[ UEFI runtime start ]---
0x0000000020002000-0x0000000020003000 0x00000000be732000 4K PTE D A . . . W R V
0x0000000020018000-0x0000000020019000 0x00000000be738000 4K PTE D A . . . W R V
0x000000002002c000-0x000000002002d000 0x00000000be73c000 4K PTE D A . . . W R V
0x0000000020031000-0x0000000020032000 0x00000000bff61000 4K PTE D A . . X W R V
---[ UEFI runtime end ]---

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/mm/ptdump.c | 48 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 0831c2e61a8f..ace74dec7492 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2019 SiFive
  */
 
+#include <linux/efi.h>
 #include <linux/init.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
@@ -49,6 +50,14 @@ struct addr_marker {
 	const char *name;
 };
 
+/* Private information for debugfs */
+struct ptd_mm_info {
+	struct mm_struct		*mm;
+	const struct addr_marker	*markers;
+	unsigned long base_addr;
+	unsigned long end;
+};
+
 static struct addr_marker address_markers[] = {
 #ifdef CONFIG_KASAN
 	{KASAN_SHADOW_START,	"Kasan shadow start"},
@@ -68,6 +77,28 @@ static struct addr_marker address_markers[] = {
 	{-1, NULL},
 };
 
+static struct ptd_mm_info kernel_ptd_info = {
+	.mm		= &init_mm,
+	.markers	= address_markers,
+	.base_addr	= KERN_VIRT_START,
+	.end		= ULONG_MAX,
+};
+
+#ifdef CONFIG_EFI
+static struct addr_marker efi_addr_markers[] = {
+		{ 0,		"UEFI runtime start" },
+		{ SZ_1G,	"UEFI runtime end" },
+		{ -1,		NULL }
+};
+
+static struct ptd_mm_info efi_ptd_info = {
+	.mm		= &efi_mm,
+	.markers	= efi_addr_markers,
+	.base_addr	= 0,
+	.end		= SZ_2G,
+};
+#endif
+
 /* Page Table Entry */
 struct prot_bits {
 	u64 mask;
@@ -245,22 +276,22 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr,
 	}
 }
 
-static void ptdump_walk(struct seq_file *s)
+static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 {
 	struct pg_state st = {
 		.seq = s,
-		.marker = address_markers,
+		.marker = pinfo->markers,
 		.level = -1,
 		.ptdump = {
 			.note_page = note_page,
 			.range = (struct ptdump_range[]) {
-				{KERN_VIRT_START, ULONG_MAX},
+				{pinfo->base_addr, pinfo->end},
 				{0, 0}
 			}
 		}
 	};
 
-	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
+	ptdump_walk_pgd(&st.ptdump, pinfo->mm, NULL);
 }
 
 void ptdump_check_wx(void)
@@ -293,7 +324,7 @@ void ptdump_check_wx(void)
 
 static int ptdump_show(struct seq_file *m, void *v)
 {
-	ptdump_walk(m);
+	ptdump_walk(m, m->private);
 
 	return 0;
 }
@@ -308,8 +339,13 @@ static int ptdump_init(void)
 		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
 			pg_level[i].mask |= pte_bits[j].mask;
 
-	debugfs_create_file("kernel_page_tables", 0400, NULL, NULL,
+	debugfs_create_file("kernel_page_tables", 0400, NULL, &kernel_ptd_info,
 			    &ptdump_fops);
+#ifdef CONFIG_EFI
+	if (efi_enabled(EFI_RUNTIME_SERVICES))
+		debugfs_create_file("efi_page_tables", 0400, NULL, &efi_ptd_info,
+				    &ptdump_fops);
+#endif
 
 	return 0;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
