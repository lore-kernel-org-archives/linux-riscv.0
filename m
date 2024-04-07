Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D4ACD128A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PYSDSumUPlJ5Gb7PSJMatuxf9vQMHqr+IezkVxOCWUI=; b=GlIfy/62yG7T4K
	D3PSvEHaFMzYZlrNuuRgLR2SVxFXuBLqTuhpdsLr45VYBH+ynDkGX2Q2esJL9DDpHGLeHSqSCi4iF
	x3K89hWaj5xej+DkYdENls2rm8uBc9Q3rCp0d+0oObUn0LoZqrVHyP+kksCJZivsnwZ329o1CuM6s
	0DYBHozA6vNernRBMUMql9+1jozAZkohCcjrlW1UvDPc8fFo0xTNRa5hYc8BnfSiu7of6PiUSsH31
	covlTxqwNZOE/Up4zDiarq7kcupX3r5zvkfylXS9+NRqGkkBP4NYHFYJdDotkH2VpadTb7H3rYDMr
	FItb7SMVZKSPvvxuvMOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtRoM-0000000CY7n-2god;
	Sun, 07 Apr 2024 12:39:50 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtRoI-0000000CY4L-3MSn
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 12:39:48 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6ed054f282aso1604125b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 07 Apr 2024 05:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1712493581; x=1713098381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vPBHKQJQEE6Ldq8xPlUpXcKmkLxliyIjm+yGQB4JHjw=;
        b=OaFhuc6EJLqHAbLvemggBDoWFMJ1pxgPnSM/GbB34qv0lVp9VmxHNkf5MF+xcBHnA0
         2urau1sXOYgjZSrhB7kpeeSnfAB/+vlcUYOcEVsIOm2YpUz9sLZkemzhpNHmvLFgfosF
         rbZ9En1fKjlltJyCKp2k2v+BhQrIhF2qZRfzcG/Um2jvbS7c72n0V33ke6m44QBYDk/l
         J+1avYd+e3BBsdfU2MqiRCaTHFlVd6Sas+oUSJhgJYutLjxM9us8ZWvbkwa7pV68SGpC
         uJBod3SWWV+2TkkOdbFWI+LlNE992SPOEwL9GbHjtI+qUPfw/jHTwzBEY/vUmJ/bvrBC
         Hgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712493581; x=1713098381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPBHKQJQEE6Ldq8xPlUpXcKmkLxliyIjm+yGQB4JHjw=;
        b=LvSPTW24xkjHRaDE/IOuO0GXCP0WAdS6W/ITtAgRwKyQjOelgKXXRxy3NrukpoM2np
         0EjDqcuAFMaJ3jKtwwCMcy7cR9AxroOS7DNNSpX6IBKzbv+AQ1BnAMPIIY6eRdYGAAIq
         la7CS9AMaPCky8epE5sg0asdleQrWG06zUZHfooJJjjwR0EvqQw4lxz1BqHWFa9Q690R
         9bKzobHg6i5+Dh8wnjnvUV50K753jHZvSzKNijbn8jNP6s+2yGhTC2CLosOJU/Ueo+bG
         L6Lmq+hkNaCCzirjyiPRFsRj+CbMaGo9qnxp4Gpw5/XDI1IlJvsv50FaNmFBcqODhT0g
         5gTg==
X-Forwarded-Encrypted: i=1; AJvYcCWfkbRd0++aYMDPCnxc70LTmRuS5oE7WSdddNSr1f+BQW/N9iKTm5Xk2oEV1dCu9e+zw6hTR7hH1Klbz9gMLgxIE4IUwgigKI6MifSC2lDu
X-Gm-Message-State: AOJu0YwvXxhIAq+A2wAvjLBAl7mvS9lKMJczAJKF/zoFF4OOEVDng0br
	MERZHh+hQ1pTzEFI3RYcseLSIMTk2GUg6vrABWkzNKbiRb8t9ZISUj11qcmTJmw=
X-Google-Smtp-Source: AGHT+IFJUJpcaALlEKLwsTMy4Msxncvd4YWls0qgllSZsfvWQuz8O0EgJe+rILAvbChBvgUXtRbMgg==
X-Received: by 2002:a05:6a20:8423:b0:1a3:64e8:eb8f with SMTP id c35-20020a056a20842300b001a364e8eb8fmr6675079pzd.11.1712493581235;
        Sun, 07 Apr 2024 05:39:41 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902784700b001dd578121d4sm4933210pln.204.2024.04.07.05.39.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Apr 2024 05:39:40 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH 1/2] ACPI: PPTT: Populate cacheinfo entirely with PPTT
Date: Sun,  7 Apr 2024 20:38:28 +0800
Message-Id: <20240407123829.36474-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_053947_186983_D1CEFA09 
X-CRM114-Status: GOOD (  17.62  )
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

When the type and level information of this_leaf cannot be obtained
from arch, cacheinfo is completely filled in with the content of PPTT.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 drivers/acpi/pptt.c | 135 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 124 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index a35dd0e41c27..6c54fc8e3039 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -21,6 +21,9 @@
 #include <linux/cacheinfo.h>
 #include <acpi/processor.h>
 
