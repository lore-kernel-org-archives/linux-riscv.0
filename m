Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEEFC47079
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OKBqdISZt7wenfkAjRwFURyJvfFiLP2kwzSD/Qv1jU=; b=gWtAVw6oPM+c42
	00o6u2k9F/5YR2vzFIAvxo3kXEowA9UajGmQU1g9YSJnJtKGn0JghGgYpqChlMwCfQZtOJS6pYRiS
	etZ8dubQyZv1LGE6C6A+TwbbGxC0TIgdfj32uE/ThFBL8CMbEAobla8dP/baaLX+TUicU1uyHA2VF
	YVh40NTF5fDzk82msvSWjm9SLy23LXJ7vowEY/JKKgSStKisQm7IxlR4rWvp//3EGsHH3p/g5UsgH
	rMIrhrVrWiScLatTjvzQERoRQ6rbJSi41vlpzl/DmFj3EuiqYf++AI2sAVQhbkf2nCPmjvfpYQV9O
	np6oLLFo/xiHTjQ77ptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpV-0098Rr-1d;
	Tue, 02 Jan 2024 22:01:45 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpQ-0098Nc-1v
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:43 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-28c7e30c83fso3031379a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232898; x=1704837698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx1CrYCYqcy0I3lbTucfKtzktUZzOavzb19InQrqEBM=;
        b=ZVGrLTYktJ1QuRtCnWvt+Mkrq07m/WfcVieYa22AI0F/w0fUNnPaPOqP9w2CkEGfrU
         8fINTw4ePn2Pmjlv+E2K+J+1MdvlfaaflfCQ4LFZWb3E/IRoPNi5OtdwYtBxF6S2kM/D
         BZV2Geqdual0itFg6FoIPHf3zP/iS2GZiOgVq4chQL0VrlXWuwWakmR4+V+7y5cNKbH8
         2gn1PpCWcnmDw8tFUHnbcK0OkdBmeIm79rj9vMTYHoc57DQnkwPuiwm22XRw92xU2tOr
         UFSwS8yEQoV5wdhqbx+GPPXO71rNUUuqzsG6cQZ8gwoU6IeaqIitzzcJjyMJf+qTpg8C
         T5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232898; x=1704837698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx1CrYCYqcy0I3lbTucfKtzktUZzOavzb19InQrqEBM=;
        b=f/6u5Ohxm86Pge1ghOTvs3jmYbAPh2bOkLIk/ROMwK6Hcu8COj+PDIlsT1InyxvhNS
         LeFAP+gs02qgzbGttgnaoqaM0G7ZnUbOpU/d9eajhZw3NW4+Vsr9eOLJofb0xE6QKyTH
         8PsD/+CH2DDG3BCMs6PSBZW+K69GiArnjGH6H4zkV9+wPX8qDjcebFfUBd83SE+JPN3u
         ZMQdoj2rESEZqnBE/qCwxezLemr4bZ5G5V3L60dUvsB6l32nT5PvFFIwQUawIjMeUznG
         W7kFXAtsxEw1TTwz7VLe1HXwszPR10lk+wEgH/7McXynz6QHDH1x4NE5zK+Zjq20i+45
         wnmw==
X-Gm-Message-State: AOJu0Yx3xf7CdWdalpcj+gqbPfhMg8+BuqDeTV9jEhZC304AMziZG1DO
	dqARDNOxr/xOhI1KF5txLClufTexEzqIqQ==
X-Google-Smtp-Source: AGHT+IHSNOWtd16BNBpr13f63JilpUsY7HXImYHsivjSF6nbDu6T9MOgsg44oEC59WRv4BX5AKGF0w==
X-Received: by 2002:a17:90a:728e:b0:28c:a9d0:33ff with SMTP id e14-20020a17090a728e00b0028ca9d033ffmr2151486pjg.62.1704232897945;
        Tue, 02 Jan 2024 14:01:37 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:37 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 01/12] riscv: Flush the instruction cache during SMP bringup
Date: Tue,  2 Jan 2024 14:00:38 -0800
Message-ID: <20240102220134.3229156-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240102220134.3229156-1-samuel.holland@sifive.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140140_652454_B6F93B23 
X-CRM114-Status: GOOD (  11.12  )
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
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - New patch for v4

 arch/riscv/kernel/smpboot.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index d162bf339beb..48af5bd3ec30 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -26,7 +26,7 @@
 #include <linux/sched/task_stack.h>
 #include <linux/sched/mm.h>
 
-#include <asm/cpufeature.h>
+#include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
 #include <asm/cpufeature.h>
 #include <asm/irq.h>
@@ -257,9 +257,10 @@ asmlinkage __visible void smp_callin(void)
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
