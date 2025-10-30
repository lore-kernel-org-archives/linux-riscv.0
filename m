Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A0CCCF9FC
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 13:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAfh4r6+0oqYh82HvVtsynUI+ZBZTr/MwPaR9akGwNQ=; b=DJtnhwzDEpsKVa
	i/ZQ32GM5u54rxdAlLD5EWWYmxDdYwPuLdCdfsIQMX+Zj0V10UwMTOVQr0cQhtRj6UeeVM9BirA4R
	ekcsEuK95rMHALg83wc2LiEK2iZ8vA8IAxyylKdFJW5aNg4VVP36L+QUJ8AZo+lGKlybX2vpUR+Xw
	QETOiTyYJuJkA143ofcm4OeI2aDTvX3e4QirQZ5UVkwf2Zq9gJVuJxxlN5FHn4imrD1tf2BK8UXeE
	t2aDU9oVSwawBqHQUESozVwY2BKYpH60qafGjODEz6CHGgW4AABXIBGT/fR/2L3Ht9mdMLkntAuCE
	Vqwf31przYS2DXpB/AOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET9V-00000004GFS-2C2q;
	Thu, 30 Oct 2025 13:57:21 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET9Q-00000004GD0-44Bj
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 13:57:18 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-27d3540a43fso12899695ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761832636; x=1762437436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JicIE58FwjHecYxgU5U3fS7oy4Wdsaoyxg9pwk2jRzo=;
        b=SE0HEtYtAEFGFYSjdLZpx1BTutYk1iBhEQ/X8G0so2ebNoyOEcy6pwb5h/DOYPYrx2
         F7jwHF10yVbhzWoQqqiCuHdhG4GKJ1+NHIZQ6e9EEFAdHAwDGUEKF80T+Whf4N08l6fj
         oFBCyQOKVAGSJnnLkXrIPSbTk/8SJdJVWkrknMYdzLg4yyFcF2opHdCjvUXRafdIdfGG
         +pVBtguVpYMsNdJh7StDb5QNAPveCddlckVLIUt39D+PKRNVru/LrOOv+g+X+e2DG7kM
         GxA6rr5OeknT80FTrL/V8/mrlVBaplP/Y87vbwnM++f9yhbr76/AxUUROzIJCXdijii6
         +DRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832636; x=1762437436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JicIE58FwjHecYxgU5U3fS7oy4Wdsaoyxg9pwk2jRzo=;
        b=Lk5vfEqx4fGoLnsFTX+rprM9PlqG/W8iaroX498AzvpXOPcB5eHr1WaX2iVSRap6Xs
         Hc7S0JaIKLJUSqr46YvVsdV2vDG9L6zDQUbKVIF3c3rt3ZsLRLEJM9tc7QynYg+Nl0Se
         GPFYN+AElm8KV+3YtRih71nG3mqJ5uMmjUyXpZ6+4RIxmSwjtvCcVHnm8RYUiF/8lHoq
         QNUp+j15HQ4fC+eQsH0JFzFS2cv/EnVxm1HBz1oxs0WfMbC3n8RWCUGNHtfacIS7W5g1
         q/4dp49arKWZWUN7ng4ldDUsWxFSEPLDsUkZX1WTuBKFLAP0+619FlXtAK0p5FPVsvWG
         UwPg==
X-Gm-Message-State: AOJu0Yw6gyt/jam2b0f+Np3j5gP7UrgAJqEfa5ivPcXOIM3eoxwZAHBj
	i/TDTOCrAOfu78pXUgq8nXUzBH4+1PDubi4b2WQvXpzZIaHe0rdt9ctDkajJVaVRmpBQ11NpMX3
	06+4FYZQ=
