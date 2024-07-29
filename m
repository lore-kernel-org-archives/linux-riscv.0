Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFF6C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylEQeJ3Q6LsWdLo8noJb17ZvBeGjqCgj/kNDJrHZXzU=; b=C+EOatcG2gIGT0
	oPtHwnAM5Y9zTcpzRdQPDi3KfeYZ6XbTUVWl5wcO8IWnp+rOvJHsGLDeBQSerRyLu61oAQkSiFeQV
	4MvlFIKFqvG/l/JYri4JUZGp80dnPLdzSVVSqDyjXzI7nxHpRF7mVmB6CZUAF8hmLhWLTXh2DIFjZ
	6JsUOgxJy8SlDlWLEBLx4Cq+X7f15FtL5nnGVl600s0n74aXDnFnEMYfg2qnF2DgdgKTCVVUq5RHv
	Ho0Zqve2CTRhdzzfCi7Pn3bxQayCimQ9GPRW/e2p7eoLgZ4jvcq9JViNRn7WBtVKI643D7hytkvDe
	gLFZXAYMzNUK7bHCzRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRXi-0000000BfzB-2rFL;
	Mon, 29 Jul 2024 14:40:06 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRHo-0000000BYno-3Fo7
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 14:23:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fd70ba6a15so19918595ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 07:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722263020; x=1722867820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFDunmtzDxNSJrEf+jYEf48MjjKh1U2DF8SfSHqhi3s=;
        b=nOOVv3UsoUD63dyHUjfSFKbXj41XwcYINO2FnzVMsoklr+1chJVadoJYj50iOs4Vnn
         S1xE0AbSZCC+al9+ZtWZcSd3p/pKAQ44VYQ02aOF4lZCoZXmXHOuQTrFFWSOK5KBMVlL
         2h+3KNBUdnOYvgzIwtc5p5X1HM6iZtD5dAcKs4URwxb/ViYsUY+AKv2QUTp3nmZ7nHT4
         W4pjZo2UsBt6ctNjCqkYC9VeOh5muMd2++VLx1Q4KZUhNB1Q9GUL9RRmzRRgh4cYA4a4
         ww1lAvCc3ENmLW+GJHo/xjz30fDqqVrNb3fVGvuuIpHHToD2TtkafD/82vIwMY6EJfTL
         L1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263020; x=1722867820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFDunmtzDxNSJrEf+jYEf48MjjKh1U2DF8SfSHqhi3s=;
        b=F1UK2mGP5oBH8QHhgKJHfaZ5R5XC/CRvRIooDrcrt/46xHjR+mGctTNf/jW1gvvjWk
         EPmJsWIkzomzNDv9ei/BHR/1DeDEnO5f6mPaUV5ecqTorEAtWjF9GQNTxcB7aEvPhoez
         /cPMALTdPCwshqkpCOp0PFr2mbzLUx80dbXXERMSbhJF81MWcIL0UvdzuzJgvKxc2K8g
         +zq3XFTnziL83hNroEc/VT4ExmykXlOi5w27wrjEH+b6FHUA6l4FsKmvRckyFhbtxKsu
         /jH2t7nPc6LDZmLvHnxBZt59xiQTa+njzS/YM3k60mjUTqH/mFaTK1iA/nEp/all/1nA
         ODkw==
X-Forwarded-Encrypted: i=1; AJvYcCXOz7kyAfcMAvk7KW06v4cwrGBWyF78GM3PRpnLlmsT6DGNy/7M3U9rJEqRT6WYWfRoPjavTh0aBItMceeAE5zf0KmM+878odSS5FFfD36w
X-Gm-Message-State: AOJu0YxrXjCB5eiJZu6nkBN0aGKte8gKxCH24YFk+tmbH5zEjUZrp/TD
	cwoCM36O6qwUKJ1yjg+fw3Zf5wX3owUyIqAb3kmHONfhhI3kL+x6J91lP9uCk4k=
X-Google-Smtp-Source: AGHT+IGU3odbD3sPqAp4C/YNgby17mm2kU5A273xs06JOeimMLExymMBUikKyGUV8C6cXEETPaqERA==
X-Received: by 2002:a17:902:e84a:b0:1fb:82f5:6641 with SMTP id d9443c01a7336-1ff0481bb94mr68486545ad.23.1722263020193;
        Mon, 29 Jul 2024 07:23:40 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa988dsm83512965ad.263.2024.07.29.07.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:23:39 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v7 08/17] ACPI: pci_link: Clear the dependencies after probe
Date: Mon, 29 Jul 2024 19:52:30 +0530
Message-ID: <20240729142241.733357-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-1-sunilvl@ventanamicro.com>
References: <20240729142241.733357-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_072340_852230_F37B3211 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, Anup Patel <anup@brainfault.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
index 28a221f956d7..753539a1f26b 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -863,6 +863,7 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
 	"RSCV0001", /* RISC-V PLIC */
 	"RSCV0002", /* RISC-V APLIC */
+	"PNP0C0F",  /* PCI Link Device */
 	NULL
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
