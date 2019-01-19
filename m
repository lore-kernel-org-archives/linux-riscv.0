Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6BDC61CE4
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:57:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ECB12087E
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:57:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BATrwIDP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="c9iglgff"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ECB12087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gWRnVcyiWT6UQ5roJZpaiCu3Yw9WRVpIH9no9QSvZzg=; b=BATrwIDPcJy11PjHXJv1FwZXy8
	vWeDkVKUaoTSqLhSzJBhkRK3bToXbJ8mHobmqguAc6uIyBt7GS6hfYPqi/TXXWDpAtl8UPdgzYlgv
	CsPpf0PJ4yhH9tcOmuHtWJ1c7jK97onza/LsP4AtGKPoskF5MksV5NNt3CQaXT/CFImhETyqHELsK
	F/9cG++ihMJ7SR1bd3GPxzO810781sjAh6UOfh+YjEkwIai1WwFeB7EhDamzY0lVe8RAfivMlVaj2
	NY9EhNrpRVWOTkfJHJswbJdKCRw6zN/AjVC/cEez6cLXj62rniug2aLPc7K38ScjHeGEN9qJbmWiG
	/aLrvH1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkjd7-0003Tb-4U; Sat, 19 Jan 2019 05:57:17 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkjd3-0003Rv-Nr
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 05:57:15 +0000
Received: by mail-pg1-x542.google.com with SMTP id z11so7067328pgu.0
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 21:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QPq/o0R9ggNlb2oMRGbkSeTpgM0rzBY83T9WPQ+nWrg=;
 b=c9iglgffLpFLhSbvvzWlFeS/AvjO1P40S00smgVlLs3YsQBwjZMXqbP/aAAXhAhoaU
 sKCAXePv6bS9r+kmQxgtpiCwwGLxGZXp18KdPCWPBXk+TdXZmD/7a0tuyJQ0d8R87xnr
 Q07fJcQPr9WP5xf5QruBLirguXjfdTkl/nCWXHQXBo05DtYfxtdR562jSwn/QG2Kt4n9
 SXqkAy/msiA/fclUCpM8xKtfjqpzZnHtdmGNkRFjfrx47tJrq76JfHYFCdmYsDT13s7T
 tdwo5AXFp3mV+gX8qwruOOmNRzuHiJz0djr8IRmL84vE+A5Lpx0b7h/WeDJGL4Spqm87
 KbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QPq/o0R9ggNlb2oMRGbkSeTpgM0rzBY83T9WPQ+nWrg=;
 b=ruLYGt/NmdiE5whbAz/bk4rMpr0d/JJbDB2919+HJP7t99LgLnRZH2ZTNInlNS6u3R
 PMjSPBy/9am8SoluAyZvyoHuokbcnphuIOwNTUqJEN7Va10VUjoicwbKm+N9vfoYgRGA
 PUl24RHFD3TqSLywfPF2SoOHwVX1+IdfJTwgUeCbFeGSPvw0fhwmeFLkn9m2/OM3TVrR
 x1RBEYCCpgQj+zfwHt7LVhUZMkG5ey1i8253OyOE91paHEjFWJ8I7/zmEqaK6baLksDx
 g9Es2EdEHGB7yfc2a1Joh0s1Khb4rMf7Yjs6fsZkpkR7LkGRkBa+3/agfABmva7Vp+ne
 73sg==
X-Gm-Message-State: AJcUukcqMkWax3JLZllt3ETSPtPw2K5Lp3SRzpFhPY0ah7L9PKP58AyP
 ZunEqOFDepgp6zzouuzF6dlp9Q==
X-Google-Smtp-Source: ALg8bN6JYdjBjQL1iTQMTWXvrOTiU/Fa0DfbRJm4zuIRUgdZLqvPh2JyNaWwYssKxs/5vtkL9ZBrAQ==
X-Received: by 2002:a63:f412:: with SMTP id g18mr20671728pgi.262.1547877432781; 
 Fri, 18 Jan 2019 21:57:12 -0800 (PST)
Received: from localhost.localdomain ([49.207.51.221])
 by smtp.gmail.com with ESMTPSA id c7sm9295535pfh.18.2019.01.18.21.57.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 21:57:12 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v5 3/5] irqchip: sifive-plic: Add warning in plic_init() if
 handler already present
Date: Sat, 19 Jan 2019 11:26:23 +0530
Message-Id: <20190119055625.100054-4-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190119055625.100054-1-anup@brainfault.org>
References: <20190119055625.100054-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_215713_823584_4435D44A 
X-CRM114-Status: GOOD (  12.66  )
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/irqchip/irq-sifive-plic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 01bbbbffbcae..b9a0bcefe426 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -229,6 +229,11 @@ static int __init plic_init(struct device_node *node,
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 		handler = per_cpu_ptr(&plic_handlers, cpu);
+		if (handler->present) {
+			pr_warn("handler already present for context %d.\n", i);
+			continue;
+		}
+
 		handler->present = true;
 		handler->hart_base =
 			plic_regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
