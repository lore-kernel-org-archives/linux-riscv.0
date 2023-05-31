Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0183C7EE24
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 09:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X7iCpzd6nJbnf0bKsqlhxW/UnaeBmUq2eQ57yDE8mDY=; b=qHZmkVD1kpOZLJ
	6qOPMEDm+HcKES6zQ9ZuPswYDZUseioZVdwkKaExjEkTNMjuXgid1vCYdyfBH9RqXYTyRT4Po3H/B
	dhI+VHaJbRICIUwNpUuEdjvk18omjkYzFWCb7ybXjImAMWi8PcrvlNfE7gLwh51RPcV3rEl88AwVu
	JfjJ3FeaY+9leh/rk0T8191eYLN/NsCNAkblIRU5VerIpr08ixZQg9rPfRqkxm0J4mqLZd3FmvKft
	LZyinw9aUjN9P8crSasp67wgKtg/cbzjL/ZCiSHohuw8CEkmXFj609FzJH4N7muoXhjdAi+rXieRQ
	jBM28VdJkhoWdv2AWRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HiI-00Gnn3-2h;
	Wed, 31 May 2023 09:01:50 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HiG-00Gnlx-1V
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 09:01:49 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-256766a1c43so2019694a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685523706; x=1688115706;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pBr07dQUqaCydPGFnh0XsYk9RZIo6EgjJ9yRkDs7qc=;
        b=k0gEFFMxjc0/bm1dulNEnmj/gkEBAq8qksZiEYn01tWue+ugt1l4JjhJuzhedhYr1E
         fNJ6I6CBh9cv2fsrC2awNfpYQmmCbVaFyJSFe4xkYmOHV5l+7HlyY5h1hP3bhQd5NYAp
         ZGxA14czbcWrfLQnSmquR5F8mBuPcX+zySQpGYrvZMw84LdrGIgfsg1D7gIbr13tsWQn
         OwXGhaen/kvc/TfHQSUGyr8WJjZgBC8b2NzhgFhaRiPZ7559B6XvcT84WPFo0rjJYrpZ
         /8fjcDoFnit+Bs2B3j4RYSyCAnayiUY3+d/Hy4viuN8AMTjZZA7qj1CztoU4/ZRbP2G3
         eukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685523706; x=1688115706;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pBr07dQUqaCydPGFnh0XsYk9RZIo6EgjJ9yRkDs7qc=;
        b=cUCN35WhluoDxe5sV/ZUrACn3Da73fpdFkTNkq9jB7P8izWN0gxYCod2RezfgArHIp
         GSY1Mbx/9snCnaOi7chyEqkSh09UMhnfzzWWj2goVBhyQAYHoO4MfKaqJsOg59XnDlk1
         S7/U5Amk9Kibg2+eRiYAaWVDK3rQgj98aQL8sawMUAZbEh1BX52p5RYqHpV4ub+Df/mA
         X/XYeTbWc1dwrGwD7diNwVwkCHDOsW+g5KDvi/OgTKV+/wijb+uVexort9rQmQAEs93F
         VPCK87cfpc3x6SDtAYu9R5DqZuCqYgTWR+H+WfevjGLX30fIQoS6WzBvjgl8KBg8+6J+
         GJSg==
X-Gm-Message-State: AC+VfDwkzihunX9TNw9mr5fw2ffGqkYkGbDEZDIbRiJqsDwLQ9aWgGKL
	8OpeDpz4KeQhDf9gqqZpVyMXAg==
X-Google-Smtp-Source: ACHHUZ69o+/M5P3Zycl8uoG0BG2EoJtoFIF/MhAduF9LQVBw+R78RiKf70usd3kanYK/k+I5v4ecgg==
X-Received: by 2002:a17:90a:9f97:b0:256:5174:f58b with SMTP id o23-20020a17090a9f9700b002565174f58bmr4353082pjp.46.1685523705852;
        Wed, 31 May 2023 02:01:45 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o1-20020a17090a4e8100b00255d3bd5ce5sm744398pjh.45.2023.05.31.02.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 02:01:45 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: vkoul@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	radhey.shyam.pandey@amd.com,
	dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v3] dmaengine: xilinx: dma: remove arch dependency
Date: Wed, 31 May 2023 09:01:41 +0000
Message-Id: <20230531090141.23546-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_020148_538936_1B77CFEB 
X-CRM114-Status: GOOD (  11.30  )
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

To avoid breaking the s390 build, add a dependency on HAS_IOMEM.

'e8b6c54f6d57 ("net: xilinx: temac: Relax Kconfig dependencies")'
'd7eaf962a90b ("net: axienet: In kconfig remove arch dependency for axi_emac")'

Signed-off-by: Zong Li <zong.li@sifive.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Suggested-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
---

 Changes in v3:
 - Add a dependency on HAS_IOMEM to avoid breaking the s390 build

 Changes in v2:
 - Remove ARCH dependency list instead of adding new ARCH

 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index f5f422f9b850..fd5a94e67163 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -696,7 +696,7 @@ config XGENE_DMA
 
 config XILINX_DMA
 	tristate "Xilinx AXI DMAS Engine"
-	depends on (ARCH_ZYNQ || MICROBLAZE || ARM64)
+	depends on HAS_IOMEM
 	select DMA_ENGINE
 	help
 	  Enable support for Xilinx AXI VDMA Soft IP.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
