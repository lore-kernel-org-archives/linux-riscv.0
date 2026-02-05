Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD236E91299
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI8rjiFsmeCaIpmPzPMMAAxN4pk/T/qqlHCsi4cL7+4=; b=y+LVwph3JIs7OI
	Op6JOcAoqXBOpgmAwH5WV+e+XcqgJn1iOSg81Sry/Xal5tnMpWcY5BDk8kl98lOz+6D8uxwqUw5NZ
	rfEi0dC/sIWOrlUZE6aTIv72OFyyu17JjftPu94SwK+Wrdr3TcT9VdnOsmF1A2arSdDtr5A/EWHBI
	VEPy2PUkhaE591YUNAitCgosGp3Wn8YIhYi3SDvwd1Ty1+Aep2G5JiQFbtHg1kvpDx9nSIECvlUUr
	2cA/5jeabf4nMMyG99AIUePoAqimIBR/d/SShT203oFUDltqLy7zRYvxg6189z0Yw1NEvMN6HGgjH
	EKm2Yg8vlQpEV1Kup0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvO4-00000009fRT-2nei;
	Thu, 05 Feb 2026 09:10:56 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvO2-00000009fPV-0G2B
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 09:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770282630;
	bh=vniV4R9laYPbty6apvE3yD0+y8jeoSXd7UsyQ/isW1s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=qB4iHXAcLRHqGpSVy2pcnkNcTZ7l4vat0LrgwOXOh+TvOH2BonDsQP8+ifMtnOmxe
	 Wrt3kGk5xGiLV7BeXL8N6W1PC3l8iIWw2duqFUrWXRpOUZiB3YY8WPngNUb8Kpp+5s
	 QrAxD3jidtXAtCm8vMbqLYa9l9ImYzxCrCheQ3pg=
X-QQ-mid: zesmtpgz1t1770282629t83d3aca8
X-QQ-Originating-IP: 7TYxyNEsAJsJ+hmTN8eItU64xdUiHKZ8ogiEM2n3g4Y=
Received: from SurfaceBook2-B.localdomain ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Feb 2026 17:10:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16664678030210134894
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
Subject: [PATCH v4 1/7] iommu/riscv: Enable IOMMU DMA mapping support
Date: Thu,  5 Feb 2026 17:10:24 +0800
Message-ID: <F59F70CFAEDA41DE+ae78dbc5590f872a36eb4359bd451b99fc8553ff.1770281596.git.lv.zheng@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770281596.git.lv.zheng@linux.spacemit.com>
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770281596.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: Mko2o32K24t8CiIMJ7u8eHzxs3hYHuHzb+tBM7zd/NHCFylz5qMvvRIL
	bMHRhO9qIf8CIfOq8/xzmslogvRrvFTjST8L/i7pc2Isxiq2CvY2bciSj2sIRWYIbhpTmQs
	pJTd8rbrlMFCwC+zwAYC0n2P+KqN8C2w3VH9rQU2yPNjgO8nybUyNzDbZDI3SPQCC8qYklX
	IjWHnHdsDiuvFa4Qk2eBJknNaIg3G4Q9PdOnZy52zrIJAPXpkmiyGcWcUYGSSMQCbJ3t8/U
	ICC5NjJbIhqAniajExB5y5usHFuSCQvMS+JKCX9lTXMx+ASxdVNcAqp5OKGEPo2Z8e2kUT5
	zL863MOYmjvK20m62V8Jul6n+Z3FuxSrtzw61lMdbG4ke9WwoU7fPmTgozpRiS275wgK6P0
	pRo4n579Bz52dMP3TKXf/EMDAaN3Dg6TVxuP+H0uHKGLvd7BSRt0bsM9l423OMiP6mBAjEH
	UkbsaECBKCDidkRIalxj3pL5CTHUfq2v6i/fRtbwOI1ZdpL9Jhfi9sdeVNqAiPHGQti0Ntg
	tl5TvaoIDBAG9YtHkkADbfwhmuIRgCrqddj25E5qgEP4Mq7aovYEjS7n5xL/VM2PpMJaxKo
	NYsdNFyhT/XY+OSOCHjssRIgm8ke1g7hAn5XOoBS0yDheVZ6klo8UkgSVY2Gsi8KP0fOD6L
	6JPY7ZMQPitzsFNqrVQocvKEMrj97yPTSGb7ZKyb4QedCb6hD+9zb5w4vvjlr5NZTMQUik7
	Ujh3WjXf7cjLCgH15kULM+zwml1MzBuRNF87ioAEak/TeU+KIZc1qUn1NKdqJQuwJIC4rtD
	8M3f9bopFJrtLw+MQjTN5m6lQYeA+QnXTEinaK1J8XEI4DQj5nLgWsXOgl1YPcldVSSyu6A
	Z92przYSpk7ZS2KAG8/kF59PzBj1JhDMSUJFSOt0WOebzgiPBatwFHZFwux4TiF5hSVp7rW
	sICo5lDxrDreR0DsKSTHu+MKU+K+ht2xaZ7+lNoGmrlB5RhsVN6Sy5oGukMZR3gMwirQnRW
	3/0X11YRfat6L7vvvFHma6OT4OCHf+Q7/9aczBmw==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_011054_587303_E00BFF95 
X-CRM114-Status: UNSURE (   8.53  )
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
