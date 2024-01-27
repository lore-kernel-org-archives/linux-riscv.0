Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6A3C47DA9
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYXueBpXt2jEvekfXSbm/vpzmJmz5VGjDeJm75QMZlw=; b=SlNpLXcHejoXjn
	5Jq7p+9gM1PMR5ACiDVHobIUFdZFq7M0wezoSOybJTP/8x18VXUryVwRYMuvg9Otoi7mqb0N5bnmv
	3SBOX6u1m+YlFtw2AAECjxmMfEbVwpQZbPjM5bdXq6TssKvdAY17hJFRCrViKot3EE6IxVQXk40bB
	uMS+sgV6GRRizqYQ5ru7wtKJ5qtfQLCrfcuTYscuoNHkQzvXqNscJfuyTH7hxQic84zG76Ik9kzfV
	NqwrxE4Mkr8Vn1DUBB3I3ay7VlF1lp74uAh10zynwzqtfJw2Rw5SwUQYrbeELw4C8/2exrQhPTP7s
	MV3dZNpz+i/iCClJA1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlO5-00000007k1B-2F7W;
	Sat, 27 Jan 2024 16:18:33 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlNw-00000007jvG-1dDB
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:18:26 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6db9e52bbccso714315b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372303; x=1706977103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zu7qmaFKtSQTHBWmN1WZersC14c4aifFLlwgdgw14DA=;
        b=TnIAmTG+H+py+MCuGG30xyen9yJ1xeHP89kRhypmQutg01zYx2FUqSBRorAVMmxlYl
         hu9SPjzDO+9KuKtANjjOzKJxwW//Ls2QU0KWS+f9DjzpODZ6VO4cd1zn5ZvXjGc22+bV
         gNU6GjB7yNS7W7lBGTmrocSkuixbZvQw6NzYEdVj4+MqgGklhmy9XPlQP228YBFJWD6k
         OfEXzk+SJi3yCED7PFCN/zwbNp8XGeROFzMlLpKDDcxsxaxF8zZm5ickXrQb6QmrLHze
         /Q5k/8ckRTOjc+6AAwpu3rPPqkl2pTHhMAlj+ZjSzyf5pyIXoZ5/jtYyIfC2BnLD8FcG
         US+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372303; x=1706977103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zu7qmaFKtSQTHBWmN1WZersC14c4aifFLlwgdgw14DA=;
        b=bbkWNUkwC2PWBMn+YTlEkgiXmGWxdvQyN40pzCSfs+NdgcY1Wh8/nu1pMrTMNW7too
         tybqHhVv+cLBOtwCvN4EL1wkNCp7Zd+3g0g2I614yZyzgv+o2SxPo4g8KRhgppXK7zOJ
         T3rJqCMMM9JO1YkmeAWCpS+b730iipWlDH1uq2YiuuJM07sT2Kptgszn5IWNClx6tUAt
         A6IisLW4iABX395m8aMoog58cIbMFpaF7Jw2cALcfTBrcTFqFBS8GiTMd6RPSa0hABKf
         SIOh2NM/pRufG0H5w8/hVhIm+YeDDXtLQ5g/nDhdnDtYqrkQel8mJK5ASpQOEJ9nfTGX
         IKaA==
X-Gm-Message-State: AOJu0Ywo5qQwwEds6MT5sMygwamp4OEr6ZfHTAs1M6fjr5/nHfldkXQW
	Bp/BUUF1TeIyvBNbZL1ixvrO6CC+HWqT1oFCN7pGOiw3sEwgvuRctV4POwCbPjk=
X-Google-Smtp-Source: AGHT+IGWNqCuHvim94RTzZCaCZxexRf+vALBBKbirBhqFCZBtNghT5AvXpTXfThJR+s7xqJCGSZFFw==
X-Received: by 2002:a17:902:bb85:b0:1d7:56c3:75f1 with SMTP id m5-20020a170902bb8500b001d756c375f1mr1352934pls.122.1706372303005;
        Sat, 27 Jan 2024 08:18:23 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:18:22 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 01/25] irqchip/gic-v3: Make gic_irq_domain_select() robust for zero parameter count
Date: Sat, 27 Jan 2024 21:47:29 +0530
Message-Id: <20240127161753.114685-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081824_470514_9EA7082F 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

Currently the irqdomain select callback is only invoked when the parameter
count of the fwspec arguments is not zero. That makes sense because then
the match is on the firmware node and eventually on the bus_token, which is
already handled in the core code.

The upcoming support for per device MSI domains requires to do real bus
token specific checks in the MSI parent domains with a zero parameter
count.

Make the gic-v3 select() callback handle that case.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v3.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 98b0329b7154..35b9362d178f 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1702,9 +1702,13 @@ static int gic_irq_domain_select(struct irq_domain *d,
 	irq_hw_number_t hwirq;
 
 	/* Not for us */
-        if (fwspec->fwnode != d->fwnode)
+	if (fwspec->fwnode != d->fwnode)
 		return 0;
 
+	/* Handle pure domain searches */
+	if (!fwspec->param_count)
+		return d->bus_token == bus_token;
+
 	/* If this is not DT, then we have a single domain */
 	if (!is_of_node(fwspec->fwnode))
 		return 1;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
