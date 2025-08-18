Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2898ACA0EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 05:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+/7n2Oz4l3An3R23NNYONJVQv7tTIr3roLhxP9cuxY=; b=YjyZhDPFEvMB+E
	DD5VR63aODWRiezrLsOERobpsMbDzIDd+V38gM4UiUwHLm4QZQRuNZ3sMTLv7vWR5pYnNcv/IUN1P
	36pKKSel9xcl2uiLiXd3bspHHh/kfhVJ1arXkkGZ7zbup7Wuk6Gkv9mybYf+WWdoDlNF3Gr7RcfIt
	qh6J3HtTpblvkfRwISjfdU5MlTvn1Wj4kegFB4DpYOKJsDF9doAWPqlFa87PFA1/rsU9+BqMyAxir
	xnOKTj4vnBefZCF6pdiObu/LLczWLaRarcDGG08vsO5wE02Low+D+lUWMfr8RAMp29ganYhFN8/o7
	EFKUy2Nq47nC4aUYtImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsGM-00000006XCu-09H0;
	Mon, 18 Aug 2025 05:18:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEj-00000006Rh6-3aOS
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=; b=eYJ9dbvouQYCDkJ2aIAyxz2794
	glOefdGVkFHH4nnxOA4KNSPjdyGiRd7HZhri+FnUtKeUm0F89hEx8WhMDs/wtx1FX3NBjtuVPxXOe
	84Cp5/PJMgdX4fOXCIKXqvJfQr6jy3ulScsU99AgJWQYrtO04os4d9716XDYggEUdqwmgB27lKi/c
	gKhOLymnBDP9+dylXBqfpQ7mn6eHH1OvUln1B8vs1CQm8AJNrXIKGbD5a3iQXCgfwlhiaSpu9XDf1
	w5UlhNK0TqLzef7DwFZTbE969Oh/ml5vuLNxGhq17gOTmugl6lhEwgELMRBuh/D7keGDsSPzNGZeW
	84uY9d1A==;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEW-0000000HECd-2vvZ
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:12:36 +0000
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76e2ebe86ecso4192587b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490347; x=1756095147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=HyCC4/SE27LuKmyNa8Yx7KDSAxQuEORgtA+5ryKHgvm/1303hrwdc2UpMQH8CMKTl6
         q19uAIBxPQz0+UKTo8gL51Ln9U1JiN8VYGSpjdstF/GnCqzcBqXEyH1h4f9IQKfJLcTY
         tb6hgq8bI77QHpK6KW0mAEKTbIOWaz8MHzWzikDsJxWPsEXdWoOA5gzzD6vXZeHC1JKp
         6AkZeXkyvmODR6xQ3gDLT8zbpyoesDgiNwoX2oU9AqkXbip+gCIjywWniorIPzaFtB2X
         3OHB2j2K3IMeiyu/UKPMx1vsJYW2TlULUTNq/+dXPA9mgodjsCnvwRaltaB1HNxds/cZ
         OC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490347; x=1756095147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=uComngZKnRukPjheOUaT+7LuIGtV6QDEwGn0TThXk9l9oTDLXixjxF3pDz/avsjQJB
         YXm+ua7jF9yHiMYrIGrXeM7c05KBP7B5Au8I8LVre8yhqrJJlP0mhYYpJxB0uMfETUhh
         SRFYhqVnBA3+TsuVb7OJExL2Gnrw1yptf1/x2UILp95RnBnM4NKjSeY/AnEiDkc9LTZ+
         7Zx9v/WCcGr5rOEKRqCVKnA5TIVXzw3sg4LyH7LZf8yKrdggA7xLhc/paWYJzRE4QRvx
         u/fIEpUsyUkbc7zkOluINowTAo4zgYgkK3wRow+LJ8oxujQF7feSs79qKOSYvi4cXanz
         kUSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc7DV6wTQb+y6Bn5QUPSi0NYKsYup2fGvWoJrGDFznIVhnJqGhgMi0ZeiXM5dX5ePhN6mPWnkxpcRVHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqrikauCjXDw4UDpxZiT1ENhq+fDtovaFxiePab6QZ3KxUvINg
	98zdnVMZrL+1rd8ItWqKm7qEFlaCtLcAcilYM3NOcBFrygZFikKIZ/EJbzysOr4UaKI=
X-Gm-Gg: ASbGnctyqSNM7NIstCqh20qAW/Qme3DpPu4NIvvNEY0iHu/WJbQBH9CB5/ywqfAUvJW
	D62THfX5HvtaPBizXfgwXs2NLeWhEJmdXoaARI6zG4ZAkBWC0S4qiR9aWqjqrWU3ZQVGwtijQR+
	4v6P0ZswDRnNvJr77ZLzmMGPykXNQHn9RuRBc9TgP0r71OHz69++paKkm/Y3SsPYJLZK+aMS/S9
	5f2u+/BDws4kB3oA6jH8dNf+CXY7MjU+Ata2wtIS1fZ4PLDY7EkyuDso/vTCu6eBjh54xWuE2fj
	AE6PKsoqe/FcodN9eJj/y5Shtrc09B7i0ejZpjVhqUMN/RDA0XKbDCdAGlyM2RYXGm5oQgtbM19
	8g92sglsXjjYGYNlXEogIwIYJDru8pybXv/Zhgt+3fl6V/6mlpPCsnA==
X-Google-Smtp-Source: AGHT+IHa4chLy02LQ1m0p6qX0i3HzDZVLkMVRhkDtgaV/+W4jzDIxOW46iPZExZlIfoygb6NLHSF/A==
X-Received: by 2002:a17:902:cccb:b0:242:b103:18e with SMTP id d9443c01a7336-2446d93b694mr107561665ad.50.1755490346744;
        Sun, 17 Aug 2025 21:12:26 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:26 -0700 (PDT)
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
Subject: [PATCH v10 17/24] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Mon, 18 Aug 2025 09:39:13 +0530
Message-ID: <20250818040920.272664-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_051234_411346_3677EE88 
X-CRM114-Status: GOOD (  12.46  )
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
