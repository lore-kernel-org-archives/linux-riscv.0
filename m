Return-Path: <SRS0=OAdJ=CP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C050C43461
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2020 19:51:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 844AD2080A
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2020 19:51:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dWGPx9Wc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJUJQyDB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 844AD2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FVTRsFgLE+uZGFziHB2h1ljssLT82XUZxb3xIlOlmoM=; b=dWGPx9WclAa38AvkSaNjddS90
	6kDLiQt8xZ0eECwPapLTFVsS0Ynk24/la4ypzHOoyO9hjj6ljndlyKa7ve99jDD6xfGqy9Ht1djPV
	48TTOb/ghbd8gckcmEnITvPe963bSPu5BVTCPNBuHIvXARnVEDStb/BL9KP2/uQQR+ZY9HLdtx1Mn
	CwhfP3lEaga0Td5Zkhx1U0g2226mu52+YO5Hvy2nkIs+KLU4bjpggMuRzvYn9rK3gdFzWNCitV4gn
	gMAXMTZR5+Lb3iJvMo/oLz2RFIQRCEF73yTYq4a+upq5lHfvk4emGqZQldq5TcTEDeGXZ2MtRCkM8
	ggmZSPFqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kF0hN-0003xk-Kj; Sun, 06 Sep 2020 19:51:37 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kF0hK-0003xM-FW
 for linux-riscv@lists.infradead.org; Sun, 06 Sep 2020 19:51:35 +0000
Received: by mail-wr1-x441.google.com with SMTP id a17so13072505wrn.6
 for <linux-riscv@lists.infradead.org>; Sun, 06 Sep 2020 12:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/S5Im9/ROfqvfa1Sle39Oh3fNtnOr9/GsxUV+XEYiDw=;
 b=hJUJQyDBSxhKiCexl2PgZJhKdzT1VEGaaTOtZpUHYMSjpePpKg3Ub8mYNYHHZuW6m1
 wRWfcRi8mvws/10gVmCI/hyZRHdBL0E1NfIz34/SIVnBfA1XvCNMuTHc8h8Skht+q8+/
 KC8KdC8tXzVu1uU/K2ISF+bYH8OmdKNd73tKnJ6attwIhoTHjLGS193b8VgXN0iC0kQi
 oSlfq2VRguvdtrDgSoSxFhLq3h7jhcZfHC501BSjM8rCUjOOsD6YyV2Wly9iL6nHug7T
 za95kOVxzlNPNFR/VJxCbhRh6Wgo8uuARFI2Hlg/SomTZaSkSz9Kw+9CAuytCHRXHE5k
 oG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/S5Im9/ROfqvfa1Sle39Oh3fNtnOr9/GsxUV+XEYiDw=;
 b=A1i0QCVTeIXFtLPKmA1Idg0XfUYjc8HrGVCUhIOe4CoPkhqvD/Ooht/fV3NlnH3aFy
 3HRal4NiVXmw2THpDVv1CEPdCFSdKwpKPE/fOVSmG4lQDTFHW8DCrZnie730gsladxQY
 R8ctTbqxJ6li4D33I/YAr6BG/PF2g8IRXBSbsbqgY+KNzzNJ4rOh843THdhLkkU3MGw1
 Hww9UqnYIf1df4iZcCwq/k2GCIA+D7xF2/+GFRoUFSy7cV54Do3WjjO+0JvbJxTd6GuN
 bPra2Hlxl6NKmt8wGnKpkKGRmSy4bjnWwL/skyyNzn8cMTPq02EvT+aCiYAwGBR9hGch
 JtKg==
X-Gm-Message-State: AOAM532E2cepRqfE8P/BvmGL+vFrg9T2aQer3QaOtYegftThNdyQSAUh
 8fGSGuRy/6LKB+J38w0hHek=
X-Google-Smtp-Source: ABdhPJyfbXY479yfemJKmQe+tgYWfEuqdjjGMulgXwrkYJMCIY8BbPfaKy3e2vUEOCZ7t9lim3Q18g==
X-Received: by 2002:a5d:4d8a:: with SMTP id b10mr12495522wru.82.1599421893393; 
 Sun, 06 Sep 2020 12:51:33 -0700 (PDT)
Received: from localhost.localdomain
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id q6sm22817479wmq.19.2020.09.06.12.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 12:51:32 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
To: 
Subject: [PATCH v2] PCI: keystone: Enable compile-testing on !ARM
Date: Sun,  6 Sep 2020 20:51:27 +0100
Message-Id: <20200906195128.279342-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200906194850.63glbnehjcuw356k@lenovo-laptop>
References: <20200906194850.63glbnehjcuw356k@lenovo-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_155134_555999_93641C11 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dilip Kota <eswara.kota@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Vidya Sagar <vidyas@nvidia.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org,
 Thierry Reding <treding@nvidia.com>, Alex Dewar <alex.dewar90@gmail.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently the Keystone driver can only be compile-tested on ARM, but
this restriction seems unnecessary. Get rid of it to increase test
coverage.

Build-tested with allyesconfig on x86, ppc, mips and riscv.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/pci/controller/dwc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 044a3761c44f..ca36691314ed 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -107,7 +107,7 @@ config PCI_KEYSTONE
 
 config PCI_KEYSTONE_HOST
 	bool "PCI Keystone Host Mode"
-	depends on ARCH_KEYSTONE || ARCH_K3 || ((ARM || ARM64) && COMPILE_TEST)
+	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
 	depends on PCI_MSI_IRQ_DOMAIN
 	select PCIE_DW_HOST
 	select PCI_KEYSTONE
@@ -119,7 +119,7 @@ config PCI_KEYSTONE_HOST
 
 config PCI_KEYSTONE_EP
 	bool "PCI Keystone Endpoint Mode"
-	depends on ARCH_KEYSTONE || ARCH_K3 || ((ARM || ARM64) && COMPILE_TEST)
+	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
 	depends on PCI_ENDPOINT
 	select PCIE_DW_EP
 	select PCI_KEYSTONE
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
