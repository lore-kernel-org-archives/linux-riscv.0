Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14815C87FCE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpOBTHZjHMT5e3JaiPjdgimttRug4OQn92MCAspwfhQ=; b=P8PazPJ8fyrsJ5
	6AYOsRHccV0oJqKSNK+8RS7G1tf6t5UUUyWEsvo2+/i9YYgX2i/rnZSwi5CJSmk+ZmNzog/vwyFyx
	gjOJFV0Y+tsvGX9Axi0rXwc7Tp26SkSmWPJQeaYBF9KulzxsaL5n2dZV/uSDXgjAk5u2Vg0O6fV56
	wT3KdthItrJEvauVTeqhKavikgLEyexEM0dRseA3ElPat63/EBQswk3GnSR6gda7o7+wbMHqObD/h
	Ovxo37NPoDkTYrs61D3V821czKrmTq3+ABFALtlJO8UG9aA/87f0oziPNZZmgzn6/f49KDSeil8DL
	vSjmCE3aWoMcfwtmrO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKP3-0000000E8vb-1MwD;
	Mon, 28 Jul 2025 09:44:17 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKP1-0000000E8uQ-0JCI
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:44:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-31ecd40352fso760423a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695854; x=1754300654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=b6FUvwBozlENLgaDCO2dbb4Bt2Kuwuv/o3MdsUGEXu/xTY4inqCz2hjovSf8JcwzyC
         VgIFJMb0zBemHvxK4aYH92uEZDaAnXausIOaRHlwjUAWwRU5QZ3VqRsMY7BZBLcT0W+q
         pNQUoOaRJfC+msUk8wXX4CkMC5jdhj8tgEjdvo7NKuScweeMV1f2I0nSOlBf5c79B/ep
         DXY/hveeDsQoOu8slXZGKl9ZPZQdxLwT/EdApujn46/qykfnHhAv55GircM/jkHSs9Ci
         ++34RMYqEcVuCQ7kFOuyZ8WiAvI508u+ufPdL026PM/ijwo/c5g6gjMHh6RPsA04qPyY
         dHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695854; x=1754300654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=DtJ5mzU71qfUxE1DT+JtfNi3dnGaUuaEIdlo0wqc2k+pvzKejIT0EwcIHbPgAVabYo
         X6DHR0a9x5LBBdrESqns9vOLRKWtVeJBql90PI7U4lL1Q0SvxY+Q3HNTqG9ceFsYO6UZ
         fmKWRp9KN7SvmFnoXgC7NnktntgER7w9VMxo9HaFGAfEq1sB6RNMs6eEyfKLvUD4W09X
         MVyR6ftz08xlr0tfSW1dHssv76tqNKBNwxOFY98inuzvE96m+kvrn/mi3btU7KeE8Qgu
         76T2teLppsXXyWcH2g37abksorWVLXftSYfxAoOk4veK+9JOvVJ8Lxe1hZ6hFRQw4Ptw
         drBg==
X-Forwarded-Encrypted: i=1; AJvYcCUnkd5msAYz9029ZB5ACJWzzRwvph+Ug2kteLvwJ2M83spgf+EeaXEnnsVA/fEV1PEBtCgRUX1wPxMyDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSh+32a+VQN2KgcAlEP37DYDNg32YMN37dRQZ2IJQeVUUhaRT0
	QAt6vv308PeAKItlSmZ6SCzPubTzJa7hRRiBoR5Wsu9SYT/mYJAB48K9uebRPbsEnVc=
X-Gm-Gg: ASbGncsFJQCUvnvjzGIBr6VTiewxr6LTDLK2/L11L7gZQ4b18DI7p8v+UBILY9RgWkc
	LlgcUdPcknWrQdbMZxgJ67kSu9st1DnmcrfpQcGu7/7thBWDyqxV2R5dt1Yh0kaRA6WiuMosAM9
	pKn+Nu1KVtsDj54mMy+ms7mpDUff0Vv7etpw9aVx56px0+WA+boAE53KedDVeKDlZFYD8O96sAW
	sqroQM+DJU2S7F9befy2bEB0c7y2+d4D9Pr7sObf8+L2UJ74eaTUGPSArb6Bcz67/CyzPXizs9c
	nibjH7VUyEiaCv43/k7rXZ71q5580ZxfQk4QTODvd+gRDd8sbJuO3ayKKITGz6g7Cu68SpXnA8O
	8joOMjYN4HEhaU2aMbSWuzG59m7tJxKc61Lo1XS1esiYy5hrigwu9L0s5LloO
X-Google-Smtp-Source: AGHT+IEfvIXwwRB8WyRBePKuANG8ztg+Nz4wcFNvlvu8SORbpxtGlBUAzzVaiaDoPOX1mWYxV1I/1Q==
X-Received: by 2002:a17:90b:35cb:b0:313:283e:e881 with SMTP id 98e67ed59e1d1-31e7785efe2mr17685144a91.11.1753695854107;
        Mon, 28 Jul 2025 02:44:14 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:44:13 -0700 (PDT)
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
Subject: [PATCH v9 20/24] irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
Date: Mon, 28 Jul 2025 15:10:28 +0530
Message-ID: <20250728094032.63545-21-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_024415_113131_0604D532 
X-CRM114-Status: GOOD (  10.92  )
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
