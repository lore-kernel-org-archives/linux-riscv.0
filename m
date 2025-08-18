Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3D4CA0EE4
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 05:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40U/V3uDfHx7sPpXQoWb+5GswOx/dAzqzBkz84En27A=; b=ZbKnfJTXDUitGP
	BWimvLfjt01mD29l/4P00G+cBma+bPvJbJod8HTRptkfwJ06oDxwXjUR8TiYN0jP46om5D7Wy6Xu/
	aDbrzSSzzx2F92wLueuPc7de2Fx5PupT5zx2IkjUyTdrSrJq4lJ6cpte/55PKp7vqwe/YFS4mECtQ
	kPuwfjUSDo0dQa1Ape4jvrmDLmMa18/VjXcjF7pHDtR0PPyBGRExm1g/gqzidCSW14Agey4Oxxzj7
	VbXWDgsTUy5O8/LfK/vBbKdHpxaGWfPmnWMX6b9kxBcdrXiqWqP3bvszH7vGpBPpEPfQX1K0wrBTx
	GonYCz34jN4zG/bs+3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsGI-00000006XAj-1QXb;
	Mon, 18 Aug 2025 05:18:26 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEB-00000006RYk-1dgR
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:12:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-32326e2f0b3so2578062a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490331; x=1756095131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euEEBnJ10Ul0dBSAcTDiXwaw0u7DfxF4JtogRsP9Xlg=;
        b=lQzaIFI4pL8Lh084ae1fSP+4u++73rzLBJ6fsqg+QWTSA1TjG0AyqQY3+qaClU6FqO
         XSTrSFgZKdXOPxxQU4pVc+0mrxC5E7ountUltWwfCJ6o5C0XDvTgrkhWfFBarHWKHJ5E
         Vu+em7lztimh7g6jhE8NLjHTCe9ULoIov1M2G/8ABJlHkOQHmZqCtanIYRMZkGbKQtau
         WvQea5QO+WQ9BH5mZTX3NPntbHdjlZXuJOPGXLoBlbnpLehqKRZjUy2EMwEVTEyD1UeS
         7VgjSz4MlsS2k5yFa3IrQAMo9RXRhF8Kcua/gAhjvF7yaq5FychXu2GDSlNb5fggiDC2
         CR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490331; x=1756095131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euEEBnJ10Ul0dBSAcTDiXwaw0u7DfxF4JtogRsP9Xlg=;
        b=VwZx6KpCQrH3s7HtSJtPonwgDZnii8zo9rhk3Z/QAY15k8gkEpZmIfzIbjuc4gT7WK
         WJZd2/CEyS7fZ7p9RlsjrIDPAuGlLBmFRKQ7QcSLyqBSIWty0vXHP95Br7mF3Y2K6wxJ
         9wTvhjwcBTE4v+HvatVMdCsFghjq98n8u0dAj3DXnzxZZC39mv5nN2alefBo1r8qUN3S
         MYTkNBiNhm+4A0vKSbIdTlYDJwVA8dJ1Ed/+mpnJY1nFsN3VYhhD7oMJT1Of0XSIvtby
         /3Z8ar8T8fjh3i65+E0X8svXzrgPPLQWgOkM2iiGmiOlUY3XqAhLu1uLn6xbxLp4YnWk
         MSxA==
X-Forwarded-Encrypted: i=1; AJvYcCXrXAnooP42I2Cwggo0fpZWXaRlnO73U3LBnzFVklg7Ae82J/RC65dN+kTSMxaTjcGCQPlq39vVHHGvcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUk41w26Ou7eroFhVgaL/jg6alAlELpwpYQruP/C2fQL2Hqm0X
	2PGPQ/w0dpjViVLkp6nkXWadNtW02ZGQkzAya5iMNwUeh4gUKOgRv2QpgOttNmCQTQo=
X-Gm-Gg: ASbGncsBXRA72BObCwgjTZ+WfDVvY3xKIgEZl6Mf2UQNLNxms3a8jGPoYo2SrVnz544
	4TuTPQz+yCeoOKW86XkCK+88RC1Sra0G9WaVftUC55jKMKuQaQNobkIYZOVgkRasUxzDQYdxmVd
	UQp/OnyUbuPgeSLgHwWB/1qkOOAdEQyMB01pPYY/7yYg79PvUlAva76IbX19iRKyVExKFlYnA4C
	+4HfF4eyKYkAmwzGBierTCNSA1APcq1a9yrloVY/ffRaY3RAsEnaSGS5Q3aFpwR5CFOygrqpehU
	z6UL8ZiOXpb2Fb9RpkvqLRFHOYKCSC2cHAqpMIa//aji1t3O0XLmv2dRPNvOmj5O5CA8RpcquKL
	KUirFOvBU8FxKOEDwrKT4mQdQbOR0gbHZsL15kFG/r7SicqjXZWhr5UVgbHooaaN0
