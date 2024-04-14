Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C62AC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 02:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KiYYmvz6JUBsJnREijqNM8s9YGer4MJ4oBq6vXF/T1k=; b=flQgpxGqRZAm9c
	GRdkhkIdeuTTY5PTUejUp40waRa4Zohp7fEyPmsQBbFyxqGQUXz9NArAkH28zWrbObh1wr5ZhbH5s
	roz3siN4f+9qB8JY/DM9o/lxN7zWMacA/U7QP8gk8zE+0P556yySZ86aziHhPKdyst7JB1s2iJG0i
	8m/Gd3EYkHTsk0cTajIdnEf05RfTSrLrTuqymD3kJqAgo7tZaFie132NUunwjfsykJ8BtGTl82k9L
	c2NKKTAAlUmLNs8Vywclm5eqx6+62f9GTcajp8qEd1DjYRDVfiQxNmt4L/2uMErGpEN8F6slX2ONw
	ZrZNV3FbmOGzmgYaLAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvq5p-00000004RkX-3EkC;
	Sun, 14 Apr 2024 02:59:45 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvq5l-00000004Rhz-2oP1
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 02:59:44 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e4266673bbso17656445ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 13 Apr 2024 19:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713063578; x=1713668378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PQZbXYtBh7IQ8zFAgTStWmYnvk6O15njdv6RlNb8FnM=;
        b=D+MjZW/P4oi9Zy5ZV7QAM7SkGtiqYPeFuF6X6xyXum2FiU2WfbEL1qridwKIGnzK/F
         55yv+VKpb1WR2FgDsmlVZBefjb6Gl+vJAwA3NyD/6InAgRjpG/+823ZEwS1b1O7OHh3H
         EFfV3s6uIniZ4gMXu450h+Dmr/PKyonhm5u3qHDResA9zNYcDzvgKhBFjWgXWBB5atwm
         5l/Nn3AHgJgsh1XcrQyPvMOjJv1J2fZdLeu8jdfkVt1EGIqP5OnkiAPfOjMrr7IkqsVl
         4b6t9ix9jzhF3OiDKYgNwYFMVfIMTNxR6y03lCrF8cMRTuFKP8Bvkfk/YpopVWnaZmGO
         tO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713063578; x=1713668378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQZbXYtBh7IQ8zFAgTStWmYnvk6O15njdv6RlNb8FnM=;
        b=NX/mBFhFAYcc1enStzTOc1ciRtryyQEtRY3AwsyqzBpOwwqsKFfnxPcgd8GiwRmgzk
         pwMpOVpYNXGJBDqeZ6QWsaNN6FgxemM6bUXymypOyP2oeBXM4V5m769V4R5bn1jZURCx
         fHAKJZRD3zWPOdXALcpXBC4OlS8IdDo228vGkKEW73obSbDbm/DHh+UbB1xrXj66Wav7
         AaKpGstXMk7cCju8m8Sgbq2xwX2FyqtFjr9EI/Gq/NkX6kV3DGrWFVB9uGMY5GwphyUF
         kben2Fd0A6tmzdgrVSr6JelPgzJheb/uJaaqLVsuJjetp/ZEtiz7Hqk7spoMOoqon20A
         /UXA==
X-Forwarded-Encrypted: i=1; AJvYcCVyTVkD6ivaTCwC2gh/F7r13qf2XaQbw8j51CENZhbrdO53ZUcQ8aRn1uVX1QpziE1qbd8q1WjjUGAjmcNZxYVUmBi+BmAbOPCA0w+UP1f+
X-Gm-Message-State: AOJu0YxIFbtrhMp/wyFYJ3Kr/1lLq0emguOgu682bIrx3doJNvNJO8lP
	0Vo7wFDCLSov+jPN3mSrVebIIyN8ql3CqJkOfH4jqncyoNMxzNRSGJEv1HUmkrM=
X-Google-Smtp-Source: AGHT+IG7b7aVnf3Zx6K5E292MakYH/snzrvJ2cHDzaIo1qp/4oj8mSnNTvgLFCUzjYXaXUBKeIJdDw==
X-Received: by 2002:a05:6a21:7e86:b0:1a8:2cc0:290a with SMTP id th6-20020a056a217e8600b001a82cc0290amr6050259pzc.30.1713063578513;
        Sat, 13 Apr 2024 19:59:38 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.246])
        by smtp.gmail.com with ESMTPSA id cx15-20020a17090afd8f00b002a219f8079fsm4799913pjb.33.2024.04.13.19.59.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 13 Apr 2024 19:59:38 -0700 (PDT)
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
Subject: [PATCH v2 1/3] riscv: cacheinfo: remove the useless parameter (node) of ci_leaf_init()
Date: Sun, 14 Apr 2024 10:58:24 +0800
Message-Id: <20240414025826.64025-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_195942_046071_DB90E2E7 
X-CRM114-Status: UNSURE (   8.17  )
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
