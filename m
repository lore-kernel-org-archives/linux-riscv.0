Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829B8CA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 04:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SKf+gTq+ieT3ixJm6yolOVcf/QeGWozpSj4zcFrpWbM=; b=vduj7pDi5zhRQW
	czGfEun2mOKA+tHMjLXnow4GsOgUijAjjLMfzvddNxSgHWZ6wfYYmXqwmtCiHFamfsxs/Yfxd6KB7
	CBhc9MWPesfMUBi27GSEswT3a/fo7OK3ecXtc1Pv09oh3xnvJLW1z6XnE7spyKXrRVChONWPoZmXE
	t3oQxBFxcPIwVUyohA8X04849XG8Sx8lMagWllU1dp2G9AQI68CDZPrx77nmFpPa7h+GDIAddPw6y
	ZjHpWsniFm19Xl0civBdyaz3jBlkbHdzXEWGu555Q4hXBRtjH7P/ew8q3fKZb/ZK71Um4UMVm1sEi
	gAvsmXmBMK/SFcy8ECKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEy-00000006Rl0-2kZZ;
	Mon, 18 Aug 2025 04:13:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEx-00000006RkO-19Br
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=psS8/HGvEcGOGsMgWWXg1B2q2pSduh9TsFVsTLXCZt8=; b=CWewRRao+0D+Z+5V/uxFu7fG3c
	DIz/kM5FD58YChzu2fvCyNKjjM0ysPtGMjC7tH/PgZ7jQo8u/1yciXS8CgWHFDwpyB5yfLSOJUfXU
	Z9CpWAUoNb46+z4dqsrr3EguiinFuS9aAqGAP4ZHgpvHXLD44PDXemeHcSkHvmcuytKS5WHnSc7c6
	Z3rkovTa+MV6TkvFijWPKBPpHALJsj9ELIBjan6Q3b/NXYldXEb5C6OukL7Zth0uZBGE+Ax0EllyA
	p0hUJe/VZIOYeRB3p3t/wdBsZu4hgZ68ohL+muDSNE7ib4SDGYLFhB8GJXxXaoM5R/jrpHPMEIb3U
	mcP/WRBQ==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrE5-00000000EeI-051B
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:12:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2445826fd9dso40691725ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490323; x=1756095123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psS8/HGvEcGOGsMgWWXg1B2q2pSduh9TsFVsTLXCZt8=;
        b=JkYw1ELtkFi8NPxY/KkbBvrJUT6hNRbNHzH2n1wQvV02vYB7vC6+++4Pz68Q+fIs/8
         SUHs0hwot+8E4Hk9fHTsuvuRA5ueR07O6rxJmdVasjUX3zneAAxK/BLboPa0kLOyfltk
         DYa1sv5+1MW0oJOzy+qheXaV473PGzuHnqD5MfRr0czPhBb+JqMjfnqbd5rccj7U11h3
         yxPfYgIXVRDm4X9tHQZGLN8PcSczLz9v+gUj2aJuGhX11eVmE5xHgRB6UyRodLAon9ci
         lNG5nhG/wncx07BC9GvYhV8w80CJwcYRikb1QY/ZyZl6yPgS9CCq9oh36y5kaKS1TS2F
         qpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490323; x=1756095123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psS8/HGvEcGOGsMgWWXg1B2q2pSduh9TsFVsTLXCZt8=;
        b=JwIPYpO/iPXp3KZNrcLSnEZ9N0nCq2xC3GsNdOilx+/frCxyikFIJiBFvBcw8KMYg1
         HG/sqUlz7SgZQ8T7Ev+kNfq2GqeFkxMYBjLcNJg5fhpLEXnDv7pV2JN2Z9BhQITpDB4q
         LfCr5j6Jk4cHfvgLGA2A4BtKEeUTgCot7ah2zBEUucU2qrCJBJ63boxbzn3bxVviCaMU
         w6f1Sbqfj+lcVQNoJVaPncrhwVlWo0BNbPjs23yV2SdfYEHzUM4UfKplDovkOiszGXGF
         LRIUyIyP1MlMApGFbZpHZSkiL6HPShi9fp1xDU6uddSRr/5PObHAcjNwcR5/QQm4N/Hy
         y1Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWiOgNpquDXidji75bs/gfBK1NLmKLasbkapW+f+dGhfRHknGAaEx8nivGRYhwZhr2ENBkDcmia+cyV5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzH/3EbsQsQIKMCQDR11ZiGywU1/oGXQAo3qmZanG8AQP6qA6+z
	Let2r7Dy0W//q852w0+lid0iFssXFQsN5LwS81hURotSgbHaK9nKi5p9D14LYZ4L4P0=
X-Gm-Gg: ASbGnctrZIo/mO/DRc0T0AKf3QF7BCCOMnhKKYnf0ezQ97wfnW6afKgVLEGzolvgiy+
	5BOFl/vnXKU6svmlDz1GPd8Pnr+3dnnaAYipfe/fyqLeL0irGZgNV516oVsSMRjuxRTPkeyhu1X
	+cv/dzEmBa9mPW5HDgEwo7G7jftBDqF+KEVD3h7E6uc+Hzb0qoV7wQezcUNaODkWqqPvKSjZNqW
	mzUA0Tn6VxW66+aEk2vN681KN18tMGfjyVvSBkPhty9HR04vpI6DM4168J1dRjIXHYDpksnX1in
	OGDr6b0bp9xm7xvGQI1iOl8pRL36Ocb/51GRcAHHPpQM/tnc1NhBCExwgtnhXinJpyNAkaGp9eU
	YZWZM4b1Vhh597tdI0ZI7ShkUVrZpY3tIQpUp/EpePLIA25IweDpcxw==
X-Google-Smtp-Source: AGHT+IFg2JaZydXsoz3oTb0p0Gh/5FN3+0FJRvvXtyYYz3C7r58Enx6ENab6eBnXqudj+8YWHETz5w==
X-Received: by 2002:a17:902:d58f:b0:240:5c38:756b with SMTP id d9443c01a7336-2446d710a8fmr130054555ad.14.1755490322531;
        Sun, 17 Aug 2025 21:12:02 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:02 -0700 (PDT)
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
Subject: [PATCH v10 14/24] ACPI: property: Refactor acpi_fwnode_get_reference_args() to support nargs_prop
Date: Mon, 18 Aug 2025 09:39:10 +0530
Message-ID: <20250818040920.272664-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_051206_340387_D439FDB0 
X-CRM114-Status: GOOD (  19.35  )
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
