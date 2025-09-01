Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FE3CA1002
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9aStgU2kys7Av76VbqFkm6yLNlBEXegBMtM5oM9rtE=; b=iElj4yqJ0diIAa
	pzsR+3y/I159fcPxK18FFh8Dke+1zjU+A/w03W7i1MD/0gNrG+eLXfSnSlSehpHPMhNz+zEfOIEk5
	CaYUc4xmZppOHdx/vDcJj3uj0YVuNoTP+hyADFJSjPNckbGUE+IgV2/5/pWk/9EE7eP7MT2Uvv+5S
	DVHhwd+HbbmxzdEAhId7mHdxE60vrk7ZG3RbpcY8SXogKou+dJc81chGLVeWZc0Uw6IDVTxHqs5Ca
	aX4UDCo2VnD5VmaIFcocsfZpQ/QQ8nVMy0SxPwmyvDHb8sNZZIA74d4cPSWx8xzCuudNbiY3KAQ6b
	qK5klRIBPrE5tTJrbeOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4ud-0000000CkMe-2WdJ;
	Mon, 01 Sep 2025 13:49:35 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2v8-0000000C5he-3WFO
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:41:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-24a95f9420aso13783255ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756726918; x=1757331718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yoam2Ed8JJCs5sRbaWgfuw9sP/krLyryxA9VsbblUg=;
        b=RFD6MZb1xFF/U/V4I+S6H5viGaQwo+wUP+FtnkCXbHMtr3DXmlCFQzoDI8+0Q3/nhW
         l3QN3cc0YGtftH6/odda2mpIhFjL4BWRuKPhhwJxz6MY/1QWOaQvReHunsgsvsjPNzia
         L7AOyjNlvKcfW0qDEjLnve7BMJeN+nnHwFV9vhq6HOCKvz9gp3uPRDm65DzAF6XHjcCB
         NhE+WVryGgTaTHaNdtm4q+It12uj1aXiJwby6Ccb0eIJ7l8H+NOMX6TxiVLMtHmwVSLB
         lpzptp5aXOymihvv5MB3/eLgYSbzCVn9eEqOukSwAom5Zhi+lDME8CeA+QzhXFd2alS4
         b1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726918; x=1757331718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yoam2Ed8JJCs5sRbaWgfuw9sP/krLyryxA9VsbblUg=;
        b=RYPQ3iRxlPBWrKu66eB84cyZmhpZBA1hvUjc5N8/6EA07RJ2cb/+SypSqnN4lchVUd
         6uCOhd+xlAN3XfNUP9OGFksraUZZyllJ5MhJ2rUBZES4AePyaPl1wa9Glhg55ZsnL+BS
         /eOIWK2oPlOm39kjOBhb0iSo5cTnodSpat49XgqM4Wx9bVDR9imVJ9flyG9yVFNYTvBB
         fANhy7EsNDD7Hqv2vLItA+aD3cuV2SJFzfsQpKPPoXVcEdZvFwcZJxUJ/5iIeqVSRGs/
         bZgeyiDxJgwvckUryqm+hWAHLrjM6NxtyKxOxgWCvbo/NznSh0/gq+9OtDPrQxZnoDiC
         gDkA==
X-Gm-Message-State: AOJu0YynOnFCSW2nWVFspPaymGDa/sHWhSw9KjQPBMOd4+Q34kUO+BXU
	OuJ+7NUR34+kypOqasZtsBb9k51FPygy9J6TJTa4MiWVCJLb6eTa578QNsF8fPP6ZZs=
X-Gm-Gg: ASbGncvaPrbQwZw58L02W09I7FFKJuAnpr4IX7xzwbTbYZPa1xH8AEbDOrltA+mJBih
	QK3dpPabQRtfX6hopJ7yeGFPBORAtcVCBkcNgPBWFFXO/FWyD8l5bHcKN6MxZyCclVc+MabUXRr
	hrIUSPApNvRsmzuqet7giYratKzoAr/Qh9HzXC81KKX3QazOdXJety/iiMC9bfk4ZKezHpk38O7
	x+l+WttA2Jn0WqSbA7Vixje/R4xHohzTMbKVb/R1vm9vRyzcrMQl2X0GsqWlI7jrIIovaoB6gON
	hskJ+3pcrk24pl1at89YkT1vwH76jyZ8/QP+48LcGHii2ASoCmqm8lpqB2Efcqs/fAb905Aj7n2
	4WPYCTx962gv61vAbeIZ77vfWCA/jFWq3q/Ud6ztDlVXtpuq1HHYMXFcJO4xK6mPdLqMkogmchE
	yT3s+kzNMVUwP7+76aarYQ7361V2Wnwp3aDqSt1EZk+2kA3azR6xglMw==
X-Google-Smtp-Source: AGHT+IH9HacVdhhrlYWDJB9ao9Cj7vL+SYgn/KxsSVzOs5trPZW7TKzXPjSrbltXooT+Y+1VomhKUA==
X-Received: by 2002:a17:902:f64a:b0:24a:9475:3dcb with SMTP id d9443c01a7336-24a9475437cmr75175655ad.37.1756726917967;
        Mon, 01 Sep 2025 04:41:57 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249066e042asm103147055ad.146.2025.09.01.04.41.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 04:41:57 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH RESEND 2/2] riscv: mm: Clear cpu in mm_cpumask after local_flush_tlb_all_asid
Date: Mon,  1 Sep 2025 19:41:41 +0800
Message-Id: <20250901114141.5438-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250901114141.5438-1-luxu.kernel@bytedance.com>
References: <20250901114141.5438-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_044158_878382_568B4E3D 
X-CRM114-Status: GOOD (  13.01  )
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
