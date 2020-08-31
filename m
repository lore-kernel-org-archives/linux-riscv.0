Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B442BC433E7
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:34:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 661E9207BB
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:34:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DoGOPYF0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PgK3vno4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 661E9207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gne2fMXKVjMAhYPwp7/kzesl930NDSfEbq5ijnmQeyA=; b=DoGOPYF0kouXZFNDtj+oMjB9Z
	nlqn9FDUT/73kw3mHdEN1gpyvq8B6HBkx+Mb7FzCbB4C2aGL9yY6sY1QwwT8cluIcDSKK72JfN2aS
	7Z5jF5trfBeQ/r0yJfykdSSfMdRXPustq/XC2Q1jaTU6BZ+IepgJRdaf/32+zCvSF/FzM8qkUYJdh
	bCE/wtWJNTj5wCbE2vuK3XWeLq9Ojd4v2p9ISgUoAoZFXDFj591XRvv8AHmjmt8VfxZR8P4qhxXxK
	ZIz4ZiHQUoYbXC1rae4k4HCYmKuAZYTpm3kuVS8sdaqdXiF1oCI5HaQI9U1kmQWN9Y+2Y1PyLQItL
	aQt3FpIDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCeKG-00004z-0J; Mon, 31 Aug 2020 07:34:00 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCeKD-0008VA-Eq
 for linux-riscv@lists.infradead.org; Mon, 31 Aug 2020 07:33:58 +0000
Received: by mail-pl1-x643.google.com with SMTP id y6so2610504plk.10
 for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2020 00:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L8nXsELlGPOePYVbXqOXdNoTjjuLOTGOh+u2B39XJu8=;
 b=PgK3vno4y4uwW0Yi58wlX6/1YevWE+eaNCNklNzhaveHpwsIaI1MOoSH3cPpLFUUq8
 Daf9oeWZJge40WMlzQBLFJQJKeCb+bgKr9G4rja5pujve83hHa8vhB6QAX5nwGGxDGub
 SLidwctwFMKDMb1q6daswpBm9XAYxPD9Gdz4rwQa8NTs71hTlTb53lJYgQI983OD9hqb
 1Fv/iK3Rd7OyRSPQWASC8XjqbN/Xvv63t8YtjVNaYepP4Onp7W79GMFT2pevIYsOKgt1
 kjVapBj+6KPTM3zgGOGjeOGqfdM0tRkidE3wpB0nWtuZcO5NeChEuDItjsr7WI8AZvy/
 8nwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L8nXsELlGPOePYVbXqOXdNoTjjuLOTGOh+u2B39XJu8=;
 b=PDrumAnL+Ychlax/EkggAFRnBsqVQx3n026vaIu+GESaGamaVk1Dc/PQsv5FKV4kxE
 zs/g7kCH+Yja4i2eVBLaLIWJJxbtwKcLeSe4KF7L1xl0R40bgCdIKsfBzT6wRC5KH1It
 9ogMBabgy4Q4gBUasuRx/lm38r/7ScaiS/12uoSh1KXQAotcECmouxAuM24SzYfyEhTk
 Fe5+D4tqfmIOafAnvJie8zDA0gAxk87OJVEe7kr58MUca56F39kQZ6mwiVtWkV6Ewsql
 BLlzD2Sg4xJCYq2N+h4JmF4865VaWOYUmv5B0ZjtNqR8lqBiTc74Fb78lHcskMdk8q4O
 L86g==
X-Gm-Message-State: AOAM533MuzO2KFHZhaYNu+aLnsp2JA7j8jJFwiPAhjE+lCfC1gqRP1i9
 yKDqXbTbN9xZGPMT67hzZrwRrw==
X-Google-Smtp-Source: ABdhPJzs9X5O5kyMY3Nd2SdofibbT/u9RBqwKl1r3PYPjMBunDZIw25L3ceWDYs9AEQE5xZYYOFRyQ==
X-Received: by 2002:a17:90a:4214:: with SMTP id
 o20mr229469pjg.232.1598859235279; 
 Mon, 31 Aug 2020 00:33:55 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id m3sm6065979pjn.28.2020.08.31.00.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 00:33:54 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] riscv: Set more data to cacheinfo
