Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE4FC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 17:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/Yx0B0ysNYeW7dIL5Pxh6J7MNvEuOAjUQd/M5tnBj4=; b=M4qJfCiDnkaEXQ
	OnAyfzbzt3PbMw2za5NLJtSzmqAu7vm4H6CC7rv8hazBvZ74SBt6V7pjFgdfxJd1gQmLIdjgAJMR0
	tARzzxTk30iLjkEudSR/URmQyQ3XBPCwXI5l+4KWQE9u5ZSrHHYNRUczOYvNxSAPdYyX5o+HT3tb7
	YN1eE8qwPxzlD0y1hMiR3s3VGuFbTxGL0viuD/mne/o5yXw40k64CuvvSkutyexaViwllM35dM6LM
	xSG8PNrLwqQ3+Nw7a4v5LPODosIkkbsmsOEuPNIcmO0cd+riotsTCtAIeGdXmOlqz44QdZ9v/ncru
	lplp6tf+0kNhSyt66rVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPmK-00000009EXB-1KIs;
	Mon, 15 Apr 2024 17:06:00 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwPk2-00000009Cga-2zoJ
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 17:03:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e782e955adso3474923b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713200618; x=1713805418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4XnyCkVtMil3j8A/KjvpJf48jXr01BLYuVmlXnWMII=;
        b=AOSTBGfwJld2+KHSPUWivgENSTWMQwPjj9wdBYi98mH+OQHRvIoBLj7nSGZ852+bPS
         e+0A/mkOlXZnovGmho4huqYhDApU+ix38G28B3E35OUd+ecQ64Fta6jxBSRnMWpWdxwv
         ii+J3IvU6OyZpbRJCokGfC1BgGGV+b2b3GulXpa/kqQlrDjAFcNWe9CIVglbpDSi93HD
         92wnb0xa8KqgSVRzb0OnVOrRflxXKF/jY3zf8oYusyQ73AYF/36Mj6iisCduswhGH1Oy
         zM0s/ghoxDFPHKD/if6wVnIOqfshuiH4bchnMgGKoSv58P897aeQyxdmYxaUWg/2Cn1L
         6dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713200618; x=1713805418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4XnyCkVtMil3j8A/KjvpJf48jXr01BLYuVmlXnWMII=;
        b=oaDHGjxESuLU7fV+sKMVXSM/GiU4fTJFLQGvtbaM5Hbozwe6m2VI330C7HbNSJP+UM
         XBqZeYksyMyd6TZVrUDwrfPAhKs257UP5CUhNLhk8Q0VNeb0Ib6MBUppbV6UtnUAXXap
         xZwn+hRTDXTn3xAs43kHF1OTNMMJzuYDd3K/huAQJa4EapNzd9ffzlTNw6J7yPTKtUW/
         9L6EpyCux1EOdd0a3fYnGG1yFaFyLIqElyU3acqdM1aBo0Im+l7Q3gm39Qr9IZwBJTHu
         WUneMmGV5txEf5Tv4hibSIsR6NTzrFwrdNdA9lNb4uuvBuJmIZsJwEzvc5Pb2aZnnI/R
         bz1g==
X-Forwarded-Encrypted: i=1; AJvYcCUaGH8V2XSu+g8KnBZm8gWoaOdG2Mppw69jewfcNuhYHHIXYgUcJtCD7FG8ho+5RPw4AzYCS8Roo2GFabhkDq6ECMK8xTOHF0sRHFZJqghQ
X-Gm-Message-State: AOJu0YzJW7eSrzkLctK0iOU+4QMLcE80aBqg64M2ltB5X12WD20QC3bW
	affykt5TREOTZVqQbfdf63CP27GXZ5uELVn+03zkjs6guD0RPxwmZ/LTXcqBPC4=
X-Google-Smtp-Source: AGHT+IEZ3MSxzXsGAz+ZLkxl8S7XJ3zcQ2NIg6LwPVYoJf81xxbiq6s9OomXLtGiFPJD3YOtkLtUPQ==
X-Received: by 2002:a05:6a00:acb:b0:6ed:21d5:fc2c with SMTP id c11-20020a056a000acb00b006ed21d5fc2cmr12682862pfl.26.1713200617123;
        Mon, 15 Apr 2024 10:03:37 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.230])
        by smtp.gmail.com with ESMTPSA id 1-20020a056a00072100b006ed045e3a70sm7433158pfm.25.2024.04.15.10.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:03:36 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v4 20/20] ACPI: pci_link: Clear the dependencies after probe
Date: Mon, 15 Apr 2024 22:31:13 +0530
Message-Id: <20240415170113.662318-21-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240415170113.662318-1-sunilvl@ventanamicro.com>
References: <20240415170113.662318-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_100338_894880_5D7F5EAD 
X-CRM114-Status: GOOD (  11.81  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo1 Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V platforms need to use dependencies between PCI host bridge, Link
devices and the interrupt controllers to ensure probe order. The
dependency is like below.

Interrupt controller <-- Link Device <-- PCI Host bridge.

If there is no dependency added between Link device and PCI Host Bridge,
then the PCI end points can get probed prior to link device unable to
get mapping for INTx.

So, add the link device's HID to dependency honor list and also clear it
after its probe.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/pci_link.c | 3 +++
 drivers/acpi/scan.c     | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/acpi/pci_link.c b/drivers/acpi/pci_link.c
index aa1038b8aec4..48cdcedafad6 100644
--- a/drivers/acpi/pci_link.c
+++ b/drivers/acpi/pci_link.c
@@ -748,6 +748,9 @@ static int acpi_pci_link_add(struct acpi_device *device,
 	if (result)
 		kfree(link);
 
+	if (IS_ENABLED(CONFIG_ARCH_ACPI_DEFERRED_GSI))
+		acpi_dev_clear_dependencies(device);
+
 	return result < 0 ? result : 1;
 }
 
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 086ae040a5ad..32865af071ce 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -835,6 +835,7 @@ static const char * const acpi_honor_dep_ids[] = {
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
