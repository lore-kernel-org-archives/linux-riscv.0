Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD890E7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AaQA0vW9SeL7IfwbPZcCnUno84K3+V8aNEGaGgb7enw=; b=zEp0Iyy1faVT3A
	41ml7hgbWtDt5/8IFCf07FtaOP7uFHekTlqDdISw+LLQ/YOc3cBMg9k7I5TMdQKwJxzx53CGUvcY1
	fRRj4RmvtOGl2bPInpY5PYdAS4VZI3uaLplNHev6XLE7lfWPWH90zvbdjXSGYGHp0/B0pU267ueNm
	5FnAJtGoFPd0X9rGQXYDBPD2P0XwGHKy/k8o0WVmoywhpnRm2zfzbsa5e0lLk3LdjiaUGNJIADfVW
	KBsJjyJRR4vI4IXtGDnR+4tfeVpgrWNwXD09U1P9jKb2I1aJvgWYgfeFArPLYkI5dmYcYU9Vv9yI0
	w9vd4PdhCLb7vGs/qMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPez9-00000009gZG-0Z7n;
	Mon, 23 Dec 2024 09:44:23 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPey6-00000009g1r-29Um
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 09:43:20 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-8019338c2b2so2381096a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 01:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734946997; x=1735551797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyzxI6H4ZAISLyWZ1lhQ49SW3wSD1SDR6GIh5AHA3wQ=;
        b=WUUl13y18QDSw12DqRLV7i2gVw7rLPArPIqqp2sNn603znj6op/lBKerqaxfkCfNBv
         vRTN7uBU2Pv59i1vtATFzQMuR6qKhQVz4SaPS5y5A0gKgoudoPHiHRIuhAXa8MMByoLr
         bS/fMpiZ9uxKK0oj9SG5bGVBQOtpgsaJffm6EaHBuW98XA0rb7PLZ8ZJtKtKn56h/iK7
         CpH5A7E5ZqB2HG3Qtgp2YPuQ/l9ENrtJnyMDU0TMuqxk0W8/QERSjn06WoGnNz8sSvnh
         8WOc+sShRmNusE7378FxayJsQoBWholP+aRP/U5rk1qUvujd3QjxxRoavMQD8KCQR/QP
         oK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734946997; x=1735551797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyzxI6H4ZAISLyWZ1lhQ49SW3wSD1SDR6GIh5AHA3wQ=;
        b=LfxTsnHv4uFUl2JKbCkruK23IPtd/QCEfnvynxbNlZEEdeXglAAZVsr8ZwTv5pCbSp
         qLN2u6LNhjRC75IdUxtD0ccu5pUiAe6EEb7a8lHLfaxidX8h4vKLA3qIOxNvtpjicZ5K
         v0eAjtIJzy8f0p33DS1DMNzPk549pbrvO59LKklGyjS42ydk+vBfHVZMCiUuoX31F8t5
         2PQghzr26QpbDWQHbU8dW4Gri43kpwt7hNMPppEuf+VGe+DEBO99+X7epHqHlc0Lppfy
         qw8HNbt0HL/deKM6KbIz6lfPPK/Mwb2i5cH4QMYBjtENt27NFlMb4Z+qh4GUTLxle2Lh
         QkEg==
X-Forwarded-Encrypted: i=1; AJvYcCVgODA/r2wg1Rb7V+7rMzAG5q9/LcaLcN427NZcV+bBu/YrUVFVI4OYhaFIxTjV9R1EqnF2cOTs+rYjSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx385xxh30eJoVF+rR0h3tbGb9/ORhID0CH50J3VZ8ya2hB4aK+
	oCUKbWpieMq3218lpB8tiRxA79AwvSoMhQ4i8WZXUbYU45iWe8gZQTYWxTryeJA=
X-Gm-Gg: ASbGncuoqu3ezt8GRxgxY3BKxotErta3eNvYBFMc2Ft+me9B0xovU+Fp02C5AEPZHL9
	5KzioNdERsL6/q5xFRz8UDVdCVGme/zZH+NJIJNN0/J51yY/ppyFm2ynNJZYRY467FsUGgzfegc
	PKdqt0xRKgnhMZ9mGEt9APPareNhhT8V/bbE617XDeplJT5eyTO2YJRAxJtDVCTYhHp8SnwKvF1
	49VXB/bkfMC41qgUC4C4mIlXZiPMWov4aNqQlYJiMo+cZG1KRa+sd41NeCHfkfLA5+i2trD5eSm
	tkRuLLnjAxLMfU9IHORWpQ==
X-Google-Smtp-Source: AGHT+IETS5CqVMOZwuklYBKyw2d6q7hBKdfBjuJ9ZQ+tZcvMnTE5pZk49SgpvcM01OaAXbZV7hq4vg==
X-Received: by 2002:a05:6a21:6da9:b0:1db:e338:ab0a with SMTP id adf61e73a8af0-1e5e0447f5bmr22664720637.8.1734946996090;
        Mon, 23 Dec 2024 01:43:16 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:43:15 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 01/17] Revert "mm: pgtable: make ptlock be freed by RCU"
Date: Mon, 23 Dec 2024 17:40:47 +0800
Message-Id: <b59adb960b2075822a6e57efc7a52e7eb7780068.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_014318_577428_8419E1AF 
X-CRM114-Status: GOOD (  11.05  )
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
