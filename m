Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A00C83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+/7n2Oz4l3An3R23NNYONJVQv7tTIr3roLhxP9cuxY=; b=nbCwwC62K69BOi
	rZQI3a5SzZDAW2nDdHpejHr5dT5IYJ7SfHOVdnS0GErLeAKk2ZUo5pjshlww0d3pmT+AXTthl4Zn8
	zSYpBfXknsHeo0kmxtiMiEJuRLHVq20QUFXd9kInzLH+Oaxo0Jc8Zvz79cm6tw5N/M/rZOppUxxYy
	4Zb9fKxWeHw8G6R3lltBEX0zRBaNxDzpxWaAOKHWWwNsBzw9BIeelAvSULtioHgFmLyQUYuhxn9++
	BEZ8/6aQPtpNOZrNweYUspWpfURpUEa9JqkLTZsREDIISHuV1xAl6JPVzygsoQzy42wGiqAz/ml9F
	VaCTs42pJk+GNIndVv6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaWG-0000000DVKF-0Ioc;
	Fri, 04 Jul 2025 07:07:36 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaWD-0000000DVFw-2YoZ
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:07:34 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso522922a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612853; x=1752217653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=P3kJfrRzBsHFU8oOKTnUOOsZxffB2ee1SW+8BR7Q3Wf3kNshecfb8CEgM9OYxdBqaS
         6hLHZOsUXMiIHfrlBpYa+XB8Xrn9HvFJ+8DLsA+OHYOL3KnBDnvgwUFtUxB/rhFIraPB
         knEtTwJZnflrQHeUK5bWwVD6zpg/zoRbtFFeKyqDazJENxGVLImAQN+TFNmtOGX7tRyj
         /ReWg7Is1kjAXh4HDkrefwvXpyswMCf1ppWrzY2ra4h720XoTxsaYObLN9w28aUh0TyT
         wxAuJuNGjgJv9rCGsHnYtAr4O3FigeukZ4L8Habc5PGlfdIxbHm0z8o5HYEiwBNlYVGw
         0DDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612853; x=1752217653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=Al5WCQwf04zdmVhioQolqgAyoi7hCtW/GGqc0eGQ6wSUBZH1w/Wc0y30fR7k1CCUsD
         XJed721Q1vSDQbCCQDVlYuslgr7znFC2dMHF4KFixsD3up+rK+aOPDsWtyNdS1HPGNTp
         555nyFhFA2tmcGy5J9bzriDW6M01aaUOVQWP7eSs++Qw8lAYJ3ah1+lwiE44x7NhNUsB
         SpTvuvkfk7L3Yy+Pk8HnU3/vSaGKugRTYLhwh2F27Xhl+o/Mhqa2fziGRwKlMSHAjZEj
         Mozu80bSRRcMChdq3WUi7OxHy+txGb7qmvRKbiyTbzt2cIx1zuDwi6Wjy3SaH488W9y2
         osxw==
X-Forwarded-Encrypted: i=1; AJvYcCUY2tpPAonjX5wuVkuepwLwvlKl3hSXJJDgmv8N0UXkjGg789tToa5jPzbSF1WZ0vFeftTIR0HtoIeUkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxM4mq9MkvjcO3WVsgpGC2ERa6JoziM6FzslnwEX4Fprt1+9e7A
	Z5cuzc6aFJefB18CngmFmTceGnmKuFfQE/iviONZXsDid2/fw73FPUnql2WTf+YnSk0=
X-Gm-Gg: ASbGncsELjyyXPvQT4uLvXkHLXx3ok5GEmFwCsn42syJ8/aBU37/WKsuzvh83XWukI8
	aDP99jyj6zr5W6LIrUo/+dV9BO8BYkic6pcqz+aJUvEiX7F8bugSnKC0ZUKsSPTbsoJs5kCphmv
	GGv0uT78sHtc7w0PfLqEWd/Sw5jvcup4P+lTQ5ihan4rpx+bN1rL2h09ipgO6HmRe2cZRux1mNW
	RxzgGhEt7jNhSqtfpLSmVLyuv+jomgazcW3rszjkyL6SyEq+aqE0UDc3AeTu7A8ypjIQQCwxi5I
	+xCCBdr876E3+YTm+m1njshzpyABNhUqc5qxDOabaGWKgPDuaZOsAbka/OVpcLsMFnO8RpkYw7c
	sKy0dO2yfZVaQRF463kKw18VbRA==
X-Google-Smtp-Source: AGHT+IH8K2q+ff9EmJzgqGezoG5ijxAfT3GRB5m50yeRgyCl4S8KgAneBei7J20U/ic7bxWUp8DQog==
X-Received: by 2002:a17:90b:2d92:b0:312:e744:5b76 with SMTP id 98e67ed59e1d1-31aac545a19mr2734380a91.33.1751612852693;
        Fri, 04 Jul 2025 00:07:32 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:07:32 -0700 (PDT)
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
Subject: [PATCH v8 17/24] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Fri,  4 Jul 2025 12:33:49 +0530
Message-ID: <20250704070356.1683992-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000733_654679_01D523C7 
X-CRM114-Status: GOOD (  12.82  )
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

Currently, the interrupt controller list is created without any order.
Create the list sorted with the GSI base of the interrupt controllers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cced960c2aef..33c073e2e71d 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -115,7 +115,7 @@ struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
 static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
 					       u32 id, u32 type)
 {
-	struct riscv_ext_intc_list *ext_intc_element;
+	struct riscv_ext_intc_list *ext_intc_element, *node;
 
 	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
 	if (!ext_intc_element)
@@ -125,7 +125,12 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	ext_intc_element->nr_irqs = nr_irqs;
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
-	list_add_tail(&ext_intc_element->list, &ext_intc_list);
+	list_for_each_entry(node, &ext_intc_list, list) {
+		if (node->gsi_base < ext_intc_element->gsi_base)
+			break;
+	}
+
+	list_add_tail(&ext_intc_element->list, &node->list);
 	return 0;
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
