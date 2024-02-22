Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC80FC48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjo+s4WDy9bg0TyBd7l8vgRnZxHmHIlHJmvbmndkZxY=; b=w/US7ejEZPDoZg
	2owSpC7sFaT6g/vn1+VaMsqYb4QDnoSoxokbUNzky7rCnG5++kgwlZnjcs8uiaHPfF7rUy5BBJkLO
	t1xxG6fUBQ1xrLG0qjS5K0Edk5N0K5kbUABwIUj1sAZPc6B7aUOFE/RmaM+CH/Mtbh62WElanteog
	FiFVrS7+6FN2f14mj1XQktVeZhYW9wrzU/6wSgjo8S4lKA7pp366AZAzOY9Lw9Fqug/C5sp+XKv0o
	1cycPAoCgilOfQDI9OY++5D85mo5bh5BTxzuuvFBnqTL/9A/mqv570UxVY8hkOHd0Ya+8kUkAxXjW
	IMJl0X/VBI9tLMJyilIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5ch-00000004Kmh-00Fi;
	Thu, 22 Feb 2024 09:44:11 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5bE-00000004JU0-0hdG
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:42:50 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3bb9d54575cso1037624b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708594959; x=1709199759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTFsbe7fY6CIFM3QbszGAvcCN7xF4yBveTkrIBLrPJ8=;
        b=YpSoBgeULN1EoJhron1OTOdFOtb2YO00K0fRJ6nllsuLVEmGYiOYPwaTPBI3JzQn6J
         5vutXLWpxK/BsjK3Rggq2nlgYOUngvI5XT5aBQPdgty4fsPNtMqRe3KAAXQXIWS5zfHO
         y6TNZFMI9MiAGrjmxKbDRanuZcW2vmDLXyvSOkS0/+SjKRoJOp9Uc1vAKvTA2Uth4n74
         GhIxAHQo95fLNm83QVKyCW24dIzUIkA8x8I6tG291tGyEF/Z68G7ltX4OlPV2DwTaGg9
         Gi8qBlWWtTNU5YUTWRUH4WMIqysrNGmQ/04IZfvKitAK4ZeBq/gp0z2iC3TsOGNNchMS
         y8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594959; x=1709199759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTFsbe7fY6CIFM3QbszGAvcCN7xF4yBveTkrIBLrPJ8=;
        b=UEMagV8+k1ri22lJlTBULuMEOfdfZ6jxRj5820iq4cCsULkpbe2kQ5INQJeurDML9r
         eT6OAsE/Lsn3rxc/q5/GOz0NA8bNaNwAxdGKc7V3ibcoQ/BMArJcBBzehlZLrJxItzRH
         0bjlzUsmyZpEpuY4x7lynyiYQjmTP6R2/RfQdVGAw7Y/r+muoDnvpf8bHHS6eImsG0GJ
         GZEC6n3Juz8bL/KWu7mFFD3EUvRbydyynjQdwc2zXcfQ+4bJ0UR1r+dijnP3W2k9ZGua
         hOtb1UlhKXVA3o15OhpKpiRMmw8eLZ43e2vJftwEaqUIJ0SZS9zQnbg67Sdjr5yu3A5a
         uZ2A==
X-Forwarded-Encrypted: i=1; AJvYcCXVI5vpMA5IZ7hccb4QxxQ+KXMj0mNvNtzSdYcr0v+C3SBNlFFj/tBwZmmbA6FMxGRBV9sjFjjknkLHHWDyHC1s3N+hw+oFatbwTozGh1FK
X-Gm-Message-State: AOJu0YyTqztf04VEzd7+hACt8NvgjPdV0NhCH1cLie3e/BGyvSOwPGbl
	jCCUu3QldvQvhN9uHEHZNItDPYTziiYaaySrssvFL7Kb6yDNpkAV+u4LUqs3yj8=
X-Google-Smtp-Source: AGHT+IEdqW6jE4esiWm0SS85wFJdMrJDV0i9YNpT80P998X6W/nqUz42BQhn8vd3gyZ2d9UdV+lvyQ==
X-Received: by 2002:a05:6808:4496:b0:3c1:52b0:2ec3 with SMTP id eq22-20020a056808449600b003c152b02ec3mr22434124oib.53.1708594959018;
        Thu, 22 Feb 2024 01:42:39 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n15-20020a05680803af00b003c17c2b8d09sm130699oie.31.2024.02.22.01.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:42:38 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v14 18/18] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Thu, 22 Feb 2024 15:10:06 +0530
Message-Id: <20240222094006.1030709-19-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222094006.1030709-1-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014240_515220_A0C71EC6 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add myself as maintainer for RISC-V AIA drivers including the
RISC-V INTC driver which supports both AIA and non-AIA platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ed4d3868539..d948f9210f1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18801,6 +18801,20 @@ S:	Maintained
 F:	drivers/mtd/nand/raw/r852.c
 F:	drivers/mtd/nand/raw/r852.h
 
+RISC-V AIA DRIVERS
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+F:	drivers/irqchip/irq-riscv-aplic-*.c
+F:	drivers/irqchip/irq-riscv-aplic-*.h
+F:	drivers/irqchip/irq-riscv-imsic-*.c
+F:	drivers/irqchip/irq-riscv-imsic-*.h
+F:	drivers/irqchip/irq-riscv-intc.c
+F:	include/linux/irqchip/riscv-aplic.h
+F:	include/linux/irqchip/riscv-imsic.h
+
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
