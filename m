Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524C6C71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4CH8ZICmOrXYEwRFaCdJifE4eZUAAn6RjDwMjllOFk=; b=eVd3TfXrFP7/tK
	8Wzsa9hW3yy0yorp2ySv3YQeiaHFc4YqMPwv3YWLbdl9rtTbnnLul5T+unjq00zSpdpxYWd72gWV9
	XhowvYpORsIBwRgrJbVUnQ0rXily9Lyga6SI7eOzp+XB5Z883B4erTwUtDiOAFuudknsXHWh80cLH
	Q94FEYDDKq56COKRre67BoLd48vvX4TU3xGzyKlnv8hGQGMQzCEb8VvOzgB7v9JoDsz7kObBL3oJ5
	+s342WaiQGC/D04oqmwDLYju/6FmJhwhu6Jfte5u9wsZs0GWhI/PFQYDYfeT/Vgls97b50QVYrujm
	ovPClzWrJROG+Zmq6hSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsqe-0000000AIbb-0yFd;
	Wed, 18 Jun 2025 13:29:04 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRri2-0000000A5Wo-2R9i
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:16:07 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-748582445cfso4310715b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248966; x=1750853766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/zEjMktz2Q+rhDOD+xT+f8Y23symCCnfKy+4Q372EY=;
        b=JrFdUfAtgi8d02BSBH4av5lz4rYeFnvPmwO/G0hb9kaZb2YtxRgTwDfnbra7stRFSi
         AUzi0wQQuuSqEZFMDE+j49mRUWb8fsIaNF+iEVxDMKOi6HP44XSotbAMHDTpgg8rUMrz
         ooZ7MBsbRSPdNhc1rb6XgV1DWH1eyThs3LqbVPfpv7+ijqSzlLWbcognkpZWStoYoRzH
         IyTaxJDYEdM1BkXJWlVW4/d/FA6nAh8OSUapDCEDID3elw+M8YaLV2s7SusvXlRZ0kj7
         J0pT5xhq/MstFmkNc+BAHnTLEsaVPKMpxedKn9Va8RXd4Iu67kKviknf/x3eO+emTN0h
         fUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248966; x=1750853766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/zEjMktz2Q+rhDOD+xT+f8Y23symCCnfKy+4Q372EY=;
        b=CvtpceMg7SYFuYU0mO4VfhUZEOAXQGLo/56lFRV8bL7p+iG7H2FV57TrC3EQUXdo9f
         Ukav32Ub8JcS0JPjFGKK74OphoPF9jIu77p0TNX6QsWKdCkfqFDZQRImAKRZhcGI/6/W
         tkOuUU/q0/i/y9BsLKeZelL8d4HvmWWAOZxfGNXAa/O1daxdBEbyNMXPEWvGy3mUjrcM
         QUmj4wX/uODsASDP6jQC8XYUg+vTuoVsh6Nl0wAjanAPcHudVo4Q2/mqqTZx9xCw5Wgv
         Uv4ct8qwvU/o42WAMwZk/iytDsdCYNcUD3ijw+ZCcvisL40eLg2F6+BiizUUrWSeBdtM
         U+Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWyzuvDwGdMCvckhMA/9s/l+zvfH2HH/61vgBYYDD9xXIBwfjFOFqssYp1nnf5iRMpgXadMbcaRpzCo4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YySXO0IfN02jIloGt2WeQLS48/XHYRnyIBhjNyVOfaXoQ90lpWZ
	xCVC38YxY11aSafZvbBQA/Ka2J8HhS+AxaJ0fWbUyCy8zyK5i2Rswa2k2YO3mek2lwk=
X-Gm-Gg: ASbGncuBgofqWXIAjkkl6zWGpSyndQxlvs9mmc5nzWKp+zn0v1Ns1Ms71ZNjUH0PKGF
	DiyTSU1Vk+BSjEac6b0AUB8F4KGPQBeHWmVNw4slL3fAqN7dbUt1dSTSxr/2md3LVCfRoRfJfQI
	8Dy0RAZUrCAr4REEWxe2Qnfl3mq1833BWDkguZdg4pE1jOaTHIT14xegSrg6bDEMqC3052fpC3s
	50HWCa1UjWfVxDc4lMZiGoP/geLQp+T6WTFEfRU1TJEgzHFtIx+n7L3T3+WW0eqhWZJnq7FYLsP
	s3bkNoIVVEf+83mdRU2m0C+/iaseJxYt/wtyw4C6w6pk45oIj1spcnfnjRNhFTxfruNa/QtiLIO
	Vf4ZC1y43+D0RhiJsQA==
X-Google-Smtp-Source: AGHT+IGoMyew2ejAt7Lr7ji1BBEmYh0srRqGPcfXFixzpRQROZE2QwCLEt0GO1Sh7RlWtJaJUne8nw==
X-Received: by 2002:a05:6a00:4b4a:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-7489cfbb3b3mr21175650b3a.15.1750248965820;
        Wed, 18 Jun 2025 05:16:05 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:05 -0700 (PDT)
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
Subject: [PATCH v6 13/23] ACPI: property: Refactor acpi_fwnode_get_reference_args()
Date: Wed, 18 Jun 2025 17:43:48 +0530
Message-ID: <20250618121358.503781-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051606_625448_41EE5714 
X-CRM114-Status: GOOD (  20.67  )
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

Currently acpi_fwnode_get_reference_args() calls the public function
__acpi_node_get_property_reference() which ignores the nargs_prop
parameter. To fix this, make __acpi_node_get_property_reference() to
call the static acpi_fwnode_get_reference() so that callers of
fwnode_get_reference_args() can still pass a valid property name to
fetch the number of arguments.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
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
