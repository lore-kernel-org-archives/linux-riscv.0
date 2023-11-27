Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67001C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 22:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Bn5BAOYK9beVQudzGo/jkd7EN9htMqaMsSbRo/kFvo=; b=PmysgoGQIkA51c
	rb0Va6D3inP3o+PYwZyUTf6bGNlyJbI6SIN/asPSaBsrWvLt6B9aB9HqmX6ijuWM54RkRV5LxlmZE
	ANRAPJU+Rhxb/YASSOC4/TsgGdMUN587z0Spatbe73Ouu4MA2yWO3+WhuSloKaqX9Jqrjz9yfB5TC
	VcRWje8G4vo0YsBk3eYsHT4HG2waOsYZJbbTg3R1f3VcJoJG5NKYMz5tP7dA3/eW34JddY/Ifi8LD
	0elTfty2Jmx4JndjuS/Jzdu0ydxe6I9HNVByxrIFbxXyWUPpACzwJXy5zPtl9VRo8JUKjp/2t8BWM
	QYjqhehSntlP0p3kYJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7jjG-003YXr-0t;
	Mon, 27 Nov 2023 22:05:22 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7jjC-003YWQ-11
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 22:05:20 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1ef36a04931so3213709fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 14:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701122716; x=1701727516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvIAmFcw54BmQHj1+eMPXZ5lcgdN4IW5nDHalxa3vjw=;
        b=bjHurWQ0f8itf1hvUGYYhT3YwNV0VJYrzhijaGzCtPQ/j09dJ3M6DqjjYjBE+D0zYS
         QyxKzfVf+bGHFar4IMSnLNY5DG17Z/GiHdnS9zITnArnl6R2IAKpeyS1lLuH31RqLAG+
         qWa+yauKZq00oRdgsnUftSrYeGSatpTx0xY2LD9QNqxko1lNwckD2UPJlJ+nPSjgtW9O
         B0i0OpAhlQX+OTYgqIeO+hu0XcYrYcjSgcEJPuspYB1FH5PuTCPI2dFOtuRmdNoQMCA/
         MJB/mWhpdtjt0fDZdw0yMc7r8H3IVRmlh2gtRainTYyH3kT9iKlhl16fq/MFD0MxEkFa
         g3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701122716; x=1701727516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvIAmFcw54BmQHj1+eMPXZ5lcgdN4IW5nDHalxa3vjw=;
        b=aZIqRJNR610AMPHDGLLKAAZRN0FIVIIeDxmdpyGQiR2w2w5e3lK2BKtFyOYdQNra6M
         DEJmtkkEo3OHA7+AEpGKhHCTK7xlbcMdmP8m8kHxgfrPF60/pQKTjF10UtdX0kBN40HG
         eS2pzLlm2PuU10HCdHEizlzl8a9XsIeDxmkAMT4Nw9MjyQlWhCI0j5XoLqDwDq/KMSJ6
         zsnhgD6hocZvePpxTn6rA//obV9ECOwZAOj2GhJGpUUFfHZ2Yclr28i67AdgqC5Ry71b
         wNYcS2WuzEtS4A7MuHYJCxbElJdIAQE6xaMQCJWOwL+e1gxKkoNHAkyiCdl0z5ZcMsBD
         +AXw==
X-Gm-Message-State: AOJu0Yy9Hx+Xd3XGHzVK3Pd4E9/Umw9N4QWvMd11TSs2C83dpAeowQL3
	mEYsR9ykIjM6XYTBUdf1ayqfUaIFaop3REviSi4=
X-Google-Smtp-Source: AGHT+IFmkvCuwcOw1xy7dTJFWWmToF7QUcjaDSuGwTEsalpnCblJK80onm7AEdmQGhsJIMI/FXTsrA==
X-Received: by 2002:a05:6870:524c:b0:1fa:3014:ada9 with SMTP id o12-20020a056870524c00b001fa3014ada9mr10561965oai.54.1701122716534;
        Mon, 27 Nov 2023 14:05:16 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id x23-20020a056830115700b006d679b53e8asm1458890otq.24.2023.11.27.14.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 14:05:16 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 27 Nov 2023 14:04:59 -0800
