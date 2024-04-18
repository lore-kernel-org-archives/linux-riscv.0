Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B2AC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 03:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CyxDcWI3uUvv//eYA8YaTnOjJeuS6+fQAAgwQo1Ag+0=; b=yxkm0SOHk95EAX
	+RlYIlgxQw7FG9diwYvP3xbk4fRVO3C225eK9M/KFxKfOZLQDJHrj3XqHiMzeDT3ZRCyyuEWtsUGy
	ZVz8kO0CRCx7FN83rTKQ8UK9JLVIwCXpROf/lQcJr6bfklxCqIhLTett149wDliPm0i1W/6lfW4lm
	6N4r0nILA0Jc1Kz66CuFsSkX3K72X0frArIbBx4SRPSQSMjVxGwi6qLflUHGyZnOkAsmhntZzBoh0
	3/7GOgjqXkcfewXOPsUfsvVXZ8wZ2pq26qkc54iY5hgc6HgJsmt5KrTLqEG6PdCQJi9ewlGXuvlw9
	rcg2jLYbwrGWjASq8eoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxIh8-00000000okf-1cvm;
	Thu, 18 Apr 2024 03:44:18 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxIh5-00000000ojo-2Nhd
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 03:44:17 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6eff2be3b33so483651b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 20:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713411849; x=1714016649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+aKuxY2Fk4OLcsa0CSr6w7+nYt28fnnuhVioZfggdrc=;
        b=fkvwTEPXFnMp7XpRvrsuYsY0Y5tCt7YgnD10u2XyIVLh11972yton7P6QLZko6zPaq
         OkmAA6v47oDr04JJrKPqoWmUn2GJv3iRt0bD+e+t2aOFHPck5ruAasfghnHbZzInfDPA
         rEBitJxb1Tv3jcuOjMf8CmDdzypjolKRkA+McnaAuDYv2JaaoXg2UryO4OVXDNI3E8C3
         qiy18/AkW+F3GCAmmHVYgULX+Q3ELu3zn9ROXiBXgIKPPmkMxOaEuky26Z2WHdmoSZUr
         XlxSNnesG0NTG8PYshHUY9IsTRA1kWZk1kwCdfIFv4LDQdkA4VlKbBcJAx5amykpHXCj
         CrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713411849; x=1714016649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aKuxY2Fk4OLcsa0CSr6w7+nYt28fnnuhVioZfggdrc=;
        b=XB3CfRS7QWBzncUlaslDZ3uYv6Mj9Pau5BsLbOL3psYXeZbd4A1farB0rkdepN48K0
         QyUaOsJ4TzAYVTG4WoOS17UQt1Nyhyu++/3lOQLFjhNf2ugN+g8dm+/TBbwvi5RLvbdg
         A6t+XYWH+xQu2rvfESd3PDEXr9X/cXw8TJ/eG63c7MuB5GIRhwhrBNYKs2c/HJF8NxeU
         e6wCtnvtGG5wLw7m+WIP4gyK2J3xOMqlwFZb8BHRvy+9vqIu2nZ+C1IN1Ap/On0YAMN+
         R3sPU1KMeWMXlzg++YLMTkRxw+vnT3f87BXNFp8C1cuuXACauByI5Hdo6HfNSaXh6Dm6
         hZng==
X-Forwarded-Encrypted: i=1; AJvYcCW6t0cKK5wzXKwsZrau56gDsGKLFMGdbcwhPiqm+O7lzJ0pTEUau8vF1JtWMa+u5spaLlPa3TuEG6ixoH5hNcaIg11MRScKrufLlfltrTqA
X-Gm-Message-State: AOJu0Ywx2sbD3OOz2KvBdGOJ4+XkwixWIAP5Eeo9GQjs4KBbqiVzlYEz
	BCXbZHIbY9AvtBaocd44aRXYoPp4KgV3ODsyHgDs2zGLWz5LJFTKildKhmKpZfk=
X-Google-Smtp-Source: AGHT+IENnC+gIH2bbDka18v3JCTvqRUUTm8xhPk1GrdsMZSjMFsPl6ypgKPGxdD/ZPfFfCVnnmOTAQ==
X-Received: by 2002:a05:6a21:184:b0:1a9:8834:ee7d with SMTP id le4-20020a056a21018400b001a98834ee7dmr1973589pzb.4.1713411848825;
        Wed, 17 Apr 2024 20:44:08 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.13])
        by smtp.gmail.com with ESMTPSA id lb4-20020a170902fa4400b001e88a4ebeb2sm109880plb.152.2024.04.17.20.44.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Apr 2024 20:44:08 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	bhelgaas@google.com,
	james.morse@arm.com,
	jhugo@codeaurora.org,
	jeremy.linton@arm.com,
	john.garry@huawei.com,
	Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com,
	sudeep.holla@arm.com,
	tiantao6@huawei.com
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v4 1/3] riscv: cacheinfo: remove the useless input parameter (node) of ci_leaf_init()
Date: Thu, 18 Apr 2024 11:43:28 +0800
Message-Id: <20240418034330.84721-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_204415_896071_F33EF5A1 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

ci_leaf_init() is a declared static function. The implementation of the
function body and the caller do not use the parameter (struct device_node
*node) input parameter, so remove it.

Fixes: 6a24915145c9 ("Revert "riscv: Set more data to cacheinfo"")
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/riscv/kernel/cacheinfo.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 09e9b88110d1..30a6878287ad 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -64,7 +64,6 @@ uintptr_t get_cache_geometry(u32 level, enum cache_type type)
 }
 
 static void ci_leaf_init(struct cacheinfo *this_leaf,
-			 struct device_node *node,
 			 enum cache_type type, unsigned int level)
 {
 	this_leaf->level = level;
@@ -80,11 +79,11 @@ int populate_cache_leaves(unsigned int cpu)
 	int levels = 1, level = 1;
 
 	if (of_property_read_bool(np, "cache-size"))
-		ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
+		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
 	if (of_property_read_bool(np, "i-cache-size"))
-		ci_leaf_init(this_leaf++, np, CACHE_TYPE_INST, level);
+		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
 	if (of_property_read_bool(np, "d-cache-size"))
-		ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
+		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
 
 	prev = np;
 	while ((np = of_find_next_cache_node(np))) {
@@ -97,11 +96,11 @@ int populate_cache_leaves(unsigned int cpu)
 		if (level <= levels)
 			break;
 		if (of_property_read_bool(np, "cache-size"))
-			ci_leaf_init(this_leaf++, np, CACHE_TYPE_UNIFIED, level);
+			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
 		if (of_property_read_bool(np, "i-cache-size"))
-			ci_leaf_init(this_leaf++, np, CACHE_TYPE_INST, level);
+			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
 		if (of_property_read_bool(np, "d-cache-size"))
-			ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
+			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
 		levels = level;
 	}
 	of_node_put(np);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
