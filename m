Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C00C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 11:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bkCauc84ZtcjzHnWUXgFkt9oBQUOr2p0Wrq9jnYCqxM=; b=kTOYvt2p1pCQwB
	lVQQIxRpG1UDxwyzFL8j4qWs/X2jJP4tZ5OYDLVjdFYm56rcHZKN9MTyjNzhjtSTR+LiosCxc6g26
	iWbONTRXR/+f3cP3DDjjGavyQkJcIrHz6Y9qCCBBZTV7/oja4z3fbo/RhGyMkH7R4HSzDA1QqDDqw
	cQyHOaHGPR2utlh0jO+njOGqCXXk+rAtDxfNsbpiuW7Z21Dsrvn51qiUh60A3Gs2VJr70nSIKqKuX
	vUjrCyT272KLVQRtgpsHp1fZApmAJbpwe4hdfDptzMbKHAiI2Qx2f8Ui2keM6LlWoWyDYsm5tWNZi
	sVcpKFwSeqp7BROAcgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfSR-00D5EE-IL; Wed, 27 Jul 2022 11:44:07 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfSP-00D5Bv-03
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 11:44:06 +0000
Received: by mail-pg1-x52c.google.com with SMTP id bh13so15714050pgb.4
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 04:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZDeYW4AY28vTxurFqUXv3ebNyVNdEODpLRCvig5J+Z8=;
        b=aqjEe3mvrZ/sXf2TJhUGnviXYa1l1LYvbO7SQNCsbRoBm0VTSB5S/Vn+NZ3BombPyd
         c/hYAThtpLetobdizee3fkOS/RlfZitV1e4eh2Sk4CmKvhXeGs41oltsGCrZGXrdUf48
         KqR1b30FD6/M8sVRF0rEJQ51pt9SPXLoBxvDhX4eVN/KXOe2sdLQPZNBb9CRlQ/bPmuo
         Wp4KqHYcaAC+mWT20tlu1Bk2gicSXZDrADeE+ruejivezkjr9GXD9SOCjeCwsDvBrAAh
         sQUbAXEjW9hO/WPRC9DvATAtc4z6/vfE48At2mxmtoyzPv5qgLh6b7VpH8SrqxlEuomp
         YRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZDeYW4AY28vTxurFqUXv3ebNyVNdEODpLRCvig5J+Z8=;
        b=uosCONbVFG26sesOTFprXSal0+8wId8xxyMpLrmLhbMgj8KcAIn8dwMG2G97gpLoN6
         zQfjRYBZgbMLkLRf1pqGzvwJRIKQaEtJ7PvNrK5TcReweozSxg246OT8CUy9fE1xyscM
         Hk5yyi8uxCPXsOMW5R881hz2Ym6lySUz6S+FxLUidyQqMeJ1Ybz9L2u0mwbX5UNNBqts
         3x8molXboAsBHR3oP/AJSN+pp2EMhwKxyzodrPnCJzYPhVczHp3pXUjBiTul3qIRpNh+
         q3YKBhEhrXwBL9BHGlxZtmURlvNjVDUrXJW9Gyl1JXuz+PmH2H/UsF6YM/Hl1zRg1v5o
         6YPA==
X-Gm-Message-State: AJIora/p413Trj2lBMDMbAI5iPLVCSSyXL9GB483ZU+VdYlLLOjYklar
	gzhWIQJxjKu2UOR257nu1XLx3g==
X-Google-Smtp-Source: AGRyM1vgoJVgOpNZ5zoSEMsNCq+Vu0AoGtr3UpQlEBz0aThV4QkKeFQREyfDS6te99XytVvnKPacaA==
X-Received: by 2002:a63:fd4f:0:b0:41b:539b:ba8e with SMTP id m15-20020a63fd4f000000b0041b539bba8emr812287pgj.17.1658922244094;
        Wed, 27 Jul 2022 04:44:04 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.87.63])
        by smtp.gmail.com with ESMTPSA id o8-20020a170902d4c800b0016be9fa6807sm13486685plg.284.2022.07.27.04.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 04:44:03 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 2/2] clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT property
Date: Wed, 27 Jul 2022 17:13:02 +0530
Message-Id: <20220727114302.302201-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727114302.302201-1-apatel@ventanamicro.com>
References: <20220727114302.302201-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_044405_065011_AB0DEBBB 
X-CRM114-Status: GOOD (  12.93  )
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

We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only when
riscv,timer-can-wake-cpu DT property is not present for the corresponding
CPU.

This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
based on RISC-V platform capabilities rather than having it set for
all RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 593d5a957b69..92a0b9832d8c 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -34,7 +34,7 @@ static int riscv_clock_next_event(unsigned long delta,
 static unsigned int riscv_clock_event_irq;
 static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
 	.name			= "riscv_timer_clockevent",
-	.features		= CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
+	.features		= CLOCK_EVT_FEAT_ONESHOT,
 	.rating			= 100,
 	.set_next_event		= riscv_clock_next_event,
 };
@@ -65,9 +65,13 @@ static struct clocksource riscv_clocksource = {
 static int riscv_timer_starting_cpu(unsigned int cpu)
 {
 	struct clock_event_device *ce = per_cpu_ptr(&riscv_clock_event, cpu);
+	struct device_node *np = of_get_cpu_node(cpu, NULL);
 
 	ce->cpumask = cpumask_of(cpu);
 	ce->irq = riscv_clock_event_irq;
+	if (!of_property_read_bool(np, "riscv,timer-can-wake-cpu"))
+		ce->features |= CLOCK_EVT_FEAT_C3STOP;
+	of_node_put(np);
 	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
 
 	enable_percpu_irq(riscv_clock_event_irq,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
