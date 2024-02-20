Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71156C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 06:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjo+s4WDy9bg0TyBd7l8vgRnZxHmHIlHJmvbmndkZxY=; b=iflawBOFBFCAdB
	1RtaTDf08TdYfjlyH2hJcXCisT/Jvf/cylOF2kfbxKzTk3HdionZKmqWiSzCuKMN7ghCfpPsYh1EH
	b+JarcGS+4O7h8RzAalNF1vGHKLkAXGSoDo+hvqQCEU9Kvt3edjWGjv+vxCd1oX1yEBkd25fdpMN6
	0JSfSasnHhURx+Mq8Ucls7cf9XC7xAzP0ojMkwfr/K8P+rmJOT44gNH0N93FanfrGuEIYea1eitj+
	Ksb5l/NYrLKM+ExxsJuPCb7oVdlD6YTolKdyLJKMfpcU8R/MM/0lybVBbwFMqorhxs9FW7EOb93Jp
	leG+oOawWl4bfzctDmLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJKj-0000000DJMX-34Iu;
	Tue, 20 Feb 2024 06:10:25 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJJP-0000000DIPx-3JT8
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 06:09:05 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e22e63abf1so1577434b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 22:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708409342; x=1709014142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTFsbe7fY6CIFM3QbszGAvcCN7xF4yBveTkrIBLrPJ8=;
        b=AdD9NZ+jHtbRFhfhfafeXpX8eX/53sjX8IHIPiBj/GBqHP8nUtkcxma+b8i3M0GEGu
         oRBMjsNOJTZXTu5GWq7ql8yfCukyOVo1v93OnNcyyWs2V0H6O6+eJlOVryK3sM/nI8w0
         lc1OovyJldO4uwtG8/0vE5G8ohNIeaXHglvQ2AWVtTcMWlOHooU9E3nTTGM3uDan3yrm
         BijjXGz3t+Ri0GoCaLKRhK630uPxVSAWV3+FZicyZmpKvfHq6xYVX/FtrAJXdSBrX0Yr
         3PBrREHjbmdQveGdJ0g3Yn6pXAJsgcDtciNZLUyeneOD9mOHYiEOyzsHWsf5/tzQZ1UF
         XgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708409342; x=1709014142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTFsbe7fY6CIFM3QbszGAvcCN7xF4yBveTkrIBLrPJ8=;
        b=ugaHRdFBa2+pBaZvueJGaTPthQliI5NqySKfWJXezuLBoEEcYnUo3qUOXCktmh/iEf
         95r7Iw+cji2Q7OQHrErVkJQU9oF7Wyl1kKpiObew1dHjtDJYRQT3z/DSl8ePQxvAXrcv
         lvtADwUoNJpGK4NmJCsa7HmZI7ho7d1tPEQUWkwkPj4q+Y8vb9hVm27m0G1dgiTXL4QX
         2FfAoBs7dB6bAWCCVwE7a8pwwX0URJ3E5BqxCfa7qEFpSdU7n3L0X0zSoOiQIQOtTQw6
         JV9220dzzeQVIQ1xrCsAYR2gSg0JZ9kAMH/Htc7zSQbjJ5H4yRkxxq7C71OXvG5tftbA
         ZQBA==
X-Forwarded-Encrypted: i=1; AJvYcCU/cwjvuQPkjGkJzkTYx+MY15/VICJJxMzxOKLy3UtQnun6XFop5Eglp6McX9wMb6Y+M0ZNnaMkEIxhCoCmUoDxbgX414qI99qRKnSMN5jV
X-Gm-Message-State: AOJu0Yyjx4dmiWS+/Ys1L9MZ4yvVmVTJkmy3hjG7r6iwYmkN1igZ3KL4
	MR/vBXXdvks4HlihuFnVsM9XVv674e6NUt8hLqHMJSXKgamwfXXYZ0H+JnYmqrA=
X-Google-Smtp-Source: AGHT+IEBBH3jBOTouE3fPQJ+zX117KApfGEgQ3veE5qYZqE2RMAHzwyj/h4hK1b0zjfKKWY60Y75oQ==
X-Received: by 2002:a05:6a20:93aa:b0:1a0:7fa2:305 with SMTP id x42-20020a056a2093aa00b001a07fa20305mr14510461pzh.47.1708409342479;
        Mon, 19 Feb 2024 22:09:02 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.86])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090276c600b001db4c89aea5sm5368114plt.158.2024.02.19.22.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 22:09:02 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v13 13/13] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Tue, 20 Feb 2024 11:37:18 +0530
Message-Id: <20240220060718.823229-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220060718.823229-1-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_220903_973109_050C04B2 
X-CRM114-Status: UNSURE (   9.71  )
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
