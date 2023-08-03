Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83777C001DB
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ufsTjEeUBopNZms+7gnk7Dx31Eet87pNSH6VQYT6Ik=; b=LARtvG4Hgrinvf
	15GJVznfrsUBPfIaNXSwPGvLwRbW1qaAHdpETlCPhQWxEBsqpiU0w38k0+QommP1Sbz/m6EEKYESq
	XXbL4TSd77B4lqQZadAdn5wGWx7stPNZ6aR0tqXVRiqTAC26z2SWumnshrYvuXtYYV5nVssMqiys9
	fKsowgkvcMlfyv3cA0N89I1cBhgbSOBgOcYOD7A8Mj5E2LR6AmobhdhrsJK2OlpOAEKi8DEiYzWXp
	hgiR2P4yfGeLQiFmHzsN50/fwgqDdCnUOXf7JZTZ3CV2jE1LIXDXKbt6ZALaYGzXxGhONZ87ZynKE
	T7uWibW46+hn3I3AHSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcdm-00AVoq-2u;
	Thu, 03 Aug 2023 18:01:38 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcdi-00AVkW-16
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:01:36 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-686d8c8fc65so914982b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085694; x=1691690494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95yH1ZRY1l5+vMULtm7DKGPnoBqPk/7PEb2F1bhVxfo=;
        b=V2wPisBDGbePHms2A4risrsDPrMUWBaceOkrdFeRUdqmk8sYzA5KDWJo5ROYiF0CjX
         Z74IQMZ1avQxf45hCxGVP3uqUF/sUXX9QWVu+q4wSB19tXd6YUul2EoHn+erVyy3sXpW
         Jwz/h2pkxAshzi43we+dfVrIdTOcl++Q/N4ri/20PthUznYPeIaLZpuiw1cnyJwnvSDM
         pcI9H5/RIULmGhhKhSoYJUA3vVFvfyjZhhZxhPigphk2shP6Errk5T1R3GEjLQvcK1W+
         BuCSuJIxsNVj9LrjOIwPOA0PDc0afRT+ExMZ+FldLPxVOWhYHGBeKMhWgQmR5Pe/ln4m
         1JKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085694; x=1691690494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95yH1ZRY1l5+vMULtm7DKGPnoBqPk/7PEb2F1bhVxfo=;
        b=ad5KkldAPl61KjRGH6ewrdzUwSCJvCMtIdwk+mEYs8ffyKfvzl+vrTPGptLyG+UUGE
         /42S6mlB+ERfr2Ek/2sewi7oWtoGgl3tOTBn+qcVDcKRcrFppTRzy6eDQlfF35Fa11We
         0+Gvg7eB7ra9QyZ/9APGnYpVui2BV6OzWfF3NWO22J1nhHPjycrJ5taS5l2vAwvkjHKO
         2gSpehphI5i4bxBXJv0jClxC+lhwGhcbqsYFdfZDGrQsKGpRklAdVV9dDxBoyYvUWbQO
         LgxJFBfmJkrDsFtAo2WXaGAiszfpaswi7UKcbsT1QeJOrWG5b83JAKCT4J6lG0+kLlYB
         KvDg==
X-Gm-Message-State: ABy/qLYUbCMeNb9TOXkKMwKxTpWq0lvwyPMJP6kQBDf6o+5CUt2OQb9D
	FrfrLJb9YTOX9hZVogU+bt86Vg==
X-Google-Smtp-Source: APBJJlGnVuM193+CpDLoy7mFWMwR938XQnrV4s+XW2zz4aJ0EBbZLOLGESYCRhXm5hyH4ZPKVToj3A==
X-Received: by 2002:a05:6a00:843:b0:67a:9208:87a with SMTP id q3-20020a056a00084300b0067a9208087amr21529015pfk.23.1691085693539;
        Thu, 03 Aug 2023 11:01:33 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:01:33 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 16/21] ACPI: Add APLIC IRQ model for RISC-V
Date: Thu,  3 Aug 2023 23:29:11 +0530
Message-Id: <20230803175916.3174453-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110134_422012_DECA1952 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the IRQ model for RISC-V APLIC so that acpi_set_irq_model
can use this for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/bus.c   | 3 +++
 include/linux/acpi.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 9a8c16170a4b..dd9d80630bf6 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1132,6 +1132,9 @@ static int __init acpi_bus_init_irq(void)
 	case ACPI_IRQ_MODEL_LPIC:
 		message = "LPIC";
 		break;
+	case ACPI_IRQ_MODEL_APLIC:
+		message = "APLIC";
+		break;
 	default:
 		pr_info("Unknown interrupt routing model\n");
 		return -ENODEV;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index d16739928888..698d120a1bd2 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -95,6 +95,7 @@ enum acpi_irq_model_id {
 	ACPI_IRQ_MODEL_PLATFORM,
 	ACPI_IRQ_MODEL_GIC,
 	ACPI_IRQ_MODEL_LPIC,
+	ACPI_IRQ_MODEL_APLIC,
 	ACPI_IRQ_MODEL_COUNT
 };
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
