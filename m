Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD551D111A8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 14:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=awV/u7CfKFzhPh0C/Z+3jGatSgxfKv77XhV977WQeuc=; b=IjKBGv0IacqoVq
	ZGfy9P0kiczHhIbjUC39mv+efuYAxvQJ3zk/uhOOQZ94eZgcyAcISd78YZKt6Hhh/zqkYyHG52Pl0
	VNr6BgQVdXc+EjL5aJ8g1SxGSW8Vbh6G9amWlmLrLRqgqVzW6Da4UrlEi59rIoPtJG/9TpodiK8rS
	5oNH3ZE3vwiAvTJt9pDB6CBgH1WemXC1al8C0S9suueRrQOMz9aevJ/v7l07fgoZ7Qx+DpIt3EGmF
	FpoMj5YsaExz2/3f4qYYTexLzS9kB0bmtmxHQ1rzz4qwFkJwEIQbZXVv6FKfF4qeeNkBU9+VCKyxD
	Gv6OpI+ZdYvTu+oW0u2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcjg-0000000Gken-0UoQ;
	Thu, 27 Nov 2025 14:12:40 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcjd-0000000GkdV-3wiO
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 14:12:39 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-794e300e20dso1065439b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 06:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764252757; x=1764857557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zl77PqgzhSQnbli+DMk7tCeC4XrJE4OWFtNvT9IO89M=;
        b=c/1loNofapeW3mUM4S5Uva1fjZhj8M6XrrYbnZrjS/y5w5g1dQJwjEE+1xGrrDBh49
         iYwMGolM1oas/YfWy1wyj2Mvro7whVTYpedlHf6zHO5aOccuVN18W12LDgx9dY2vEh8X
         wKrG7Epo+gfECl6JKwSC+wSPWmBDTLK+5imgygDpKfQeniH2lTIpwvhogffOjXVLt7I2
         xzae1Opq0BaQ/aeCOkrQVdAbpXn7pG3TfEIyrXA9ndDHv2VjkQHjwRVyg0GC8e2F9LHx
         dRjhWy/DlOtOyUEV2W2paYf+9hNYV4Nx0NOw6hi1iqqGKuFcBsztg6hPgKCTtXb2j4FS
         rOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252757; x=1764857557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zl77PqgzhSQnbli+DMk7tCeC4XrJE4OWFtNvT9IO89M=;
        b=sk+Y2l2eqPfRauqAWvvVL+7PIgDoqfEPnYKYolXpRIcYw2OtnCvapqKmXwGpvOdhn/
         FiPJi3MCCkRhudTqvP4PNENuHxsXM06tpS5xJ9RYItZTeKdWCA884xW1oA06ETQBtUc7
         TAZoeG0zJMmfHkbPglVkkz+QMar/NRvdwkTpsyaHyDt8LKYF/YgT/krXA4v+aIf5X3iT
         1YFCXdUnyzcvPQRk+s+Xt9qcuzbyYugLyHlwG95ENp0C+HF9jnIw5FJ/GOOcFo88k3AP
         +EDOrx259ZrX3u5nvEXKK7mpdIdFuwE/lb60d2zk2wDCwmNzo6ds47CeCrOghGYyPQNk
         oWjA==
X-Gm-Message-State: AOJu0Yw133jGfABAowmvtFsSU9nErDjvk/OZf7O8HYE8jDEgHGOpTgrb
	kmnM03kxb53usIDOATYlJBvgMSO5H/XX9iLuLkeRSNLUhj5CiUl8XRXbFLPBrdiQ8cU=
X-Gm-Gg: ASbGncs44hweX+xbHjqv2tVvE7G3o2fDyFxXwZSioT1ZQn65Guh4kvrB57leB+pMjw4
	ja9Dc5P3bUkZ4qRtgbfnTDMiYngUeQQl7WkSGdtSgHNqIKpNHv898o5JzDkuonV2ULFzwG0Ee/r
	VbxUOFDjoCpHpW7fulKyJ+IG/FtwWNYTGsw5XWSznzXg4JdarxHLl85LFOhwuUFEwq/dzg+bSXC
	lyuylicInYgzrtejU5Zm9ucOwUWOaFPGAO34iMUB51HrK2XUidr8AciuI+pMvGKh1GwX+BmDkwK
	6Wa0Ebw2Z8TxDwOWI/C6BqFXX9QM+6aYwOIrs2caOxYMZ06zwc5lHZoAVPuvbnCLb82bQ6ACttR
	i8xHn4MVqnwekJOJDXak9QeXEwjqT7yAZb6hbHee+kDs03HwVI9KVkHdO9sHYk90D22wSPsOYEX
	E5IQu38NrNoJHwNw4pDlOF8yG8nPwkNaNEclbVFlxq7d2Z3l/Fi/Os2dMgiF+nUtTOZp50lG3Hy
	A==