Subject: [PATCH v4 1/2] riscv: Safely remove entries from relocation list
MIME-Version: 1.0
Message-Id: <20231127-module_linking_freeing-v4-1-a2ca1d7027d0@rivosinc.com>
References: <20231127-module_linking_freeing-v4-0-a2ca1d7027d0@rivosinc.com>
In-Reply-To: <20231127-module_linking_freeing-v4-0-a2ca1d7027d0@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Ron Economos <re@w6rz.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701122714; l=7889;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=oWHW0TwoEipPebbTedSb6UcR9/YptErZBNQ3JSBym2M=;
 b=J5XMWA4G1aZEqzAa6mZIwB3AtKNSf780SvwoUHh01Oa9Q5isHKUpK6W2FqqHwdQoqVDzg7SH4
 N7r+wwuHq2TA6ly2xMZb23IDdNT8rKFQ9sZX+tbiCNwdqUw6gwDZ6QI
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_140518_352558_BA165438 
X-CRM114-Status: GOOD (  19.54  )
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

Use the safe versions of list and hlist iteration to safely remove
entries from the module relocation lists. To allow mutliple threads to
load modules concurrently, move relocation list pointers onto the stack
rather than using global variables.

Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
Reported-by: Ron Economos <re@w6rz.net>
Closes: https://lore.kernel.org/linux-riscv/444de86a-7e7c-4de7-5d1d-c1c40eefa4ba@w6rz.net
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/kernel/module.c | 110 +++++++++++++++++++++++++++++++++------------
 1 file changed, 82 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 56a8c78e9e21..53593fe58cd8 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -40,15 +40,6 @@ struct relocation_handlers {
 				  long buffer);
 };
 
-unsigned int initialize_relocation_hashtable(unsigned int num_relocations);
-void process_accumulated_relocations(struct module *me);
-int add_relocation_to_accumulate(struct module *me, int type, void *location,
-				 unsigned int hashtable_bits, Elf_Addr v);
-
-struct hlist_head *relocation_hashtable;
-
-struct list_head used_buckets_list;
-
 /*
  * The auipc+jalr instruction pair can reach any PC-relative offset
  * in the range [-2^31 - 2^11, 2^31 - 2^11)
@@ -604,7 +595,10 @@ static const struct relocation_handlers reloc_handlers[] = {
 	/* 192-255 nonstandard ABI extensions  */
 };
 
