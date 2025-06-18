Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DC5C7115B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQH5qoCx4IbBbCZLFGVNxxhLDYFw0YZX+zAqRCn/ghQ=; b=z3+HlV0QLixpaI
	zncxxjf2YcccJWptTf7Px/thJDGnoyl9Gaw9xCWaWeq3HMAIV++ANzXHlu8AZr0tPQH8d57x+9B+h
	PAc1Nx81aVrWV2r8URxauZM6ZRjApmTE4Libz8zQXhRCqr1WsTmJ7IfJyXH8LM8PVQ9gMH7np0iF8
	ZYPQSl2ZBlwIUwF5vzU0rnOYFU+fr3NZJTBwUFgeeyzq5QOpvsacpSB/5x8VeGULlIFDui9RjOrOZ
	M+YFz2yYS3NrR+NHFcFU6JQf3P0+Mi4Dudm3Vl70AbX0RbOVx1XymDqxxpPxrNWhZ166FE/PjKLs1
	W8SBMB3qBGHWTDirrRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsqf-0000000AIdi-1HHa;
	Wed, 18 Jun 2025 13:29:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRriG-0000000A5Yd-0Oel
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iK7PqVF4zZIJUvApimJUz6BsykWi/7ZoxPUCnW7EQA0=; b=i9QEmrAkkCwA5//zKnkYhaIGFS
	2CURnsNgycqrMGbFs+CQNROCM88H6nk7RvFmbsWdS53M9cO/TKkuLBqeUMGR5RlIMeWpsWHngM0k8
	3awW2qyELTW+fW3J84GWcjjR3F2Tb58upUzYhnsiOdmI4sycKMO8AQn+LWpVMMkPEKPnoPDiyyiCl
	wOs8AdfP6h4523+Qk9n7h1Xl75D0t+4z8N9K5jYqKLyRlo5vt9bM3PMYQu3z/rEFa76Jw4+fOi06M
	r02xSAsCIiJ83VTsBGQ2Vg4XKFJUWNEtLHWw3aeQ/rDS1sfzisDQZW0izUjr8gT7U2H+wcvMVyl1A
	4DkBh2aA==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRriD-000000041j2-359Y
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:16:19 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so585297b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248975; x=1750853775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iK7PqVF4zZIJUvApimJUz6BsykWi/7ZoxPUCnW7EQA0=;
        b=imVlXUSevOwC+pzysXLEQE91ZbNXoNSeyWpoLX/DikVkvqCMKWFmhu9G+1JzdB/j8t
         sdhb2PZjusPlkRmo7HEL8ZoHcdroltA9kHMiQJEY2h/js03d5HcQHgox9dL7Q9PC0dNR
         WtTOXhGt/A7I6qIYwtH6EqYSLRBF0ygA3lugz92Q2Vz//tMEjcIw22Asejml3SVTCPVA
         4sn3iu8W0nj9/WbsS5vpxXVJCl5IUjJYCdEjx/QCazycIGHdrKsHht6a5pd1pOPdCabJ
         KkbOaQTxUvN37KfqEhwveFmidDBc3uaPXib7P2vFYsxcvRSVp1wIzpL+UmbXF5efwTBA
         wpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248975; x=1750853775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iK7PqVF4zZIJUvApimJUz6BsykWi/7ZoxPUCnW7EQA0=;
        b=gFDTIcKdiiBh+7/hX7VN5GO4cH/dzZ0BLxG+cmGxVcV+zKROqgDaD88E8TbY8m/kpi
         oGfiR2a5thJ3ntNrHlgWGhkOrNQtxqe3f6MO8NBAXwBkGNunUvzey4y7g96fjAWmqI+e
         AgVOlW1z8/lPI+C+2rBH3aMS+wJkzHdIaX25Orf7J2BUPfVbe03e5BjuJp8+OIt6bxy4
         cqneSfYG/xE9gabnYI32BKrbShqwP0wRgzhqCySiyw9PaiyMs/sNGfe7RN0FRSy0MkMo
         y8j0QBWdGIHcEISHyC9r+VMBv3JX1iomT97AGKWvETYQjfLnL3c6q6gv+60dIb7v+FKM
         62pg==
X-Forwarded-Encrypted: i=1; AJvYcCUC+VLFq+hHltNgub/oQnC5b94wQyMDAKDGZtIy3SG4pQysHCmti+qANfpFA5+XdvBhMqcy4FYhEcOYVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2Clucw6owTL0iFRYHg9FzwnvLClClEwNFzKSR+awgJC1PBci3
	aJKchdOEslzfkO0reAY4TZ43vIENY51UYYBu+d4W0WeQNk5d8dDAcqUTV6tPCJMCLDg=
X-Gm-Gg: ASbGncuVN1iuG5yZHQhj4L/+meuLsv9itm8bOzk9AWunKlsEXZp3xox6p5q2ZsYk9bg
	JHSVBVQAk727ra/uWwcwe2Q9PF6XaVAlSdry+ChVd5Fr7vh0Pfp8H+Zha0JEpQq8Jls9vW5hAQy
	918zhVsi7xXe7KcDVzf0D3BORGW0Lc/OVdhF6A0arFpRWC/um3+Ajv+oR1ufR5quneqnDgayeiR
	fRkEDLuSUWBSRd3cSHTcWiqJPiZw9Aj0K54Gaa+LqNJ0Y6sCblWw1xP6L825INML8301sPuHMOb
	WCFDO+jVms1V4RGi5cn7Fr4gMcZE+oeqvgxDA8cxlrttRDBHqvX1TrqAmqtGTaWBbiN77s96/sc
	cjZWacjh+TdIy+goHetPMLQNJpWY1
X-Google-Smtp-Source: AGHT+IHGxdihft+ht1cVZVd1c6PNThCfkYZyuhsm/u3nH0+E43W34IXdgzMXTGbhOuFGPUkF42AqtQ==
X-Received: by 2002:a05:6a00:7189:b0:742:ccf9:317a with SMTP id d2e1a72fcca58-748e7030b72mr2344031b3a.12.1750248974760;
        Wed, 18 Jun 2025 05:16:14 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:14 -0700 (PDT)
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
Subject: [PATCH v6 14/23] ACPI: property: Add support for cells property
Date: Wed, 18 Jun 2025 17:43:49 +0530
Message-ID: <20250618121358.503781-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_131618_051769_06C14AE9 
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
