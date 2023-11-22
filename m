Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EA3C61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 23:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6t1KCsKX2M67LHp+7dARzZSvhWSHfmROJWMw9ZpWs/Y=; b=CkWc7GWo0+XNJ3
	4aFSncVXwr85062BOp8fnkOXqRYZlZKr0lUa5njwhbnmExqcAR0t3OJN7Nndc03OD8zrM/URsXSbJ
	tPNAo6NbpRiquAwOGI+q1FKiJus749156rHk/aSXcW3jMoq/84ocy1keLmacT2wWA4/FJCVQGBMUy
	Q0M8nGYpK1PYVMetrTRf7sSKKLayf6tbqIyGi5/SMP6PSE8uKvQdrxcOjRzQHwX+GIGNQPmriZG4N
	7sNdm/YVvWJoH7z4Gue+PBRCeT20Yu5Hvsw8r3xCGYEhMXHxoCPxPsfL+mTKmWhllwbk6FAO1XzzF
	iPAb0Jmx+VUqTaQxtM/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5whm-003Jf2-0V;
	Wed, 22 Nov 2023 23:32:26 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5whe-003Ja2-2j
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 23:32:22 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6be1bc5aa1cso348458b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 15:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700695936; x=1701300736; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gC0EagfiP/+NcPX4p9Q3wRm4GjW6UI0uxIwHz/Ubo2M=;
        b=OtrmidFJcIBgoLv2q13BVvYWt3Mc93XPwdm9ZT21QWJSuKeZnAvttn5Uz9QOLeBHCr
         7dujsoxIxazKbHGp6Z8YNB3c4BvSAE5ykjhjDH+AfHeXceeLM3PtFqroj1jGinEnIgZE
         WY5A6uUODPrjFD4DpQXf1iLbk6qTd7iWsFPL3BryO7mMbJj0k1QwWrqJpVteMx2pFJVr
         /LCtExH/GkxHjOVHfxYtfxhGRyH7RRIZMnSfomfqTheOJsr9vWMjjxeE0sU9EiWWU1+6
         8D1f5js7CxNXMhslk887V7WdswTfaRFHtYexq6nuGG4obAriPzVISdrcuT6tKsOmhmiC
         PWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700695936; x=1701300736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gC0EagfiP/+NcPX4p9Q3wRm4GjW6UI0uxIwHz/Ubo2M=;
        b=GpgMGz2MXZd7NfWqtLdQDUZenVgwdEqOv8iNE3HxjSYJu4pu3d2Ngn4eRdgKtM5Ibp
         GUh7nTtxW4DPOnImWpKdbQjjzB3+xfBrklVYXMb9J2GZWmqnkdgpMwvlJV80MizOZE2b
         iTBiBo31gdwCdlelK2JTpmLmuAZVFm0sumSHCCCmWjsN7vJYKyf2SrIOtibc2Lwg9fkR
         Z2g255D71wfPArACm0GXHBlFLuwWIndlweH2K2Yhf2xLOwIiDWti5dKxLzLmrSjgSeKo
         NHxmAox87T3uA3YFAdRM1vcaZ5DZMBFVHurqt0zxBQvpIrRXDiF83bo1AIbcGNQOjGtd
         O0HQ==
X-Gm-Message-State: AOJu0YymulC8NCFzQL78FTJieJYud5e61mzRYxkJvbXKqDBRKPpdKUQz
	Q4OU82f2LvcUUmjkF1GGA3o2Ysnxyt8/8RQkoX4=
X-Google-Smtp-Source: AGHT+IEaX1nmQ0drHqFjZcVPeXPfrI8aw9iqvTw+nADHR7w/+o5OI9Ag6EZ2D7G8QgV66zH0C8JgiQ==
X-Received: by 2002:a05:6a20:8f06:b0:18b:817b:650e with SMTP id b6-20020a056a208f0600b0018b817b650emr1529177pzk.0.1700695935835;
        Wed, 22 Nov 2023 15:32:15 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e22-20020aa78c56000000b006c875abecbcsm22603pfd.121.2023.11.22.15.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 15:32:15 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 22 Nov 2023 15:31:41 -0800
