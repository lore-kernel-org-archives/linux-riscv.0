Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5E0C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 06:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OLJnOgRe92uwTA3/r2f0uEe3OfOfx+nph73FYfT5fvo=; b=ja/UL9XUS3mSIL
	Uqll43WB3oxc2vuqOgxgr3Xv6MC50Q8/FfYLO+jPh+jHckRu9Tp1U91daZbVQ+vM3ljI65lnqIC1B
	DWBukUNJYnq4Wa2zIshOkvs+UGTElzUavG4Xl5yW1IHhYBU0BcOUpYj3bOazhXFLGGb6SEjbbMnMM
	HT+ZIjJ51R2l1ifh1Gols9FwayCGcGM67QV9EdmNDaXQam1aoUGC4pftsNxewFyUqxzHM440zbGXX
	8kdRvcVYaCMhlEw2pUb/wtAeeKVeu36Nefz+TYLf6fQkmfqysL4Oe444yxkEYiqTLwnE3NhzCvxy1
	V8/hMygKU0raDUBIGBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZnaX-003kBO-Do; Wed, 08 Mar 2023 06:47:49 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZnaT-003kA8-Vk
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 06:47:47 +0000
Received: by mail-pj1-x102e.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so1049178pjz.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 22:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678258064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gG2oN8vtildG2P61+wI9F4PrJ+MvdmYrBhZL9NTK/Uo=;
        b=qrtN7j5AXKWJsCG3E0PH4oiCMNwLFR6JCjdwKskXS/mauDKDcisfSfVFXcUnjsBlEC
         ax3etlGwgmryLx5JXpm28/mwLf2AV7y6/B5orDESXqchdDaCntCp7hrjMuxEJdWQv5IT
         AgCeScSiNGdLQAlN4bi06JOmybvt9w49xghgqxwRID4jZN4j6s3FLjJiNfBKrezBJUtD
         p6iFalHB5coyIDEkCp8PxdBSaszXHzQcAilmx0+npCC88zVByWDRXfvCkqVbjlL3IbYe
         Cc0SNWskqmmLHHu8PGumzRfI1SttVg1HYgrUfgJrnBRN0pkvdtNOacd31XdSqldMp0TG
         qIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678258064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gG2oN8vtildG2P61+wI9F4PrJ+MvdmYrBhZL9NTK/Uo=;
        b=S+ZAA868LsKpz3lQFCMAH9V9eaKRyI63QIIkYdi2M1W9oMV2GjyyP/t5y1J0IEQ3Ct
         51I4SR/yJQFt8UeVpdwwajSznDJRo/wyRyJzml7o4kV2avt9HRujAbkFND+y6avhF9kA
         bzhV9z+an4FanZZmwU9e9GEmvnULMq5gwJXH8tDY5v8ZYM+aDQqOf4bgdr4L2WkkdAT5
         9wLfM+d2OpnJs2HN33ue6KI3a84moLBFcPuInKd1dqJSqbgrNiVtyhLCxwxv+opSPvEE
         /rqEaptAkMePHe1LXo6Plg/0XmxqMaSX/Of80lq69yWfm5Q4n1mmxADarHvH3Zj7GLcV
         edrg==
X-Gm-Message-State: AO0yUKX19tH8/Gf977RNY+JQ0HhDezS0UXALtFMfbtf6WqFYryomaSzT
	CDo/yUfz+nG0N+LwbBZTH/M=
X-Google-Smtp-Source: AK7set9j5/uTj4qvRxW7bRO0mbX+0sl5auSDS2wZRxqHsunyU90ihaJiYjiNyp921WUS0zv/keFrDg==
X-Received: by 2002:a17:90b:204:b0:23a:2038:bf4b with SMTP id fy4-20020a17090b020400b0023a2038bf4bmr17014620pjb.3.1678258063791;
        Tue, 07 Mar 2023 22:47:43 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id y20-20020a17090aca9400b0023317104415sm10149201pjt.17.2023.03.07.22.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 22:47:43 -0800 (PST)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	sudeep.holla@arm.com,
	pierre.gondois@arm.com,
	conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH] Revert "riscv: Set more data to cacheinfo"
Date: Wed,  8 Mar 2023 14:47:34 +0800
Message-Id: <20230308064734.512457-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_224746_065849_4004B9EF 
X-CRM114-Status: GOOD (  14.86  )
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

