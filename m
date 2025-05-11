Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5494C3ABCB
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//g8OAwlyzsAH60WFAjCUvplulawttpYjdZDkuWZWM8=; b=jc3wqWxFdKccAP
	iDM5zb14msQeAYK2Sxb8Oef6yse7vPNYIbyucE4lls2bvIYcPss/JCWS9qPIAuChgwfmf8/Gu1wTK
	5qSlNwfSnDv4jVtJDpo0wK4pRz9Xyb63xKYYuazJpW+a3EfzmOznu9+lDEEtQF/FdtH4/9ETLVysd
	9CLCHAr3/D+ZrczL6dnzbWDk/YeOOroO855U+oQgfqstFj9vfpuvzBkafsaG/PQ1CM4dkmv4FWHjv
	3v07zITgtRXkXZC+spl5mJMryBuaXN1kO/uzVlssFlaofJ222T/+du39DbIPJpld2PmaT4yWwtocc
	FCQCYxowila7Bg3TXsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7yz-00000007Ouy-2w3h;
	Sun, 11 May 2025 14:48:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6we-00000007ILc-206O
	for linux-riscv@bombadil.infradead.org;
	Sun, 11 May 2025 13:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nGByiNcbOS4lR4Bfcs//4xBTg2VCmvMstvJytXn1tOs=; b=rfPH9dSfxoiu9SHn9gldQfrz4S
	CZp4jjmi6QBQdadwR66BqHe0N+Ger0yk/2t0hEHrSwKf/73CS8ajFIH0ozUQT8Lk0SuB6l1lizJVf
	9x0II+ZSEBG2TtcqXV72k/Ilx4MJjPMi4FnFfXK0DA78lYvwR/8Sunx8g7VbAe8y/jpdptYGJat9w
	KiirXvki/Yp7+vBlTNNNcJY78ptPMlcHnYdeuqefsSQSunE6GqkTOkK/Ny10VpA63SE59fjI0Nqm7
	ROYX3yhQrOOOQlmFYwwtoV8tNH4QMrwZwpWc1lEqNTtlV9pVZ3NsPeyuq685UA3kx03+H+KrHCTFE
	ZfHPBgDQ==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE6wa-0000000Gbzt-1ple
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:42:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-23035b3edf1so350995ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970932; x=1747575732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGByiNcbOS4lR4Bfcs//4xBTg2VCmvMstvJytXn1tOs=;
        b=fPvTbjaD7ibMW/Gt7i+TVj9/8YsvoaRhNbfSQGz9RWq0pXNRCb5FD9UZuz3b68H+41
         B8u4+KFDYUS7oSs6ix5a97vnWkm4SmPjekOBfS0FigCt1QLk54bD1JSqjRXB2ONFsFuy
         tjuy7Fz0+OQgy+n7739KQsv0ndFvnrmidpBcv/cWmvt5QI41ao7jqAG+xQJhoUyN5ph2
         cTY6rFfENkNaBxeWUJGieXrw9fIkwkMMUgSNMUkUsaUh+2o19TtiGVnqBM8e9eH9/TVv
         iRCG4ywUVvTzdjXMkHsI2YmSva6wtOTusge8wagcASG+gEdftBkwEeQ3SilEn+FxJ/jC
         68kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970932; x=1747575732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGByiNcbOS4lR4Bfcs//4xBTg2VCmvMstvJytXn1tOs=;
        b=TAQxVBRCmC9CdIaknbY2Ui7xvCx1lFAfNxqEbXOru14N21suQeKRjunwkWNdJwEi01
         mya5Myxdjlb2TuVZ6RcsdFRDXJlzT2H8EjMbh1gwNPnHhXoGdilvBshoXSPWn5DrK+fm
         1Ozfaba/u4tiWgnWYaRSyxcxLAvhZzzynz2VzXLT5To9fNzLH4Qvt9IzsTc7wInHe4OJ
         TunnnwtBzo228ahq+BpNXlkcMro8rTlb8793uKql0ZazMEhn5yg/eiHHnyyaJ7yEIPpy
         XtkE/FaCfKNueFXDkzn+Sow0wLywyYCLDks0P412CepxlbvqDWGm2jLCC2UpITHuN0D5
         WgiA==