-void process_accumulated_relocations(struct module *me)
+static void
+process_accumulated_relocations(struct module *me,
+				struct hlist_head **relocation_hashtable,
+				struct list_head *used_buckets_list)
 {
 	/*
 	 * Only ADD/SUB/SET/ULEB128 should end up here.
@@ -624,18 +618,25 @@ void process_accumulated_relocations(struct module *me)
 	 *	- Each relocation entry for a location address
 	 */
 	struct used_bucket *bucket_iter;
+	struct used_bucket *bucket_iter_tmp;
 	struct relocation_head *rel_head_iter;
+	struct hlist_node *rel_head_iter_tmp;
 	struct relocation_entry *rel_entry_iter;
+	struct relocation_entry *rel_entry_iter_tmp;
 	int curr_type;
 	void *location;
 	long buffer;
 
-	list_for_each_entry(bucket_iter, &used_buckets_list, head) {
-		hlist_for_each_entry(rel_head_iter, bucket_iter->bucket, node) {
+	list_for_each_entry_safe(bucket_iter, bucket_iter_tmp,
+				 used_buckets_list, head) {
+		hlist_for_each_entry_safe(rel_head_iter, rel_head_iter_tmp,
+					  bucket_iter->bucket, node) {
 			buffer = 0;
 			location = rel_head_iter->location;
-			list_for_each_entry(rel_entry_iter,
-					    rel_head_iter->rel_entry, head) {
+			list_for_each_entry_safe(rel_entry_iter,
+						 rel_entry_iter_tmp,
+						 rel_head_iter->rel_entry,
+						 head) {
 				curr_type = rel_entry_iter->type;
 				reloc_handlers[curr_type].reloc_handler(
 					me, &buffer, rel_entry_iter->value);
@@ -648,11 +649,14 @@ void process_accumulated_relocations(struct module *me)
 		kfree(bucket_iter);
 	}
 
-	kfree(relocation_hashtable);
+	kfree(*relocation_hashtable);
 }
 
-int add_relocation_to_accumulate(struct module *me, int type, void *location,
-				 unsigned int hashtable_bits, Elf_Addr v)
+static int add_relocation_to_accumulate(struct module *me, int type,
+					void *location,
+					unsigned int hashtable_bits, Elf_Addr v,
+					struct hlist_head *relocation_hashtable,
+					struct list_head *used_buckets_list)
 {
 	struct relocation_entry *entry;
 	struct relocation_head *rel_head;
@@ -661,6 +665,10 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
 	unsigned long hash;
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
+
+	if (!entry)
+		return -ENOMEM;
+
 	INIT_LIST_HEAD(&entry->head);
 	entry->type = type;
 	entry->value = v;
@@ -669,7 +677,10 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
 
 	current_head = &relocation_hashtable[hash];
 
-	/* Find matching location (if any) */
+	/*
+	 * Search for the relocation_head for the relocations that happen at the
+	 * provided location
+	 */
 	bool found = false;
 	struct relocation_head *rel_head_iter;
 
@@ -681,19 +692,45 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
 		}
 	}
 
+	/*
+	 * If there has not yet been any relocations at the provided location,
+	 * create a relocation_head for that location and populate it with this
+	 * relocation_entry.
+	 */
 	if (!found) {
 		rel_head = kmalloc(sizeof(*rel_head), GFP_KERNEL);
+
+		if (!rel_head) {
+			kfree(entry);
+			return -ENOMEM;
+		}
+
 		rel_head->rel_entry =
 			kmalloc(sizeof(struct list_head), GFP_KERNEL);
+
+		if (!rel_head->rel_entry) {
+			kfree(entry);
+			kfree(rel_head);
+			return -ENOMEM;
+		}
+
 		INIT_LIST_HEAD(rel_head->rel_entry);
 		rel_head->location = location;
 		INIT_HLIST_NODE(&rel_head->node);
 		if (!current_head->first) {
 			bucket =
 				kmalloc(sizeof(struct used_bucket), GFP_KERNEL);
+
+			if (!bucket) {
+				kfree(entry);
+				kfree(rel_head);
+				kfree(rel_head->rel_entry);
+				return -ENOMEM;
+			}
+
 			INIT_LIST_HEAD(&bucket->head);
 			bucket->bucket = current_head;
-			list_add(&bucket->head, &used_buckets_list);
+			list_add(&bucket->head, used_buckets_list);
 		}
 		hlist_add_head(&rel_head->node, current_head);
 	}
@@ -704,7 +741,9 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
 	return 0;
 }
 
-unsigned int initialize_relocation_hashtable(unsigned int num_relocations)
+static unsigned int
+initialize_relocation_hashtable(unsigned int num_relocations,
+				struct hlist_head **relocation_hashtable)
 {
 	/* Can safely assume that bits is not greater than sizeof(long) */
 	unsigned long hashtable_size = roundup_pow_of_two(num_relocations);
@@ -720,12 +759,13 @@ unsigned int initialize_relocation_hashtable(unsigned int num_relocations)
 
 	hashtable_size <<= should_double_size;
 
-	relocation_hashtable = kmalloc_array(hashtable_size,
-					     sizeof(*relocation_hashtable),
-					     GFP_KERNEL);
-	__hash_init(relocation_hashtable, hashtable_size);
+	*relocation_hashtable = kmalloc_array(hashtable_size,
+					      sizeof(*relocation_hashtable),
+					      GFP_KERNEL);
+	if (!*relocation_hashtable)
+		return -ENOMEM;
 
-	INIT_LIST_HEAD(&used_buckets_list);
+	__hash_init(*relocation_hashtable, hashtable_size);
 
 	return hashtable_bits;
 }
@@ -742,7 +782,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	Elf_Addr v;
 	int res;
 	unsigned int num_relocations = sechdrs[relsec].sh_size / sizeof(*rel);
-	unsigned int hashtable_bits = initialize_relocation_hashtable(num_relocations);
+	struct hlist_head *relocation_hashtable;
+	struct list_head used_buckets_list;
+	unsigned int hashtable_bits;
+
+	hashtable_bits = initialize_relocation_hashtable(num_relocations,
+							 &relocation_hashtable);
+
+	if (hashtable_bits < 0)
+		return hashtable_bits;
+
+	INIT_LIST_HEAD(&used_buckets_list);
 
 	pr_debug("Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
@@ -823,14 +873,18 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		}
 
 		if (reloc_handlers[type].accumulate_handler)
-			res = add_relocation_to_accumulate(me, type, location, hashtable_bits, v);
+			res = add_relocation_to_accumulate(me, type, location,
+							   hashtable_bits, v,
+							   relocation_hashtable,
+							   &used_buckets_list);
 		else
 			res = handler(me, location, v);
 		if (res)
 			return res;
 	}
 
-	process_accumulated_relocations(me);
+	process_accumulated_relocations(me, &relocation_hashtable,
+					&used_buckets_list);
 
 	return 0;
 }

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
