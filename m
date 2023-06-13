Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E30EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhkk8x5JdD6x+3eTYXXPSHW9wMqufwLDeZ3C37zdvtk=; b=mU9kBinSEZjQxz
	h/3n5NXG2dQVMdXPshlHDX+Q6DKQ4+GP5FNRy19oYYJMpCSjl4EVZjcAYB6E6ctnu9dFnZa6aKnVg
	b8SxDWo2BLzIC63amdur5L6zx8FgajCzVtjaIXn6PdycgKrXPDikOo5J/IWNqC9+nmONDsV9MLnNt
	AoJmYQ0lnmpWGy18LStM1/CHGN1ev2swRuKb1Qt38aaAIr8aDfCenji4FpFvyFanE4Q4qMNb7P0Ik
	4IlCQ+SG1JaH6R0yz1yni14gQX2vPGXSHHJdcPGurKl8/D3CgPgSyrXZp9WtxA53xyk8KgqDuzRWf
	uU3QzLSQq08ZEk3jHkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q963k-008UGc-0u;
	Tue, 13 Jun 2023 15:35:52 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q963d-008UBg-0I
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 15:35:48 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-39ab96e6aefso3417869b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686670542; x=1689262542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2Xd9VrBwLbHtLKIQskpVMxqXuUIvC51FdoSD93zF58=;
        b=eoDG88MPohQdD8mTy13OLdX2W8nk3lkOY7N/bPjxNBYi0Vv3N8OVnfd0FU/nsMIMgl
         SsXoSqpVhq1E1lHktImYF6Ehvf6+LfsX8r6QWsdCWYRsaj+2kssVdlR4E75yiArARoFg
         VGPCHUGwSy7HUO3GHtnxBWwPoJx1RDH73dD1JWRZ4N4cifO4f3bDmNZ9aZrlm+mpA0pq
         GaFzQyLnUrf3j3rtMEjbzkGSRXFzWB/rI+GCfKBoPjbsC5mbpHv9ulNqZ/BxZEM3NSgy
         LUrS+4dmRel9oWXxqXUcrEGWFBMZOhtLij2yXuQovR7xCUgw+kubX5ePh/gS4vnvwEIC
         LmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686670542; x=1689262542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N2Xd9VrBwLbHtLKIQskpVMxqXuUIvC51FdoSD93zF58=;
        b=FlYIDQy4BctIdP0FNsXboAR0WW69eD7gx1Ca/NBaoG9QqHmcH7MYEzA30FK/nw3klA
         bwiarKgVMyGsv6c9HktghIR6bXsPriIEv20+m8C/mIxOszUpF8df1x6ShqQg8YPZomK5
         rLaw89IbMBj9teDnw3Y3vdjoi4EjwI3Qq5czqSda5sxwr0BOE6R8e3K5C48H19rIffmo
         xoAX8gxhWo6JmU0rUsbN/bHa975A6IVd2GjMpreUxIJwroQKwWyxedzfbTCCt672Ngt1
         bcyF3O8ix6AtaG5zm+PTGQkR/Vjw09r56FwLebA/NWr7QUsrycukt9gNqUBCN+otShDC
         CB9g==
X-Gm-Message-State: AC+VfDzAn9updyvYOIiV3bQO65SbLP6ZE52esg0mLSxfNRg1qZSr8lY5
	UPC3c2821QFeE8lZsuN6xnNbyQ==
X-Google-Smtp-Source: ACHHUZ4fGN6+pLsSEZtbSZN+RvQPBaMKXCh9QusFq41gaS7bI9BEqNW3PdifLeNjp8b1Uwl6EKWtOA==
X-Received: by 2002:a05:6808:1448:b0:399:169:75d8 with SMTP id x8-20020a056808144800b00399016975d8mr9406572oiv.35.1686670542358;
        Tue, 13 Jun 2023 08:35:42 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n2-20020acabd02000000b0039ce305ea4fsm1630807oif.14.2023.06.13.08.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 08:35:42 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 09/10] RISC-V: Select APLIC and IMSIC drivers
Date: Tue, 13 Jun 2023 21:04:14 +0530
Message-Id: <20230613153415.350528-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230613153415.350528-1-apatel@ventanamicro.com>
References: <20230613153415.350528-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_083545_130304_67E1A1DD 
X-CRM114-Status: UNSURE (   9.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The QEMU virt machine supports AIA emulation and we also have
quite a few RISC-V platforms with AIA support under development
so let us select APLIC and IMSIC drivers for all RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ff37d8ebe989..19233d59be37 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -136,6 +136,8 @@ config RISCV
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
