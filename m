Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0955BC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 11:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+d9A7umpAdBGtDEtuq2/cGlANUoao6snyLZVE2jX6M=; b=kBGdjhuFTXwR9w
	6EPcwfqcL8MqygH1+MLO+kxOkxzbm7cl2zqM39LBiIwmMRFqAon8crPXiTrIku/r68Se/6idauVse
	vKvZlEbyFR+DbR3/Vnkpvl9EV0gLXI6N8OageVSIofusJHorD7eS4tfnNWMM8Zr32frrKAj116Yd5
	TMNgt2K3kxo1XKz0JvEEPGudYkAvXdQ/zK0ofiIcYSmfL7Wqvh/0y32nZ65ej2rX11HH8idRVLqyR
	2HJMsUaL8cBQRmkiR9RmZWCPkMjIVHT47lGz4Aa3FnFlf19veTNhftogaV5Z/1zzWgnXGy7ZhGSGq
	cGqwqg5qMslDIsi8RmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5TW-007Fv9-0H;
	Wed, 19 Jul 2023 11:36:10 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5TS-007Ftn-2k
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 11:36:08 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-668711086f4so498129b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 04:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689766565; x=1690371365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASJ6N1f2HtTSaai3pJY5ayecgWjGnn9m1BypIphubd8=;
        b=FNUJTTod8d8lkD0j2EWesqH3a2UI3TMHlDsCBF6GwyZAmOkXqcKEwV7u2/cVonYeiR
         LtQRO9edVmljFnQKOqJNIrd/xe/R1sZZY6PKCdm7l8CcXkLO6A6iBBF0RnhZVFiBd8mc
         GykZ3jM3Fzm8Ki7dKbZCksXdykfCpHEuNvd9ISOUhYa7AA9t5Ur7F+PhTagSyDzVY0YL
         nAdfgFdS9Plri5I+ku5NEbfrmRLqqU8vDErM99MLo9OJGBN1a6ecXpUCbScUtYV2Z8iD
         3TfS7WUMdTk+iEHmSEo09Vbj5bGCfWrfXuGhWNZxFCOnVEWA+eQS0RnS2dZu9bj4BK1R
         CEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766565; x=1690371365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASJ6N1f2HtTSaai3pJY5ayecgWjGnn9m1BypIphubd8=;
        b=cx/UhQWn8/AWB4klpG0Mn0YkL2Q62h3Da8DVImMlF0stSc5I+fANiGGw0XOKUH4PG9
         LLLyUxKswfKvSHwA7u+wXKHwSQPdYUX0ODAdZS0wBuWzuZrQUfCVqN6+nlF9YbC00NfJ
         r7Z4SBjSAYdU0iK0jPjnb7cYEO6OWeohoga5SnwjdueeegFb2xohquhwlB2cCX1trd2F
         lHiGwpIBlYVKgBAXQwX9lXMBPAxgV+lrWH40Ba/QZaEQy9Eq/05OYFvOBaICI1ZGmmkQ
         DDnTsAxrvEu6yGFYfLo/VWS6HmMi++8b9/VWmfhRO2cbRA6LuXXKZDIYeb+W5PA2X4Bj
         8aUg==
X-Gm-Message-State: ABy/qLZWOX5pNj6Jf9sApMr+iLyZaGlBZ4IK1lsU+nUxPmuDYJSHVIsj
	T+gJ5A3CRJQtEv6GxIigqYODlQ==
X-Google-Smtp-Source: APBJJlEt5NjiDD+SV5jYFnNxnx7P2kahDiZ6mEz+7XT5lgFV80n26BTX/gkKnX0j6e8fR7eYiMB7uQ==
X-Received: by 2002:a05:6a20:430f:b0:f0:50c4:4c43 with SMTP id h15-20020a056a20430f00b000f050c44c43mr2313038pzk.5.1689766564723;
        Wed, 19 Jul 2023 04:36:04 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.130])
        by smtp.gmail.com with ESMTPSA id j10-20020aa783ca000000b00669c99d05fasm3050408pfn.150.2023.07.19.04.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 04:36:04 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 02/14] of: property: Add fw_devlink support for msi-parent
Date: Wed, 19 Jul 2023 17:05:30 +0530
Message-Id: <20230719113542.2293295-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719113542.2293295-1-apatel@ventanamicro.com>
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_043606_890764_7A2BCBAB 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This allows fw_devlink to create device links between consumers of
a MSI and the supplier of the MSI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/of/property.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index ddc75cd50825..e4096b79a872 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1325,6 +1325,37 @@ static struct device_node *parse_interrupts(struct device_node *np,
 	return of_irq_parse_one(np, index, &sup_args) ? NULL : sup_args.np;
 }
 
+static struct device_node *parse_msi_parent(struct device_node *np,
+					    const char *prop_name, int index)
+{
+	struct of_phandle_args sup_args;
+	struct device_node *msi_np;
+
+	if (!IS_ENABLED(CONFIG_OF_IRQ))
+		return NULL;
+
+	if (strcmp(prop_name, "msi-parent"))
+		return NULL;
+
+	msi_np = of_parse_phandle(np, prop_name, 0);
+	if (msi_np) {
+		if (!of_property_read_bool(msi_np, "#msi-cells")) {
+			if (index) {
+				of_node_put(msi_np);
+				return NULL;
+			}
+			return msi_np;
+		}
+		of_node_put(msi_np);
+	}
+
+	if (of_parse_phandle_with_args(np, prop_name, "#msi-cells", index,
+				       &sup_args))
+		return NULL;
+
+	return sup_args.np;
+}
+
 static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_clocks, },
 	{ .parse_prop = parse_interconnects, },
@@ -1359,6 +1390,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
+	{ .parse_prop = parse_msi_parent, },
 	{}
 };
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
