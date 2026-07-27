Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19352C531D0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 12:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lNpMk2MtsroQDxD1G0V/G5yJbeBApNjpxXyh3q/yWy8=; b=YWI4u/h0ImaL06
	mQOhO6ZaLQSV0tMdFkOfY8dskpFCkIHQYAdy+m8jdtdJ9cDZUmvz1JUcL9kqS9c51UHma04WVRcjZ
	zEwDnztgTe8A4Iq4iCieMOgNDhIJx0F7mwvTVKSPGeVD3Na4QP7chMrp5masAIZLd0GJjWOyND4/l
	AhANqKRMXPsvOF1RnYMChFgdJa6DRFJhd8OHu7oNU4Et3OfAlXYD1rd/RF8sht5WLq6Oxwqbs4ITn
	kmBCGg+5Gz4mJB3tzLJ1p7QNgdeN/m1yaAQSx4bF+WjfJaeiiO2rmWqqhcJp+vf9KrbaBxdk4SzD0
	oNJ5mJ0tD8S+4zczypYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKTp-00000002i1x-1duP;
	Mon, 27 Jul 2026 12:30:49 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKTn-00000002i0I-0Ftp
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 12:30:48 +0000
Received: by mail-pj2-x00.google.com with SMTP id d9443c01a7336-2cc7a345f51so22141735ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785155446; x=1785760246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8pTPbeEWjqJ3+0nUuuuXn5xR6k5GcUeJgsv7M+Os0c=;
        b=LHJDR+zuZJxrHt9GVtm5KGTMntGdcEcuCCLhrl5pcZvF6Tvi4WRy/j9a99jsiHyCjR
         C1LF+J51bHJcStRqX7PkFQ9MX7JWB54ODSsdJriUM4Qh0XBlo2oaaMtxW38lTXyM0efg
         c0ufGVNDuwH0eOl1Pa0sz1iGcvoo6u0gu/suBXDLJ2CIiKUFAx3/I2RTe5PSOW8XrNJN
         uZ7VgYVTx0heDNTBOs23NDZYtfhoasJUCF3f6GPuNlSMFH+t9tzrw8XDDNJFDTmxTfrr
         nxCK/Bk4PF8OQPQ0ln0Pjz4WT01boRwfGrAmu/J3LjtiR+k7Y9xcNjRc9USUUprf55q2
         zpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155446; x=1785760246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y8pTPbeEWjqJ3+0nUuuuXn5xR6k5GcUeJgsv7M+Os0c=;
        b=D1cVCXKnGBcsc+IMYxa39PnD3cfdoWEmTSx+B6hM5MEWqjzaTl+OuEwhOCMzbzbP6s
         I0GFC0a9W1FSnp9jaR29mYkHne+KrjYdiI+c9fwCxIWk2OsoBolE9UNaYSBhTNHfRLAi
         Qo9jXTU2WvyFcFuAuHnP/fz+RKVjIYGnUrHcj5f4ZbyhzeKURLVPL4XE7U4AaBGi8TsB
         2+DGcIsQhsaxHGPmWVyDrmZxm1ezavQURItt6wht6i0hLGA3IuDduBxPQ7qUbeNXdK+i
         b5MszQgMBdUpqN/KAfbZtRraFudyqCvlkWvnGnygE+UNjFmRTE/Kq4p7l2VT2ep+hRKd
         6ikw==
X-Forwarded-Encrypted: i=1; AHgh+RovvGxqLzHK2eumVZ/iBCUIaudCeU+P1rnfZ/UObMqTqrlaDuSuwSBCtebOBzJY9BvMc2hwvd8WKgfAiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw00RtIfvKc3fW51jCFstG92Zdi98MauHvy3lrswSi2gYA1/n6H
	EAtGQlPbQPdHrB6Pm1hoNLQfAFLS2vXGUfZOe98sQ8/JrYJdfnr7U8U2
