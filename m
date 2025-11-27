Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000BED11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 14:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVxo7KseTTbyrMeLwiatjDUsICALr7UveHSE6EqwL78=; b=2IIgnrczW5/hsz
	6JOkd480fFk8ThkeeJDLZqgNNq0XkANu5pp/eAmRchj2yNcUfYtLDCzz48jJD52qnymI/oU69xNm6
	R0elfb7yLiE6RGUbKsorWLvRjjAJi7OI33uDmbHUMU/XOwqd661D/66njg8VHi+QhKU4z+H2An7y5
	QBLOUsXgNEmPc0jaq/zbNkrN47e6jOotov2EwKQT0E/C9afQ7c/R1ELUTSZ/m7PI6agQFJ9EnAbfM
	MKkbz9ROMVu97cVyDlQPjMUh2hozquMNCs3zR06IQsB8kc8C5Lgu6LYCJoaiQwGk6EdQPozwpOIhA
	8ctJwYijM+cqUV6SFYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcjV-0000000GkYl-3N5t;
	Thu, 27 Nov 2025 14:12:29 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcjS-0000000GkWy-3SFt
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 14:12:28 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3436a97f092so1088065a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 06:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764252746; x=1764857546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCE7BFaxTmXT5gX1mJT6mv3jSbzO4IVr04XlUFHKTqA=;
        b=jGTb4eKBldYDD3hzEgq9X2tknbqp6nmkKhX3ybqwd1QMf9wEp6g22iOogDcgl7dT7n
         iBkrvLAeUyMemK5fg5C1AzPtpic1kKNS0o24NYPR5aVyz8UuKhyoWJxoccja8iF6pA1N
         hrKhbBf6AYom5PrRF/x58E/CEBIcMiE67v3P5NWX5rLNiMkGe5PIm07+Z10cyL7r967V
         jLphurCQo5d4FaOqs77dx+89cP+K90NN6vUDw4f5xDG5FxCqoX46McbCyTqFAFqSbgYr
         Cjuzdo9V4woWsc3eNghwovjawtn4S9jMbQxUALnkSH/FEQ89vJx354qbNPSuoffcm9vh
         f+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252746; x=1764857546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kCE7BFaxTmXT5gX1mJT6mv3jSbzO4IVr04XlUFHKTqA=;
        b=uJgzSC+hMqEgXke5DM302j+cUhiVBhy6JlQg7RkgbtckLkpGYW9goCOQhqvTCBne60
         9A0szOvmK3LwXrRkLZIJFeAjCHCqjvv+5jz4vbWTeji5PaR5HS810dAI4chn4ZdjrySz
         zE1FVQGWReRO0dbEnL0+8Zvli7s0ASWmVBgt08aRdGadHQxdHTqEqSDu359hMgN4KXJ/
         bHuVJVsLBF/H2nKdGNjC6iQW24yiF4CAAL5HWOq6Gg1zUlBq/v4lawuFar4x/6JPueng
         SWw1sHtEOslQnXAUHKcWnCScOVcCjalJO6b/5cT1zIqNIXGX1E+rDApLNccQ+0r86Jhp
         yp8Q==
X-Gm-Message-State: AOJu0Yw3dqA1bg4eMG/oKyVhpc11lqDk38liqZbMek0P824l4V3nRhmI
	lxv8HgurtEV9SGhK7pO1i49oE6z4/1PMFeclYSa4CiZmElLLUFDIdQOfdEKk9RvZsVQ=
X-Gm-Gg: ASbGnctxlWOo8pWy/eIPh1P5D6/57qL3xU1viWd74g3ETS0b82Bh216BrajEAQXlbtL
	5Ph5y12wRurmcOK08YyC2DwWJI4VNm1bQSDKEYO/ZOH3ZgLEB3R/LadryIi7RmSt+dj0rfeU8Lv
	a4btFelNaAPGFPRCYS8uIEOa5aGCmhgbmrQlheOKHop8ONl71TtcPEijHCSJTVPmFJtVHjSTWXr
	gsCftQhnoqBRplKcIBZaYEtggEJSKl6bW1Nl2YOVM5a6BZcI4qDtTvEdimLbLK9f+DOjyNK0DeQ
	4oKtF0Vqt9AXQ0Q0JvnYzJYtRnWF4N1TQW3JtzUdW08XuQld/cQ+AFTrY6q0woOBDQtzWpgqiIU
	9O3Rn4rXM8+mlCAhKdTMOXt+19mqLMlpMvTkzFuOwftj3cZvxHEbngP4oacZtER+2e1Fvim4H1r
	/AlX0rNKRjjZcbCdoiJE0r5U6llWjAUSom0PxzcdRkRPTn2a7qF3lLs5OCH3eWikFMTi1CdnADD
	kAMB8FD+hNs
X-Google-Smtp-Source: AGHT+IHaJbhR6uoA8AsgyvN1rZkRokZKcV5EN92G/Fd+krItmdJONN0XD0mHkXfOugo46//aXXPl7A==
X-Received: by 2002:a17:90b:1a84:b0:32b:65e6:ec48 with SMTP id 98e67ed59e1d1-3475ebd2f41mr10628835a91.8.1764252745954;
        Thu, 27 Nov 2025 06:12:25 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b7341d2sm2030249a91.11.2025.11.27.06.12.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 06:12:25 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	apatel@ventanamicro.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 5/9] riscv: mm: Introduce arch_do_shoot_lazy_tlb
