Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D70FC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 12:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XdHYbJc5W9WaZUrHvIP15NbG0kZq46mliaiS8SDqq/A=; b=jEXdSHSS6m6wmz
	8ucLCdmOFhXlmuxzY8s8mPdkSEtObsluc/8zPU+fhDrZEQV0Uqpdr03PmLhFJoZzTyF/3FAMCJqJc
	Tr/c6k/o9uePLTGjRHVxG8qqZj/GBUbDM1R0X/SJnmC0YlBB17fT6OAAwBM6S01VtwUEK+hEx6/ML
	ajPDItO5Xa6vBnIYi+ccKFLAPAQ7AS5Uf72NyZ54QUBHzjA9wFqD7Sc0mZi0L0ZByFnFCC1+HQ6Xn
	Bcy8ZT/5vg4y+UWvee9OiA8r9d+/tqWAf+ozkvnA7NYywYslZ4XDp6tbBjc9PBPdseAtV7LlOn2Dr
	E7tnEgB0eEi7tPZz+aLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpS9I-00000008lFm-0S73;
	Wed, 27 Mar 2024 12:12:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpS9E-00000008lDM-047X
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 12:12:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DDA761511;
	Wed, 27 Mar 2024 12:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF53C433C7;
	Wed, 27 Mar 2024 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711541571;
	bh=ZEFqX0rr/4NcbZWJElKR8QdLOMJVEZGDtxdEioXmuoc=;
	h=From:To:Cc:Subject:Date:From;
	b=fMVxno96urFy74N6zvKlmIXHr9BiXx6Hrle2R/FtsaQgMpujdDj1itJhtvjQZv2dh
	 voKJdJXPGQvtbmmJ7/SP3OWCkWONmbQtBPv6XN+z4usm/Q+JEFGgMpCLGpHsmY4LIM
	 G+IggYGZI6eUfNfj4OzGeBA5clcN85fKy0lnUPPEmvKadn3uxQmjoq2TvoTmV1W8I8
	 Szd5aQQRkE1tXv+AIAx2hhFgK2f9SmdGcpqOaSTIb5b7Lqhhek4rx4rd3GZRxYschh
	 QLD5QJL2F2QbKqxCqmCbnHPdUBGK2wdy0pREOKDJuR1QjOCn08MVZT4/4LN2pjENB3
	 7sKZFxkASNatw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	leyfoon.tan@starfivetech.com
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Atish Patra <atishp@rivosinc.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: FAILED: Patch "clocksource/drivers/timer-riscv: Clear timer interrupt on timer initialization" failed to apply to 6.1-stable tree
Date: Wed, 27 Mar 2024 08:12:49 -0400
Message-ID: <20240327121249.2829814-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_051252_130178_E41227F8 
X-CRM114-Status: GOOD (  10.97  )
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 8248ca30ef89f9cc74ace62ae1b9a22b5f16736c Mon Sep 17 00:00:00 2001
From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Date: Thu, 7 Mar 2024 01:23:30 +0800
Subject: [PATCH] clocksource/drivers/timer-riscv: Clear timer interrupt on
 timer initialization

In the RISC-V specification, the stimecmp register doesn't have a default
value. To prevent the timer interrupt from being triggered during timer
initialization, clear the timer interrupt by writing stimecmp with a
maximum value.

Fixes: 9f7a8ff6391f ("RISC-V: Prefer sstc extension if available")
Cc: <stable@vger.kernel.org>
Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20240306172330.255844-1-leyfoon.tan@starfivetech.com
---
 drivers/clocksource/timer-riscv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index e66dcbd665665..79bb9a98baa7b 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -108,6 +108,9 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *ce = per_cpu_ptr(&riscv_clock_event, cpu);
 
+	/* Clear timer interrupt */
+	riscv_clock_event_stop();
+
 	ce->cpumask = cpumask_of(cpu);
 	ce->irq = riscv_clock_event_irq;
 	if (riscv_timer_cannot_wake_cpu)
-- 
2.43.0





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
