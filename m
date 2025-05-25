Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFAFC54F30
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrTC4KIBk3fBBaNjqYK6u7O1HlIVyE5chws5hgA30Zs=; b=vkRI35q3bhXoV/
	fSgBLJYHtQ8zVPNTmPKQ3HZz7BAcavZXy9EYQV5N5FAqQ1BfSOtRj04mutj80N9yUurT4yz7+rdV6
	qi/YCy67LjlDbChdXZEGs8YO9yFsBTrQxhg7bdK5VqmZ38/5vN5Uu5N5GsX2squ8aZd3oWQLp9mHM
	mwmlxmoxcugKFaYNc0PdAbPx1fz5S+0Fw9+ooM5gYYEN5Qqb6DodU33fJpLGpJ//SzlD4ZfVN4zRK
	V+YsiMOMOdaW3fbhJb6DY6p9x0Or0oKJgqvBGhKxdg7lDb0LHl3/O+Oq1Y94sN8KLLojFO5JrihMC
	L/ny71oswwdpNuS9F7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ74s-00000006nfq-3ccy;
	Sun, 25 May 2025 08:51:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ73M-00000006nOK-251y
	for linux-riscv@bombadil.infradead.org;
	Sun, 25 May 2025 08:49:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=; b=f+Ik38jaJ33998OtteO6ciO/Fs
	iHjHy7d/hUrN2+uoxOKqyoGpi5W7MdxdtySZKuFy+4rMXj7BXK9cWGztnuAnAyoTDU4wFtlTbfolU
	nKzgo0RNEtFyQeqa+FUxjShH/FQWJhTkmf5Any8NWDLYh59gjCAnz/hTOADp0qzgVVeP5ltgIT8gA
	LfEbX52Ap34Wm8zfHyho6RQXtSGMzFVmBTtt0F49IWBH80MbloaUxrQolwo0LXBGhRgVZdo9tb2lu
	e5AwXpYCDjPSLnkjckXK7g30XMCujPZk+WzsaSpIRtpjJ4z5Xvpiq6y1gPV77XUcEvDVgK0wTz+A6
	E5A6N4rQ==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uJ73D-00000001ZzA-3l0t
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:49:55 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso1321927b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162985; x=1748767785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=;
        b=ZqiRlPmu2uzlMWAh6qazrA2EQzQz1bgmCuEWPsewXlZm6PMAIFf0ghx0i2F9f3L1b/
         xUZpw3/x6rSV0gK9EwKwAm0yTA3eozTCV6Lgnx6v2/i9EfHoKFTOb0LYptqUYTJrv3mI
         rkxtxxxWLlpGWItJ9DBxTJg6Q5SrnrZ8GAF+giPmWIyGxJZWg2mPUfxA6R0SYtxVX+Sa
         JY6Nc96wtvYWAOjMgeV9MctUmp0aYpN6mVixIYRJuEBL8SdJtan1ixj2wyZ742b6LInj
         FpUWMSyj2ZSGJqM7kuFxBGc7z0j1X0UyNjzKgI+mcr/2X5yNYx1IQFfN/2vD0o4DnNfe
         C8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162985; x=1748767785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1ncfjwU8x+M93RwaeMxt+NygYvFIPfXleFyJrSEwNk=;
        b=YKp6i1eNe+C3uPW8t7CuKMwIndFYUv6ZuTXI4yigfDXgGJxOvLwW7uKfCUOPmiPsX5
         /Vw4u7RbkZXh7AqmOEFNOrQbR9zlSnn2epH4+nDQiK0cJGSXcHzkMH5GhnMdKSz6Zv+g
         DDp4XH37XwR7U6aP+OEjfea+L6WH/YviYmCZJ7ZlsFtkKb5beJxcfp13vr6zC+fCTIPV
         Sfd+WOXq72/BrE+WNlM9Mw1NWqi27Vt95qtOTdcFsggWDffj4MSirXn+x3zmiBzMzpYl
         OA/FQpFYy3edWnqYoFuKKCw3BhiTnaeIEaYbJVxYoOasEP2Li1h+nTzVm4SBt/nkMyXK
         5DiA==
X-Forwarded-Encrypted: i=1; AJvYcCXZT7v8kvqVPsoyWiuUnP68xyyV/4JUQ/N4I1GbfytUBNi5S3SWesHPS1UZCy4l4JN+KAjVbeOFxLzmSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZi1/DAXbj83IoFRgbGwSJXHugQcrEgbMz8YEXXybd38I84xnN
	AJe/PeGYTjxHPUVu/hCM6hQdQpHXyYHSRi47WPtTBz9VzoCkNjRZ3SMZ5H1534m2dbM=
X-Gm-Gg: ASbGnct/7dYtH4fRGVX0YHQF2P+Ra0E3wJhqS7hMKZOhMcsB06lewE935wXXyBV7VbW
	fB2+15aF8xZDRsr1/xQnZx/jY2OZpFzH/rlI4IITfX37T0l94GA+RBADCyMTXTtLuy9W1j3SWsw
	/PBPW7dUThPKOkZChOBM8On17VyZStqaRU5kORKnrJM6qL+SowvrrqmuEbFVB7uyT1FlfQodKuk
	nGahNBMY9svTIlCxPHSgYC8l/UNGecvzJx5hexnJ0CZvzb2zYwstmVtLejxwMta6H5WyMyuNvnB
	rHr5TSR54A2CBPzvyXuTwlJuKgFTE96t6Byu11nj758TY4g79t0HLkusineeRb7xy10ZjVkpioj
	M1hBFD2ZWyEs8D89mXqA=
X-Google-Smtp-Source: AGHT+IG9TTZb+OY85zw+H0eNYjGgFyHc981BMuloFhe2PCTtl6RRkSB8ul9TS3wJ36HaA/NGbUjQ+Q==
X-Received: by 2002:a05:6a20:a11c:b0:215:e60b:3bd3 with SMTP id adf61e73a8af0-2188c353194mr9297558637.29.1748162984743;
        Sun, 25 May 2025 01:49:44 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:44 -0700 (PDT)
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
Subject: [PATCH v4 17/23] ACPI: RISC-V: Create interrupt controller list in sorted order
Date: Sun, 25 May 2025 14:17:04 +0530
Message-ID: <20250525084710.1665648-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_094948_369959_3AB0A430 
X-CRM114-Status: GOOD (  13.42  )
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

Currently, the interrupt controller list is created without any order.
Create the list sorted with the GSI base of the interrupt controllers.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cced960c2aef..95b4d7574ce3 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -115,7 +115,7 @@ struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
 static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
 					       u32 id, u32 type)
 {
-	struct riscv_ext_intc_list *ext_intc_element;
+	struct riscv_ext_intc_list *ext_intc_element, *node;
 
 	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
 	if (!ext_intc_element)
@@ -125,7 +125,17 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	ext_intc_element->nr_irqs = nr_irqs;
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
-	list_add_tail(&ext_intc_element->list, &ext_intc_list);
+	if (list_empty(&ext_intc_list)) {
+		list_add(&ext_intc_element->list, &ext_intc_list);
+		return 0;
+	}
+
+	list_for_each_entry(node, &ext_intc_list, list) {
+		if (node->gsi_base < ext_intc_element->gsi_base)
+			break;
+	}
+
+	__list_add(&ext_intc_element->list, node->list.prev, &node->list);
 	return 0;
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
