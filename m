Return-Path: <SRS0=BUIi=DT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88729C43467
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2020 13:57:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 006AF20665
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2020 13:57:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l5G1eBNt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="M7guIMGX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 006AF20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=doBwYTYPolAtOJmwU0ELQnhwA4Iu8BMmJMKZ8tcXu9Y=; b=l5G1eBNtaTXIT0GDo96fD6TXrq
	fbdTesTeKWTISSDanCtEXpADM1Crg+ZWwe+nysMY93FMihxpy2PyFupEG+vhZbbOQGzqpbb0OIU9f
	g9edzGr2eNAJp1aFrk1YkPQF+jTVKcBLjIC+gUW0gzbIpE/oE6NU73ZIvtjxAsZf7/OxXuz9XMoSL
	WjXAGv6uDLb0FRSzn32HChB7UDk3X9/dA7lCtt5629qDb1TnwJG3AhuFOdI3sal/FH/QrKR+9suns
	u+Cr8NHQHV09fJJE5m7PBNuxyzTqa7ai8gzUOb8AXwkvEMbffDmGalDsqm6/E1Kgy3b7pE0X51oht
	IULFKSYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRyKZ-0005MV-BT; Mon, 12 Oct 2020 13:57:39 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRyKX-0005LZ-4X
 for linux-riscv@lists.infradead.org; Mon, 12 Oct 2020 13:57:38 +0000
Received: by mail-pf1-x443.google.com with SMTP id f19so13558851pfj.11
 for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2020 06:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZiICVFIqX41C7SKKJnsrNtmwYTBihguSi/hha1GihbA=;
 b=M7guIMGXYX7w3kC+X3d/oZD+d5yoyYsqQPVuy5XK1UcpCYjQFQdOne/GanDOXnvHs4
 kpdST8zBo6hfAT452TviGrVNlVIgzKX2t+ctXvi6/jOJLw9VxNbEwKX3rd2KYDZ6ViSK
 KO3DjlrvnoriUgoaljupo/mFwZ8HQXZZzAfX/P5OVRIHCpXZ1ZGgdG31YkShSk+iVoEp
 OWoFOkSG/EREpSt3Ox8SjNeCUD99XaCqT/JIGr2OaTsPsasxEeyqWjpH4V5tsXSA8lrJ
 x7ebSgMtb+dRixsUyI2Jj4D8SKSwETmPrBrY++eV2oZOTSeNua/5wRTUE1HWVlWS/2hm
 DAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZiICVFIqX41C7SKKJnsrNtmwYTBihguSi/hha1GihbA=;
 b=Z39nnLim2PnImdU2//2cVQkfsCH4W/OWaEGpV+dIfnZK0hCYbpCBVDYX6J+NtHyesK
 acM7ikkNUdzdA/QMRWWDiIe6Ixs6TbeX7n+PBV4RUDJiBPOcRRoAiTx7+JTFGC23jU4C
 DWr8bYtWE++brGKe/a49E2TQj7KiPhr0mr0F0Myo+4WkhFG3lqt+KJshq27SF6BFn5Yy
 kpnqb3eNgsBQ/O+lhEkMHTQvtXYXyG72cS/TGNPbn37Q2VZnfcn9wUN4bh1RCbIcJtM0
 U9HSRUm6s/D78evg9+4G+cVnG07erFBBofMhirGS574+X9TRLVb421ahFXMqWOjhiD0q
 qvog==
X-Gm-Message-State: AOAM5317URZsXGXbSy9r9ae/H6k3W3ZHzMXkbsliHmVumLMbkR7ENJa2
 D261QqFM96jWliJ7XYIMfYlqvA==
X-Google-Smtp-Source: ABdhPJx/YXjwmC3lsPfXUB0HuPWyxGgOxdVizxfDuUlT+AzybzSCHmrav3+r4MJ6Bz2FEZN6fpbQCw==
X-Received: by 2002:a17:90a:7c03:: with SMTP id
 v3mr20003855pjf.233.1602511054990; 
 Mon, 12 Oct 2020 06:57:34 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm20019316pjv.2.2020.10.12.06.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 06:57:34 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, tglx@linutronix.de, jason@lakedaemon.net,
 maz@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] irqchip/sifive-plic: Enable or disable interrupt based on
 its previous setting
Date: Mon, 12 Oct 2020 21:57:23 +0800
Message-Id: <20201012135724.110579-1-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_095737_433786_9594D95C 
X-CRM114-Status: GOOD (  10.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

It will always enable the interrupt after calling plic_set_affinity()
however it should set to its previous setting. Staying disabled or enabled.

This patch can also fix this pwm hang issue in Unleashed board.

[  919.015783] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  919.020922] rcu:     0-...0: (0 ticks this GP)
idle=7d2/1/0x4000000000000002 softirq=1424/1424 fqs=105807
[  919.030295]  (detected by 1, t=225825 jiffies, g=1561, q=3496)
[  919.036109] Task dump for CPU 0:
[  919.039321] kworker/0:1     R  running task        0    30      2 0x00000008
[  919.046359] Workqueue: events set_brightness_delayed
[  919.051302] Call Trace:
[  919.053738] [<ffffffe000930d92>] __schedule+0x194/0x4de
[  982.035783] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[  982.040923] rcu:     0-...0: (0 ticks this GP)
idle=7d2/1/0x4000000000000002 softirq=1424/1424 fqs=113325
[  982.050294]  (detected by 1, t=241580 jiffies, g=1561, q=3509)
[  982.056108] Task dump for CPU 0:
[  982.059321] kworker/0:1     R  running task        0    30      2 0x00000008
[  982.066359] Workqueue: events set_brightness_delayed
[  982.071302] Call Trace:
[  982.073739] [<ffffffe000930d92>] __schedule+0x194/0x4de
[..]

Fixes: bb0fed1c60cc ("irqchip/sifive-plic: Switch to fasteoi flow")
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 drivers/irqchip/irq-sifive-plic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index eaa3e9fe54e9..4cc8a2657a6d 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -137,6 +137,7 @@ static int plic_set_affinity(struct irq_data *d,
 			     const struct cpumask *mask_val, bool force)
 {
 	unsigned int cpu;
+	bool enable;
 	struct cpumask amask;
 	struct plic_priv *priv = irq_get_chip_data(d->irq);
 
@@ -150,8 +151,10 @@ static int plic_set_affinity(struct irq_data *d,
 	if (cpu >= nr_cpu_ids)
 		return -EINVAL;
 
+	enable = !irqd_irq_disabled(d);
 	plic_irq_toggle(&priv->lmask, d, 0);
-	plic_irq_toggle(cpumask_of(cpu), d, 1);
+	/* Keep its original setting. */
+	plic_irq_toggle(cpumask_of(cpu), d, enable);
 
 	irq_data_update_effective_affinity(d, cpumask_of(cpu));
 
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
