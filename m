Return-Path: <SRS0=n1sQ=GK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051A4C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 09:27:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 987F82312E
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jan 2021 09:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 987F82312E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=si1Iwve9h3eglvLVTFSEckFNVFqYLSOVwnzS12u8+CY=; b=HZNBlc58iz/WxWJvDFoztyjw4
	HGkoEMeCt3vFlh5XJC3HoOEhmnDbp9LadGeHdJLmOKuzsqaZTywhtuvRGiP0iT6L2Mxmj76ze8BjQ
	a+Y5wHYGY3LtNg7tVrD7fMFNJffhpwzu0wdF3HJmdTIvKbl69w+8Re3BGphI39xKdMrYob8Gu+ivM
	Tvu5QMbHLWVw1TZLVCae2S7qznMwz6YqBF5XTTj5iQOh8pSjSnXQig0r0rbVv8H6LJPVaDo4tiYRw
	PHpHWW6CXn1ioLysAS5VOBczPp+hIf9RWSWo9eSwM4QXdkaf5qVPYDaJiFfMV3ml+rdtQjWWrOtES
	Uzh8m6Erw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxRZz-0001Ba-7t; Thu, 07 Jan 2021 09:27:39 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxRZv-00019E-I1
 for linux-riscv@lists.infradead.org; Thu, 07 Jan 2021 09:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610011655; x=1641547655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JbxwQXAp8/3z4IWi+Gua7LgpjZZA1rYhUXq7awjP4hg=;
 b=C0R26+rShMPIy48AIxhoOc/o+DNM9B6yaAbQ6MsBH3OObQb1T/lMmebs
 CeCFHgGhhzYEk9mzYwwiQfxMllpz5gxFtNvQtJc9AZ6yfTIAzrnI0i7eI
 2q+4X0dY7WI6nb6rBnLItosQRpH3E6yg7pO3OenbvP7/w9WMdqxZLLGi9
 1pTO0/nEJ8vSYLwvwUyQSoa7LZKwrqiySf5hDBJcPBSpURk3c+KmeIrd4
 pNtxAXIQf7uU+MNi3gz2hbPpW4SepkwNm8hsBNGkDvfCdCWc6ea7X6IqN
 RDiT50tHo4NNzxFyR4aH5QsHT5598mpSyRSvm1v5ENTnLrvlsjQrg1n03 g==;
IronPort-SDR: cvWQtrwZ06gtHytdLTDQ7WyS7/WKxJYJQrQ36KhMDBZlU21FpKky+x76g4TywICtW0DivpH6TV
 z5MHFBFcf5EuCknol+49lIHdIibtDFGqyGP23rTjopwa6MMXTlEB9x4cJ7HIlOG0X4yoyAQk8h
 0995ve2hdrydrEPSNobUlNGMerk+LzMjqkRpKTEikhFwFeSo9u12z8YM+G2oBWRlVZbgOG9SW5
 m5CnB4QIKO0UQ0f6kvcj9L7Iv4xe92HWtL8Dx+hXvULE5R7nM+DqD0IQzJvqagVeJaEHS89uCn
 f9A=
X-IronPort-AV: E=Sophos;i="5.79,329,1602518400"; d="scan'208";a="156751196"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jan 2021 17:27:30 +0800
IronPort-SDR: AdwSKgk4scAGci1c+ZaZ37zVSgQ9GFomW7TTT30b/JGO5OCTrP3UrNkYr9AiBr8RzMUuxNpeQk
 2urAD6L8IbpODQt6PGSVnpGHS+uC3RQJi4UqAaW/+DdOggRDBoAyWZnV21Rpu/bwcPtRYZlqeO
 1TcIwkApQKrniPrAf//c+UcRo6M27eVUnp336XvXWiyP+AI2olCs3II8FezT4VVzNuz8vNdP6r
 znPuZbJPZNq82aJ1djnhfZLGd8LNdiZNXAdiCx5HsMhMEjcyVGr+YXMNI/hBKM4lc6M3jGZGdM
 dpSOUmy3YUyoMFS7heU89eGA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 01:12:22 -0800
IronPort-SDR: ijzR/wHlOB+9SpHSl1Smyc1/40iR2xT2DOt6Q/lPeC383NbJy2iGpBzrL7+jBDKTBqem+vyyZl
 J7uxDWuTesC2mrzZGX8Mn65QLuklE9mnZTRH71dbECceulqD0Cba0Cr6k8tLezR58Nxud+O+OJ
 o4BAddTZ2ECsjm8KbDSYoWUzI5Ui9cIFQJ1f07oz2EPsybKDZVEwny6UJBpMNxxkYvhMfy/mUi
 /tf3EcqQeQJwTFJiQD2UYQqxjwZlgS3xL7DKqLFu5G6mrEmfl092v2VLuJMdfP3b4I1QyRwlye
 mgM=
WDCIronportException: Internal
Received: from usa002483.ad.shared (HELO jedi-01.hgst.com) ([10.86.62.136])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Jan 2021 01:27:30 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] RISC-V: Fix maximum allowed phsyical memory for RV32
Date: Thu,  7 Jan 2021 01:26:52 -0800
Message-Id: <20210107092652.3438696-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107092652.3438696-1-atish.patra@wdc.com>
References: <20210107092652.3438696-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_042735_770550_0E332140 
X-CRM114-Status: GOOD (  12.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 linux-riscv@lists.infradead.org, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Linux kernel can only map 1GB of address space for RV32 as the page offset
is set to 0xC0000000. The current description in the Kconfig is confusing
as it indicates that RV32 can support 2GB of physical memory. That is
simply not true for current kernel. In future, a 2GB split support can be
added to allow 2GB physical address space.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 81b76d44725d..e9e2c1f0a690 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -137,7 +137,7 @@ config PA_BITS
 
 config PAGE_OFFSET
 	hex
-	default 0xC0000000 if 32BIT && MAXPHYSMEM_2GB
+	default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
 	default 0x80000000 if 64BIT && !MMU
 	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
 	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
@@ -247,10 +247,12 @@ config MODULE_SECTIONS
 
 choice
 	prompt "Maximum Physical Memory"
-	default MAXPHYSMEM_2GB if 32BIT
+	default MAXPHYSMEM_1GB if 32BIT
 	default MAXPHYSMEM_2GB if 64BIT && CMODEL_MEDLOW
 	default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
 
+	config MAXPHYSMEM_1GB
+		bool "1GiB"
 	config MAXPHYSMEM_2GB
 		bool "2GiB"
 	config MAXPHYSMEM_128GB
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
