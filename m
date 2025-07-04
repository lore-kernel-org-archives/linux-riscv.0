Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E350AC83F05
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdX6G7vBHDEfP8JlZjlyVake98AsRPJ/jw0QusVV2eM=; b=vFNb4cG4YsR2OS
	sn8FpNJ24660ErfxCiguQ1UL+vO+eCt9DXQEDLGBpSL+1gG7dFiKpdWVrWHxAaNCBBgCZ6SnAJg4Z
	2JC32XubpPEut20uj1ikhGqTDshz3d4hyeyjqjbXIGMxewKcSfH4usKozy9gHQZGjT0m6hPXbOSKQ
	8aWL5NhWRlSzbW058qbftoA9HLx1ReZ5gTCxwluOVLOjo1ylW0vjGTg0mN6DgFdaMFVJ43NcPczzG
	V52m+BzqFKcwMwAeHnigB0DoMB6iN7QlzgW0xVa8WmeVX/RNGy23nP+EGEcndFyVKUUtktxtjV23D
	elAaLgqk9oJLLs2bakLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaW6-0000000DV5n-1ger;
	Fri, 04 Jul 2025 07:07:26 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaVq-0000000DUo4-0bDu
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:07:12 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-315c1b0623cso907785a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612829; x=1752217629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNcclU2G18Bdovh3QAsek7AK/q114CkADd+BrTGwXao=;
        b=A/CCvuiRigaEMBEBK3HLV3UrZxU9qI3DuUgaPmOEI5XoBNWWs2kAc0cDEMoqZzACy/
         FoM3BRfsgDBRSJyl/3f9J1t/uyZHQy7k7Nj+dy9+MtOjPB8bIJUTS9SMbogVYsiflYlk
         cmWi1GipNgTt4qJDOdldy7KvkyCwdqBuUKpZFiQk4hGYnbpaDisIvMOXWwy8lRB9cCBe
         sjoWtt9lTGxUjlOBAFDppqRVgVOLoiLYmSbZfdZkgJ6WM30OyU+gEukmvYO7TOY9RYvl
         LxRf8QcMOV+n4PyB06mqBg8Kh4NJq15KMCmOSGwgbky8QUGYWqBqJSXyhyKLly4w6Fud
         nGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612829; x=1752217629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNcclU2G18Bdovh3QAsek7AK/q114CkADd+BrTGwXao=;
        b=R0eXtnVaCYjn0kx6J+MtECCuiWCvCosbRFPHjh0H8wjgSEl+9WIOdLVXaXRxiXqcz+
         NkX0ep9U4qXFWkwQeB5cz5sAJ63dQ6oB7rznkwubFU95RUR/s69/u72ARv/PRGZ810p+
         ooefa08IuiZm2h/NHfuAHHqYk/iVb3mQ6Hk6jVaCh4LyCXqyCroShbkkw66tNXDF7Sug
         trZBdspXDysJZBWVmaM38ck38VQ8TQ3Hm5HoiP1BjRWVneeC7tMJZVERxyiF0zpjTthq
         ZgqbQBxDOQRBadXauLxmCajAwHSL7xOQJyJLC53tR7Sicxa7A5p7l1SQhO4uTKIxFDBX
         6zJw==
X-Forwarded-Encrypted: i=1; AJvYcCVjVtGOYYEvS+3cHKyJNgSg8V5b4BcfsAjd4LeOOqWULW0numK+w0ErG4SwqKeHDQxgRDx4AMKue2pdXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPRjihnj65Yq+HxcXseuFtDlBYPXjPziAm7a88iQLA6C2gcrOf
	e9wqCvFv61DEjpJmtVLo1Jk0nZz8utJtU6ew9S9xZQW/uckNvYfefAcurmvQpocAA00=
X-Gm-Gg: ASbGncspJTUqZCm3/HjCCjp4XUe7TBzpEpoN4plmway8RFxxY90RYIWCdwIOLNncJ/6
	mA7j3ImBIszK2uy59VdtwDlm2NyCFcq90AF8BPsB3WQtKFbKFpG1Icuj9dvwPbA8yfCMC7SzO92
	SkNwMHqn86576i9F5f1MDAQdG/xspeHfdWcZhjs4bUo1pWTqYBaiEwJ4Nbzj1YM2BhKWoHfKo1y
	VvKXCaOn3nwCBUYNsuLxUo9+qHrDDwDq+iWt3OfHWcjtquBAYC/Zl4bL2RKBF4r5eIxTjZwY6Dd
	2BvakjhyleBicj51eVnvpyaNOuoYmJECYUydzAMIeyU4Oc5BocTTYJG9XDQtXfvJ/XnXNd52SYu
	aBrkTgi9mXABydHqoiEYeELVJqw==
X-Google-Smtp-Source: AGHT+IGrP/l0dKEOOpvLsvS4JGiMBKWICRCAtYJOylbaG7ycll8dUnb8u46RulbU17ZZf/1gB5ixPQ==
X-Received: by 2002:a17:90b:33d1:b0:312:639:a064 with SMTP id 98e67ed59e1d1-31aaddb4ac6mr1562105a91.28.1751612829169;
        Fri, 04 Jul 2025 00:07:09 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:07:08 -0700 (PDT)
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
Subject: [PATCH v8 15/24] ACPI: Add support for nargs_prop in acpi_fwnode_get_reference_args()
Date: Fri,  4 Jul 2025 12:33:47 +0530
Message-ID: <20250704070356.1683992-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000710_193011_9878F9CF 
X-CRM114-Status: GOOD (  19.45  )
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
