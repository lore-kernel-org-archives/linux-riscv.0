Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0E6CD342F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 06:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSGt+Q6xy/YAlQ3PKAcOhDZ5SYTjIJj3Gt4WIjFABoA=; b=fN+mme+FJdNIqO
	ppO7y15iZLGmyjheRjTHDF5RdgOZbHOuEeqyzmNnRlqYcaHPmTPVgafGltmmxo8FQrS3YW3wULk9N
	qlK3dn129JVa/yypSlV5pWuiIG75isYp5nh3IjVRDKrhAjINfiHDgaA2Rv0QF/6KCGzLfF7nXNgzU
	J5Edq3mborWdgNVnOYEPpwL/1B+7S+RwLc58n43T4rY06xC41W1TFHcZUBopkJws/kq3bPjcj4sS7
	ZfCX07zfrX+AVJj31GRig72QE9CgJgmjJu1IpUZfcgONiT+b2kWkR1WLV195Flvpq6utkOk9p1DkU
	oI8b5e8nW5Qh4nfyhEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEYo-00000005iZe-1NoR;
	Fri, 08 May 2026 06:19:42 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEYh-00000005iWB-3PhD
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 06:19:37 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-834da62e52dso723331b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 May 2026 23:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778221175; x=1778825975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQGzo7BAtPBBp7UrgMr8aErap5KHDpu3IcptfAdP3BM=;
        b=q3/uIbpQTEzCxzs5H8HyqPfVKQTuco0FclVV6tzJ544ClXaWyAJVps9rBLzxWDVs2V
         yKeNZU8YecQi73bzom6zpLlCtegrbFFAqwB81yfZIfUtZFmYnDCVnar6+NvfBy34XHFA
         /pfWpCHaHDHlXMIdVcN1xEYy8akj61r2RJAlVnvrvjsxONATUGoEOeBuiyWQXf46Z48A
         DfdDmILkp7kAPd+n/UAZt+HZjexdcaHkhsd3YjtgDbBdr8oV6RnRVj+67AqUMZg2KQi8
         9RytbMIdm5bxsylOtykaFyBBZtd+HZDK87KkecMuEDMkjin8gDeveehFW6xB1U1NlxVB
         B+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221175; x=1778825975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQGzo7BAtPBBp7UrgMr8aErap5KHDpu3IcptfAdP3BM=;
        b=UUHDMEhgeYXzTfbbhrwlCKFm9B1S2vHMzB6S3jOy0HEa345rxEqZLucf3I98ny7LXW
         Eal+dPg6s8n2wNzX8IRZQm7D4KPQG310WJjrWt2/PQr7l/8TOnWR7Ls4WtyoCZHTld+u
         ieswc1/GMbrLfU/FMAuOg8WHAvv2Prj5QQ7g3dsKJ+zVbp7pWlZnZao/De0ORAEWT2fZ
         /GTZ9d1qbNCPTWPs02T4XpCUJRx4ThT9MkPl+HulDZRBZxCu1Tc1PCn7c/HVGLmSb+ii
         +KeVbsZQm7g1I/oZwEoUen0UyTae+J52begg4VK0lhwAJkkRYns8dn13NoQ0LYyu96GJ
         ZCtg==
X-Forwarded-Encrypted: i=1; AFNElJ+x2qZL2Ad1ruuvJQFbFz5AUbwQXyu1KuNWWmIuhTz7AHsElTXD8jiR0qN5iHZfEp3P6Aq2OJwPL0lrrg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7J1KBbYUps86OH9wfUN1cLNYEiBBu2SXtjjTWJtdTPmLK6YIH
	ECyDfgHbCCsEANVI8tigIPJuO0RI6wFf3eGRM4sbthvuB/bm1awMWZPX
X-Gm-Gg: AeBDiesdCQyONUNtik/oXrTYn3UlGSokA0Ie0TMXcCNN5wLXZvhZvbzPJrQyaubHHL8
	pD0gPFNWFtnEmFpIkNvktHlb9m+dM1mgWf+e7FjqH5XikgXylVDg/8TF7m1EWveRANW1J+v+aqM
	zVRN3iCmhW7Ghome4K0tcG8Igd/Js5TO/V/FKtvyIkZB86aA95Te48JHQaIDokOzF9YQIYSLztC
	mwX/+MM/N3tET/xN1upE8TmPCtlvkPQIP76CMdnos0DRwLJVrDxNJ3x5stMEEBdMdtp+qhkEb3C
	0ZE1oEQzKr4CvMtCor4kURciTaSAllQa55TqLnoKB9jyBT+9BLj9LfTNkMrRndv5x/qmYeA+Lfu
	bZBDFR4DrYc/M/fBSrAgATCrFVbXKSWgj8MZX9dWzI50g2sE4AQNWx8+xzArxueXGuHPPupwaq+
	oeg9CpOo66KlpY4xZD5ymYtzcuRLV/gaJEyafy18S05C+/vUfv
