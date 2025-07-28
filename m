Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771C8C87FCE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40U/V3uDfHx7sPpXQoWb+5GswOx/dAzqzBkz84En27A=; b=TlFK65yWAhQ/VM
	ouUNBWoc2NWwwF4yV1KZ7NmgZPSU/+eEJs91ZCaqC3ya2eksA7qz99DPrmqYZAHtRPJHwlc/GV5pE
	N5NksWPi/lsMKcKb6KxOkGgKgLg0v1E3ZzNnZ+n/VM3BR3haCrnvClqNj7oHBi1gR/KtIi390pcal
	TE9kI2fhZ+xS1wmpqgJZ0gmVHenC9NlUPRkYRUdoL3de+23kc8f+nlV8eihkjFNTnlu3L20OY2/Uq
	Ujl5O+fVSt189A1wqYqlFdFrJOD405wXQsUwW+9GdjkP4fRazgIFL8RcoEV6dXMB5rtLJ2724Uumj
	eFB5xvNAQ+MgBd7KHf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLY8-0000000EI4E-1PYR;
	Mon, 28 Jul 2025 10:57:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOP-0000000E8jI-0gAY
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Jul 2025 09:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=euEEBnJ10Ul0dBSAcTDiXwaw0u7DfxF4JtogRsP9Xlg=; b=HC9zvxhHl+Zc8cvZo1fHxqlkkt
	GX1RkPbJTeoxAhT/9/JdKNpOQ6eJD3BtQ7yofat65idiJrWQ+kkZL6y/HNkkLud9q4962RudEkK51
	BWV41LpnSKy1M6tIMN2NmOomxthCJYouMf0j8eTovYGofauYdczp8CSSMfOHX5i9ck5W5UO2gHGlk
	kxsi1MGz/TWvJx5ldSdGMgUyt1nh0ubat7Hoa6dW/PwAzr0WNyqWoiVm8vcn4BBkaaG8u94F5fxGI
	3UoWx+eacc/XpieeC/ro4ll1mWfVjrbCIS/ISaCLTW4QSYyZgKjoePUo0HnB4NOYJoxthj04PdjJ5
	z1CiyJuQ==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOH-0000000CPga-1xQy
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:43:36 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b34c068faf8so4187902a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695805; x=1754300605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euEEBnJ10Ul0dBSAcTDiXwaw0u7DfxF4JtogRsP9Xlg=;
        b=jp1TjVSAUnWkZ5+Rxyu+HgWVPw+8U8cHxJUvWXHxsxD09nLmEmYJmF8q6DMSDDNiNd
         4iUmkWXmmi98Oixf0xEGS4fxZ1/52L1r8+xtNHTgiQCthh9atubkL01WpCib+ecY8C5e
         kz2DddsP8M2+jZlPCRfY9UGY0AVW/B9XYO4cFoYb0jfh9OwLDaJt3SzLKB5tsVEd4TBZ
         XjPyD8TCuES5NQ3FVwDornM1bXEca3yKfT0Ms/sJdT18K4xE+c+cEJjLTfcfcCVhTEmp
         YkWy9nlfF617nrmQmv2UPv/r69BoSmIJxpHfVoSI6/Pph3a7XGErUtOykTCPI0h/G02j
         1ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695805; x=1754300605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=euEEBnJ10Ul0dBSAcTDiXwaw0u7DfxF4JtogRsP9Xlg=;
        b=iGeCtPRk6Yj2XNC9npzSL8MA34yz6tXIh1LavS0GT7Pt+am0gVk3eow7H2sMpAAkpb
         N5e5lxsXCxRiWm9hR+uuUa8jsKjyo9iaDjOov4BY7jkIL93tovH3jhYcG9G1cGdsB4Ek
         r9Z4ZRa3OcL39eRMo/rLxDOwUExf66j0+9zdoOCF7fcb9vrI82CWnUOjyr+YxhNxaR73
         g+1MQgshrZPjmCJqj8sgYvm5GopR2h4galOMATBgX2Cc3Aajw1SMcNcbLX4iAK4eRe7i
         X9lJbLk2WRCNxhyIi26hXxizyHNCfzGnvjV1kXJHZ6A6jJxffzk35SclHrpXnzz5PeX1
         ImZw==
X-Forwarded-Encrypted: i=1; AJvYcCXdDhdmiA4FLsE4DH6x1nP9HHRAGHemnuuPfGDjaS04i/WKuR7OzkhweUMas+okPmebFCvHtslQJYgXNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaNNUU6OZIlIQ/9TfXJPIF91+GxLKAwt6v+Wp7PZfcPHA0/KZw
	IsreiPNBAhrPmsS0HLaYlIXaYK4Ca2R9zf+iYGpdV928nxU82XgIeYo2VuPkP4DeZ5c=
X-Gm-Gg: ASbGncs25ch2gN/MOV5RP4DZorZbYtFcvz/4XqTqa0Nyxo8IyMOEMwAh3kGiHqDvhRp
	BfUgryNff3zNCX3ijgECpzr70ocHyEjMw795vyYJ4VXcObHC/n6fo8UGT4vCITXkfuP4snXbBnQ
	WdDcexFC3WZkwt7p1WZ5RSeZK+jlG3btLeP8HZQlM5agbIjdC6lOXB+2hGKwX7tTf+JE6QF9Ttm
	6Sq/SHkcAyyV2HquiRRK1yzuTgt+sqNNC1AW7q8WJhzbIaOjbuWFS2PgU7rXOUEsj28F4FVNtmH
	k9x++/u7nuzVWqO7HicUIhbTs3EbRqCQsHrJ9zl/trzNvHyWQPCdVEy0b4x/ILM6CqW183i+Drd
	xUUdDwvkaLp/kiwGhU9/Loa1pTCq3upgLghF7OXBT58K2adhJR/IQ5zHrXLnIvfN+43CtFrE=
X-Google-Smtp-Source: AGHT+IEizoJ3UNlyldS4GPjZ4kill5vbQWHdMNdPT9Dq9OqpgnaQ/TaBG91MoeiJ+RuVAwxQD5HSqA==
X-Received: by 2002:a05:6a20:7f8a:b0:233:14ec:4f83 with SMTP id adf61e73a8af0-23d6ffe8db9mr17043523637.6.1753695805335;
        Mon, 28 Jul 2025 02:43:25 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:43:24 -0700 (PDT)
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
Subject: [PATCH v9 15/24] ACPI: Add support for nargs_prop in acpi_fwnode_get_reference_args()
Date: Mon, 28 Jul 2025 15:10:23 +0530
Message-ID: <20250728094032.63545-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_104329_959760_B9A22154 
X-CRM114-Status: GOOD (  18.87  )
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
