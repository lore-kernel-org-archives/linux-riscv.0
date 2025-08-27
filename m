Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5B3CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 15:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9aStgU2kys7Av76VbqFkm6yLNlBEXegBMtM5oM9rtE=; b=tOu6jSQgG0KV9U
	d/prj9y/DwPldI4fM6bG0oOjkqb2hzZfDspSON5s7SrC6c7oKheDRkJp+vWqughEr5AwlHpbSE9es
	GpEik3E8AywjDR+4CQagdEo6lcs1/04hlxyQNUtSUw36rnxl/Oe01In8RKVsX3oKlwQH8Vb/Z61p3
	n+ictyJ3kNDpiTynyRGZPAIAXJNfRP0p6SC7U4mgs2yOduXYEQB/Tu1pT2ee5mLKml3jSadS0LNqP
	gBHqgTyWpIwe4o8laxz9FyN7e/gpFS2vJ+kNgfx3XfHaCrRiB7Gu4BDx3ZWfxyH+jFTFBfQ+NPQm0
	vsXv6dTc9Owq5+LlNAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urITc-0000000G3um-0rEB;
	Wed, 27 Aug 2025 15:54:20 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFzQ-0000000FXdj-3rSW
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 13:15:02 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-771f90a45easo1792429b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 06:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756300500; x=1756905300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yoam2Ed8JJCs5sRbaWgfuw9sP/krLyryxA9VsbblUg=;
        b=gUdyCyFNOwWzQmKobHaa8GYzvZg3k+T0jPPk8AHsSFVa9Z5M2UNIvixAZUKJT8jkdg
         QXg0MD3pt1GD+0IlZS9uWEzb05LA1DWD4OiafBj4gUJ6bTV9eBOz+xHEh4OJOYu/MN4T
         og1nmKQ3BNh04eFadli5QiGgbewJ6TJzXDBkdITj8XUy7ztiNqUUtNsJhn5HUeb0ck3x
         e34aC0/PFLwaWJLUsZ0jvd2dPlUMbXtd239L47o4XH2bgWsHF0XLewqfkI+/VixX6Ir+
         IdPX2aogm0OPn+UKGn49r+4NjYxjJtbKskH4V9BhnqKfuIKi0I7YC1ewI2gr2HC0NaOZ
         9BrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756300500; x=1756905300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yoam2Ed8JJCs5sRbaWgfuw9sP/krLyryxA9VsbblUg=;
        b=qSEcN273vo0eKe1eQohOsj0ehyydB+DUkVUf22s9t0l1iKe5OrR3Ig7m0uLwuB6gad
         4GSttUuqV64g7233pV3bQsxBPpNiRkdXSYuJzOLyqxXGe0GnXZxn82PVEhOaiAs5X63+
         4mg+zPS5WdkWNNWrV8IZErYiXNHlyqj8Bit/S0iKP692O3KDG8v43AaEDN480p0tF2WQ
         cZ9cLKs4l1Dj077hlT3cdodJ3wj/eZK66YEL+W0698db8jqZGH3whSBTZSunVx0+H97s
         xTqGAPDKB0Ry0meF3NH/yKzxyiRK4TMpZU6jpnOHkXzCDTYcw8kQeNOalG4h24zmrlOw
         hxvw==
X-Gm-Message-State: AOJu0YwrcohD5qqYBMmZ9+TMGWmAmnraez/ZKYoekBaZ6T6wmxc8UGpf
	M0Iq54QcAB+Z0HD+h63inURihqrJA7/EcP7UN3NY2ZUAy8YhZ3sd4iQ6RtKrP6RIk+I=
X-Gm-Gg: ASbGncsnJiN0PKL0xvYzkWO7Q05sRgMceyR81ROB8ZqoabAqrepi0Tu9mtLx+8jRois
	s5wKG3KPpY4JxftEh7mUlnhjpK1h0wjNn/Dz0z8RrWtcj9SjXUaMs8MzvluE4ATJGoxv92Py2eY
	7lwbhrEZgqFhTVwvSB1uqz7cUdcSJnmqXWi1k1uXu5P1MA2PHNI34NkytDfAIh8z7XmlElGHXy8
	1BgFNh0N80Bg66ifgQviiN4YNa24nsVzHnjcDmvAhqEx17Z9vQ8KMUCR87rwStVeZmBbxj6J3OL
	62GUHy/w0wKmy/Xl6uIKv0iQ4gnsK0q5o89v7eZZeth2PapQYxMyvqkjyOhStJf6avyCs+XPGME
	I01aC03V/7z5B14hbM/gU93iaarVJcalUQ9UQPDMIY1aadddFwhqbMvIr5e2aB7mMSFSYr6vgys
	YkLCVjuvI8B3m5gCReCbGrRw/xk6vo9H1nB2kkK7e8Uqo=
