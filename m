Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C536CCF9FC
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gw9GoXYhq5eEeB0KXE/cVKhnWvS+DKlp2bax43r6Xno=; b=MBKtGoQvuP6BuC
	5TCTgqlD79ZpH2YDGkMBY8W2M2ocdN04GT7/TDEGN16Nq1sdrNAjs4oTvP64WbBhUeyHRtGvX2xxK
	W4DF+9VCMSR4f7PsMljUlCIgX3ThweXfQb4Ihvl9TQgsQXgOZv406+dKFgms/4TID2pF0oTEdeayx
	/BNGgaYPTWV5S5NkZJGjFC4c5nKrsHRP7iGb48KcCThQOk2tLGDxsLMBy5Nrf97/k4koZLdmDoDZm
	Oij6yhEdgsyoWflLvwt7tqwb7dPDM0eScY8+GoLyiyIlCgwwc05KqjIx+3Xza7Qjgw4CqmuaFwj+6
	xi5MrhZnUeMhrfv3ulWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET9Y-00000004GHF-3aJs;
	Thu, 30 Oct 2025 13:57:25 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET9V-00000004GEu-1X2t
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 13:57:22 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7a74b13f4f8so48912b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 06:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761832640; x=1762437440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBFEkcQ8xUvhwX9gDA9IWLN2BELZaEr5a/ByZItGkVU=;
        b=TZ2ZnaRo3ZkU02feh5JECE2BvrvnW1jOfu5HKbXavW29RT3K3w5fAtKfwcIm+nqNl8
         1K2QGCnSVDhXb5GD/qSbppZNIm/WrN3J80FJnolKp+bNEeNKhoMVGjWVIVpCDC3piY8i
         ZipRbMQxNMeU+cdwo4JJGu/LqP1RYpm1U8jYgGYqLiedd8bbKPvQrdoitOMbXaCe1kuf
         7152vFxlyBSQmldVBLbNgHDZS7UDCe6dKRQeoZDb1T0AT5592EVa8yLyXD31pm+C7tCD
         f5/QK5jDdnyjqN+q5Z0mp3+U+yhRcrnV0QyfecRCQ9t70iXdquiijffpiLVLEGl+WVba
         2EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832640; x=1762437440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bBFEkcQ8xUvhwX9gDA9IWLN2BELZaEr5a/ByZItGkVU=;
        b=FprvAw03jJI1+if7ke3HS9IiwYCwT1VdthfdBmjbWVsOlVebJ+aSH4/RGUsX93skyq
         SoIlUNRxxvFRArAJTTGjW9sX0PYBbFfun1uLYr61XESOgxZT1kjRh9JbXEMaaRzAFqIG
         lDYyqA0Nyn9MIiucUIpTd2xRo4So+96fQZZEdMT/CLJe2kzt3Y2NK9YicJPIpZmfXU2K
         uIFQVe7qbpleYl3W9H5ck7jzY0X0lmAmOwvhT1Jr4mvR0QZNXhIkV0Nm4GsElzhJyrva
         X8mWRIwqerpSOrCNkjnOSyzc93pk4MYH5/PCFc2ffMPa5o+Y6a1W2cv/SezwrJWjMXvV
         fnSQ==
X-Gm-Message-State: AOJu0YzSXf4C53/e1hPmmC1I0mtQhs8dJLGeLS+dnXSQ6TIu7GukfZrm
	CvrPn/BoO9hSRy1TVBuQKSG2sg54fgoUFxMNRhZTaZF13K4lgnbva700RMJM4wSep2U=
X-Gm-Gg: ASbGnctapMRsBh+ahC12hWKCZr93Cea8BHMa7BywjzGeRjQ/bg1QbWO1ac3xvOedJUM
	NLHctWsZ3/VRIobWDC70kdnOHeUYxwVG5aElLbYRO2NcbXbXtg2PbHdNCp3YZV5reCtseqZsEfb
	hrLGIbbcGFtNNBs2bb1jx5h2nuXvCSdMYY5XD9A3QYdByDFFJRUjCcVbLLwzOlInZCCW3mHnVgl
	gIkbRwoyg2a6729WRmeU64PWzpfeu2Qn6VhRS2OiW6lgEkCZSkopDlhjQqireJwVN8UHzyEEAav
	+vwGqeYTSbx7zDnqwQWftdth+BGCnSj7CPsJpc0WogUIywsXg5a2nMrgp+GTdKfB8qqh9hbpjKa
	u07jD8P7yRbQhSPWKodKMr9jjkJusZkC1NK4fU7gBsyLttI27y6xWspLghF+V29fNm7PgbBYjUj
	MTKckyIHlDxs0HZDp2HnVZnC7dfpLhSY8SLHa31P/2pjvYlg4M915AiOYfL1oJOcI=
