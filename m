Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A353C531D0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyGugDfwowZ8eVuAhz10kLcRqWXbTWuKF6hLDutLgsQ=; b=Ti135Tvot+HWRM
	m9w8n3XLjfAnkVJGyKdK/E9OPvyum6kgHJnc8OphMowLNW4Y/F5soL5UVSg3tzoZ+2TntSAv1ECqm
	kP5cor/DD4h+enGrvOFMLjWhFUw+pQVpa2H2JkK2Htusucq7bhMibBkWys3ByslDEm+VHcbvn1+lz
	0+vz2TCJDO+JuC+zEXUwidq3B6V0MaYpYj3rzQ/hOzo3aa3w8CxyL3kuaC4ZasaWDE1T6HrrdUvat
	kqFejB+B2JcxQCvDTX6yC3AgesgB118d/8VZ2EbcWr2yNJzSXIhm3tDh2k5T6dKd0cD8IP7Bz6WeG
	14iKqaC8mf+lmKojECug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKTl-00000002hzG-10HP;
	Mon, 27 Jul 2026 12:30:45 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKTi-00000002hxj-3mXb
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 12:30:43 +0000
Received: by mail-pj2-x03.google.com with SMTP id d9443c01a7336-2ccb0e85312so17154105ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785155442; x=1785760242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTdBdaepYR3Npq5LgKxtOuDeDw6yKDcmDYCQg+CRMR4=;
        b=KRd4doOxB7oqlIzsMmOfcvL6+iIa8OJdOIi5BhbFjy3BnqmQGwViJtTiMAMBHGBJYO
         aI0lQDMWcAyLojBw/Ml1Fd92MHxw7c5XIzF1+rj1WLFSKEQj4B4VT0Xjng1iH60DgWW4
         QBK/ghI54YZJ4sKsUdu8oK/4ydrjSwD5MMHy7WdbdPTV42Pisia6EeVdwSr+HtFys9M6
         G4myaEL8RgKZLa6rBbi3MA1LpkLc7QzjuwXfNVQkbo9HN7JygLYEKgqC+PgANNGXjS50
         KfHXczFIaxrnWf/vJidWmVgEbISZN1CmP5h2/ZnR2JKndQQGVvnRiY0+Uo+r/nN2Uqzy
         8K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155442; x=1785760242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTdBdaepYR3Npq5LgKxtOuDeDw6yKDcmDYCQg+CRMR4=;
        b=gOPW9djRtpjndqNvH0690r6eLHjyfw0usuxzD3Uxdz6QInk6e5vTw+H19YO03asmvJ
         XhXRdH3B09xf7fAv0pvKZ0UemWQ3v+HVPDROMj4fNmfB122XNDjbwPemvNnZ7RRIgjYv
         GPtqqC1YJiXcIdhrXYuSvOtDmFFRJ8nPfcFtpBi/sgxW4gTW1Redi76x4rhNGacDcoKn
         cCGcPZ9OvB4n4q0Z4iNyYk8mAROUmvgm/scVVrtC4vkvqIr8SxuI8u8S/Ql6boNe6ETB
         lF9XMdtDeprOp9MTLmTpC/v3Tc5ddiTskMG+0AqiqC5IXioNXjxdKwZKCQjZLol8ufTd
         +FhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqldNZLy4i0BVXis8VK08h67RRRcgU9eoFbU0c/YJw1NsYr6Dgth7wOzWKNrCEzJzvM16JjktuQDFKmPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4GLuFRQ3AO8HDCN3apSzjCtO77F6aTwtdPJaif0zYt3GOc7Ne
	X4l0KG1Nlgr9hxWgDmg86QfpHuoLkb87u1jz4hKrLzf5cebx3bkglK9YR3Z8xYQy/xuaVg==