X-Google-Smtp-Source: AGHT+IFs53VTIZhomsFYAowx9J26TGi3f3ksQWsE5AJKE20aCMEW51a+o1FMLwfvpm4UU6skwP1mVg==
X-Received: by 2002:a17:90b:38ca:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-347331be358mr21956360a91.5.1764252756999;
        Thu, 27 Nov 2025 06:12:36 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b7341d2sm2030249a91.11.2025.11.27.06.12.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 06:12:36 -0800 (PST)
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
Subject: [RFC PATCH v2 6/9] riscv: mm: Introduce percpu TLB Flush queue
Date: Thu, 27 Nov 2025 22:11:14 +0800
Message-ID: <20251127141117.87420-7-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251127141117.87420-1-luxu.kernel@bytedance.com>
References: <20251127141117.87420-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_061237_995179_C3CB3787 
X-CRM114-Status: GOOD (  17.65  )
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

When memory mapping of a mm is modified, instead of sending IPI to all
CPUs recorded in its mm_cpumask, we check whether each target CPU is
using this mm right now. If not, we just store the TLB Flush information
in target CPU's percpu TLB Flush queue, avoiding the IPI.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/tlbflush.h | 19 +++++++++
 arch/riscv/mm/context.c           |  2 +
 arch/riscv/mm/tlbflush.c          | 71 ++++++++++++++++++++++++++++++-
 3 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index e7365a53265a6..c9630267c58cd 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -75,23 +75,40 @@ extern unsigned long tlb_flush_all_threshold;
 #ifdef CONFIG_RISCV_LAZY_TLB_FLUSH
 
 #define MAX_LOADED_MM					6
+#define MAX_TLB_FLUSH_TASK				32
+#define FLUSH_TLB_ALL_ASID				0x1
 
 struct tlb_context {
 	struct mm_struct *mm;
 	unsigned int gen;
+	bool need_flush;
 };
 
+struct tlb_flush_task {
+	unsigned long start;
+	unsigned long size;
+	unsigned long stride;
+};
+
+struct tlb_flush_queue {
+	atomic_t len;
+	unsigned int flag;
+	struct tlb_flush_task tasks[MAX_TLB_FLUSH_TASK];
+} ____cacheline_aligned_in_smp;
+
 struct tlb_info {
 	rwlock_t rwlock;
 	struct mm_struct *active_mm;
 	unsigned int next_gen;
 	struct tlb_context contexts[MAX_LOADED_MM];
+	struct tlb_flush_queue *flush_queues;
 };
 
 DECLARE_PER_CPU_SHARED_ALIGNED(struct tlb_info, tlbinfo);
 
 void local_load_tlb_mm(struct mm_struct *mm);
 void local_flush_tlb_mm(struct mm_struct *mm);
+void __init lazy_tlb_flush_init(void);
 
 #else /* CONFIG_RISCV_LAZY_TLB_FLUSH */
 
@@ -102,6 +119,8 @@ static inline void local_flush_tlb_mm(struct mm_struct *mm)
 	local_flush_tlb_all_asid(get_mm_asid(mm));
 }
 
+static inline void lazy_tlb_flush_init(void) {}
+
 #endif /* CONFIG_RISCV_LAZY_TLB_FLUSH */
 
 #else /* CONFIG_MMU */
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 3335080e5f720..c381c4ed46bfb 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -263,6 +263,8 @@ static int __init asids_init(void)
 
 		__set_bit(0, context_asid_map);
 
