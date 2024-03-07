Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6B2C54798
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hu58tmwYaxG4OPY+LUBwZ51Qq6/aVKzx6RL4a0g4Ppg=; b=ok6N6Ch92eOW/P
	/yszIOwlKLRiG1HMR1Nob9pGiZhnp8qKcoQV4xwZbBjBR5/XN66t7hVERR/HqxBBSyC3JhxjYUK59
	IlA1/51hGudX61NTbSPn7+Hy7FBpzh/SGHds9P+/fO044EiHLnhGcHmrVBltgqJBlXlKUttSGBRVc
	KjzL9RUhn3qTefjCQBHyO4b0c1KbHX0/o5JzCoe8xKO+wB5Fhom0RkurW3lQig0jMb0rHnO99WWsY
	rppeYHWJjk/Owfo9nqcPLQuQZ0K5SwxassoF/fld/of++ZwWjzkGuYPukNGf8Lotq6tAJ/odYVHZM
	emk/E5rUNHRfrwYiNcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riEMc-00000004wRU-1laY;
	Thu, 07 Mar 2024 14:04:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riEMD-00000004w8T-25HA
	for linux-riscv@bombadil.infradead.org;
	Thu, 07 Mar 2024 14:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rjwrYvBNyQ/qNRs7Txb/BN/1bxuD6Rbun1oh6hMbldU=; b=hni5r8+DyhWAlZ2PS3WpdO9qGY
	rBwPKkkvkhJzt/+kESkV/JPZ61KKGWNWHxbOFdyz3X5lQfdhfduNj8Gw/6DcdNQKGT9PBV8zf9oXs
	MUe16goE8msHsi1QERCCuAqtGrMyk7GWW85khPWKlFs8gYoM03E6E3jFQ0UaxrYK2Ek2vzlQRoGQJ
	rpZvuaN2m1cnkRpexGqMszATQSYvfkLKouLjgG35LHUe4A/1oVzGJpYJFgJ4WBdtT1DktA1n2masS
	o6juVQ9WIJcSUPlRVcuYa6IUy1y8mtjpIdxUNWb7ljVEnX4IY9Hn2CxKd3UHonsuWE6hWweq2V4R9
	FTUimtEw==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riEM2-00000006gcn-08AX
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 14:04:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1dc13fb0133so7331595ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 06:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709820252; x=1710425052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjwrYvBNyQ/qNRs7Txb/BN/1bxuD6Rbun1oh6hMbldU=;
        b=YndOrsC2FTkuD8MueFuxrohfVdRd8Rc0JAvGJ3VZZJjEXy+TAfw5Wa6XXibfDqbSVr
         VIZGcT9GL5gdxNNR5kuokbeK0fS+balzveaCrV4WrN+k4TxMVxJB9HmYsUM1SEYUb0qC
         lUrd6DSsLC160sCcfSwQEVjmclM6h/04LaqKAvl0qZNRklEPoao1YYwq/QwM6/KupaPW
         uCnh52DLpfognYZ5biz5/wzfkjYsW58J4PcRVjPDNYOQ/O+sPS3jy3I5qqNjq9xnv2w1
         H/D8zFR063eP5OHNiSBJYUqHimlVGYblzATulSzraYewbnbwnZW3tptln+1B8ZU7mZKT
         gn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820252; x=1710425052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjwrYvBNyQ/qNRs7Txb/BN/1bxuD6Rbun1oh6hMbldU=;
        b=bbFA7P8BdX+0XsFKN3AzeLfFSDLNu4duTjlC+HlE9pjLuuEWnZlwMkurs55tBhtYgo
         6oVUkCrH7SCVjcq+VjbMgnWUqgqCeKqrgyDdo3V28HzA5v8qtJ961Lre2hpuuX+eO9r1
         7QitKdglPc5ahpCZZJ7mkH0Z0Y00+nNZT4MpDjC/FBn3EgUAU0CG7F01q2tUJepWV9o2
         ulILumKnHX5ok5zyUnyyCJwlWm5TbIqAsXMoGM6XGby+XIXITSAukpAuNWr0sN72f35I
         uMqg1xPUoJJKcWw/7+04cvEIEhbpngvSS2vGyIM4+Cp5WRG/IhsYVPNRX5Bi7RAy4/XM
         Mrqw==
X-Forwarded-Encrypted: i=1; AJvYcCVvbg8O4PsWeYFfBpvE0dCCD7YUlAK8czDVnLys0dOAELaJcxgD0zo/IdRyfaXuH9JbugXJJOFPdr9w5MvBTL6DXj/U94dhXATf8lYqNGLX
X-Gm-Message-State: AOJu0YzrD9oZeXxqVDnZ/DJ4ocC8f7IHbM71Wb89tX8Gr+pGTUEg+HLs
	ZqMtKAL4WAnRjmRy95vU3rW6ckgfyuSo6mQrqyos79VTWmIbp7HhzF56s6+MwII=
X-Google-Smtp-Source: AGHT+IH4vsjzsOStS+FThaKG7EnDgUZh+Gtnp0D2Nf7vkFgGFqKrbJUaxP4JwhRT8tXdH9oU6TvuQg==
X-Received: by 2002:a17:903:94f:b0:1db:edb8:35d8 with SMTP id ma15-20020a170903094f00b001dbedb835d8mr9704187plb.34.1709820252379;
        Thu, 07 Mar 2024 06:04:12 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.79])
        by smtp.gmail.com with ESMTPSA id w1-20020a1709026f0100b001dd6174c651sm386228plk.149.2024.03.07.06.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:04:11 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v16 9/9] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Thu,  7 Mar 2024 19:33:07 +0530
Message-Id: <20240307140307.646078-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307140307.646078-1-apatel@ventanamicro.com>
References: <20240307140307.646078-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_140417_488328_FDAE09D3 
X-CRM114-Status: UNSURE (   9.37  )
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
index 2ecaaec6a6bf..92efe5bcb3f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18803,6 +18803,20 @@ S:	Maintained
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
