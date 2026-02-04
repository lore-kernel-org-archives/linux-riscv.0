Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E92FE83EF9
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI8rjiFsmeCaIpmPzPMMAAxN4pk/T/qqlHCsi4cL7+4=; b=z4WoUs4Ono1gNJ
	+YZ8FqmkVZ8Z4XI05BrJasEZSIbnb3d2Gm89jZ9p15zY+8ApLWJ/MISv1bH/lIB+NFDyXk4TmRacg
	7uJf8NWk83rNKG4OFdiUwk0nyIbJ9iqVeVUiiThw9MPJ37pcir7csB2Tmjjhc9f3RvDd0eVMV01dd
	8cOB/5549Wg6VA12UEH87Iv7OMkWHQOK4ZNlnROIcRl0epaksuxxr2pueErhRotRYBlPeavS4scTy
	gyV84Po56xKnRaA5yXDtMHPUDCQvob1kb6C8Pet4+1pDg3NxNbkGxN6USzZltjZi3CyIeL7tq2I4G
	UJKHZ7s0qJSakiMKRjtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYsy-00000008A8Y-2BC3;
	Wed, 04 Feb 2026 09:09:20 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYss-00000008A5c-1JW5
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 09:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770196131;
	bh=vniV4R9laYPbty6apvE3yD0+y8jeoSXd7UsyQ/isW1s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=vgn8Mq0S/+43I/DeQkKG5jBED3gHMrthiqqHB4s5mBKNZdAK+FylLhBc9A2Gba7gP
	 o1LCWC4ZX/yQCJIaJpQ9J/TpYk8rfBT0QL29BMT7+oYbY2vboQqZdvpfnOd7zxqDvh
	 OJc1QkeJZGX2BraLeSv75mmj3fqMD2ZRgn8McXDQ=
X-QQ-mid: esmtpsz20t1770196129tdadbc722
X-QQ-Originating-IP: cyLLraxODx+BbmUBgtRGsM+KjpbyMTBBc9WyBjGdDL0=
Received: from SurfaceBook2-B.localdomain ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Feb 2026 17:08:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2120045114708979725
EX-QQ-RecipientCnt: 19
From: Lv Zheng <lv.zheng@linux.spacemit.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Jingyu Li <joey.li@spacemit.com>,
	Lv Zheng <lv.zheng@linux.spacemit.com>,
	Zhijian Chen <zhijian@spacemit.com>,
	iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/8] iommu/riscv: Enable IOMMU DMA mapping support
Date: Wed,  4 Feb 2026 17:08:39 +0800
Message-ID: <4AA614655D11897F+a7061670f43ddedffb83b88fab0dbeb9123f2940.1770195980.git.lv.zheng@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770195980.git.lv.zheng@linux.spacemit.com>
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770195980.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: Np0qb5kW85KCr42LSI0RAZZl4p1jeyLFinSdkUjfQ+fqz2h1oEj6u5JU
	8bXGoM0wjkt89uxvM6JKPWRRRHNv2QFSj9Iy656DfQgyVfPRyZ400oHYGHBqViX7JXkirJg
	HLF9b87m1cZnWwXPSPiOczDIkP7mzZ86VYBoO2Uo0nTv6H/4MAsgclccLAorl619WAGq1vd
	0BtPOwnT52MvTGpxa5PnzW+fCnYYulKY/Dchoc9lwwZobZAkBKNJqcSM4l9cqsU5G4PZFYy
	BdljN4TAOnaTgzKdpytRi2ZG0q62WqAyZKpeVxqVahWyPOwLnkrpDn843FO2xjwAZQ1sOvg
	NRo5ZQP5qZrANYBXn/c3bm47tmy82hHzlRy2a5DroFPSJ4ZGXabPNiFzOKMrzZ/RrUCKuzf
	drBE61bDZGQ6qKfoJ5Q/T1chR4tVcAMWVz3zvU5jOFDXELW3JvcwatIm/prbWsTy3Av7Fmc
	8nxTbktvsp66BGgpqq+8Ua8sG/oZT7bjOg+IsuhekMEcCZHf1kVIr6gkrGBOe80kSbvWfjI
	dtv9f/19Ysxsj2K/VMv1L4RRV3gWaruYYJu3zbIzCSipG3UVGFpwXLnZrsInGpW8dli0vX6
	83JaTCyxgs56NLfwYjx0IeEh5tU8VCgecsiFSIZpwfFmO1RVf8Xr++4aB5+eSGu82A4L385
	wEKug80AZKQ+XBvY7cbNU5m1jQ4xEuBlhcvhgWFwfdptJTpqVq4ZjUoof3PpRcWJrpRgV9L
	NXrRuilN5N9QPTAs0u33oM/aa9D96V3j1ZfvHZHEit7yXOTOm2EZL2ojJAVTIiKZ8MeVEtI
	BaP5nRbBpxLb7ifyNIZb89VTsH88RT60foEzp7wEF65JpvnTkOv+YWM40Blj0o3UF/ccMx6
	s2vU8PaA90NWMDoAdAlDOBa3PJ4PNnMMGMENe99xludGqRp9DSsIESeL8fkPkTbAiG1ziJu
	bP4OHS9Eg8EsAocnR0TVo/eoZ9QtdCyySoIz93OG5r2OuuYyIQR/zKAlw/M8SNl0qmZIerm
	ujFqS2Syaef6Go6Ufi
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_010914_840372_7FEA4899 
X-CRM114-Status: UNSURE (   8.65  )
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

From: Jingyu Li <joey.li@spacemit.com>

Enables IOMMU DMA mapping support for RISC-V, so that DMACs can be tested
with translation enabled.

Known Possible Issue:
1. When CONFIG_IOMMU_DMA is enabled, on the tested Linux, RISC-V IOMMU is
   lack of PCIe support, causing riscv_iommu_fault:522 in dealing with
   NVMe PCIe devices.

Signed-off-by: Jingyu Li <joey.li@spacemit.com>
Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index f86262b11416..34d8a792339f 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -151,7 +151,7 @@ config OF_IOMMU
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
-	def_bool ARM64 || X86 || S390
+	def_bool ARM64 || X86 || S390 || RISCV
 	select DMA_OPS_HELPERS
 	select IOMMU_API
 	select IOMMU_IOVA
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
