Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45065C54E90
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cyRAqvcNTTE7LkimZWgug8fTD8112Gxkl6WATUJYXQ=; b=PH2WjMnaP8wkcH
	3WEIUmxsh+UGnjH9xY5LGqb3+lS/sJOnAzpzkYGXukK+PQcvn6zryEg6w9OeTbrT7/x5LRp0Jejm8
	ogrD9bjwPWg7cm7tQoHhRYHF84yOkR2PjgGpSGQX2vrPCtIuxEWXLUhbhioFrvnmoyDMY2NTw3dA9
	EA/2019nmU+Weow7hR2R3ICvXPe1/52u2uFjy7YpbYgdL023wTfkKwR9vdigyGcI91HdGb4wZQ0CQ
	rRaVZAQ7T30O4XJgEn5D/d1Os0jjZKpy68TJbuhgjwMqq/KKNmAo6MPay8hJJZJBwFDTIzBhNGV7Q
	nYWFT3CDLf2/rJClXCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ74q-00000006neP-2SLZ;
	Sun, 25 May 2025 08:51:28 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ72n-00000006nEo-1x75
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:49:22 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-742caef5896so858538b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162960; x=1748767760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FunaAXszvTG8F9NxLwtJcRl/JdpmfQ2Wvu5HorrkT0=;
        b=nZmaGRHK6/ywWpy9pGZvWP1osDjJNmd/SLPL4whxAiK1bRLf6uBTYRnUk6Vz+CK04c
         MU0hAr51jxEsnRq41sP5O2CTm+rrvFSKhgkKjgwcb6Yi00bMBoVTgTwLHM8sNNl7vZH3
         xWh12d7VutKo9BbyoNFTpqVe3weYUwfNHNAUXhxSsH9KWCm6pKri98BWjhCL68MSSiZy
         IPICvk+pfxpLXheAckSNKYP0ZOqCkDyFCzSd8VWQOq2LCXHQqWhy76G8YtLaDR/Nj82a
         wlgzv9BImIDIrEB14xAdnZNSXQmRFEZHXFFzTTkGoDMQ1V/sPoQC/9xt7izzk4qCq2mI
         Wjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162960; x=1748767760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FunaAXszvTG8F9NxLwtJcRl/JdpmfQ2Wvu5HorrkT0=;
        b=FnptFB9mDahUZNOHmtGuhv4S+I0A0Mzwz6qUN944VzWCsEvMKp8nyd9VpinAk3s75r
         PRnRsnMBJwClOuTccc6AH3m8u3zv2BOfp1pXzE84bce/YCQckxKgnl8hd8vBAx25MzNC
         MkS/K3x+k9xDO/GgTzXbZp2jcu6iUXCtNZZ1FKfYpGqHyLELxAtOxHAaIlwIR55WX7Zj
         b0nqyYyUIzker9xJE7Y7qw2NJb2TPWpBAxrv2AdOJITjj/8Ba8x1AcaS2wwRVx9DQ/7p
         ozXgjnGDLggUhogg1dFGzyOJmoepkcymjrHxr5OqJeqyhEJsWqIQYvzD7eBrFEWvloxy
         O36g==
X-Forwarded-Encrypted: i=1; AJvYcCU5MUxWVxmOY9QRNq9ZEouTd8U665i1m5nX/2OvLre5muQEmslJ6USjOUj7oDqcoXQps0xwYVkGctcGWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgNfAlNesaZSN0nKnZGI7K4ANOCwxUMQVWuVEj0tzRYz6G5Fmh
	UokhJuWGE36wOPXWX/Tr2pTVyJEGahFeMBO/h5PXMulP5aojqH5elnlXEaTlZ3N0rIk=
X-Gm-Gg: ASbGncswvBXqTdJ7KcyYwlxb8MxoLAJnr3FdOTY7U9OcB3CfmD+RfbMzoIvLYW/6hSL
	7YY1O6VRscxw8mK30WtlvNVHrvrFHi4nyO6mCId0YiPIr4dkWEp2LG1Sj7FXAMIHZxtPBpHMt4P
	zyu/OrRKgnei+HaIlKCpfix8dJtlxoQu4wGUiJnbrLPmDPHURg0Yr9rlfDb0AZVUP63nl0LpcKW
	fyJt4eNSio/OJzBOBJlH66ykZiXvO80l5i9UJJ4yxIEVt9UiwOYNcoLAnvmPXY/FP05i9vYOZ5G
	4qcPibZoxOR4ygdA2Aq5KOuxvj77t/vTkd9DU4VzQPZZJO6IbEgcceYmOZ/IjsyWRQ3ebQc4f+w
	JnnUaybgK
