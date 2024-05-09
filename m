Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44E9C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 07:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8K6mHIggkIISY3EjrYJUB6h5KmPA4/cf+aXLkhGmWg=; b=mnYMjh/YzhXIrq
	xnPY4y2DeCo2WtpEBUgyAcRGmrLIKE1oNb+8TWUFimuIn5GuEfq1bGFe8Fyz2Soilb24asumNOkqx
	MReirAgLDrrXGhZQpCqkggzooz4XIn3emjmpJncYG8WiwNpzG1SIgygtGfejmp36ahEbdoWHCxeFp
	swsN4ETyg2R8MfbFYttvYsASw5/cd/NZCJoLrQoKDr/HukfqrdxhokzVdkV+Th8tdxsnVQv4R9hVV
	+Cs9SoR6VqOoIYvKLNUzufNiiaROgdKSvnJb1nwy5yWeWZ2bZ+6FdZoO7tTDjn84X8Xo9lSeIuGZj
	T0hNthWDlZS6omK2vzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yI4-00000000heC-43w4;
	Thu, 09 May 2024 07:34:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yI2-00000000hcT-08uj
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 07:34:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e3ca546d40so4369165ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 00:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1715240044; x=1715844844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKyIwcUjX1px2GE9S/CV6LaiV7WK04/0FO5MZQuO7/8=;
        b=VQ04s0Af1H5cQllMrm/Q4+JkAc3rEyaE55quVMipMK76eUTszvz9LcAxzU3AIroCPh
         i3ILHbYQeHzG1Zo5uEtmRzY1NS/9W6+sr7xSErZt52bf4O7vtSdwZnMRfSRxju42cTlz
         ds8bDM+5uNSCtwAFiRAdWhj3QNZfxZB5Cg7l0zdBycU4eaCUWpCjHPXDp+z4nJcYGu3e
         ArKqDhcQyCGYaxEqjbwqpbDxq3msAAKGRwMSYx737jzPyRtyxTdM1S0x4A4kIH120MT8
         iO/B4x8gKJacAYKAad9S/GNUUsEhN/IgtSXT8A2dQOMlXZC5tQHGrgDuU/ZfJjT+xCh/
         i67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715240044; x=1715844844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKyIwcUjX1px2GE9S/CV6LaiV7WK04/0FO5MZQuO7/8=;
        b=M0jyTW7IcKCVRGOOQ1VWro7YyRtekEqb+fkFH07tE+AOGSqRkZeCoZygKpScO52nzm
         lKQ5mXcM3yICCrqbKmq8OVQpmt3vO3QjOJ+cXrRjknCdKB3OnlI2QPf8hMyyjXsj6pG8
         ePw5se+jiXb30P4/AuQeZ53+jLpBOUtf59LgRDyQAAzcwMn6is1T/KbzhJ4zmK2z+2b9
         AQu24d/UUoaeQEVAQghEkHoK5ho32Y4LRnRqQt70KAN09AXTHOHNEEJZUYzD65BAeDRA
         oXgGcfLCzrWf7obkp2fwLiozxiH9HB5RncnJLjuA8xqcDZU9qJvMs1aN7tbvJenMCzb4
         AusA==
X-Forwarded-Encrypted: i=1; AJvYcCVpeaAvXzLRVXO7kG3sPdAcx4qZfAtiwY+Z+Nbw42pJ95xGyy0ttquvGgwTBuhoDhrv2TmKW8Hl94h0p4l24E6GPbOgp9DWLDj8iYm1JdYt
X-Gm-Message-State: AOJu0YyHVlzWPmLsdqLT9du0jKuAnxv+qqixj1lIis1HDug1QF8Z9V9j
	992ICl88CXwiDfXl6gwqp1GYdimRiHU3/Cpn6nYLGvJH55DIeez56/AhaenbJFc=
X-Google-Smtp-Source: AGHT+IENrFpPXQtPzNwMxYR+E7KfhtE+rzld4e5iGLrKkEoGDyF4zweRjT/2jAKH/f68/NFj3s2ryQ==
X-Received: by 2002:a17:902:d183:b0:1eb:144f:63b7 with SMTP id d9443c01a7336-1eeb078e5bbmr34244655ad.56.1715240044153;
        Thu, 09 May 2024 00:34:04 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0badcbacsm7519045ad.97.2024.05.09.00.33.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 May 2024 00:34:03 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: rafael@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	sunilvl@ventanamicro.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	bhelgaas@google.com,
	james.morse@arm.com,
	jhugo@codeaurora.org,
	jeremy.linton@arm.com,
	john.garry@huawei.com,
	Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com,
	sudeep.holla@arm.com,
	tiantao6@huawei.com
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v5 3/3] RISC-V: Select ACPI PPTT drivers
Date: Thu,  9 May 2024 15:33:00 +0800
Message-Id: <20240509073300.4968-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240509073300.4968-1-cuiyunhui@bytedance.com>
References: <20240509073300.4968-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_003406_253961_A18C5072 
X-CRM114-Status: UNSURE (   7.57  )
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

After adding ACPI support to populate_cache_leaves(), RISC-V can build
cacheinfo through the ACPI PPTT table, thus enabling the ACPI_PPTT
configuration.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f961449ca077..a9ebecd72052 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -14,6 +14,7 @@ config RISCV
 	def_bool y
 	select ACPI_GENERIC_GSI if ACPI
 	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
+	select ACPI_PPTT if ACPI
 	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
