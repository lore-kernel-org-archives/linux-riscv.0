Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCF6C87FCB
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 10:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKf+gTq+ieT3ixJm6yolOVcf/QeGWozpSj4zcFrpWbM=; b=iKfNSzK8+2CQss
	fALJgfea90XxwKuUc2q88zWl5IcFLS6hsRHAenYXl31s6teKJvfu3NpwggJ+dxdaEpXPsaBLlg03u
	c27db0Iq7+2/gT7OAq7ksKjmVvMnwiGNVn460bsjWqeggqUvVp/T0goFWL3fXvTKOE8+Y4sPgAA6F
	8wdLPCz9a4oP/JyoDOFEgv+RjJupy05TKRdKwEEbX+JNhFiwthzuP0lqOjE1+Ec68wrgi2X8/jx56
	z9dNAsfzxpwAMv2lBRYQhFQgNothJ0IOZsd7MOq3t0o6E89AZ/lKfmKQ8wJfMkFYXA0QgiWTAEtNy
	yTtQQvqC4fUXpYlfCMIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLY7-0000000EI3H-2ntK;
	Mon, 28 Jul 2025 10:57:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOK-0000000E8ho-2oDe
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Jul 2025 09:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=psS8/HGvEcGOGsMgWWXg1B2q2pSduh9TsFVsTLXCZt8=; b=o7jkN9mbHHuDAhUSKZpMCUc07C
	iX3SFyyO6MtSl6p2RA4w0M/lCeBWhveVg0P+t5miW945chgUzvDvL9Gx29fNR9rugffj9mW2UiztY
	RGtx/S6gkvSyOqSFWCHaFafmREazcm5IOohRB/f1gTIU7CFRQuuhf9ySFhcaw2EWHofHMslraMSUR
	MQRdQeBIFY2IlNh9/xo0yq8bvzFWVDCtzEBuYTBIyp7/F9Q52cYp6/qE+KK1sXO2GuYZUJ0PzJjFy
	JQeRcQwe+EUgvWxmSbRlH5uSuXIvhBPZueEpvCTWae5zERegt6Mofda0UyDC9Sv4uzuKDzjaAhn3X
	o4FhIxvQ==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOA-0000000CPf8-1uOW
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:43:31 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b170c99aa49so3058510a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695796; x=1754300596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psS8/HGvEcGOGsMgWWXg1B2q2pSduh9TsFVsTLXCZt8=;
        b=Y/QvPvxZIPG/qvLtCCJ6g2NKAoZTGuQagZgLgWakvmL/ohf6xxu6jrgrhSbSJbMqbG
         IcWdEYBTU1OU5lrQwRbTY7VxyQyupDsskDWYT45TANjy7eOug3RrT3roNQED21QDvlaw
         U3nXoGiNFGIWVIC4Zcx+xFM8xrzO56xuRcY/g5c2duQuXvmHlpmhkQIRiQIkc+LDlxV8
         KGK8kFW9erD04uz62Jig+VAwGDupAW2QxyJ3Km0TAQjbtqkAWwXkulH2mYUYutlUuG7m
         GNq5PQTnuMSZai70T1lOzDd+o4/0ZXKkPO9gc+4/elY6U5VIqFGWlRA7PYkvhgFUpDGB
         ETTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695796; x=1754300596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psS8/HGvEcGOGsMgWWXg1B2q2pSduh9TsFVsTLXCZt8=;
        b=NwqKQvYgdyNQ/qpPeobe1Lwpmlr2UwVcEY/Oz2Z6sa5rfBOB7ZbuSoE5N7p/rqjvzU
         vPG9Q4Er7xA1I0gdRUM/Fc2ViSvhYI22q0JCXjpMNCsOxvdT7BB5NozpoDhnxkSt8tq5
         +ZBKU8jiKvQUEvHyQmG6Kcg14kMnEf6UdNcJgkuNT3NfRN7mGl/7tRDTh0m85aaASGQP
         LioYQ3Qg9wiXjIwr26TSgMwRMdPpuhDlZhmFHIG86kG41YJnxXMvj06sjyHMmpWukZLT
         rQr1+W520mPCONruxp+JGVHeDKvP8UsKeN2nt1BJvQsMjCfK2wQA01O/7tlILAmhhFYG
         LDKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5M3rlMCUtkanPZnXDhWcPY5lDzyXrcMzz8oPha3UwqPvmpcQf/7XOgOKWpatgsXMI+5eVYomJllr6Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5d/yaL3nCpZO2FLHmryeEG/ImRnk0F2Tw/uH5kJQJr5p+5w3K
	ykaFp7J8531hvS5RlZYiAQr0veoLITNTbaO181ztHvzq2zdQls5LodF7foa1fCzDN0o=
X-Gm-Gg: ASbGncssga6cQX6FsS9WnXgWH8lyAvd7kT42X5DHQ8Brgamu6CLRRvMSkVGIB4HhdWb
	ZDRX1TjsQmjeyABgDq+hQl36VnqlZ7XsLauLCIuKgFhymIqc/aKI/OkwSntQK+TgQGWZ6I0ohPJ
	GhpojjfkBIUIjJET/iBqe36nyZN/ihsF6EU2KwUuRsm1DECQmIqrfmrASwnL8B6nRMTCS9F/vpG
	+sV0d6U1LpVEdCduFLqTScB43DltXLFh0ic2MRO+l2z/cQ2at8PI4UEzD0OnsEyetSOMoNnPl6x
	eKoqKKFWRCKtctfwGXj3qgdUeJk2sulzc0+gyHZc6Qf3uab1n4OCrooWFSZkPMSvK4KJ+fMhSnv
	U+k7XBh4pB1ioSIzTbKZ9iPdm+Xa42GGP+patbjUggu5ZkNtF2u2B7qeN9xfUtUSH+nHTCuY=
X-Google-Smtp-Source: AGHT+IHL9arQT5aDqAz1dZ7cvYy38Ns9Xdix/MnurcSEyrOlJ5A4rj3vvzb2xougKwWOpnOXJIDzwQ==
X-Received: by 2002:a17:90b:3d46:b0:312:daf3:bac9 with SMTP id 98e67ed59e1d1-31e77a32a3emr13516455a91.34.1753695795553;
        Mon, 28 Jul 2025 02:43:15 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:43:15 -0700 (PDT)
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
Subject: [PATCH v9 14/24] ACPI: property: Refactor acpi_fwnode_get_reference_args() to support nargs_prop
Date: Mon, 28 Jul 2025 15:10:22 +0530
Message-ID: <20250728094032.63545-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_104324_011794_97A98A36 
X-CRM114-Status: GOOD (  22.67  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

Currently, acpi_fwnode_get_reference_args() delegates to the internal
function __acpi_node_get_property_reference() to retrieve property
references. However, this function does not handle the nargs_prop (cells
property) parameter, and instead expects the number of arguments (nargs)
to be known or hardcoded.

As a result, when fwnode_property_get_reference_args() is used with a
valid nargs_prop, the ACPI backend ignores it, whereas the Device Tree
(DT) backend uses the #*-cells property from the reference node to
determine the number of arguments dynamically.

To support the nargs_prop in ACPI, refactor the code as follows:

- Move the implementation from __acpi_node_get_property_reference()
  into acpi_fwnode_get_reference_args().

- Update __acpi_node_get_property_reference() to call the (now updated)
  acpi_fwnode_get_reference_args() passing NULL as nargs_prop to keep
  the behavior of __acpi_node_get_property_reference() intact.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
