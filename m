Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C16C54F55
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lV1GQmcKtV4YK6Aij2BLp4FsIpTj/gj4QQ5gEXKqqXw=; b=niN/5Oi1oq1f+8
	XD2xYKjEpytCOqDONHmiKKachMLDOySBwUy/EZ2MrO8BTeftm92/v6vI/cQ+BoZL3fWgBzYoqHGH1
	uPW1Xq7MPlGmp4HZP21vYtPXH+lykIVLIcaQtGrOZxC2tOwuZSNOJXMhbF0nCVNSuVZga9HW8W8yF
	oYdyP99akxLb9bBdPHaDnPwOg4918zWsrWJlIPkeOxPd8TAg9aAyl05c8NWt9l3cnwgyByxPWJ/PA
	/2wAd7K1kb1wIuN/uRwnDxDFqI+U1UR9Etw5FEZXF2oJXbRVcKdo12eHwcLmFG/U1ipyJ6CnNHXu3
	sUeVSlIkbT9b8bw4iokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokSr-00000005nQh-04BV;
	Tue, 28 Jul 2026 16:15:33 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokSk-00000005nNk-3UK4
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:15:28 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-38111ea8a88so3945a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785255326; x=1785860126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkJkYRNg1Asp/uUQCyBlmPwY9ZA7xtmbDXiizQLJHeA=;
        b=PhVuzDOeL8Yk32qekvyb0Jj9i05tc5EvSOP7taa3oNj3PF2kxPF/tzotsrrhGK1yAT
         ttsZ063CPGsZtTrzYebvH+njVxThwL/jSKECwiEOSbmmls1gf0Jy9+yLEKInQ9BfXDbJ
         TefQWGBt4VuOm0Pi+eLTh5Gxy659SIpAlAD/tvSAn/l3ueBOxc+XgAPeqYFweObvcZg9
         zAg7Ep0Vjs2zOJWimmoUQKPhou4RrtbN/6WwCVY1VAdDykQ3iqRjiMgaTH4fiL5us1UE
         lThBzRdgsHR63QeNR9zG0YWrE6l/Pg7yaQFE/o0EIkyesKHdSZuy7CkHJLq+xg0wDUS1
         U7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785255326; x=1785860126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BkJkYRNg1Asp/uUQCyBlmPwY9ZA7xtmbDXiizQLJHeA=;
        b=inrFoOtyApYLeEKveG9de2fwsaa8Lk4pgCCf4OAgUIMJROO/JofhmSfNCkqZS+tlcT
         2vD1avpeFFx7B0DLkdEEckC/nb1ArNgu4XcpaskPEVyCNms+NJ1KUxXAwVC43Kb9NUJR
         JC2mp7p1siWJ+09/YahfXRUTK2yrkjhVKXuzI25rq8uyiSfyYzIXJ2cFLCvVi7ogx00V
         380+UUX0Oo/ZHAYVleAvMfwOsQeeoWhCMovlIZ/VKB3mV6nwk/PBJPSRi1rKLNdDwR0m
         BBdHeISKZtU3DFLmvZoXx4Ghso1+GvC9jmuIj5RJzr1uWUFBQ7Fw9QVAMJGyc/C+ucsQ
         5xxg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6dlsts/Ct3VX6OLXfvOKufMjcZUVv53vyq9dQUCVoiYKnbxCsE3Os4Njk2eE7VLQrA1Gql/BVU2XoxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1yT3+UHlLsHMDg5sgrf+f3bXomVYnwvfEdmpckO29rKMRX0ap
	+NxTxtX7SWzRGhaRzLl5Emsohw3x6JDBQWnpNpuXaBZge3gyLUzCGs1D
X-Gm-Gg: AR+sD10dq72rduynf90nIcGJxcqkbmHlpxnnUYi3SWsUIoatzcC7fyJWmE3zOAv7B5c
	EXDP0VyoMQAhetqBzg9uvoORSxARJGRrqq4vCC1UsUUMPtEYW0CloTPfAnKKRKHEOsjEOT8weJ9
	iNr/+GbR0seay3fCbnKsSRkjfotRkbMHKr4sXXJ7MN0WhtFSpenOUtkXUIbeGMZIyJ9bjFN1gqL
	w3f4iVfCwYSzfoUXb0k9ej9VzG5v9j7aGZOGOzik3jCr2eoT3Evw7W4MEKJKrUZIal547W4sMRy
	GSbHqJiaocojF22fdCFnNpDnfIcoqVBxv6hAsN3eYubNrjqlEEc3D8D1iRixela53afXRh6XIMM
	bDPEYqUJum7IvnZOirCH8SKTf8Q2bv3KWnjVU3Wcvnvca0OrRwkl3byXGZK4jkuywQLR38Jk=