Subject: [PATCH v3 1/2] riscv: Safely remove entries from relocation list
MIME-Version: 1.0
Message-Id: <20231122-module_linking_freeing-v3-1-8e9e412a3305@rivosinc.com>
References: <20231122-module_linking_freeing-v3-0-8e9e412a3305@rivosinc.com>
In-Reply-To: <20231122-module_linking_freeing-v3-0-8e9e412a3305@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Ron Economos <re@w6rz.net>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700695933; l=7415;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=yUZcmL+95LInlulMXXAVr+R7MGLNBV7dJIAJYdqG7QQ=;
 b=CF5uoJo3PEzBYoN6vt5wunpr/MRm59Ve3tDnUUkzIv7lxuc7ReosIoPa5pRIJ5dv72msAewii
 M6THNE3AZPHD+VahMV34Kl+zciUHHeta0TMGzimA5GprDjiq/1BbnTF
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_153218_892103_250A8F6B 
X-CRM114-Status: GOOD (  16.55  )
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
 arch/riscv/kernel/module.c | 93 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 69 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 56a8c78e9e21..fd9a5533518c 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -40,14 +40,16 @@ struct relocation_handlers {
 				  long buffer);
 };
 
-unsigned int initialize_relocation_hashtable(unsigned int num_relocations);
-void process_accumulated_relocations(struct module *me);
+unsigned int
+initialize_relocation_hashtable(unsigned int num_relocations,
+				struct hlist_head **relocation_hashtable);
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
+				 struct hlist_head *relocation_hashtable,
+				 struct list_head *used_buckets_list);
 
 /*
  * The auipc+jalr instruction pair can reach any PC-relative offset
@@ -604,7 +606,9 @@ static const struct relocation_handlers reloc_handlers[] = {
 	/* 192-255 nonstandard ABI extensions  */
 };
 
-void process_accumulated_relocations(struct module *me)
+void process_accumulated_relocations(struct module *me,
+				     struct hlist_head **relocation_hashtable,
+				     struct list_head *used_buckets_list)
 {
 	/*
 	 * Only ADD/SUB/SET/ULEB128 should end up here.
@@ -624,18 +628,25 @@ void process_accumulated_relocations(struct module *me)
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
@@ -648,11 +659,13 @@ void process_accumulated_relocations(struct module *me)
 		kfree(bucket_iter);
 	}
 
-	kfree(relocation_hashtable);
+	kfree(*relocation_hashtable);
 }
 
 int add_relocation_to_accumulate(struct module *me, int type, void *location,
-				 unsigned int hashtable_bits, Elf_Addr v)
+				 unsigned int hashtable_bits, Elf_Addr v,
+				 struct hlist_head *relocation_hashtable,
+				 struct list_head *used_buckets_list)
 {
 	struct relocation_entry *entry;
 	struct relocation_head *rel_head;
@@ -661,6 +674,10 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
 	unsigned long hash;
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
+
+	if (!entry)
+		return -ENOMEM;
+
 	INIT_LIST_HEAD(&entry->head);
 	entry->type = type;
 	entry->value = v;
@@ -683,17 +700,29 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
 
 	if (!found) {
 		rel_head = kmalloc(sizeof(*rel_head), GFP_KERNEL);
+
+		if (!rel_head)
+			return -ENOMEM;
+
 		rel_head->rel_entry =
 			kmalloc(sizeof(struct list_head), GFP_KERNEL);
+
+		if (!rel_head->rel_entry)
+			return -ENOMEM;
+
 		INIT_LIST_HEAD(rel_head->rel_entry);
 		rel_head->location = location;
 		INIT_HLIST_NODE(&rel_head->node);
 		if (!current_head->first) {
 			bucket =
 				kmalloc(sizeof(struct used_bucket), GFP_KERNEL);
+
+			if (!bucket)
+				return -ENOMEM;
+
 			INIT_LIST_HEAD(&bucket->head);
 			bucket->bucket = current_head;
-			list_add(&bucket->head, &used_buckets_list);
+			list_add(&bucket->head, used_buckets_list);
 		}
 		hlist_add_head(&rel_head->node, current_head);
 	}
@@ -704,7 +733,9 @@ int add_relocation_to_accumulate(struct module *me, int type, void *location,
 	return 0;
 }
 
-unsigned int initialize_relocation_hashtable(unsigned int num_relocations)
+unsigned int
+initialize_relocation_hashtable(unsigned int num_relocations,
+				struct hlist_head **relocation_hashtable)
 {
 	/* Can safely assume that bits is not greater than sizeof(long) */
 	unsigned long hashtable_size = roundup_pow_of_two(num_relocations);
@@ -720,12 +751,13 @@ unsigned int initialize_relocation_hashtable(unsigned int num_relocations)
 
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
@@ -742,7 +774,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
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
@@ -823,14 +865,17 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		}
 
 		if (reloc_handlers[type].accumulate_handler)
-			res = add_relocation_to_accumulate(me, type, location, hashtable_bits, v);
+			res = add_relocation_to_accumulate(
+				me, type, location, hashtable_bits, v,
+				relocation_hashtable, &used_buckets_list);
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
