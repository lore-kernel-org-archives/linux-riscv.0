Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4441C25B5F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 13:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ot+XKcfy3eegyI5eQ+E4R+BHqJxPWbGdlWfr8dng4lk=; b=xB50Hl1W1PUYSG
	ubzvVo7WbEBXefFvlqMj+IDoDenfOisppVTjhCAELO9q20TApszpscFdVlhHScTChdm4LMmndGl82
	MnHrvzAletsScIHjz7dFjKcemLg8xHkQAlio6ubZXcjKXbUkmFT/h+JfVgJAXSxr9jcbNUc1aMfQz
	+jNqT8sD/7Jey5kyq64hA9dtykPzGbDmmqzCPgWQLs1NLaMW3Uevl0HwrmNSLxyHx2YKif2fUNkOc
	oFmB7roSWUCs9bTT/cR/qus/AeZqKQQ8on53VTEln+Dw3PlfHO3C47K7dIxveKPQPcFU1+5MuyClC
	+JG1uLdBLlBTSwUMolPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2AHV-00000009iXi-2PWM;
	Wed, 01 May 2024 13:45:57 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s28vU-00000009Msu-10Yb
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 12:19:09 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e3c9300c65so57040755ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 05:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714565946; x=1715170746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38bWUcD6VJHgu2OT2TKY+rPPpBYSs9fss+ITqZ/SBFM=;
        b=OVRf5l21u+yPqsiysErnQUw2L0Vo69gUhOl/tcKqu39MuJdd0QYdDPvsQ6sr0d7D4l
         HqsVHZTK91lLezfrHeko1uc5VZMroBbMgdzmu6jJlb4xpaFSQotx3z2RKiqXgh9VoCje
         BPxybhS66ZErxzuoelYUeKXbmbUhT5i6dCoFJM2ZWLheZzwkfy7a8fQzS+QK63GB8iO0
         8s9FleZBEF8Omwyt6JF66wHI5g5ggcrgwfV+yBqEdwMgReRlA6QA775RNIfoaDtSYFm6
         YlAMoKsqUiHFvYI7f3MHy5WneF/g/AjnDdTfuwlsMEUl5Y87N2+QHWsP2vYLS2tdoCSK
         dpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714565946; x=1715170746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38bWUcD6VJHgu2OT2TKY+rPPpBYSs9fss+ITqZ/SBFM=;
        b=GisdfSGvdc/FrVzjl0ZX0ao/AdJ7FE8Kd8ciFReocBjxN3nGGwWVj4pcTMI4qFhYzR
         pDveJQPJ0n8lJ2m4osbZKLj9vwz0VdWjApE3nZkilyTkG6k8vAWRskgprKaEsYWw+4en
         0rTfd9klZDAKepoi/P86ehFbLhHeJSBRgXZXGG9aef+kjL3iKFXIbu+vr2b/A1yWbjnk
         iDuV3fVxl1rjefZ34nC8CsjNKqU7g4tdSg+aDVShQeT0H8xKxoiIPC93GLGuK5Tlh2yP
         PutSm27/NNQHU/0BbMU/BnMV3dRcUTiIhV3rW20kW2ydfbSb5BaNZwmpSHYmVXynnSnx
         ISuw==
X-Forwarded-Encrypted: i=1; AJvYcCWsRXxOf/AB69pQY4RO0Shc0LA2FXccV6QZPnQi8rEydToL2RmGAVgSFZEypaScSv2HwqK7pNXLtTv83IV0qi8jOeu8vVDQ8OjN5QB5mjvA
X-Gm-Message-State: AOJu0YytpDZDOAHEEOnkLYqWKZbHFGdKZ5z0Kq7nufbUcnWTaDZNL6H3
	Xhvg0/+prklh01rKlZtr6muO8/mQHoYEoKZWaURbWbk/pfiIRh5vcYflJatvLA4=
X-Google-Smtp-Source: AGHT+IGXC7NkAjACd9P5pWtq+Fm60ySdE8zHPZMKCP8HvEhNdRXNAHHqpbDgXk2ZkzDTp6OP1jYRcw==
X-Received: by 2002:a17:903:2591:b0:1de:f93f:4410 with SMTP id jb17-20020a170903259100b001def93f4410mr1645679plb.8.1714565945995;
        Wed, 01 May 2024 05:19:05 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.106])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b001ec8888b22esm1336900plb.65.2024.05.01.05.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:19:05 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v5 08/17] ACPI: pci_link: Clear the dependencies after probe
Date: Wed,  1 May 2024 17:47:33 +0530
Message-Id: <20240501121742.1215792-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
References: <20240501121742.1215792-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_051908_547533_625817C1 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Jiri Slaby <jirislaby@kernel.org>, Haibo1 Xu <haibo1.xu@intel.com>, Marc Zyngier <maz@kernel.org>, Robert Moore <robert.moore@intel.com>, Andrei Warkentin <andrei.warkentin@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Holland <samuel.holland@sifive.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
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

Since this is required only for architectures like RISC-V, enable this
code under a new config option and set this only in RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/Kconfig      | 1 +
 drivers/acpi/Kconfig    | 3 +++
 drivers/acpi/pci_link.c | 3 +++
 drivers/acpi/scan.c     | 1 +
 4 files changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f961449ca077..f7a36d79ff1a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -14,6 +14,7 @@ config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
+	select ARCH_ACPI_DEFERRED_GSI if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index e3a7c2aedd5f..ebec1707f662 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -587,6 +587,9 @@ config ACPI_PRMT
 	  substantially increase computational overhead related to the
 	  initialization of some server systems.
 
+config ARCH_ACPI_DEFERRED_GSI
+	bool
+
 endif	# ACPI
 
 config X86_PM_TIMER
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
index 3eeb4ce39fcc..67677a6ff8e3 100644
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
