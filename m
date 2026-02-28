Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBDFFEE4ED
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKGyNsWl8KCbihmbiySX3cd4nj4aDUoiZsXgpRawVJk=; b=4Do/BtCRU7SGhL
	mOQtqMsnKQMkycaNQPBTkKRTsBvPpNeWv2LCPNwz2TENfsaS+T0OjUFiDHGvN19rS23/j/8kwOf/d
	ROUNGpTycmUR74e9zGL0hauR7dXEXZKjl10N7ZG8gegTSajEg4cZVJG7SZK5zHP1xczc80DKcn1TQ
	HMftYe5qKhiSf1a5JxMjbCuu/jQlcTyT+R9abWuhygoLwfpJxtG9d9LaeaXMwABRULzJbo7uT2OBH
	OYVb0krGOM1Zrcbyk2uVXGQHk/ImnwAR+iQfeQRNMCom0r5836rXky1tvi8GpS7Y/Jnvo14d2CE78
	30HR6SjiBdPYW4lHL9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLYg-00000009wKt-1DuL;
	Sat, 28 Feb 2026 14:44:42 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwLYd-00000009wDP-2K2h
	for linux-riscv@lists.infradead.org;
	Sat, 28 Feb 2026 14:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1772289853;
	bh=aWVIrsuLvk2GkMfu5I78c9249QHltnZ4xIbTjZja464=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=IC39vTs9N14pC3ITptAfkqCVSXInWHHGkz5TZ/tG9dxCQcoDt7EmhbhXy7MVlbM6I
	 xvQHCsKI3SulKzLq/D3lN6RYpkGl+k1D8kP7FvxhrWgFCyIW+qMAvKxWW5Yb6ruYBw
	 WjHHpHcl64ubOPvhe96q1b/lB/05m+TTdV7WHuko=
X-QQ-mid: esmtpgz15t1772289852t755e0db7
X-QQ-Originating-IP: mtwxv59GTJhoJTNZyvzkPGG2xK0JwZNNXJ/hqEKVw8s=
Received: from SurfaceBook2-B.localdomain ( [183.193.112.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 28 Feb 2026 22:44:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18186805224987557749
EX-QQ-RecipientCnt: 33
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
	Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Jingyu Li <joey.li@spacemit.com>,
	Lv Zheng <lv.zheng@linux.spacemit.com>,
	Zong Li <zong.li@sifive.com>,
	Yaxing Guo <guoyaxing@bosc.ac.cn>,
	Zhijian Chen <zhijian@spacemit.com>,
	iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/8] iommu/riscv: Enable IOMMU DMA mapping support
Date: Sat, 28 Feb 2026 22:44:04 +0800
Message-ID: <52E07C3A9B398459+126b1f464ae2a8bfcca6f504c64346541ae4db6f.1772289741.git.lv.zheng@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772289741.git.lv.zheng@linux.spacemit.com>
References: <cover.1772289741.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: N+/GyfuFbcLi40FxMycKg5IWcjO/haExdwvTm/QTgrx7vqzp/PCccLdb
	n2piAStxnixZPAcp2AlSHc0XMXhbTZmBCVDlOY8KaSQB+h5qrZQwgCB7JUqpRUGnrmQ6Za7
	0S/ysWjEg+i5JYSuo8ZCBn7LjRNozQkFt2SYcWgym07JnMQcH9j4zThD4ESdSNvm1B7khLk
	CLDGosmz8JJpg8uDoBXksFb6J9I+5AC19G63WSqjDRjDgwla30m4yX+5DLoBe4x/ihaLSll
	n74+MHlO5/pPKeNcjoXsu9ky9NZepCU3bQGSJQiCJtbcqtzBzOi/+Q5LB3PFKF+hncmFLmd
	p+wcoWYURO8oJ4RYsl4k7RdHO3qlfXPH8+aD3iBiOvBUtOIlIyLfjcLvpYTXs1TzwlnNBr+
	acu42tl6vTeEhIPWc5I2WUXmICzxcQrtJo0iFHI0eVfRYHpejf5p9CndXppLlaaZ1cwad7m
	5wTwIhGb8FCtciWxoae1poRMJBXM5LKcZuqQyJnE+dmydHV+kG1ZI5cze+vNpq1Dfh7QMfp
	2mM8669MnvWeRE3zUNsyRDQayKiYkTHeBBov7seP2EMYFB2YKBZtoPx5MCcttdA4HDQUO7w
	iMg/7PkvcPkITQuP94kV0UUbhEKtJ6NCSDs54TGQZbGV1cpSwGMEDrOu6B6c7X6z1pd2gI4
	QRK4jRsbeq8HHQwniIGOuXGB/oDiCV4r8qK9X/MrPjRZqXUEewzmRtFaPDzB40m3FT/GB7p
	MTqhJ3nEhsCRYZ6S2TTWTg2pFi3Wkz1jLZ/HUpz8LWLoi4Z0cPKK+PHx42aoitx/9Rum1zy
	3XJXCVEmu0skzf9WH5Cdn5QZmusDtR2aTMOjrBlzUpqNsLxRgCO+0ENJEu95hTyl2cPvlkL
	PEa9Kih4MXOcQh3kXarWOOajHJRFVEvu6gUeMQ5Ff+pCCpppHY9pDVtw/LhZjKL7HVZLGyL
	vV8+mgnWhxxalZVs7Mq+oYEGAWjWCoIGE2d614AMipIOaUkD38E80Bww6r+jDmRs4XCDwYz
	i+Ha41iDMwzvkIJ/LhQJMyDKzvbfw+1S2pC3Yckw==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_064440_140464_C5AA6A10 
X-CRM114-Status: GOOD (  10.06  )
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

Enable IOMMU DMA mapping support for RISC-V, so that DMACs can be tested
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
