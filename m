Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B620C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 14:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnkrhVwHxoVgkBaGWf/Oh0HqLreyML731We9zPvYU5M=; b=POcuc9S5yjPS0o
	nN8Qc871sBAP4FPUeMnI7T/s5+7zlKPa9YAAJku0a+ycoZC6wGke/em4kqYCwqP9cq8YdqALiU8vv
	lt9cErGepohTxymVkNC4cZ6lhiav7rFOhVfwyLzYXdTj0WSKCuzOk0E2scw3m+JOzCr54swbc0rC7
	FikyM8uCUWBpFu25aP53jw5bSBN8Sk9yEIoXTERPmP3FsLE+ohK7NV6WpvcOAYxmGxy6roKt7Lkzd
	2AGGtxaSKiX4fg2/lZDGEiubfJfSAj0D7ZvppDE939ZHHf+DN6UJh1jyRJvUJNOoaqPfmRfqMj7iO
	xrBPlXAww1OoPlejjCUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRXh-0000000Bfyk-4BwN;
	Mon, 29 Jul 2024 14:40:06 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRHj-0000000BYlH-1ip3
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 14:23:37 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1fb3b7d0d56so14461235ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722263015; x=1722867815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6K3rvuzx+kcxCA/RkAijYB8PiaVxGHgknWl7+W2h8I=;
        b=gh+cJ9RG4KQPgl0WRxf4fQdgXTM8OYvorFWaHM3OodRyCEfwQtxazriMLC40D5772E
         SYFNi9tqjxYQRhz+DdsRmb6K1k5EpfbUfP3S2i09RMhWvlzzC6mtyllLgXby9seJx3VS
         ur/kWa+d020JKDLGurfFBWpwUvZIQXhR3verT4BneX/6JebngVRhUuENEUNXedwoxkhE
         OSD9Xsz0L6xthPZcS7wW0aaMMOGOwt2Usk/AGj8mkoSnSO1StuZsCXoGNWlJpqUtsKKe
         WkaBLnkXPYXGiDFSFnE7PlWI1aSjbhC2GEx0h2ZJWm/DFSx5Djt6zq5QFxGxM5wChSeN
         uQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263015; x=1722867815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6K3rvuzx+kcxCA/RkAijYB8PiaVxGHgknWl7+W2h8I=;
        b=H4wWd3zzUftTA3Wkhgz5+ml1N5fnmkJN4uFpQ6IFjQgvj0O/yUHBxyjvoTqsPe6TZB
         +wN+eZE5z8tMkKnB8VXtH+kDIPyM1wK1u/6HO5YisO+UBNIahKQWFxfUiQRBpMbvaySa
         AGGTCl67igSKuD+jPWL8pR5IvivLCsUOR+fZv/eESRSA3yT0tszhCx+CFEHqH6q3PVYG
         jaoak5jD1DHeObtg3oF9KxGLaEjfwDeW9LSKWl+59jHgXQSidiXaa5pMdBtUbF7ztbB7
         x2xf5xiZUNgDLwkJMpSDplK2cZe/9QdibPA9O26llfjbsmQJL7lBq6t9lsdpWxXsi3Bx
         krIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGWLM5MCTiqj2zAQe9/ZkjccUlM6PDA6ZyxEA/6kIdjRTjakMggVJuKMAlqXHpWZcCihvSxO+RZ066lZYFFACjrY6PMoO5w1EGWl2O9y7i
X-Gm-Message-State: AOJu0YwOnT21OuNR/IjH217lA04v+kygyezV83Np/9KqrQgG/U/Oe9/B
	GmGiP/KhjPxqY6ifdscb0LsJFGbQJ0yHBzpt1KkNsaFyaA4D4om4hosiB6a59BI=
X-Google-Smtp-Source: AGHT+IHuqnyr1wGz5leAhutHIAJO97R4WBnGGYBJopHkXMNgwgilRpOmng0OCq0p9dkCz8Wkxaglow==
X-Received: by 2002:a17:903:8d0:b0:1fd:9105:7dd3 with SMTP id d9443c01a7336-1ff049711f5mr56820415ad.64.1722263014706;
        Mon, 29 Jul 2024 07:23:34 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fa988dsm83512965ad.263.2024.07.29.07.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:23:34 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v7 07/17] ACPI: bus: Add RINTC IRQ model for RISC-V
Date: Mon, 29 Jul 2024 19:52:29 +0530
Message-ID: <20240729142241.733357-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-1-sunilvl@ventanamicro.com>
References: <20240729142241.733357-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_072335_509280_27FE6FD2 
X-CRM114-Status: GOOD (  10.21  )
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

Add the IRQ model for RISC-V INTC so that acpi_set_irq_model can use this
for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/bus.c   | 3 +++
 include/linux/acpi.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 48d277657203..16917dc3ad60 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1203,6 +1203,9 @@ static int __init acpi_bus_init_irq(void)
 	case ACPI_IRQ_MODEL_LPIC:
 		message = "LPIC";
 		break;
+	case ACPI_IRQ_MODEL_RINTC:
+		message = "RINTC";
+		break;
 	default:
 		pr_info("Unknown interrupt routing model\n");
 		return -ENODEV;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 892025d873f0..3a21f1cf126f 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -107,6 +107,7 @@ enum acpi_irq_model_id {
 	ACPI_IRQ_MODEL_PLATFORM,
 	ACPI_IRQ_MODEL_GIC,
 	ACPI_IRQ_MODEL_LPIC,
+	ACPI_IRQ_MODEL_RINTC,
 	ACPI_IRQ_MODEL_COUNT
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
