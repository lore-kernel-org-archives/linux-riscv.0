Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243ECC52D7C
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 23:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xSqZPOif5/Cxsa3e810NOtHS8wYG9Kpg+S+Bh3Uif4=; b=CRvwmp0qqDIf3Z
	i7IRYdaY02Mq5eHLCqMBJMKx0XO4fvaOKcOiEzxM6eBj1M2cKITqRuwDzU5rxkK97N0Hnq8Qp8jQq
	g1Fsvmac3Oemdpiuvoh9H4qdZfI7wW/6fcTZzpLCK/GjeGk65clpiQaoezxukEp0SU7kDy6jubf/Y
	pdTnHmt+RCwXRbR3oGj92OM3W7KZQ4tba3nkHb/RJ8zp5zKTvjwaFGsVDf+hPWMKgJkmE94PxLZpy
	ag1nlYTky1gS/i9OpF3jUiZ1YKqSUHpSfSY0jWSFl4uQq2wvfrBkfvjGYoHGU6Yl1etI4fIZhUsWD
	EPgu61EhrUKuBKefjYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se0XI-000000058fP-3kAz;
	Tue, 13 Aug 2024 23:02:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se0X2-000000058dr-0c87
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 23:02:39 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fc692abba4so51624865ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 16:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723590143; x=1724194943; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IUndmlmZzl2tlMh3Yo+jIlV35FPKi2+kCo1jVfCObY=;
        b=G91FV8j/VtIkAPVFBD3otbET7iWlw53P+t1PkJjjE9ylZKa6JNWDBFjoDgREX7l7ND
         /kI3qze7E6cmkFIVoQLPZ3QpW3+8+F2x7vrWOjbVUTZ0M7kJr9m2+KY2Q8xqyhqH+vVP
         rK+73sXYuuR7VN40GOGUaNtIboQjhZ2KFXfWpSCZHv1e1RHe5hPt0UClho83tmbh76p9
         YM3NSUjS1PWh5A55LplaM9CWPZUHec9/hPYwNOl5B8hYJGDV9FHgsa6ZqyuWx74W5nko
         UA5dH8FMinEF8GxAiPnmW8a/Yz/80RaXZk/VFGtu2HALWwU/GqeOJY9j1RMuhwHzTCBl
         32eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723590143; x=1724194943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IUndmlmZzl2tlMh3Yo+jIlV35FPKi2+kCo1jVfCObY=;
        b=aa8pejrcsjJs70c4nPZoc8xR7E50AV5dHkzSM/RhSn8o1Kv+nbYwC3ynS3VPs2TkUp
         isibnGdKmF++njWTCLSWu3cUe01nQH3knYyqanjFSREKELId/3HFciYt6t5sFPcpmY/+
         /XMyR/ISbDbvklwSQWxkJXRqJrabw9tiOKcesA95Dd3TgDRB8YZ5JzmsSEJ+1OZCqhlk
         rfIOGchp9lRrznQRdvFOATL3xJxk8ckesRyy71PKExPlOp4BhaUMNU2aIyZP9I8ey4l8
         jyEz8IY1Xms4lBpvi5O63q8xTYB+wHitG3d+F9GRFBHMU4onOgGVc3Ud+wSsfMzvinHl
         QLpA==
X-Forwarded-Encrypted: i=1; AJvYcCVGAeO8tIck2P0cuFvuIygtt+tGDgdCM2hBJ6gsix8yiiEJv+4S8Jtmjvgc3P8k3qy9qgBF/kberGblVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsXGLXWvZfYFYAjA+vuFW5+3qDvd1PtSQ9gKTNXciT9wj2H43r
	Bl479H/uCeVP/Rj919UZ5O+Qugtxs4N45XWm+GB4Nx2HGp9IgjOLPUzolTuRUh7QnuTAqBvulmI
	M
