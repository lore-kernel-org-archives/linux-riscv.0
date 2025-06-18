Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B15C7115B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+/7n2Oz4l3An3R23NNYONJVQv7tTIr3roLhxP9cuxY=; b=q7hpGaZqvSgYXr
	eJZm3FRTWkzb8tD0tCvmKYrPIIphgrbTI49PcTg6mgY4J2eJ0XE8rp8po0tZHRcyWGje3yoJ73GsZ
	irZjoKWIaguGngV7hJ4OqacVrhpDVnuPFauzsad61ufKCHxQv11rbj8+le2qdS2HqJKKLVtpheZF4
	HaA/suKEdUfGEx0vSlyfj9Ppoh11avRXjReDmfJity83pi8zfIrbNv/aI9oYJ+JW5KQ1bnuPA3sxt
	sl9ZpX8zZZoikvYiev+2tlurjDcH5D8TufQ1rczRTPBWI3DffQ+Z52bVa0/I+Jc2MTuit8oil2xu2
	GVCJQ2LLSy7nwJnwqHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsqh-0000000AIgn-1C5s;
	Wed, 18 Jun 2025 13:29:07 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRriT-0000000A5aq-3jpH
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:16:34 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso5461878a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248993; x=1750853793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=F3I28KXla2oPrGpADwju/GUzlT2khtuFigRw7dYoyvejQguWA1u4CNtYjoJhfCnfV1
         yteRYaIa5Y0t3ct7hBV1ConuWcVUgdOjdiYhXOdEpcwLxCBqgQc+Ntv5euD+4wTChKR8
         VWDUsG2Vi0gsf3QNXtXmTLmRaqDUcEG2Z801yWRWXD+UnHImSjkm4Mu6QFhlogZ84SWe
         BPLEmvOJfNYsA3aOz5oH3Vn95/aoUksRidOirfcN2TotPp7H8C2eKU664z/ETuVhhZAM
         wokLf5tMg6KUuaG8KPi7KBrJSfhcRu7Y5xp/8aKVjUrTEFZAQx4fs6YlFL2eCd+jB2I2
         O5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248993; x=1750853793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=gkbmnVyx5uGe28stEfE7zClGZI0oAm7CbozFuQa3SAykwQMhrqpn50pAHJJ3fK7MFW
         DOGBZcREljV+5AYSbvHkKKQnyqP5E+7iO30MV6obPkmt2hcjlA9n4ZaGKwhcXNwfiWeC
         kmrKUFs3HYKgyxY7FfTaVZSZ+dZ0Txnqepdaw/L0azZZXp4fQ8nSzoAddu9uraAOJEg9
         4dafcutJaIwqliSekqaEpxmm4EdQMcOADksdrbWgZVh9HRlJaw08OjijcZA7THsEu+ra
         WWJQSD4IOwn9hoxc54A77g7jwBLW1tIsn92saWnP4jb6Z+Y4dJ7RPnlnTWjSKGhadghk
         twEA==
X-Forwarded-Encrypted: i=1; AJvYcCUwp5bMBhCuat6YDvuII7jsY5rV0oUrtDvDIqJ+T1oOE+4zsqhJaLtMQMxYDaenQ2+IJSz9HCkjs4huzg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo5Y97jEjYUG80nTJrolBkCxq7RLQ52NE8mil8FBR07QHBDeYv
	oV7zuHsUqGjS7FEQeZ+RBBuil+MJVxd8RUwgJ/stz264iqy/vN+CE/IKyvY42Zq+zDo=
X-Gm-Gg: ASbGncvYCjKAm/EXOqO7cvR8fY6dXStYHCqLHWrvqzPCDKAH9hB/ZrWCcbZxvjDo1+0
	mNZDRwJQrAvcrsH23syB86shse0a3d7+o5JvhsX0hYw41OrN7KUgjIBojhZyeo7LmS5K5YW9mOF
	gQpCHDoVx9LBLBE/0gLsvZm/kCtoCtPGHSbhflLdsnh5QaJufNUOna+IFzfBHeMrXUtFqLBicto
	om8VXiz8eC/uKnrGlGJ4x/BjLZgSLIG0i6rKDFzRORvfEFRyQyqDVipPCAcU2nOlvBdai9CmQDk
	Jrx7AF6y4Uf2TiNGmL7xwOcnwxWTt3iGGeuzmRcMBC6dPLCDSg6BkoOzC2NNYGROUTzcy22d8db
	0AtjNeEAdAz/7o6f+Ag==
X-Google-Smtp-Source: AGHT+IHwjSX/UY3bVpxGP5NviX4zYZWa4ulipSV5sKhfmblor2hgMtTZAatndUzhakZYZeOzNsQJuw==
X-Received: by 2002:a05:6a21:3283:b0:21c:fea4:60e2 with SMTP id adf61e73a8af0-21fbd50703amr29528863637.3.1750248992905;
        Wed, 18 Jun 2025 05:16:32 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:32 -0700 (PDT)
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
Subject: [PATCH v6 16/23] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Wed, 18 Jun 2025 17:43:51 +0530
Message-ID: <20250618121358.503781-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051633_932240_79EA44CE 
X-CRM114-Status: GOOD (  12.75  )
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