X-Gm-Gg: AR+sD13WTMcw95ndmMSeOanFsoLIXFyWedNdR3gHPcOM9UerQIvXxeSSQYP1n5reHLz
	/0Nma5fHEV3DfTc7+EKKJ52cbKV+56SUgOB2IrxEmmcWeiK1/9tpxuvrdQIVHpT1UE6aAlpkm31
	7dyYsMazuB7cYyWGDDo7+3ussUMazEefCR1fkoMvvSqO9uE19gss8qVeYFzHE5FqnxTrKB2Rt20
	cUDNLYzGk2tsUhyV8lWM54yaBh/p2ETUAkH04tjmcSilw/bWrAD92cMpgwnAo+JytRRdbze0BpX
	6Yy19Skt9bzxEk1zx8xm4pOQswSjetpWbRa9bJmS1s2X0pxbKOt9q4+5WCCL7X2ECaOOg+Fz7Cq
	sCFqxkGy2ESMELegeVfOvOG8wAoj3slpnsId4CmSsWZS23KJZywThH7rQ4nJ8nhb/yjXamuU=
X-Received: by 2002:a17:903:2284:b0:2c9:ff83:41fa with SMTP id d9443c01a7336-2cfde85fb71mr79666365ad.24.1785155441655;
        Mon, 27 Jul 2026 05:30:41 -0700 (PDT)
Received: from wud.. ([218.194.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfe1ab9c71sm30679775ad.73.2026.07.27.05.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:30:41 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	anup@brainfault.org
Cc: alex@ghiti.fr,
	atish.patra@linux.dev,
	zhouquan@iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dylan.Wu" <fredwudi0305@gmail.com>
Subject: [PATCH v2 1/3] riscv: ptdump: Create ptdump.h and move declarations
Date: Mon, 27 Jul 2026 08:30:11 -0400
Message-Id: <20260727123013.118984-2-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727123013.118984-1-fredwudi0305@gmail.com>
References: <20260727123013.118984-1-fredwudi0305@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_053042_944231_125027E3 
X-CRM114-Status: GOOD (  21.49  )
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

Create a new arch/riscv/include/asm/ptdump.h header file and move the
pagetable walking state structures and level definitions there. This
allows other parts of the kernel (like KVM) to reuse the ptdump data
structures.

Also export the note_page() symbol so it can be used by other kernel
components.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dylan.Wu <fredwudi0305@gmail.com>
---
 arch/riscv/include/asm/ptdump.h | 41 ++++++++++++++++++++++
 arch/riscv/mm/ptdump.c          | 60 +++++++--------------------------
 2 files changed, 53 insertions(+), 48 deletions(-)
 create mode 100644 arch/riscv/include/asm/ptdump.h

diff --git a/arch/riscv/include/asm/ptdump.h b/arch/riscv/include/asm/ptdump.h
new file mode 100644
index 000000000..eb9d11dab
--- /dev/null
+++ b/arch/riscv/include/asm/ptdump.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_PTDUMP_H
+#define _ASM_RISCV_PTDUMP_H
+
+#include <linux/ptdump.h>
+#include <linux/seq_file.h>
+
+struct addr_marker {
+	unsigned long start_address;
+	const char *name;
+};
+
+struct ptdump_prot_bits {
+	u64 mask;
+	const char *set;
+	const char *clear;
+};
+
+struct ptdump_pg_level {
+	const struct ptdump_prot_bits *bits;
+	const char *name;
+	u64 mask;
+	int num;
+};
+
+struct ptdump_pg_state {
+	struct ptdump_state ptdump;
+	struct seq_file *seq;
+	const struct addr_marker *marker;
+	unsigned long start_address;
+	unsigned long start_pa;
+	unsigned long last_pa;
+	int level;
+	u64 current_prot;
+	bool check_wx;
+	unsigned long wx_pages;
+};
+
+void note_page(struct ptdump_state *pt_st, unsigned long addr, int level, u64 val);
+
+#endif /* _ASM_RISCV_PTDUMP_H */
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index f4b4a9fcb..63655a9c8 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -11,6 +11,7 @@
 #include <linux/ptdump.h>
 
 #include <linux/pgtable.h>
+#include <asm/ptdump.h>
 #include <asm/kasan.h>
 
 #define pt_dump_seq_printf(m, fmt, args...)	\
@@ -25,31 +26,6 @@
 		seq_puts(m, fmt);	\
 })
 