X-Google-Smtp-Source: AGHT+IHZrKsit5w7xSudUQbEUYReqqQn1YgN1QevFMTqRHuzKJC7tS9IAzN65JZbLXqBdbKYsF5m/Q==
X-Received: by 2002:a17:902:c409:b0:1fd:a1d2:c035 with SMTP id d9443c01a7336-201d642a46fmr9888915ad.31.1723590143287;
        Tue, 13 Aug 2024 16:02:23 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1e0659sm18522475ad.297.2024.08.13.16.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:02:22 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 13 Aug 2024 16:02:17 -0700
Subject: [PATCH 1/2] riscv: Disable preemption while handling
 PR_RISCV_CTX_SW_FENCEI_OFF
MIME-Version: 1.0
Message-Id: <20240813-fix_fencei_optimization-v1-1-2aadc2cdde95@rivosinc.com>
References: <20240813-fix_fencei_optimization-v1-0-2aadc2cdde95@rivosinc.com>
In-Reply-To: <20240813-fix_fencei_optimization-v1-0-2aadc2cdde95@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Andrea Parri <parri.andrea@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2610; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=/t/KRCtxUOjdtqgOTwia+D8mTRhtgwlB/ao8pdbfRk4=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9rup7/rWhQYedOna+rk5cVYabIzHPq1PYq1ouLvNeF79
 T+3vDPtKGVhEONgkBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCIrFjMydCtumP13P4/a0UfS
 /lsnpKm6PNogaPD0/2RZJhu9+rvqlowMeyPeNHiZbwyV+VN6b/0CuYCoaUmlOQKFl3JKNlncL/N
 kAwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_160224_474220_6ABB5585 
X-CRM114-Status: GOOD (  13.94  )
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

The icache will be flushed in switch_to() if force_icache_flush is true,
or in flush_icache_deferred() if icache_stale_mask is set. Between
setting force_icache_flush to false and calculating the new
icache_stale_mask, preemption needs to be disabled. There are two
reasons for this:

1. If CPU migration happens between force_icache_flush = false, and the
   icache_stale_mask is set, an icache flush will not be emitted.
2. smp_processor_id() is used in set_icache_stale_mask() to mark the
   current CPU as not needing another flush since a flush will have
   happened either by userspace or by the kernel when performing the
   migration. smp_processor_id() is currently called twice with preemption
   enabled which causes a race condition. It allows
   icache_stale_mask to be populated with inconsistent CPU ids.

Resolve these two issues by setting the icache_stale_mask before setting
force_icache_flush to false, and using get_cpu()/put_cpu() to obtain the
smp_processor_id().

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 6b9391b581fd ("riscv: Include riscv_set_icache_flush_ctx prctl")
---
 arch/riscv/mm/cacheflush.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index a03c994eed3b..b81672729887 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -158,6 +158,7 @@ void __init riscv_init_cbo_blocksizes(void)
 #ifdef CONFIG_SMP
 static void set_icache_stale_mask(void)
 {
+	int cpu = get_cpu();
 	cpumask_t *mask;
 	bool stale_cpu;
 
@@ -168,10 +169,11 @@ static void set_icache_stale_mask(void)
 	 * concurrently on different harts.
 	 */
 	mask = &current->mm->context.icache_stale_mask;
-	stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
+	stale_cpu = cpumask_test_cpu(cpu, mask);
 
 	cpumask_setall(mask);
-	cpumask_assign_cpu(smp_processor_id(), mask, stale_cpu);
+	cpumask_assign_cpu(cpu, mask, stale_cpu);
+	put_cpu();
 }
 #endif
 
@@ -239,14 +241,12 @@ int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long scope)
 	case PR_RISCV_CTX_SW_FENCEI_OFF:
 		switch (scope) {
 		case PR_RISCV_SCOPE_PER_PROCESS:
-			current->mm->context.force_icache_flush = false;
-
 			set_icache_stale_mask();
+			current->mm->context.force_icache_flush = false;
 			break;
 		case PR_RISCV_SCOPE_PER_THREAD:
-			current->thread.force_icache_flush = false;
-
 			set_icache_stale_mask();
+			current->thread.force_icache_flush = false;
 			break;
 		default:
 			return -EINVAL;

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