Date: Mon, 31 Aug 2020 15:33:48 +0800
Message-Id: <77ead0a4d6f48966429dbb1ea48d901d589217af.1598859038.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1598859038.git.zong.li@sifive.com>
References: <cover.1598859038.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_033357_567038_087CB3AE 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Set cacheinfo.{size,sets,line_size} for each cache node, then we can
get these information from userland through auxiliary vector.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/cacheinfo.c | 66 +++++++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index bd0f122965c3..291d7d8f748b 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -25,12 +25,53 @@ cache_get_priv_group(struct cacheinfo *this_leaf)
 	return NULL;
 }
 
-static void ci_leaf_init(struct cacheinfo *this_leaf,
-			 struct device_node *node,
-			 enum cache_type type, unsigned int level)
+static void ci_leaf_init(struct cacheinfo *this_leaf, enum cache_type type,
+			 unsigned int level, unsigned int size,
+			 unsigned int sets, unsigned int line_size)
 {
 	this_leaf->level = level;
 	this_leaf->type = type;
+	this_leaf->size = size;
+	this_leaf->number_of_sets = sets;
+	this_leaf->coherency_line_size = line_size;
+
+	/*
+	 * If the cache is fully associative, there is no need to
+	 * check the other properties.
+	 */
+	if (sets == 1)
+		return;
+
+	/*
+	 * Set the ways number for n-ways associative, make sure
+	 * all properties are big than zero.
+	 */
+	if (sets > 0 && size > 0 && line_size > 0)
+		this_leaf->ways_of_associativity = (size / sets) / line_size;
+}
+
+static void fill_cacheinfo(struct cacheinfo **this_leaf,
+			   struct device_node *node, unsigned int level)
+{
+	unsigned int size, sets, line_size;
+
+	if (!of_property_read_u32(node, "cache-size", &size) &&
+	    !of_property_read_u32(node, "cache-block-size", &line_size) &&
+	    !of_property_read_u32(node, "cache-sets", &sets)) {
+		ci_leaf_init((*this_leaf)++, CACHE_TYPE_UNIFIED, level, size, sets, line_size);
+	}
+
+	if (!of_property_read_u32(node, "i-cache-size", &size) &&
+	    !of_property_read_u32(node, "i-cache-sets", &sets) &&
+	    !of_property_read_u32(node, "i-cache-block-size", &line_size)) {
+		ci_leaf_init((*this_leaf)++, CACHE_TYPE_INST, level, size, sets, line_size);
+	}
+
+	if (!of_property_read_u32(node, "d-cache-size", &size) &&
+	    !of_property_read_u32(node, "d-cache-sets", &sets) &&
+	    !of_property_read_u32(node, "d-cache-block-size", &line_size)) {
+		ci_leaf_init((*this_leaf)++, CACHE_TYPE_DATA, level, size, sets, line_size);
+	}
 }
 
 static int __init_cache_level(unsigned int cpu)
@@ -83,29 +124,24 @@ static int __populate_cache_leaves(unsigned int cpu)
 	struct device_node *prev = NULL;
 	int levels = 1, level = 1;
 
-	if (of_property_read_bool(np, "cache-size"))
-		ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
-	if (of_property_read_bool(np, "i-cache-size"))
-		ci_leaf_init(this_leaf++, np, CACHE_TYPE_INST, level);
-	if (of_property_read_bool(np, "d-cache-size"))
-		ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
+	/* Level 1 caches in cpu node */
+	fill_cacheinfo(&this_leaf, np, level);
 
+	/* Next level caches in cache nodes */
 	prev = np;
 	while ((np = of_find_next_cache_node(np))) {
 		of_node_put(prev);
 		prev = np;
+
 		if (!of_device_is_compatible(np, "cache"))
 			break;
 		if (of_property_read_u32(np, "cache-level", &level))
 			break;
 		if (level <= levels)
 			break;
-		if (of_property_read_bool(np, "cache-size"))
-			ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
-		if (of_property_read_bool(np, "i-cache-size"))
-			ci_leaf_init(this_leaf++, np, CACHE_TYPE_INST, level);
-		if (of_property_read_bool(np, "d-cache-size"))
-			ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
+
+		fill_cacheinfo(&this_leaf, np, level);
+
 		levels = level;
 	}
 	of_node_put(np);
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
