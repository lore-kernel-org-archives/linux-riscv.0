Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986DBC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Nov 2021 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzSrbDkGHqs5wtITCwyvk6QKPFJNATTBPOdSpGoRln4=; b=wkGiv580rgLdq/
	XFO/GTdcEWczx7WSNK/hKIQReNvPFsRe/sk+OcG+KeS/6CWrWBKOOOo7664YaWtPoiGx3hO8P+tkJ
	s218gyDeTzvWA5n+oehXG84HHpQjWczhAh6F5vwWV0AQwwZFOMI8sBIIvj4Z7epTIOvXSYmyvNUfV
	Mhw3bddooQyifx5UFCFYue+1iBIUcqpd7i38sNMgUdU+ubd0/2P8TrtYIDhWryHSDNtx60UI9y4Eg
	9KiOwUPuG0Is4vaAULvOW8TdUzv9cFWiPrCgbQSVe9KwsQv7b+8y6fP8x67OTBqGMatQnLgw2BkNU
	YtmvgecKakn3xiRMvlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrMpT-00G9a4-1A; Sun, 28 Nov 2021 16:15:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrMpP-00G9Yk-RW; Sun, 28 Nov 2021 16:15:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 71209B80D22;
 Sun, 28 Nov 2021 16:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C4CC53FC7;
 Sun, 28 Nov 2021 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638116097;
 bh=EISRwtT6a67IdIj4/hZElSg1YibLzkj4w6ZbgU3blVc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vAH6L/KcOcN75/rLs5688vzmsPhitHpT1faPJuZHuLUaMMsET3nyJ3SkpAPdGfKHv
 kn20n3RwRwsYxfE4VsMrnx9x47uNGpkgXIdUhkN2DgIFyI/ukTU/4/ZQHqCx8JpC8M
 hTpM1BdAKeYzq3gISSD2PizLejukCS/lq8QPBaPbwb9G72IxaxYFD3dZSQ+8MBW5ZS
 1dmZugcsTLXaNULjnqNSbMiAAlURg3MPsGjmymcXj6K+TsN0U42iI9aL5QAQ7FIMss
 QJ90YepRR704ZLiSq+XYWZv242Rbsxv0qHmBkwaZs9MEChRevZkBgPBiT3z2h/IC9c
 RxIm4ZJMBNGrw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org
Subject: [PATCH 1/5] riscv: remove cpu_stop()
Date: Mon, 29 Nov 2021 00:07:37 +0800
Message-Id: <20211128160741.2122-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128160741.2122-1-jszhang@kernel.org>
References: <20211128160741.2122-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_081500_051708_A0B4B66B 
X-CRM114-Status: GOOD (  10.90  )
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

Except arch_cpu_idle_dead(), no users of this function. So remove
cpu_stop() and fold its code into arch_cpu_idle_dead().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/smp.h    | 2 --
 arch/riscv/kernel/cpu-hotplug.c | 8 +-------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index a7d2811f3536..e2b0d6c40a6c 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -63,8 +63,6 @@ asmlinkage void smp_callin(void);
 #if defined CONFIG_HOTPLUG_CPU
 int __cpu_disable(void);
 void __cpu_die(unsigned int cpu);
-void cpu_stop(void);
-#else
 #endif /* CONFIG_HOTPLUG_CPU */
 
 #else
diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index df84e0c13db1..be7f05b542bb 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -14,12 +14,6 @@
 #include <asm/cpu_ops.h>
 #include <asm/sbi.h>
 
-void cpu_stop(void);
-void arch_cpu_idle_dead(void)
-{
-	cpu_stop();
-}
-
 bool cpu_has_hotplug(unsigned int cpu)
 {
 	if (cpu_ops[cpu]->cpu_stop)
@@ -75,7 +69,7 @@ void __cpu_die(unsigned int cpu)
 /*
  * Called from the idle thread for the CPU which has been shutdown.
  */
-void cpu_stop(void)
+void arch_cpu_idle_dead(void)
 {
 	idle_task_exit();
 
-- 
2.34.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
