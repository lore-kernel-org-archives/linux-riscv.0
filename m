Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62B9C46CD4
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYOHUTn1oAV5wdxdedFXJT+rQR7Tg1Pyo38VA3g+Eqc=; b=XUrRlEYmxsEJqK
	Uv/tG++T1QsM+9zV8dLwGwdwhvbFusfWRRLudy8cL2Ea8ocMZw5PYv6Iyt7eGLM4042Tt+gq7ewuz
	sBXlW1okHNr4+JsijKzehWHT9348VeeOCQ2SHzAhVnd25VknHmbAEULKTGTnC0naaH0C8yQskexCP
	cklUExtVy53bdtG31cJKGjssBGsGm/kEoe3TIvzYmAS9/veO8vvvFWNiMTL1BhEjT4Nf72Syc0blR
	a2s5ruLhoyqXJOs3z/xHpikaneIsL5Np9pRfuiE9pOnLl6ba8g3Y5J2O/LxCiRMs2X/3eJCQnbR1F
	3BCN84TnHdGROVHXonfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeCA-00F2Fr-1d;
	Tue, 19 Dec 2023 17:47:54 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeB9-00F1Hn-0r
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:46:52 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d39afa1eecso29695365ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703008008; x=1703612808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SP5qUoiFDc31MnkvQviOGvw0IT7UG54DgquaP3mAr+M=;
        b=XgEhIijeIn8bLy8p6Z05sb6YXcunfm2yyhzUnK9w19tDYrO1RsrjGmYML3jorWMYrz
         JpYmObs0I3hQqz/VgwS11UB7bDhshgRzhKiC4SVXcQ4o6WxnH8lsb5URNxAxk+DakFWh
         RwwxsTVoODZYr+mFcKoLX6l0BGh1dR9hNVqTVFvYiQKmEtEyzQ9mlckz0CMu/eeoZ7EQ
         aJClv5xCc+lLqlAw8QSrTLeJjdyjj3mnclJd4fCKrNcLHrQixUXPuXH1JgfiERHJaSj7
         Dwu73Crb6wNViuPtXAdCb45dtrD/2Ud7MABaDwfWdutj0W5kr2VLhTKFJFshvPM4pQJf
         aQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703008008; x=1703612808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SP5qUoiFDc31MnkvQviOGvw0IT7UG54DgquaP3mAr+M=;
        b=tkJ3zzqkVND4F5vBormAU8lPA+nTDzsr6w/kCdhP1F4lL1cN0c4Rpyp3pgqDlmO6bf
         V2zOTemK8acs0HtfrWdvoFOQHXoPb4cVx9C0mJhSMCovcnbq+YAwXunAguWrkPm5S6pB
         5qaYPb8bdycSSIwl9vQlM3aTtJ1l3tOAq+OnRRQCHpriEK1j5e0N6kr9i6BuhC9zvuJG
         7QloOx70pAxXQsHn1FYBaUg5CLb0woXRh925CdjPsGAu8OVU2PyCaOPaCeJBE2dTuv8I
         2ogkq7ZXJYAdDWtTkPmsUCDrcGhw80I++0qRusEfKMSy6f/KfUUTOimFqLNd6MdOZgZJ
         vlcQ==
X-Gm-Message-State: AOJu0YyLqVGeYWtmboi6fJ/83Kbm0edCjkcwW3EEd/OuVOXRZxmUz8/c
	d8vX5UP6xIsukgHTQV+/Hn/sPA==
X-Google-Smtp-Source: AGHT+IEOQXmfDQVD1vBA63SzA+9hg3WHejFnv5r3sp4cTvGZBg1eOJzxTsxyyXCko2PiShNLOVwBww==
X-Received: by 2002:a17:902:a3c7:b0:1d3:9d55:3d67 with SMTP id q7-20020a170902a3c700b001d39d553d67mr5367594plb.101.1703008008246;
        Tue, 19 Dec 2023 09:46:48 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:46:47 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 13/17] ACPI: bus: Add RINTC IRQ model for RISC-V
Date: Tue, 19 Dec 2023 23:15:22 +0530
Message-Id: <20231219174526.2235150-14-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094651_321282_EE8EC0E9 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
index a4aa53b7e2bb..9eace6c7042e 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1158,6 +1158,9 @@ static int __init acpi_bus_init_irq(void)
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
index ae045e14126b..b6766bded765 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -95,6 +95,7 @@ enum acpi_irq_model_id {
 	ACPI_IRQ_MODEL_PLATFORM,
 	ACPI_IRQ_MODEL_GIC,
 	ACPI_IRQ_MODEL_LPIC,
+	ACPI_IRQ_MODEL_RINTC,
 	ACPI_IRQ_MODEL_COUNT
 };
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
