Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3709C54ED0
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jm7lllvfi5nMG7bua4GK3cKOPgoh6tlRSuA/+Ap9pQ8=; b=fBejBlNNfHFIHr
	yXRHpwP5WAe2pZfe6k7XgcTFwx6OFbPQaaMdbB5xqiyburQxvxk0OhA1/pbzktKREt812bgaLp+aO
	X2DF16arcJgxVmRGYyEYsZaXoasBaC2Yb/g9QblXev8Er56SKPqkC3e53w6BpdPTlEqIuv1icpWFR
	HTPb5MBJjzCEoTlV/Qs85mS14qW8JH6743BqATNUv+GLNxKjol7EXaOaQRby3i4iCHOKw/fHwtr0j
	VCM6DHifdGm9AcZmivyaf+pNu6+rhmnNJSK2NDLCaGvtoQIZSopvjTebSdfxE5eZJeEwzX0H2/MM8
	yJsYbr/ysgX/+30S7KsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ74v-00000006nin-3Qa8;
	Sun, 25 May 2025 08:51:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ73v-00000006nTY-2NHS
	for linux-riscv@bombadil.infradead.org;
	Sun, 25 May 2025 08:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=; b=HQBYyMNMPFj3W13Gne70RiOmIi
	Gcy7N/gv3e0rzYqdDOKubG7gfxHoN58yo+ql8KvfwOerr7wwGN2AZX6nuKKJr51k/IwmWXTNssTye
	I3iMLonqPMtbFwVBR7ddzToSsTI2WOA0WBmKtcZg+NNd0iw+8fL/3NlwVLXhstiaY2DJbjlR6Eb3k
	XE5CMi78LJWxrbDapS8L3g6P+N2xWC1nKSK9mB9u7utYioMIEgTaVQpm5bqM5M9+3/piQBkxg+eGh
	I+AivlxUWhgeuSLxhBxEDQHHX5S+oDnekFV0Uddan9zK7x/KAZF0utW+IfZIPYgcwlkYiZpxTcFcV
	wiT2d/eg==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uJ736-00000001Zxq-1jsF
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:50:28 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-742c27df0daso894712b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162977; x=1748767777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=cm1R4HcGw3TyOf+NTLT8hvoDt7OsMwPs5PxCMJIJrmwUPhDWaI3TM1tmKW6ofMcOWb
         QOHl+kjsdEkgcgeJebvig+C9fyxUYlUyU80XmHBchxl3Ffvvjm9J1l+lwkD7tj5QAkz+
         ydKUOcn0n5pjTq7296BQTS3vCxj3S4JIewfllKM1OVghpHpHPVquKWyQ0epwP5k2S32z
         sFp7EUpWG7xOCEe7d1a/HjdF3aS1J8WRTB4Bjpt3YdYFYLMsAPHg8Sj8KPIrLWJxS1bK
         abqnpzzMe9GqicQiZ48ayCi8DUr/JONdvyutsFEg1SH9da7AydQTy0sNu05/FkxEfae1
         1KkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162977; x=1748767777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXNxvUrDvrPEDXD7o9bAHtY/zIDAmgnS5reR+x10ajU=;
        b=s4//gido1GeWWjQQUzyFV2WEjpmaizEg/8VhvogdhJ7mfRuGBWyFEQVvq/h/CnZ2je
         lbEBIt6AbdQwwu2Vql3wXKmHeY4uZ7+p3uaPwLK5mUXsW11KWjYtNczPPtctMgmCqAlv
         OpAqhCfNcmdndZnNt6ZgbblfO5RT1HQ+OONW8xQT7Fc6VZZgWstT5O6g74ZcvUoXa1+U
         VtMFYVtoSfY4bjzLZeacSSQBwGd4OSNwhE/Z1vzjuGKznTor6NcgL9FBm6DDUCa6/R9R
         UWnWK7fqCQX6/ngcqpxcuq6tZvTIT/RkaCGLDb+ZL2HjlVkPGp6x1BvjjLFeh3KNg0HI
         HfEA==
X-Forwarded-Encrypted: i=1; AJvYcCUbsbvG2e4U9Y7mi5oXbLIIZOkiu0yo8g6TCty7iJHf06ULBU8ebbOpkSTUfAv97EhofSrr2FEiSXiKcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwC3hlOp4hM6ufEG9LHvj/DxNyPuEV+g/xyrPiTZA0gyJp/+CYB
	2mHkdOYL5MqmjwmOrRdiKcEsHIhg5jdqkpMPlC1e8fLDfL0/MdCG3qUSvnmTJz2vSgQ=
X-Gm-Gg: ASbGncvgCiuuJzcrHa8A7FkVQbBFt1djkK+9VfzP2GAVkt8AYtbg6MXmMb/w9E2kkMZ
	O5v59GfQ9VtsIZOinAmQ225JPFYJAR7v32b/X+Mh11wrXIC1VNX7ODNpI68WIO9LtyA5L+GFV1v
	aukCbXpSgaKcZ7iz7zdgsPmhT3cHzEg5/OqZ6VCR4EaoNhJ/yo333zReiR7WeZoASYDiIwvFJsv
	fHVhD/1WP2XPcoCh/HMT+4dtmdPHYxNjXnzeW2W1K06NsHIy2E6Na5rDaQOVouLbhEcxhEDAXK7
	Bkaq0xXcDZremWPeO84KrUZy+5IVfHmQGMj1nOZ90MsH5/6xE4oZro1c5bFJVUr8A3q2j+dst2b
	9KWweJmiN
X-Google-Smtp-Source: AGHT+IEMtmYq1fIqRMzhXzdfqRTh3cIPR7oyaCz2qQz6tIkocykg6S0/hjESUlPztU71trdqlLiVMQ==
X-Received: by 2002:a05:6a21:600c:b0:1f5:619a:7f4c with SMTP id adf61e73a8af0-2188c329374mr9918942637.29.1748162976641;
        Sun, 25 May 2025 01:49:36 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:36 -0700 (PDT)
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
Subject: [PATCH v4 16/23] ACPI: scan: Update honor list for RPMI System MSI
Date: Sun, 25 May 2025 14:17:03 +0530
Message-ID: <20250525084710.1665648-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_094942_713137_7F34C5F4 
X-CRM114-Status: GOOD (  10.95  )
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
