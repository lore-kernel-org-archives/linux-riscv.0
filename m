Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD78C5478C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 04:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjo+s4WDy9bg0TyBd7l8vgRnZxHmHIlHJmvbmndkZxY=; b=1aQFYyd2T7/jfK
	0sbI03nK7/rKpkOyDN8IIulBV8dZZcHfx4jpB6NOYHS1bjHzVnVZKwTREdowIb3mDx4/0Ae6Dg5Ea
	G+VOnSFSea70G9NrqwtxKd5N53CY2XEt44E7THVMkn16LygOBNgI3pEkzvrIq3Dm5UqXymq+0wye6
	buDbp0g936a8lIrgoXz0LDb1vdFfX+IEGLKsBntjhJCx+54aFX04Hj8FybO7otvV3eneRjReQ5Sub
	eGWfEQIKf+7D1JMyMGSyVrcpD3a7uHD2AOsaRUiLo7luCAhpbJHd/09yiL4F5LMzUtvvZUQgOdOuq
	MM4paCfSzorn2FTd7ziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reSKV-0000000GOan-3NMA;
	Mon, 26 Feb 2024 04:11:03 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reSJQ-0000000GNpD-1PIH
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 04:09:59 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e4751b97eeso970787b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Feb 2024 20:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708920595; x=1709525395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTFsbe7fY6CIFM3QbszGAvcCN7xF4yBveTkrIBLrPJ8=;
        b=CgTp/ctmcEhxAh19/wbFmAlNC7Aq0fnBJkZmA/hjzhYegVRLBcK/hDHo7iTK216kPI
         MsYmhBAucSan1M3aG98OBqchGwKJBEBuPJn3wFWAwkx4fe2fiwU0JDREYmHaDHe6Ukcd
         uukVoDUJ8Vu7G6XQWQNJTap5SkhWknZ8lK9X7BmFxMPGdoSi0dHXD/f0CIt2MPkrUKX/
         VgPLVfIzSs/05dBD27ySCyGj6zTo3XjODcDnLBTfUx3c9fgIg/uWmXxuRGwLkoqdQWjM
         r4GiYi09jZ6RBLe8U7hF1B6A4hPhMcXZPYTotPcf2RgFW+oqj6G9HTE67Ies4wjsTgqB
         s8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708920595; x=1709525395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTFsbe7fY6CIFM3QbszGAvcCN7xF4yBveTkrIBLrPJ8=;
        b=nkrwQAOf+0OFVjsi3ltaFUUXvfm+oSu0rPG3CCBflFzeixi9LgbFg0Z+/m+ZH8xWol
         lvZk9SUdKn2pgfrDk9KtXPMBr8uDc112UeBubbJtrQoCijL5/ZTAc9DGFI1/YyUPISqA
         0wwUWk/bZH5UwzLrMmO3pit9ie9HWCGKlAg8/7RfCamf7KPargCMc97LzGGFmM9ZAd+j
         Q7U9CrQNU0QgmEgtQeA42GJKOW5vOvEmcS8d/u0po7hVct9izVhBoLDEVUjJut7YYZUo
         jt5MWawPXpPscZv1i1klS6qNFwxs2b6aHi8nxaQ0aFf6qQfKIwpdpFs/DSIoBvPfX/8Q
         OSVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4/U0ZbOVoQrhAL8YBp47Rzg92RR2pUEQas+bQwD+zxqMFaluIBwHiDGggyxcwKBycpq9mWHPFb1jUhiK4A5nNSWTZRPcoKHIV/BuBGZfC
X-Gm-Message-State: AOJu0YwHpOu6G2B9ow6apcJV6qlTJUij+BaqFoM3sgQ4Ve6pQhxWg7J9
	2Yn5lejm448zxrVOfME2bHOzV++7PqIBOe5jDiyhKRSn6Id+/ZokFWT0Qh5lbPA=
X-Google-Smtp-Source: AGHT+IHj9OgwVeQU3Cywg5QOFfuPC+ebRt4KQX5RwmYYiHt6jMDZHnRVOUIEP3MvR2JMPDXGFDjhPA==
X-Received: by 2002:a05:6a21:350f:b0:1a0:e8dd:f488 with SMTP id zc15-20020a056a21350f00b001a0e8ddf488mr5082090pzb.3.1708920595534;
        Sun, 25 Feb 2024 20:09:55 -0800 (PST)
Received: from localhost.localdomain ([171.76.86.62])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902654b00b001dc6f7e794dsm3023258pln.16.2024.02.25.20.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 20:09:55 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v15 10/10] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Mon, 26 Feb 2024 09:37:46 +0530
Message-Id: <20240226040746.1396416-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226040746.1396416-1-apatel@ventanamicro.com>
References: <20240226040746.1396416-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_200957_071441_34863B9E 
X-CRM114-Status: UNSURE (   9.90  )
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
