Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D725C7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpOBTHZjHMT5e3JaiPjdgimttRug4OQn92MCAspwfhQ=; b=bWG8IGdvxhAN4b
	i7kugkfrz5fA3+s8W44WNtbXA6xxexWlNV0D7DzEmimZR78jFBM8nLbJnHiP/Z4T48a3pbnJhCvbh
	x/s6wUOlRLzOoR/0Ax0IV3kAU+ztRJJiUKBUbhPtZuEGpGNUyptfXd2OFN2Ib2hWG3xaPnCbEu1EJ
	AHchgzV6bZ/aSi7NLt4ay5DTqUeD1dD/iuPobxY5ls/AhZZt2ttgfvU+WUfeVjQRHxmOzH57pnPkh
	wgDuPNyrYAoHm1usnKzZC/H3vok8KJjgeip2xNDvM8ECzMTzlccSo3svRHu+TmKhPEAL9ubqDO9DJ
	sNcIB7SUOcuPFqH+gMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtpM-0000000ARGe-3h8O;
	Wed, 18 Jun 2025 14:31:48 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrit-0000000A5eK-3njb
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:17:01 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-748e81d37a7so387818b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249019; x=1750853819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=ia0nwgeLcQ+dX+tAWkJtEATuQNpfFieoJCqG/RwotPt6OgyNS0wVQZaCIgvQIlSN9v
         zY0X1pX6kuvCWrINraSdSfVuRWZxVortu/2G9KrDpz0ZedPfejdkMlaz6iPPYOm+iHLm
         Kuy87UbN/3l+cTTzDQj0qQa/t7oxVB26rvaFDsC1F22X8KvCNvIH0H7fj2XLKB6gpre5
         18sVB1EKTcG3EhCG6U4bio36vkEGMuI3tsrZzxdUEgxzSltimpZpFeWubjmUgosr3Bsp
         5w4+0v5KPudKbE1TE9m7O8wjPxbQaZfh8fH6/OR91b1hU3LOTv6UVJp30uA3AfIsGGe7
         3OjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249019; x=1750853819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=U6rshs4jvxAfKGvOiqrBru+QSuDTlaLK23iVNncg3QkU2vvRANhgcwUOQWcQG1fT3q
         UpilU/SHt6/uSu9vVxxhRPJaj41NSsQuaUi4AP86W2aQdffOooKHUNDJS7DKlbsJJFqQ
         b2AvLLk1rmhEgvxsB964IOEFio8nBrD5c+Agb2GgxtfFizVGiP98TpzF+nqAR16t0YAm
         yHNQOfAE90sszKcIUctDO7jqUIgAP4nWiAGKcbnXqCzmpKjqH1qghq2IN8LsA31UeS2D
         nQFFNoImPZFaUsyYQkN2jEwLi7hLLjuQDDYoFX7lg6fAFG9ncczb/0hN1Kg3FJft18Mx
         P9zg==
X-Forwarded-Encrypted: i=1; AJvYcCVSkqtsZTcOqmwB0N6FuVbveEb+y0E+OsnCs/mc8bPbCFkLfzrcuRw5Zf4dTRpgyCL+3H9qdTePw7dBQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrm8Ol4vwabkBBOi1OQk2XnpWC6nJZgU09MYi+L/6Hhflpu7wL
	W+SeoSTEzMTGBB6YSuSqeVGshEgzMlr76eKK+j1tFuDm4gNUaJYaA+/1Lo7yg9hADw0=
X-Gm-Gg: ASbGncv7YKGzQcd/Zd7dRfBvEiYKsUEq+fZiR9ObXnt8vDH3sYgnGW4z+i70e48xwo0
	BK9Kb2HgMwwk5bM0gSBQ4dCG4lHvcKpLGwLIfCTf5gmxqGqyckSeEOac+tOp0XjAWWscq+Vd5gL
	tjaykjEy9+lLbvED71axIIRKDS/YwBSSugZlH1arrcXOnb1i9oYYOGFsGqUWnrZWBgAKYRjvXSL
	tXY8gcKd2TU32AlFC2ixHwe8KdfiMt4MsKtnzGRLWkjb5kkBji2gje0IG/valzhgzjQ8CqsQshl
	X+bqph1K9mW1nx3dyNRRxIQ42P8kV0cgzULxz+3UjsCIu3BwEUsu5zZ7wBoZ3bov/ViAlQTTqBP
	2AVPtacd91jR2aqMEwmhjx/+iiTJc
X-Google-Smtp-Source: AGHT+IEv6PclcgZE5s21rcdHdcRt5I4k5x5biP7AB5bvAwlqWXB9wOizxmLyeD6IHY4DarLLQ/gyEQ==
X-Received: by 2002:a05:6a00:4b4f:b0:747:ab61:e4fa with SMTP id d2e1a72fcca58-7489cfffda6mr23313956b3a.14.1750249019180;
        Wed, 18 Jun 2025 05:16:59 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:58 -0700 (PDT)
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
Subject: [PATCH v6 19/23] irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
Date: Wed, 18 Jun 2025 17:43:54 +0530
Message-ID: <20250618121358.503781-20-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051659_949003_AE602B55 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
