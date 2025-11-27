Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE8AD11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+igiR29qT7NlJwxO+dvipESHpx0nVcQrB1RxTsO8iA=; b=U6V0H7ZEwtDqnR
	SMV8U5L7h6ctg1XJk8n7/4YvkRW5hY2fGzHJB3z7YklHlBGqyFXI92dqeoIOU5aE6e13ybypkBQzC
	BaMC04+43jrH8qdqWGwznEMUVVWrRkkt++hQccFti+f6wvavCqRllr12/d5KraMOT2IfQjkwVvO7x
	AghRodrt28WH6MHKfnmtm1Z8z7MCvcRQjkiVXZNCBtNuue9x9dGbvMhdnhiyFw2ARB5mBXfZjphrQ
	peojJUYdBMlDaMNIjesfkLNQa52mZC6LmY7CgLLYWKVaoeYjediJ5yAzsF810I7whjFFqQldM9UPC
	1LsN2h5n9ebscIHrd1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcju-0000000Gkq2-35u3;
	Thu, 27 Nov 2025 14:12:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcjt-0000000Gkor-1tn4
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Nov 2025 14:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=y6POrY+BMUj8HO1IGB0lZ0hYE1ONoquBp43+FVGHg3w=; b=CBiML+rCz0/7sE6LYwxEGpVBXK
	YgdelHaZd/0pHuk/QdmrH1k6b99txP/YPP+nKsqcYfD64Jkw2GKejBIO0xRNi+amwDopscJ3Yvymt
	yKgMJ/iPbfiDhliQRbvDkUBIL2FN9dVjybnCbwB1MPQgvkMIK7VADRklTLCh7RWWNDGLUh7+/MpNM
	gOHjU7VaDRzgLFw8AZh32wo1P30R4oXtoF3kmvjUif+0ws24a2mqUrXceUp4Tr1yKTMKWUaG7nDJA
	T3SuBjWSFrg94QxVb7phqWdDyii2Z8TKLybhb04OO/6kK9gp6TE6ubVrZlFbHa3SA9zrDlkLAtDcp
	vCCisg9w==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObsG-0000000AFRh-0v6g
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 13:17:30 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-29845b06dd2so12147055ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 06:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764252768; x=1764857568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6POrY+BMUj8HO1IGB0lZ0hYE1ONoquBp43+FVGHg3w=;
        b=jXGULEwr9vt9J9eKmhfmj9AVP+Kl8keOJ+OPS5uJSMX6GMfGui83TNZjYuMMGPuYy5
         3ie6jOPElSNj/o3YDWn6iG7ETlxjPL+SpSetdIXcIrYko9cGmsaAPMvtkFUdhUOKVwL6
         dCcMixbYvuYwB0Rc32mjxjSsV3i+QedykzC0FhL0dziY3Lvtcn4dc4mL3ynTr7SJUF3k
         zRBTNI81RHw0+sLx7vyvVXI8w7qfT3PsdJEFbIR4MXuNyFcNyqTAmA9Hoeej64atD11J
         ZI94rH9LZnhw8r9ojERjFy5r9UcMqo9ksRyG77Rt6cz7iRNjvxU8OmLlCmzQ2pBGvl0W
         piAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252768; x=1764857568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y6POrY+BMUj8HO1IGB0lZ0hYE1ONoquBp43+FVGHg3w=;
        b=e2+oOJ8qZOF5yhlE8IGYBNrosde1n4wxP41IQf4+gz/OKVidrAgEdIiVmVJ8O9cB2O
         UhEac+bG8bxmZzzsd0G3ERbqxOBacQotNA0kmsBsPjC9K7O+HOHd1hyHDBqZXXcdDlxw
         S2pbDAs7b5Dn54NZ/WTwEX7Xlfb2fboevReQxUOpYM8QLomJBYumAL+A3hdZc4yXmQ43
         2LpCqCEkwNhkiRkT8pH8pCLEPdos8Mhqrx3wOLu78mURujzOO4rHmroros9Yv49+GruL
         vQRovV0X5Xxty1iUTEqwukY/YM7aInlV3gGbv/cCvC36B/vvq3+qf+6S5Wvr1vcHjuic
         UlBQ==
X-Gm-Message-State: AOJu0Yxsjpg/Uo/U9qm0CobnkcpjtEquXjhREFcpBUtlx0uPw0j1QJ7C
	fLFPXHLqRFcWImeEgL5k1ROPRmZmNi6IAEDxC/RVKRTZDAlIPstLLvnBbdPhtccbc/4=
