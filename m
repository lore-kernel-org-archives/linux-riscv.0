Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E24CC7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrnKkvELy1VlLWePoRj1wz273AWPoeqWexesuw21l6o=; b=CkREZIhTcT4J5G
	6lJ4eKg8CgXBSiiKgGg0vvccCHasyHn0kjvPiedXiAKf/35lExTUv3zZEkOux3KZFco9MS5juZz82
	Yh+nNHQEoqCIKO8Kws04uJ40Ed1cxr3XO8KrqMY6gYQ8nh/4mpBRBHHNKK5NE4Z4qYW2QJxip1rkw
	BAa5xd6zd7pwmZ142HYJknDMe9RBhzLKs6ql55Hv2tGGn+cHrFz33SV4ZYNEVEwRgtst8Bv6gzcX9
	NiAqejtiJKbnSqQZTb0jlahUHb6ePaVKmWEBKKy+9yVEMC2xqBdjQpJey+OnCpkNqK2YQk4MMrQDk
	YyGMAiyQCQGq4/4JLcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsqg-0000000AIf4-0uLF;
	Wed, 18 Jun 2025 13:29:06 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRriK-0000000A5Zj-3m2f
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:16:26 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b3192eab3c9so5052511a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248984; x=1750853784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBceoBehx8BvgZH4kIrIZIQMdJgc3OIIxRIhQIQqZsc=;
        b=CWXLQ7qhOF/wHB7XtgLW4newyAHVLyrwHwDV+B3pxY5c5jTOO6kZT8ZZkfzGFI7qAQ
         2iVm2zvZ6zy7miLTRtGnjOhB8Th6ICJMeLjr2shG1n18GULYinMA8tdi8S9IHTf/Um+l
         NmxCLiq1YP1Yoemof/XxoY/1FK2rDTMxbiko69ruLgUH6GD07479tF052aH+WJD2RJ19
         C3xx3kFLKVW3v/VVYG8iNl+LKDGOkwH8iO1ZkYuqD4rxEqsaHHpUQKm2qbgSok/9SkNc
         yStiggPEFbAa+Ito2njcjFKjypSkGAZNeb5FsBsJCf1OyMfQamkLpPKMO4xmVDNK6cRO
         mxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248984; x=1750853784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBceoBehx8BvgZH4kIrIZIQMdJgc3OIIxRIhQIQqZsc=;
        b=rF/8GLLAa1/1nRlKBqcnfltUcD+JoC5kAJxsSGLO/M2ggFEdhqU4yK2Ar/Lcqwi18l
         acpPUz0biEDgwQ3ZLCdbo8wiOQBfXcOXPSsHpeIBbM0cSequSt6Z7kPC/pD7Do6RtMS2
         g//YD8vtBJ9B0OFmMDSz6yP9zkF+djYyNWfjVAfIgu2u5/9WxzTXccwPCOvOZF2W9+r4
         d87ohAVrwSmgN0YsK+XTTN30ghEbvkjGAYGlqHKvCqL795elKGe7z5MjvnxFn9nbFPgd
         17QlhHGZMieHtNbgHkI44DSFg6YEyVmoHzqzLDqAhOxdCFCbkhTgvGAYGjfANbJuiz1g
         KlEw==
X-Forwarded-Encrypted: i=1; AJvYcCU+s8KwQmZ120AmwrenQn2bqPniG/f/9ptGU7PSwZuXk78jPZAdc3C3Bg2r9qNVOTfgwlnJAh+PGelbQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEtF2XjT8Ni09ZRedy591hj2FtDaEFedrf/MBC98jYH/Lj4XHT
	CWIGDV/7dQIJQQQJUKsLVSzTFuAbh77KW+Ahe6Oq6pb3Sh2vPhyegT+j9ZKWvqfGSxQ=
X-Gm-Gg: ASbGncstLg6+8xmfqbRovc9GI9rQSHk+dmZ2mfgSZOkwxWoluIjk+vKWNZEniWbTtbK
	+Qnj5PiBlCBHZKWqTRcT2gBUFLnkOzv6j9OmcxZruQr5r4qSSmIuYnTz/OpH62/oZjABvWM4Pk9
	52fsB3OBw3eC5I9BjyZcIx6jOQ+Jncrqp0oE4N0O3mv6Km+I9SvBAaHhB2cQEctVaByeJdV7YTk
	yUJaPPNXnVyGovJVlDUb5YEIuDDsUWDAAUkI2KSCd4LH8rAAIyu/xO2isPtF8KitAKybzsL6vxd
	sBl5167DwemUSStDVJ2bKojvffALvuJf7CXvgwcbceQjva7kn9Ti8ewa2BvKGCfjzuYCm8i/GGT
	2ZWnNNrRklghvQO/Qyw==
X-Google-Smtp-Source: AGHT+IFC5oonHbqa+1WgrcguufpT3Zth20l/25Hqy8auGK0Yi1uMoUCsHOZcemPZLHn8HliZdK3kyQ==
X-Received: by 2002:a05:6a21:4d8c:b0:1f5:8b9b:ab54 with SMTP id adf61e73a8af0-21fbd556dc5mr26732280637.23.1750248983978;
        Wed, 18 Jun 2025 05:16:23 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:23 -0700 (PDT)
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
Subject: [PATCH v6 15/23] ACPI: scan: Update honor list for RPMI System MSI
Date: Wed, 18 Jun 2025 17:43:50 +0530
Message-ID: <20250618121358.503781-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051624_939070_AEB79B34 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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

Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
