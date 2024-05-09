Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5AFC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 07:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CyxDcWI3uUvv//eYA8YaTnOjJeuS6+fQAAgwQo1Ag+0=; b=GcEXKwvnsfqZp1
	rIy8JPb720FjbKTEi0BjXiM4T22S/Tht2g10ZirN4cVDAF5oV7i/ZaoJbUu8+NDhZyYliX6KiWjA2
	I4lkyT25DC9YYAXyzTsEupwt8Clb52YP8VC3hgfh86Np3a13Vul/R7wNTkNWfgnsZ1MzH9ag8YMxq
	AU84ltEXjwkYHcveFEoqIbNGS+J3jMaaevSs731JKhJjYCbk6hbLJoMyKAV3bpAqq5wBZaRxLaBsq
	Yzqln19kOCNzdepK28sa7+eXN55OKDyB0jPmQwTbLPskPDRTHr3eTfDn6qdwH7Vc63nSODgu3SLMv
	DN8YRKc9h6QtXdme8jlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yHv-00000000haG-1N6k;
	Thu, 09 May 2024 07:33:59 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yHr-00000000hZE-20Pt
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 07:33:57 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e651a9f3ffso3120395ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1715240033; x=1715844833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+aKuxY2Fk4OLcsa0CSr6w7+nYt28fnnuhVioZfggdrc=;
        b=TwEiKLRfNo1kl4SZqcSmtBGUXRjAiu+uqJ1BZ5U71cZqPaUlRPUjnwFjyaMXLF/JgK
         sx0wFHgbc5bkPZD0hkf2VlF4/kpucwuOb+9/d3tO4zdFeXGyQsfuUxHesDYE8pT7TRJ7
         z1kwevMt5weBW09vyKlgas2IArq5v/r8TIiZmk29K2E5k6fhPkBj+UMFompGjlR2cxPt
         48d/zZQV+PSMIXBPGMm6pKA30iCSIvwcBCz9GlwMs+KnNsY9D4id8LK1FlWMyMFH2VVd
         wv52iX9QsZDdMu2Jm4LE4lrJRSTDrsFY16OtXYeLMbglhg5hUU31q194ittYwTWGWlKj
         /vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715240033; x=1715844833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aKuxY2Fk4OLcsa0CSr6w7+nYt28fnnuhVioZfggdrc=;
        b=eWKXonvz7lxpk0hRtQCrZey6efy2lGE+Mt8WE6kelxyLkFZ+3kGVa7jXsPf+gdPSg9
         a+/KqprSJyit9GkLMaKVrBTjcVICxYizEXvTIX8ODUClN0FHmIAlfNiFuvZ/TJWArapu
         VI5QIhD5q3Qfa9irgBeQ5+YWdJ4b00ZoJ85mmjBk7xR+hSt8CGDL8IpG6gK+nn8Wbx8f
         2AN5oPycLmu2iwlXalYulKT0bTHUKIUptzyk7uB72kAb3ilHkN+Xo+AFhlU+94JOLKBN
         glOwcxoeHj0BQxmJN4pCRGM34FB45agYMfNWXJEp0H3ZQ6xPgtAnHg6FZMAKlfmVZD3l
         vY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdqKMf5L3oDREtPDKnAhqo+o2aI0RLecXnbk5H2KsnziZi/XpIwkjb5/b9irKxZsJ9xqbd37IN1Mkc6H4M7MY8Vfqhlq0VNQxu0fmsIqNI
X-Gm-Message-State: AOJu0YzFFuYLQ6utYuB0NHS5ZlHcegJfD6PALeoMrG4CNwuEn+m/X122
	Zp4o+OYAHT3Wa5WoQaV5RKfletGNIK7kn2yzsNxM1In9ybFHajnR0lMlov9NBNY=
X-Google-Smtp-Source: AGHT+IGAYwKBi2oqjWz3LiGpENreMeENH67yYk920FAgS7TcHb0bpY6oL9Li9tUP+YyE2Ur4qM9EGA==
X-Received: by 2002:a17:903:40ce:b0:1ea:9596:11eb with SMTP id d9443c01a7336-1eeb07973fcmr50940325ad.60.1715240032758;
        Thu, 09 May 2024 00:33:52 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0badcbacsm7519045ad.97.2024.05.09.00.33.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 May 2024 00:33:52 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	sunilvl@ventanamicro.com,
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
Subject: [PATCH v5 1/3] riscv: cacheinfo: remove the useless input parameter (node) of ci_leaf_init()
Date: Thu,  9 May 2024 15:32:58 +0800
Message-Id: <20240509073300.4968-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_003355_543105_E815106F 
X-CRM114-Status: UNSURE (   8.77  )
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
