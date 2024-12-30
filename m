Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1290DE7718F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Dec 2024 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AaQA0vW9SeL7IfwbPZcCnUno84K3+V8aNEGaGgb7enw=; b=AIst7j4+ObZLc8
	ocLHeAO6o2n8BCU3oRyfwk9ztdxTPbqkbFRcZkuUpe98Ud67kwO/b+kbblxufPRh9exzgDW5HpnOs
	OZB7kqthtMo1tcEdYAtkwdGqwFbulBxect2kkyN7fhBCqWhy9/smUDMu8tECBrNwBBR6TAdbEV32R
	YB83kzEbv7Az2mVdKoe11wudhEWj38PLopi0KST0OdlQmlllpe0mu/6MHo/L2GqlkmYPaVE+W5cXr
	sMSYVl+2YCQ26auQLKQj4QIU6qL0iCEnzM2qfpxrfWQMNiW4iPg4b5vcygEvuTC3c1W5dW5qtaMAB
	mNkIR5y3gkZ6FACQ0VyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBmg-00000004sJ8-2gvO;
	Mon, 30 Dec 2024 09:09:58 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBlc-00000004rgi-40Au
	for linux-riscv@lists.infradead.org;
	Mon, 30 Dec 2024 09:08:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21631789fcdso87865105ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Dec 2024 01:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549732; x=1736154532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyzxI6H4ZAISLyWZ1lhQ49SW3wSD1SDR6GIh5AHA3wQ=;
        b=PUb5qIK/wdPrie/U48LFpnX0LQnFQGBSyr3iHQ5plEYuqQ6tOPoV5EONARmRhbkJH8
         msQhIciUBTTb1bbTxD7br7pRN7Qw2E53zs8+P/L+LBPB8K9Kn7DbZSrudku8t/eyRjU+
         7yMAy8IwYTxdFl5QL+YqOYOgndQU9occAI9LP2USlLkCu+gqNZWv1TN8p4OrN0BsPqBt
         kcfUk5j1bq7g6lOmZubwoRzUSP+x2wUD5h2qe0nN2gXNWUfW/X2l8ZZ0K6xOFMo3OeAE
         7WBRMIJndiP++0CMwuGxi+DD9YeGbdKsi5cPaLB86UqK+ZscwfG4wyNuEGkXKfvfoJFu
         P7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549732; x=1736154532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyzxI6H4ZAISLyWZ1lhQ49SW3wSD1SDR6GIh5AHA3wQ=;
        b=wHZAv1ilzaHYRBnQjZU7yjsuaTSiCWhUtedQkqGXviXzaeq9PEWKABXNeClCsAa8Po
         uyNSXZAKgQizKC56UIj+Ux9vY7OsPeM2Nl90fARH0VJKR8gHNfvdLmxmTnBbZ8PQzgWi
         3NgfqayyQGmB9jA/Skm4ed14PVlJxRgdY4djxkVLtOWWakCj5dcFtWTcVmsYApw7OVnf
         26bdABl31gBkUYIG+iWxMemlHPaNBcSGqm7Ipl6LqJDsK1gXn0BWp9iUAYVlsjjJg/wh
         MS1pL/I57se6Bl6nHziqlYD3FXCrJAqy09ePWgAylGKi9cubvEksaauKDBSndPJeE6iG
         Hzgw==
X-Forwarded-Encrypted: i=1; AJvYcCWn9rA0e9sxIsioDnoJCn1Hmndu45IVfV3s2+4UW132iDkh44a9cL/ZXaPHXl5INFDEklHKB6YHIedoxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1g3jIIipRmqxRBiedvQ+AFv7jKNDp6S1O7KHQ054bHtqlElws
	S2KGmdlZOqh/KzPemliBp2W33dJMPLir0onQo9cos6UQJqD3WcxbrU8tLWuWzaw=