-/*
- * The page dumper groups page table entries of the same type into a single
- * description. It uses pg_state to track the range information while
- * iterating over the pte entries. When the continuity is broken it then
- * dumps out a description of the range.
- */
-struct pg_state {
-	struct ptdump_state ptdump;
-	struct seq_file *seq;
-	const struct addr_marker *marker;
-	unsigned long start_address;
-	unsigned long start_pa;
-	unsigned long last_pa;
-	int level;
-	u64 current_prot;
-	bool check_wx;
-	unsigned long wx_pages;
-};
-
-/* Address marker */
-struct addr_marker {
-	unsigned long start_address;
-	const char *name;
-};
-
 /* Private information for debugfs */
 struct ptd_mm_info {
 	struct mm_struct		*mm;
@@ -126,14 +102,7 @@ static struct ptd_mm_info efi_ptd_info = {
 };
 #endif
 
-/* Page Table Entry */
-struct prot_bits {
-	u64 mask;
-	const char *set;
-	const char *clear;
-};
-
-static const struct prot_bits pte_bits[] = {
+static const struct ptdump_prot_bits pte_bits[] = {
 	{
 #ifdef CONFIG_64BIT
 		.mask = _PAGE_NAPOT,
@@ -183,13 +152,7 @@ static const struct prot_bits pte_bits[] = {
 	}
 };
 
-/* Page Level */
-struct pg_level {
-	const char *name;
-	u64 mask;
-};
-
-static struct pg_level pg_level[] = {
+static struct ptdump_pg_level pg_level[] = {
 	{ /* pgd */
 		.name = "PGD",
 	}, { /* p4d */
@@ -203,7 +166,7 @@ static struct pg_level pg_level[] = {
 	},
 };
 
-static void dump_prot(struct pg_state *st)
+static void dump_prot(struct ptdump_pg_state *st)
 {
 	unsigned int i;
 
@@ -240,7 +203,7 @@ static void dump_prot(struct pg_state *st)
 #else
 #define ADDR_FORMAT	"0x%08lx"
 #endif
-static void dump_addr(struct pg_state *st, unsigned long addr)
+static void dump_addr(struct ptdump_pg_state *st, unsigned long addr)
 {
 	static const char units[] = "KMGTPE";
 	const char *unit = units;
@@ -261,7 +224,7 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 			   pg_level[st->level].name);
 }
 
-static void note_prot_wx(struct pg_state *st, unsigned long addr)
+static void note_prot_wx(struct ptdump_pg_state *st, unsigned long addr)
 {
 	if (!st->check_wx)
 		return;
@@ -276,10 +239,10 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
 	st->wx_pages += (addr - st->start_address) / PAGE_SIZE;
 }
 
-static void note_page(struct ptdump_state *pt_st, unsigned long addr,
-		      int level, u64 val)
+void note_page(struct ptdump_state *pt_st, unsigned long addr,
+	       int level, u64 val)
 {
-	struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
+	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
 	u64 pa = PFN_PHYS(pte_pfn(__pte(val)));
 	u64 prot = 0;
 
@@ -317,6 +280,7 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr,
 		st->last_pa = pa;
 	}
 }
+EXPORT_SYMBOL_GPL(note_page);
 
 static void note_page_pte(struct ptdump_state *pt_st, unsigned long addr, pte_t pte)
 {
@@ -352,7 +316,7 @@ static void note_page_flush(struct ptdump_state *pt_st)
 
 static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 {
-	struct pg_state st = {
+	struct ptdump_pg_state st = {
 		.seq = s,
 		.marker = pinfo->markers,
 		.level = -1,
@@ -375,7 +339,7 @@ static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 
 bool ptdump_check_wx(void)
 {
-	struct pg_state st = {
+	struct ptdump_pg_state st = {
 		.seq = NULL,
 		.marker = (struct addr_marker[]) {
 			{0, NULL},
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
