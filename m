Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB32D111A8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 14:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g80VuDwpx6ZbjjrsEQHrbFzIB5uvropIegmbIs6R3zo=; b=zHwyK0IjcUFUaT
	nkWghXgayGDdN8MvhX15g0f8JJqKLlTFkOOWmUWc6fKJ2t8pucowb0ga7Ac2xWbetkkKKdsOpbQZZ
	3eoq9OWQXUfkEjKWNi89rICUUmdwtRQU4MLZgP0DlIN/6Ka381J6rm1kacc1HLqNlohXuRwsge4x2
	UNUinHiS1HWnnq7iZXskCyGjNN0LKMsyurmJSU521rChvVMMUCmXq1SJMpsjn4auSq90yQgUFQpq2
	CWhR9dA4oOXO+hc9mIrJRkeeGq5ZgE1IGoAwXCffYR1ULJgXDhducr1Fc+o27nUGU6OTlsAf1SSco
	2caDNruwdvpIOosFRTnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOciv-0000000GkHp-3aQr;
	Thu, 27 Nov 2025 14:11:53 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcit-0000000GkGV-0bGM
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 14:11:52 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3438231df5fso1141769a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 06:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764252710; x=1764857510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGHgnOknc2HR28gygrywMGZEYzdqi18gD0LqvxY1V9E=;
        b=gxoV7ala3PPD2T1N3Y72939Y6tFgR3G88aESakFygtJwRk4XcTmNSbO13mEHvWQgZT
         LBRh6UHMy6YPEnNS2ImmwWxfimVyE5514cczmCBuIfGo/ARkkc42praF38+Y1Wuh4IFT
         9Xz5Y3Wry6yKKpAVaX2JnPnsKm4zNPwduhwrtQM/pbT3WYVku+hgmfTt/Y8GkGQSw2bc
         jH7t7gzP+Zj5ZUXgooxPgVLDu6mxO1P/SbJw5tD9GbXAI0AxbBFCdhPI7BPi0iK1pizf
         zH9oAZdeYWKQ7DXLgpgxnZEKrky5335r9s999NHo54/8qOUXE1OCIrpgBXAnPhAeYXT+
         yRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252710; x=1764857510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGHgnOknc2HR28gygrywMGZEYzdqi18gD0LqvxY1V9E=;
        b=WtIZxkPzUyWpEsP92t1XleVuFSOCdOzLDNiIqe4rTklHjTSq31c9Id2xQFTQelROqa
         tAcZEFZ8f406hMZ/6rRv5CPZ+pXn6RBLkHwipbAh5Izz4tWLW0dODRVqnp5jCxh0WVdz
         Bp5SIagXi2XSy63IAWPU+UOBr+mp0PVM2pEQ+FS+F6/cbMFELotG8d1WhaTzZ2hJjtWS
         Gdrpb4CbDcRB6unPkfaFGdPHQFbWpDFxh+2y06m0NCsQrjkX5R33wOqAXfP28n5eClYx
         wWTti0MPhPnQ//8fqIp+li/FVVdp65q2qiHH9kilmxomJnFtDsQpsyeNWAinafM/H4Md
         GDpA==
X-Gm-Message-State: AOJu0YzNEjcMYM3IRxfM6WqVsgaVmOgDu5QDyFHaUguQg2Dw9BpoALlF
	D4+wGPPTkLlCWptLd+4rtjF+BpJNxyErphWQSul0VmRmPFuVrgQWlDY9yiSpTVCy8U0=
X-Gm-Gg: ASbGnctkJsfX688gvKvkgPQFJ807+q7DLax4+yENh12esHGXv0csYsagufdK5jBXWkd
	C4YZnWIPEOdYNOqxslnSqHqZgRFwwSIVxcNNdspbIsaKurFtlfUb/vaYclHClKIB/ybtZG5UR1m
	V5F5NNnhP/f+29wT7NUfRm6hcuJCRyGLYvgjFApMDbhyjtK8tm2pHP2aMnUQUwnuTnmh6fb00b6
	B65GDKW6XZNBZXOndDujliBj/y43hZM76tknhGiEN85jaWD7WQbfTqvYv6b86zgmOIf26Wg/HbS
	xaetjDgzRwieg5nlo5vwAmv5xTk8eErmTtXxoF8J4Fix+BBEoadJpkbAphna5gEdCNVxmD10Fvg
	yf8Q+mGHkdTCzzhjJ/jk+H0D4TQLhvgszXTVhJTuhyZPFr3HxfrWW0EldSjimkl9r6ukSxBa3W/
	aA/bNgQisG2e5n3eCGkO5AEL8lhi4z7ONUoWAxL3Qth0hVaihzpwdEyf1jeEfWP4F/wrkF7UUCL
	Q==
