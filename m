Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C4FC8303F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4c1IhwqnfbSgsMOI21vQy3jEBUcdjfB/fP517n6Ep/Y=; b=EvNkeAqk4vjIpl
	CC+w7672UiL2JRWUkUZv6+ubifF1TSJSLJlnkMph9OOulVQvP/XM39rv0tpF2vE395OLrMVjNfy+n
	kOAGEdPcTUQh4TC3PJSQtB8/CqfzvfhgxB5ZBKjyps/INdW5KRHFfIkmobzzL8XttnpEVJyqU/9c9
	rOHrKMm5GkroQi8zccvt+9bo1YWEzXQRzDDZkvKHwSNIy/kzNenVYjpKq+Fm+k2T5RF6KaX8zfEVZ
	kae+sFXofBHmPc5empYuYU60x+wC1shh2J3/bUlFuWIXg6m3YOfVg7pqtdPyQgais0fbVPx18S+Y7
	WWI26DZVjrMIXh5wDIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsFL-00000007Xv0-357S;
	Wed, 02 Jul 2025 07:51:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWppB-00000007GAA-1pxn
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:16:02 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-235ea292956so37481915ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433361; x=1752038161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmlL9kMvvcYcWlU45z5MYmmVSDmE1amNKft2tyH29n8=;
        b=TVLRjQlPO0lL+ofPEziPF81JytCyOpSCmCdkKdGnSNLsp06FpbTAdg0E+fZqLjbtQp
         V9MQWeASjR0l9hUGCk9Lk8jRJj3UugKeKC3jgVqYs9hdIXm75ixKpegbfL1/RpvVtluK
         dLUeiyyoKTD2KQdQsVGEE1ldjIduXmGy6pZvvjGI72dzksAgNRTsTCkQghNjuqlaX01O
         qKNLcUdeg+H6tHVndGczCCG1kr7DKPDTx3RkrdJy8UB2XGa5/8Q3B4mVLQMC51VhreJG
         BtvYB+8zsvBcqHEF+YyHM0FQ/TZiykwgiWWUwKvvbDHrrPkansYODRYvAgLa+20B3TB8
         SQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433361; x=1752038161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmlL9kMvvcYcWlU45z5MYmmVSDmE1amNKft2tyH29n8=;
        b=Y1Ch2wxFaUm3ovIBr8LHHFWixeH5mFkWJMDbjXeF9i7uIs3AyHT3sVNcUpzdZeBTbE
         GCk17wG1pszS2KlAMwPZbCl14Ncdu40xiJv1yzdpyaMnJ8Oy2uqY8+GCM//UteF+f33y
         7HWs8PuZ/tgChxmGOD3BCPmtaxuuMV2xHL3JS33EFzgV+d6cIyyG97cNOULvJNeZgFTF
         hB1JKlzckw8R5fGaCqoNpOD8odjdJ6aUrJe/wvdEFUR5GKNt8DrqrjB96a2wTikqm6gj
         N1kz51GR5c7zv9DDHPHYH7HprumHlGH44lGyZtQa1KXNTHIpLFOcZ2HRWFCmjixlYXyw
         DnrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhAsD5ZXZHueUbElF256xord5yUuPb+g/QFvEx8URjDJuXdIQIDKgNWXyzNCcRuZsc0L5P27tpmsXDiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy10Mg1lE2DWBE6G138lBGMzg/4VqeX6P/FhPrmCl5pkLu7Rc1C
	00+49kkQwyQeNOoqK/NhXDrVW2tE+M8B77syztM4MnSkn8tBK4d9qBSym7AgiU1bYC8=
X-Gm-Gg: ASbGncsxMJCdsprRQBseeKviOxRJ4rXW64uEOAi1Nt+I4udteaoeRDpwqGpbtIOg8QH
	7QuetfQF58xY+Vd0yuJHzAtkMu0GYAc8L8IJy9qQGLxLsy7iUiYYYuVdNEoizEELEcUKU3+SmNS
	vAjUv5qAaJO532/NZ2EBCZtZejVFou68xijCWcs0Z1swipPUjpQ7vkXlPOj6JuYoWFzqVhgQR5/
	E384+4rOKElo8/r77dCxg9W2BSNBPDwcS5xsoe60ulRFNHupIBLfQRSDX0TzVGzbNxuWKawfQkq
	i1TdK2NInuMOUaxhYEMwaPvq5n7BGK4HvibDD4Hxf5H/W6oXNiKXB3xwWwtBYAiPVhonieu28ve
	4LGJEmN2fTrF+qtTS
X-Google-Smtp-Source: AGHT+IE1P7SGRwHhgK16MRfDAXrEX7DH1YLnpHg6sa/GNFGZg6KWOiAXLcWOV6zX2nV96zG+z8muGg==
X-Received: by 2002:a17:903:3c47:b0:235:f143:9b07 with SMTP id d9443c01a7336-23c6e483a2fmr24735045ad.5.1751433360617;
        Tue, 01 Jul 2025 22:16:00 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:00 -0700 (PDT)
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
Subject: [PATCH v7 15/24] ACPI: property: Add support for cells property
Date: Wed,  2 Jul 2025 10:43:36 +0530
Message-ID: <20250702051345.1460497-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221601_476005_CBF04483 
X-CRM114-Status: GOOD (  19.06  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

Currently, ACPI doesn't support cells property when
fwnode_property_get_reference_args() is called. ACPI always expects
the number of arguments to be passed. However, the above mentioned
call being a common interface for OF and ACPI, it is better to have
single calling convention which works for both. Hence, add support
for cells property on the reference device to get the number of
arguments dynamically.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/property.c | 22 ++++++++++++++++++----
 drivers/base/property.c |  2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index d4863746fb11..d08b0ea5c915 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -882,6 +882,17 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
 	return &dn->fwnode;
 }
 
+static unsigned int acpi_fwnode_get_args_count(const struct acpi_device *device,
+					       const char *nargs_prop)
+{
+	const union acpi_object *obj;
+
+	if (acpi_dev_get_property(device, nargs_prop, ACPI_TYPE_INTEGER, &obj))
+		return 0;
+
+	return obj->integer.value;
+}
+
 static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 					  const char *propname, const char *nargs_prop,
 					  unsigned int args_count, unsigned int index,
@@ -892,6 +903,7 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 	const struct acpi_device_data *data;
 	struct fwnode_handle *ref_fwnode;
 	struct acpi_device *device;
+	unsigned int nargs_count;
 	int ret, idx = 0;
 
 	data = acpi_device_data_of_node(fwnode);
@@ -960,11 +972,12 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!device)
 				return -EINVAL;
 
+			nargs_count = acpi_fwnode_get_args_count(device, nargs_prop);
 			element++;
-
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						acpi_fwnode_handle(device),
-						&element, end, args_count);
+						&element, end,
+						nargs_count ? nargs_count : args_count);
 			if (ret < 0)
 				return ret;
 
@@ -978,11 +991,12 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!ref_fwnode)
 				return -EINVAL;
 
+			device = to_acpi_device_node(ref_fwnode);
+			nargs_count = acpi_fwnode_get_args_count(device, nargs_prop);
 			element++;
-
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						ref_fwnode, &element, end,
-						args_count);
+						nargs_count ? nargs_count : args_count);
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
