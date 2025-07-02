Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE55C83013
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 06:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpOBTHZjHMT5e3JaiPjdgimttRug4OQn92MCAspwfhQ=; b=bGSeqmz8SQu3wg
	sbFcntkVcwkfGcAXDHNLlWwzExIPybgic45a5gECRwKQUb02EYX0j/AJ9Q5GRciZdW9Dd76vWrbG2
	KzR/TdhzDe4PvoicXtpAJwjDIISQo7OPAzs0lP3XycyFrpB7fwTezGb47oNh3LIU0defQ5ArOpfUr
	7vQs9/6oQXBYaINfzLeQ54Wn/X+PC7ycxPMTqjQZqyJXzZJPxrjGAO9SQYeZD3L3QW3W+z9rpbAtl
	udyOic8f7xuzm8HrBNuMNEZrI3jtv1cr6AuVyZ+rI9SD54qhGuz5P1boVpi6X60Lt2MGrxNpVun9Q
	kmdeDWW00eCfHIMNtC/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWr4k-00000007PlY-1UEo;
	Wed, 02 Jul 2025 06:36:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWppm-00000007GMQ-3OXE
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:16:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-234fcadde3eso52628165ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433398; x=1752038198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=mtJG1sTHByMVOrZ05Zp3wABnownYG2OODXc37MNsZnCfiK0nQSqOuTRhzoZoymmINS
         AUhl2xn1nGFejNnrIKurgjtVjSuqSKMWRyKeKf6QatQblh7nccf+8FwS4JEIDHXiSjju
         wrNRveLEqBn1C734Xgeqe+T6+2GWz/8QOffGbZZbc/zedjvhhVkufRqyuwkz2SdoZgHw
         CcPJQFKxW5xLRfFtUYbIvZ0u9/VUGmoMaGuMmV/6cZjqqhuZpOA1It2B50X2PJdBuiGU
         pxkZvHjBXmLmqMg3tlveqLmqvRZwU//Xb9MQpfyc86PsDg9ZLBDcK3TgKC+9RzK+59Pt
         R8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433398; x=1752038198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFaQ5Zs1hbK8MQOtKnNrpZ/cBeXTMcFHCuSD6j9WtSo=;
        b=cyzf1LzBa5PeUZhid3bAobkgPJVFdnATn+Kq9dMuaRjdNOAou8Ac27mRSyu1j5uDjG
         2nH/yLhNXwaKebMyayjllFy9LIBmelfuOr1rlyzfrW5J4u58DIpLHapMGlXkPzkm15iW
         1volY3dQg8ex8LDVMYiIMq0pKi+TXIvW6McvpL9d0lX0upMc65U3Z5nYMPLavSPq7YCh
         xc7ykosjkNvR89ew2XvxehuZtQujq8FwUosknmSNBVHTZStCesxlCJR6AzWoExk93cml
         kgeqbMMSpBXT/v2pkWpz9u/7EO18FbmJsSg0u5YwSAyg9wySlDfqtNnf0OrPxR4Cd330
         guTw==
X-Forwarded-Encrypted: i=1; AJvYcCWcjtzZldB0jTRaRZM36cO6UYPz352mXsA0a5UNbJcKPSWAKusD4l67+sIPTe44HOlwwDzkiyKAvymWgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Mu1FD8wJqqPO+q+msXVqzcNnCUT/nFKjaALpS+qP0ImLT+tD
	q7x2TiTIIRYmDBysJmQDi3MnI0jRSksAdxwRS46xBcud2j+SAng7dzXF15RvyOFkLr0=
X-Gm-Gg: ASbGncvKOIDrlyjuDr9Rj7Fu68xKggpZa9/S8Ckr1B9rS0FZbcC6VOKBHSz0a6UGVFI
	JXDzGExqZVPx9rXDkzMWP+HLl2WzyHz0OcCoNpsTu+I+93O0jARIq6O6a1NmQ9lFXLWbqqxTxp6
	7cmEdHs9aHstAHdSL+YID7jIgJcYemFbArGTbWbM0hUoN+d5PwinYNtiWwGFqlkYSiBSZLvNHWs
	mgvveC7zDXQURfEkK5wwAjmdKiQYZ9xQywMkv54sqkeCrZV3NYAp2pVxZeYIkGfVa2JcD6Q6Oz1
	NyxwYfKVFxs/IusYN3oXIxPi6jqwH+8DBijGmVGd0FTW2mOmu0mFvQU7fTjWlJUUcQ9XcAKedf3
	1t4eShR9BngqzbgW4
X-Google-Smtp-Source: AGHT+IENCvcAnrrecQXBt5V9LFuZ+rQKh4OUv2G9tNtl1lHXMhnri6Hzogn+Hw60JHYcRZ/blVSc/g==
X-Received: by 2002:a17:903:4b0c:b0:234:c549:da10 with SMTP id d9443c01a7336-23c6e5d6335mr17948045ad.47.1751433398116;
        Tue, 01 Jul 2025 22:16:38 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:37 -0700 (PDT)
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
Subject: [PATCH v7 20/24] irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
Date: Wed,  2 Jul 2025 10:43:41 +0530
Message-ID: <20250702051345.1460497-21-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221638_846935_8F0EAE53 
X-CRM114-Status: GOOD (  11.99  )
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

ACPI based loadable drivers which need MSIs will also need
imsic_acpi_get_fwnode() to update the device MSI domain so
export this function.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
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
