Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4196DC52D7D
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 12:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NLIYgcKVq/AE5ExWjs+RJHj0rRXqb7svzznH8LOyNqI=; b=Tsk1WPGJQq9Z6k
	hn2fhGTxCxcz5SXu5O7kibv9X3/nGCwlpcTSCNvud/KdJN0EJnSawm3C0bHmeXZgdBDP0TW1lV9i9
	qeRiZAXDBHc2FzgBFnRw6HI2XtKGe9EuELl2tQy+Oi74us5gF/f3X9Zv2yZjvhFQQtZUzbE9xeEro
	tmLihIsq8OFSlEHSPzApxu4w7Mdu4BZSb46dcjxFe6i6FBbszaqy2Ko/dV1CxchXpT9vYTCT1hvpG
	JzRNP6jI4JyDuWpFaVFLa8jQzF636iby7+FaRtfRcvmrEvhqy/gWXotibZtV2R8MCteNcW86vvDTY
	N1rDVHSnn5uMKQNk+lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewP7-0000000Cw07-07lR;
	Fri, 16 Aug 2024 12:50:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sewP3-0000000CvyB-1O3l
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 12:50:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso19647845e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 05:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723812599; x=1724417399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ke0AjxBAncE489wmYzkh+nSMUTPo+pIzRMAmnYnwJNQ=;
        b=IowozLaVaHCjh2JJgpQqfqcaglI3JFoNZkKv2AgjX0Vt0lvHiZF0dwtNd3RBMDrB0S
         QYYD6z9u/42kmYvaGDgkOVcKOxBqA0n7xpPz+CqPu3iQGCLMfeJjao9+GhWDvGw+tIvh
         1OTWYoziOMbEKNjdON0bAkRN4HpLhqWPExRzOxfnj92KnYclc7RBsr1Gf/pE76HgWnCq
         Ex+Y52DLPUfBrIZyIOoHZTjDbxDMqFC2OhecXg7qyQxgOCzp6MucfUNGqYhbAYmdqEbc
         N7cuix+jCtx876TFwQGxWjHpMc3LugbNHr+w86QfEO/NB/EMUGuLCb9quYjA0x9E3RUQ
         lu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723812599; x=1724417399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ke0AjxBAncE489wmYzkh+nSMUTPo+pIzRMAmnYnwJNQ=;
        b=ibuIVWFWBExz/m1+gGw/D4JCT24ZgqkLXyHJVUYK0MtUduJNpb8cVFcpu3TpNxDWma
         P/w875SV50ql1sIktyA9yez7o/KCI309KATV4loNVgZ/V/O3liooyV39dIZEEZF4HtBw
         0eQ22Vnkr9ywSJiT9B4YT1auTqvcavJeafFwL4wZjVLkifQkLWY4CtO0vMtVUl9NCqXE
         JevkqLE3bf5r8I7FY/wys6hwVNFyo7QYspN7F8FtI/FFgHfDvatsiLDtIiaepZb6a7AT
         vgUue+7NHPq/MkOAvf5PWYkLd3/vd8u7s8VIYK5ZAunvU+W+3epyzqI8M8onTwNQzE7Z
         1dDA==
X-Forwarded-Encrypted: i=1; AJvYcCWc9n8dkKwk8K3xgFl9YfIy7BkqjTP70CqQcS0igNgijFmiLXh3GkHiIqYSZ/ru8UjzDBQ5/cPL4mzanQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuKp/myFvXgfz/V73oVEMXuABpd2GGXn9xBWXeXOHszVjaQ+G+
	aCA8MP8gZz8dWeOLC2sFckYRhPCSHOhAySLuN3jum0Hgo8tMK/jT68ytnDz5Cmc=
X-Google-Smtp-Source: AGHT+IGM4LtUkED1FVNx+BEXnUbZCpfDI0OMEbuSoUR17hoiKqSTIP6vlmoZg/GiQAQSJ3CnFpyexA==
X-Received: by 2002:adf:e907:0:b0:371:8e24:1191 with SMTP id ffacd0b85a97d-371946a4455mr2184543f8f.53.1723812598913;
        Fri, 16 Aug 2024 05:49:58 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aa393sm3570531f8f.90.2024.08.16.05.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:49:58 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Cc: maz@kernel.org,
	mark.rutland@arm.com,
	robh@kernel.org,
	saravanak@google.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Date: Fri, 16 Aug 2024 14:49:58 +0200
