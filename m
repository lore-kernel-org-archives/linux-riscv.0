Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13941C61D97
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 22:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4a8rOTe7h1Zbzi/q4BztcXq7tdqK8M/fnhjoDHAXSrQ=; b=Evq8i5iqmZGa6V
	yEUIr08M012m+yXHV8a7Gg+Pqm609Dl9wykGRUn5NfhgDVBO8j/g9sjkEhjs32ScEx1f3RSGbtwvu
	xUB1Gg1g10VC7QiDs9tLcZ4AkX9XIBBCLwmR15AYO3/lBVhMobB6HI2SdfYwDV8EtXFxrp3oqcuZh
	BOZjHr/iSX8dIwFW4fkWe1s9PQCwXsR+0PLnoKIlpsAjvj3CmgAsrVh6kxEnYhNUUcAej91riH/X1
	EHFd/cV5sMdeaVFCVOujfSy7xE2wt1g05/2s92UHou7MrrmBLetHju6qdh4Pi3g/b68vVromcUfFj
	+SGjIWC+X2f66V0l3ppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ZZw-000DAn-15;
	Tue, 21 Nov 2023 22:50:48 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ZZs-000DA2-0h
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 22:50:46 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1f5d34235dbso135727fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 14:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700607041; x=1701211841; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DUyHc0j6Ju2SfAIga/ld56HvjwbN/U3s1rsaQ7X5kEY=;
        b=22jNhtCsNUepakb8gH7Y2A5UyAZpmuJG2M0hRwunnvZdB3vWphtGHtSoP6FUnTBI6n
         dbVwwcLwqQQF2MXC9HQR4LvjLNpM/owR2oB+ff+q3Jy7/9rLFn0RR/uOMb/+aUhTUg8h
         t6F2syBAVNC5DVQD0S3TtmTLHsABuW5B+QKVOuz6JgHH5ZX+dCybGhZRl0iO/HSPy2u8
         ChvdcEz6jMAaBjh+nzWwpyLLxXbBLRtMKGvOhgIooKUyyVZZ6pR1HVhoLC81oaEu0Tnh
         /azsIJQRWhLsI8agO5k5Hv8AR/0rlyrOpW6yP5Mbp3MW7Brbxq+g0wUHEf6Zjx4OKqXu
         nnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700607041; x=1701211841;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUyHc0j6Ju2SfAIga/ld56HvjwbN/U3s1rsaQ7X5kEY=;
        b=wQ4Ql12kbhUe1NqRWPVo+4bgwUEPxIsyxLeG8B8MVdMCmRI6bdY62g1utabixR3GHD
         pagDaeamr7JLnE61VKQYDfH2x4RmEK9mCtqixi587hpwr8bRMoamB2K2yD9PW+DUzxft
         k2Ae0lQIPnIhHEuPdshWwX1vFMIRMNhXN5fw8HFQyZy+ACFIS7gEWSotguUMGqfea1gB
         WsIC7uTiIpnlUJ81ZYyWmb/RFzN5JlugFZjgCQj+wuGTztYkS2Zf3BV4SGyFZ+j9liTl
         TvzPUtBKhTOv+xRaUMN6U+YP1rrQUIcBRJj14BzofxUvu5FBq8I9evOtqQ4mhIjOe+GP
         pU3Q==
X-Gm-Message-State: AOJu0YwGAFOM9plHHx6iGylqQdOyu0U5ssb71E0nMLXRLf79hQymIklC
	7U4OpH0XYNtoXro+7PedbZ3y9Q==
X-Google-Smtp-Source: AGHT+IGMIBWqRvMREzONSNPjvDKkKSJ4l9c+zeFDM9OJ5MF1Lsu7kknkgcAeKdMOtQd/CTHfWvVeHQ==
X-Received: by 2002:a05:6870:aa94:b0:1f9:5310:90ab with SMTP id gr20-20020a056870aa9400b001f9531090abmr388557oab.3.1700607041535;
        Tue, 21 Nov 2023 14:50:41 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z2-20020a056870384200b001f40abd9fdbsm1924965oal.2.2023.11.21.14.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 14:50:41 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 21 Nov 2023 14:50:37 -0800
Subject: [PATCH v2] riscv: Safely remove entries from relocation list
MIME-Version: 1.0
Message-Id: <20231121-module_linking_freeing-v2-1-974bfcd3664e@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIADw0XWUC/4WNUQrCMBBEr1L220izJVj98h5SSpNu2sU2kUSDU
 nJ3Yy/g1/AG5s0GkQJThEu1QaDEkb0rgIcKzDy4iQSPhQFrbKTEWqx+fC3UL+zu7KbeBqKSArU
 aGo1KaUVQxo9Alt+7+NYVnjk+ffjsP0n+2r/KJIUU1tpWjidsz9ZcAycf2Zmj8St0Oecv4suSS
 b8AAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Ron Economos <re@w6rz.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700607040; l=7292;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BPxSfHiD/1CoNWAadGRWfCiIZVum0NpgMbJUCXfSyxQ=;
 b=OSv5WsCH1yJPN+gH6kzzLT3/R3XxrdSfng66ZLM1H5O7KATPtJ9oBxNDt6QdxKQHjbE1pFmX1
 yOWFSEG6iL8AvxpARIRUmFe2hWe03M2aKE5bF3SJcZQB6DhK5AdGN1g
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_145044_447697_35D6BF53 
X-CRM114-Status: GOOD (  15.03  )
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
Changes in v2:
- Support linking modules concurrently across threads.
- Link to v1: https://lore.kernel.org/r/20231120-module_linking_freeing-v1-1-fff81d7289fc@rivosinc.com
---
 arch/riscv/kernel/module.c | 76 +++++++++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 56a8c78e9e21..f53e82b70dff 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -40,14 +40,17 @@ struct relocation_handlers {
 				  long buffer);
 };
 
