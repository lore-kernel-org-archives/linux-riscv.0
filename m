Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C78C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 09:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4CH8ZICmOrXYEwRFaCdJifE4eZUAAn6RjDwMjllOFk=; b=HXrGixRaD9EK+R
	NNNZnEFHpRfOT/xvpSkZMUFYBpwt1Q9gS2q8KI/PJ9FXRxOEC76vjMxeUPt3QcuOooR2YeFUsjyOC
	AzskOJ3r6ccocrjMec4RB7h5nVhCN67DMXowvsiQzTqYFigNDvO78e0lMJ0HmqisxzAPHctmRT+iV
	TE6jykjZWYfxcSt7aFPHC4EFnISYoyPS083YlWWfwWzTwM8L+n29plPkczTF40q+FycpNqIq12TtQ
	1igDs+YA024nJdG9g/cTvUb9KSvFGQMCBuA2ONbF/JpfIe2GC8I2u+FPRS86Xsi1PL5jM7Hfbe/Xq
	4HNRuYPze+qyT0ihKRYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPI9n-00000009XyH-3nBg;
	Wed, 11 Jun 2025 09:54:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEtJ-00000008zWu-3M9d
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=t/zEjMktz2Q+rhDOD+xT+f8Y23symCCnfKy+4Q372EY=; b=NbfLIS8dBgEBNtERgUZfwdgyvG
	sPz+Y+vxCVmP92t1fo/W8112rTlilZb5FUBPz0TE935Qjpv39/Ssz83GtXM/jn9jEuBs028T3Ay4z
	K+rP+RP18ZpbQUD/Sdrn00vwt+dBLkgwK2d2qAVosvoXZXtowVsc1HP1d0l0HNpRInyRcYsgI5KJO
	sqOSCsgo8lbday9ebCDIG3W69/RU1HhhC7P+6+TuaWz5NOt0OKbydnl06/kX1nfiIvl9KZuSXW9aj
	k93hx+dOaiKWEU79Z/1yaB5PFxrh62u6NYmzvqpmSII8BC9z/pAcqcIdLlvssJ9jzq6Njm2xHaKI7
	8wBr4lig==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEtH-000000028DZ-3bO9
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:24:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2360ff7ac1bso29904545ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623089; x=1750227889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/zEjMktz2Q+rhDOD+xT+f8Y23symCCnfKy+4Q372EY=;
        b=dPQoPqO25i9mQDf5qjcsqnEPLdVVrDuU9CdhCxm70zbeZl2EFuVtQ96wndSTRFqV7o
         DXjxzHTiYVlnXwnmmDESk5O6Bs2/QeLL5TiULQdedNq/RN8xqoRf04IURo/WrOdnvNmS
         Cq/FV9WMDfma6O5UHIm9dLQyQZzSeRa0U9bEmZO5Z/tFTCcX44UFsvDBiQSB7iW4Tztr
         WZhrN9bFp8AEupblGljBqMvzugOcIgc99P4kzjbgFJX8uJ/661oeM0b01YtSPvRhwn6U
         rl45Pu/jN/d/aZnBhBJbdwVwk6jgoIx1ANYtqwuwPLgY6+g11b14ZcvpZqKdjty4Ik++
         2Pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623089; x=1750227889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/zEjMktz2Q+rhDOD+xT+f8Y23symCCnfKy+4Q372EY=;
        b=Gbl6o1UcPkI67vxCSUZjUNwzpIRp2FPKb7/hUgp4PaaWfQcrsj8WO/T5zC8iDXsbXx
         zy+H3DyEunNuLi2DzAyAYXXKTi1Ry+VwMCWpyxDkvHS6VPDkm9p5wvBPipfXQgoJgF8p
         TTrMjyP7s9NnvtY0QAS/SH+IazJy/6B7xDvW/ALP1k6tDegYwABcDXWDjbW+oFVg9pUL
         yOy2iMWK26Ccm/5ar+xGJ5mVP3EwKQNUlV0cf8Fe33u6o4fqe2jPAunwnrOZylknFnK6
         zfKvb3X98LUtjwjiBdK3LHxfaFcIXXRigNJIvfBaHPDXJhj0/LHlDfcdSKm+1zxOQyFk
         TsSg==
X-Forwarded-Encrypted: i=1; AJvYcCXyPWDw8N2+4Mpe8a+Qb0hJN9HkP7rhq8nirjch2C4AACQYuEam3E5i8Z2tSNZSE6CB1VSop+nSkgNaQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJyKxSIjCUL0BF66fbSpqSVCp+ll5zMuVHgc4LPSo8/GlRCgSv
	ncOoALUldeVCLdRUs74DOrqe9WF38tQgy+5nJr+D6zT9IbNBiUGs7Dl+KS1BS+poi+U=
X-Gm-Gg: ASbGncs5MkyaNgDeyvuMF8xAvbl4V5PfWq4vBUSnAWbZAzXKcxncg+n/Y35IBL+T9mg
	cXXxrUA718gZIGoh66GmojlH2GENoqlWqzuWe6h/tE516qAmlDrB8RLlZCcdFU8JDy+7VsDBWCi
	1IWHsEJ5VmG7OxfFNWcg9nk5A9ORfh5dpc0dQHsxCev1E7Hc8u/XdkA5xfNOE7JN5vh61bM5FEv
	iBExZQZRKfxDF9Ikj3+g5tV0EMQXmAsnNW0TgO71faG2LfY0FZC6TSmQOCRtGITTB3NDHM50pCl
	yodKA3n5N8467zpaJsLQwJ5PuZd8/2W1dguMoa76CfYLUCOV1ei7V8HveDXX64IdX8jJIiLEZ4n
	bcb6lm46DbpFAWzK9Y3wIRzbqQg==
X-Google-Smtp-Source: AGHT+IGFgz5cLpjWkfSw+TNcCIGt07x932rHAD6olqu1+yonZJ7rvYlMViTlSj6mMRDGXjbPoi/gVw==
X-Received: by 2002:a17:902:f70f:b0:223:7006:4db2 with SMTP id d9443c01a7336-23641b1988emr28560705ad.31.1749623088442;
        Tue, 10 Jun 2025 23:24:48 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:47 -0700 (PDT)
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
Subject: [PATCH v5 13/23] ACPI: property: Refactor acpi_fwnode_get_reference_args()
Date: Wed, 11 Jun 2025 11:52:28 +0530
Message-ID: <20250611062238.636753-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072451_993028_1CAB6831 
X-CRM114-Status: GOOD (  20.27  )
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
