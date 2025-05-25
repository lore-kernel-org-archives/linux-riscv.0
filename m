Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFC6C54F30
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnSsQFtPY2fqwtIMrhCSTn+rb1w7XWkP3C0dhmXbJ7s=; b=jD+k4ZI44qSgdZ
	QT3E5CtdxqKWx/FAWe4xMnpul38qJYGjs6TquA03CwhVJixwcGltRYSXS0fb0VR2LXM99grlPPjIH
	iwYGUxquGHbaUhwE/etC4stvcXERHJQ5mQwVjyJC2vLWKgPdJYPgDiSxt4JtAgO9XbkNgT2yaB+Qz
	3enbfk/srzDt1UnqjUtZs5ShAdI1bs6X9u6ZrQqaMevC9WxchRuRCFKV/MYM9iN8ONM9xtnXLEHr4
	VE9pQpq5VXHGX1puTBrvddukmbdjjQcd3PxJP0LGwVmzo9h+xbLo9ATd3cnzLQ9Xi5MOtnAWyLumH
	cvj3ICrrl+23HwYuQ/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ74r-00000006net-0wVA;
	Sun, 25 May 2025 08:51:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ730-00000006nJj-0wU5
	for linux-riscv@bombadil.infradead.org;
	Sun, 25 May 2025 08:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Te183q+oK/UUiJXJqywViKcAzUsX+o6NlP4bjtzs3DM=; b=CfUgNa78EiMHcXhglNuz/sF85X
	0qvTysmNU6BMvXeLoPoHkDlUlrZN1wQA/55xv9buwnyOcKzk2Am85Ph6dES1AAuOeP3WDC6Lz0EH0
	yGmt07vxoDpqe486dDPEL2LUWBazMSrmUYm2T1DAJi2eNAQgc3Uy1EIzuDKeTzdaM0EKgMiJtU/IC
	7fgeS2Zhx5uH2fbB04RPJEJJomh6ws27nHsvTBX81g9jwQzCA45D3NX5p3ol3kgnPACg03JZpbpv7
	C2yqJKdPDxE+eCF9L+3qrWN/sNliQaev/ykTf9gB8i8r0XQYRkMRMT24bw9qAWlv73XUlimx/XxIH
	TefjltvA==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uJ72w-00000001ZxB-41D6
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:49:33 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-742c9563fd9so783534b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162968; x=1748767768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Te183q+oK/UUiJXJqywViKcAzUsX+o6NlP4bjtzs3DM=;
        b=DoN5j+me+9Z7m4KiqwGeKfUUxpGv2MpmDKPZbyD53FZUx9ISFkEq6g+DV1UbJ9hCFm
         74oJqyad/XZkeq3j0rg+7YhrTXvsNuxCeeNmI88yGOv+li40vfcgU9pUVuS9tsIB2tuR
         f4xM1wEc5fHHJH9MuY8/Y5DBmUXs6oMB88u+A2gXAIIX07FzjSN3P2iKv/wJhWGNvn6n
         Kb185Nqv09x3ckkjDTMCTsKsmqYr0F/aYo9JVH/Gbaq5/5VWdMT2oDJJkmlqwrvQa4WT
         7IO5Yk8Y6rvt9aVGG6pV32LKvsE5WSKGTSh+vq0K2vyppVhGbIUDl6v28MoMSLCzi60x
         Pi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162968; x=1748767768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Te183q+oK/UUiJXJqywViKcAzUsX+o6NlP4bjtzs3DM=;
        b=W3Em1EsdwXfJ5vUmmF8ghhTnReLn73XGBdwQrZFqbq72cuy5fzIg3Fh+xFzmEeCvjo
         bPsByQtxZF3FSglqva3RkIRHI5R+cQ0/IcIT4h8ts/ZF8J3STq6kFKmzAa+ZIeNc5cFL
         yk5EQIkUgiIA3cykwPAOkztiCQYjcOhfcm+/GQgiOYT1r9mFma23MO8btpZKQUpg+7Sa
         HiKtQwnzUnHdohMUGOHf9lt+xX336kq5U7YA/J8NYwJdm1po6LT7/nm4SQ8SZsxKLHIu
         YIYINxIGVxGYZq3u6HX2FjlFrj1YBzG83DymvJLOuh6mrYeZ5RKk/IJYiQG0tnqP/S4M
         m59Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+xU9ZEYRG2H1RbmktdKUb5S2BjeWwpyiOIl0FUpP9mTJ9Bz5nvfDmFJYfTXHQEYWsZXcPiIPRLkrNhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMPkDBE/aZ80aEyfOjKktmFVq6u61xEyoDWnmN+SOMQAKw9iz6
	YeGki/pQvTD0HVp8qpeDFrEeljDGDghODJe/P8+560ICosaTOvHcnnJQZfuvkTVixgE=
