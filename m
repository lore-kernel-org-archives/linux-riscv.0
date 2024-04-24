Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9169EC10F15
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 22:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lbZdzH+Q7WYLj2Nb2qV9WUIcA5SDuL0cFpbMMxpJtTs=; b=eAN+r0/9Gso+Df
	ilx/ri3ZLQGO7oPyPjfSFon0lDaxS840F9sqdebe9nkDUv4yxW8woNP6Cmj5iPTnTnOJUaJMgPuDB
	MYMzRoQASGj/ZxEOAnAK6XbB9MsLWwA5Ocm75Qy9Zjs6mvsSmZ3xr6RZjNnUkyu92FwSadzDyreX6
	/Ct/fLsoPYlHqZ0CXOgSFy43AUfMn4LY7Ly6jhrW7aS5kFd7KXuiWYLJepolPiAnoonF0uj74qQPG
	Zcw7PqTf4jXQHNXRKND7B9DY4bqfFyJCO8YbeGSbz7Oi/A4IVx3pWUwMLzA7vcXjQb3syhTivjAtr
	NNjFTQH7MQXrRpo6qxBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzkxl-00000006CyH-2m35;
	Wed, 24 Apr 2024 22:19:37 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzkxi-00000006CxU-2mTZ
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 22:19:36 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-51c077cfc09so377713e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 15:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713997171; x=1714601971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HxC5tDixGsflPbP7uA430prm84oMAe+kycfsZkJqpDk=;
        b=kt9UmmIB1Zy9FHScXSMpJf0RrxqF6u94NQKCQQ1bfKnMy4a2wkcTITaSErLTbNOZKG
         rRDEWHX2roI/mKMy4Y/algT8bDwG/v/5M/tqucA5Bzg9E5puWWuUinVGOUlIJ1O9AFSO
         0dBsKJVCxAqujFP4mwdQGDOXMEu0+coa3Izy4rw4MSBnTqZ1beRXvWes4T+AzI05ND3y
         Dzeyho3jTReGB7N5SAjNEIqtRnTlCECaEtV/wpOUAqXVdBiKgw4+D/O0NfJ9+BBumDGa
         UZlu2F8vFghUlRpm0gA5wlQeWzKZ0WrFqmbNvGYOvsAEdxeGrQP2FPXU7TKFF1gFrcpK
         2KWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713997171; x=1714601971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxC5tDixGsflPbP7uA430prm84oMAe+kycfsZkJqpDk=;
        b=n7PxzgMUungNceo8UA3thUfscNkTOvjxSzaiRTgyqWs9AFYR4Jj0wAiGgIZO5btT5Z
         r/Gcp9L+8DTs7yKRBp869Nk1qszaO/X6WWtG4c8DhFhTsx7YRH9pYt8AHckmx4HRaEpC
         5EZ8JE/qgqvDG+L9vccbL/8zbU8oamLDSk91eSuxSlLrPVxLIgUTJAkMU7vUShqg/pxd
         wxOUQnRybFAiG5HMpCk+p9TJ9rdA5EhttFURhtwARbIarfOUWvRszjHluZ4ozYusAFE0
         z+rHGAHa89aUC5MdOB/jeNOUnlst3pkyyDy7o5t5DqXvwiRSbAPZH1UJOJTeJHJkdY5S
         X8fg==
X-Gm-Message-State: AOJu0YxKJGG7mj4T2QzsGrSIyoPuogrqP7oqcZn3x96QAOaf0JEiC5g/
	RR0IVGuNs9IwctTLgdIOIPgCJYiJliLm7O4zRmFDNjzWP9ZZeSOc4w33Kg==
X-Google-Smtp-Source: AGHT+IG5W3EGeFTkrBzRwOpnnn57AeTDTVI9l6YfFfDluNTFREnmF7gEaMGlb5uJSfc9iyC7n2M6+Q==
X-Received: by 2002:a19:c20e:0:b0:51b:59d4:dead with SMTP id l14-20020a19c20e000000b0051b59d4deadmr2502399lfc.39.1713997170490;
        Wed, 24 Apr 2024 15:19:30 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id k8-20020a05651239c800b00517746176ebsm2543757lfu.49.2024.04.24.15.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 15:19:29 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH] riscv: prevent pt_regs corruption for secondary idle threads
Date: Thu, 25 Apr 2024 01:19:23 +0300
Message-ID: <20240424221927.900612-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_151934_729979_8F686B3E 
X-CRM114-Status: GOOD (  15.08  )
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

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Top of the kernel thread stack should be reserved for pt_regs. However
this is not the case for the idle threads of the secondary boot harts.
Their stacks overlap with their pt_regs, so both may get corrupted.

Similar issue has been fixed for the primary hart, see c7cdd96eca29
("riscv: prevent stack corruption by reserving task_pt_regs(p) early").
However that fix was not propagated to the secondary harts. The problem
has been noticed in some CPU hotplug tests with V enabled. The function
smp_callin stores several registers on stack, corrupting top of pt_regs
structure including status field. As a result, kernel attempted to save
or restore inexistent V context.

Fixes: 9a2451f18663 ("RISC-V: Avoid using per cpu array for ordered booting")
Fixes: 2875fe056156 ("RISC-V: Add cpu_ops and modify default booting method")
Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 arch/riscv/kernel/cpu_ops_sbi.c      | 2 +-
 arch/riscv/kernel/cpu_ops_spinwait.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index 1cc7df740edd..e6fbaaf54956 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -72,7 +72,7 @@ static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 	/* Make sure tidle is updated */
 	smp_mb();
 	bdata->task_ptr = tidle;
-	bdata->stack_ptr = task_stack_page(tidle) + THREAD_SIZE;
+	bdata->stack_ptr = task_pt_regs(tidle);
 	/* Make sure boot data is updated */
 	smp_mb();
 	hsm_data = __pa(bdata);
diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
index 613872b0a21a..24869eb88908 100644
--- a/arch/riscv/kernel/cpu_ops_spinwait.c
+++ b/arch/riscv/kernel/cpu_ops_spinwait.c
@@ -34,8 +34,7 @@ static void cpu_update_secondary_bootdata(unsigned int cpuid,
 
 	/* Make sure tidle is updated */
 	smp_mb();
-	WRITE_ONCE(__cpu_spinwait_stack_pointer[hartid],
-		   task_stack_page(tidle) + THREAD_SIZE);
+	WRITE_ONCE(__cpu_spinwait_stack_pointer[hartid], task_pt_regs(tidle));
 	WRITE_ONCE(__cpu_spinwait_task_pointer[hartid], tidle);
 }
 
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
