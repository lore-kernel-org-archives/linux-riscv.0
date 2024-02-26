Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB52C5478C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 04:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkmveTYMFfZF1nTUugiRACOn5b0cPCh2IlGIxiPxVm0=; b=0z9vvCLrMKWEXl
	UM2DyazEdsWd+sEmPvy8GQ3hC3m+KxrGVeFqczWWTT8BoPoU79HQYm83S6giEUv++j8TDnVvVJzhv
	5aSEEcdArXw0ovhh15nkLDBdmeVT9zkxLSdI54pT1Vm1Bd6dNPFh0eCjmi8D274WTSm4fSGAXy+i2
	AgNOSpFnLLQxKreDBg0vMZeh8+IMbzZo/uIMf/t5kOByYpavdDEuYJ4SVwcjJfzfnxgWqu6scJ+4P
	nFw7SvYFMMjX/fYi5rMwhIf7pvcoZIDlF3wzCjK1swS2VDYKKvxmu6LzqcOaJbtmybad2/I1qJIfT
	WAYhGp4bki/Ea9iJY6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reSKL-0000000GOUp-1AtP;
	Mon, 26 Feb 2024 04:10:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reSJL-0000000GNlX-0lct
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 04:09:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1dc418fa351so12413305ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Feb 2024 20:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708920590; x=1709525390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71v8gbBOdtXGvo9g+2jtAQQQGBX8E4yEXl9JiWYqu5c=;
        b=bg50qCy8+Nuf4WSdirvcSbWVkvqmBfSJUq8lnrN9BI8PmqmtQUjQ0Qx0DdB67hZ1qS
         pKeElc/8gCSwuBo9BVeHnBGbvSlxbSywADIXymvCIMOYWBJjB0SqRtne3X7brxZNcH15
         EzDO9uH7ub3yUtOHoir9kRh4fm6PRefj1NemUCBdLaayjWOn+trNjme57MWh/YCqGKj3
         kmvc6rPNijnEm7ps7cpVqR+GRfBy4JxyvYOSEs+b5/4xNXgu/NAPgrUIDALL/sV01OIv
         skQt3mJPny+BrcAsadh0/mBWGb/yea+xnbc7tZiNOhK0RozroqyazbVjPPs+S2AIGN7W
         SJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708920590; x=1709525390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71v8gbBOdtXGvo9g+2jtAQQQGBX8E4yEXl9JiWYqu5c=;
        b=pFclz+fmcVGuMat8N2a4BTrmRc82nKVjN/P1gNBz8VNUfUojiSVEMkBmQIqKOzoYkz
         oujmUB/tYjq6E+bj6d3g5aO2mqDrvi/ZtVehiVWgPUsAr1SJjf+AJ9Ocm4z4wBGpbuHg
         SJ2albwP15sZPMswMvPl+C3ceQSuh2GDCUMatLX2SMTtL5bl9eDmUAufKDNUp582HvBx
         K0V3fxMPOhv5+bOJ+yS6AI7jc+Z/SlfIkhfrhTSqi2NQ72oFq2LjjCSjqOXwN1CWLREw
         GX+ONS+6jPSF590/HJSe3saK3/qEpTHfEydEsts3JrsxVbZUW1O9oKEUlkMyo0/bYYk6
         GAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtSL8r8kePQil9B2XJPNjO+bDdrQwxA6i6YeGnJgUt8xSHrNCIk8MmiE3WzFMmEtR+i6Of0Jb6eJJUCurRxpc9pUB9R5hnSa7Bw5TYFyqL
X-Gm-Message-State: AOJu0YzwafM7AwqcpkOsz2Q9sQACBnOy9g+Z7d2jjwGkebngljpQK5fR
	lKrCDjeMzorwyjOO9cya/r75OPfAWKH7VL3sTiLwE9mhyz3kzXKXDEvp+dSCW/4=
X-Google-Smtp-Source: AGHT+IEwlanO4JPKzdgN6wkOm19zbqiNyltkZpN8bf1Fq3GRBwTmQiinNj/aHk9GOAdxbUx2fEyhNA==
X-Received: by 2002:a17:903:120c:b0:1dc:1df6:48d3 with SMTP id l12-20020a170903120c00b001dc1df648d3mr6878693plh.17.1708920590363;
        Sun, 25 Feb 2024 20:09:50 -0800 (PST)
Received: from localhost.localdomain ([171.76.86.62])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902654b00b001dc6f7e794dsm3023258pln.16.2024.02.25.20.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 20:09:49 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v15 09/10] RISC-V: Select APLIC and IMSIC drivers
Date: Mon, 26 Feb 2024 09:37:45 +0530
Message-Id: <20240226040746.1396416-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226040746.1396416-1-apatel@ventanamicro.com>
References: <20240226040746.1396416-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_200951_517632_B6D40060 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The QEMU virt machine supports AIA emulation and quite a few RISC-V
platforms with AIA support are under development so select APLIC and
IMSIC drivers for all RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffbd869a068..569f2b6fd60a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -162,6 +162,8 @@ config RISCV
 	select PCI_DOMAINS_GENERIC if PCI
 	select PCI_MSI if PCI
 	select RISCV_ALTERNATIVE if !XIP_KERNEL
+	select RISCV_APLIC
+	select RISCV_IMSIC
 	select RISCV_INTC
 	select RISCV_TIMER if RISCV_SBI
 	select SIFIVE_PLIC
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
