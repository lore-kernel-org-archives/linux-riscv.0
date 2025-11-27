Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02962CFD2F6
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2gdAev2TmUvnQIaSdG3XTyfWE6nvneuvgRsRNQBFVY=; b=20JYC81EB6bUvG
	6aaD4ouCYt0M+ji6zwYcKBdqSOYbTUwcQAbdGRmyxiJKkkA2GONpahPGLxTVOdLbC2NCMvR37mord
	Wl72X6nfhq1qbL7CYRdX0ZsGawKlhEAkxFXz8ck9UUx7vCmWHvn8792tgBWUw2gPgfIDiRoB7tqOK
	EWfnHmMvm6GA/ncyMo9aP2OZ7fM6DiQ7tvpOAzVaUZmXGuKye4MkP179YFRSLTOCXveVjP47eFVqD
	R4/2KbWqSoQqfs/ij36yK5M2SRjlqrGsjC6lDpRw9l9JVb70yDb/2eLSSfOEyIWXXphib1xtLKdJW
	nAuP2FtfEg7IkGwLvb5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcj1-0000000GkJz-0edf;
	Thu, 27 Nov 2025 14:11:59 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOciz-0000000GkJ9-1MIl
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 14:11:58 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3438d4ae152so1013767a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 06:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764252716; x=1764857516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bT1DoFK44/mxXPszG1k06ulWEZ0r0zvum0ccrRfuy/8=;
        b=lHfwE90fyUrjCslDlElDgoOPv3gsvDgJJLZN58xrhSak6vOt18ev5pMNO09gMAKeyR
         bITJ+KkpA2ihori87mkQu1TS1oqHwbJRuT9IdAedwWx29fq09HgjAJOo7Gd6SBVuaF2B
         9U/wOTvBYLa6KI3apMPO4GB8GSY5fwCmWnloqpukq7Z86RqH/UKTzOwrQeuVzJfk4kfI
         QvsRjMXSZCNdZtK9NUMJr9izJMzMwP1NYlFZ8MT5g6brGObhTUZuGveZ8S9FOrfHNCw9
         3WYRjPMHistjPv7K2L+bVGDzL/1MUa0mkH990zIX0UslQ++UaEbyPVFiUkzsnJe0lcnn
         X9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252716; x=1764857516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bT1DoFK44/mxXPszG1k06ulWEZ0r0zvum0ccrRfuy/8=;
        b=qGin1dBmo7ETgP+J7V9Zyll35ISnFSXm675NdxCklX5eHdGeAhxRlXFntxXdUrnJqA
         M8mJFwnMArggZjoXbPLke7617zAFFjqe7zlpYUqLXmbljEBTgEw8+/9W1K/Wu8Y1mzmf
         8lk1y7MRavBmWu1YUp//JrJxFpAUhEgNGh76BI+3BR1nuIJoJ5c36VuNsBl3HebBh0mo
         XVz4OOwB1W4Eyd8Vre1NpNigPb4ow4YUx5fOe3/Ydpp/f7jRqEN681IVRtmMBVAqoSg9
         AweyrUquA2mP7vmkUzb8sDB/iT2jC8DKP0vaqib2NDLmeYt2IN6mKUVXW9WtLDmkBa/V
         jVEg==
X-Gm-Message-State: AOJu0YxtZuls/QPTfyfdCbc1W3EnUnQtGb+bWU/QPC96od4guIGgW5O4
	FbDrjMcxXk3lo0TJVlZsADof2ckid8nORdRm4QSZRKmBuRDuwfATdsNf+FbpsCBtA9U=
X-Gm-Gg: ASbGncsjfvq9/voh6jQ1rVzfsVyL5N2yl8dUZRSXLTXAlD1tgw1nTgrvH1zUjoM28+1
	47JMthmiQ+MLX9u+cEwQY/Bgt7rWMtGJqQ2En0VvJlFE19qxU41rasGlClI0iANVkhxOKDIbyyV
	vz6+qZYMpIXO2vLuQK2lM9g3N7Rs1zTzSJScKi6OQV2IOS1ELwzp6N63u6hOrXmUrLZWASETdaN
	rtDz4iRZ90P1urJLev/eevKWDItyBS6arCX2LyOd/lRZU7/xKSyXaWqjOQrpXMq43n4lF4iwN6n
	P+57ZvFBA5ydCcDlD0F4aat0T5HTBcII1U4EcLJ62Z0yUhkQTc0ZN/pfasG6wkA3mQGFu9XUYpU
	Ov5tnrGrmrqKprdlg90FjJ+50Ad+i3PDLHAGxRRx3yvgXsZbMTiiFTvwNnepE4AbAlNHTMOg3Pm
	scx61Sy/RPr+eNvM4onRoALzrfqZ9ooG/WIE/fLxOaZsDX07U3ibP3NVvs8nDDw/mz1wNJgls/F
	VUrQdP32Xyb