Message-ID: <20240816124957.130017-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_055001_612786_3A1DCA01 
X-CRM114-Status: GOOD (  17.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

An 'msi-parent' property with a single entry and no accompanying
'#msi-cells' property is considered the legacy definition as opposed
to its definition after being expanded with commit 126b16e2ad98
("Docs: dt: add generic MSI bindings"). However, the legacy
definition is completely compatible with the current definition and,
since of_phandle_iterator_next() tolerates missing and present-but-
zero *cells properties since commit e42ee61017f5 ("of: Let
of_for_each_phandle fallback to non-negative cell_count"), there's no
need anymore to special case the legacy definition in
of_msi_get_domain().

Indeed, special casing has turned out to be harmful, because, as of
commit 7c025238b47a ("dt-bindings: irqchip: Describe the IMX MU block
as a MSI controller"), MSI controller DT bindings have started
specifying '#msi-cells' as a required property (even when the value
must be zero) as an effort to make the bindings more explicit. But,
since the special casing of 'msi-parent' only uses the existence of
'#msi-cells' for its heuristic, and not whether or not it's also
nonzero, the legacy path is not taken. Furthermore, the path to
support the new, broader definition isn't taken either since that
path has been restricted to the platform-msi bus.

But, neither the definition of 'msi-parent' nor the definition of
'#msi-cells' is platform-msi-specific (the platform-msi bus was just
the first bus that needed '#msi-cells'), so remove both the special
casing and the restriction. The code removal also requires changing
to of_parse_phandle_with_optional_args() in order to ensure the
legacy (but compatible) use of 'msi-parent' remains supported. This
not only simplifies the code but also resolves an issue with PCI
devices finding their MSI controllers on riscv, as the riscv,imsics
binding requires '#msi-cells=<0>'.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
v2:
 - switch to of_parse_phandle_with_optional_args() to ensure the
   absence of #msi-cells means count=0

 drivers/of/irq.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index c94203ce65bb..690df4b71ab9 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -709,8 +709,7 @@ struct irq_domain *of_msi_map_get_device_domain(struct device *dev, u32 id,
  * @np: device node for @dev
  * @token: bus type for this domain
  *
- * Parse the msi-parent property (both the simple and the complex
- * versions), and returns the corresponding MSI domain.
+ * Parse the msi-parent property and returns the corresponding MSI domain.
  *
  * Returns: the MSI domain for this device (or NULL on failure).
  */
@@ -718,33 +717,19 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
 				     struct device_node *np,
 				     enum irq_domain_bus_token token)
 {
-	struct device_node *msi_np;
+	struct of_phandle_args args;
 	struct irq_domain *d;
+	int index = 0;
 
-	/* Check for a single msi-parent property */
-	msi_np = of_parse_phandle(np, "msi-parent", 0);
-	if (msi_np && !of_property_read_bool(msi_np, "#msi-cells")) {
-		d = irq_find_matching_host(msi_np, token);
-		if (!d)
-			of_node_put(msi_np);
-		return d;
-	}
-
-	if (token == DOMAIN_BUS_PLATFORM_MSI) {
-		/* Check for the complex msi-parent version */
-		struct of_phandle_args args;
-		int index = 0;
+	while (!of_parse_phandle_with_optional_args(np, "msi-parent",
+						    "#msi-cells",
+						    index, &args)) {
+		d = irq_find_matching_host(args.np, token);
+		if (d)
+			return d;
 
-		while (!of_parse_phandle_with_args(np, "msi-parent",
-						   "#msi-cells",
-						   index, &args)) {
-			d = irq_find_matching_host(args.np, token);
-			if (d)
-				return d;
-
-			of_node_put(args.np);
-			index++;
-		}
+		of_node_put(args.np);
+		index++;
 	}
 
 	return NULL;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