X-Google-Smtp-Source: AGHT+IEbCDpwORPaaFZ1NYP5UlV84IBgHfNrd/o9UzgQMcIg0DT5gPsfDu8wRZ7EeXNlc9EJa4PqPg==
X-Received: by 2002:a17:90b:5343:b0:2fa:157e:c790 with SMTP id 98e67ed59e1d1-32341ea8b2fmr14321856a91.5.1755490330522;
        Sun, 17 Aug 2025 21:12:10 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:10 -0700 (PDT)
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
Subject: [PATCH v10 15/24] ACPI: Add support for nargs_prop in acpi_fwnode_get_reference_args()
Date: Mon, 18 Aug 2025 09:39:11 +0530
Message-ID: <20250818040920.272664-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_211211_434493_AE46E735 
X-CRM114-Status: GOOD (  18.83  )
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

Currently, ACPI does not support the use of a nargs_prop (e.g.,
associated with a reference in fwnode_property_get_reference_args().
Instead, ACPI expects the number of arguments (nargs) to be explicitly
passed or known.

This behavior diverges from Open Firmware (OF), which allows the use of
a #*-cells property in the referenced node to determine the number of
arguments. Since fwnode_property_get_reference_args() is a common
interface used across both OF and ACPI firmware paradigms, it is
desirable to have a unified calling convention that works seamlessly for
both.

Add the support for ACPI to parse a nargs_prop from the referenced
fwnode, aligning its behavior with the OF backend. This allows drivers
and subsystems using fwnode_property_get_reference_args() to work in a
firmware-agnostic way without having to hardcode or special-case
argument counts for ACPI.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/property.c | 29 +++++++++++++++++++++++++----
 drivers/base/property.c |  2 +-
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index d4863746fb11..e92402deee77 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -804,13 +804,35 @@ acpi_fwnode_get_named_child_node(const struct fwnode_handle *fwnode,
 	return NULL;
 }
 
+static unsigned int acpi_fwnode_get_args_count(struct fwnode_handle *fwnode,
+					       const char *nargs_prop)
+{
+	const struct acpi_device_data *data;
+	const union acpi_object *obj;
+	int ret;
+
+	data = acpi_device_data_of_node(fwnode);
+	if (!data)
+		return 0;
+
+	ret = acpi_data_get_property(data, nargs_prop, ACPI_TYPE_INTEGER, &obj);
+	if (ret)
+		return 0;
+
+	return obj->integer.value;
+}
+
 static int acpi_get_ref_args(struct fwnode_reference_args *args,
 			     struct fwnode_handle *ref_fwnode,
+			     const char *nargs_prop,
 			     const union acpi_object **element,
 			     const union acpi_object *end, size_t num_args)
 {
 	u32 nargs = 0, i;
 
+	if (nargs_prop)
+		num_args = acpi_fwnode_get_args_count(ref_fwnode, nargs_prop);
+
 	/*
 	 * Assume the following integer elements are all args. Stop counting on
 	 * the first reference (possibly represented as a string) or end of the
@@ -961,10 +983,10 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 				return -EINVAL;
 
 			element++;
-
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						acpi_fwnode_handle(device),
-						&element, end, args_count);
+						nargs_prop, &element, end,
+						args_count);
 			if (ret < 0)
 				return ret;
 
@@ -979,9 +1001,8 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 				return -EINVAL;
 
 			element++;
-
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
-						ref_fwnode, &element, end,
+						ref_fwnode, nargs_prop, &element, end,
 						args_count);
 			if (ret < 0)
 				return ret;
diff --git a/drivers/base/property.c b/drivers/base/property.c
index f626d5bbe806..6a63860579dd 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -578,7 +578,7 @@ EXPORT_SYMBOL_GPL(fwnode_property_match_property_string);
  * @prop:	The name of the property
  * @nargs_prop:	The name of the property telling the number of
  *		arguments in the referred node. NULL if @nargs is known,
- *		otherwise @nargs is ignored. Only relevant on OF.
+ *		otherwise @nargs is ignored.
  * @nargs:	Number of arguments. Ignored if @nargs_prop is non-NULL.
  * @index:	Index of the reference, from zero onwards.
  * @args:	Result structure with reference and integer arguments.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