X-Gm-Gg: ASbGncuWoq5bmRMux5dOnmONvJr6fF/p9pQhq4l5iplt8/Y1ZIcjaTH0MqoU3/VyG8z
	9Q+c6p6QiVmGvVRRqr1zGYTuWSfXl7DSefeGpL19zMDmfHIRn5LwraAIdROHGOPXdyZ59dEpGra
	hXgwlsEt1T72cH48Md+ozsWPBiEkd8ncgEiJYn2jqPa6fol11iADorJp+7mKX7myyAPOWpNQPot
	yEFMRKGdGuMF0yTXcbIb/VzkvlxH1n+/KWcBqBj8ZFeESo+lWvrUhMubbGXw3aVED9WG7wHc8Ew
	kHTiUI3vNdY/Kr4uzhAXOOdJbnm1sy8SvbH4ws0RT8+3JgT2aT5H1YJBk2tzXgCLoDeHWOytHJL
	MH4euwm3PVyvvC1SEgbcGfij6IGbqMJXnG4+2u0LS/xRN1Vn8qq84xLdi85jbZOJevqWOpcqH8G
	gs3gQmzxlMXiHwsd2lCDsacrbnDDYXRhyNNZKYS9TtD2Gud/mxe2x1CF+FRRq8Ko1FkOw0y4/Rx
	w==
X-Google-Smtp-Source: AGHT+IHvUpXCjjZYwqFKdgiDcxzIag75+OwjgHS8aOmS+l5BTWC/h8DmVKdTYaMfKXu5VxrbnkaKrQ==
X-Received: by 2002:a17:903:1af0:b0:299:d5a5:3f7b with SMTP id d9443c01a7336-29b6c6b87bcmr256617355ad.53.1764252768286;
        Thu, 27 Nov 2025 06:12:48 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b7341d2sm2030249a91.11.2025.11.27.06.12.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 06:12:47 -0800 (PST)
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
Subject: [RFC PATCH v2 8/9] riscv: mm: Clear mm_cpumask during local_flush_tlb_all_asid()
Date: Thu, 27 Nov 2025 22:11:16 +0800
Message-ID: <20251127141117.87420-9-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251127141117.87420-1-luxu.kernel@bytedance.com>
References: <20251127141117.87420-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_131728_476360_41A06973 
X-CRM114-Status: GOOD (  12.28  )
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

When local_flush_tlb_all_asid() is called, the target mm's TLB entries
are all flushed out, then we can clear current CPU in its mm_cpumask so
that next time the mm's memory mapping is modified, no IPI will be sent
to current CPU.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/mm/tlbflush.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 0083fac87c2bc..88a1e45bcf508 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -35,7 +35,8 @@ static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
  */
 unsigned long tlb_flush_all_threshold __read_mostly = 64;
 
-static void local_flush_tlb_range_threshold_asid(unsigned long start,
+static void local_flush_tlb_range_threshold_asid(struct mm_struct *mm,
+						 unsigned long start,
 						 unsigned long size,
 						 unsigned long stride,
 						 unsigned long asid)
@@ -44,7 +45,7 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
 	int i;
 
 	if (nr_ptes_in_range > tlb_flush_all_threshold) {
-		local_flush_tlb_all_asid(asid);
+		local_flush_tlb_mm(mm);
 		return;
 	}
 
@@ -64,21 +65,26 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
 	}
 }
 
-static inline void local_flush_tlb_range_asid(unsigned long start,
-		unsigned long size, unsigned long stride, unsigned long asid)
+static inline void local_flush_tlb_range_asid(struct mm_struct *mm,
+					      unsigned long start,
+					      unsigned long size,
+					      unsigned long stride,
+					      unsigned long asid)
 {
-	if (size <= stride)
+	if (size <= stride) {
 		local_flush_tlb_page_asid(start, asid);
-	else if (size == FLUSH_TLB_MAX_SIZE)
-		local_flush_tlb_all_asid(asid);
-	else
-		local_flush_tlb_range_threshold_asid(start, size, stride, asid);
+	} else if (size == FLUSH_TLB_MAX_SIZE) {
+		local_flush_tlb_mm(mm);
+	} else {
+		local_flush_tlb_range_threshold_asid(mm, start, size, stride,
+						     asid);
+	}
 }
 
 /* Flush a range of kernel pages without broadcasting */
 void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
+	local_flush_tlb_range_asid(NULL, start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
 }
 
 static void __ipi_flush_tlb_all(void *info)
@@ -204,7 +210,7 @@ static void __ipi_flush_tlb_range_asid(void *info)
 {
 	struct flush_tlb_range_data *d = info;
 
-	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
+	local_flush_tlb_range_asid(d->mm, d->start, d->size, d->stride, d->asid);
 }
 
 static void __flush_tlb_range(struct mm_struct *mm,
@@ -222,7 +228,7 @@ static void __flush_tlb_range(struct mm_struct *mm,
 
 	/* Check if the TLB flush needs to be sent to other CPUs. */
 	if (cpumask_any_but(cmask, cpu) >= nr_cpu_ids) {
-		local_flush_tlb_range_asid(start, size, stride, asid);
+		local_flush_tlb_range_asid(mm, start, size, stride, asid);
 	} else if (riscv_use_sbi_for_rfence()) {
 		sbi_remote_sfence_vma_asid(cmask, start, size, asid);
 	} else {
@@ -410,7 +416,7 @@ void local_load_tlb_mm(struct mm_struct *mm)
 				start = queue->tasks[i].start;
 				size = queue->tasks[i].size;
 				stride = queue->tasks[i].stride;
-				local_flush_tlb_range_asid(start, size,
+				local_flush_tlb_range_asid(mm, start, size,
 							   stride, asid);
 			}
 		}
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