X-Forwarded-Encrypted: i=1; AJvYcCW0plQqDeJr58xokQJPGsIHgrOBD08J/CKRazWigK4bQcjBjOBFtkdaaGlv9jF2UgPejXvXmiXQoPoi3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMxh56x5nfPgCF/VqWKmx36+jIHiFcT+Ym7zVSLeMi1M9ddxza
	r5RPwNzBAF0NWGIm4twgeVP9/mrh9/lQ/KV5jvWTHNIcymKoXrhqw2TKR9Ly0rY=
X-Gm-Gg: ASbGncuKXAxafU5u51D7gEhbg6BdRIsk0+Um6CjAUDeJA/T/Ej9y1Vd6T/fLAxBsM4Y
	+ZIhEUkcGGAibh/HwGRKwzr906yoH9MwgIeWtjG0+zybB5+85ycTrIHoQ9LEiysUAqCFXqfPyU/
	SvBf6L09WvA2o/SgXERUW0jpGaYrdsOd+V6X/J5R2h15cYnO8O7tIugmOov+MKL0LUxsiYruuLe
	pxbpbhRUg/gFMRzPTrQwoAWNutmHUyXCHx3ukSutj5BLuzwadORiK5Z21RrN/uacm4/NPp9V8Cs
	o9Unvg+4DkFRBdrp5XPlXOp2sf+PAkF3Z9EpcIPOXpTVWcN9UlMwx5FqXduRQKsCnNBK7NqzaNy
	QQ2FFGEZPFZ/GZg==
X-Google-Smtp-Source: AGHT+IEVz2y4z8RabHXmB0ZMFkEbguqpeJ841vPD4v6JLrHHmpUprIGAeUTqvLaFFNsGdONbOeY4pA==
X-Received: by 2002:a17:902:d4ca:b0:220:eade:d77e with SMTP id d9443c01a7336-22fc9185ef8mr159540425ad.40.1746970932037;
        Sun, 11 May 2025 06:42:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:11 -0700 (PDT)
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
Subject: [PATCH v3 15/23] ACPI: property: Add support for cells property
Date: Sun, 11 May 2025 19:09:31 +0530
Message-ID: <20250511133939.801777-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_144216_680884_91776614 
X-CRM114-Status: GOOD (  15.44  )
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

Currently, ACPI doesn't support cells property when
fwnode_property_get_reference_args() is called. ACPI always expects the
number of arguments to be passed. However,
fwnode_property_get_reference_args() being a common interface for OF and
ACPI, it is better to have single calling convention which works for
both. Hence, add support for cells property on the reference device to
get the number of arguments dynamically.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/property.c | 15 +++++++++++++++
 drivers/base/property.c |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 364c58faf13f..51352bde617a 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -960,6 +960,13 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!device)
 				return -EINVAL;
 
+			if (nargs_prop) {
+				if (!acpi_dev_get_property(device, nargs_prop,
+							   ACPI_TYPE_INTEGER, &obj)) {
+					args_count = obj->integer.value;
+				}
+			}
+
 			element++;
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
@@ -978,6 +985,14 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!ref_fwnode)
 				return -EINVAL;
 
+			if (nargs_prop) {
+				device = to_acpi_device_node(ref_fwnode);
+				if (!acpi_dev_get_property(device, nargs_prop,
+							   ACPI_TYPE_INTEGER, &obj)) {
+					args_count = obj->integer.value;
+				}
+			}
+
 			element++;
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
diff --git a/drivers/base/property.c b/drivers/base/property.c
index c1392743df9c..172dfb950328 100644
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
