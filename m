Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4C2CD1283
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 04:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrriymgxX93etsYDBS+L/gV7QG7wWtpcBJZx/3qje7s=; b=IVaORGZWv5NLZW
	mche0ddDcAfrvqxYAQ0S8QFYrc5n71hoAIzNBrz5DZvWTJjJCm3dzsZgRVRfJbyQ4TQ3lOJpqHRCQ
	Nl++SFycdiP2ybmu3itq/a13vhxdLTw1WUNXh/jSt7NHtu8g6Wuc2kmRGi1fNd5yila8GJVMAuh4s
	amFYBGRzsojFDG9AhSYpt4g8hK+ULbn8xGwiUXnBfUD2z5a9bquvxAtelMmw173pVUuQUGfw3i6Dr
	eoiJ7GquLtmELUom6AWd0tnMG+8jqIIEVXQfvXEBDECv6Oeijo43W79VWBewUgzE2Ap5agGLNsVpR
	xKg5n9ynYdPbLCpNlMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFV-00000007S8o-3Tl3;
	Wed, 27 Mar 2024 04:50:53 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFQ-00000007S4D-1UaZ
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:50:50 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e6b22af648so376546b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515046; x=1712119846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fwmOl0CxtBfQxlaR9NQyd7IGBnsfsK+MLDyKM1aSvU=;
        b=hIfjkzLEGm7IZMN6P9MJpU8OXCtGNej4QShWAwxp6xHB2yC8yLGn7dRXPqdYx0BfRM
         8grd/fz+qEny4vMbb3Kp1EDyrog/d5MFC+GIvMinLMGBx8SySk2h4hBnrd0qAuroBEr4
         l+HSsnlufn5gMvjsI4YspYzlOv/BnV03e032m8fBfBn52PIGMkoV62wCulXOSG12QYAS
         c2TaoGJ97YImlVcsNNapUFNoawdGN9gyWtyWlOf/D4j1kTFunzCG+rtzQ9tsCRc1tfQ/
         6235rTzSwtOh/mLT+pICIDNgpJ8TdSZeR/33u7TRgml6yhWoFP4gsStmAMlgB1evxVS2
         4KpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515046; x=1712119846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fwmOl0CxtBfQxlaR9NQyd7IGBnsfsK+MLDyKM1aSvU=;
        b=eMxt5yL20+P2h+c2cO6osFM9MiqdNzO/Z1L7hmGjrl86pdtIOcAOXN5H0uIK6i/t/H
         4xjkSvBgiGg7DX/8PWQR/beKUOhxoYoY1LaJPlgldU8KtEYg9WLLO+akZ1WIfGuc89zk
         Jkba1k4UjTwd6z7p4rGqzPxsaLwN3ogo0oTRprtriuD30ZT4jd0ONR3hDBU4OAnt1z5A
         p9ggPzH8mQ+FKkX048TICfxr5IVhRAeNDP20KNZRFEiCWFsfiD4rE0uDVFcOQymuGJtS
         wdoRNZTFd9iP3triNLGXBf+CSB+HHY+u5XHHUHGaGvRXxBgLgOIs5s6TpeGbUN4LPogm
         jrSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgWrnxjJBUSV4anVuXkurv6YofwMvac+wVY2sVnVgXHhiS83fokDLhJRkPOdxXxJncqqdbaxfuKN7s/h+cHG6DGCsW40CGUviE4Bw59hds
X-Gm-Message-State: AOJu0YzbQ4/LUgwMvp1wJtob8R8ErbXwn4PLVRATvo0Uj7x66cumFpVc
	G6EfTzMXdI8OEZ88jEymVLDB/Clzs1EdUMzfhZsLe8qTKhCI4SJ8m8yLcMGbZro=
X-Google-Smtp-Source: AGHT+IGHAmpkwghveoQCxqBYVJp1RVR15SSZ2ypXvD8LXUp94lm0FkTd5l29fFm2kWdFZwCld1auyw==
X-Received: by 2002:a05:6a20:3d11:b0:1a3:6a11:4898 with SMTP id y17-20020a056a203d1100b001a36a114898mr4924839pzi.3.1711515046438;
        Tue, 26 Mar 2024 21:50:46 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:50:45 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 04/13] riscv: mm: Broadcast kernel TLB flushes only when needed
Date: Tue, 26 Mar 2024 21:49:45 -0700
Message-ID: <20240327045035.368512-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215048_487146_C4265DF8 
X-CRM114-Status: GOOD (  13.12  )
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

__flush_tlb_range() avoids broadcasting TLB flushes when an mm context
is only active on the local CPU. Apply this same optimization to TLB
flushes of kernel memory when only one CPU is online. This check can be
constant-folded when SMP is disabled.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v4)

Changes in v4:
 - New patch for v4

 arch/riscv/mm/tlbflush.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 0435605b07d0..da821315d43e 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -103,22 +103,15 @@ static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
 			      unsigned long start, unsigned long size,
 			      unsigned long stride)
 {
-	bool broadcast;
+	unsigned int cpu;
 
 	if (cpumask_empty(cmask))
 		return;
 
-	if (cmask != cpu_online_mask) {
-		unsigned int cpuid;
+	cpu = get_cpu();
 
-		cpuid = get_cpu();
-		/* check if the tlbflush needs to be sent to other CPUs */
-		broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
-	} else {
-		broadcast = true;
-	}
-
-	if (!broadcast) {
+	/* Check if the TLB flush needs to be sent to other CPUs. */
+	if (cpumask_any_but(cmask, cpu) >= nr_cpu_ids) {
 		local_flush_tlb_range_asid(start, size, stride, asid);
 	} else if (riscv_use_sbi_for_rfence()) {
 		sbi_remote_sfence_vma_asid(cmask, start, size, asid);
@@ -132,8 +125,7 @@ static void __flush_tlb_range(struct cpumask *cmask, unsigned long asid,
 		on_each_cpu_mask(cmask, __ipi_flush_tlb_range_asid, &ftd, 1);
 	}
 
-	if (cmask != cpu_online_mask)
-		put_cpu();
+	put_cpu();
 }
 
 static inline unsigned long get_mm_asid(struct mm_struct *mm)
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
