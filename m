Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F45AC25B7E
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5liTSG/Zqtz1Qx/6DwBrDU/BqRuOA8C95iUpabHxpvY=; b=pe9tehOE3NzCM3
	iA9TIWEdZY/G9UAv5szIB8WUzIilULnF5Y5l/L5O1YfDDd8m75es1+EstlrdWfxVDfr04vuii6V0N
	0cL4uASNLnPGsasib9tLB9osQAyiS+sMscL77ozQzrwhJ9tG137wPOwAhrUCGI/gJy9mX/eOmHoqX
	xH/SvW47UMJ7Cm4HO4Kc2bMKTgV01m/kFVdroQcvZubCssT6EwoNTr7aTIAWQL/lBaaG4IBZ6dkXR
	8tlrQQA/D/zUcgcmVUnMOQQ2bv3vGAnojgWhz8CehouIYuNRxuuJFXH0YOejgZ/4m40kU0CYIsfLj
	g4Ytg61DkMpEqDR4YHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQI7-0000000Cotx-2oML;
	Sat, 01 Jun 2024 15:05:08 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDQHy-0000000ColT-45oX
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 15:05:01 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-701b0b0be38so2791812b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jun 2024 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717254297; x=1717859097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMraijh7EdibSWZk0AZcru1m7VB53gCU3iTUEc1cnAQ=;
        b=bm7ayZ6E41NUUZ0wKQEA5iOzf++9whM/JoN5KA7N7eNGAVTdQOv2Z4fUNEHcgzoDGQ
         IJqtJAxoYDiox7TIXPLaZlfZWbTr5s2THlUrBLyZt7y79FxJejOw4Y2DQ5U8mwYIGQnJ
         y5QiD8rUcwbcyTC/NvO2PzWOHK0UXXd8erBX7xd3xR6Rbf2fy5AGLBzljLC0yHqOAw7l
         YNrQICsX3Nced9SLiTibUgeKght7p1wVQ2NUTQzpBlANPSt/1YVdnwXM0UBrfQdAzwZS
         K2oVRlQRaMO8PP/Pqas+ipFNJaqziEMue0E2Wsr/NfT7pUxydEcr5kXlbMKFi7aw3TeQ
         48Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717254297; x=1717859097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMraijh7EdibSWZk0AZcru1m7VB53gCU3iTUEc1cnAQ=;
        b=F1/2xjuZHhvoXLpQe3h1Tvjr7hZshu+dIwOEZEj6Hg75zRFerhuDDCbV/boWpqGJqf
         kVyIy+LolrSG75ITnLVJsoagd6qsa2ZC/wx20TzylfKYGLoW7qok3wgSqba2VEbglgSE
         X83W9qvpmPT2diWg9H8nrR2UyhLP8OB6CCoujyQe4V6X7AIkd7hspONuSfHdU+UKJU7q
         XrAPyn7SuvCvRUSuTDRnDNbc6Cn0ddu3SOxYiRJIMp52vS74cboozBv5Kt9AaU+JJb74
         EaKXUC11gGn0n6J9QmC4vhR+2HPE9j5liXb0IzliLzwRlVkrwJqAD85xzAMZjkps5dD5
         Rrew==
X-Forwarded-Encrypted: i=1; AJvYcCVJVEZdX6IMYVadMc6mnlV350Ygu0PpuR73ZMLDn4hn272wTeM0QtMRvp8wI5sIT94n2FAvHbWuUMeR63xvDbjQyQ4pVh3hnoDVF0wcNPXz
X-Gm-Message-State: AOJu0YyXLhtfzROUph6T8j2+a+xeK4YtkDQWEm/dkGmSdHdIdeN09ocv
	FfRptI3gA+ufnY5n3VZP6Vw3yTjQ0r5vJ2u+ZRIHWwJWMjj5+FDUIcmv3XTGowI=
X-Google-Smtp-Source: AGHT+IEKmyacfHakdX0P9GQl4t/BNHOtB7jRjgspK3iaFW5wKEhTYgTuLeBLCF/OOGDElEGcu+f4Dw==
X-Received: by 2002:a05:6a21:32a1:b0:1af:ad46:cd4a with SMTP id adf61e73a8af0-1b26f16ea65mr5996794637.12.1717254296842;
        Sat, 01 Jun 2024 08:04:56 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6c35a4ba741sm2559410a12.85.2024.06.01.08.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 08:04:56 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v6 05/17] ACPI: scan: Add RISC-V interrupt controllers to honor list
Date: Sat,  1 Jun 2024 20:33:59 +0530
Message-Id: <20240601150411.1929783-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
References: <20240601150411.1929783-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_080459_226353_598948FF 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

RISC-V PLIC and APLIC will have dependency from devices using GSI. So, add
these devices to the honor list.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/scan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 66038fc731fb..6f3152170084 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -832,6 +832,8 @@ static const char * const acpi_honor_dep_ids[] = {
 	"INTC1095", /* IVSC (ADL) driver must be loaded to allow i2c access to camera sensors */
 	"INTC100A", /* IVSC (RPL) driver must be loaded to allow i2c access to camera sensors */
 	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
+	"RSCV0001", /* RISC-V PLIC */
+	"RSCV0002", /* RISC-V APLIC */
 	NULL
 };
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
