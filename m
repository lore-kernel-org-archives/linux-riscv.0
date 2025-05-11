Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF669C3ABCB
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 14:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvqkbXqcpI6r3sK5PPdbiFNsXhTGrS2rxj+WToDrMQY=; b=Fojj/ZX1dWsOQ+
	6Wg5Y0Hm0q1r8NrN6N6srxogylY5fsbPMEbI85ry4XRS31mkbfjQjHySQSq4/t/uv0ttyYcsJsN8d
	TFMAXvxoiQXjFHP5gpKIECni5y0dNj4EmgPsLccBkJItGSW0t6gs+8TNNha11OtxcrJPDheq5Km+L
	IipdgTxEAxWixE4xTUUpZ6wqy6RFyLXBoVcH7q570wHtSMuAqrBxIy9PmDVIXPtfv3/PT8Y1F4fen
	8SrV4O+9qS1J868//5vlYNh5woug3LBLaq5+11sQ1iX/ukUS/HdCb0Q/Ch5XRqnlI49zyORlMtl6E
	yzdd3A1r+rkFLUjb4FDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7yz-00000007Ouk-0NJg;
	Sun, 11 May 2025 14:48:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6wW-00000007IJB-33lU
	for linux-riscv@bombadil.infradead.org;
	Sun, 11 May 2025 13:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fCjUB/xHP3F4lexC15SuUPpKkgJMb+cdYU5YhyAWuJ0=; b=MOO8eB/elFQL8mmRjPXgwOq4Dt
	MfXUO4FKRBIzlkufbMSXO6pDgJcblTMdootOxC0diOVBzPWexE0fhkkqPotJ+W4V+pYv7yUkEhZO5
	5vcBH7VCPqYq69MtmcDY5BwTxYEZIvv7uvQsplhtTFjz70wpm31UoTxKzbeZx5W9byaNcw6Y1LSDc
	tvA9LVIztYAaogHgs080NFrWTshePNyIzXN2kM6S+1RWZcVm0pX5zXImLfBayshOoE+mmDXDqHnCn
	ccYLYTBphyGZSZSIfFyvROQp+OukOwSMVwLMtKhy0q6A714LVF6n6zPba2NKBlq/SVzcxQsvM6HFi
	PJHPu1hw==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE6wR-0000000Gbye-46G2
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:42:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22e331215dbso35319925ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970924; x=1747575724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCjUB/xHP3F4lexC15SuUPpKkgJMb+cdYU5YhyAWuJ0=;
        b=MXPcrNLoxbOLlO4ySQ/n+mfjFV217R099a4yNig3olNm4wwQj9MhhciIc1mB8rApdd
         9Z3Fz2Gii1/vqPhcD2OLBDXY8yim0riygGgVKhAVTZRpcI0PvJxK3vv9rBHLSZkjIEn2
         ruPg26RFMCkf2aoVv7Kf3XU/gFgDQDBFRo37SZPnlHQcDnaGSMFJsTFKzjKXRuw9VE34
         O2YRLve3j+VloGUfu4Og1Nzx+MfUJKT8Oq08LVx1UMWcwDV70oakltTJ7ftNq2ca5IFe
         5Qzxz7zGAU0BV7kHc6MndrJmgkgcEZZ4ImUUyDxjvu9gWd9hF8NDTyiqcNpYp9DDd6tK
         WHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970924; x=1747575724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCjUB/xHP3F4lexC15SuUPpKkgJMb+cdYU5YhyAWuJ0=;
        b=hWuFRzGtThjLjt0HWcupNP9k6+X7P5FotEKp0/ndeiU1guxp3/7lVdKkVrh5KnYPLb
         NZUyvAl22ZVEj/jubQV7wN3LS4Q3WkAK606IRxDkammYQ5aIME7Kpw3YE8lKMFgtuLdg
         CNweKZnu2mgkHNnKy19xRu1cFJVJtg2oY9QKDyhWE5n/z4DaCGSUftiY3lwKFFOnY0x7
         WC08aWwp98MRGFrW1Zhn4LnlM5tTkaHT0QX4SZmi6mDcdKGB+cFySCC+6tA22ZgkdNaW
         lc44M/i1inwuvPCf2YFttIzZGFFGSkQRp7RHZ4ZnobuBhvnOGAqGvS73ZwzdyEAz0B7y
         AmQw==
X-Forwarded-Encrypted: i=1; AJvYcCXG/yyLQ64HGtaNjkC1pHNURrxaLlcvlHhunTieoK/ePUgxrDrZ0u9D2HibOFZK0YfFJ9ixFVM9WWjVxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1EFfJBumPDSioocOvJ848gdeJS03Im4wQrmDd9qD/k6p+Odw4
	BDqvD/z6sbQvCDaNIbQP0QgXnl6y5H5Br5jQC8O2wUr2YiNHAVd6U3M9JldMDzo=
X-Gm-Gg: ASbGncu9RP1e5xghq2WWjo/5HqRMx8/l43DwO2qzaJIcKfgFAiU34SPxAClFI39tkl9
	8Q8dbp5XCIfrHJreWYspaYoMK/gxNW7W3EUxzPSB7OZpAOSP7P+DpVwndZFXank+pc+N4cSmId6
	XoQmw22ZdhAkagPW4qbywy9NM++RW28XtAX+w8oP/j5bvteGrakgytALzaCF+X2gTK2teTRxvxp
	Xmc4MCMrqjiMK6aUPkbMUB3aXGvUfzZUfBSda3kupAtCtx9EXDBPz9XaaBww7G4KpjMSfYPkwuV
	UZHqh3XFxB+pNoVQAAvV4juf+D1Ijbyc+dVCJIzYMOpPC82wSaAfOCDUt+6v75wqhy1y+K5vHvp
	2XYkbJ7bdxKs7qqYrUaoUcmY1
X-Google-Smtp-Source: AGHT+IFMx/VWg5T7jyPRxbypm5h/qHJrEm48g/FhkYBfFVU32uDFENhdL9cY2ghotviQvipOT7WehQ==
X-Received: by 2002:a17:902:fc8d:b0:22e:457d:3989 with SMTP id d9443c01a7336-22e845bcb87mr224010915ad.0.1746970923496;
        Sun, 11 May 2025 06:42:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:02 -0700 (PDT)
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
Subject: [PATCH v3 14/23] ACPI: property: Refactor acpi_fwnode_get_reference_args()
Date: Sun, 11 May 2025 19:09:30 +0530
Message-ID: <20250511133939.801777-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_144208_302818_8F779DA2 
X-CRM114-Status: GOOD (  20.56  )
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
 drivers/acpi/property.c | 103 ++++++++++++++++++++--------------------
 1 file changed, 51 insertions(+), 52 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 436019d96027..364c58faf13f 100644
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
+					  const char *prop, const char *nargs_prop,
+					  unsigned int args_count, unsigned int index,
+					  struct fwnode_reference_args *args)
 {
 	const union acpi_object *element, *end;
 	const union acpi_object *obj;
@@ -933,7 +898,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 	if (!data)
 		return -ENOENT;
 
-	ret = acpi_data_get_property(data, propname, ACPI_TYPE_ANY, &obj);
+	ret = acpi_data_get_property(data, prop, ACPI_TYPE_ANY, &obj);
 	if (ret)
 		return ret == -EINVAL ? -ENOENT : -EINVAL;
 
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
