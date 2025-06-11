Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDABC61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 07:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8+oyovC79csvJECx5Ty50fx8H1vMxlU0NjDRYjAPM0=; b=t+4zA967mqcn8o
	c6ayXmYD6AQqEP8+ECQp7KHqRew91XA5rBisk/3jUcdtd+ln+v25Cb6IvZ9vFYoeQ3v/Xuf18tZcw
	AFw0hlH9xVcjpLmQ5/C05tNB8wFSfrfdhzbghn7B1A4JhRdbg4M9/aTvmp/pAIfzJCj0sKQNNbm3j
	JNqMrA81kEMXNFWmr+WSyCsXWUAqaDoV35rIkDUFpxurMtO/BM0ztRnXsJmaHAn+C4k6LSXGS6fRv
	d8OtaKh7Vtzl56+N9VbGE3+bd0Gh02fQZbVmEORlxm3N4XxEvMSwcv5hqDmfdM0c5X8QQnBCv5D9u
	Q+eVQRUX091C/CiGp/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG35-00000009807-3jur;
	Wed, 11 Jun 2025 07:39:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEuA-00000008zmW-0Uga
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 06:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=d7mx0GUiR5U+ns4+v9sHac9w9AvSdl9HF8/h3RrjQkc=; b=BTc09IKQL1dTSzM6IZPjA8eeoE
	4gmK8OVwC1oepjr2LDlBXEedZCiKZN5XSbKce4w4Pmh5J/mQY4Y7zR3y5TXp9+QZpNSt6NEMlj5B+
	DD0Qpm5rn0KvHpNN85BauMzuc1n1DSCJ64/NTR6eLqKEsv/3DzNoHNUsdJeuV0uljmJOFjXhOQpwI
	IqOjBs8bzOFI2RWQIyqflp5VcT4Z1VcNMEO3cXAv1CDKx7TmaAQr6y8j1R10rhJLU8oG9hP0JDDOb
	GCNCPZ8vy+mEy1oqLNoKZL08SvGcJW8N/B3W8phaukRTze8gkSyIjX5uejjKdn9FBdjKuLz2LaeOi
	wkKkVE3A==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEu8-000000028N7-0jvP
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:25:45 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-235f9e87f78so57738165ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623142; x=1750227942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7mx0GUiR5U+ns4+v9sHac9w9AvSdl9HF8/h3RrjQkc=;
        b=nX4+3nD78PW0Wy8x21yRqIVX+2wvNqI7NRvqZatqhBAvf4RUJ7fIVuEMSzLrHUHYEj
         Lm8pYxOWHtx4mhGH6Xfi4mw4EMaWZxv6HFYSKIyKJM9nHMakNPBUWAPvoXQzdYW1w7mi
         yieLu5nSMzi4kFBuBzxZlIhIsLzwVwSR7fP7bs9UDqzljp5dAC8jZD/bodyfMMdMSQia
         D7kRVjgVr1d+7yiVsIwNj2C0pAZYQle4rwOY7qhRwEhWIBxHo2IaokJRHFWPp8ePNWJ5
         otKZPxofIEK10urt1PVqobvY3d0eMJNJEbJnD6qh3Z0iDZGMcHhpjyBmMEwuhSgZg0Nv
         sGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623142; x=1750227942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7mx0GUiR5U+ns4+v9sHac9w9AvSdl9HF8/h3RrjQkc=;
        b=oQqeB8DTCBsueQm/A8Hj5e6i84n9/ZCVhuBxMWi+bLR3e6+3asSvPUpXxMADFdHJ3X
         D8RsizZxIFJb6t8NxZvg/pK7o7n34nW+5X7oBxvnOkPFHy1eyDlpSDn6SRSIvUr/Bzme
         2BBIqzSYdcjUzHrMDq9uw4DbsqwPCnby1f7GHF78V+S6NpauIQWI3URcULA2Aq6XL7FS
         p6VtzENl+ayqLbiZijLNpaa+IQg8pMpvkpQRvjrTa409hsTmeO4Q+/9P/0kFm5q0Bmok
         bHWkZXKDb+cFO7WqlZSD2gmAEfgVOkzl+mSi+ZPPFKSdFRH1Ghx+N3R62362SF9QlcPE
         s6PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzY8ruTEcIYwfpBHSdpanfkBs0/17f9L4EbWGXCORCco+hK0Lxh57Q9hJfWZgq4xaendrRrpSOpC2R0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzj3o8bU9DLlw2HU1Pra4vlxqp1+wjBZCyMLvzeIHag8ikAwMz
	a5R+GaGeW31Mlra4g7aHC87eUmPvYw6gfyZqW8aKhjxCnxy/gERa3yFhDPIwbPKh8zo=
X-Gm-Gg: ASbGncsbXAkeX7z2XD72AztMUIf+vWcmrXEQYSZjE/+w3eYrbkVK7oVb3ThefCKtCCb
	ujxreV4TXpLUSxQ0JZBAMq+sRGofoLzFTCO3ODLXnxNXjBT8hf6zXqWfpcDW4D9qow7SIcOEHNq
	Jr4AZMJxSJwE9CKYRH4y7ZpFceBYvxmxKZuHrJg8AgNaff7kmeFfHEg2SRpw4H/FjHXTvPw1UlY
	apVr4ms1Y8Gs3REb95JQyhSE/1i4jgDQqHTNkxNoAl4qcIMA6fjXcS78ivvtXSt6yutvz5gT/9q
	3ZFoSKux0c740+hvXG3aWkewjnbtVFGRdrz5I/lIU2jmQbUqsh6Q+hkKLCqVSCzGCOqvckola87
	IFNYdYA+yAcjbUtgTEbAOPTk1VSXDVLpm5/LY
X-Google-Smtp-Source: AGHT+IEfcy/atZIXks3ZUrd+ueaz0kGJBeRvccpphWnGgi4UbEP5A+4LOl8ZEzl2YZ+s8KI4mCAfHA==
X-Received: by 2002:a17:903:144f:b0:235:eb8b:9968 with SMTP id d9443c01a7336-236426b4f43mr22663805ad.36.1749623141716;
        Tue, 10 Jun 2025 23:25:41 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:41 -0700 (PDT)
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
Subject: [PATCH v5 19/23] irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
Date: Wed, 11 Jun 2025 11:52:34 +0530
Message-ID: <20250611062238.636753-20-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_072544_283842_1389EF59 
X-CRM114-Status: GOOD (  10.37  )
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

ACPI based loadable drivers which need MSIs will also need
imsic_acpi_get_fwnode() to update the device MSI domain so
export this function.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index d9ae87808651..1dbc41d7fe80 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "riscv-imsic: " fmt
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -215,6 +216,7 @@ struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
 {
 	return imsic_acpi_fwnode;
 }
+EXPORT_SYMBOL_GPL(imsic_acpi_get_fwnode);
 
 static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
 					const unsigned long end)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