X-Gm-Gg: AR+sD12sLKX60aJYUXEHtRaW7P5NN5gnSEbwdFl4GuMBxPjOKAit9yG2Infk0nbMDm0
	FPNmDNH42e5TPKNy63hQ3H90fCHl9dwpiecKTcxyCISf8fGa2G6HJWOrpWjC27riIA14cInqAhy
	sVJ9GvNC4V47qcAmV7bnoXxySwGBRmd8aLRRtIlcMta4Evi17yJjTKEql6Ss6LqhIZ+UUB6+ANl
	A3WlkC551pbSEL36yg4Cl4fLmjtYVGMNVFcdoLSYKQhl9580TpThRu9qQj41PWwXiOj4B0E/W+e
	b62uzUQmL6hiAghm8WTr/SFlhNtVZlRRd0uWMU6z1gdhCdEv6A59ugoWYFwgKEfFX7Nocvm/KJ9
	E1dXhI4tHJxtEG4HXHMycK6p7/WzsHr26HUPIcij2dZg7jUnu+uY9DIVI2GWN/FShB+I0Moc=
X-Received: by 2002:a17:903:468c:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2cfde7b3a14mr78013425ad.14.1785155445847;
        Mon, 27 Jul 2026 05:30:45 -0700 (PDT)
Received: from wud.. ([218.194.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfe1ab9c71sm30679775ad.73.2026.07.27.05.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:30:45 -0700 (PDT)
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
Subject: [PATCH v2 2/3] riscv: ptdump: Use per-level attribute bits for parsing
Date: Mon, 27 Jul 2026 08:30:12 -0400
Message-Id: <20260727123013.118984-3-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727123013.118984-1-fredwudi0305@gmail.com>
References: <20260727123013.118984-1-fredwudi0305@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_053047_106948_6F4C8836 
X-CRM114-Status: GOOD (  18.33  )
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

Instead of using the global pte_bits array in dump_prot(), use the
per-level bits and num from the associated pg_level entry passed via
ptdump_pg_state. This makes the attribute parsing logic fully driven by
the per-level configuration, which allows KVM (and other future users)
to plug in their own set of protection bits for their pagetable levels.

Rename the local pg_level[] array to kernel_pg_levels[] to avoid
shadowing the pg_level pointer in struct ptdump_pg_state.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dylan.Wu <fredwudi0305@gmail.com>
---
 arch/riscv/include/asm/ptdump.h |  1 +
 arch/riscv/mm/ptdump.c          | 48 +++++++++++++++++++++------------
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/include/asm/ptdump.h b/arch/riscv/include/asm/ptdump.h
index eb9d11dab..14a262bd0 100644
--- a/arch/riscv/include/asm/ptdump.h
+++ b/arch/riscv/include/asm/ptdump.h
@@ -28,6 +28,7 @@ struct ptdump_pg_state {
 	struct seq_file *seq;
 	const struct addr_marker *marker;
 	unsigned long start_address;
+	const struct ptdump_pg_level *pg_level;
 	unsigned long start_pa;
 	unsigned long last_pa;
 	int level;
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 63655a9c8..06c0217f0 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -152,46 +152,58 @@ static const struct ptdump_prot_bits pte_bits[] = {
 	}
 };
 
-static struct ptdump_pg_level pg_level[] = {
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
 
 static void dump_prot(struct ptdump_pg_state *st)
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
@@ -221,7 +233,7 @@ static void dump_addr(struct ptdump_pg_state *st, unsigned long addr)
 	}
 
 	pt_dump_seq_printf(st->seq, "%9lu%c %s", delta, *unit,
-			   pg_level[st->level].name);
+			   kernel_pg_levels[st->level].name);
 }
 
 static void note_prot_wx(struct ptdump_pg_state *st, unsigned long addr)
@@ -247,7 +259,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr,
 	u64 prot = 0;
 
 	if (level >= 0)
-		prot = val & pg_level[level].mask;
+		prot = val & kernel_pg_levels[level].mask;
 
 	if (st->level == -1) {
 		st->level = level;
@@ -320,6 +332,7 @@ static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 		.seq = s,
 		.marker = pinfo->markers,
 		.level = -1,
+		.pg_level = kernel_pg_levels,
 		.ptdump = {
 			.note_page_pte = note_page_pte,
 			.note_page_pmd = note_page_pmd,
@@ -346,6 +359,7 @@ bool ptdump_check_wx(void)
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
