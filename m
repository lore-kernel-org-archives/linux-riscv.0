Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1058DD5B16C
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 19:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjyMYHQZMWX/UlM3vqdMWApSlIsItBcLYDB6lyA3qRE=; b=uTAx3+VLkbdrLr
	hBUu5Wv4adSMwGdhwmCtyfDjuE2WosyNb7kcbdWx83QLh3yHS8KVKdEDo+3ZK+rlt43rU1kN9OmpK
	rBVSSsWZpZ67XAytO8dUEj40Xz/39vC9JTE6+4CkoSBiLk3q1uiIhFOTaABVeZ3jDznT0WzjFs8Fm
	ws2wnIKYc7EGwNRrGckUA1GpyPNheSfCwsgEIrTrMtOe005p5dryyR0CH/a4rJBIKdvK+9/iOqlw5
	jDzrEokn6KV8dsKK4LfkgZska6/EGrCxUynvlm6AU/6vqmMzc7QLsQwlrI0DxWYgA7Vruqk/Ti7ef
	e9Uhkv+oJssg/I368RNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUrTc-00000002fit-3fxc;
	Sun, 14 Dec 2025 19:09:52 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUrTU-00000002fhi-2UH1
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 19:09:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a0d0788adaso3696685ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 11:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765739384; x=1766344184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGRylMipBCZAbafLrwEo52FEPB30FFq/2/xIahus1R8=;
        b=eBq4K64Q3VSYREb1EfkE6QYOI5GDgrcWpbodkdtEBTs/Ycyal9PJOH/+cnSfzTWcue
         1f637Gl9J+90q2dL4qQumwwu5qdM74z6NgMc6BJIx2YfiTvMWeDcOz9icpxKn5Pl2vBu
         z4A+ADLYAsvOWSXtXczsvGispYxFEVo0us4yMcqS3jCjeswoxJE9rzGDzFK9Htw50UaZ
         j9wItQpUajs/GdiUwxw/iDfR+F6bKnDefY+uI/VOz1KUWQeBNZTEclViTZISMyXoKGbF
         Wl+jUYNZdwApHF22IegvSMARCSQ+f29WFnSl+0xdWpFX9MP/U2m1rYZr5yjeABpjuGMr
         Fqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765739384; x=1766344184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kGRylMipBCZAbafLrwEo52FEPB30FFq/2/xIahus1R8=;
        b=Rbbje2TGQk10Co4NZRMtswajPOekQMLfdkRgZgAnWwGIQFVy1SKfJmHIo8N7KC0NLw
         LU3hwOYNT0WBCbKsrPEOF2wJhlphlVO1LcUUfrGUixgInwnp/78THwd6IfVPkANrak6p
         OiKgB/YOXZ4eHgndusQ6E+YtblOTT/0C9lYYS+nSEPpp/yuRcSxXg/cPe6hSbHe5T4Er
         /EtT0sCaBOoTE2jhcX4Q6dDnB89uSVxdF8eBvJ3Qa0+gty/X1AwJeQh8avWNAJ19nSdm
         kEhfNafB/uFrAzxy0Vy4FLtu84RqRtnKuS9L4xdCKrsxT1tlUrh2O5vPyZcEx6dhfIJC
         4izA==
X-Forwarded-Encrypted: i=1; AJvYcCX+/61BquTJkDbjP/e/7bE0lLsjqPvg9gFzzxRV1uHAK3IRZBr1aZ6hKJXXKtKG6mbCCk8eYi5VNx7EhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw824L5x6tJpJuAM05qRt9PThBG2Tcs+bOm7vUSfxMVG48cHGMH
	ZALWL2xno9utskoraD74azWuAvfWtcJlsQSfTPLjFCvYsKcY+lr70JBg
X-Gm-Gg: AY/fxX5QH0hefPK8ElarPeGu6ELZNn/b/FX41JxbN9tQ95TNBk9JaEWwH2kqRhJkfzk
	tu9LLEMcbpqouNyNHel9F3vAKF7gbUTsGYWBaYVISjJLcdyXmAWkEnKlfOZ5NhOPhLe7i2xMxu5
	vOMKwZ/G0KOlTvmOOWqDE3iZMFR4vU4XFtxDkR5EUplx5BkrUZWbdjP1lNm3CbJ53oOgWorwPUx
	pwUvpgI2ZCHL7qr4ZTvxM3hdjoqc7Z158yl9yi6NeaIiU/QpKSjNw5raiZkH7rU/QlgINPA9WH3
	cJQbGRGAEv/vrV+m58p7qzZVxs/xVfdc+FZVfwew4VbywH50XreK9PGeF1DNAY1iPhEQaoDxdv1
	HbUWOJjnfA+GVDQ2Y8lsy0egGj4C//NNAKC+t/L/RIDvsXmpTy4vJx+Y7Oky4pf6Vo9Dg7d437+
	bkUCrml9Seh7Wc8rgfOEdkdheP5LEaSOU=
