Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C33FC61CE8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:57:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF57E2086D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bAeK5AhD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="UG1Cwrse"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF57E2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8ytRvaArCk5GjPXTtmt3DJ/GWYIHScqt6rlm/9ARlQA=; b=bAeK5AhD1UQufQywSA9W3FTkEE
	6NfeUQA1EeetD8Tzk+7MCXh3BDeQdhkemUQLqL1cgSEVCPZTILEbb83owTQxVC/G7zIModOGHy/p9
	DZTgzyduntRtI9yQNy7/oR4C/IvMV6zQD3LcfHNWkKKthiYzAhIKauJD4UB/pJ2A52mW+zktPaysM
	xgH/QobLmA405dkb0Hi9k7tDgWJiEuehCyT7l5CojEp3xpKF9cIHy/HV5XfjwUiLbDOc/mSrZqjTe
	7NKwQezY2P80uXGI7VHel8XzhiQSQ0bwqVtmetGp/3bltuVJ5N9b6iyQNMuWw+vMtdjcIA35MX1QJ
	pfIdgXxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkjd0-0003Q4-Ii; Sat, 19 Jan 2019 05:57:10 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkjcy-0003P6-GS
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 05:57:09 +0000
Received: by mail-pg1-x543.google.com with SMTP id w6so7051368pgl.6
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 21:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+5uWZcZTnUMYkzU8RtvAyOycmBx9913OmwDsy9awI1U=;
 b=UG1Cwrsee516w8BNGvbRF4/j28/qVMEu5Xmu/3v0qMapBN8duHPlhINsPr0igqeInS
 NPgRGkg9KZ8nsAKjStecrDf9Xnprj0yJ5SjQ3xMTpSoEh3SSGG1t1LfVCFx9ZmncNTnz
 s8vP98s8NfMgBOzXfP2Krco8Lt0ZsOU9nVN/1UmtkWVXyKKS+L/b2n962p1UpzFqVsKx
 YcJ/xQeczW17pxycRV2m8CU5Ek5w25C2pzOPAyC+0kXU5vcRQ+fZaZcqJGNfw/QpIHi9
 j+vo3FgCN6P0aQINqz5caDxXwlXByUC1HqQ0jpAjxORchQDFMvGhCwRc4LGZWzpKep77
 F+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+5uWZcZTnUMYkzU8RtvAyOycmBx9913OmwDsy9awI1U=;
 b=EgEUPd/DV0B+YNJ8bpsurOhjqVYG7e5WI54H7sPdJUazfMtrvI6fEjNXi7B1cR5RWW
 dwd1JqHfQ+Un/3+0sPfY97/rLJFKiV+TUXvtXp1oZX8S0zrcJoyWlwOPsEP9h/IUGaET
 L3b8FUKp7WfL24IfhY1ZBQxvL9GFJNNVVU2C2lG2JCTKfA0QMfF2O8uthtphZmyW8iuw
 ngRPpqKIO7ZixDMQ0Jewbib19KbDnCb5r/eOjn4pg6gLCtVtMlq3XVqEkVWhN0If3YMP
 ZKGGVmNqLQkbuII/hPEjwEumPIPux5Pt1RkgL/lTp6g0iyVzxLrzbQDuZuHTnbQd2pOo
 aV1g==
X-Gm-Message-State: AJcUukfgp+csPb4sY0KVnYo5QIfmbupOfsdK7kdmmpCCoINcLTf4N4gE
 SyayRxnRSv8BM6o3zZgSHxSrRg==
X-Google-Smtp-Source: ALg8bN5hh8Y87U3+JnY9xdXjts/r8Nz0wxNzUFqNsbVeYHTwEhJOo+suPGf+fbnO8qNDagL61b/HMw==
X-Received: by 2002:a62:9657:: with SMTP id c84mr22700141pfe.77.1547877427469; 
 Fri, 18 Jan 2019 21:57:07 -0800 (PST)
Received: from localhost.localdomain ([49.207.51.221])
 by smtp.gmail.com with ESMTPSA id c7sm9295535pfh.18.2019.01.18.21.57.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 21:57:06 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v5 2/5] irqchip: sifive-plic: Don't inline plic_toggle() and
 plic_irq_toggle()
Date: Sat, 19 Jan 2019 11:26:22 +0530
Message-Id: <20190119055625.100054-3-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190119055625.100054-1-anup@brainfault.org>
References: <20190119055625.100054-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_215708_545742_6654D40D 
X-CRM114-Status: GOOD (  12.14  )
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

The plic_toggle() uses raw_spin_lock() and plic_irq_toggle has a
for loop so both these functions are not suitable for being inline
hence this patch removes the inline keyword.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index c23a293a2aae..01bbbbffbcae 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -69,8 +69,8 @@ struct plic_handler {
 };
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
-static inline void plic_toggle(struct plic_handler *handler,
-				int hwirq, int enable)
+static void plic_toggle(struct plic_handler *handler,
+			int hwirq, int enable)
 {
 	u32 __iomem *reg = handler->enable_base + (hwirq / 32) * sizeof(u32);
 	u32 hwirq_mask = 1 << (hwirq % 32);
@@ -83,7 +83,7 @@ static inline void plic_toggle(struct plic_handler *handler,
 	raw_spin_unlock(&handler->enable_lock);
 }
 
-static inline void plic_irq_toggle(struct irq_data *d, int enable)
+static void plic_irq_toggle(struct irq_data *d, int enable)
 {
 	int cpu;
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
