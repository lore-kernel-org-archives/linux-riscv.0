Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F3DC61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jm7lllvfi5nMG7bua4GK3cKOPgoh6tlRSuA/+Ap9pQ8=; b=SoaabQJ0YZCe4v
	tDzqmEq9aBKRnIQAiLngKuY4A9h5e3Bj3tRa2JHWnLEA2ygG+mLGiFHjOKT5OAv4y4HOuXjM1I3UU
	XWI5e48+n0YvBj2JCYhJ30UQPfKJ4PV+auK73C5H9uaN3C1eS3I+bOMREqKD59Ep5mQ5f4m/3ZRJ2
	gWWqlIau5qIiF1OEf9SkcnUL7NRKz1WPYF+y4X+Z/8wwPivXH334MTfFfykrEksBKDjTq5784zjqU
	W/11an4c/LdIVU6XAqUNcDnPJZzxCKET8Neyfxihb9jTXO3sQ7HJBwQa6Y6QtGt7J7NCrnTjezShI
	piPjbeaaejPOpmMJTR4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEtZ-00000008zbJ-032q;
	Wed, 11 Jun 2025 06:25:09 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEtW-00000008zac-3tDY
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:25:08 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-235ef62066eso78367595ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623106; x=1750227906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=l+UJm5idagiQ/8f+c3+lVdUY8pNcltJ/hIU6LM/IP9cV+5EwULvjFNT41OVHpM3yK3
         rWTmxaWbwKfpAN8zAACmxdVBGHh/ZJy7pZ+u3Pc7iG2ld8Pu9iJ1PdIfZcLesV83qzDu
         8gq5eg0oRGenejgqBpsHqDYyQd+G+tAKbJTxhg88mXpsAbZzcVgkUC8EMeUojtv7aXHX
         C3UyOE5GodSS6Dycv2gJPuP+gi190X1iaFU3C/B2oG+f7wf3Hn2g5ugqRzM9ZJlOnh5u
         e9afHsLQJp62YIDS3TQsPrkMMFsJnVfQfzvWucsVLjV2YhfBrkFLICy3X0QYeOa2I3ut
         CARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623106; x=1750227906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=g/YH5dVu+kkgb9ODUvW2POPPDQZecg2h0UJogCmrtRiQZ/GHapqQmdvTqHCamfCtVf
         uJNsueNb6D+M9fnRW5thZURha9qdoduWqr+VcdmUVsl32CWiseMX6DYlMYRYxqfbRmVT
         7oUxEZoi33JC6WDKF9Hvi9SC7xXxGTEaHgSIAzDnUecZWEpewjTR8NX4nRcHRh/a1VPD
         AmB5hm2EARwNdpu6wcNaKk/auW7NcrsLLX6N6bBpCqeymeSKyMwT0xMVJq/v4kQ/UwMv
         4aj2pywCVA7sG9DzZ57TRtundq/8fdSlOMbwI0h1L/jZejedvzJK1D0I7tzkB3UDSXoZ
         W5PA==
X-Forwarded-Encrypted: i=1; AJvYcCUVK3XHg+SldLCsJ/bw0UAASI07v9tdefdGb8oSVF0nR6dd0ue+Q6DVRqKoBh2H46Tq2Ebrup0SvwV7Lw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRhTifChELOcAzcuMctmy6fmomV1ks+Yxj3c3JyobkbQDJczZP
	akViZN3p8sRb1mhcVkLziGFR5j2CMNjrxMLAD75TeHYLM5TzCUr0QTAVX2E+hHx4/8U=
X-Gm-Gg: ASbGncsJIB65TTo1zK1r7PD3eKVTFBwVVLwr5j6e4swLn5WmqW193b4KOXZ31Vd++3k
	nh7SddckIzdHVyyxcYEuzye2uwsQQZdO3665psoJ666gZSk5PwCJPLl7p6drfcQJHHqtw0gmZh8
	GAeHqtZVThAM94yUZzWfRDOXxJfVkttoVci3lOUC7nozLabiNosrADyOHWIrtcmI613/G0oGA7E
	md/zC/yyYiJK0BLRwZ4SHuKCUSLuupAhVpumxmt8ao/Q3PFZtPAb2C5qNsguhzm/oski19ss9Gd
	at4O4AfNtVhF2Jur6PUK4gdzMRPblQ/1VEvnpAN/qiR9JCsqn/uk03RxOkOAyAsq4kMJDiZEZF+
	Wg9nXFYn+rkRgVZL/l6HRRXPWUDorzBV3MLW1
X-Google-Smtp-Source: AGHT+IE0UM/d4M+csfHbg0ruhjIIecTEOfGpEWCQ4NLi3fmPp3zu1MWGy4f0Hx7tOO8mYCGU/KKuFg==
X-Received: by 2002:a17:902:bc46:b0:235:f4e3:9cb0 with SMTP id d9443c01a7336-23641aa239dmr20067885ad.9.1749623106244;
        Tue, 10 Jun 2025 23:25:06 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:05 -0700 (PDT)
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
Subject: [PATCH v5 15/23] ACPI: scan: Update honor list for RPMI System MSI
Date: Wed, 11 Jun 2025 11:52:30 +0530
Message-ID: <20250611062238.636753-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_232506_969853_A8A9F047 
X-CRM114-Status: GOOD (  10.54  )
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

The RPMI System MSI interrupt controller (just like PLIC and APLIC)
needs to probed prior to devices like GED which use interrupts provided
by it. Also, it has dependency on the SBI MPXY mailbox device.

Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
list so that those dependencies are handled.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..54181b03b345 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -858,6 +858,8 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
 	"RSCV0001", /* RISC-V PLIC */
 	"RSCV0002", /* RISC-V APLIC */
+	"RSCV0005", /* RISC-V SBI MPXY MBOX */
+	"RSCV0006", /* RISC-V RPMI SYSMSI */
 	"PNP0C0F",  /* PCI Link Device */
 	NULL
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
