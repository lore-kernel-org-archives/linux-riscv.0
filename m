Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67394C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 06:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cVrGGxcTb7hevj8TUa4Ii/TJhR/pHlrTAzRGZ5SLqOM=; b=qnuD9l+qQjPKJ0
	blB+AQXXdFiURz+8Yyw/lyt+PgzSJS/8zAlNE7s/OzHny5ZuapzBDv2A5m5Rn6sdwQGAtIm5Kze++
	CqZQtATlV+hvai5Qkd3/bGhqdOk0mXrz/VlAY26k9o5km6RBDpnDv9MVF7sdQUFbJpdgf0E94baOB
	uTzQULd5tpDU3fsp1IVbCO7i4Kya1cqNd802Ziyio/fWOlGyj9LvqUs8FbRHb8gb7m4sPsMLj+S6+
	4a40PMqgRE8lVG4XQC6SugJUD/RsoKBkC0LZ56Jp9SRGEu3uogH/pOQfnSJjTZuWg+pyB8f6D/Q6L
	VRVf0sQyUYlzjS/qaOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwcwA-005CUO-21;
	Wed, 10 May 2023 06:04:30 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwcw8-005CU3-05
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 06:04:29 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-528cdc9576cso4590560a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 23:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683698666; x=1686290666;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gu0Ww4Btm3ZJWmUm54OXSmR11HegrPdHhOCTMAKgm2g=;
        b=h8djJvjR8ebEG6ImUF1nkveTqSFqxQK3NuyugJ0rvCgfuk3n7bOjbRYxjtXbDIo41c
         9hkL5I3sSZAH4LWpU5Hz4rzaimszZBnNgQOeLWbHtCSvV7WE23HlCEltuB97H+lsxDhi
         T0Nr9HX8Syru1uaPiRtTS46v2moIsJGkvq2fkvbS9avnh5cZYPI/gMly6X4IibbUV9Ex
         V/dQFKHhfVsUE9F4bjL0+Da5GeBHVH47z3e2nCnG8iqSQwDFB78EZK5iy9Znzu0czH/C
         bkc9CPb8uKkFm5Hp+RwIdrNE6RB3gLGj+3o9CVYLr6Psz0nv+LzShMjkAsT7kk0uGH+m
         OjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683698666; x=1686290666;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gu0Ww4Btm3ZJWmUm54OXSmR11HegrPdHhOCTMAKgm2g=;
        b=eZIsTOpz4obQimjoQ+Eojn5lka/PPJQ8R8UeBNFj7QKbXRcUHAKi/u/XP7zmKXBpiN
         P2H4BQ/EBqFlO6EaVtQPBJv5py8MSTIAn2ocPICfOiJUwW1I0lx7CzDxKbfOG6sOe9ra
         2tPvTuacj81WnlKS8GkKERqRwc6nWTKtUyNSehijtpL8kH8fahkusoJZ50VSFGLOkVJ9
         REWJNtKu+n6vwye3i/uON13U19/bYribPSKxHAu8CbVZuULy4B4mg4/3NipJ13j9N4pd
         QdDK1aeT/sd6bvNHAjNdTXBVA5/7x54VXmvPLcXQDPh5FeJF0u5qE/I00jwWy83D4KfK
         +GQQ==
X-Gm-Message-State: AC+VfDxtCaEr0YHLnmXKxpLxGkvEq90SxdRpY6V9aDUCJ8jkrxmkDAHc
	xKEmTCSrsa7auGawdEg8rdO/uRcT11SfLJBvZ1o=
X-Google-Smtp-Source: ACHHUZ58wm9Z0W6YIYZ1v9zc9DcTUNNZ2qDA21or5nSqrykEbxFIclL0qerbXr6/V4brO+GwwybdGA==
X-Received: by 2002:a17:902:c40a:b0:1ab:28ec:bf10 with SMTP id k10-20020a170902c40a00b001ab28ecbf10mr23310293plk.51.1683698666262;
        Tue, 09 May 2023 23:04:26 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id io20-20020a17090312d400b001ab0a30c895sm2751424plb.202.2023.05.09.23.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 23:04:25 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: vkoul@kernel.org,
	palmer@dabbelt.com,
	radhey.shyam.pandey@amd.com,
	dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2] dmaengine: xilinx: dma: remove arch dependency
Date: Wed, 10 May 2023 06:04:21 +0000
Message-Id: <20230510060421.30982-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_230428_124340_2C795C62 
X-CRM114-Status: UNSURE (   8.63  )
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

As following patches, xilinx dma is also now architecture agnostic,
and it can be compiled for several architectures. We have verified the
CDMA on RISC-V platform, let's remove the ARCH dependency list instead
of adding new ARCH.

'e8b6c54f6d57 ("net: xilinx: temac: Relax Kconfig dependencies")'
'd7eaf962a90b ("net: axienet: In kconfig remove arch dependency for axi_emac")'

Signed-off-by: Zong Li <zong.li@sifive.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Suggested-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---

 Changes in v2:
 - Remove ARCH dependency list instead of adding new ARCH

 drivers/dma/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index f5f422f9b850..daf20600a167 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -696,7 +696,6 @@ config XGENE_DMA
 
 config XILINX_DMA
 	tristate "Xilinx AXI DMAS Engine"
-	depends on (ARCH_ZYNQ || MICROBLAZE || ARM64)
 	select DMA_ENGINE
 	help
 	  Enable support for Xilinx AXI VDMA Soft IP.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
