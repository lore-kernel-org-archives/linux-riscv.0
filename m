Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56995C02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQpt4saFQ+LjMjvzY9M2+/Y4LtoD+cj9Zb7Z1y+xlis=; b=y8skXpmUL/hN/3
	mJAccBBQbFRgSX9tv3M4fiHPhrUMSptQVIPaCEyq2Q3fpHVc8synIe6fWgE8dNU0XXcx9VjiL6Jzf
	C5wQktogmUZMa6pEDuvEMZewYdt1yyDKSafM7Ow47KJpM9RDAUOMjmcPjvUlN5rdveppQc3lAOmvN
	VhhloXOU6+MONx33+SpEmrCHjUk6zG/1XRcz3lnFvQQWl40bihZrHN3dDIlEVsJwxo+nmtdEpxUSf
	GCvATdKxHPkkbdziqtzfN8ykvfsARCmSClN5sQuteJGNUtc3UN0MMC43HsRVsscZzjCA6JMTrH85y
	lS+KV8jyRG0JAklNBHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesBQ-0000000EucN-3CX0;
	Mon, 03 Feb 2025 08:51:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesBP-0000000Euby-3jv5
	for linux-riscv@bombadil.infradead.org;
	Mon, 03 Feb 2025 08:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xKPU9Sa0XErJQ269iR1m+yFQ6vBRkGcfLU2YVNEM1yU=; b=Z/JdWjNxXp7yqjFXVXkrkeGIje
	jrXXN6KrCS9sqvogFrJIZpUNVTDsDVOx8ixB8CvY+frpAUaqxx/K7Q+ch7gwwPvq042beHZPHIoES
	wdZDOqoXVIDDUZez3I2vIuT1zO0FDuBy4tT1iwvArpGN/ohLPATi/hjrC8d2ikK3lfPsxV52/E8lw
	33fzCuk+lEEQUzi4wR32xWTaM/zSBa3eFhuWFieV1sb/HSi1vMsA7DeA46dROqTqoeOQktNiEuxEP
	YuGwbJ9AZgNfzxpDD4nsvG5hi51+j5rQarxbt+XfRsSB2dkkxuTEGcjrA2jSu7hLhhbYNDaEA3cZ4
	UHP1s0NQ==;
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesBM-0000000G10u-40Hx
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:51:54 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-46e28597955so37555951cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572710; x=1739177510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKPU9Sa0XErJQ269iR1m+yFQ6vBRkGcfLU2YVNEM1yU=;
        b=BAyWcA2KsMDUOC0kWNyfQ0e9T+PrZrxY/GUotHT7ShB/8Je5J+jquKhynXm3xXDwQ6
         whO6v0GZH+MyXxNDIiADCdkDYxPeHCbEAp19IOBh6MtTMOD9vB9s1AzDoys9d1YLmy/a
         f+s26rZcaDGznYEtA0WOFCNt36m18/KgRKxImCFgunieVNAqaaUnA+qQS4kdMqSke0sy
         xkEoisItnvN2vgTZuEMP/VfKcUABFYsSfoZbZQ2Z857++cuefLA92WJ/tqhfdKHfndDT
         5W6cCvWRilhs0kBFwcM5h9/I57C2dNRuUt2WFbInYQ4yP8KZljFD2mRoLVAOTBV+Q4dz
         OrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572710; x=1739177510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKPU9Sa0XErJQ269iR1m+yFQ6vBRkGcfLU2YVNEM1yU=;
        b=DemG3KIjnJ17M0UFP21IJT8mOP5+3621hLo9Tpprdg3+y2K0MdDAKA2RqZfq4ZY0V/
         ZjzkM7z0LZhhK5JlFumdn7gRNOzuu13jO7WX0Z1tMNWtkU9W6Q+Jv8YrHqAS+XDaCOLP
         aaALamCim+2T4sGur7eC0HI9s0Gw91fh1DWbe6ubr8r/vVfTZ9uYvFYgyXo7ZSDtEtkU
         2w5QitT7yCymc8pO+wSlPUjz2/aGKSCNrr506rBLgjJOwmDchDfAGC/ClQXdaPId4oc3
         Hg7NaSyQc9oXOsuoo6IcuwOB6WqVbS0hrc+NrBmUGZ4+PeTYcFuZBN37NZlaZZelYPM9
         TfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNoQKA7j1XHIxvMZgoV0FrqMcbGSTaHo9SJc/Q7k52PT+C8ZOJ0zXm0XEud3ZIKjaPchZQSHTO4mrJsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwLotijFPFT38QReuda7h0OMoTKDfDhvNzcVvE4z82CGC670am
	xxg0pMQWTJc9P6MFFD0zIHQRtuhawdJHibN8XNM97E0VtbvkC5EI1Tx/xJeHDRo=
X-Gm-Gg: ASbGncsoQ8ad3X4QMR6o/RkQjEjLoJNlJv5nXe7UvJm/t6bow0aELsAxbt764qN1frN
	ZXZlCqKqT+L+fHLREmDhHT13JpJvaNkyEzjfNHzu5CmroHPI3L+V0bXJKTl8v4MJ8Nsh1k1olOv
	sVAmytvqFtSZTKC+URrjbZ4ukgN1q89JEycgapqEgLygB58mkgBCL7AHTP3tfngYKCwrEwSdbnH
	2Zn48lp+f8mzB2r7fNtvjdY8QoLt2KzCgtsWUqy5lbEUo9grRq8mljH8yOVhBXz7zq3B677e8CJ
	Gc3N8o1B5mnXOEMiCbxj/Q259usizcbgQH9cZNm2q37HMWhgp8slmVg=