X-Google-Smtp-Source: AGHT+IH9shCFmiY257H7nfVJqHK2TfMQ1cqSxBQ+VJIOMrKykl/Xamof7TK0iwdrGZLERz9FgKIyJw==
X-Received: by 2002:a17:90b:4c8f:b0:341:133:e13d with SMTP id 98e67ed59e1d1-3475ebd2d92mr11210465a91.5.1764252710205;
        Thu, 27 Nov 2025 06:11:50 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b7341d2sm2030249a91.11.2025.11.27.06.11.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 06:11:49 -0800 (PST)
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
Subject: [RFC PATCH v2 2/9] riscv: mm: Apply a threshold to the number of active ASIDs on each CPU
Date: Thu, 27 Nov 2025 22:11:10 +0800
Message-ID: <20251127141117.87420-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251127141117.87420-1-luxu.kernel@bytedance.com>
References: <20251127141117.87420-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_061151_190363_BE53D615 
X-CRM114-Status: GOOD (  16.46  )
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

Since each CPU has limited TLB entries, there exist limited active ASIDs
in each CPU's TLB at the same time. Thus we apply a threshold here. When
a mm_struct is loaded, we mark its ASID as active. If the number of
active ASIDs exceeds the threshold, we evict the mm_struct that has not
been used for the longest time, flush its TLB entries, mark its ASID
inactive, and clear current CPU in its mm_cpumask.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/tlbflush.h | 27 +++++++++++++
 arch/riscv/mm/context.c           |  1 +
 arch/riscv/mm/tlbflush.c          | 66 +++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index eed0abc405143..3f83fd5ef36db 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -66,6 +66,33 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
 
 extern unsigned long tlb_flush_all_threshold;
+
+#ifdef CONFIG_RISCV_LAZY_TLB_FLUSH
+
+#define MAX_LOADED_MM					6
+
+struct tlb_context {
+	struct mm_struct *mm;
+	unsigned int gen;
+};
+
+struct tlb_info {
+	rwlock_t rwlock;
+	struct mm_struct *active_mm;
+	unsigned int next_gen;
+	struct tlb_context contexts[MAX_LOADED_MM];
+};
+
+DECLARE_PER_CPU_SHARED_ALIGNED(struct tlb_info, tlbinfo);
+
+void local_load_tlb_mm(struct mm_struct *mm);
+
+#else /* CONFIG_RISCV_LAZY_TLB_FLUSH */
+
+static inline void local_load_tlb_mm(struct mm_struct *mm) {}
+
+#endif /* CONFIG_RISCV_LAZY_TLB_FLUSH */
+
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 55c20ad1f7444..a7cf36ad34678 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -217,6 +217,7 @@ static inline void set_mm(struct mm_struct *prev,
 	 */
 	cpumask_set_cpu(cpu, mm_cpumask(next));
 	if (static_branch_unlikely(&use_asid_allocator)) {
+		local_load_tlb_mm(next);
 		set_mm_asid(next, cpu);
 	} else {
 		cpumask_clear_cpu(cpu, mm_cpumask(prev));
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 8404530ec00f9..0b1c21c7aafb8 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -103,6 +103,15 @@ struct flush_tlb_range_data {
 	unsigned long stride;
 };
 
+#ifdef CONFIG_RISCV_LAZY_TLB_FLUSH
+DEFINE_PER_CPU_SHARED_ALIGNED(struct tlb_info, tlbinfo) = {
+	.rwlock = __RW_LOCK_UNLOCKED(tlbinfo.rwlock),
+	.active_mm = NULL,
+	.next_gen = 1,
+	.contexts = { { NULL, 0, }, },
+};
+#endif /* CONFIG_RISCV_LAZY_TLB_FLUSH */
+
 static void __ipi_flush_tlb_range_asid(void *info)
 {
 	struct flush_tlb_range_data *d = info;
@@ -240,3 +249,60 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 			  0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
 	cpumask_clear(&batch->cpumask);
 }
+
+#ifdef CONFIG_RISCV_LAZY_TLB_FLUSH
+
+static inline unsigned int new_tlb_gen(struct tlb_info *info)
+{
+	unsigned int gen = info->next_gen++;
+	unsigned int i;
+
+	if (unlikely(!info->next_gen)) {
+		for (i = 0; i < MAX_LOADED_MM; i++) {
+			if (info->contexts[i].gen)
+				info->contexts[i].gen = 1;
+		}
+		info->next_gen = 1;
+		gen = info->next_gen++;
+	}
+
+	return gen;
+}
+
+void local_load_tlb_mm(struct mm_struct *mm)
+{
+	struct tlb_info *info = this_cpu_ptr(&tlbinfo);
+	struct tlb_context *contexts = info->contexts;
+	struct mm_struct *victim = NULL;
+	unsigned int i, pos = 0, min = UINT_MAX;
+
+	for (i = 0; i < MAX_LOADED_MM; i++) {
+		if (contexts[i].mm == mm) {
+			pos = i;
+			break;
+		}
+		if (min > contexts[i].gen) {
+			min = contexts[i].gen;
+			pos = i;
+		}
+	}
+
+	write_lock(&info->rwlock);
+
+	info->active_mm = mm;
+
+	if (contexts[pos].mm != mm) {
+		victim = contexts[pos].mm;
+		contexts[pos].mm = mm;
+	}
+	contexts[pos].gen = new_tlb_gen(info);
+
+	write_unlock(&info->rwlock);
+
+	if (victim) {
+		cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(victim));
+		local_flush_tlb_all_asid(get_mm_asid(victim));
+	}
+}
+
+#endif /* CONFIG_RISCV_LAZY_TLB_FLUSH */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
