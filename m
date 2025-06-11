Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8553C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+/7n2Oz4l3An3R23NNYONJVQv7tTIr3roLhxP9cuxY=; b=f4hV5Y1jKvVbj1
	9V5ZAQriryoCpANet5wtTnq16McJj5b70II9eT7EZfnJag1N1tj7RF/cFulDSHHKNwDfCn+03l9Y7
	5R31QrpWLrhg3B1YswVLwbTYgSPYvE3p15fmW9OmuTGVqRXg80vEbEnCZErhwF60pwMKlwQKm/gLX
	x5gD81lVtYGyLoJVRI9+8LRGE6IJGUHbzPc9tAGe8ue0nnfYQ5TXJLDi554APAQOQ0kP5bFRTZM/T
	tjeifzVoomYnSU8MYxE7pJn9A6g2qOKNPaqQSRCD32uTvtedWeNhbhD4fjFyJUYsgI93TSfoTFiHn
	v5J39U04mzANTs2GyPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEtk-00000008zdX-2V9e;
	Wed, 11 Jun 2025 06:25:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEtj-00000008zd7-28rx
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=; b=hRkzT7iDygjwFBY3v+5Z9IBYMF
	1XA5qKlLXvCnZIhov/cKNJTJIHm8+Y/uPt+1B/nTrysNCHfbzCE1dTw/2loQmCGEe7nlfekwQ98bv
	n+XA21CcLOBK9urYT6VVot35xAOYQ73U6qZv30u8VTRY2KgB5RHb8qATm1ChMQjPVnRCxCw2RV23J
	uuBfA+iN5W3jd4bMvGQkqzDH1e24EsXlmCRbXc09gbVIpvR8S/2vrf77fcRlEHVjlr762uCPQPtS9
	m7Mb4LdyxMh66Zuh6SrC73vyhFgUl/REZ7hIPN5NbN+uwsMY/FfaPFstChLng1SWUIWq494PXjbxC
	JIniwd5w==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEth-000000028HW-2y2b
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:25:19 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-23636167b30so17448055ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623115; x=1750227915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=XiKXVKghQ4v866bBVUSx1xfEcRrIaq40kJyFljl3eGcyiuxhPkfFPNZvNGxa5YA7Ir
         g72Kj/NzHywJ4DPoj8fUNLgVZ+qZg6O4KsaLUATp7JPuE9Dr7lJwCuZhy3an4CsM6xQU
         yDNUZLiedqHCuA6/hMOh0zAR4tdPqCZNWxyRTmYtNQhckIT2Ios1o1ijLt1lLxxiRtuP
         +JVPIumbyELKbO/9M7Bi2Fj1Zy/hvLi1l6OZUmWXlhtFfKW10Tgzczr9/8Dz9upxvwN6
         JjFdYQLZm160ZMEj8zg0qyJeC7kj2m48SCkb30BEj4SrsERSThyq2utozfNdhQdEr4la
         /82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623115; x=1750227915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=L+QosP8LJmpogZZlJbRdbslQxpyiJ6G2Pe7oGKVgv/NBQaEl30CUJLaZ+5YDQ1sAy8
         2BXJZ7/ZMtUWm15gBMDI+wMqP41n6V4t4zEZrBUeve/NULOYagwkePLY3AWZ0nI85g06
         FV8zdExrD9LekNk0JJmq2GUEUYy/n2oOxjw3W8QbAZVXry5N1QENHLfqHa/3eACmgI39
         uy0/jYX2/Xk7sDcxAVw8SjiBHwtDSMfkIQUHZucaFrs29C10aXmHk7sQ3LklgX3b+TqJ
         SW/KCuytNNZ60Wc8/9sbywBxeYr7aMnwTjzGufYwp+GOTXr+lmPdCmJemxA64kD0w338
         MXPg==
X-Forwarded-Encrypted: i=1; AJvYcCXInRbgFbJlYrH0aib435E+bgxEwyqYBNPQyGOtYx9RwPklTaC+BpuFv0vyWsPbzkYBP/1n7ymxqx/UUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEnjMaCnI85U+EiPWTyVScb1VYqIONOThMM5TbfM3DGYYRDtHE
	tPf5LoiKs3RWNN5TeQNvtOYIIN9Z6AmNxBYVJ/LZAsNv5mbuWdtxdipxpa4thUzGvrQ=
X-Gm-Gg: ASbGncv7FONjTD3/t+ldeYjnFSE8xa9gdctM3a6LSQzKe2wMWzZPKjq9Btd+MLrRMH8
	ktqSh/6CZrAOiaR+oQp5LDa1arggxCjj9MKkeaRRdh24RLMLi7JmkNCnJYhCmgvMM9O8xxBrGBJ
	j0dfRpA4hHX7kIbwBHk9Tg65q9fTk9KlDHLnKuuVUgfiaLjgxKHnDo9u5A5znLSvtTuK2i14g1S
	jp7ZjnDDXI3kS436uyzs8YKNX+Kde0pfOb9Z68nWAZyaXNIhnq32t9w6NYGAiktuoFzA8ZFZWxl
	lpfAR+TG2rJDAB/Mu/UzICN8uv3VdsqrvNJUYbXoCcCu+VveEq5iN106gC5g1Poh01mnOBTF/UE
	snfLeBofeG/92tcmkLrWE0DsVCw==
X-Google-Smtp-Source: AGHT+IFnqBNnTwbehZbdbVmid5c+EUoLDt9iVtCEphlQwJCdvquAFaXOuTjhhB4h2PkL4dhMiL1o0Q==
X-Received: by 2002:a17:902:e741:b0:234:c8f6:1b05 with SMTP id d9443c01a7336-236426b7493mr21510465ad.52.1749623115115;
        Tue, 10 Jun 2025 23:25:15 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:14 -0700 (PDT)
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
Subject: [PATCH v5 16/23] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Wed, 11 Jun 2025 11:52:31 +0530
Message-ID: <20250611062238.636753-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072517_846334_9FA0B559 
X-CRM114-Status: GOOD (  12.26  )
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
