Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5ACC25B76
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 15:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=laBypQgrBNX25j5KIMI8TsOanWJDTJoCwtevEMxMdLc=; b=cEMIU5w7wFiEd2
	yhFhH88Vr7XH5S3TGaiOQl8NMwuJdwHStrsnrYt72ZwdGvrCcA/BWYAr5+EHGCIhTkPyuD2ffh5XO
	IgATyQhs1w4BjI4SJxVc6VBQYfx/2nHJzGAp4Kom/XoAoetpFcXET5QxO+1tfzZdIdpoYJm6LC95d
	317xGkHNXpBTXy3MzXGcWwxId6CjdMBG6cCzDRVy6hgBPW7lBj4xEifa6VJ87QuZUIIEHKxbIweBT
	9Bk1ONXzuYbDQKGln/M40fq0AlF61EleIRJd7zUhDdfaEAXImDMx0gJ8m8ejhcAZE/EOnkghMTh9g
	MBMU2NZtd/16w5E2ovkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQIj-0000000CpRz-3i5T;
	Sat, 01 Jun 2024 15:05:45 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQIK-0000000Cp2k-2KMa
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 15:05:27 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3748d68b7b8so6699695ab.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jun 2024 08:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717254318; x=1717859118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xln7tORKkifGXhXo2mks++Fmg8FnhH/zBNmrN9CYLQo=;
        b=Bo5Z40wGsqHeZsA0AjWvAXtd3GUyt5Rq8jnU3/+AU6VJnFrP8C5ZU26uVvsSgxku6R
         uvmg1WYUvEBUIASpbeFFFh+TMIKFxHETf2n44ZY1Dc5Nt+fZBBuaoZJmUF9GVV4L4dR5
         pPQrhywUbAiCB5Bun50UU/4FSoqtmdmZ4BMzVwkDm6lsIimdJZAEuOvN6DiX0WtypR5w
         HyFqhUvInpwZswA2Ocv04VzTnkBT4dizvF+0Fq+aLhtcnhiH5eZ6YRHQniRD0wqme98u
         e0N5FpDG7RSOHjWhgnV+0iiHL+SVJvKRchIy8AwIsXajOhqpLtQTfIqqo3r9vlFNcEPN
         PMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254318; x=1717859118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xln7tORKkifGXhXo2mks++Fmg8FnhH/zBNmrN9CYLQo=;
        b=WJI2H/HhqUi2yIm9v2CmFFgT5JgZn6mV3o22tlH4P+YRuYCaymB5SvvRidwDzW3vVn
         tbfF2OhcB1HPbVM76ablhoRQEJosS6aJ40vNhCmb6ShoHvavGbnnMYNGeP3P2MZWyOYg
         Vhg/3kwMt8WZTBLq8hEJGWxSnJowFT8BKURt+w/mCxzkwhO0vk6tR2ptcYl06QNAbHVy
         OTgM5QEwUNeSQ4vmit4NXKQ+TJztXPJ+8IY2KICvVG44D9IQiGSPI/39VV9ANIfCGrAN
         8aoaImbh3Bwwg9keH5gAxiIDV++bA8SxucARxNTqXTLfk6hTamMM8JFjfnvxPZRirIgX
         ss8w==
X-Forwarded-Encrypted: i=1; AJvYcCUesP7UGBFaGa3ebdzpE6zv09d9wlInmw1NClk1BLd1VeNrnlABpv6aFKF6ExDJhUZbob0e0YGGjUjmDLe4gvvjVyi2KXIOHac1mo5V6DHS
X-Gm-Message-State: AOJu0YyEW3avEJlXjJDslOoU3pM8fjsL0giW5c18SwU8mYGEP4f7RMVr
	UEi4rW9H+wc4Upc0BJtEWo+c7py6z9+DDkjGqetAcOAUvM550mtWnDqD4dY0ZVU=
X-Google-Smtp-Source: AGHT+IGwBTAKeY5fhp4d/uHQX4CpW74WCuXLPUcacrekwQIOgiTzG+e+uX/rDZRV2vhHKygHe3+bDg==
X-Received: by 2002:a05:6e02:198a:b0:374:5641:bb8f with SMTP id e9e14a558f8ab-3748b9dd6a4mr60478395ab.27.1717254317893;
        Sat, 01 Jun 2024 08:05:17 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a4ba741sm2559410a12.85.2024.06.01.08.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:05:17 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v6 08/17] ACPI: pci_link: Clear the dependencies after probe
Date: Sat,  1 Jun 2024 20:34:02 +0530
Message-Id: <20240601150411.1929783-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_080520_820970_0E872CFC 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V platforms need to use dependencies between PCI host bridge, Link
devices and the interrupt controllers to ensure probe order. The
dependency is like below.

Interrupt controller <-- Link Device <-- PCI Host bridge.

If there is no dependency added between Link device and PCI Host Bridge,
then the PCI end points can get probed prior to link device, unable to
get mapping for INTx.

So, add the link device's HID to dependency honor list and also clear it
after its probe.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/pci_link.c | 2 ++
 drivers/acpi/scan.c     | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/acpi/pci_link.c b/drivers/acpi/pci_link.c
index aa1038b8aec4..b727db968f33 100644
--- a/drivers/acpi/pci_link.c
+++ b/drivers/acpi/pci_link.c
@@ -748,6 +748,8 @@ static int acpi_pci_link_add(struct acpi_device *device,
 	if (result)
 		kfree(link);
 
+	acpi_dev_clear_dependencies(device);
+
 	return result < 0 ? result : 1;
 }
 
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 918e71fc54cb..0280056a326b 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -834,6 +834,7 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
 	"RSCV0001", /* RISC-V PLIC */
 	"RSCV0002", /* RISC-V APLIC */
+	"PNP0C0F",  /* PCI Link Device */
 	NULL
 };
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
