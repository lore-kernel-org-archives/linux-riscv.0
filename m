Return-Path: <SRS0=FYRI=CF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDDDC433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:22:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4F3820738
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:22:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WjbRFe5A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MbQSDBWv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4F3820738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WP9O9surI0dRTTWUDR5FEhhcXIss4ZsP2SL6surV/+A=; b=WjbRFe5Ak6CAjjKQDqVmyjqwa
	EfbV0XZyKm7H95jKmVLyWotmmTlx7A+UzZiiuc3M58MAxTMU2sn1qIYEnt5cGJ3ne47419I502yUq
	XEKb8wj0NSb93naJyyABJh07GErto151KgeQD2uoXEonD416it0fzMPW33cTUx0B0+/iI8bN/xfGv
	G+sNmT3fQ0mwxtOflkMXqYYLStrPjRuG8rxylFCuI+9+/M7KTH0x1SJIX4vyOi4PUXIgl2e5Kddao
	fzDtxDU7/EhnkS2HMM2cd2u5EVv+ODgq60dP07LuMSuLhPZwkXB4OBETFZl8WJsPvgIJCsXFXo/rU
	9wT/eW5wg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDBC-00017e-0O; Thu, 27 Aug 2020 08:22:42 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDB8-00015g-NR
 for linux-riscv@lists.infradead.org; Thu, 27 Aug 2020 08:22:40 +0000
Received: by mail-pf1-x443.google.com with SMTP id d22so2923455pfn.5
 for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2020 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mKMjaK4PJ2ikiw6P6/95F1RDaOcuUp3p/mM1whWPxCo=;
 b=MbQSDBWvoPjLTkfpJ6W9TcjJq9/+n/NQo+AJobLzZ7Is1ydeKYFI48f1r/AN91sTxm
 DHQkeVarpRgucSMz0YC7L1zAQEhKH7795QJAyG/zEF6h4JD3NpYKgwEEm7Xb/yJzacsh
 6LblF7uD2w1wZdCtimTpg+Uy+uoPA1wbB3+8rR9KLpYEjv7EK1YrIonjbtQQck1h9EuS
 2I+hwbt9esWN2x77H8qOxf8mNQkgwUf3rx8gWwg2xkmyfeFwQODfHceImpF9lfNTdskN
 vMygPBxPxi8VvFkIrEbr6Dt1NHjqE/xkmb6UHIp8elkzd+6VqpdPA1KhwXVqtRu124hF
 bSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mKMjaK4PJ2ikiw6P6/95F1RDaOcuUp3p/mM1whWPxCo=;
 b=bTADAGUVP/H9rzoEJrz4aRbPL6gHUdi/EeFTrYRX2ZXIVjj+9hV5cOt3NuDu+aVCUy
 5o8sI3YsMQjX29XPgxDbn6XvNicFwloIQTGRqt6u2eiwjegUZisd16avNIsrIexiA/bA
 MKlxaeqoX18eNq3/Z3BOis/M9B6shH/GLWy/aFSIV/0M+RQVj2xwVCN9YIXK68Ex7xwX
 MFY+vbS451OqTQ0WeJRR4uSG1CuMNWZDkEQ0EOTwqdv8rPfprPT5g0pFtCIfjvQIHrgq
 Rc+/iOjGA9NBWugjhl40EynA2mPYF4Os1/cJhMm1lkoeUde1gN7m0yuoCmwfnjFiYHnj
 2c6w==
X-Gm-Message-State: AOAM532kFxVnkFBtPjKDADRlybXhynQ3+WROmbDlib9/Xh4dp0VM/l3c
 y0X4ri2bf8RJO3yIT4/3qQaLrg==
X-Google-Smtp-Source: ABdhPJw5+r9975c88bMGRSVhrhMXZSwgIayivj2J2g9JqLxJnjwcO22WhqzHH0zBazX1WESqCzXWkg==
X-Received: by 2002:a63:224e:: with SMTP id t14mr12839351pgm.129.1598516554899; 
 Thu, 27 Aug 2020 01:22:34 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 124sm1828351pfb.19.2020.08.27.01.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 01:22:34 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] riscv: Set more data to cacheinfo
Date: Thu, 27 Aug 2020 16:22:26 +0800
Message-Id: <3f1f693147f0b62f19f4a44b8e8ef3d5bde23352.1598515355.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1598515355.git.zong.li@sifive.com>
References: <cover.1598515355.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_042238_874308_256D2468 
X-CRM114-Status: GOOD (  14.22  )
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
