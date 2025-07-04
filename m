Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3976C83F05
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 08:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpOBTHZjHMT5e3JaiPjdgimttRug4OQn92MCAspwfhQ=; b=fikb7Xfja/8rjx
	eMlWj+6Bvh26hoZUtjxRhJUwCK2e+YQaiawWyQXtSGb9LwJxD4D71HcKuj8ALCZhei5z94e+k3tsl
	hDRXZxXhteHP5Q5o3dSErSdN+3LSSQqUjHhMP9zTXLeGd7UtMFPJ/iv1+ubxvs1F6mrOh9QyYVaF9
	XQi4qNRztAHtDv+dlnz8B1wsseeTKAyFCwcL7OVdEOsPMeA/TnHBUjhcP9b/Pck5g8yEe8Go0Zvuk
	VSLN/HkayeY56vXI4uX3MzxG5EoyGAzioBlbtUFPZnJel/INwFLGmLF5s1m9NYEdiQHfTNdw77Rza
	EW/V1c/nF3P7ghh3cmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbfm-0000000DiKx-2ivN;
	Fri, 04 Jul 2025 08:21:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaWq-0000000DWCb-2YaT
	for linux-riscv@bombadil.infradead.org;
	Fri, 04 Jul 2025 07:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=; b=ChRNEc68Dmx/k09HRKI+8HmAlA
	55wjoGfk22HjXBdnyVk76PZSpMpN46+qbqLo77ekw0UOFzOhEIVd0YcJFdz5/N/jOfv8ZGM4zSBzx
	X2pM6+mDwiuh8+/00afOA1554nVlFv0iWHB1h/xKnIpU/yKxqhVsd9AOi7ktGDM8yeREHGT/4LZqD
	CwLEqr8sE5Xprw4vZmnVxbct8dSZe992qvwU+CpX3lPqi2Xvv1sdCtjaA38hLSDzhUaCBcQxN8nob
	GZWkE7D5xVDi+9bm/Qd+/1ikd1KWSUV4wsz0tfEbqj8mrh+XuGF7SNFoUvhrkDywDZDGK1xyCaj+k
	GA15MWnA==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaWm-00000007nb9-2VWE
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:08:10 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3121aed2435so744214a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612887; x=1752217687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=kBp5vs83d4zuoh9cYh5kUhcql1qI6VIOa4gJmjmI+fjtqrr4LzTGDOIgPD2e13nJOu
         IhqppYr8Y7cYsTfLd4ZIxWq/To1ru+OwMLZx0nt/OktJAwbgnEgHtiU+/t3wf9AuwmXz
         jp4+iRGxWvLZly9Fa0nAMJYF07SuNqfgTHH0/4gIvtshQzl0Cnefsev8ub/2d/8eUtbG
         Mmbv0F8JFwPeMhCAl2Zuq6wUaS5waWnBNi8jHwnKze9Ad4cJfQJf53mpoyN7f/90pRse
         zOJw2dhBNBkSYbeJFlDbhSDCeI2Ya/0DRc1aBQVj5eN3BcwkKOV6uztOojZ+A90T8ZKn
         UPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612887; x=1752217687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=Q5PCsoUEDR06rX8ev6AK8lB2pUVb3ncltV4KvPNI/S76NDkxH0kUT0lSkMU6EsYSeQ
         mldJ/jHIjYaaS70ocgyy7UjK5kx7lrH9vMfBPs6QG+37yxAEpqc17hG+q1inZiAOweWH
         JHmMsEqeWw6x9MjQd9ycxBlJWxKN3LSSfHB9sVzuDltSDwIa5RMAUrFZhnq5EVMgNYPB
         p1m22ZI4q7JY/puIaJnjvqNH0iMYpmSCp6cew8Llp9Q4K2t93g2bSl85qoQooA1WAIvS
         FqYXWVsvl5l4D+0D1NuxP2ao6y6SfLEwMDU9ds2pUhjtvuhoyhAwmKMUamqRpRbQZZ5E
         DO5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDuoxxcPo4FqDi/kxF4T+KWCQq/wuz+esnCsbmtDoPFhED2KxkcU/Lb9ryYVEt/EA24YP2wSbJgYR3VQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIvD3oD/ynt7my2YE8rljgSyCmqiZk6vr/fU+A4y/W39okcUmG
	Ozt0V/zJqD5iwtg+O8iGU1yRcJgU56N+psUvcQNQQIm7AKzxkM9aD8+TbX/zBUAYTNo=
X-Gm-Gg: ASbGncuEhwN27GVn8rQVeyrbssHxdqanWW41G1XqGONjvbVWA0f9zgvjMzA7ZOYoY89
	zcWK0svMkhH2ubZzCvClygtLbYLLfyAwMHh8IL567QeMTvipgvOrGPVM/0zSs1iTNNeT6EABVY/
	L8sZzU1SF42McIONHhh7hmmNtlqA4vAATn8+cw4MyHq6hPnOzGxlsruca61VoV/XEJS3FthMCTc
	DZdc2QuQDHORQeyta6+QfAgfLJvUXw71RsVfgotfAH6yKnksVzbSPf9AoDVMtE1m4qVW6bic3Z7
	XhUQU/mn9E5YdSG2SSdc8ZMR9lfkOkZsncooWaDPT55p4KmxFGMyAnDYPFTmVtwgbihkMnpY3me
	4jEyF293kDilcLGZEMmMIqz1H0LnSvqgMlu/t
X-Google-Smtp-Source: AGHT+IF0zc2Duk30cC4boPPLQkPLExP0m0SOo91oiLUKWYjOgmAFhVPRmIXRhh+FnhO03cSYBVMJxg==
X-Received: by 2002:a17:90b:54d0:b0:313:d6ce:6c6e with SMTP id 98e67ed59e1d1-31aac449e2bmr2377250a91.8.1751612886401;
        Fri, 04 Jul 2025 00:08:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:08:05 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v8 20/24] irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
Date: Fri,  4 Jul 2025 12:33:52 +0530
Message-ID: <20250704070356.1683992-21-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_080808_741367_5A2A4A21 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

ACPI based loadable drivers which need MSIs will also need
imsic_acpi_get_fwnode() to update the device MSI domain so
export this function.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index d9ae87808651..1dbc41d7fe80 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "riscv-imsic: " fmt
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -215,6 +216,7 @@ struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
 {
 	return imsic_acpi_fwnode;
 }
+EXPORT_SYMBOL_GPL(imsic_acpi_get_fwnode);
 
 static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
 					const unsigned long end)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
