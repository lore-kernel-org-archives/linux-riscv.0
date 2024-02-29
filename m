Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EE8C54798
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 23:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69nnaKqoZG6dYszstJGNtgfKFYNnqDQCs+OK7icrQkw=; b=YVI8Nm9TyYORRk
	t8PQHHNPFWOSc4Ivr5ApSvG5ToTUxlyGp6l7aebj9Oxhalu93peshCMayJe81tkM2JOsBs+d9blW9
	mKCbej9ev/msr43q0Cef+u2Xfo1gvUMebwqAgP0dNwb4RzYK7XB36KZYZlWDfvfA4m+OI+KfDaxdC
	vGoKMfa+BB8Ivz4szeEFt1jOVzfLN4WXZoByewAUDt2k+0yQP4Dx2BYqb5Gy2Rxtg0qEk39e+r5Wq
	BOzjDxqZOjHdiZ7Q7gSlsdla6BbZ0OTtT6L855P3aU5AnLlOFbz0L4bise3daY+MkEBQGd7oFfpv1
	CT/Va2h2cxd1A0ZonE0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjG-0000000FZub-2DvD;
	Thu, 29 Feb 2024 23:22:18 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjD-0000000FZsa-1K2i
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:16 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e4e7e25945so1258941b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248934; x=1709853734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O37VWqG4iCvkiZDgqVtP8oElF9rd1vMtEBQWx77Nmx0=;
        b=RQhbXieEgbMXntbFuRojyfTIiFTnB9ALa39+X/o1u6o0eHtS/TXMLUe1PZ5SdihWOM
         X9rhQpEhOmYlP2q4LVra18WhnBMRax5WhZj9qB+9GCeCW9FmrJOQ2EuZtrFwhosv6fsi
         MvGqM0AvAbOvUKv1ktJs2svzTUxhC9yRUjyIde2qxz0moxUrgmiQoygMato4Ir4Mx3qA
         5K6W4QfKettcD/xcfcOvwU/TGSTWVVeHXDXngv+rYn4y4/IQhlYb3AO3A07urFKDpYdG
         kQzFG3tHNII6ETKS/LFQjFwESjEEH1KNhBUM6suCt4cwA0BXgZC7MnBmcPVzb8nmPsEE
         NnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248934; x=1709853734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O37VWqG4iCvkiZDgqVtP8oElF9rd1vMtEBQWx77Nmx0=;
        b=ce8dkSUizzCWCUT7iXK2nWU3Z/3Uk3rOazwy6i+vL58w514u1DYMKaALr9zdQq7Tu0
         KL0Cm89ZvQ5Od7Eub+3VtxzT6/G/n3IhVZjxjX2PP0jlJIrw4qK3nv1khDTj5RTU6nIf
         dVOJ+scLK5dFi2xMvctuhepxuIDHeHZun9/jM8AEh1Sa6XUdgkxwYWRlTSJqDOvh2XaR
         lkq6M4XF9SDYItB6ArBdoTMIxkTouQxW7I2Hj9GaSkooT4RBMnHQY/fiTudZItT4ifQu
         5Tn/hQk0DShcN78+d+1QsQs4hIgwUozV/ICRzzSCOIzpYamwp/AIIbTU5GIDCwAS31yV
         46kg==
X-Forwarded-Encrypted: i=1; AJvYcCUDRVtsQ2QYdmMz3TkxgA/NNBZnxq1CsgMY3Lq/9yth92Q8IaoOZ2U+iLALD1gxtY5SVkbEl+MAQIVUNt7cR8qCIL7CuA/U9dgSM+FrabFf
X-Gm-Message-State: AOJu0YxrQPGxiT0kDcIfbjfAB6+/g3l71YCTNfL/XwUCOWcw/HnvfiG1
	chYEMore75yp0CpCOH0kR4kJ0PfXwR1WefVgADzHmCavprM7nAuq4H+80tGMQso=
X-Google-Smtp-Source: AGHT+IEXcsW9CGPGmNlysP87xM+KqyMeGQDT/2i2zpW2/RfnrP1VyWuH3lyJldn2H0bz6i0E+Cfqiw==
X-Received: by 2002:a05:6a00:2d1c:b0:6e3:fa52:2f26 with SMTP id fa28-20020a056a002d1c00b006e3fa522f26mr168419pfb.8.1709248934208;
        Thu, 29 Feb 2024 15:22:14 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:13 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 01/13] riscv: Flush the instruction cache during SMP bringup
Date: Thu, 29 Feb 2024 15:21:42 -0800
Message-ID: <20240229232211.161961-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152215_410149_B1496A62 
X-CRM114-Status: GOOD (  10.25  )
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

Instruction cache flush IPIs are sent only to CPUs in cpu_online_mask,
so they will not target a CPU until it calls set_cpu_online() earlier in
smp_callin(). As a result, if instruction memory is modified between the
CPU coming out of reset and that point, then its instruction cache may
contain stale data. Therefore, the instruction cache must be flushed
after the set_cpu_online() synchronization point.

Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executable")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v4)

Changes in v4:
 - New patch for v4

 arch/riscv/kernel/smpboot.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index cfbe4b840d42..e1b612f37dd9 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -26,7 +26,7 @@
 #include <linux/sched/task_stack.h>
 #include <linux/sched/mm.h>
 
-#include <asm/cpufeature.h>
+#include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
@@ -238,9 +238,10 @@ asmlinkage __visible void smp_callin(void)
 	riscv_user_isa_enable();
 
 	/*
-	 * Remote TLB flushes are ignored while the CPU is offline, so emit
-	 * a local TLB flush right now just in case.
+	 * Remote cache and TLB flushes are ignored while the CPU is offline,
+	 * so flush them both right now just in case.
 	 */
+	local_flush_icache_all();
 	local_flush_tlb_all();
 	complete(&cpu_running);
 	/*
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