X-Gm-Gg: ASbGncvJkBGa6zJXZVZJ0itEzF5b7X9mrWi2Mn4Tt8a8hCzztqoCHji/gqUDrvBUZen
	gTk9qJXYTPuBJFrjjKr5WM3mgx1Sb9vbnpzlc06VWqrOKvitypZXCUQvMDGhQ/zNMebmfO6fqj2
	S8aKO1Fs2fX/jGLKyEduIVL/vEQw7wVcofVF/KOA6O27Xv9HvM7Dl5D0bBcHqiXTMWieDcD4xCL
	/SI4ooyTZsf6HeIxLGyTr2cWtJK8tDFFusuOn0tSL8z4akaXaD/xVcRDt9eFOxkVXoLCu8UzW14
	8GXo1L9/8oSJMvv1x9OikA==
X-Google-Smtp-Source: AGHT+IEXAwBIqSClrkb4EYoc2OhmhpgilmCz/IsEh6Chc/FsWIzsRB3p/FpLbUSGkXAy0ZMKjVVExg==
X-Received: by 2002:a05:6a20:4320:b0:1e6:50a0:f982 with SMTP id adf61e73a8af0-1e650a0fa30mr7283235637.20.1735549732420;
        Mon, 30 Dec 2024 01:08:52 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:08:51 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 01/15] Revert "mm: pgtable: make ptlock be freed by RCU"
Date: Mon, 30 Dec 2024 17:07:36 +0800
Message-Id: <b59adb960b2075822a6e57efc7a52e7eb7780068.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_010852_993285_A9A35948 
X-CRM114-Status: GOOD (  11.36  )
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

This reverts commit 2f3443770437e49abc39af26962d293851cbab6d.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/mm.h       |  2 +-
 include/linux/mm_types.h |  9 +--------
 mm/memory.c              | 22 ++++++----------------
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d61b9c7a3a7b0..c49bc7b764535 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2925,7 +2925,7 @@ void ptlock_free(struct ptdesc *ptdesc);
 
 static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
 {
-	return &(ptdesc->ptl->ptl);
+	return ptdesc->ptl;
 }
 #else /* ALLOC_SPLIT_PTLOCKS */
 static inline void ptlock_cache_init(void)
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 90ab8293d714a..6b27db7f94963 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -434,13 +434,6 @@ FOLIO_MATCH(flags, _flags_2a);
 FOLIO_MATCH(compound_head, _head_2a);
 #undef FOLIO_MATCH
 
-#if ALLOC_SPLIT_PTLOCKS
-struct pt_lock {
-	spinlock_t ptl;
-	struct rcu_head rcu;
-};
-#endif
-
 /**
  * struct ptdesc -    Memory descriptor for page tables.
  * @__page_flags:     Same as page flags. Powerpc only.
@@ -489,7 +482,7 @@ struct ptdesc {
 	union {
 		unsigned long _pt_pad_2;
 #if ALLOC_SPLIT_PTLOCKS
-		struct pt_lock *ptl;
+		spinlock_t *ptl;
 #else
 		spinlock_t ptl;
 #endif
diff --git a/mm/memory.c b/mm/memory.c
index b9b05c3f93f11..9423967b24180 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7034,34 +7034,24 @@ static struct kmem_cache *page_ptl_cachep;
 
 void __init ptlock_cache_init(void)
 {
-	page_ptl_cachep = kmem_cache_create("page->ptl", sizeof(struct pt_lock), 0,
+	page_ptl_cachep = kmem_cache_create("page->ptl", sizeof(spinlock_t), 0,
 			SLAB_PANIC, NULL);
 }
 
 bool ptlock_alloc(struct ptdesc *ptdesc)
 {
-	struct pt_lock *pt_lock;
+	spinlock_t *ptl;
 
-	pt_lock = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
-	if (!pt_lock)
+	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
+	if (!ptl)
 		return false;
-	ptdesc->ptl = pt_lock;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-static void ptlock_free_rcu(struct rcu_head *head)
-{
-	struct pt_lock *pt_lock;
-
-	pt_lock = container_of(head, struct pt_lock, rcu);
-	kmem_cache_free(page_ptl_cachep, pt_lock);
-}
-
 void ptlock_free(struct ptdesc *ptdesc)
 {
-	struct pt_lock *pt_lock = ptdesc->ptl;
-
-	call_rcu(&pt_lock->rcu, ptlock_free_rcu);
+	kmem_cache_free(page_ptl_cachep, ptdesc->ptl);
 }
 #endif
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
