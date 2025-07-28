Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852E1C83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+/7n2Oz4l3An3R23NNYONJVQv7tTIr3roLhxP9cuxY=; b=mwsfpYmXlC/pFs
	3lhAky3FTTgRKRkKtgchYa8TunlXAUBplYRKQTEUBtO64dLCj2cTtQ346yLCoQUOSbKG9IVIdDQdG
	V/wtQEIrfAZIJMojtspS91/RbfDTCtCk+bzZmX3x09NZSDEKPZW1e6/YefutevkQ6/EpFzyuz6EfF
	Qv1AUNAUI3BquiTiAgY1vkuKopg3StkrS6B6c2tawquPFbckmge9L9Z+85IIANSrtEMmLbAWll29F
	T/7Rk4odtR1LgVVg1wd+anolSXS1kPbdLJP6PpoEEsSzsGWY3lmErhdI3qicHWCICJ+fRVJuGZLkR
	fDSchuI7EeS7sb0n7PcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOf-0000000E8n8-2WWd;
	Mon, 28 Jul 2025 09:43:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOe-0000000E8mr-0msB
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Jul 2025 09:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=; b=CBquAO8VXd1mSKAG/7kvRCWwYQ
	pT8w3l6dRs9tS3xKTZaavrz142oahoWs1lE8K6NegpOiCCauj0TnwKgvfDlNQGZLGBposvWHjKgLW
	nALb42keOC4cn1WCcCeMm4yRqukOm0RDJU6b+zdEOAotsPi/Eh6HFWL+G6O4Wm8iLLSRlGTE0PD5a
	FFN6AX/M1AiSfgSX4wzqIsONG9J848uAce+Mw3fIQ7lyuoRznijUkJVci2ELCwP4NtbFq+2tSYhjD
	G4y/neEJa5Zk9c8RQ4lQasMpicREYTaSLEvG018W7gvUDUbU1mKvG+SkOP3JxB1OWKAwKvFrPBent
	VTu+D2Gg==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOZ-0000000CPlS-1K6d
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:43:50 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2403df11a2aso3730475ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695825; x=1754300625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=HBD975W3uPJJDwZYkUuzG17EFz2cEdPcu+xcciuVygFLDon4Lm+qVV955f7Z3yfMdg
         Mmbucj+L++XrVwfN8nQSfrAHdllNPmWjUYwpFBAt+Zc0M9n99ko/mX3LnihvxCNFUJu8
         np1ss+cGUcid6d0PnWPprQhrqw0F5SCBIa2bwXVOdUON9Sjo46PQbfbjjXVVTkJQG/4B
         7Z6Un0HTDIb71lqXsk5KqJQDdGgRqbj2ICwS/pHDoIpB0iRTf6fC04PG1Z55yDkyLU34
         0GwapHJJfJnxMgJC4H0XzUKYrMwSFQXXUZ6T6/XBGmhyvioCVmW92rURf8qEOe/wsPEC
         eeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695825; x=1754300625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiu9LW4OQPcl48oQrH2DU+mLfm2FHbXqcRasNtW9C8A=;
        b=T7mrH0x84ldrgsHCUNf2Xm+/icrpLDsY0clwvIaAGraSnoOpdxF+7ucjIaHbq6dwiJ
         vArlVCNHiAsbxUQduGYBM74bZWcVuDk4jkod4tA742wOe4KnNc/c34ayJlD2N7OE4o3l
         DY6ijPvEPUTwn8OFtjnaKdJ9mnJoHaT85L0UGV4kRJWGWGMLkdVoTgoRpa6BMWhfdqhC
         +mFMCOo3bR9p5xvjgkyYw5x3EMW+7xdEMJ2xEib5X+IgCwlFzu6e5/BU4hXwVO7T/IJ0
         B7nfg5brt63stxZN4P5PI+9EmcdeVc4HRlEf9BU2D4HQmfOJWf6gN1mxJjZYZlWqy+Dg
         1YDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUruuFAcqTybDlhk8dUzEVTfEVgI0tA0Vcqf5oW6WqQlpND0OpkVmUXDj/Q2DJ2ouJas1Pfoa+Oufz3jA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqtIbqJ1MSZ+jdy564pJkJRh/j7U6kvfxpFSLgKoYi/E0nFFC9
	eg55CdPPevWRWjgW+lMYvkO/IFk+fqj7jTvTCErHdpWitILyhOv3eQNrzGA9lghnbJE=
X-Gm-Gg: ASbGncsxrXszEYzDL7bUsJGJokFG8Lyg/JP+o9JM1IkwlqN703PC1Do03052BV+rHDD
	xzDutKaaL45JC/D3Jhf84ztGhZMsPg4FzpUEe3OpZnG+BVSVyCtIi3lgAx1RUu/gnzyidwwV9EH
	wbfmQT12+fOfeodwWMawXzXKVP6DvpTNhyyqFN+UyIbB8tHjC7ENsfIAT+cpWReQTxYtCgf1Y+k
	2GIsOY1LkfZX4ct/zsedMMkfXM+9c4GjD/FR3gXij+md7nhXpOENurs8mySYOEcz06j0TAAGnxc
	IWndC+uO1w3o0uNDMNGa+Ot37Uo7Sm/ed9/tUY8YZsIeUe7B88Au1K60CmINh83ZHsfWITDKQu4
	slMaCCeaYAc5lqLZ6ZLhmyvW+AlgleA+9kdbskCbZw1L4fe+t+NMsldYOr33j
X-Google-Smtp-Source: AGHT+IFS53uLoHppmjznOMdJcZkAmiTSfCzfdzzbbuX7HdvnQYvfyEZtYQl8EZXF/rrU4jEX1LYO1A==
X-Received: by 2002:a17:902:e887:b0:234:bfcb:5bfa with SMTP id d9443c01a7336-23fb302a71amr154565295ad.15.1753695825111;
        Mon, 28 Jul 2025 02:43:45 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:43:44 -0700 (PDT)
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
Subject: [PATCH v9 17/24] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Mon, 28 Jul 2025 15:10:25 +0530
Message-ID: <20250728094032.63545-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_104348_412916_390E4DD6 
X-CRM114-Status: GOOD (  12.45  )
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