X-Gm-Gg: ASbGncvya75klZtcgUNHi4RMAU9ZPccEMkl713RcGl2ScGgqeQ16jP9S1dLCM2MHIqc
	pYo3tizDznj8hkPFZJE5Fw4VGrl8RmqM3VcyPMn172MVYCT2kEG0FUDVI9R6s3wiHZ3ehJiAYer
	ZDEZOUBEJnSPI50m1QpQD7YdUlGxIFBRNbA0HseB67S4u///XhBeDB9+6WP3IxQHYLwE07k3+AK
	Urpl3VUcRv9gdIvrL2o80xY83XbwfW3cmpIdLc03agiYeUFW4807GRPdoiHGnbGTy774ogG/z8b
	AGmz7/TupPI+BatyZiuPl1+dI8bpqxoj7RMtNDh0D+qPVyrehembvUVk/a3httbgx7/33hfR4eL
	I4HgKMsRrYFgGbm3nVnYJWI4gK8GKLY5vbTmcv5rkUAu9u0sogDlIkAe5t4xY5FFGgwOSQbIS2F
	zgVRfRnuZ0sKFp75XstOcMljdnNhMvd8t7r0nmrs79tbimJSABbOfse1vb25NdFdk=
X-Google-Smtp-Source: AGHT+IHEJ20/piBU7YOuFAuDIHAXabWarffYfeSdFbAZ/TJ7BVINPJu9h3FE6SZpYUveWoSWx2Tx3Q==
X-Received: by 2002:a17:902:db11:b0:294:f1fa:9097 with SMTP id d9443c01a7336-294f1fa9228mr37402885ad.34.1761832635722;
        Thu, 30 Oct 2025 06:57:15 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e495e8sm187071905ad.110.2025.10.30.06.57.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Oct 2025 06:57:15 -0700 (PDT)
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
Subject: [RFC PATCH v1 3/4] riscv: mm: Enqueue tlbflush info if task is not running on target cpu
Date: Thu, 30 Oct 2025 21:56:51 +0800
Message-ID: <20251030135652.63837-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030135652.63837-1-luxu.kernel@bytedance.com>
References: <20251030135652.63837-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065717_014593_AEF3CF37 
X-CRM114-Status: GOOD (  11.67  )
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

When need to flush tlb of a remote cpu, we only send ipi to the target
cpu if the task is currently running on it. Otherwise, we only enqueue
the tlb flush info in target cpu's tlb flush queue.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/mm/tlbflush.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index aa8f1304ae5c4..f4333c3a6d251 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -115,6 +115,32 @@ DEFINE_PER_CPU(struct tlb_flush_queue, tlb_flush_queue) = {
 	.len = 0,
 };
 
+static bool should_ipi_flush(int cpu, void *info)
+{
+	struct tlb_flush_queue *queue = per_cpu_ptr(&tlb_flush_queue, cpu);
+	struct flush_tlb_range_data *d = info;
+	unsigned long flags;
+
+	if (per_cpu(loaded_asid, cpu) == d->asid)
+		return true;
+
+	raw_spin_lock_irqsave(&queue->lock, flags);
+	if (queue->len < TLB_FLUSH_QUEUE_SIZE) {
+		queue->tasks[queue->len] = *d;
+		queue->len++;
+	} else {
+		raw_spin_unlock_irqrestore(&queue->lock, flags);
+		return true;
+	}
+	raw_spin_unlock_irqrestore(&queue->lock, flags);
+
+	/* Recheck whether loaded_asid changed during enqueueing task */
+	if (per_cpu(loaded_asid, cpu) == d->asid)
+		return true;
+
+	return false;
+}
+
 static void __ipi_flush_tlb_range_asid(void *info)
 {
 	struct flush_tlb_range_data *d = info;
@@ -152,7 +178,9 @@ static void __flush_tlb_range(struct mm_struct *mm,
 		ftd.start = start;
 		ftd.size = size;
 		ftd.stride = stride;
-		on_each_cpu_mask(cmask, __ipi_flush_tlb_range_asid, &ftd, 1);
+		on_each_cpu_cond_mask(should_ipi_flush,
+				      __ipi_flush_tlb_range_asid,
+				      &ftd, 1, cmask);
 	}
 
 	put_cpu();
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