+void acpi_fill_cacheinfo(struct acpi_pptt_cache *cache, struct acpi_table_header *table,
+			 int cpu, int level, int *index);
+
 static struct acpi_subtable_header *fetch_pptt_subtable(struct acpi_table_header *table_hdr,
 							u32 pptt_ref)
 {
@@ -77,6 +80,18 @@ static inline bool acpi_pptt_match_type(int table_type, int type)
 		table_type & ACPI_PPTT_CACHE_TYPE_UNIFIED & type);
 }
 
+static inline u32 get_cache_id(struct acpi_pptt_cache *cache)
+{
+	struct acpi_pptt_cache_v1 *cache_v1;
+
+	if (cache->flags & ACPI_PPTT_CACHE_ID_VALID) {
+		cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
+					cache, sizeof(struct acpi_pptt_cache));
+		return cache_v1->cache_id;
+	}
+	return 0;
+}
+
 /**
  * acpi_pptt_walk_cache() - Attempt to find the requested acpi_pptt_cache
  * @table_hdr: Pointer to the head of the PPTT table
@@ -104,7 +119,7 @@ static unsigned int acpi_pptt_walk_cache(struct acpi_table_header *table_hdr,
 					 unsigned int *split_levels,
 					 struct acpi_subtable_header *res,
 					 struct acpi_pptt_cache **found,
-					 unsigned int level, int type)
+					 unsigned int level, int type, int cpu, int *index)
 {
 	struct acpi_pptt_cache *cache;
 
@@ -125,7 +140,7 @@ static unsigned int acpi_pptt_walk_cache(struct acpi_table_header *table_hdr,
 		     acpi_pptt_match_type(cache->attributes, ACPI_PPTT_CACHE_TYPE_INSTR)))
 			*split_levels = local_level;
 
-		if (local_level == level &&
+		if (level && local_level == level &&
 		    acpi_pptt_match_type(cache->attributes, type)) {
 			if (*found != NULL && cache != *found)
 				pr_warn("Found duplicate cache level/type unable to determine uniqueness\n");
@@ -137,7 +152,9 @@ static unsigned int acpi_pptt_walk_cache(struct acpi_table_header *table_hdr,
 			 * to verify that we don't find a duplicate
 			 * cache node.
 			 */
-		}
+		} else
+			acpi_fill_cacheinfo(cache, table_hdr, cpu, local_level, index);
+
 		cache = fetch_pptt_cache(table_hdr, cache->next_level_of_cache);
 	}
 	return local_level;
@@ -147,7 +164,7 @@ static struct acpi_pptt_cache *
 acpi_find_cache_level(struct acpi_table_header *table_hdr,
 		      struct acpi_pptt_processor *cpu_node,
 		      unsigned int *starting_level, unsigned int *split_levels,
-		      unsigned int level, int type)
+		      unsigned int level, int type, int cpu, int *index)
 {
 	struct acpi_subtable_header *res;
 	unsigned int number_of_levels = *starting_level;
@@ -161,7 +178,8 @@ acpi_find_cache_level(struct acpi_table_header *table_hdr,
 
 		local_level = acpi_pptt_walk_cache(table_hdr, *starting_level,
 						   split_levels, res, &ret,
-						   level, type);
+						   level, type, cpu, index);
+
 		/*
 		 * we are looking for the max depth. Since its potentially
 		 * possible for a given node to have resources with differing
@@ -197,7 +215,7 @@ static void acpi_count_levels(struct acpi_table_header *table_hdr,
 			      unsigned int *levels, unsigned int *split_levels)
 {
 	do {
-		acpi_find_cache_level(table_hdr, cpu_node, levels, split_levels, 0, 0);
+		acpi_find_cache_level(table_hdr, cpu_node, levels, split_levels, 0, 0, 0, NULL);
 		cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
 	} while (cpu_node);
 }
@@ -316,6 +334,7 @@ static u8 acpi_cache_type(enum cache_type type)
 }
 
 static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *table_hdr,
+						    int cpu,
 						    u32 acpi_cpu_id,
 						    enum cache_type type,
 						    unsigned int level,
@@ -325,6 +344,7 @@ static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *ta
 	struct acpi_pptt_cache *found = NULL;
 	struct acpi_pptt_processor *cpu_node;
 	u8 acpi_type = acpi_cache_type(type);
+	int index = 0;
 
 	pr_debug("Looking for CPU %d's level %u cache type %d\n",
 		 acpi_cpu_id, level, acpi_type);
@@ -333,7 +353,7 @@ static struct acpi_pptt_cache *acpi_find_cache_node(struct acpi_table_header *ta
 
 	while (cpu_node && !found) {
 		found = acpi_find_cache_level(table_hdr, cpu_node,
-					      &total_levels, NULL, level, acpi_type);
+					      &total_levels, NULL, level, acpi_type, cpu, &index);
 		*node = cpu_node;
 		cpu_node = fetch_pptt_node(table_hdr, cpu_node->parent);
 	}
@@ -406,8 +426,14 @@ static void update_cache_properties(struct cacheinfo *this_leaf,
 	 * specified in PPTT.
 	 */
 	if (this_leaf->type == CACHE_TYPE_NOCACHE &&
-	    found_cache->flags & ACPI_PPTT_CACHE_TYPE_VALID)
-		this_leaf->type = CACHE_TYPE_UNIFIED;
+	    found_cache->flags & ACPI_PPTT_CACHE_TYPE_VALID) {
+		if (acpi_pptt_match_type(found_cache->attributes, ACPI_PPTT_CACHE_TYPE_DATA))
+			this_leaf->type = CACHE_TYPE_DATA;
+		if (acpi_pptt_match_type(found_cache->attributes, ACPI_PPTT_CACHE_TYPE_INSTR))
+			this_leaf->type = CACHE_TYPE_INST;
+		if (acpi_pptt_match_type(found_cache->attributes, ACPI_PPTT_CACHE_TYPE_UNIFIED))
+			this_leaf->type = CACHE_TYPE_UNIFIED;
+	}
 
 	if (revision >= 3 && (found_cache->flags & ACPI_PPTT_CACHE_ID_VALID)) {
 		found_cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
@@ -417,19 +443,106 @@ static void update_cache_properties(struct cacheinfo *this_leaf,
 	}
 }
 