Date: Thu, 27 Nov 2025 22:11:13 +0800
Message-ID: <20251127141117.87420-6-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251127141117.87420-1-luxu.kernel@bytedance.com>
References: <20251127141117.87420-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_061226_873534_7BD40784 
X-CRM114-Status: GOOD (  14.22  )
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

When an active_mm is shot down, we switch it to the init_mm, evict it
out of percpu active mm array.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/mmu_context.h |  5 ++++
 arch/riscv/include/asm/tlbflush.h    | 11 +++++++++
 arch/riscv/mm/context.c              | 19 ++++++++++++++++
 arch/riscv/mm/tlbflush.c             | 34 ++++++++++++++++++++++++----
 4 files changed, 64 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 8c4bc49a3a0f5..bc73cc3262ae6 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -16,6 +16,11 @@
 void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	struct task_struct *task);
 
+#ifdef CONFIG_RISCV_LAZY_TLB_FLUSH
+#define arch_do_shoot_lazy_tlb	arch_do_shoot_lazy_tlb
+void arch_do_shoot_lazy_tlb(void *arg);
+#endif
+
 #define activate_mm activate_mm
 static inline void activate_mm(struct mm_struct *prev,
 			       struct mm_struct *next)
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 3f83fd5ef36db..e7365a53265a6 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -15,6 +15,11 @@
 #define FLUSH_TLB_NO_ASID       ((unsigned long)-1)
 
 #ifdef CONFIG_MMU
+static inline unsigned long get_mm_asid(struct mm_struct *mm)
+{
+	return mm ? cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
+}
+
 static inline void local_flush_tlb_all(void)
 {
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
@@ -86,11 +91,17 @@ struct tlb_info {
 DECLARE_PER_CPU_SHARED_ALIGNED(struct tlb_info, tlbinfo);
 
 void local_load_tlb_mm(struct mm_struct *mm);
+void local_flush_tlb_mm(struct mm_struct *mm);
 
 #else /* CONFIG_RISCV_LAZY_TLB_FLUSH */
 
 static inline void local_load_tlb_mm(struct mm_struct *mm) {}
 
+static inline void local_flush_tlb_mm(struct mm_struct *mm)
+{
+	local_flush_tlb_all_asid(get_mm_asid(mm));
+}
+
 #endif /* CONFIG_RISCV_LAZY_TLB_FLUSH */
 
 #else /* CONFIG_MMU */
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index a7cf36ad34678..3335080e5f720 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -274,6 +274,25 @@ static int __init asids_init(void)
 	return 0;
 }
 early_initcall(asids_init);
+
+#ifdef CONFIG_RISCV_LAZY_TLB_FLUSH
+void arch_do_shoot_lazy_tlb(void *arg)
+{
+	struct mm_struct *mm = arg;
+
+	if (current->active_mm == mm) {
+		WARN_ON_ONCE(current->mm);
+		current->active_mm = &init_mm;
+		switch_mm(mm, &init_mm, current);
+	}
+
+	if (!static_branch_unlikely(&use_asid_allocator) || !mm)
+		return;
+
+	local_flush_tlb_mm(mm);
+}
+#endif /* CONFIG_RISCV_LAZY_TLB_FLUSH */
+
 #else
 static inline void set_mm(struct mm_struct *prev,
 			  struct mm_struct *next, unsigned int cpu)
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 4b2ce06cbe6bd..a47bacf5801ab 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -164,11 +164,6 @@ static void __ipi_flush_tlb_range_asid(void *info)
 	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
 }
 
-static inline unsigned long get_mm_asid(struct mm_struct *mm)
-{
-	return mm ? cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
-}
-
 static void __flush_tlb_range(struct mm_struct *mm,
 			      const struct cpumask *cmask,
 			      unsigned long start, unsigned long size,
@@ -352,4 +347,33 @@ void local_load_tlb_mm(struct mm_struct *mm)
 	}
 }
 
+void local_flush_tlb_mm(struct mm_struct *mm)
+{
+	struct tlb_info *info = this_cpu_ptr(&tlbinfo);
+	struct tlb_context *contexts = info->contexts;
+	unsigned long asid = get_mm_asid(mm);
+	unsigned int i;
+
+	if (!mm || mm == info->active_mm) {
+		local_flush_tlb_all_asid(asid);
+		return;
+	}
+
+	for (i = 0; i < MAX_LOADED_MM; i++) {
+		if (contexts[i].mm != mm)
+			continue;
+
+		write_lock(&info->rwlock);
+		contexts[i].mm = NULL;
+		contexts[i].gen = 0;
+		write_unlock(&info->rwlock);
+
+		cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(mm));
+		mmdrop_lazy_mm(mm);
+		break;
+	}
+
+	local_flush_tlb_all_asid(asid);
+}
+
 #endif /* CONFIG_RISCV_LAZY_TLB_FLUSH */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
