Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C93606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t2QKYZQb;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lNZrMPw3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=novJsO+Ls8p9nZS8F01zcsvuz89gC5QKMGe5e8hsL1g=; b=t2QKYZQb9GfFHN5l9kKIXYgSE1
	EEOcFLu2sF53auA4U5P9Q4zrN2zVqboD6UnRbru9zwx6v7eS7Isns3YPfvvGX3/WJyQKj3U9c9GGX
	M7WOxpCNw7a+mTS1M8XWb9gjeBTvZM72iMIwR7JoCHHoFtfn9k4dPhXvUhNBpYDFQVj+2Dpz62Ck8
	xt9bau0n8rAEYugBTFC2Zsq/8npWvEeAL1FGnI93TTrYL9CJ6fXp9/+6j84Hj52ic/VKd68J/FIwQ
	c2I3Pqg9C857FeC2I0HI6E1Fr62U0RXibEccwj3W3lT6T0NEEHDCxht/v50KSOx/d7u8Qstx7U00v
	pHQXvvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJv00-0000000EQuK-2y5w;
	Thu, 22 Oct 2026 15:46:36 +0000
Received: from out-200.mta0.migadu.com ([2001:41d0:1004:224b::c8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuzu-0000000EQqR-3NV4
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 15:46:33 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=xVnbD5NPCwNUtek5rbJ7N7bjfuJvseF0zqNU40fRwo4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792683988; v=1; x=1793288788;
 b=lNZrMPw3e/oDx3JW7udezPOdBU4x7PWj9OxtSKRfgRnltSvOZkpkZrj4A/piFzU616noKuHi
 hppLeN8vCQ/zrBcXhOdWcMVSwZDnXKcwnOTqExnd565OvfZBjvxJrKbn3QS9njKJ9Gb/SOtskPf
 P3gzJXGuSsRDoVKR2SVKDQRo=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fad8cbd66f56fb82;
	Thu, 22 Oct 2026 15:46:28 +0000
X-Mizu-Trace-ID: fad8cbd66f56fb82
X-Migadu-Flow: FLOW_OUT
From: Andrew Jones <andrew.jones@linux.dev>
To: linux-riscv@lists.infradead.org,
	iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	tomasz.jeznach@linux.dev,
	jgg@ziepe.ca,
	jgg@nvidia.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	tglx@kernel.org,
	kevin.tian@intel.com,
	fangyu.yu@linux.alibaba.com,
	nutty.liu@hotmail.com
Subject: [PATCH v7 5/5] iommu/dma: Enable IOMMU_DMA for 64-bit RISC-V
Date: Thu, 22 Oct 2026 17:46:03 +0200
Message-ID: <20261022154603.1374754-6-andrew.jones@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022154603.1374754-1-andrew.jones@linux.dev>
References: <20261022154603.1374754-1-andrew.jones@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_084632_204898_D784E2D9 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tomasz Jeznach <tomasz.jeznach@linux.dev>

Enable IOMMU_DMA for 64-bit RISC-V now that the RISC-V
IOMMU driver supports MSI remapping.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 85a8d7fdfa30..96b282ed38f9 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -151,7 +151,7 @@ config OF_IOMMU
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
-	def_bool ARM64 || X86 || S390
+	def_bool ARM64 || X86 || S390 || (RISCV && 64BIT)
 	select DMA_OPS_HELPERS
 	select IOMMU_API
 	select IOMMU_IOVA
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