+static bool cache_is_filled_id(struct acpi_pptt_cache *cache, int cpu)
+{
+	u32 id = get_cache_id(cache);
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
+	struct cacheinfo *this_leaf;
+	int index = 0;
+
+	while (index < get_cpu_cacheinfo(cpu)->num_leaves) {
+		this_leaf = this_cpu_ci->info_list + index;
+		if (this_leaf->id == id)
+			return true;
+		index++;
+	}
+	return false;
+}
+
+static bool cache_is_filled_content(struct acpi_pptt_cache *cache,
+				    struct acpi_table_header *table,
+				    int cpu, int level, u8 revision)
+{
+	struct acpi_pptt_processor *cpu_node;
+	struct cacheinfo *this_leaf, *tleaf;
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
+	struct cacheinfo tmp_leaf = {0};
+	int index = 0;
+
+	cpu_node = acpi_find_processor_node(table, get_acpi_id_for_cpu(cpu));
+	tleaf = &tmp_leaf;
+	tleaf->level = level;
+
+	while (index < get_cpu_cacheinfo(cpu)->num_leaves) {
+		this_leaf = this_cpu_ci->info_list + index;
+		update_cache_properties(tleaf, cache,
+					ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node, table)),
+					revision);
+		if (!memcmp(this_leaf, tleaf, sizeof(struct cacheinfo)))
+			return true;
+		index++;
+	}
+	return false;
+}
+
+static bool cache_is_filled(struct acpi_pptt_cache *cache, struct acpi_table_header *table,
+				   int cpu, int level)
+{
+	u8 revision = table->revision;
+
+	/*
+	 * If revision >= 3, compare the cacheid directly,
+	 * otherwise compare the entire contents of the cache.
+	 */
+	if (revision >= 3)
+		return cache_is_filled_id(cache, cpu);
+	else
+		return cache_is_filled_content(cache, table, cpu, level, revision);
+}
+
+void acpi_fill_cacheinfo(struct acpi_pptt_cache *cache,
+				struct acpi_table_header *table,
+				int cpu, int level, int *index)
+{
+	struct cacheinfo *this_leaf;
+	struct acpi_pptt_processor *cpu_node;
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
+
+	if (!index)
+		return;
+
+	cpu_node = acpi_find_processor_node(table, get_acpi_id_for_cpu(cpu));
+	this_leaf = this_cpu_ci->info_list + *index;
+	if (this_leaf) {
+		this_leaf->level = level;
+		if (cache_is_filled(cache, table, cpu, level))
+			return;
+		update_cache_properties(this_leaf, cache,
+					ACPI_TO_POINTER(ACPI_PTR_DIFF(cpu_node,
+							table)),
+					table->revision);
+		*index += 1;
+	}
+}
+
 static void cache_setup_acpi_cpu(struct acpi_table_header *table,
 				 unsigned int cpu)
 {
 	struct acpi_pptt_cache *found_cache;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
-	struct cacheinfo *this_leaf;
+	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
 	unsigned int index = 0;
 	struct acpi_pptt_processor *cpu_node = NULL;
 
+	if (!this_leaf->type && !this_leaf->level) {
+		acpi_find_cache_node(table, acpi_cpu_id, cpu, 0, 0, &cpu_node);
+		return;
+	}
+
 	while (index < get_cpu_cacheinfo(cpu)->num_leaves) {
 		this_leaf = this_cpu_ci->info_list + index;
-		found_cache = acpi_find_cache_node(table, acpi_cpu_id,
+		found_cache = acpi_find_cache_node(table, acpi_cpu_id, cpu,
 						   this_leaf->type,
 						   this_leaf->level,
 						   &cpu_node);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
