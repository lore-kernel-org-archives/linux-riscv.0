Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE90EE83EF5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 09:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyKGn/9Iv+TmUO6zY3+QsYPepIntxovqjT4OoAAbRt4=; b=ePgwHtHbY4SxZN
	jTDAZuFGlOZhhYwW2Ewndcx4dTBOltVV02zUJZnZF0ve/Pg0MhDE9V7DEV37wyAUrqGgd00xNS2YU
	GCrIhbQgVBhETPpQ3h1HX8mJFRU6hSpCezImliBdFNOdzhT1g1hWvv8k4VxpM9YzQd4qpKuDI0Smo
	WokwTOoGozQJMcHzXwTq3qYQ/+tEDHqL5+2QWppy1AaD6SAnnBzeSldFvj55vX8Qqn76mtghjapdj
	5AUXfur28rmCN5QEcOzqL5r6gLiMGCr0EKCyyqRDwkY+udP/x+a3boTR2tC/xxEBVFywe7xdxX7/B
	zABgUpiNm0n/PfGDAh0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYt3-00000008AAf-3Qdg;
	Wed, 04 Feb 2026 09:09:25 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYt1-00000008A6F-0S8n
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 09:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770196139;
	bh=FnxspfB6IoUfKXakCwL/8H5wQ8u2PrShJd6O1e3tAhA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SFgSWVaGc4keGOeP0F14rH7eOm2bDWRwrXbg87QoYCe9VoFoexdxbRdSqELz8ljUp
	 07qyN+wOjbHN+OiJYA0CIZ/nfZhdW8CZB1G0Z7dH7VCVTIVXW/w/rwIXfdvvWEzynb
	 AOb9uVPe6Pn/7X//nYch1YPQ8ACuYK1JpKf5OwuI=
X-QQ-mid: esmtpsz16t1770196138t11af2221
X-QQ-Originating-IP: cIZbjwSz2bt1AZxsF9Fs7umXGHhXAU+RtBpA8bh4RmI=
Received: from SurfaceBook2-B.localdomain ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Feb 2026 17:08:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4010158773422615349
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
Subject: [PATCH v3 2/8] iommu/riscv: Fix WSI mode IRQ number handling
Date: Wed,  4 Feb 2026 17:08:52 +0800
Message-ID: <F77F878EF7C59BD3+a9078997d97dacd05d1271a5390dfd08a402b325.1770195980.git.lv.zheng@linux.spacemit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770195980.git.lv.zheng@linux.spacemit.com>
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770195980.git.lv.zheng@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: M3uTjkO5QXGxCPOzuCiEUHeAtnKQkdTME4gDy1ksCop1kKsDbdSahqkG
	oZjGqNptruElkOP4O5zxmQ9Okakc6UAUMmB7cfgQcjF0IxNaxeS/9g6TaLF3vd7Y0EsAiE8
	yxyNBjY27wzBeMwXSA3SeEUoAaUzgqYhwYeYsNbqAjcD5UTX8MIdSi/IXZM43pISdANv6fx
	0wkgwEJbyqkwbiqFDa0Wn+ZVVXXEJYWMUotV/hSskqlx9fif6KThFaErhRIhey247y333ad
	WXzXonj5Nfd/SLRU/NC9rLwJ+U86eB/tvElgA+FSAqRvG5CtCB+5TkuceIv2DF6B8E8Ynyz
	skCAMI+Yycoa7Udx5GaPl36Ug/zNw4YETySHxFfoBMCRPrsLWhrfuyl9YQPvil7DRVTR8EP
	I5dLKbxcPGPu442uV3bG1BI6J2TpjYK9rXo5s9Dbvg6z34zn403/Ul78yh/cVK8/KYVPioO
	qKyiqnL1N9PNcYQhHKfVaYj/lB0HmaCQMZp1g1P7S0ci+R6yEzHtRJhIQocNPjum36D6Rhz
	duHd/Pgxb+W05UyBKngrZpvZrXWwJ6MbpkfU8Bo+ufVMuJuQyVRZ9/+Sgaw/LdoKowDJest
	g5SJ8qky25zmp3JR1p7lK+G5H1pJY6WDOlkIXY9ncQq+21XFPSpkMMykAsboRjd3OQ8ecqB
	NEvNuzS9WAB5K+vhEVoqpVg0bRA/8eHYDDc2qfqQp4bCCTphO8mSpcbuUBnnvbWRsPerSIY
	Wx+rYZa/bfwX6GTOCXWPNR+rV+vTKPbt7WGQWm4mZq/ODeovsc9U854757WHIoe9h/QvaWk
	WiAPBdQFFSbKkzvc2Fderd4TLph6LrfTV2VfKKqnV4k/NnAWhgDv8QMAW4T4v3ytsOcGmoy
	PcLmnRZMVRIUnZKzeLiDdx0EewXPRLnBgFC5wpdpJd+bKQLWO87HRv4rNiQcs+wXdyw8QTz
	RA/7KViy8wQdT6EVooLcsihSIKBu7/iXyStYdxbQKvhCmW/Awh+/gX4NYEa/4bgNtB5Pt+K
	ul1ang/82r8SKkVTXtOufDOev5+XfKAnPoN7jE9g==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_010923_648879_C6FA2CFB 
X-CRM114-Status: GOOD (  11.21  )
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

In WSI mode, ICVEC doesn't exist, thus reading it returns 0, which
causes IOMMU driver to fail to find IRQ numbers from device tree
IRQ arrary. The issue is fixed by applying icvec indexes of WSI IRQs.

Signed-off-by: Jingyu Li <joey.li@spacemit.com>
Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
---
 drivers/iommu/riscv/iommu.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index d9429097a2b5..26630979473b 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1593,11 +1593,26 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 		       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3 % iommu->irqs_count);
 	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_ICVEC, iommu->icvec);
 	iommu->icvec = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_ICVEC);
-	if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
-		    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
-		max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
-		    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
-		return -EINVAL;
+	/*
+	 * In WSI mode, ICVEC may read as zero. Only validate if using MSI.
+	 * Check if FCTL.WSI is set to determine interrupt mode.
+	 */
+	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
+		if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
+			    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
+			max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
+			    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
+			return -EINVAL;
+	} else {
+		/*
+		 * WSI mode: ICVEC is not used. Set to identity mapping for
+		 * riscv_iommu_queue_vec() to work correctly.
+		 */
+		iommu->icvec = FIELD_PREP(RISCV_IOMMU_ICVEC_CIV, 0) |
+			       FIELD_PREP(RISCV_IOMMU_ICVEC_FIV, 1) |
+			       FIELD_PREP(RISCV_IOMMU_ICVEC_PIV, 2) |
+			       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3);
+	}
 
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
