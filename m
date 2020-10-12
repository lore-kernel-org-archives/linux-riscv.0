Return-Path: <SRS0=BUIi=DT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC57EC43457
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2020 13:57:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A62C206FB
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2020 13:57:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AWnp3Wc8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PRqy1Jms"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A62C206FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A08mskxO8pG94NLJKcXwSoJOC96B+EVsyOcD816SdXw=; b=AWnp3Wc8zUqmLVSpFwMZdL/3Ww
	9GdS8GkwNOj8AXxaC7lnEBap6565jtvGmk5CvToRvM0oP+MJFIS25eNwJBQ22ni9vd0TQAhcZPa8w
	ef3um3OkNHAsQUkVO3KK+/j7rQ360zhpOG6k5CTjMuiVO8ZsW/pgZtrXEFZTTg38howLktWj4F7Wz
	MoW0GzOa/J/bSC2/J8+fsTM5l+i31wBxqNQeprSit5IexohwgIUZ4rqkm2Dp//MkR1mKuw2qCpUeV
	N+kGwgt2x7HJnVHKUuADSpnlEM6WffzHnf4eCjCUgkGS9F1snapQAFOmWpXbe7avMOSLcNl1Z4qYe
	W9dJjSIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRyKh-0005Oa-0X; Mon, 12 Oct 2020 13:57:47 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRyKe-0005NT-JA
 for linux-riscv@lists.infradead.org; Mon, 12 Oct 2020 13:57:45 +0000
Received: by mail-pf1-x441.google.com with SMTP id b26so13593831pff.3
 for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2020 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Q1wnaKsyvuMXKi7fs7oMuZr+hnbrwNWLrapTgOtuEpI=;
 b=PRqy1JmsF7Ra7sTdljtU/xin9hXipV61CkD/nqQc6hDlDCA7GvAf36G0+7uYOydo5M
 19MTH/xehhZrNd2VhYOgfcuqfBxRHheycm+SujUnxGkm5IKmqfM/Kmv3THohngzKhIZZ
 3uuBCxUgzHOT3MmLtA7U5hZSKMDQJ7LF0ak0KbkoGxJTU1yrQ7bm5UJAIBWp2LpMs/XL
 zVkCVRFVzmFRMeMhlmzeliZt3N084OARRHRP0m+b9YiJKIlb2+8AzGtztVkAqmiK1c1C
 uJ80aXUPOK8hynccbr1SSBjtKNKYiruZ7lQnLO+MWvXGawDcPQEfOQxT/PoSt8bfHEdE
 GvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q1wnaKsyvuMXKi7fs7oMuZr+hnbrwNWLrapTgOtuEpI=;
 b=aT5H0Txe8IGf9BdVciO0q2PiLfgeOqGHNMIYMzrxATZ6CbmQKn+ykGxg+bpXq4EHcl
 w2gYXX1accKuZTxhZ0RqXDYB3ls5PLF1Y2wKpCC77yBhHuC8jKGPYjuqLyHeHgC7TyeV
 vYHpqHeBZskZtg9QyJ4uahbWFgvYvTUR2qYPXqjIWSmvmIS9r8TonlNX5AN7iIZnkMNo
 Ndx7WpkJbrPgbfQiNh3OCjG06+1e37rcp5H9LhwcdW7YzbDoOz5kj+kEy7OvNA5Pe4G+
 KU4M3Foguy/cGhi1iQ3rs+pFXPdZgXRrWYMVn+btNmQ3WAJlEQr+GuNpxg44etVOhEOE
 NUHA==
X-Gm-Message-State: AOAM532SOGXpVwY4RJ8EjBv2KJvMHdSOVUwD9PTpfev3551A+AxtTbrz
 uB1qVIhAcGaKz3MmcxHvH7/rbg==
X-Google-Smtp-Source: ABdhPJzcrHQeZk4zgWWyuluZxje2uj0PyWtM6YbdgCeVVIsUCbXBIgZTTXg9ohn70dPUcgnAubNMuA==
X-Received: by 2002:a63:470a:: with SMTP id u10mr4433502pga.48.1602511062540; 
 Mon, 12 Oct 2020 06:57:42 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm20019316pjv.2.2020.10.12.06.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 06:57:42 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, tglx@linutronix.de, jason@lakedaemon.net,
 maz@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] irqchip/sifive-plic: Fix the interrupt was enabled
 accidentally issue.
Date: Mon, 12 Oct 2020 21:57:24 +0800
Message-Id: <20201012135724.110579-2-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012135724.110579-1-greentime.hu@sifive.com>
References: <20201012135724.110579-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_095744_635317_77829751 
X-CRM114-Status: GOOD (  11.79  )
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

In commit 2ca0b460bbcb ("genirq/affinity: Make affinity setting if activated opt-in"),
it added irqd_affinity_on_activate() checking in the function
irq_set_affinity_deactivated() so it will return false here.
In that case, it will call irq_try_set_affinity() -> plic_irq_toggle()
which will enable the interrupt to cause the CPU hang.

	if (irq_set_affinity_deactivated())
		return 0;
	...
	irq_try_set_affinity(data, mask, force);

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

After applying this patch, the CPU hang issue can be fixed.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 drivers/irqchip/irq-sifive-plic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 4cc8a2657a6d..8a673d9cff69 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -183,10 +183,14 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
 			      irq_hw_number_t hwirq)
 {
 	struct plic_priv *priv = d->host_data;
+	struct irq_data *irqd;
 
 	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
 			    handle_fasteoi_irq, NULL, NULL);
 	irq_set_noprobe(irq);
+	irqd = irq_get_irq_data(irq);
+	irqd_set_single_target(irqd);
+	irqd_set_affinity_on_activate(irqd);
 	irq_set_affinity(irq, &priv->lmask);
 	return 0;
 }
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
