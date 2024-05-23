Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7F4C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 11:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CyxDcWI3uUvv//eYA8YaTnOjJeuS6+fQAAgwQo1Ag+0=; b=DeAjcifgnag7u1
	0RCgcZLwqBg9se+BVoq/hTuZlchusjxIIqGDHkUTOW+iKIdKIwd0o/0aGGAxbeKv3Oo1HFvhIMxkR
	gFhPYcgYAT1c0UkkjqwsrTw4m0ZlQ9Pi8wi955sZ2r1wjdu4ByD2NtZxzP5WDXxw/PMR7sFFEDnko
	WFEbK28MUOIVJFXDDPibXTrNBv/b4zY5fFLbHWkaZK4TttO7bKUtoARXkTwght2s5wrgTQMkCS9FL
	8bBixzs+c7aEZETp1gn1JI9EooDcNb4GbhZF1syAyfqYdDbKkvQwI7lI0hjzsi3qYzdVj778PctDu
	JGcWtPRdTSVmQ9XfMEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6OP-000000060EP-39Wd;
	Thu, 23 May 2024 11:13:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA6OM-000000060CA-2TPi
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 11:13:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1f332528c1aso9885365ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1716462824; x=1717067624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+aKuxY2Fk4OLcsa0CSr6w7+nYt28fnnuhVioZfggdrc=;
        b=AVu7TjUhPY/AiuOCQtZU2Y3lCa/meY6GGVp3P7W8xU5ab3av1o6u5EBU++VxXQW+2A
         rcDTaeRFqciCw9EYykhfqMx7j2kgfacmmfbaPMJ9GZ3UZyzYpoPpXFRCOR7tLdYWcfFW
         wA4tDFKO0cVdHGWqlstPy3GPu3nszvB3pODG+0PD7Y3nOcnruZAea1Kig4WHyriUasvg
         ZM2nTRaUl6/+czkD2XT1MKM+pBuwA5Ltv1AzyJpYRPHRt30IkS8naiUUoJmaz419hof5
         HprASVG0Q8Wd++xNsRAuGG4a3y96hTzEvb6SDrGg9b7pe463g2JEz/BdRAJWDRtNLmXx
         wH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716462824; x=1717067624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aKuxY2Fk4OLcsa0CSr6w7+nYt28fnnuhVioZfggdrc=;
        b=KZnmdEC7qFriduEeqTN8uk4+kbJc3IP5b5VhupGWgqmdF7j2WW/U35oRio42jeKVcX
         vAilA4ReZ4F58kqO3Y53L3nS8Q/g2b2zLjDIUla8hMebaV3D0P6aYsxCGM0FPsGKn1I8
         H01+tlq+6cYzwdVbZYInvCRULM6Lg2OuEI5WBIIJVZpw4od9G/qH3iCV99X4wAaqqvus
         /mJH9aWUBN1MLuHNzNGQcgu67+S5mNdg1CuYsqB9mEBReiIwZlAUNV2q4J3xMg1VH3Rf
         BLVZ2dJy7X5JvCGJp4NMcoc1Booy5CWVYScYcS0mIET672f18TzF27S16VsNdCHcv+py
         tlSA==
X-Forwarded-Encrypted: i=1; AJvYcCXlT6nKUOqGUIiSz2ZjYlle0/sacOT5aTbrqGI5zkS28CdqJBOPfVN6jQH2RlnC4mGvOr7bDU62dHrzHEcQR4ibXMmxIMoTmdoCV32nEiLL
X-Gm-Message-State: AOJu0YwNb8f0C/vKc/shMdXIZX5/oEWUtatygVqdBUwXR5kpLz3/aJyU
	L6SikLxaBwM9r1QVQMKYij1hMowAVxgYHTVV3h4PnncIKjsb2J1KahO6OZ8onmM=
X-Google-Smtp-Source: AGHT+IGfvwX4nHErQyEQ6tKcNt4WXio4qE4pV5EfAuWWShz5bnwIL0deO6asuZ7WelH2PvE/SRuq2w==
X-Received: by 2002:a17:903:1104:b0:1e5:3c5:55a5 with SMTP id d9443c01a7336-1f31c95d67emr50609535ad.8.1716462824368;
        Thu, 23 May 2024 04:13:44 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f2fb4ca0ebsm76399555ad.119.2024.05.23.04.13.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 May 2024 04:13:44 -0700 (PDT)
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
Subject: [PATCH RESEND v5 1/3] riscv: cacheinfo: remove the useless input parameter (node) of ci_leaf_init()
Date: Thu, 23 May 2024 19:13:20 +0800
Message-Id: <20240523111322.19243-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_041351_017375_E1883508 
X-CRM114-Status: UNSURE (   8.40  )
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
