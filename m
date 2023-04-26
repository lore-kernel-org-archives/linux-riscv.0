Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F351EC7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KzHP2tJ9S7efxq4bA4O1fqPfXgiw9QJ6FqzS521tAmM=; b=CDraDQQSaCArNx
	Fp99CfOjORPb3jJqwSvYmZfeF3hh7kwr9d9SelaRGLVf8XKZIINVaRqTvQyJCXm6Nhjb9RHD6EPH8
	dd+Kmnom8IETNrpWw9l8DuFTRkXuTb944l37TQYN7S+c5upPbwMRETiilYd3kIVc2pu3tINL+Cjg6
	CHtyPqmA68foyxnDP6zWstWpp8+ssqz2iZmXy8oXxmRDdOlGgA03fIHxVBYMuEpBZriz68/2YhG2h
	mohvy9vSabHDbyujCg+E9lB7B27BqN+Q/sjBFzkfXDftNyuyllkdD6Q/V6jAi0pQPME+vPQRRbrfn
	AucB0FbRJmr3EDff7wmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prZnn-0034sf-0I;
	Wed, 26 Apr 2023 07:42:59 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prZnj-0034p0-1w
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 07:42:58 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-63b620188aeso8068247b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 00:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1682494972; x=1685086972;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C36X7PBYU803ZQK1FU7eiGRzdw+WQCze/9eRJF/8+00=;
        b=IC6fDc25yro72PytcOu2G5j5Th/XQhlmGVC7qt0vdjRonXlE2ITrOMTDVanbbihTUw
         QiF5Ga3RYOoEUcJKU0w4zcYFbeichVNo4BQm8/h6ReDxlBLuSV2dG4LcoOI/Xcc6tB9A
         K6L54zLAUkOEOpxAg9rKLi6Iul/xc2jxU2KAl7NZUNvhG4/sFPnjBQE7aiNr5tZ8qTve
         43NafeZIVgk9i+kKCHiH6MlfKeeHpMd5u2Mg1z6DSzVM0vhwcdqbwff5N+RwRv+5o/cs
         +/pL2IU4IO2mKZTpwdqiO3M/zMUDqRiZMGcJCHqJC9WSWWQ6F77n541PSrg4yElaoJe6
         +O4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682494972; x=1685086972;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C36X7PBYU803ZQK1FU7eiGRzdw+WQCze/9eRJF/8+00=;
        b=Gay9ijYCjzpW4UXR8ZerHKpfMfIo8Zsl1ELr5UcEi9b5enk7hW9uiarR7kJH4Hc7b8
         rBeoPOivNysDCLLFpBCQbibkI4f5nInS1fZVt+2HPad8Zkk7zSX7Wj94l51CCSDaEdlX
         WQRR9bviMmS6s7ps5im7XW74Mgi+JaYhdMetI8lxIL6CXK+1m/L4OXVkGEyLnM9mIO2v
         drz5MnLACNAj9VGkSeewj4sf1xtH39qQvBIanKFRz/PM+DioriZyqyvl49cSE73xT1Yx
         MeRoPj7gTlxJjznGYm/LxzX4U5shtoVh78y7F0y0HbzfZ/RbJqKT5m7fTS0jW1b/7g4R
         aLoA==
X-Gm-Message-State: AC+VfDysE2ojzRlp/jJMbPXbVCyZqIOMGMlSYcRUrvNpZExSFVANuf49
	+fEaDfJAB8bCygZRRcQWrFq5SQ==
X-Google-Smtp-Source: ACHHUZ4D2vDCrmJ2H7aGL62FLepGOi1jInGTMSrOY+khvgUtHZ9aO+t5I6MNSceK+7VemRURbUxpBQ==
X-Received: by 2002:a05:6a00:10d4:b0:640:f519:e1cc with SMTP id d20-20020a056a0010d400b00640f519e1ccmr3521646pfu.34.1682494971956;
        Wed, 26 Apr 2023 00:42:51 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 123-20020a621881000000b00627df85cd72sm10384179pfy.199.2023.04.26.00.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 00:42:51 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: vkoul@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH] dmaengine: xilinx: enable on RISC-V platform
Date: Wed, 26 Apr 2023 07:42:48 +0000
Message-Id: <20230426074248.19336-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_004255_779005_A6A8062F 
X-CRM114-Status: UNSURE (   9.64  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable the xilinx dmaengine driver on RISC-V platform. We have verified
the CDMA on RISC-V platform, enable this configuration to allow build on
RISC-V.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index fb7073fc034f..816f619804b9 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -695,7 +695,7 @@ config XGENE_DMA
 
 config XILINX_DMA
 	tristate "Xilinx AXI DMAS Engine"
-	depends on (ARCH_ZYNQ || MICROBLAZE || ARM64)
+	depends on (ARCH_ZYNQ || MICROBLAZE || ARM64 || RISCV)
 	select DMA_ENGINE
 	help
 	  Enable support for Xilinx AXI VDMA Soft IP.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