+		lazy_tlb_flush_init();
+
 		static_branch_enable(&use_asid_allocator);
 
 		pr_info("ASID allocator using %lu bits (%lu entries)\n",
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index a47bacf5801ab..b5a2d9874d62b 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -97,6 +97,7 @@ void flush_tlb_all(void)
 }
 
 struct flush_tlb_range_data {
+	struct mm_struct *mm;
 	unsigned long asid;
 	unsigned long start;
 	unsigned long size;
@@ -109,7 +110,8 @@ DEFINE_PER_CPU_SHARED_ALIGNED(struct tlb_info, tlbinfo) = {
 	.rwlock = __RW_LOCK_UNLOCKED(tlbinfo.rwlock),
 	.active_mm = NULL,
 	.next_gen = 1,
-	.contexts = { { NULL, 0, }, },
+	.contexts = { { NULL, 0, false, }, },
+	.next_gen = 0,
 };
 
 static DEFINE_PER_CPU(mm_context_t *, mmdrop_victims);
@@ -155,6 +157,47 @@ static inline void mmdrop_lazy_mm(struct mm_struct *mm)
 	}
 }
 
+static bool should_ipi_flush(int cpu, void *data)
+{
+	struct tlb_info *info = per_cpu_ptr(&tlbinfo, cpu);
+	struct tlb_context *contexts = info->contexts;
+	struct tlb_flush_queue *queue = NULL;
+	struct flush_tlb_range_data *ftd = data;
+	unsigned int i, index;
+	unsigned long flags;
+
+	if (info->active_mm == ftd->mm)
+		return true;
+
+	read_lock_irqsave(&info->rwlock, flags);
+
+	if (info->active_mm == ftd->mm) {
+		read_unlock_irqrestore(&info->rwlock, flags);
+		return true;
+	}
+
+	for (i = 0; i < MAX_LOADED_MM; i++) {
+		if (contexts[i].mm != ftd->mm)
+			continue;
+
+		queue = &info->flush_queues[i];
+		index = atomic_fetch_add_unless(&queue->len, 1, MAX_TLB_FLUSH_TASK);
+		if (index < MAX_TLB_FLUSH_TASK) {
+			queue->tasks[index].start = ftd->start;
+			queue->tasks[index].stride = ftd->stride;
+			queue->tasks[index].size = ftd->size;
+		} else {
+			queue->flag |= FLUSH_TLB_ALL_ASID;
+		}
+		contexts[i].need_flush = true;
+		break;
+	}
+
+	read_unlock_irqrestore(&info->rwlock, flags);
+
+	return false;
+}
+
 #endif /* CONFIG_RISCV_LAZY_TLB_FLUSH */
 
 static void __ipi_flush_tlb_range_asid(void *info)
@@ -185,11 +228,20 @@ static void __flush_tlb_range(struct mm_struct *mm,
 	} else {
 		struct flush_tlb_range_data ftd;
 
+		ftd.mm = mm;
 		ftd.asid = asid;
 		ftd.start = start;
 		ftd.size = size;
 		ftd.stride = stride;
-		on_each_cpu_mask(cmask, __ipi_flush_tlb_range_asid, &ftd, 1);
+#ifdef CONFIG_RISCV_LAZY_TLB_FLUSH
+		if (static_branch_unlikely(&use_asid_allocator) && mm)
+			on_each_cpu_cond_mask(should_ipi_flush,
+					      __ipi_flush_tlb_range_asid,
+					      &ftd, 1, cmask);
+		else
+#endif
+			on_each_cpu_mask(cmask, __ipi_flush_tlb_range_asid,
+					 &ftd, 1);
 	}
 
 	put_cpu();
@@ -376,4 +428,19 @@ void local_flush_tlb_mm(struct mm_struct *mm)
 	local_flush_tlb_all_asid(asid);
 }
 
+void __init lazy_tlb_flush_init(void)
+{
+	struct tlb_flush_queue *queue;
+	unsigned int cpu, size;
+
+	size = MAX_LOADED_MM * sizeof(struct tlb_flush_queue);
+	for_each_possible_cpu(cpu) {
+		queue = kzalloc_node(size, GFP_KERNEL, cpu_to_node(cpu));
+		if (!queue)
+			panic("Failed to alloc per cpu tlb flush queue\n");
+
+		per_cpu(tlbinfo, cpu).flush_queues = queue;
+	}
+}
+
 #endif /* CONFIG_RISCV_LAZY_TLB_FLUSH */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
