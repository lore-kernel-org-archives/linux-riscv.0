Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B02CD37B1
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 22:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G7isfOms59AYjGadPYdFRNxeSq6uwISaRCa/jn9btIA=; b=R83MzZsoCsxm1+
	NxXZNfvsRGb8XClcb34g6A+jyscxMLVswarCK6BFckBP+Db+0DXRwVrsb/AJHw7st/RHCGu6iEOYA
	nintkkjBZQTviw4WYcNJee35KLVVqU8uygYmU5WJsHaJ43BzdHOxBv9WTGTrgUdj2QGwMIe1tZcv0
	ZQ7/eyXTbasdtqN5mQ1hRi83vJgyExhT6QrgAJGsTV/tiD/zu84Wla1qnXAZcE7qEQpfAIP63cbGv
	PCqL77gXX3uSacf9UFLoe7fwA+/lOnvDJspRVbLkJ0WLbYEwl5tIAio0dtPsfEqVKwxKHdyx70Yf4
	IMMW/SpHCx4LXdEdRp+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slcOA-00000002Ene-2FgB;
	Tue, 03 Sep 2024 22:52:42 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slcO8-00000002EnI-0J1Z
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 22:52:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-206aee4073cso3657785ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Sep 2024 15:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725403959; x=1726008759; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lZ53qy9u+Z9FvKtKiYbSHpKJar2Bzy6zkKwdYDcaxRI=;
        b=JeVCn//7Iq22MxupuAj2Fi1mkfjCSDAuIa02cEQZP191hPfCaY/BB8rKGXm+xJ4Ua1
         Vs4tHykZTTkKgJJFYRM2E1CzCJF9G65S37WZ+XU9Z+A9tfeGWz0UHMhuTPi3F++PvfHb
         c+NHnS2sZlyAsmMrAmiy732DrO4P9JAcPOTKyHPvGCqLFZM2jPsFiZ69SDc+z7Orf010
         cO70i7+TV7iDjqG3ey7FzksHPLh5i6Y7Y0a2QdycoWBkQ2cUDTEOTml2rwQ5WJmPDZuD
         ZBXc+iEijqVy7dD5J6LElnPuhqqK3PLqoUHqvpt4KM6xaJsrfR4LI6b310gYAxCqCGkP
         TVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725403959; x=1726008759;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZ53qy9u+Z9FvKtKiYbSHpKJar2Bzy6zkKwdYDcaxRI=;
        b=cP9oapFDGPRircNVQObs+YVwYATRUBSJ1Lr60zskJCSfCGgRkLU2xvYz4KJOnbaJdh
         e5e1k8adFMrPh+GzFG4RvosfWr13ORaGkB/HDdgYXToydBeUeSDL8XR1V3DOhj5y8kVL
         Qh4Iah673B3jF2xc8xyorKnsZeyGHqkXELZVvVYNHeXatAFAb3isf/LdUbrM86vPe6P6
         xR3/O4zp3n1hNy0MysTf8ToibKeIg+g456+shhV1MGN0olNgHwk1ucjV8Bf4lATHDNTD
         ge8eVlZYVjK5MvIqHc/63zNk1aEqZy8b09js1UDkOPv+HxYpqSo2Jy6x+Kr6gfEX51KK
         LwlA==
X-Forwarded-Encrypted: i=1; AJvYcCW8GqmcYzHuUrUIy9WcauPb9WL39ezfhr7ZNbXrIO3CPwhddgebpibZaVJKkl4AvBtpInV4knHuziaHAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFzu1P5LHQbyL17pF2pTGTRzmQFTGD1FTPYoozOm81A5YLc0MB
	D0r+dJIQiFWTYuDG2Pvn+QqIhX4oxugywMOLHeUNC7P2wEytZS+NkSmb005Bsrc=
X-Google-Smtp-Source: AGHT+IF8A15Mix+1zHN6ImpXiusw6agLPCqjlEwFi3BIL+tJMr9zxAN5hukYaaXfepI3wzeUzgOC7A==
X-Received: by 2002:a17:903:32cb:b0:205:88ca:9e24 with SMTP id d9443c01a7336-20588caa05cmr93509755ad.19.1725403959355;
        Tue, 03 Sep 2024 15:52:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae913b24sm3207605ad.12.2024.09.03.15.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 15:52:38 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 03 Sep 2024 15:52:34 -0700
Subject: [PATCH v2] riscv: Disable preemption while handling
 PR_RISCV_CTX_SW_FENCEI_OFF
MIME-Version: 1.0
Message-Id: <20240903-fix_fencei_optimization-v2-1-8025f20171fc@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIADGT12YC/x2MQQqAMAzAviI9O6hVQfyKiIzZaQ9O2URE2d8tH
 gNJXkgchRP0xQuRL0myBwUqC3CrDQsbmZWBkBrsKjJe7slzcCzTfpyyyWNPbUztu8o6QmyxBa2
 PyKr+52HM+QPabkXyaQAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Andrea Parri <parri.andrea@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2866; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=CB8edBfcGqRK+ymTERIGqlxIoQY7nhBdPrqLUxfx3VM=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9r1yabsibc2PpC8Fz5lTtuBLqdHkUsXmhe4vWxTtzHuP
 29Zx2bdUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwEQWqzP8M2FReK927GdObf7r
 u1d334+5mrFDaUvYztKb1VysFgs9NjEyvPF5wKlToPzt8vy12h8ZDXZUfJ5zeYUS9/7LL77yev0
 24gcA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_155240_150672_108ECFDC 
X-CRM114-Status: GOOD (  15.89  )
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
Changes in v2:
- This patch has been  split into a different series from the other
  patch in the v1. This patch is unchanged.
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

---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240812-fix_fencei_optimization-3f81ac200505
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
