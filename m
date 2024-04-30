Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3BDC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 04:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iPHTbKI7KWMnbWUhn0qwHFaCEubKoZAmh4378fT1+yg=; b=xyeH8zaQbmUDFY
	eWLzms+qUM5dPPsDyQw4VY1HVvEq5bo3+jMISyXVLODovUN1Q7Rz0X2yK0fDo6I+csiY863NyBcrK
	EHATMugmZHo93rAewuh5BvRYmBYgCN1cC4hANo0/XpLiKaGEpBc+G1utQaHZWPREX+STMWfEWJAn1
	kCiGCilUjKnYTdHCZR0q9PleEjdb+J0b0I4A6dA4tJTcIiOYKIFuslbiaqfu9ibqYCxki2Jgc8n6g
	ZcMdfoLu8yNIQSHlSFJYFqVzTH14F74lf/H752ImjhqaMrDRSYR0Fs6IFKgdwPH7X0IBl/MVgbozT
	g3JrLhMcZGin7fOjJgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1enG-0000000507n-3mhB;
	Tue, 30 Apr 2024 04:08:38 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1enE-0000000507N-3Z05
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 04:08:38 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-61b4cbb8834so52618497b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 21:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714450114; x=1715054914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gCslZkcQd5RtLXYuX+Nd2JyjWr4Wgb6SjvGmoz0L3zE=;
        b=C7GAwtjdvoYhBRFWvbao9Ts9+SbQ8luukKgi/WBo4Vo5e51wgActEiQYiIyAga1AF6
         aMnJHfVooZ6JDCT0OyN3k2y6q288EJHmXpYc+kiW/zS+ZVd6b263cVWA0LrNrNrHT/Rn
         cc+lkKN/aIAtGGTbUUK0gI4ySwUtPMXeU2OAYZsTJCL/WX5ZGcS1efmNlwm0VomttHEu
         meb/R3xZAuUiqELHUZ6uj3bSMFkWdJDhV96ldbe/YIm/n4Srwmlumg6YtAfjde94VejD
         fQ3+GrEasxYizCFeQ5c4O7q0787Ke6aUblHXKOPut5lR6+FkjdOm2L7xwyJI34aMLbuP
         LNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714450114; x=1715054914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCslZkcQd5RtLXYuX+Nd2JyjWr4Wgb6SjvGmoz0L3zE=;
        b=geqIi34SLKVzNWs+i/gdgcI4yU3o0lF3UmTTAeeW8Bnxjrk7HyR9scPECYbZ4wOqoq
         cwbCN7OYdQlDSIZ4izo2O3y0+WP1Jp71UjLrMgI/loxGrl2QkIaihWQC/VY2Rzy8+IFX
         FQ8JaOQ0mwwQ29XoYkJGWTI3JLcTyrrt4zayUT6KPCgQyw+3qGSNQ1XPc1GCv9gygS3p
         BHJej02Ht58oyOaGQ/fCSSpMK/u5005wVDou+mTa/BHZ/AoqC41CgaWe1iGzrCQrhm+5
         ncBBtwIovd3I+hBbCNSv0alZTlkRps08bdZtkFGpdRzjCz3LOuGY6XAK6jQAWRTXRp3x
         b/2w==
X-Forwarded-Encrypted: i=1; AJvYcCXwvvhKtBv9f3eovWQm/7Fatwf+INJ7k4UTkI7K6HStv2jBFXz/Up9DWxMkjycdKgE4oUIaGocnhiKPKVmKBGkHi/tF87S/3ZMZNBQhwq4h
X-Gm-Message-State: AOJu0YytoWvV7e0vOB3U5ot/nvtSY6CdcmVBDRj2KSiKCRlvZDgSmbMB
	OeZ+9e+cpOUxuWDRsiknmINCfHfzW6ZO8xm0nfgqioGb2MSunL1WqrN1MyEIUY0=
X-Google-Smtp-Source: AGHT+IFwAJsZsr7vaGkLxE1T7x6+TzNPPDBiFljXpmorJhrntyhYM0B3aRKRclxB5YSlsfW2NRqwOw==
X-Received: by 2002:a05:690c:6d03:b0:615:8c1:d7ec with SMTP id iv3-20020a05690c6d0300b0061508c1d7ecmr11997230ywb.33.1714450113146;
        Mon, 29 Apr 2024 21:08:33 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id i190-20020a0dc6c7000000b00618876dc75fsm5694002ywd.27.2024.04.29.21.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 21:08:32 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3] of: property: Add fw_devlink support for interrupt-map property
Date: Tue, 30 Apr 2024 09:38:22 +0530
Message-Id: <20240430040822.1133339-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_210836_916176_7E2B9C49 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Some of the PCI controllers (such as generic PCI host controller)
use "interrupt-map" DT property to describe the mapping between
PCI endpoints and PCI interrupt pins. This the only case where
the interrupts are not described in DT.

Currently, there is no fw_devlink created based on "interrupt-map"
DT property so interrupt controller is not guaranteed to be probed
before PCI host controller. This affects every platform where both
PCI host controller and interrupt controllers are probed as regular
platform devices.

This creates fw_devlink between consumers (PCI host controller) and
supplier (interrupt controller) based on "interrupt-map" DT property.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
Changes since v2:
- No need for a loop to find #interrupt-cells property value
- Fix node de-reference leak when index is greater than number
  of entries in interrupt-map property
Changes since v1:
- Updated commit description based on Rob's suggestion
- Use of_irq_parse_raw() for parsing interrupt-map DT property
---
 drivers/of/property.c | 50 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index a6358ee99b74..7326ca07adfe 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1311,6 +1311,55 @@ static struct device_node *parse_interrupts(struct device_node *np,
 	return of_irq_parse_one(np, index, &sup_args) ? NULL : sup_args.np;
 }
 
+static struct device_node *parse_interrupt_map(struct device_node *np,
+					       const char *prop_name, int index)
+{
+	const __be32 *imap, *imap_end, *addr;
+	struct of_phandle_args sup_args;
+	u32 addrcells, intcells;
+	int i, imaplen;
+
+	if (!IS_ENABLED(CONFIG_OF_IRQ))
+		return NULL;
+
+	if (strcmp(prop_name, "interrupt-map"))
+		return NULL;
+
+	if (of_property_read_u32(np, "#interrupt-cells", &intcells))
+		return NULL;
+	addrcells = of_bus_n_addr_cells(np);
+
+	imap = of_get_property(np, "interrupt-map", &imaplen);
+	if (!imap || imaplen <= (addrcells + intcells))
+		return NULL;
+	imap_end = imap + imaplen;
+
+	sup_args.np = NULL;
+	while (imap < imap_end) {
+		addr = imap;
+		imap += addrcells;
+
+		sup_args.np = np;
+		sup_args.args_count = intcells;
+		for (i = 0; i < intcells; i++)
+			sup_args.args[i] = be32_to_cpu(imap[i]);
+		imap += intcells;
+
+		if (of_irq_parse_raw(addr, &sup_args))
+			return NULL;
+
+		if (!index)
+			return sup_args.np;
+
+		of_node_put(sup_args.np);
+		sup_args.np = NULL;
+		imap += sup_args.args_count + 1;
+		index--;
+	}
+
+	return NULL;
+}
+
 static struct device_node *parse_remote_endpoint(struct device_node *np,
 						 const char *prop_name,
 						 int index)
@@ -1359,6 +1408,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_msi_parent, },
 	{ .parse_prop = parse_gpio_compat, },
 	{ .parse_prop = parse_interrupts, },
+	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