X-Google-Smtp-Source: AGHT+IEBVtXylNQASrr2YyG7D2Tj2EPDKv83suTEKGHYLNZD/7uPvsZga5WS/d7dp2LV6KOpbcdbCg==
X-Received: by 2002:a17:903:11d1:b0:294:e095:3d3a with SMTP id d9443c01a7336-294e0953f16mr72086945ad.24.1761832640241;
        Thu, 30 Oct 2025 06:57:20 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e495e8sm187071905ad.110.2025.10.30.06.57.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Oct 2025 06:57:19 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	apatel@ventanamicro.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v1 4/4] riscv: mm: Perform tlb flush during context_switch
Date: Thu, 30 Oct 2025 21:56:52 +0800
Message-ID: <20251030135652.63837-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030135652.63837-1-luxu.kernel@bytedance.com>
References: <20251030135652.63837-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065721_406207_A8838502 
X-CRM114-Status: GOOD (  13.04  )
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

During context_switch, check the percpu tlb flush queue and lazily
perform tlb flush.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/tlbflush.h |  4 ++++
 arch/riscv/mm/context.c           |  6 ++++++
 arch/riscv/mm/tlbflush.c          | 34 +++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index eed0abc405143..7735c36f13d9f 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -66,6 +66,10 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
 
 extern unsigned long tlb_flush_all_threshold;
+
+DECLARE_PER_CPU(bool, need_tlb_flush);
+void local_tlb_flush_queue_drain(void);
+
 #else /* CONFIG_MMU */
 #define local_flush_tlb_all()			do { } while (0)
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 4d5792c3a8c19..82b743bc81e4c 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -199,6 +199,12 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 
 	if (need_flush_tlb)
 		local_flush_tlb_all();
+
+	/* Paired with RISCV_FENCE in should_ipi_flush() */
+	RISCV_FENCE(w, r);
+
+	if (this_cpu_read(need_tlb_flush))
+		local_tlb_flush_queue_drain();
 }
 
 static void set_mm_noasid(struct mm_struct *mm)
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index f4333c3a6d251..6592f72354df9 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -115,6 +115,8 @@ DEFINE_PER_CPU(struct tlb_flush_queue, tlb_flush_queue) = {
 	.len = 0,
 };
 
+DEFINE_PER_CPU(bool, need_tlb_flush) = false;
+
 static bool should_ipi_flush(int cpu, void *info)
 {
 	struct tlb_flush_queue *queue = per_cpu_ptr(&tlb_flush_queue, cpu);
@@ -134,6 +136,14 @@ static bool should_ipi_flush(int cpu, void *info)
 	}
 	raw_spin_unlock_irqrestore(&queue->lock, flags);
 
+	/* Ensure tlb flush info is queued before setting need_tlb_flush flag */
+	smp_wmb();
+
+	per_cpu(need_tlb_flush, cpu) = true;
+
+	/* Paired with RISCV_FENCE in set_mm_asid() */
+	RISCV_FENCE(w, r);
+
 	/* Recheck whether loaded_asid changed during enqueueing task */
 	if (per_cpu(loaded_asid, cpu) == d->asid)
 		return true;
@@ -146,6 +156,9 @@ static void __ipi_flush_tlb_range_asid(void *info)
 	struct flush_tlb_range_data *d = info;
 
 	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
+
+	if (this_cpu_read(need_tlb_flush))
+		local_tlb_flush_queue_drain();
 }
 
 static inline unsigned long get_mm_asid(struct mm_struct *mm)
@@ -280,3 +293,24 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 			  0, FLUSH_TLB_MAX_SIZE, PAGE_SIZE);
 	cpumask_clear(&batch->cpumask);
 }
+
+void local_tlb_flush_queue_drain(void)
+{
+	struct tlb_flush_queue *queue = this_cpu_ptr(&tlb_flush_queue);
+	struct flush_tlb_range_data *d;
+	unsigned int i;
+
+	this_cpu_write(need_tlb_flush, false);
+
+	/* Ensure clearing the need_tlb_flush flags before real tlb flush */
+	smp_wmb();
+
+	raw_spin_lock(&queue->lock);
+	for (i = 0; i < queue->len; i++) {
+		d = &queue->tasks[i];
+		local_flush_tlb_range_asid(d->start, d->size, d->stride,
+					   d->asid);
+	}
+	queue->len = 0;
+	raw_spin_unlock(&queue->lock);
+}
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