X-Received: by 2002:a17:90b:1645:b0:381:dc88:7c09 with SMTP id 98e67ed59e1d1-38f6a45bf01mr3132385a91.33.1785255326080;
        Tue, 28 Jul 2026 09:15:26 -0700 (PDT)
Received: from wud.. ([218.194.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f292b06sm161141a91.10.2026.07.28.09.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:15:25 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: paul.walmsley@sifive.com,
	pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	"Dylan.Wu" <fredwudi0305@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 2/3] riscv: ptdump: Use per-level attribute bits for parsing
Date: Tue, 28 Jul 2026 12:14:48 -0400
Message-Id: <20260728161449.190058-3-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728161449.190058-1-fredwudi0305@gmail.com>
References: <3bb2f519-c70b-6c35-c404-6fbfe8adbeb1@kernel.org>
 <20260728161449.190058-1-fredwudi0305@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_091527_769865_1B15E19E 
X-CRM114-Status: GOOD (  20.85  )
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

Rename the ptdump data structures with a ptdump_ prefix for clarity
and to avoid namespace collisions when other modules (like KVM) define
their own instances:
  - struct prot_bits   -> struct ptdump_prot_bits
  - struct pg_level    -> struct ptdump_pg_level
  - struct pg_state    -> struct ptdump_pg_state

Add bits/num fields to struct ptdump_pg_level so each page table level
can have its own set of attribute bits, and add a pg_level pointer to
struct ptdump_pg_state so the attribute parsing logic can use per-level
bits instead of a global array.

Update dump_prot() to use the per-level bits from the pg_level pointer
rather than the global pte_bits array. Rename the pg_level[] instance
to kernel_pg_levels[] to distinguish it from future gstage instances.

No functional changes in the output.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dylan.Wu <fredwudi0305@gmail.com>
---
 arch/riscv/include/asm/ptdump.h |  9 +++--
 arch/riscv/mm/ptdump.c          | 62 ++++++++++++++++++++-------------
 2 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/ptdump.h b/arch/riscv/include/asm/ptdump.h
index 90dce9f64..53b0e52f0 100644
--- a/arch/riscv/include/asm/ptdump.h
+++ b/arch/riscv/include/asm/ptdump.h
@@ -10,18 +10,20 @@ struct addr_marker {
 	const char *name;
 };
 
-struct prot_bits {
+struct ptdump_prot_bits {
 	u64 mask;
 	const char *set;
 	const char *clear;
 };
 
-struct pg_level {
+struct ptdump_pg_level {
+	const struct ptdump_prot_bits *bits;
+	size_t num;
 	const char *name;
 	u64 mask;
 };
 
-struct pg_state {
+struct ptdump_pg_state {
 	struct ptdump_state ptdump;
 	struct seq_file *seq;
 	const struct addr_marker *marker;
@@ -32,6 +34,7 @@ struct pg_state {
 	u64 current_prot;
 	bool check_wx;
 	unsigned long wx_pages;
+	const struct ptdump_pg_level *pg_level;
 };
 
 void note_page(struct ptdump_state *pt_st, unsigned long addr,
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index d9a955b8a..c67fbbf5f 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -102,7 +102,7 @@ static struct ptd_mm_info efi_ptd_info = {
 };
 #endif
 
-static const struct prot_bits pte_bits[] = {
+static const struct ptdump_prot_bits pte_bits[] = {
 	{
 #ifdef CONFIG_64BIT
 		.mask = _PAGE_NAPOT,
@@ -152,46 +152,58 @@ static const struct prot_bits pte_bits[] = {
 	}
 };
 
-static struct pg_level pg_level[] = {
+static struct ptdump_pg_level kernel_pg_levels[] = {
 	{ /* pgd */
+		.bits = pte_bits,
+		.num = ARRAY_SIZE(pte_bits),
 		.name = "PGD",
 	}, { /* p4d */
+		.bits = pte_bits,
+		.num = ARRAY_SIZE(pte_bits),
 		.name = (CONFIG_PGTABLE_LEVELS > 4) ? "P4D" : "PGD",
 	}, { /* pud */
+		.bits = pte_bits,
+		.num = ARRAY_SIZE(pte_bits),
 		.name = (CONFIG_PGTABLE_LEVELS > 3) ? "PUD" : "PGD",
 	}, { /* pmd */
+		.bits = pte_bits,
+		.num = ARRAY_SIZE(pte_bits),
 		.name = (CONFIG_PGTABLE_LEVELS > 2) ? "PMD" : "PGD",
 	}, { /* pte */
+		.bits = pte_bits,
+		.num = ARRAY_SIZE(pte_bits),
 		.name = "PTE",
 	},
 };
 
-static void dump_prot(struct pg_state *st)
+static void dump_prot(struct ptdump_pg_state *st)
 {
+	const struct ptdump_pg_level *lvl = &st->pg_level[st->level];
+	const struct ptdump_prot_bits *bits = lvl->bits;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(pte_bits); i++) {
+	for (i = 0; i < lvl->num; i++) {
 		char s[7];
 		unsigned long val;
 
-		val = st->current_prot & pte_bits[i].mask;
+		val = st->current_prot & bits[i].mask;
 		if (val) {
-			if (pte_bits[i].mask == _PAGE_SOFT)
-				snprintf(s, sizeof(s), pte_bits[i].set, val >> 8);
+			if (bits[i].mask == _PAGE_SOFT)
+				snprintf(s, sizeof(s), bits[i].set, val >> 8);
 #ifdef CONFIG_64BIT
-			else if (pte_bits[i].mask == _PAGE_MTMASK_SVPBMT) {
+			else if (bits[i].mask == _PAGE_MTMASK_SVPBMT) {
 				if (val == _PAGE_NOCACHE_SVPBMT)
-					snprintf(s, sizeof(s), pte_bits[i].set, "NC");
+					snprintf(s, sizeof(s), bits[i].set, "NC");
 				else if (val == _PAGE_IO_SVPBMT)
-					snprintf(s, sizeof(s), pte_bits[i].set, "IO");
+					snprintf(s, sizeof(s), bits[i].set, "IO");
 				else
-					snprintf(s, sizeof(s), pte_bits[i].set, "??");
+					snprintf(s, sizeof(s), bits[i].set, "??");
 			}
 #endif
 			else
-				strscpy(s, pte_bits[i].set);
+				strscpy(s, bits[i].set);
 		} else {
-			strscpy(s, pte_bits[i].clear);
+			strscpy(s, bits[i].clear);
 		}
 
 		pt_dump_seq_printf(st->seq, " %s", s);
@@ -203,7 +215,7 @@ static void dump_prot(struct pg_state *st)
 #else
 #define ADDR_FORMAT	"0x%08lx"
 #endif
-static void dump_addr(struct pg_state *st, unsigned long addr)
+static void dump_addr(struct ptdump_pg_state *st, unsigned long addr)
 {
 	static const char units[] = "KMGTPE";
 	const char *unit = units;
@@ -221,10 +233,10 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 	}
 
 	pt_dump_seq_printf(st->seq, "%9lu%c %s", delta, *unit,
-			   pg_level[st->level].name);
+			   kernel_pg_levels[st->level].name);
 }
 
-static void note_prot_wx(struct pg_state *st, unsigned long addr)
+static void note_prot_wx(struct ptdump_pg_state *st, unsigned long addr)
 {
 	if (!st->check_wx)
 		return;
@@ -242,12 +254,12 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
 void note_page(struct ptdump_state *pt_st, unsigned long addr,
 	      int level, u64 val)
 {
-	struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
+	struct ptdump_pg_state *st = container_of(pt_st, struct ptdump_pg_state, ptdump);
 	u64 pa = PFN_PHYS(pte_pfn(__pte(val)));
 	u64 prot = 0;
 
 	if (level >= 0)
-		prot = val & pg_level[level].mask;
+		prot = val & kernel_pg_levels[level].mask;
 
 	if (st->level == -1) {
 		st->level = level;
@@ -316,10 +328,11 @@ static void note_page_flush(struct ptdump_state *pt_st)
 
 static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 {
-	struct pg_state st = {
+	struct ptdump_pg_state st = {
 		.seq = s,
 		.marker = pinfo->markers,
 		.level = -1,
+		.pg_level = kernel_pg_levels,
 		.ptdump = {
 			.note_page_pte = note_page_pte,
 			.note_page_pmd = note_page_pmd,
@@ -339,13 +352,14 @@ static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 
 bool ptdump_check_wx(void)
 {
-	struct pg_state st = {
+	struct ptdump_pg_state st = {
 		.seq = NULL,
 		.marker = (struct addr_marker[]) {
 			{0, NULL},
 			{-1, NULL},
 		},
 		.level = -1,
+		.pg_level = kernel_pg_levels,
 		.check_wx = true,
 		.ptdump = {
 			.note_page_pte = note_page_pte,
@@ -410,12 +424,12 @@ static int __init ptdump_init(void)
 
 	kernel_ptd_info.base_addr = KERN_VIRT_START;
 
-	pg_level[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
-	pg_level[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
+	kernel_pg_levels[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
+	kernel_pg_levels[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
 
-	for (i = 0; i < ARRAY_SIZE(pg_level); i++)
+	for (i = 0; i < ARRAY_SIZE(kernel_pg_levels); i++)
 		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
-			pg_level[i].mask |= pte_bits[j].mask;
+			kernel_pg_levels[i].mask |= pte_bits[j].mask;
 
 	debugfs_create_file("kernel_page_tables", 0400, NULL, &kernel_ptd_info,
 			    &ptdump_fops);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
