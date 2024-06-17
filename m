Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6476C27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CyxDcWI3uUvv//eYA8YaTnOjJeuS6+fQAAgwQo1Ag+0=; b=4XkZ46TUcH9JcY
	zGkF1IfbA5j/vM9UEG1BbnEWHx7eixNPhsFyyLQVXY7MNkhUUmKuFLaepPYp0HFCg1dx8ciOmTzfE
	HE8HjuVaar4NvFFgcSYsphPY3g7/cDCySTVzRTormO2ksUH1rZCDSweZGKALhHMn+qXdod0GC5zav
	PCtWwdcHIqniIsXNJiTq0GnZq0aHpvFg0XxNre5tfwtG1suuYkkKhhzFoZJzUZZ5NXjv0V3M0Xzzd
	M47+PGI6dQdoTl9aJMEfGA9DLjz8NwtrnUG1MmQuszcKnT2K0MFs6P8C2gawwA9NLCk0UY1/9k0LW
	qF/vHjAzFGCkhTFSYi4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCBy-0000000AmYB-1wy1;
	Mon, 17 Jun 2024 13:14:38 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCBv-0000000AmXK-0PMz
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 13:14:36 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1f65a3abd01so37563125ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 06:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718630074; x=1719234874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+aKuxY2Fk4OLcsa0CSr6w7+nYt28fnnuhVioZfggdrc=;
        b=QjANA2ZJ8sMQe+cDJhRK+YkyIpb2R762BHNfzS8KILA+bPeINhwR+nGbJo1iY+CG7i
         /oHaZPDvMGIz1vCR0LjQNJMEw9GeEvqVUTVGUD3E05nNJ5bRmtk0pjxrSviH5Lq+Xcww
         oMbDd5bcbZ25MjIvGxiY23aQDmAufde8AOn6iLO1Mq282OOyRdMu1rAEhlWcTy1YEFJv
         TjQzfoSg4Eh6RnN71AiDYY5J7bfrxC3hIiTiq3F++q83k+tlGCH5ydSuHpM55fmjtQZM
         YD9y3uzrZguGff2bgEeXB6cnamwYpdvDtjmgE00W9WUYxx6Q1jt0j56xC075gFT2TVAD
         pyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718630074; x=1719234874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aKuxY2Fk4OLcsa0CSr6w7+nYt28fnnuhVioZfggdrc=;
        b=LY1Um1sdsoRMv+qL9qSykOUtJTxhj8YYdyiYuB5lSxswGJbsmibMHHyHRkcXKPsOFQ
         +qGJxQRJ+9WrWxd3NEEm0oOPGywcUgIroYsverz6jP6xly2CQpcN4Sbi+6049NUKmoJZ
         /yG+eKZ0eIAJXLg1WKUmvdupz28VPKz56eF+M71vyG7yR0ga4Ar/xQ2IsXV/sfxoq6im
         +Eb2tvPp7h6OB/QmroCqcXgV8RmiFpFhGIyYS3oaT1kLM8glZyT1IXVj+BtL03EbJtgV
         6mymW8zuvhoH57KZjGTHSIrbTdwp20/iDtq8b1lom9WsS2ob0ioki2fITOyAF5aBqhRh
         umyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvaeB6OeWD9Z1Fi+IzM9CWKU6oIQ1y3yALIczEXN/NHcjCHXBplBB4SPgQRooxH4Pna86TIzfdvA4aJ35NyRn8z+1ngLSIhXQ9SUH/ch6O
X-Gm-Message-State: AOJu0Yyu2ntt/4if6kTncQZ9gIj0BKUcndoNRT1f4wON8S1newGPsvSQ
	p8p0e2iL5Arska0zMqVKl9OYgcmB0Q4eteCKC6Q63UQ0/g+CU92xd8vz2mVHuEk=
X-Google-Smtp-Source: AGHT+IHD4rO7F/Egqxpgx8GA7LvUPhaTN7BCgz2f2PAN52kUoSotiU50nIDGx9zF+6fxgOrcqL1j1g==
X-Received: by 2002:a17:902:da83:b0:1f4:b18a:3f25 with SMTP id d9443c01a7336-1f8629fee64mr128841735ad.60.1718630074305;
        Mon, 17 Jun 2024 06:14:34 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f0260csm78801785ad.200.2024.06.17.06.14.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Jun 2024 06:14:34 -0700 (PDT)
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
	jeremy.linton@arm.com,
	Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com,
	sudeep.holla@arm.com,
	tiantao6@huawei.com
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v6 1/3] riscv: cacheinfo: remove the useless input parameter (node) of ci_leaf_init()
Date: Mon, 17 Jun 2024 21:14:23 +0800
Message-Id: <20240617131425.7526-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_061435_208980_6B201090 
X-CRM114-Status: UNSURE (   8.37  )
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
