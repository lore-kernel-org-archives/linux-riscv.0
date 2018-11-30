Return-Path: <SRS0=zN4P=OJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A495BC04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 08:02:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 735382082F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 08:02:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tUS0qnAl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="SFxS6wu6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 735382082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ec/5ahHQLJgPQZiVdExGnua+lMOFoZy3PWEtGxc6DsQ=; b=tUS0qnAlQiBXCkkyF6WxkMXSNI
	gEnXPAy5rEH/+9OF7oR0rbmS4hAV9QSCrX9C09Yg5o9my24XvcoG/48uOicOwhb8FBZIYLlIENsSf
	dKLzLbXXTkc47wClNhf3BIQIeCu8a3OwU1IyAHEZxjmTZZl2FwVYlKtGzPnh6iD+gRJt+UlxLWoeB
	+rl+i+bk/EpsNRzS3nx5KzZOLs3dSS51KNvyXqpwYvVIWRkHqxDI9xbrHreJKNkmeX5TO2GXNZIrK
	hBf8wpolNanD2X9lihU/kE89Z/4AzvP8ASQs1EdSTcHf2luxcR0+Krl6yuRCTwAR4z6wliJ5Pz2wV
	A73k2x7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSdlF-0003qh-Tp; Fri, 30 Nov 2018 08:02:53 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSdl8-0003lA-SV
 for linux-riscv@lists.infradead.org; Fri, 30 Nov 2018 08:02:52 +0000
Received: by mail-pf1-x444.google.com with SMTP id h3so2410640pfg.1
 for <linux-riscv@lists.infradead.org>; Fri, 30 Nov 2018 00:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lMAJpPkeXbFuvURRfJbfrtp/xBSKSRsVuvnhRc6stns=;
 b=SFxS6wu6QrPWQfl28NHZOLuzvYcc5IHvoKBoVzgU6Z+qFtN4IDpNxafnC+mj7ba1SQ
 KSqsDSPzg+mIvMwgwPdwA3VP3qwrbjBYOXP3NIqq0QaUqKiztCaedvteBp/mH26MBBrs
 oZjxmlPr8qu548LkXpr53hAmS762GB/mO4ULcgFEs6HyXltot17GZg5XNDwdGr+0KmHe
 e9JhjAnRfLFLVXDXSxFPwmqzCDQsJFdhFn2fXO34yVsBhtXrdnP9HYn82Wfmaw7wRgS3
 DZpzvK8wASRgFZR41lhI9oNS5c1ZdQL2+LWcF9KpJs9OcsPEp/9KI0A7KrDtnwQ8a05J
 BErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lMAJpPkeXbFuvURRfJbfrtp/xBSKSRsVuvnhRc6stns=;
 b=pzY2UnFX6GjSOZpZOKlEp4e0m7b93r7AStQgqVyvAtJBD6CpVyUY76bIM8AF1HEzOu
 YMvFzjRUEihNoF9irZwH4PTnzKc6v+JaV0rWF3Fd9LdYeSw6nLKiQR/7p5Lu8sStVg2h
 6DQvxIhWpd+H1NlbSlHILDxtLABkvTMzSG+kbDJVVwD6pjYHPi6zQ+jG2ZSnMkV9OwvC
 5tPbBdqFtayYxQYZKPx4eetk73ffOwJP4fXf8tgJyx9lwuaU+dJMGdD8l3b6jAB1N7sP
 VMDJv1ms7w1E9YMN1yuaFuRe70vDPEJo/YPXnU1XDJzRU2G+bTaoZEyhZvqrK5dI5uwu
 L0tA==
X-Gm-Message-State: AA+aEWZmiCfF701wL2lE3xkN/vBgIjFaUOUh5iB4HSfb9J6VM8dvAKJh
 ZBBV5vHy8Oznufl3SPAQ06I87A==
X-Google-Smtp-Source: AFSGD/UkXS06dwoA9Vc9rLmPQ8Dro3U/CzAEklnNoR3GBBxZQBrzULpEwg0QAav6T5dp2lppp4nFwg==
X-Received: by 2002:a63:6704:: with SMTP id b4mr4048021pgc.100.1543564956124; 
 Fri, 30 Nov 2018 00:02:36 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.52.208])
 by smtp.googlemail.com with ESMTPSA id
 q187sm19218333pfq.128.2018.11.30.00.02.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Nov 2018 00:02:35 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v3 4/6] irqchip: sifive-plic: Add warning in plic_init() if
 handler already present
Date: Fri, 30 Nov 2018 13:32:05 +0530
Message-Id: <20181130080207.20505-5-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181130080207.20505-1-anup@brainfault.org>
References: <20181130080207.20505-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_000246_925072_3225AFF2 
X-CRM114-Status: GOOD (  12.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We have two enteries (one for M-mode and another for S-mode) in the
interrupts-extended DT property of PLIC DT node for each HART. It is
expected that firmware/bootloader will set M-mode HWIRQ line of each
HART to 0xffffffff (i.e. -1) in interrupts-extended DT property
because Linux runs in S-mode only.

If firmware/bootloader is buggy then it will not correctly update
interrupts-extended DT property which might result in a plic_handler
configured twice. This patch adds a warning in plic_init() if a
plic_handler is already marked present. This warning provides us
a hint about incorrectly updated interrupts-extended DT property.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index d4433399eb89..3d4f205f8abe 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -234,6 +234,11 @@ static int __init plic_init(struct device_node *node,
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 		handler = per_cpu_ptr(&plic_handlers, cpu);
+		if (handler->present) {
+			pr_warn("handler not available for context %d.\n", i);
+			continue;
+		}
+
 		handler->present = true;
 		handler->hart_base =
 			plic.regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
