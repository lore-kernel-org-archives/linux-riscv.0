Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26119EE3F0B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 17:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15evagqHDKe+tb4U8K2zVnW5wN5yE2Gh1NwpG9iItWY=; b=Q+V6HE3JjkOegY
	C6r8vRIDlWq9iC2pfJ60o8RT+Rp4nSSOwR+Fn4Y8pnYL2TKPIpX9rmy4buWCzJ7lTr7tbWCVZHRLN
	phrgAI3pLM1yU6Zph5axQM3T1dY39o78ZQnBLdscaLvRixKgBcx44ye4XGWATiHzIp369J+3Tk1Aw
	U4lF/5ZtucLRSgI7q8TTvq8szhVpYVGLxnlBcacY4gdVR24Lwp+AxvCLoOqOs47tymnK17sYNCM37
	YC2Iuuu4ZFnHOIQE0FN+v9mxS9XxxGEy6XIyfvhgKvmpGnMSDVQ5Px3PQKB6G1UzZEOuNP/7KV3/J
	Jo5v437b33L+ZRgmdnnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7YN-003wYq-2K;
	Tue, 12 Sep 2023 17:51:59 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7YL-003wXV-2P
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 17:51:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c328b53aeaso51653795ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 10:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694541117; x=1695145917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqTrA/em/7YP7OpnvHuiTizJO+kQoS+OxvFJurohpH4=;
        b=Y5ZIm4cG2NrTbdAx10/tE84rij2kMavOwZGHD6tm0sJyLgW88UxjiluKkfFgiD+ZaN
         822DAfahzmXnUwlH3+8ID7QF7ayX2t0GtiJodSrVlf6/1G1jzy7O9lQK/KP44238pabD
         uBV4ta2kOa0x0mcAmJ6glCVbgN53N2ZsofBT+EU82Y4gS7ibsyuks7c/RIV0SJ/Vkvie
         foviHiXpeZN2GLaAnXG8sjBGZZkHM5R9zwve7dHGqqKjMDQ9vZPyG/K6jBmEFCrz0DXN
         sUxgTIGM/wBPDATmNJf/nNV6yG1kb7BWb6xOtXwX/V0rWbCQr+PSBmejNy/cJSFke69z
         BMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694541117; x=1695145917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lqTrA/em/7YP7OpnvHuiTizJO+kQoS+OxvFJurohpH4=;
        b=MoUXklQv4g/7JylekcZrazs0FTVmPabV36aRtcsbO5sr3nau3ttXj4BOrllSPmIA59
         4nnHN3/ytRHrwnUtMI83XfnVIoN6bBbfvFV2pEuYGkqCOKEKnjqMKzWt9lu+3kyPlSW1
         aYITXIV8yMUL6SOkeAj7VHn0HaG5ucamxgC9pKfKIhZ9I4wgXss05kx7LusFMuAld+MY
         HgifFXZX4pBokcXeWA/qgm7U0gHTVm97ccLjPGb9eRlV6lMfgIzKzZarh2xW5aUO7D0i
         No7FKv0WyFXCWuiMexMbTOczyBr8H9SoeoeoNhdkYxTrYVITX1pBBYKAjEO7BPvSxp9M
         t6ag==
X-Gm-Message-State: AOJu0Yzz8pGkanFlmIF3RLoztjCVBDKcQ05reRuYWRmzCYNxPlGMtxVV
	x56FolA1rlfU9Zlj3n6/cmvUpg==
X-Google-Smtp-Source: AGHT+IHOMQAXHvGEr2Yq1QZKOwigoSQ0NlNzZNLT28V0wdL+L7WZASn1nNWQSRzQerV7jmwBNx3jZA==
X-Received: by 2002:a17:902:d2c5:b0:1c3:5d5c:cc99 with SMTP id n5-20020a170902d2c500b001c35d5ccc99mr369320plc.36.1694541117116;
        Tue, 12 Sep 2023 10:51:57 -0700 (PDT)
Received: from localhost.localdomain ([171.76.81.83])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902a40c00b001b891259eddsm8691440plq.197.2023.09.12.10.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:51:56 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v8 16/16] MAINTAINERS: Add entry for RISC-V AIA drivers
Date: Tue, 12 Sep 2023 23:19:28 +0530
Message-Id: <20230912174928.528414-17-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912174928.528414-1-apatel@ventanamicro.com>
References: <20230912174928.528414-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_105157_790658_18D379C2 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
index 90f13281d297..6f331ac31d27 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18410,6 +18410,20 @@ S:	Maintained
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
