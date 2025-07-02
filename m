Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E64DC83F05
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+/7n2Oz4l3An3R23NNYONJVQv7tTIr3roLhxP9cuxY=; b=19zy+Angp5lSO7
	JylxZ0mpuFYf/98G7b2vh/17XV+81C+UI9d/dpM7Dd5gRTUq/peqbE80xPtzi5ighOZ8Dke9xGkLx
	4ZNmSJ6ky36Rq+1eAGKMIvq9BocogxOTN+P92zugMhTUMEnI4eocwXtBsNR4vimlSyk0xhI0BNO0Y
	JdX3cbjkAP4ARYT8nrAvsnaYbiRKpQ9xuImmVendOMQCjc3ToY3xzliocwtUn4MBfFZ6oz1aBuexp
	AWI/FH7i34sr2XceKO3Z9Ea/hUnY9jHpPtf5UX8cb7lqr99sW1YIGxZXtROezggYOn6YvpPybPe+O
	rDTjj1cFPBGeVu4CeXEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsFN-00000007XwG-0dNf;
	Wed, 02 Jul 2025 07:51:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWppQ-00000007GEA-2WBc
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:16:17 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-236470b2dceso34032045ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433376; x=1752038176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=FeaPbZ/+Xt+SJcAEaWdDs6gt4PuOlaSV/zTJCvJEW7QzpEUpGMInxfanrD3VPTGiJO
         QZ8GFXyJSVecnzhsfCkfQg7tYuePpQpFnS6YZgk0w64rmpzDX+mYiienDtVzVRvZZc38
         C6D4U+uBScP5RmZEz0SES+lGMEu7PxWlMYQR880PorXx5j+Se0kExsW9LVJVQfSufmHC
         6InsNplL5x+HdriW0lE2+uZJCnFqSPYLBp5/Z6n4eCrkC5J5T5vsJ1at2AY6ZFLiClyG
         Js/jWFzl08yd7McywIHtfTU1S8ieqd2J9+ULpqUAOXGMmXT0h99qVQqNdMVrWvJI9f46
         Rifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433376; x=1752038176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=lZx3BY+bthyP9Mj2SUfGFrdtpfyds8gXChnibTMhIaAi/YEZ8iEJujHhrHWUMaA5sB
         Aka58hkAPcPwNd3b8dlEkOFuQUBXmkOTiY17gY2gpxqgKnJrfGxlkM+ihMpDUfrcgQY5
         Wxosl/8HrJFZVJc0z4bGTUJ/5TY3+pD9TUbDaM7j7rSjsPJZiDn3WaGIy7iVYc52h+Qu
         GLj4CyAX9hkfyRJD6lRchMx7bYlYAsrdvLoZJDZzr55iFAISdqVco6MFQAJ5kE+BTnbe
         CYy67lkGT7q2Bq45dmPMQgmhOF6F6Els1JBhwyddfvDJAFYTRWc/Lf3E9uSPn0889KY9
         YGjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOUCt0geCN2T7Jg+NacSN2tnAzv30Oe7z5eSSdtzxIm/c5f7lgjv9GvcFRMxNGwV2dtW2NV+SDAUJPlw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo3eRRpgyRieNu9v+fzLWnpEy0gqAsloOO7C49phRHYak3sVGO
	TO62xSOoZpzFzBDnnDICIpyW1VyDXD7vpDvoazVnPxYm09YXZl/hrNvgsipVOQo9U/U=
X-Gm-Gg: ASbGncuLON2ZgJecctxR1j3uCKFFRPVVFPN4tQ2ach5o/4nkHQJLUP8pmAP2QbfSG6a
	quMBcgcXYnxBvAY14l1ekL+COoV0wxvKiMm3dusvBDodmJ7nATBo0yBeL4dHk+5s994xhlCaj6S
	lP26siW/R78ZpSQvmV++Foj06BplYx0oMI5G2BxoEjwU9nbeMf16Q+KgeTYpgVaYvVLSzwtA6Yu
	zhXIdkgp888/5wVZYNG7tTdCVesnfrNf9TOO00vKLV5vGMpbXaRDjzqlTPdhjOD/hK7oeCN3Pjx
	tEeA+P+Iqs5VF+lRyKbMR0pXcPp0VpqAQtPS+PxgLwBIj1I4asonNd43zQJAiaI7vEwLu7V6IGB
	pv1y87xB2V8E9lxWJ
X-Google-Smtp-Source: AGHT+IHK7JJshpTCYWIRPYhBfujfdQF43fCmzueM9e8EwtFQkDR9S8tXHvcjhHdLfuN/8WzEAqudfQ==
X-Received: by 2002:a17:903:948:b0:236:6f5f:cab4 with SMTP id d9443c01a7336-23c6e4d3578mr24923105ad.5.1751433375731;
        Tue, 01 Jul 2025 22:16:15 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:15 -0700 (PDT)
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
Subject: [PATCH v7 17/24] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Wed,  2 Jul 2025 10:43:38 +0530
Message-ID: <20250702051345.1460497-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221616_638584_BA065B77 
X-CRM114-Status: GOOD (  13.57  )
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
