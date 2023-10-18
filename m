Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC66C46CA1
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2Bkxltp0zAfPmhCTLt0CiS5U20kPp4+tLuyC+A9iRU=; b=E9NhhKTYzFxD4d
	P2kP9xX6zNo1VZ4BnwALTc4C6FL0QfMWzl381DkWcKM0y0pC9CPK/v3QjUn3otzqJcDBJYXbdDvHO
	oz8rMucqzmP+JilI3c9Y07Xf8eGBO+2tzk0UDdAIjCvyxVCuppP8fZtks59/DyhtKKVCLiTZgjcbK
	Welisp3GHvj0KxAIwwQ6dmCNUMFx2dvokHohIDbVC7LK+wk3N7hze7OLW/2yqqI1Fs0rX69eccJsh
	d8kK9OuRBWTFYZ2u8yPQi5OtsY+8v3gvj5QzHxptxrCPI6PCl8MqoE3DtECBvf6TW10EPAB7i5vwX
	UgvlZCHZeH+by+zEYg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt5qd-00EgZA-05;
	Wed, 18 Oct 2023 12:40:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt5qa-00EgXe-2O
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 12:40:25 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6be840283ceso1341602b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 05:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697632821; x=1698237621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgXGiaZbK4m4HiMVh4BDyfHZ4ZNWdeAQabBtO14MLJk=;
        b=mZJAuE2frXpYsftTyzfCTRudHn88p3zq7FOKAi+L5p28ECi9RY+KXLYuJAzqQ/fPTT
         T3WMb4z5zbfF+I64ze08+ZSsF4Dm3vKuN8N7KMgyaSt2FlZiYiWv/4WPzBgn1wwSeQgJ
         HeOaAgYXLMpnbi5hoI7V9/GlzTsL+3tIsD5/xdmfUge8dviUf1KB5vOcwT1nYyZFlujC
         59BQGLucBO8tRlh+eX4uLwqkYFrKPJazciv0tC2heciViJ76JS7rad+U257p7n25NEMm
         6vhA7I+3P1H77ml759p0VSJ82hU0OVVtZvw4sQ5MY+SFi/JsOh6+VQlpJoGkM4Nthc9z
         iY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697632821; x=1698237621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgXGiaZbK4m4HiMVh4BDyfHZ4ZNWdeAQabBtO14MLJk=;
        b=kRBNvX9zpyrG4okKy/hKhlStKFfiSsLVnBalfzOcTyLJHzDXDmKvBxJcDZCiloMQtZ
         jmIFjJWlMf7xGIANP4pq2OHeXgLcBijoveOjcXofAKxYCoR0juahM5nzqsisH/7gbBAP
         AH+AJ4ga6E8JQfMisoVjciyXWWm+jzEr8DWz7WqjYH/yp8Bru2Tw0wY4TpYd+1dkSOrV
         1pgzq6534KvLoBrgUvZx9sWZ3fWdKkqlRJongYwqlg59XGpWb0oxPwXVLBPj9qRT15hT
         IBJRkSvXqINyusjsaFzBlBb4XpYIEAUxAeSbwHJvLd9fiW0HzhoqJb5mM+d5JpvBzRCZ
         8/Aw==
X-Gm-Message-State: AOJu0YxyJLlBT2Vtlr+8FXdGIDMY/mbZgAnLi7hKTwsCFrUSuudmw3eq
	NLI0Q6zkCuwKEqW7VCqtf8UY2DKZBxi30FYfExE=
X-Google-Smtp-Source: AGHT+IEOXc4ISTOwIN0PYiJxHemUpiZ9Jnc0yw5gquloNFV4Vfe1Ujo1EM5hhYV3wl/HOMx/JfHSfA==
X-Received: by 2002:a05:6a00:24d4:b0:692:b6e8:ce88 with SMTP id d20-20020a056a0024d400b00692b6e8ce88mr5494314pfv.17.1697632821422;
        Wed, 18 Oct 2023 05:40:21 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id w190-20020a6382c7000000b005891f3af36asm1599267pgd.87.2023.10.18.05.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 05:40:21 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 -next 2/4] RISC-V: ACPI: Update the return value of acpi_get_rhct()
Date: Wed, 18 Oct 2023 18:10:05 +0530
Message-Id: <20231018124007.1306159-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231018124007.1306159-1-sunilvl@ventanamicro.com>
References: <20231018124007.1306159-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_054024_782760_FE422E56 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

acpi_get_rhct() currently returns pointer to acpi_table_header
structure. But since this is specific to RHCT, return pointer to
acpi_table_rhct structure itself.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/rhct.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
index b280b3e9c7d9..489b0e93b1e5 100644
--- a/drivers/acpi/riscv/rhct.c
+++ b/drivers/acpi/riscv/rhct.c
@@ -9,7 +9,7 @@
 
 #include <linux/acpi.h>
 
-static struct acpi_table_header *acpi_get_rhct(void)
+static struct acpi_table_rhct *acpi_get_rhct(void)
 {
 	static struct acpi_table_header *rhct;
 	acpi_status status;
@@ -26,7 +26,7 @@ static struct acpi_table_header *acpi_get_rhct(void)
 		}
 	}
 
-	return rhct;
+	return (struct acpi_table_rhct *)rhct;
 }
 
 /*
@@ -48,7 +48,7 @@ int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int cpu, const
 	BUG_ON(acpi_disabled);
 
 	if (!table) {
-		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
+		rhct = acpi_get_rhct();
 		if (!rhct)
 			return -ENOENT;
 	} else {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
