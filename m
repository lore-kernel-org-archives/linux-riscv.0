Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4794EC677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQH5qoCx4IbBbCZLFGVNxxhLDYFw0YZX+zAqRCn/ghQ=; b=jWrj340AKZSKFl
	/qdZj8KaAcyecMwzPI++B1CYnzPZcLoUJ4XSUXg9UBBrQvTdcKGGf8l95SNZPO9keRmY2caAQVWWx
	OtEOE3tW+bktGJ2AXnrOEHHL3cezPtQK8fSeWTdqLy82W+bsZrP4JKfpGkGD0x0FHBUh6m2Qlwq2k
	621GENCBJsrHUlL6bIjAM+FhfE6Ju+xY6HXRrBSCA6NdeWi+HbNIBC/WKP83hT6xMkY2LRKWjyDwY
	CxsFvVgILAXpfdn+2ctDV6ddguYj6xaTMToLpuKLuLcbJPBPZQTKCbDAjjwHpq0bP62OcKuZYRrFx
	OvYdSqN7NPeQjy4v2QkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPI9o-00000009XyU-245y;
	Wed, 11 Jun 2025 09:54:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEtS-00000008zZT-0W1y
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iK7PqVF4zZIJUvApimJUz6BsykWi/7ZoxPUCnW7EQA0=; b=bAHd9XNcJNBm2HBz2XTwaKLapt
	ewPycT1J4/M44+gWMA5nC2Tgynp3dU7aBqdvRZsSJ44JUj+6GZjlxeDfPB04ikXFz/yIQpY4UalXm
	fCcTmtEPFsfocuLJk9tM/DZ1c+jueUkdADcNOqYa1CPvqgaT8EddT8IaiMaTmw+xc9cwDqBd8nylK
	Kdbin4xk//vOzVCxFAPqzzDqtJPkfintVDSuktU3MMCbXtiVzOj4awMcyfbdxfmzgvUAkQKRbLu9V
	J0uGzvRFz+Ex5UE/AGlnbRAVnaeJj4M2ST1zGjWZvzuoF8shA30plDuay0Krkqk5+p8WfomlVP3za
	ff6+Wdfg==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEtQ-000000028Eb-1ODr
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:25:01 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b2f11866376so4204197a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623097; x=1750227897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iK7PqVF4zZIJUvApimJUz6BsykWi/7ZoxPUCnW7EQA0=;
        b=XxkMH3ZL6+E0H20lHGr1uBcJffDmgx8R3qeKgQUuiekF97guBtQTfIWNZ0J8K0uExY
         wERqN4TFMf6T7UBiWw7l4esoP7Lj8pSP33VJH8fNuCj/ilXAhMTOP5nTRHrykT6lAIqJ
         9IIQwzgWDIsl7zb9vgutN8VRp481a2gp31vTbfQ41E07xszZp5VEZMjY0KCujjfJ9vSQ
         SPrF8cJ3mWl29R6TKrjSS6rgmVgTP++mMSYPwuZebGwTCSiB9oPEvDcEOPVZIXT2PiVQ
         R+LMBTbQVdObllSX8qgaeaRK5KPFi00mr9Yk9hg6BHlbJBFe8QcPzRYfx9vjZIZPADQ0
         qBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623097; x=1750227897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iK7PqVF4zZIJUvApimJUz6BsykWi/7ZoxPUCnW7EQA0=;
        b=Hyelfsc+iNoq1MUcsAeE426c3rC753odGcEKrI8sKek+71xF+acJ1RCk6D15VJ9Tjr
         eQY4I4AbJ2vSZHvsL3OtXvkwMkQynhblBMa4+YH6TIrufOjxwyk5OY22KpUmL10hzebN
         ZMAKDlOcxCyGQj41EwHxuOpHuibYq7OZZTP5Sbggu0zwZacWqtYknKY9wVoLzHa6mmya
         IkWEDdJjkl+fAxXS2v2VBDQFiGCsSq4ys5e4mArAq0Iwr6Gpz6VL9NVF+9vZbPn/11jV
         8Aw3NMxhyHTL/Da5IkaMVPJ/I6L4ddeBRYtJKn19zhZH86nUzYbTvss8tzekTkIIzdhb
         kXKw==
X-Forwarded-Encrypted: i=1; AJvYcCUIJI2EgMEkDdVtno6PcmW72R+wzTbWYRIy4RTgQoFjUgUA7qCEvTvv1rHu1CgjYXNKatIQYlx/IthfIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwISN0R7LzLmmFc9Mb02eg2RnDP5AAJgCXUSS35PBTju9cXJ2Be
	h+4xXlhxbpB7Kkuqh9WFS4EBEF0NB4qLgz3a2h22W3iu0gVpxEXkedzyKcrW5mF8CJk=
X-Gm-Gg: ASbGncuCX4JhLUPw8vBYvnepTxb7t/YN8bIwFwdkTiPuySLrp5k09Wca2nDYt2MVm+a
	nS4ZLa3Z0MY2GN/l+NxjL3+0zprOYoTzLD8CtLP/tMzjaQw6cW0UdF6e34yI2ht7WVJCzVZ9Ax3
	Yy5PtnxvYefT15m2jvZoSO3bUmxBljKvU02negtBgVsEd4yWrwJVoy0TLb1ecXbc4hY5ljGhEsC
	MJdkPd+VGULbHC9sWnnxU++zSf4detoqsAd+KL+PC0KzoX36u0kPmtDI6mGGlK15NitRK8KkH8r
	MY3okeeIayMPCMJwTwjrilO5OBfa+yrrx1ursaoAyo9tbO8Vrbw9P/8sxZNrDHuK+11az16FtOK
	OJ+E1HRU1lLM6mMBciThrxkVMCwVMWGSuYd5r
X-Google-Smtp-Source: AGHT+IFO98j1k8g1ruMfGzMTu/XxzcdDJxwpWrw5N+bAJb9t2eF6IOtYLbrNxbahMkEVQkOEVuOivQ==
X-Received: by 2002:a17:90b:3c11:b0:311:fde5:c4be with SMTP id 98e67ed59e1d1-313b20072e3mr2122681a91.35.1749623097312;
        Tue, 10 Jun 2025 23:24:57 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:56 -0700 (PDT)
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
Subject: [PATCH v5 14/23] ACPI: property: Add support for cells property
Date: Wed, 11 Jun 2025 11:52:29 +0530
Message-ID: <20250611062238.636753-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072500_436549_FEC844CF 
X-CRM114-Status: GOOD (  17.74  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
