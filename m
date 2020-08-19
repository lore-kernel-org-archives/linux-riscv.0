Return-Path: <SRS0=trTC=B5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82484C433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 22:24:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51D2B20758
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2020 22:24:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qekLL4+Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="BBRHzkFl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51D2B20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EbffGJigQ1Ln3yxdotp755I/sgKzxDQ3XXZmTSazHj8=; b=qekLL4+Qq3+sp4MPGPoQG+PrI
	acgrDJg9s+k3q4uui3eBA1xCuXMdpuNxmgG0Z2xmIAZtSmDe/cUmc8gRR+V34SxrQQPhdCVB5N0zD
	gmiCf0Zk0RkBpDEtjqlYf0sqJwFzy1sp69ZZivN0I7Af8aSGrQ7EAaWlzyeiqYtRIbfDJ4tTbq1GY
	EnGb4WLsHmOGnBkHYECw6QaDZ9ccLzeBuq7BtYw0IgJLxs+85Go3Sdcuo9zVT28EsQepc2sbkhPCe
	S9IkNW4yPHWpxZWS9UqCSE2uMts6GopKUvtR3IuQrzHIu680N2DsbWR6X/2cOLrc3pwva4HkumrmI
	dvt/1FnBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8WVg-0001Hx-6O; Wed, 19 Aug 2020 22:24:44 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8WVc-0001Ee-36
 for linux-riscv@lists.infradead.org; Wed, 19 Aug 2020 22:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597875879; x=1629411879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zACmpNxMVkpKW6XFtwU9imKwJIzxQN1bq0wJXy/9ILY=;
 b=BBRHzkFloHzGnUKaJWWGH3XyPzlQ9DhaeCXYARNeB3VD63WB5SSxCQI6
 9kLPZe0YxwPY3wCgBgmw7gJdqObgngOTATOP01MnD4BzskEHCMv9U9BOP
 Ln2paz0qdP3uh7X+ziiQjmqwR66kGCHMoKQ3uOyTeqwqS/P/uR3Acbk08
 fUoB1q/vPeIHM5wGQ0NRSf6O1CQSzCpT8Qv/YqnAN74ZGeM+dotjCmwug
 Y8830OrMMT994yQ1ugF4t9+nwWQg5Em17+GZ+WRLTu599ZY8C9JEqiSnY
 x4eM7p0VGrco/Js4wsEVkDQ9/riCSLtELARHRe1ArX0aatLRQ2fPezfX/ w==;
IronPort-SDR: 1XN6lgPg+rs6pzGrSU0u3cOa9N9uQJEnPvKIXffWYPy33CCUGN/KXRYW4w+J+LJuEDZ5KnjpGL
 c7LsFX8aQrRim8DA3X0Hpomx5RR8UiY1+gxiVedcdI+otb9N3EAaoYaZ597yokkhEVf0CWTXkk
 rgG+2sy3Z/L31kfCDNqkMPwjVxLz3W03PTorGnqfWVdjzW8lw7iDzdePkrPEKBJ3xLSpp7uHaC
 EzyBcwuBsy4QMTrMLktksGqAsh8x3RmysMxeWU6Otr9lePaAlT9Iu7+tpdR1QlHeOsHhIGv7Pv
 J70=
X-IronPort-AV: E=Sophos;i="5.76,332,1592841600"; d="scan'208";a="145313337"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Aug 2020 06:24:39 +0800
IronPort-SDR: o/DxtecbcB/e+kPz8yE0tjxlmPlCAccaAXkJFvxmi8pu17zq5JK+9375M/+XBwIEf1v5zvFJ5t
 qhvjarylDH6Q==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 15:12:22 -0700
IronPort-SDR: qeASOcpsC5tETXVvFIaf3jgrXLlmjsFJeBHh+JrZXvJm4MzlaZ4rUzKfhLKqp83wnyK6axFW5O
 pBEe93zZ0aVQ==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.62])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Aug 2020 15:24:39 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 9/9] RISC-V: Add page table dump support for uefi
Date: Wed, 19 Aug 2020 15:24:25 -0700
Message-Id: <20200819222425.30721-10-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200819222425.30721-1-atish.patra@wdc.com>
References: <20200819222425.30721-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_182440_336115_B3502ACD 
X-CRM114-Status: GOOD (  16.52  )
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
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Alistair Francis <alistair.francis@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Anup Patel <anup@brainfault.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Steven Price <steven.price@arm.com>,
 Waiman Long <longman@redhat.com>, Greentime Hu <greentime.hu@sifive.com>,
 Daniel Schaefer <daniel.schaefer@hpe.com>, Kees Cook <keescook@chromium.org>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Heiko Carstens <hca@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>
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
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