X-Google-Smtp-Source: AGHT+IGHWS9mtIo18ykGEbjce9y2+tGQtCuaDp2x5Akdhl4bvcW7U6KnSKpb0r7Pzb23BFyTlkH5Aw==
X-Received: by 2002:a17:90b:2f4b:b0:341:8bda:d0ae with SMTP id 98e67ed59e1d1-34733f2de45mr22829266a91.20.1764252716195;
        Thu, 27 Nov 2025 06:11:56 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b7341d2sm2030249a91.11.2025.11.27.06.11.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 06:11:55 -0800 (PST)
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
Subject: [RFC PATCH v2 3/9] riscv: mm: Grab mm_count to avoid mm getting released
Date: Thu, 27 Nov 2025 22:11:11 +0800
Message-ID: <20251127141117.87420-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251127141117.87420-1-luxu.kernel@bytedance.com>
References: <20251127141117.87420-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_061157_368127_1EA5D702 
X-CRM114-Status: GOOD (  12.24  )
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

We maintain an array of mm_structs whose ASIDs are active on the current
CPU. To avoid these mm_structs getting released, we grab their mm_count
before loaded them into the array. And drop their mm_count via tasklet
when they are evicted out of the array.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/mmu.h |  4 +++
 arch/riscv/mm/tlbflush.c     | 47 ++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index cf8e6eac77d52..913fa535b3d19 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -30,6 +30,10 @@ typedef struct {
 #ifdef CONFIG_RISCV_ISA_SUPM
 	u8 pmlen;
 #endif
+#ifdef CONFIG_RISCV_LAZY_TLB_FLUSH
+	atomic_t lazy_tlb_cnt;
+	void *next;
+#endif
 } mm_context_t;
 
 /* Lock the pointer masking mode because this mm is multithreaded */
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 0b1c21c7aafb8..4b2ce06cbe6bd 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -104,12 +104,57 @@ struct flush_tlb_range_data {
 };
 
 #ifdef CONFIG_RISCV_LAZY_TLB_FLUSH
+
 DEFINE_PER_CPU_SHARED_ALIGNED(struct tlb_info, tlbinfo) = {
 	.rwlock = __RW_LOCK_UNLOCKED(tlbinfo.rwlock),
 	.active_mm = NULL,
 	.next_gen = 1,
 	.contexts = { { NULL, 0, }, },
 };
+
+static DEFINE_PER_CPU(mm_context_t *, mmdrop_victims);
+
+static void mmdrop_lazy_mms(struct tasklet_struct *tasklet)
+{
+	mm_context_t *victim = xchg_relaxed(this_cpu_ptr(&mmdrop_victims), NULL);
+	struct mm_struct *mm = NULL;
+
+	while (victim) {
+		mm = container_of(victim, struct mm_struct, context);
+		while (atomic_dec_return_relaxed(&victim->lazy_tlb_cnt) != 0)
+			mmdrop_lazy_tlb(mm);
+		victim = victim->next;
+	}
+}
+
+static DEFINE_PER_CPU(struct tasklet_struct, mmdrop_tasklets) = {
+	.count = ATOMIC_INIT(0),
+	.callback = mmdrop_lazy_mms,
+	.use_callback = true,
+};
+
+static inline void mmgrab_lazy_mm(struct mm_struct *mm)
+{
+	mmgrab_lazy_tlb(mm);
+	atomic_inc(&mm->context.lazy_tlb_cnt);
+}
+
+static inline void mmdrop_lazy_mm(struct mm_struct *mm)
+{
+	mm_context_t **head, *list, *context = &mm->context;
+
+	if (atomic_inc_return_relaxed(&context->lazy_tlb_cnt) == 1) {
+		head = this_cpu_ptr(&mmdrop_victims);
+
+		do {
+			list = *head;
+			context->next = list;
+		} while (cmpxchg_relaxed(head, list, context) != list);
+
+		tasklet_schedule(this_cpu_ptr(&mmdrop_tasklets));
+	}
+}
+
 #endif /* CONFIG_RISCV_LAZY_TLB_FLUSH */
 
 static void __ipi_flush_tlb_range_asid(void *info)
@@ -292,6 +337,7 @@ void local_load_tlb_mm(struct mm_struct *mm)
 	info->active_mm = mm;
 
 	if (contexts[pos].mm != mm) {
+		mmgrab_lazy_mm(mm);
 		victim = contexts[pos].mm;
 		contexts[pos].mm = mm;
 	}
@@ -302,6 +348,7 @@ void local_load_tlb_mm(struct mm_struct *mm)
 	if (victim) {
 		cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(victim));
 		local_flush_tlb_all_asid(get_mm_asid(victim));
+		mmdrop_lazy_mm(victim);
 	}
 }
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