This reverts commit baf7cbd94b5688f167443a2cc3dcea3300132099.

There are some duplicate cache attributes populations executed
in both ci_leaf_init() and later cache_setup_properties().

Revert the commit baf7cbd94b56 ("riscv: Set more data to cacheinfo")
to setup only the level and type attributes at this early place.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/kernel/cacheinfo.c | 66 ++++++++---------------------------
 1 file changed, 15 insertions(+), 51 deletions(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 3a13113f1b29..305ebbdc780d 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -64,53 +64,12 @@ uintptr_t get_cache_geometry(u32 level, enum cache_type type)
 			   0;
 }
 
-static void ci_leaf_init(struct cacheinfo *this_leaf, enum cache_type type,
-			 unsigned int level, unsigned int size,
-			 unsigned int sets, unsigned int line_size)
+static void ci_leaf_init(struct cacheinfo *this_leaf,
+			 struct device_node *node,
+			 enum cache_type type, unsigned int level)
 {
 	this_leaf->level = level;
 	this_leaf->type = type;
-	this_leaf->size = size;
-	this_leaf->number_of_sets = sets;
-	this_leaf->coherency_line_size = line_size;
-
-	/*
-	 * If the cache is fully associative, there is no need to
-	 * check the other properties.
-	 */
-	if (sets == 1)
-		return;
-
-	/*
-	 * Set the ways number for n-ways associative, make sure
-	 * all properties are big than zero.
-	 */
-	if (sets > 0 && size > 0 && line_size > 0)
-		this_leaf->ways_of_associativity = (size / sets) / line_size;
-}
-
-static void fill_cacheinfo(struct cacheinfo **this_leaf,
-			   struct device_node *node, unsigned int level)
-{
-	unsigned int size, sets, line_size;
-
-	if (!of_property_read_u32(node, "cache-size", &size) &&
-	    !of_property_read_u32(node, "cache-block-size", &line_size) &&
-	    !of_property_read_u32(node, "cache-sets", &sets)) {
-		ci_leaf_init((*this_leaf)++, CACHE_TYPE_UNIFIED, level, size, sets, line_size);
-	}
-
-	if (!of_property_read_u32(node, "i-cache-size", &size) &&
-	    !of_property_read_u32(node, "i-cache-sets", &sets) &&
-	    !of_property_read_u32(node, "i-cache-block-size", &line_size)) {
-		ci_leaf_init((*this_leaf)++, CACHE_TYPE_INST, level, size, sets, line_size);
-	}
-
-	if (!of_property_read_u32(node, "d-cache-size", &size) &&
-	    !of_property_read_u32(node, "d-cache-sets", &sets) &&
-	    !of_property_read_u32(node, "d-cache-block-size", &line_size)) {
-		ci_leaf_init((*this_leaf)++, CACHE_TYPE_DATA, level, size, sets, line_size);
-	}
 }
 
 int populate_cache_leaves(unsigned int cpu)
@@ -121,24 +80,29 @@ int populate_cache_leaves(unsigned int cpu)
 	struct device_node *prev = NULL;
 	int levels = 1, level = 1;
 
-	/* Level 1 caches in cpu node */
-	fill_cacheinfo(&this_leaf, np, level);
+	if (of_property_read_bool(np, "cache-size"))
+		ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
+	if (of_property_read_bool(np, "i-cache-size"))
+		ci_leaf_init(this_leaf++, np, CACHE_TYPE_INST, level);
+	if (of_property_read_bool(np, "d-cache-size"))
+		ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
 
-	/* Next level caches in cache nodes */
 	prev = np;
 	while ((np = of_find_next_cache_node(np))) {
 		of_node_put(prev);
 		prev = np;
-
 		if (!of_device_is_compatible(np, "cache"))
 			break;
 		if (of_property_read_u32(np, "cache-level", &level))
 			break;
 		if (level <= levels)
 			break;
-
-		fill_cacheinfo(&this_leaf, np, level);
-
+		if (of_property_read_bool(np, "cache-size"))
+			ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
+		if (of_property_read_bool(np, "i-cache-size"))
+			ci_leaf_init(this_leaf++, np, CACHE_TYPE_INST, level);
+		if (of_property_read_bool(np, "d-cache-size"))
+			ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
 		levels = level;
 	}
 	of_node_put(np);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