-unsigned int initialize_relocation_hashtable(unsigned int num_relocations);
-void process_accumulated_relocations(struct module *me);
+unsigned int
+initialize_relocation_hashtable(unsigned int num_relocations,
+				struct hlist_head **relocation_hashtable,
+				struct list_head *used_buckets_list);
+void process_accumulated_relocations(struct module *me,
+				     struct hlist_head **relocation_hashtable,
+				     struct list_head *used_buckets_list);
 int add_relocation_to_accumulate(struct module *me, int type, void *location,
-				 unsigned int hashtable_bits, Elf_Addr v);
-
-struct hlist_head *relocation_hashtable;
-
-struct list_head used_buckets_list;
+				 unsigned int hashtable_bits, Elf_Addr v,
+				struct hlist_head **relocation_hashtable,
+				struct list_head *used_buckets_list);
 
 /*
  * The auipc+jalr instruction pair can reach any PC-relative offset
@@ -604,7 +607,9 @@ static const struct relocation_handlers reloc_handlers[] = {
 	/* 192-255 nonstandard ABI extensions  */
 };
 
-void process_accumulated_relocations(struct module *me)
+void process_accumulated_relocations(struct module *me,
+				     struct hlist_head **relocation_hashtable,
+				     struct list_head *used_buckets_list)
 {
 	/*
 	 * Only ADD/SUB/SET/ULEB128 should end up here.
@@ -624,18 +629,25 @@ void process_accumulated_relocations(struct module *me)
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
@@ -648,11 +660,13 @@ void process_accumulated_relocations(struct module *me)
 		kfree(bucket_iter);
 	}
 
-	kfree(relocation_hashtable);
+	kfree(*relocation_hashtable);
 }
 
 int add_relocation_to_accumulate(struct module *me, int type, void *location,
-				 unsigned int hashtable_bits, Elf_Addr v)
+				 unsigned int hashtable_bits, Elf_Addr v,
+				struct hlist_head **relocation_hashtable,
+				struct list_head *used_buckets_list)
 {
 	struct relocation_entry *entry;
 	struct relocation_head *rel_head;
@@ -667,7 +681,7 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
 
 	hash = hash_min((uintptr_t)location, hashtable_bits);
 
-	current_head = &relocation_hashtable[hash];
+	current_head = &((*relocation_hashtable)[hash]);
 
 	/* Find matching location (if any) */
 	bool found = false;
@@ -693,7 +707,7 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
 				kmalloc(sizeof(struct used_bucket), GFP_KERNEL);
 			INIT_LIST_HEAD(&bucket->head);
 			bucket->bucket = current_head;
-			list_add(&bucket->head, &used_buckets_list);
+			list_add(&bucket->head, used_buckets_list);
 		}
 		hlist_add_head(&rel_head->node, current_head);
 	}
@@ -704,7 +718,10 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
 	return 0;
 }
 
-unsigned int initialize_relocation_hashtable(unsigned int num_relocations)
+unsigned int
+initialize_relocation_hashtable(unsigned int num_relocations,
+				struct hlist_head **relocation_hashtable,
+				struct list_head *used_buckets_list)
 {
 	/* Can safely assume that bits is not greater than sizeof(long) */
 	unsigned long hashtable_size = roundup_pow_of_two(num_relocations);
@@ -720,12 +737,12 @@ unsigned int initialize_relocation_hashtable(unsigned int num_relocations)
 
 	hashtable_size <<= should_double_size;
 
-	relocation_hashtable = kmalloc_array(hashtable_size,
-					     sizeof(*relocation_hashtable),
-					     GFP_KERNEL);
-	__hash_init(relocation_hashtable, hashtable_size);
+	*relocation_hashtable = kmalloc_array(hashtable_size,
+					      sizeof(*relocation_hashtable),
+					      GFP_KERNEL);
+	__hash_init(*relocation_hashtable, hashtable_size);
 
-	INIT_LIST_HEAD(&used_buckets_list);
+	INIT_LIST_HEAD(used_buckets_list);
 
 	return hashtable_bits;
 }
@@ -742,7 +759,13 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	Elf_Addr v;
 	int res;
 	unsigned int num_relocations = sechdrs[relsec].sh_size / sizeof(*rel);
-	unsigned int hashtable_bits = initialize_relocation_hashtable(num_relocations);
+	struct hlist_head *relocation_hashtable;
+	struct list_head used_buckets_list;
+	unsigned int hashtable_bits;
+
+	hashtable_bits = initialize_relocation_hashtable(num_relocations,
+							 &relocation_hashtable,
+							 &used_buckets_list);
 
 	pr_debug("Applying relocate section %u to %u\n", relsec,
 	       sechdrs[relsec].sh_info);
@@ -823,14 +846,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		}
 
 		if (reloc_handlers[type].accumulate_handler)
-			res = add_relocation_to_accumulate(me, type, location, hashtable_bits, v);
+			res = add_relocation_to_accumulate(
+				me, type, location, hashtable_bits, v,
+				&relocation_hashtable, &used_buckets_list);
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

---
base-commit: 98b1cc82c4affc16f5598d4fa14b1858671b2263
change-id: 20231120-module_linking_freeing-2b5a3b255b5e
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
