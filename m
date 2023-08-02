Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00E5C04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTKwCj64pe4dnt9clSkIOx3vOUaBefzRmbWt8CaDnTw=; b=mWeTS2HEr8yXuS
	qEUf4kgpUSDvoYTgrMrPtbI4KU9yWrVK0Ne6Zf8fa1mNINfmz6dbjTC+ycH/hYm0XOh2yQPo9n/98
	KYK4fzMQaRX4PV+fp6BQFkhrOPhVHJ+seKp8kQ7WU1A0envRjs0IPdtsLvzQrshlKyW8RrAic/kj0
	GipaxotkHQs94TGQ9qvJIZ3tZgREpyZQ2v/ePA/qhhp+/SyvIQUXjOWp6JPIIj08Qd+UQwFWYWXxL
	O6lLZl3cpe6CmVb0Q3xitXNAlo8H66feAK/u2rmX6+2uJT95pF8iHXsqVWbmfVDw3OdazrsZJvIwx
	fQKm4hmFGxRTHQmk44Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDLG-0059ZL-0l;
	Wed, 02 Aug 2023 15:00:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDLD-0059Ye-2F
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 15:00:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b8ad907ba4so44735035ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 08:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690988447; x=1691593247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPuFg1jno1oVTGYezxwpn/gD6ksCLDxjcobGXZlcbfU=;
        b=XEBv/c1fA3WSJR0RHnowCFL9E23UkdXWnc8vmmLd9kUwgXAdf9RaxT93aYIdiD7mrH
         vDJl37gsBjWDjtvDHSmqVesgl0I2i2SMglefm0Nz6sdiWrCKSb0TE76hZbp72z8zOPlM
         KxjLbyjySxoLvzt85UXNgKRPfYOhWLKfdKXpXhlhhh43SuA6aHHgwS8CkDLz/JnsHC04
         p8lHVR6OjQYKUeokFmm4ucSnn83S1kbUP2/NkRKR3kAsCvdGXiYmOBfixYle8IdOPBqK
         hrhLJnvL1kXjkeqPjvOQUZgAfNOQe9RAaqRdEPHAO72+J4N1iClEMq/PLqRPkn8z39ny
         /zMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988447; x=1691593247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPuFg1jno1oVTGYezxwpn/gD6ksCLDxjcobGXZlcbfU=;
        b=gGd6NghNofp7aS9o69HfppViKV9QA/9m06ef6yV4g8g0hHABnDxdbUMDEyrm3fI2da
         QK2KVBflD+0SBRahlDtvJsp0gqODbI/95yqB2eGQN7WIYC8KOsMwPU9fvFcAFVp5iF59
         GAxIPjK7QwKRR/jq0rxIVPB3BY1wou4L4ZHbm58c9IUFZqCNN9bAG3RZ8hU8sKCQVUhA
         /9hHMJa42RzPI3PH+qLtj81AGShVEi+8EFbvcvT8ZqEu0A++RiRz2huUlUODQbfGfbmu
         O+qkgfOWKt5+1CiIXwtSF9ZdV7fhS31vdJ9PV0jaMm/HKtolFFax2SInsrNhwiaq0Xgk
         0frg==
X-Gm-Message-State: ABy/qLZV7g6zqPTqJY3HhLIU6ujxeHJFH9ww/Y7XGqt6MZzLxL5V6a/N
	HtM4h5MqK1YwVhNx5BModn5rzQ==
X-Google-Smtp-Source: APBJJlHfD1Cnw+bROUs5JbYT1+t6D+D+RNpsuGnDKaOUE/NC6yxGNju+iQRoLPFBgRFtbdfnwJF0wg==
X-Received: by 2002:a17:902:c20d:b0:1bb:9bc8:d22d with SMTP id 13-20020a170902c20d00b001bb9bc8d22dmr14426201pll.16.1690988447086;
        Wed, 02 Aug 2023 08:00:47 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b001bb99e188fcsm12503963plo.194.2023.08.02.08.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:00:46 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v7 02/15] of: property: Add fw_devlink support for msi-parent
Date: Wed,  2 Aug 2023 20:30:05 +0530
Message-Id: <20230802150018.327079-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802150018.327079-1-apatel@ventanamicro.com>
References: <20230802150018.327079-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_080047_731704_B05B2CD5 
X-CRM114-Status: GOOD (  12.79  )
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
index ddc75cd50825..bc20535deed7 100644
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
+	if (IS_ENABLED(CONFIG_SPARC))
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