X-Google-Smtp-Source: AGHT+IEAlKOfPcFGtQpuphtMUGEmXxc2P48rleG0cvQ2g1VY6q+JOVmQhLQFN1AJS8GBnyiR7yIR5Q==
X-Received: by 2002:a05:622a:5a07:b0:467:5f95:679 with SMTP id d75a77b69052e-46fd0b6b509mr303055821cf.42.1738572710457;
        Mon, 03 Feb 2025 00:51:50 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:51:49 -0800 (PST)
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
Subject: [RFC PATCH v2 12/17] ACPI: property: Add support for nargs_prop in acpi_fwnode_get_reference_args()
Date: Mon,  3 Feb 2025 14:19:01 +0530
Message-ID: <20250203084906.681418-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_085153_193175_41C09222 
X-CRM114-Status: GOOD (  17.30  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

fwnode_get_reference_args() which is common for both DT and ACPI passes
a property name like #mbox-cells which needs to be fetched from the
reference node to determine the number of arguments needed for the
property. However, the ACPI version of this function doesn't support
this and simply ignores the parameter passed from the wrapper function.
Add support for dynamically finding number of arguments by reading the
nargs property value. Update the callers to pass extra parameter.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/property.c     | 15 +++++++++++++--
 drivers/gpio/gpiolib-acpi.c |  2 +-
 drivers/pwm/core.c          |  2 +-
 include/linux/acpi.h        | 12 +++++++-----
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 98d93ed58315..ddea5dec70bd 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -887,6 +887,9 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
  * @fwnode: Firmware node to get the property from
  * @propname: Name of the property
  * @index: Index of the reference to return
+ * @nargs_prop:	The name of the property telling the number of arguments
+ *		in the referred node. NULL if @num_args is known, otherwise
+ *		@num_args is ignored.
  * @num_args: Maximum number of arguments after each reference
  * @args: Location to store the returned reference with optional arguments
  *	  (may be NULL)
@@ -919,13 +922,14 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
  * Return: %0 on success, negative error code on failure.
  */
 int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
-	const char *propname, size_t index, size_t num_args,
+	const char *propname, size_t index, const char *nargs_prop, size_t num_args,
 	struct fwnode_reference_args *args)
 {
 	const union acpi_object *element, *end;
 	const union acpi_object *obj;
 	const struct acpi_device_data *data;
 	struct fwnode_handle *ref_fwnode;
+	struct acpi_device *ref_adev;
 	struct acpi_device *device;
 	int ret, idx = 0;
 
@@ -1012,6 +1016,13 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 							   element->string.pointer);
 			if (!ref_fwnode)
 				return -EINVAL;
+			if (nargs_prop) {
+				ref_adev = to_acpi_device_node(ref_fwnode);
+				if (!acpi_dev_get_property(ref_adev, nargs_prop,
+							   ACPI_TYPE_INTEGER, &obj)) {
+					num_args = obj->integer.value;
+				}
+			}
 
 			element++;
 
@@ -1565,7 +1576,7 @@ acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			       struct fwnode_reference_args *args)
 {
 	return __acpi_node_get_property_reference(fwnode, prop, index,
-						  args_count, args);
+						  nargs_prop, args_count, args);
 }
 
 static const char *acpi_fwnode_get_name(const struct fwnode_handle *fwnode)
diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 1f9fe50bba00..de8e4d081539 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -839,7 +839,7 @@ static int acpi_gpio_property_lookup(struct fwnode_handle *fwnode,
 	int ret;
 
 	memset(&args, 0, sizeof(args));
-	ret = __acpi_node_get_property_reference(fwnode, propname, index, 3,
+	ret = __acpi_node_get_property_reference(fwnode, propname, index, NULL, 3,
 						 &args);
 	if (ret) {
 		struct acpi_device *adev;
diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index ccd54c089bab..7afd78061e6e 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -1790,7 +1790,7 @@ static struct pwm_device *acpi_pwm_get(const struct fwnode_handle *fwnode)
 
 	memset(&args, 0, sizeof(args));
 
-	ret = __acpi_node_get_property_reference(fwnode, "pwms", 0, 3, &args);
+	ret = __acpi_node_get_property_reference(fwnode, "pwms", 0, NULL, 3, &args);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4e495b29c640..b9fd3c812e1f 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1296,8 +1296,9 @@ static inline int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
 int acpi_dev_get_property(const struct acpi_device *adev, const char *name,
 			  acpi_object_type type, const union acpi_object **obj);
 int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
-				const char *name, size_t index, size_t num_args,
-				struct fwnode_reference_args *args);
+				       const char *name, size_t index,
+				       const char *nargs_prop, size_t num_args,
+				       struct fwnode_reference_args *args);
 
 static inline int acpi_node_get_property_reference(
 				const struct fwnode_handle *fwnode,
@@ -1305,7 +1306,7 @@ static inline int acpi_node_get_property_reference(
 				struct fwnode_reference_args *args)
 {
 	return __acpi_node_get_property_reference(fwnode, name, index,
-		NR_FWNODE_REFERENCE_ARGS, args);
+		NULL, NR_FWNODE_REFERENCE_ARGS, args);
 }
 
 static inline bool acpi_dev_has_props(const struct acpi_device *adev)
@@ -1400,8 +1401,9 @@ static inline int acpi_dev_get_property(struct acpi_device *adev,
 
 static inline int
 __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
-				const char *name, size_t index, size_t num_args,
-				struct fwnode_reference_args *args)
+				   const char *name, size_t index,
+				   const char *nargs_prop, size_t num_args,
+				   struct fwnode_reference_args *args)
 {
 	return -ENXIO;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
