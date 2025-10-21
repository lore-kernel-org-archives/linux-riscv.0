Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C31CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 13:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sy2YSRGccfS4WSA45itv/kjq/4UAlRncBzzcF5pRees=; b=BsGxfPKMIUr5zZ
	+iGCS95gMeMC6vdJt1Te1B4vLaNdMsqFPA0byN6C0qAAxHCodDXRTmopOrAtzn3Aqp9buAP36Gm8T
	R2IsvwXOSltdpRED1CJTk8lvEyTAXf1Ozop078VDDxtPhrBoc6XdQpO5JOXUBq3dBstaGRfoheJZE
	h5l6vw56oKZxAcsP5mNleKLa65yae5Whg0FjU5XobN5cvytHyCoGOkI55kGoCfQHhrPCPIYGwUmCz
	gLFhPCaDxRotMgbWwXsHRjANbW7edfTtvfk123dEFWkGygOIPyRqL4lWP1kj6+ii651f1Mqp3Mre0
	hamewTqfDJLCMzo07XWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCmf-0000000HDQm-3meo;
	Tue, 21 Oct 2025 13:52:17 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCmc-0000000HDP9-3kAB
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 13:52:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761054732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QuqX+DVA3hI2/d+SyUtCBAKfn2WnwnI/ZTaEyd57HEk=;
	b=vJhlH2k/IXH0+K+ZOmlfs3G9ac+QbvdJbaeQt5QuSjnbmpLZfrJLBx6f+l7HcIYK46qRFG
	SJnlxx+rL+2dSwjo/e3M+s/vpghs599PE65LqJC+G7wSMB3oih3gySCbZaRUgo4pK7CgiJ
	1t3WGX7Eq06L7sG/5CTCo2QxhPhSO3w=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] cpuidle: riscv-sbi: Replace deprecated strcpy in sbi_cpuidle_init_cpu
Date: Tue, 21 Oct 2025 15:51:54 +0200
Message-ID: <20251021135155.1409-2-thorsten.blum@linux.dev>
In-Reply-To: <20251021135155.1409-1-thorsten.blum@linux.dev>
References: <20251021135155.1409-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_065215_074250_01605C72 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

strcpy() is deprecated; use strscpy() instead.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index a360bc4d20b7..19be6475d356 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -303,8 +304,8 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 	drv->states[0].exit_latency = 1;
 	drv->states[0].target_residency = 1;
 	drv->states[0].power_usage = UINT_MAX;
-	strcpy(drv->states[0].name, "WFI");
-	strcpy(drv->states[0].desc, "RISC-V WFI");
+	strscpy(drv->states[0].name, "WFI");
+	strscpy(drv->states[0].desc, "RISC-V WFI");
 
 	/*
 	 * If no DT idle states are detected (ret == 0) let the driver
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
