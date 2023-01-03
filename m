Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9EAC46467
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bu3oMyfmluCF9UekTetfiN8jn696rXuMGXJHNcESZE=; b=GouHu6Eg0wWWP7
	ZspekDVnHzPYb2FmpK7+g0p3olOMcTRNJfRog3kUvJ04LxKOlm8rKn2Fn6XasULhJwLUxk3Luqshm
	wfvv/2bfZ3asqU3rz8NJ7jAL/vm02s1dGxsvVSuU3HQZ7hsfWp61COAy2Z0r8LB7Ay0tTrcNRr3mW
	DFZJrm63qBoGV/ox/ruvqokB3zS8NXtWKiuTuXXEHXR8VMVfIrOvoD1T7my8hxftehu9XITe2ozJB
	xPUJ6POMeufhiaRO1NhfY3Hh5drvOTvzGK8D+6EpNAvCk7y8Ic6usH9A5loRq2z8g3Vxutse2EjNf
	bKsEKRsFnazhglNilKww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkjj-003EOW-Vi; Tue, 03 Jan 2023 17:06:04 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi2T-001qx2-VX
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:13:17 +0000
Received: by mail-pj1-x102f.google.com with SMTP id o21so2863144pjw.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0l+i8uOcQCPjKaNrtjuOObll0B7/vooLhOJlMTFIbSo=;
        b=gBGy2J1w2sNV+FKC+CwdJral87hxtnjAvNKrX/I7Kx9XxFh1Rv51fQJYZ54uQYIS4B
         1tNxT5y1i3npT2XnNuRbkMyEQ6UCS60F7ECqvYbv2KKfqlDRWssFgN13KZXsyCnuVW6h
         ac5+UnnYYm1V6/zMXBm26gN2RzGkXdr9TNei2tXCQozIE6IsXk4lhqtYmMGuHOn3Yc31
         OzBdso1OdRcYYWVh6/o8XyArpoMuNJr7DRn1HXlWRCOhHMZLolGVNoF+0SwtbCopui7q
         FqvYYrBqonmUg1ooGXM9ltL6E42vT+Q+jZm8lFncGX3YoCneec+V8bs0a9pHM6/TcMNe
         F0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0l+i8uOcQCPjKaNrtjuOObll0B7/vooLhOJlMTFIbSo=;
        b=E2R6tf5V2JSJiMfSRxQGGX7g2Rf3CGZo++ABQKRlsXNU8QM+3ZM79tMQyZhNeO5Rx1
         2O2Cm5u91Th/fxjF5Z08S+NibSfhprDixjX7PmqkCbbwrEY+w82ob9atPpd4tqPb61iN
         NE+yLRS8FIov1WVninLjIVn0DEYzIdv4MXw4cysMu06loYDcKYDGFNZJPUr/bdCrUtkQ
         EP81cG51IoAOUUZT4yv4jUdjaas5TfZkz42cTg3V5OPaFVLl+GQCFQbDYGef0Ns7h9E0
         P5MHky8S0NroWgp66a98td3le16ztV4IiIJbF4Y3H9akhyUYIDhYg4woozSxci+qPufX
         Svlg==
X-Gm-Message-State: AFqh2ko84tn8gSIOHMpKOKb0N0JF2TVSveoKXJ1Vq0gwb8hVXHlDlbcm
	bPWwUDjpRnrxJMDi766UARl7Zw==
X-Google-Smtp-Source: AMrXdXs3feqGr1SDeiC+wJOoPhGUm9jY6uwlop6e/pzHdUts4/koTGdcSOhacx6snIxjQ3SET/uLJw==
X-Received: by 2002:a17:902:e84c:b0:189:340c:20d2 with SMTP id t12-20020a170902e84c00b00189340c20d2mr71560778plg.23.1672755190683;
        Tue, 03 Jan 2023 06:13:10 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709027c1000b00192b0a07891sm8598286pll.101.2023.01.03.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:13:10 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v16 7/9] RISC-V: Use IPIs for remote icache flush when possible
Date: Tue,  3 Jan 2023 19:42:19 +0530
Message-Id: <20230103141221.772261-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141221.772261-1-apatel@ventanamicro.com>
References: <20230103141221.772261-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061316_137636_DE42CE47 
X-CRM114-Status: GOOD (  11.01  )
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

If we have specialized interrupt controller (such as AIA IMSIC) which
allows supervisor mode to directly inject IPIs without any assistance
from M-mode or HS-mode then using such specialized interrupt controller,
we can do remote icache flushe directly from supervisor mode instead of
using the SBI RFENCE calls.

This patch extends remote icache flush functions to use supervisor mode
IPIs whenever direct supervisor mode IPIs.are supported by interrupt
controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 3cc07ed45aeb..b093727494eb 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -19,7 +19,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -67,7 +67,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI) &&
+		   !riscv_use_ipi_for_rfence()) {
 		sbi_remote_fence_i(&others);
 	} else {
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
