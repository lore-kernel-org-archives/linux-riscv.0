Return-Path: <SRS0=aIEb=AO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F32FC433DF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 08:58:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3068B20885
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 08:58:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3UH2o0Dg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gno6XA1R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3068B20885
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1QsYiphvOo/T7c7GkrVsdRGoa8XHX7+dO7XkHnpu0qg=; b=3UH2o0DgswYuTjaCqdcewb/CD
	s8SwKIJMHbeiJP2G594eetOk3c3VWPtY1N6mTnoihkxuraiUCX8eF5iFsVy9sMQMXFdl+6tCodaQ9
	44jWy1QEwVRrYvFkiTGh1/Muqle5ie/S+L1H22zLftAMpeZ4PAVSxtSadg6c2C22g2VeY9Y2Ry5OY
	kwbqMOS9Qf10gOLUbFSZbn7XpjnboYasffIkANsxhA/v0Vpg2BRZNk4atjuV2/+x5WbET18xzWRPL
	nDxCzPVthbnUUWgDzs8eDMxwTTBlM2IJ+hLCCxEYtgH3lRPLU5puwtyv+K/35IsFbWeuQ3EsUgMAt
	Ig5UYVgNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrHWK-00036D-7p; Fri, 03 Jul 2020 08:58:08 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrHWG-00033t-IL
 for linux-riscv@lists.infradead.org; Fri, 03 Jul 2020 08:58:05 +0000
Received: by mail-pj1-x1041.google.com with SMTP id k71so10128960pje.0
 for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2020 01:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2BGY31r3gXsVvMQOHoM8a6MHD33MAStOOtvTSyarMfM=;
 b=gno6XA1RsGOX7Anfh8skZ16jnJ2eYyVSDqsmWAMcOR3jmCUaEM/znLHHGUE/j/y37e
 QY2nm6fQisDvNQPsOKd0SDhrWXRNvMvbW39HIq2GP2d7NzRij8XZJvxafI2rihmF97YU
 aMeHttXeBsNVEQ2P1GcXzTN4vrfHr8+If4xYUwSDsMZI/ZyxdBe0/0sRTrvVosGZw22m
 UNIGY7Mdq/GW5yNrBZV5wMVQYClpfnTPRilt9Cv52+eJTMBEGO9F1EfZiY+ULmp44Skg
 MHWkcT8LL4G2OfZzAjcLUeRvqWE2g4+spkulMnBEljaArz1Z+FkP1FRUNLQmLpzWhgdX
 affg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2BGY31r3gXsVvMQOHoM8a6MHD33MAStOOtvTSyarMfM=;
 b=EsDk161FPVi/kL77TE+EaiWkkNil/vflBRPGiyBAffvamWqT4BjY8jZ466ZAbcz83S
 Qfg9Nmc0NCZahE/6XBSZ9ycATxfodR06dD32Z5sB4zqQ4C2BVbAMFYwKIw2ieyYb2OxC
 C+n6lb6SFD/62BC3HwM0zt3ykSW4boOtUvegR5IUEiGplp+eFyEr8tk7loaJU3eqYyox
 KYSE6dMtg4gWQf4wUv/nhEDCqXhgEjxHfMTyyIcuFNYzljtjz5zvl2ASX/iWLqz3TczT
 5KloOCqZ993N1ncrfCaFBOGJQtXPrWSQDudM00ubqf1UPvWt+8thBZDZItopC0ZpEk6e
 t3GA==
X-Gm-Message-State: AOAM531T85+yk3pbl7XTO+k3ch/TEzztvTIYKfodY8zF125fS7aXAkJx
 zzV6jZI1aGfLY4GEeggbIGck5Q==
X-Google-Smtp-Source: ABdhPJynSZW9qH2tq+gpwdtLXh45KB+tBR8yBMrcqSwKxOpT+68saLPhHGU1Sla5UeGcRJbdhsGE5g==
X-Received: by 2002:a17:90a:de94:: with SMTP id
 n20mr27314929pjv.125.1593766681242; 
 Fri, 03 Jul 2020 01:58:01 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l23sm2126287pjy.45.2020.07.03.01.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:58:00 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] riscv: Set more data to cacheinfo
Date: Fri,  3 Jul 2020 16:57:53 +0800
Message-Id: <3ca47cfde607516e51f78f1645357ca739e775d0.1593766028.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1593766028.git.zong.li@sifive.com>
References: <cover.1593766028.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_045804_646482_B0BD7C7E 
X-CRM114-Status: GOOD (  11.77  )
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
 arch/riscv/kernel/cacheinfo.c | 59 ++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 4c90c07d8c39..cdd35e53fd98 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -8,12 +8,46 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 
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
+	if (!(sets == 1) && (sets > 0 && size > 0 && line_size > 0))
+		this_leaf->ways_of_associativity = (size / sets) / line_size;
+}
+
+static void fill_cacheinfo(struct cacheinfo **this_leaf,
+			   struct device_node *node, unsigned int level)
+{
+	unsigned int size, sets, line_size;
+
+	if (!of_property_read_u32(node, "cache-size", &size)) {
+		of_property_read_u32(node, "cache-block-size", &line_size);
+		of_property_read_u32(node, "cache-sets", &sets);
+		ci_leaf_init((*this_leaf)++, CACHE_TYPE_UNIFIED, level, size, sets, line_size);
+	}
+
+	if (!of_property_read_u32(node, "i-cache-size", &size)) {
+		of_property_read_u32(node, "i-cache-sets", &sets);
+		of_property_read_u32(node, "i-cache-block-size", &line_size);
+		ci_leaf_init((*this_leaf)++, CACHE_TYPE_INST, level, size, sets, line_size);
+	}
+
+	if (!of_property_read_u32(node, "d-cache-size", &size)) {
+		of_property_read_u32(node, "d-cache-sets", &sets);
+		of_property_read_u32(node, "d-cache-block-size", &line_size);
+		ci_leaf_init((*this_leaf)++, CACHE_TYPE_DATA, level, size, sets, line_size);
+	}
 }
 
 static int __init_cache_level(unsigned int cpu)
@@ -66,29 +100,24 @@ static int __populate_cache_leaves(unsigned int cpu)
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
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