X-Google-Smtp-Source: AGHT+IFfQ4GlwBOm5aqf9abJJ6GzdowEpxdV3jxJWk+baMuesDsuJ4xVL+L2MQeiT0KLZQBJG7FJ6Q==
X-Received: by 2002:a05:6a21:100f:b0:218:75de:d924 with SMTP id adf61e73a8af0-2188c22eb79mr8067987637.19.1748162960471;
        Sun, 25 May 2025 01:49:20 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:20 -0700 (PDT)
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
Subject: [PATCH v4 14/23] ACPI: property: Refactor acpi_fwnode_get_reference_args()
Date: Sun, 25 May 2025 14:17:01 +0530
Message-ID: <20250525084710.1665648-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_014921_509025_19F8BBFE 
X-CRM114-Status: GOOD (  20.73  )
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
Cc: devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

Currently acpi_fwnode_get_reference_args() calls the public function
__acpi_node_get_property_reference() which ignores the nargs_prop
parameter. To fix this, make __acpi_node_get_property_reference() to
call the static acpi_fwnode_get_reference() so that callers of
fwnode_get_reference_args() can still pass a valid property name to
fetch the number of arguments.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/property.c | 101 ++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 51 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 436019d96027..d4863746fb11 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -882,45 +882,10 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
 	return &dn->fwnode;
 }
 
-/**
- * __acpi_node_get_property_reference - returns handle to the referenced object
- * @fwnode: Firmware node to get the property from
- * @propname: Name of the property
- * @index: Index of the reference to return
- * @num_args: Maximum number of arguments after each reference
- * @args: Location to store the returned reference with optional arguments
- *	  (may be NULL)
- *
- * Find property with @name, verifify that it is a package containing at least
- * one object reference and if so, store the ACPI device object pointer to the
- * target object in @args->adev.  If the reference includes arguments, store
- * them in the @args->args[] array.
- *
- * If there's more than one reference in the property value package, @index is
- * used to select the one to return.
- *
- * It is possible to leave holes in the property value set like in the
- * example below:
- *
- * Package () {
- *     "cs-gpios",
- *     Package () {
- *        ^GPIO, 19, 0, 0,
- *        ^GPIO, 20, 0, 0,
- *        0,
- *        ^GPIO, 21, 0, 0,
- *     }
- * }
- *
- * Calling this function with index %2 or index %3 return %-ENOENT. If the
- * property does not contain any more values %-ENOENT is returned. The NULL
- * entry must be single integer and preferably contain value %0.
- *
- * Return: %0 on success, negative error code on failure.
- */
-int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
-	const char *propname, size_t index, size_t num_args,
-	struct fwnode_reference_args *args)
+static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
+					  const char *propname, const char *nargs_prop,
+					  unsigned int args_count, unsigned int index,
+					  struct fwnode_reference_args *args)
 {
 	const union acpi_object *element, *end;
 	const union acpi_object *obj;
@@ -999,7 +964,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						acpi_fwnode_handle(device),
-						&element, end, num_args);
+						&element, end, args_count);
 			if (ret < 0)
 				return ret;
 
@@ -1017,7 +982,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						ref_fwnode, &element, end,
-						num_args);
+						args_count);
 			if (ret < 0)
 				return ret;
 
@@ -1039,6 +1004,50 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 	return -ENOENT;
 }
+
+/**
+ * __acpi_node_get_property_reference - returns handle to the referenced object
+ * @fwnode: Firmware node to get the property from
+ * @propname: Name of the property
+ * @index: Index of the reference to return
+ * @num_args: Maximum number of arguments after each reference
+ * @args: Location to store the returned reference with optional arguments
+ *	  (may be NULL)
+ *
+ * Find property with @name, verifify that it is a package containing at least
+ * one object reference and if so, store the ACPI device object pointer to the
+ * target object in @args->adev.  If the reference includes arguments, store
+ * them in the @args->args[] array.
+ *
+ * If there's more than one reference in the property value package, @index is
+ * used to select the one to return.
+ *
+ * It is possible to leave holes in the property value set like in the
+ * example below:
+ *
+ * Package () {
+ *     "cs-gpios",
+ *     Package () {
+ *        ^GPIO, 19, 0, 0,
+ *        ^GPIO, 20, 0, 0,
+ *        0,
+ *        ^GPIO, 21, 0, 0,
+ *     }
+ * }
+ *
+ * Calling this function with index %2 or index %3 return %-ENOENT. If the
+ * property does not contain any more values %-ENOENT is returned. The NULL
+ * entry must be single integer and preferably contain value %0.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
+				       const char *propname, size_t index,
+				       size_t num_args,
+				       struct fwnode_reference_args *args)
+{
+	return acpi_fwnode_get_reference_args(fwnode, propname, NULL, index, num_args, args);
+}
 EXPORT_SYMBOL_GPL(__acpi_node_get_property_reference);
 
 static int acpi_data_prop_read_single(const struct acpi_device_data *data,
@@ -1558,16 +1567,6 @@ acpi_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 				   val, nval);
 }
 
-static int
-acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
-			       const char *prop, const char *nargs_prop,
-			       unsigned int args_count, unsigned int index,
-			       struct fwnode_reference_args *args)
-{
-	return __acpi_node_get_property_reference(fwnode, prop, index,
-						  args_count, args);
-}
-
 static const char *acpi_fwnode_get_name(const struct fwnode_handle *fwnode)
 {
 	const struct acpi_device *adev;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