X-Google-Smtp-Source: AGHT+IH093oiMDk1IJe8n5AdJKx3X2MU1Aan+sgd1rlVBn2icqsAZZ2z8qfKLqFhQrakcrMJ0Xp7uA==
X-Received: by 2002:a05:6a00:1893:b0:770:581e:55e8 with SMTP id d2e1a72fcca58-770581e5763mr15686407b3a.27.1756300499864;
        Wed, 27 Aug 2025 06:14:59 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772017f538esm3172443b3a.21.2025.08.27.06.14.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Aug 2025 06:14:59 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 2/2] riscv: mm: Clear cpu in mm_cpumask after local_flush_tlb_all_asid
Date: Wed, 27 Aug 2025 21:14:44 +0800
Message-Id: <20250827131444.23893-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250827131444.23893-1-luxu.kernel@bytedance.com>
References: <20250827131444.23893-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_061500_961843_3592B8E4 
X-CRM114-Status: GOOD (  12.58  )
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

Clear corresponding bit of current cpu in mm_cpumask after executing
local_flush_tlb_all_asid().

This reduces the number of IPI due to tlb flush:

* ltp - mmapstress01
Before: ~98k
After: 268

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/mm/tlbflush.c | 41 ++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 962db300a1665..571358f385879 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -17,7 +17,8 @@
  */
 unsigned long tlb_flush_all_threshold __read_mostly = 64;
 
-static void local_flush_tlb_range_threshold_asid(unsigned long start,
+static void local_flush_tlb_range_threshold_asid(struct mm_struct *mm,
+						 unsigned long start,
 						 unsigned long size,
 						 unsigned long stride,
 						 unsigned long asid)
@@ -27,6 +28,8 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
 
 	if (nr_ptes_in_range > tlb_flush_all_threshold) {
 		local_flush_tlb_all_asid(asid);
+		if (mm && mm != current->active_mm)
+			cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(mm));
 		return;
 	}
 
@@ -46,21 +49,28 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
 	}
 }
 
-static inline void local_flush_tlb_range_asid(unsigned long start,
-		unsigned long size, unsigned long stride, unsigned long asid)
+static inline void local_flush_tlb_range_mm(struct mm_struct *mm,
+					    unsigned long start,
+					    unsigned long size,
+					    unsigned long stride)
 {
-	if (size <= stride)
+	unsigned long asid = get_mm_asid(mm);
+
+	if (size <= stride) {
 		local_flush_tlb_page_asid(start, asid);
-	else if (size == FLUSH_TLB_MAX_SIZE)
+	} else if (size == FLUSH_TLB_MAX_SIZE) {
 		local_flush_tlb_all_asid(asid);
-	else
-		local_flush_tlb_range_threshold_asid(start, size, stride, asid);
+		if (mm && mm != current->active_mm)
+			cpumask_clear_cpu(raw_smp_processor_id(), mm_cpumask(mm));
+	} else {
+		local_flush_tlb_range_threshold_asid(mm, start, size, stride, asid);
+	}
 }
 
 /* Flush a range of kernel pages without broadcasting */
 void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
-	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
+	local_flush_tlb_range_mm(NULL, start, end - start, PAGE_SIZE);
 }
 
 static void __ipi_flush_tlb_all(void *info)
@@ -79,17 +89,17 @@ void flush_tlb_all(void)
 }
 
 struct flush_tlb_range_data {
-	unsigned long asid;
+	struct mm_struct *mm;
 	unsigned long start;
 	unsigned long size;
 	unsigned long stride;
 };
 
-static void __ipi_flush_tlb_range_asid(void *info)
+static void __ipi_flush_tlb_range_mm(void *info)
 {
 	struct flush_tlb_range_data *d = info;
 
-	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
+	local_flush_tlb_range_mm(d->mm, d->start, d->size, d->stride);
 }
 
 static void __flush_tlb_range(struct mm_struct *mm,
@@ -97,7 +107,6 @@ static void __flush_tlb_range(struct mm_struct *mm,
 			      unsigned long start, unsigned long size,
 			      unsigned long stride)
 {
-	unsigned long asid = get_mm_asid(mm);
 	unsigned int cpu;
 
 	if (cpumask_empty(cmask))
@@ -107,17 +116,17 @@ static void __flush_tlb_range(struct mm_struct *mm,
 
 	/* Check if the TLB flush needs to be sent to other CPUs. */
 	if (cpumask_any_but(cmask, cpu) >= nr_cpu_ids) {
-		local_flush_tlb_range_asid(start, size, stride, asid);
+		local_flush_tlb_range_mm(mm, start, size, stride);
 	} else if (riscv_use_sbi_for_rfence()) {
-		sbi_remote_sfence_vma_asid(cmask, start, size, asid);
+		sbi_remote_sfence_vma_asid(cmask, start, size, get_mm_asid(mm));
 	} else {
 		struct flush_tlb_range_data ftd;
 
-		ftd.asid = asid;
+		ftd.mm = mm;
 		ftd.start = start;
 		ftd.size = size;
 		ftd.stride = stride;
-		on_each_cpu_mask(cmask, __ipi_flush_tlb_range_asid, &ftd, 1);
+		on_each_cpu_mask(cmask, __ipi_flush_tlb_range_mm, &ftd, 1);
 	}
 
 	put_cpu();
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
