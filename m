Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3E5C25B79
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SiOHmE8guKj/j4ZqDPf3Ngym0ECtvav5nXYRD1624e0=; b=tkkJnlgU9XMdjv
	XS6dT3HQIRFlLtmXGHIzvTAXo5Lk341XIRHYisZaqwcb1ffD3WwYwQyab/RhnxeFEHpiKR6BDqO+e
	OLY9fsUN8XNVcBQoVfXjr6MUShy0/lhrKs0Bc/ODcTJopQ8l54nuKNAsqtvaav1r8r+eR0KlGNRoR
	sLsd1s5Lcuj+812uZuNy+B8yMGCqZU1EVSB6qv0PwkNfwb1F6g5Q4CqZfnwXltZd6wzQcHFKayVjs
	bUdN621SGa2uvQ1Y/ZrcDvVfk8FW/62kzqdX0j+7rRKQJ0eU5XIxuTiRB/qlP7TgfeAq7DSFt+QY1
	FZc5g5QTmpU0x0Cj3eYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA45p-00000005Z3g-2jPP;
	Thu, 23 May 2024 08:46:33 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA42w-00000005XQ5-2QMf
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 08:43:40 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2e538a264e0so103137371fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 01:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716453811; x=1717058611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8xm4aIfmcPgLaTdq2sWutAdQtLGIZwY55+PCwPzLdWE=;
        b=geyvX5r4o0U/mMd4jpYV5t28kBQFXyRx8Vh5XFavhWAzqsqD1PiHWxYrrUEVSTeHSe
         rj0dl0ycwEuTFByyWekLLerd9XPzcFVv1uxQHXHtV950d1OPkm/3bzb0Zet7gSLcp+9w
         alG7GoVuDdOk8JDjCKQiNnqdQmCyskEtHnXNXefxYW3RHCwJlrtVLXvV2StXM+aV3Z0S
         8bkNUA97ZGepxI4ko1c4/g5cAr1Snj94oPxGrRys91OhtHQRaTMXQ5xw0oRpM23fXGdX
         iT/JEgMEjwKFSqimIGSuJKWQeAtHFaDQgTHAjXogLuFWHIiM3/MKPlfIaykX05IXYwg1
         9Guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453811; x=1717058611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xm4aIfmcPgLaTdq2sWutAdQtLGIZwY55+PCwPzLdWE=;
        b=Wcb965SwBM/TRv+ZfC21Qg0CZgMZhxdafmoaDtPkD3LX8RCCvQ5Ikt6r4sCeRCqGRt
         zxWv3XASzRrEzT7NxcP/wG0wtk3Ca59AfLgCymyyIX+ZzauHXNrOdi8Knxufq5gb5+z+
         rBj3Shq+SCQS9rTdLyXYY9YmJDHjjleHYbdBjYoOAbWuVBlELtdA5iI9+PxbRCUSaX5R
         k0Y2VmsvVwlzHgTEk278pvftkmJ/rN2y4skDxJ/Q7tIeryZu5bvMJLfmoCbAkdtNqF9y
         t2aUIfjyP/onutEyvDYYj9viT/nuPb+9Upc0f9JddxJGiNbDYSZfdCeJ2kZWMaL0qOdZ
         sxZQ==
X-Gm-Message-State: AOJu0Yws8fKx1ujiExcGArNhKSVFKbGe3NSN6LP2vzBRz2d4vihDL05U
	WJr9gEaSwzGnyGpqZ/LGwI0OERkfxnNUCRxuKQXsbMZjKFXKZsFm3ZUhAuqQszo=
X-Google-Smtp-Source: AGHT+IFuJT+Iycu4zUWyrnDMP2GPSB3ySw2LtbIA56wh9nYmdvR4vP/m7p0AEJR7txQa+azNtF7EjQ==
X-Received: by 2002:a2e:3609:0:b0:2e1:ae29:f28a with SMTP id 38308e7fff4ca-2e94959c736mr34882401fa.34.1716453810739;
        Thu, 23 May 2024 01:43:30 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-2e706ee0a65sm19233781fa.112.2024.05.23.01.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:43:29 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH v2] riscv: prevent pt_regs corruption for secondary idle threads
Date: Thu, 23 May 2024 11:43:23 +0300
Message-ID: <20240523084327.2013211-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_014334_828406_33995AFA 
X-CRM114-Status: GOOD (  15.42  )
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

Similar issue has been fixed for the primary hart, see c7cdd96eca28
("riscv: prevent stack corruption by reserving task_pt_regs(p) early").
However that fix was not propagated to the secondary harts. The problem
has been noticed in some CPU hotplug tests with V enabled. The function
smp_callin stored several registers on stack, corrupting top of pt_regs
structure including status field. As a result, kernel attempted to save
or restore inexistent V context.

Fixes: 9a2451f18663 ("RISC-V: Avoid using per cpu array for ordered booting")
Fixes: 2875fe056156 ("RISC-V: Add cpu_ops and modify default booting method")
Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Changes since v1 [1]:
- fixed git revisions in commit message

[1] https://lore.kernel.org/linux-riscv/20240424221927.900612-1-geomatsi@gmail.com/

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