X-Received: by 2002:a05:6a00:2e90:b0:82f:b0:28f0 with SMTP id d2e1a72fcca58-83a5d96f560mr11390545b3a.34.1778221174987;
        Thu, 07 May 2026 23:19:34 -0700 (PDT)
Received: from ubuntu22.mioffice.cn ([43.224.245.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm11308452b3a.19.2026.05.07.23.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:19:34 -0700 (PDT)
From: Wenchao Hao <haowenchao22@gmail.com>
X-Google-Original-From: Wenchao Hao <haowenchao@xiaomi.com>
To: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	Barry Song <21cnbao@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Minchan Kim <minchan@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Wenchao Hao <haowenchao22@gmail.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Wenchao Hao <haowenchao@xiaomi.com>
Subject: [RFC PATCH 3/3] mm/zsmalloc: drop class lock before freeing zspage
Date: Fri,  8 May 2026 14:19:10 +0800
Message-Id: <20260508061910.3882831-4-haowenchao@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508061910.3882831-1-haowenchao@xiaomi.com>
References: <20260508061910.3882831-1-haowenchao@xiaomi.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_231936_147831_D56FD3FD 
X-CRM114-Status: GOOD (  14.70  )
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

From: Xueyuan Chen <xueyuan.chen21@gmail.com>

Currently in zs_free(), the class->lock is held until the zspage is
completely freed and the counters are updated. However, freeing pages back
to the buddy allocator requires acquiring the zone lock.

Under heavy memory pressure, zone lock contention can be severe. When this
happens, the CPU holding the class->lock will stall waiting for the zone
lock, thereby blocking all other CPUs attempting to acquire the same
class->lock.

This patch shrinks the critical section of the class->lock to reduce lock
contention. By moving the actual page freeing process outside the
class->lock, we can improve the concurrency performance of zs_free().

Testing on the RADXA O6 platform shows that with 12 CPUs concurrently
performing zs_free() operations, the execution time is reduced by 20%.

Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Signed-off-by: Wenchao Hao <haowenchao@xiaomi.com>
---
 mm/zsmalloc.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 47ec0414ce9e..4b01fb215b19 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -880,13 +880,10 @@ static int trylock_zspage(struct zspage *zspage)
 	return 0;
 }
 
-static void __free_zspage(struct zs_pool *pool, struct size_class *class,
-				struct zspage *zspage)
+static inline void __free_zspage_lockless(struct zs_pool *pool, struct zspage *zspage)
 {
 	struct zpdesc *zpdesc, *next;
 
-	assert_spin_locked(&class->lock);
-
 	VM_BUG_ON(get_zspage_inuse(zspage));
 	VM_BUG_ON(zspage->fullness != ZS_INUSE_RATIO_0);
 
@@ -902,7 +899,13 @@ static void __free_zspage(struct zs_pool *pool, struct size_class *class,
 	} while (zpdesc != NULL);
 
 	cache_free_zspage(zspage);
+}
 
+static void __free_zspage(struct zs_pool *pool, struct size_class *class,
+				struct zspage *zspage)
+{
+	assert_spin_locked(&class->lock);
+	__free_zspage_lockless(pool, zspage);
 	class_stat_sub(class, ZS_OBJS_ALLOCATED, class->objs_per_zspage);
 	atomic_long_sub(class->pages_per_zspage, &pool->pages_allocated);
 }
@@ -1467,6 +1470,7 @@ void zs_free(struct zs_pool *pool, unsigned long handle)
 	unsigned long obj;
 	struct size_class *class;
 	int fullness;
+	struct zspage *zspage_to_free = NULL;
 
 	if (IS_ERR_OR_NULL((void *)handle))
 		return;
@@ -1502,10 +1506,22 @@ void zs_free(struct zs_pool *pool, unsigned long handle)
 	obj_free(class->size, obj);
 
 	fullness = fix_fullness_group(class, zspage);
-	if (fullness == ZS_INUSE_RATIO_0)
-		free_zspage(pool, class, zspage);
+	if (fullness == ZS_INUSE_RATIO_0) {
+		if (trylock_zspage(zspage)) {
+			remove_zspage(class, zspage);
+			class_stat_sub(class, ZS_OBJS_ALLOCATED,
+				class->objs_per_zspage);
+			zspage_to_free = zspage;
+		} else
+			kick_deferred_free(pool);
+	}
 
 	spin_unlock(&class->lock);
+
+	if (likely(zspage_to_free)) {
+		__free_zspage_lockless(pool, zspage_to_free);
+		atomic_long_sub(class->pages_per_zspage, &pool->pages_allocated);
+	}
 	cache_free_handle(handle);
 }
 EXPORT_SYMBOL_GPL(zs_free);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