X-Google-Smtp-Source: AGHT+IFmYzgXFHkbQBQiUvnSACzpFFy+PJ8dOf4i/6tp+rBdDj8hhEPW3StEcaOty+tMnp+I1Z9nyA==
X-Received: by 2002:a17:90b:54c3:b0:33e:2934:6e11 with SMTP id 98e67ed59e1d1-34abd7f7a9cmr6658481a91.11.1765739383476;
        Sun, 14 Dec 2025 11:09:43 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe3a1c5esm6909062a91.3.2025.12.14.11.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 11:09:42 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	peterz@infradead.org,
	riel@surriel.com,
	segher@kernel.crashing.org,
	david@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	anshuman.khandual@arm.com,
	aou@eecs.berkeley.edu,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	irogers@google.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	justinstitt@google.com,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mingo@redhat.com,
	morbo@google.com,
	namhyung@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nysal@linux.ibm.com,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	svens@linux.ibm.com,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 1/3] x86/mm/tlb: Make enter_lazy_tlb() always inline on x86
Date: Mon, 15 Dec 2025 03:09:05 +0800
Message-ID: <20251214190907.184793-2-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251214190907.184793-1-qq570070308@gmail.com>
References: <20251214190907.184793-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_110944_659418_CE39875B 
X-CRM114-Status: GOOD (  13.60  )
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

enter_lazy_tlb() on x86 is short enough, and is called in context
switching, which is the hot code path.

Make enter_lazy_tlb() always inline on x86 to optimize performance.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Reviewed-by: Rik van Riel <riel@surriel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511091959.kfmo9kPB-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202511092219.73aMMES4-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202511100042.ZklpqjOY-lkp@intel.com/
Cc: David Hildenbrand (Red Hat) <david@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/include/asm/mmu_context.h | 23 ++++++++++++++++++++++-
 arch/x86/mm/tlb.c                  | 21 ---------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index 73bf3b1b44e8..ecd134dcfb34 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -136,8 +136,29 @@ static inline void mm_reset_untag_mask(struct mm_struct *mm)
 }
 #endif
 
+/*
+ * Please ignore the name of this function.  It should be called
+ * switch_to_kernel_thread().
+ *
+ * enter_lazy_tlb() is a hint from the scheduler that we are entering a
+ * kernel thread or other context without an mm.  Acceptable implementations
+ * include doing nothing whatsoever, switching to init_mm, or various clever
+ * lazy tricks to try to minimize TLB flushes.
+ *
+ * The scheduler reserves the right to call enter_lazy_tlb() several times
+ * in a row.  It will notify us that we're going back to a real mm by
+ * calling switch_mm_irqs_off().
+ */
 #define enter_lazy_tlb enter_lazy_tlb
-extern void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk);
+#ifndef MODULE
+static __always_inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
+{
+	if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
+		return;
+
+	this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
+}
+#endif
 
 #define mm_init_global_asid mm_init_global_asid
 extern void mm_init_global_asid(struct mm_struct *mm);
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index f5b93e01e347..71abaf0bdb91 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -971,27 +971,6 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 	}
 }
 
-/*
- * Please ignore the name of this function.  It should be called
- * switch_to_kernel_thread().
- *
- * enter_lazy_tlb() is a hint from the scheduler that we are entering a
- * kernel thread or other context without an mm.  Acceptable implementations
- * include doing nothing whatsoever, switching to init_mm, or various clever
- * lazy tricks to try to minimize TLB flushes.
- *
- * The scheduler reserves the right to call enter_lazy_tlb() several times
- * in a row.  It will notify us that we're going back to a real mm by
- * calling switch_mm_irqs_off().
- */
-void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
-{
-	if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
-		return;
-
-	this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
-}
-
 /*
  * Using a temporary mm allows to set temporary mappings that are not accessible
  * by other CPUs. Such mappings are needed to perform sensitive memory writes
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
