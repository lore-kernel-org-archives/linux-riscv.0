Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2093ECD5BC2
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 10:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=py1rDLWD6beRtu4hEaBgK/RutRt1hevCUE4pPPs7Nho=; b=qRbC7laqnquK7R
	mL/NRL1XK616xfztjIp5J7iVlh1A7RsQKw85JMEpgtcMorChEgVmnLjc7DSjrcDzr4SFbVnJ2S7i+
	r4GWeZiYzfpgRSOlFEoPlzGoypfaCITwcWExtlViI5UZCkTDRHwqKid6DuVhxKt8e6pVhuIw702F6
	EAczfhcD9mlks+tk+21GycR1Yq0KRONlq/fXBpoky571cX8uctpZ3hf9RxpPdU1t07G7mJlhCwObQ
	TK2yiZ1CoF/yeoHFqQOGYdLI9HqzT9A02PHTRA0Wluvd8WSEIvWsxVOdcA1etj0fnmUrnkP2lXhc+
	GgeHwGZ7mF6s9b+cHJFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUxB-0000000AKcO-37g0;
	Thu, 13 Nov 2025 10:53:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUx8-0000000AKay-1WO8
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 10:53:24 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7b75e366866so376118b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 02:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763031201; x=1763636001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXzDe/lb8LBcXrcioYpdWFUmDINGA7jRuKL/XW2h0KY=;
        b=Q8fZ0q/xFivBQDH2SbMPicCbegg3lmM+FbyX8IISe0wd2s0V0kVjgEeh6Db2jV6OoG
         QFSeLfZ8Ht8EggOV/CCp38ML1SQwf+XvtQ1WoZPd7tP9P9Tfj/iecWZSmrx3vr2O3QlZ
         vbBIM1lEoLhoCmhPz7v+g01/X+Np6xiDGgYtX07Wn23tVe9Gq/s3G2Fgw79/4hGh288i
         d3fruiee45bfRYRQP6rt8ZeizxaYRtrkzZQJiUFY2ZgqFL08ZX22H0hUk8sGpa1ZfTgC
         g+7BFth1hvBTWsG+BD6DYfQsILv4KCyjZQmA7X0fxTvxasDE+WDf/DdlPKqJarMQsC2K
         /J6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763031201; x=1763636001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iXzDe/lb8LBcXrcioYpdWFUmDINGA7jRuKL/XW2h0KY=;
        b=S9KdGm/cj6NLQ9R67FI4cQTm75EAG862j80rPXFLxcVgealCIl8PxhSbfw/eTKu9WW
         sibunhgsnsgEwdqhItBc/i44wyE1pnfXqRPjGQZ2GJRO2DBm72ypnRuYaeodfB9uEGz+
         SzOO2aJL7j1aqZn/852jZpZTIy9SI7vguqd+cRBZ7wlp+cRibTFeGZzzQLwigqUVoIpU
         MwfPmnQDWDOvHCdUXxfRqXeNuM9l6cGNbRPjW82AHMiLScGvtEMqUfc2WKuuquPd0YQi
         8ur6gIzMilG7uRVHCPxxIhuvlKiDkJ02H2p/0M8b2yo8NKt8GAhLs/DvqQqWddsiDjyS
         ki5A==
X-Forwarded-Encrypted: i=1; AJvYcCW6RYyN91husso6RbopH6AB2kDMjvUZBehhKK3t8DHq1QkGMFirBhBJqrteQFI9zp0Wen0XI79A1cMImw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx165nQLsEwC8bjJfzqu9ZXtA3KQ2uzxJT/bS4Ddl3jruAOGTqw
	kH2sJX+sTRRxdyh7MqQ/nM0egQJoqPdePOLfevIF8GdcMDpbvi8VYq25
X-Gm-Gg: ASbGncsV22vcmRg3N0Gkyck4N6wwdt4o5M6kd4IjZyA+WiL4uaIN/pXQEdab436y1ON
	7hwO381kmh990MbmTwid0PzBavRx46MK8rJeFq95q7N9wM2e9HzYHzfJrbOwEkliB0PQEQySUks
	KQ+OrNF0giNJxtNCiRbDXIcxTYIqSlsQnYQFtgMdX5wxiQ4EVS5dAzdnH62eY19JkVT8mDGMUYC
	/LONf6fjuTdg9xPI1ZxIsCNVBPyZq/w9oEqJOOGifMr/frJE+/TQCSPrL6lM5TlfWzMKekc/DT6
	9zGpJgS41ZEnUyMSK/RjerqWIb815EgTO6+3buOzx7r2UPLVQxrnE/+zmD6nVI0XaBEfjhrtc3b
	rvl+SNjkkIPt6eD/ArO07oFE7ckZt2L5uvnOmWNms+9294eEwJi57IKgGhCp4HDKdI4z8rSBQ4/
	L1/x/zTLZ1UXi1Te6zKZ3rJSiwYflIKQ65VWo=
X-Google-Smtp-Source: AGHT+IGjc7/BLrmluqoR0wCBX6JW+io2uPlNPbBrwMmM01hCccHJSoZKJTWfi0yRonMDUz3bgaA4Iw==
X-Received: by 2002:a17:90b:4a4d:b0:33e:30e8:81cb with SMTP id 98e67ed59e1d1-343dde14c3bmr7915421a91.13.1763031201314;
        Thu, 13 Nov 2025 02:53:21 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343ed4c939dsm2139616a91.6.2025.11.13.02.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:53:20 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	riel@surriel.com,
	segher@kernel.crashing.org,
	david@redhat.com,
	peterz@infradead.org,
	hpa@zytor.com,
	osalvador@suse.de,
	linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	luto@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	brauner@kernel.org,
	arnd@arndb.de,
	sforshee@kernel.org,
	mhiramat@kernel.org,
	andrii@kernel.org,
	oleg@redhat.com,
	jlayton@kernel.org,
	aalbersh@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	baolin.wang@linux.alibaba.com,
	max.kellermann@ionos.com,
	ryan.roberts@arm.com,
	nysal@linux.ibm.com,
	urezki@gmail.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	will@kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 1/3] Make enter_lazy_tlb inline on x86
Date: Thu, 13 Nov 2025 18:52:25 +0800
Message-ID: <20251113105227.57650-2-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113105227.57650-1-qq570070308@gmail.com>
References: <20251113105227.57650-1-qq570070308@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_025322_402146_041A977A 
X-CRM114-Status: GOOD (  13.77  )
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

This function is very short, and is called in the context switching,
which is the hot code path.

Change it to inline function on x86 to optimize performance, just like
its code on other architectures.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Reviewed-by: Rik van Riel <riel@surriel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511091959.kfmo9kPB-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202511092219.73aMMES4-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202511100042.ZklpqjOY-lkp@intel.com/
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
index 5d221709353e..cb715e8e75e4 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -970,27 +970,6 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
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