X-Gm-Gg: ASbGncvFIpwgFMEIr/xqUOj8eFiMbTKcqzbfzJThvPYXOsOnyhLKLoQy88wLFGDzq8V
	982Qf786YoGhc4uRl8u3lXCVIGfGUuamBXkH1pms6Uvey2ivHOTV6fnYcexkWjoAy/fHbnTBIm3
	1Y/MCaKZokxNNXrSfCc/y8hRYa8OankpUSABEJWVKpgYheb1WbhrAKyK4fibkSUTcqlyi4wsevY
	Tl0jUOFrg3PUK6PNMnd1XC5EthoV/QfPnhOexfUP8tetwt03z/A00WgUwgNPUV4mv8rqI5/Ydgu
	Y+p3Kkz+aGJqByKZnyouETI2ASuEqn0R3f4NR8rKwk+UMGAfb+NYLu474O1ZqxGjnSDq3QuOpb8
	cHqnDo4m/
X-Google-Smtp-Source: AGHT+IHvodyfLDw8dU8rN0uEdUKyajUEF59LEZ7NqCCr7saQPd/1HfpNeU3hAKm+Asik2TwpoaM2Sg==
X-Received: by 2002:a05:6a21:3399:b0:216:185c:af0b with SMTP id adf61e73a8af0-2188c3b494amr8573479637.39.1748162968385;
        Sun, 25 May 2025 01:49:28 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:27 -0700 (PDT)
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
Subject: [PATCH v4 15/23] ACPI: property: Add support for cells property
Date: Sun, 25 May 2025 14:17:02 +0530
Message-ID: <20250525084710.1665648-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_094931_548763_F7FE27EE 
X-CRM114-Status: GOOD (  17.97  )
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
fwnode_property_get_reference_args() is called. ACPI always expects
the number of arguments to be passed. However, the above mentioned
call being a common interface for OF and ACPI, it is better to have
single calling convention which works for both. Hence, add support
for cells property on the reference device to get the number of
arguments dynamically.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/property.c | 22 ++++++++++++++++++++++
 drivers/base/property.c |  2 +-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index d4863746fb11..c9c3d6920326 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -882,6 +882,20 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
 	return &dn->fwnode;
 }
 
+static unsigned int acpi_fwnode_get_args_count(const struct acpi_device *device,
+					       const char *nargs_prop)
+{
+	const union acpi_object *obj;
+
+	if (!nargs_prop)
+		return 0;
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
@@ -960,6 +974,9 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!device)
 				return -EINVAL;
 
+			if (nargs_prop)
+				args_count = acpi_fwnode_get_args_count(device, nargs_prop);
+
 			element++;
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
@@ -978,6 +995,11 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!ref_fwnode)
 				return -EINVAL;
 
+			if (nargs_prop) {
+				device = to_acpi_device_node(ref_fwnode);
+				args_count = acpi_fwnode_get_args_count(device, nargs_prop);
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
