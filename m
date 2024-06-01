Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFE9C25B7E
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3kmCBTwl/0Hw7islljoPYCkmylWMecI+9U0iOH2rak=; b=Goavm0aNjBqw+K
	HGJOREw9TP5TRyqObvqfJfbTGfkbLjvWy/QDhe0Oeg42nQ4dlTLLSQGoxHjCQAv4f2GLOQLHuwZrz
	FcT8wLdOYyDtsn5/nV0pifhvYIqBWs2xB8S5glLIJ8NeIHLjuJaCWazzySWrHk5/mmxNrTnBtUSat
	zCf/vvyKalmX3i+gTxZtDlLWHE5evB2lRatYnnfa+eCOIymaCAeIEKilwM8Y5z02PJOd5Dztgnaj4
	mbX4oWUiYn6b1BT5rQbtuQf3EilY148/CmattNMBs7BYS1mrqD1w0KkX7E9hxHLM2CqvAF/qViFBa
	3OD4i1cq0AUDpL1wP2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQIR-0000000Cp9w-0UXZ;
	Sat, 01 Jun 2024 15:05:27 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQIC-0000000Cowp-1rcF
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 15:05:17 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-6c4f3e0e407so1042761a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jun 2024 08:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717254311; x=1717859111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4M/mYQsiafz27308Ygh9HE2jpjvmPpXdwbsDZU0p4U=;
        b=Lu5FO0hDdTzKu5klhu6L35awqwKtRIgyTVnXqaQ5L1bW5qFuB5ur9h521i5UarSa9i
         avjjbJ94FJylommcJ7qWUWEW/FF5F65WD4DZ4fYm00dU6K6srBDeaHLtnx2atY9j06o8
         k72tqwDkd27ZAHhFow4cKOGAWxtTsPcprYQuVQvokQfCzwk2LsZ0iNI5OmWwrXby8FxY
         DPdc8HVbw/o7WqW90jN2ZI3XP8jMzQFbfqCMobd4LhcyGo43qRFiqCXX74zfZrFQR1Vt
         YQBlnxRu6/ju3ROQO6G/j9416jSNS3YIHjqW6yu6WAM/NZxfTjpYE0/t9GcC+Sxi5HlV
         eUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254311; x=1717859111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4M/mYQsiafz27308Ygh9HE2jpjvmPpXdwbsDZU0p4U=;
        b=kAn8/c9H/LroLhLqj3xRe3jQ4t7ufqW01vvyGAwfOf/TnMnzSKFBunns2QQ8JNswGg
         15BAstR5lhPVZkyIHkgYNaDzqvu4ZJqUzPoCImjIo9qwUSHEefLEKpC5zF7duBSMYbDS
         ErNPCNtDyQDtwxa18fARIWFe3H+jUnuPiPZrfauMCD1KrXomPct9MIQNYg+RJqaQoByC
         D+OQaz+1D+yY5keX5BLOqKrhjrGu/vlFVCXoHSOmEZKl+mtft7ywiI4lEqTeY/ssTnVb
         1Mho3RKeUO4/Hxw/gRkfGtmtw8vHwRKD9jKHT9OzNBqwbnyLmklA5og2OBCBvgIGwucr
         J2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs+YvCUiCgjk9s6dCjR2Wl6H6uiNbT8EV0tmRQFlsQ2djfoy8kZqe5xuWEeh1Yz5rNIOl2747mBnxBSlWRp3gnKxJ0xL8Hrf9dY8OHqf26
X-Gm-Message-State: AOJu0YwAC52BlQe5oyaBiNLBgjAwFXRN1VjOUeMXfmHaZ0zEgi0tzp9c
	zXrrDg4Y3w/DSuWfRDcXV9Ay6nmaZnQuFcREpV82ZpwEZKwrioH1hkBXf5UAVmY=
X-Google-Smtp-Source: AGHT+IH8CUtTilyts1LQmIwjtfiqczpJ90H7WVJzan1b3vUk1N8n0tjhHWRHLwYTOBrAh4nFvjs79Q==
X-Received: by 2002:a17:90b:1bcd:b0:2c2:a2a:6151 with SMTP id 98e67ed59e1d1-2c20a2a631emr797621a91.39.1717254310835;
        Sat, 01 Jun 2024 08:05:10 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a4ba741sm2559410a12.85.2024.06.01.08.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:05:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v6 07/17] ACPI: bus: Add RINTC IRQ model for RISC-V
Date: Sat,  1 Jun 2024 20:34:01 +0530
Message-Id: <20240601150411.1929783-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_080513_276529_311E2602 
X-CRM114-Status: GOOD (  10.22  )
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

Add the IRQ model for RISC-V INTC so that acpi_set_irq_model can use this
for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/bus.c   | 3 +++
 include/linux/acpi.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 8d0710ade8c6..d5286e39668e 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1201,6 +1201,9 @@ static int __init acpi_bus_init_irq(void)
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
index 0c6d9539f737..3dd67ee09c39 100644
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
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
