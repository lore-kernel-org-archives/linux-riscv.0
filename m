Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0CDC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 04:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tu5VeRxAcBXL+A7zvKZWAWq/LOErTxqYVBjqZCPPAy0=; b=iaBapHhMX0jL6w
	0slL16C475econOp9PvPOIQoOkw4cjQFYY8svifYlXn15Gwqs6QesB0ZWfpbugC1EZWd1ToIJBFkD
	7ZGP9egafNwQxkjf2IcXWL+VoPr3Amy8wahgMB4VDXXhH1yQey8SZbJvZ4pl4dmnsOlm2WXG6rtDV
	FkDaDy2bvP1PzJzCB3SODT5KBHNSdGuRNRWhqh4HHvHLZkOlPAggZEsRmV8Oun1QD22QTkwsfasUQ
	kftoil84/TTByTeFLAUVMg1vlf/W7d9GXwPK40zH8gb5WolpPX6yADRfMxg6CgRKigDWGxqcffQyD
	m7/orb5g5vZZKPNeSocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFR-00000007S5Y-1Wfw;
	Wed, 27 Mar 2024 04:50:49 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFM-00000007S22-0tPW
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:50:45 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ea8ee55812so3848592b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515039; x=1712119839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shQKeKcQeNJUU/JQ5KWmpXdfmdrhkhe16Q2MMRo9oOg=;
        b=M+2Ek6SUbsjhve0zlKtSKCsQFEFr4YxFie/LxO9WwQVwaTHHo46xt34FR7SGELq37Z
         QUS50fjtiid197YvyaoEyWWPlEdgWftMNPx64lWNf8nu6PaoqhwIjpYY76LQoW/RvAvU
         9nqwNURqHReY71WFVO5k7XnITYIZvL0gXhRmDz19ZXc83CRF6lzFh1LPGzZhiYgRlcnV
         TU52izChvtHVXF9EHNdWYOU9h/xJO2ythCFjH/WVtGk1dhoES3yoTJZvKVkKJdRvXljG
         YtBXAjeTYCmlLkLbbhAzg4x46BIsI2Ad11ia1fTbk7HNRD94I21LsuIbjeZVUvSw9Rgj
         VkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515039; x=1712119839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shQKeKcQeNJUU/JQ5KWmpXdfmdrhkhe16Q2MMRo9oOg=;
        b=bzr4e06vZ1IoTXnrOTbBcEf31jfthPOeMHG21bCxT0qA2QsRLkaUSKWKEuX5fDLPG3
         4URQrFlAbchA7DGPG9YYYJ8z7CWMJrf1Nlqfrrj6ZIm9ZJqskAMyRiXRPrmL6vL3e7ho
         DgDbImwOV2CnnDyTmDYmwn2uEom+LpwYRmj31xgQMX6Oe6XNnNExGe5Cb007zehxccYN
         erFcSqIibF+0hz+zVcwsSHyc6xa48PmO7cenmsLg7R+uZUlGO/lXVMVZJFu2Qj8kS4RX
         twRNtr+cuy8V1Xwao78VghvMncrYRte1seaFk3ubgWRPAh0/jJ4ZN9TiBrzyT6f0HMyo
         Aceg==
X-Forwarded-Encrypted: i=1; AJvYcCXUAQR5XTny7hiCIEVjj5JvJJyyHBOHDs6dl4HhjOWyFd3LTYmkXh7LILJC8v6Z3jAZsjwJgRmL3JD7DExbYM4h35T7llsL1xIqJOyABEeW
X-Gm-Message-State: AOJu0YyrnhfKTSvuDQ7RB/ytfnnQA/rRMB4FZg320W5xA7GRsQiFXTqt
	WcemMM8iTtP7Noo7dXALBDbATPUHA42brUx5sM99AnGGFbQawk/wTdO7AKHGwA4=
X-Google-Smtp-Source: AGHT+IHpHyQ5wkbbDg1/9QOIdZT7U8XEUGKwcMibXVBUL9WTi2GIa5kveh+VvtS/wwBFRvp4M1UHpQ==
X-Received: by 2002:a05:6a21:164e:b0:1a3:4979:f25e with SMTP id no14-20020a056a21164e00b001a34979f25emr128528pzb.59.1711515039607;
        Tue, 26 Mar 2024 21:50:39 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:50:38 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 01/13] riscv: Flush the instruction cache during SMP bringup
Date: Tue, 26 Mar 2024 21:49:42 -0700
Message-ID: <20240327045035.368512-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215044_308267_CEAE24B7 
X-CRM114-Status: GOOD (  10.73  )
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
index d41090fc3203..4b3c50da48ba 100644
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
@@ -234,9 +234,10 @@ asmlinkage __visible void smp_callin(void)
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
