Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAA2C433E2
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 07:09:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9D120CC7
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 07:09:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kDYzpHJa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ghhlv7BF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A9D120CC7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WP9O9surI0dRTTWUDR5FEhhcXIss4ZsP2SL6surV/+A=; b=kDYzpHJauLzl1J+DZOEo48iB2
	bvXq/tGZ29l0NBF06cBVVorItxdtfE5dSfdz5AzDmQ0Sn5FO22qb9yhh4ptcBGJ2EF4ubac3ftF6K
	HNLfkdyXcH+Au27rwW58dY60cMtgU0Y6Ud4ZtECo5lILW2g/ZSWp/1haRPB75+GO9ku33uSXXTXJ4
	FWuSZS6PzX0OHNvdn/6+nlbeQp+V93qcbDwYK6jAZW8xbnVwv8+Mj3wjRGiRw2U5jHZryt01LMR8l
	5krToNPMW8XKYLNvaLxq0XaAGTXPLLqQENGrqeiC1m9DtC81VstMAZhOyaJzQIjBGbhEMvEYIi4wf
	nhL9UTFuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBYVj-0004bg-3w; Fri, 28 Aug 2020 07:09:19 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBYVf-0004ZY-C6
 for linux-riscv@lists.infradead.org; Fri, 28 Aug 2020 07:09:16 +0000
Received: by mail-pg1-x542.google.com with SMTP id 31so10856pgy.13
 for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2020 00:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mKMjaK4PJ2ikiw6P6/95F1RDaOcuUp3p/mM1whWPxCo=;
 b=ghhlv7BFn+CoyJ/qpWLxPvcAdjBob84a1v1bEie4PmjELr4jDJpKD189uiP+PiSeUM
 dn4BkGa8PD6RZ5SMdrACxOlfdAE2inOoTptwUtEDwcgpMTd4c878Ef6yGb+UPioaUQHW
 V+YTVZ6b2FKID7CRLzrNaXrXzLAMmtJWFgU/r7AWLbRNpoKfwJgtBvy1QoGc/kE6bNfL
 EJhJfTNsUAezTtl3mQzj+8g8SiHkUKfmrYVwzp4HomPA6eoem+IxfOJufXvT05T/tBzG
 6uRVhuBGmRWU4ju32MEPHWmakv5hIvz/r9S0YbJKLaxNkSWjmV1SljyJ8lNy6xNTcTQ6
 LnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mKMjaK4PJ2ikiw6P6/95F1RDaOcuUp3p/mM1whWPxCo=;
 b=P8ess/ssrVtiWpao9HLCV9TiljOPVQ+PMPt8OVXyBlgnvCF4X442e51Ausz9Kz+h1d
 CXinVtZnAAkYf6AfRjx70PrpzB0X5X4rRYXt7QOdX5EUDwn6KEnP1qmXnYVtBVk5bd9X
 eVvx/ZiuCBey2ICoMI8uBfts7kRS6SaPuQBMDIXJUqus80N83i4EiCOxPl1SL6/RcOJ9
 TnLBunLbVo5Ni3hRIZoOSGD6//B0bmW9hbKXnsRsMrGQsywajXZN/q6iejtR+zmZR+IE
 VwFqsy9nATvzw2Y4t1pG1XFPQh3Yj+Ie+W4avfTFatUhTudBU4hCs3sjTRZDoGnSjPUD
 OXgg==
X-Gm-Message-State: AOAM533C3IluWmnsytQFhrPZc4xamu3lgxKGoerxc8vO6CLE5QDuk4WE
 iDXVe5ahG9LKPhe4tQSSN+epeQ==
X-Google-Smtp-Source: ABdhPJzWu9olqzhyA1WxCBG0aVFF8eZrugS0pqNqVtLrrKjE2eulS3GXJ99mhlQ3ooMazkmwzrKvbg==
X-Received: by 2002:a63:c30b:: with SMTP id c11mr252351pgd.252.1598598552858; 
 Fri, 28 Aug 2020 00:09:12 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id b8sm434158pfp.48.2020.08.28.00.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 00:09:12 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] riscv: Set more data to cacheinfo
Date: Fri, 28 Aug 2020 15:09:05 +0800
Message-Id: <3f1f693147f0b62f19f4a44b8e8ef3d5bde23352.1598598459.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1598598459.git.zong.li@sifive.com>
References: <cover.1598598459.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_030915_431167_AD047101 
X-CRM114-Status: GOOD (  14.29  )
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
index bd0f122965c3..8b85abfbd77a 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -25,12 +25,46 @@ cache_get_priv_group(struct cacheinfo *this_leaf)
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
+	if (!(sets == 1) && (sets > 0 && size > 0 && line_size > 0))
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
@@ -83,29 +117,24 @@ static int __populate_cache_leaves(unsigned int cpu)
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
