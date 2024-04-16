Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24427C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 03:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KiYYmvz6JUBsJnREijqNM8s9YGer4MJ4oBq6vXF/T1k=; b=NvthPl3PrKhnK7
	BUlnEEfaouf8UC1VHP8rkAyLBWatpOBKn/XHQ6ZB4uxUOtzNwrqmzInIU3yMXnSR5Wm0ULBJ+rnF3
	nJ5WFiQJGejTKqqSI7f2bE9mm4Vn7ylgODWj+g+wfLYn7TiFbBkv1c6SF9mgBGoPHAaE8e4WRYXW0
	iN6SR10N4l1LjsLi8Szbehy5mLhPgA4R8a3SGS+HpM2q8mBuJ7tgqCb781xfXnmEioxvC9fobKZur
	FfMMHj/hLNcfUwvmXnYHDEIZznSKIbZfVQr/z8ysv2QojLebl/npDpI/kwsJvncEt5czfwdReLZZi
	mVggyUPau48+ZgS4AGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwZHc-0000000AcoE-0QTB;
	Tue, 16 Apr 2024 03:14:56 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwZHY-0000000AcnP-090O
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 03:14:53 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5aa1fe2ad39so2758797eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 20:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713237289; x=1713842089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PQZbXYtBh7IQ8zFAgTStWmYnvk6O15njdv6RlNb8FnM=;
        b=lvspC0aNXpuKf/1wJjqGXWiFYsLk4QUb/XcijQuYjP+msm+bnjpSpY3AyFl4E0+8pn
         q/f8iy6gtWNTzDChUkvUp4Fu/ISVHBDPvQ+7khu2LFWQP4OnO6vx7zNJq5ErM/uWYg+Z
         KMfXU0SyYeS+Oxr6QAp7WLcYX3rQmx9zY54eOZn7f534d1TULcuya/FLybNkixMuqNxu
         4KvwUNcRBTsxN8vRQ7mWYji7hkDhIXSCchdszQ9wH/bP7hQiWD8TI+SXVNkZEYjl2Et3
         /j+yme2Aatr9M8f1ZMdN93X/op601YNLFURWJ+eAW/LceQXmlSCc5nD86hVvkSLFhBdG
         2MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713237289; x=1713842089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQZbXYtBh7IQ8zFAgTStWmYnvk6O15njdv6RlNb8FnM=;
        b=VLd49eSy/squTE5g+NER0ONYUnbwkt98pMzQjwT3kZFyfxpfTOeHCh4L5aNiqJs9h/
         JJJFEFfeTc15AJuCObGm2yEdL6yCc2M1makfx5+BsT47BWBXsJOzC3g4gVNQKaz8ACCt
         w5ec9jvdxxrkyt0qsaqoWXSNoZDeadAx2znS5dpndDNdWvyptysWKDIcG0GxkJK4AW08
         DfiznFzPiEPlD/aERxIk1ABmaWK0OZQ0tMgS3ShGd8XLXEiWReAs7+9sIUwEOu9PM6Fu
         ZR6+XFhY+AXzUTa/RjW5CVfv3H/kTeNdCbEX6WH4TPrVDAJevpT3yrNf5dFbOORF+7iD
         iGkA==
X-Forwarded-Encrypted: i=1; AJvYcCUsO9F9L9miM/IsRxYODTWbAbEA3zN9JeIMfHerzuo4pHNcFOA7PJcyBKckqW0L3l/BLkXSDqljxsENPqjxARXk/nwVR6T25N0Tot5pWbV7
X-Gm-Message-State: AOJu0Yxp5ADBkCSSzX1ss02rKVj4xHJmrvYUs5YTtMUEkZCu36ebRv8t
	1nCyPbbl3NUQQ4ElzobWBUvLRhXSJJGfe+YFPI+sCHwDsVmf+M2keTGqtT7wF64=
X-Google-Smtp-Source: AGHT+IEUEhPIFbi25ZykOAC+pbd6o9LQdaAFbDsNVQBq2JuTsulcC5uS7XAD4urvJzqQy3HPwtT6fQ==
X-Received: by 2002:a05:6870:c1cf:b0:22a:bdd7:7b3b with SMTP id i15-20020a056870c1cf00b0022abdd77b3bmr14102111oad.11.1713237288784;
        Mon, 15 Apr 2024 20:14:48 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d20-20020aa78694000000b006e6adfb8897sm7907983pfo.156.2024.04.15.20.14.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Apr 2024 20:14:48 -0700 (PDT)
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
Subject: [PATCH v3 1/3] riscv: cacheinfo: remove the useless parameter (node) of ci_leaf_init()
Date: Tue, 16 Apr 2024 11:14:36 +0800
Message-Id: <20240416031438.7637-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_201452_451686_ABF91B7F 
X-CRM114-Status: UNSURE (   8.66  )
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

The implementation of the ci_leaf_init() function body and the caller
do not use the input parameter (struct device_node *node), so remove it.

Fixes: 6a24915145c9 ("Revert "riscv: Set more data to cacheinfo"")
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
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
