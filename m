Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA88C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 07:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkBzkmj/ULDxEeKWAoNdACcShYq20LVWWs0HNpW3ZmA=; b=xyTFHNsSlJ9TB9
	zD74Sfdv8aRX84lmtGqGbtHa2NVA8Dt6R8BIm2/PtHPtGlpSXOLe66AZUYZI2ZVZ4MWMwELlKoOZI
	9A0Qj8cUe6f1tm1DsPajEFq5dUqpLP2NFYoA055+Oj7y7xMWo1GP76YfS0yUsqpqcbg7XfoR4IEZ3
	7In/3chikzViFL1tnrJ81DP+BUsltVGg51DZv7v/4vc/b0zdZAlrWIktXs+CzX64Oz4FUGdfGnawA
	LeLB8GqPKm+JfLVufxm3dWJRfYxWgRutedXTurdmw+LBzs3tFL2zREMchfrgqHTOkYFbsvK/waWkp
	8vy0jwkKj64HZiBomUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8q-000MWg-Bf; Thu, 06 Oct 2022 07:18:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8m-000MTj-Tl
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 07:17:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 469D0B81A76;
	Thu,  6 Oct 2022 07:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DEEC433D7;
	Thu,  6 Oct 2022 07:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665040672;
	bh=w9W7UBpVdspzCyp6qUSPQAQAXbvMYaSbMRYZmTO4oSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t1HVQJNxlNTNOXW0QK/oloZXr/BfPEYQmtRgt+XfD5WPHOtKRssM2aR3KVYJfEzOV
	 xzRBv2NPcusfEyme5F8TuA/xyELvb7joEpSGuNMo7PnsUqt+FJSbL3vQpwrr7RJfjy
	 jsw6d94M7lhEHj6hnuIHHx3EoFnt+qmIblM12CxDeGXF9vrPIBGJdKy9Fdnk/R2ep2
	 8hUX+H7r1d/zw91NxlqKgChRu0h+uPqmRy62YhYLIofwiCdFCrHeoxc371xNNFGqkS
	 Mfurgm+G/9HtR55C3+E4BEQIHBMuiACaB5dMsWfEPelLDVpAUC4pwlYNULWa6cTXqo
	 IQLqY9Y21g1TQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] riscv: move riscv_noncoherent_supported() out of ZICBOM probe
Date: Thu,  6 Oct 2022 15:08:11 +0800
Message-Id: <20221006070818.3616-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221006070818.3616-1-jszhang@kernel.org>
References: <20221006070818.3616-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_001757_144664_B8DFE87A 
X-CRM114-Status: GOOD (  11.69  )
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

It's a bit wired to call riscv_noncoherent_supported() once when
insmod a module. Move the calling out of feature patch func.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/cpufeature.c | 7 +------
 arch/riscv/kernel/setup.c      | 4 ++++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3b5583db9d80..03611b3ef45e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -272,12 +272,7 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
 	case RISCV_ALTERNATIVES_EARLY_BOOT:
 		return false;
 	default:
-		if (riscv_isa_extension_available(NULL, ZICBOM)) {
-			riscv_noncoherent_supported();
-			return true;
-		} else {
-			return false;
-		}
+		return riscv_isa_extension_available(NULL, ZICBOM);
 	}
 #endif
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 2dfc463b86bb..1a055c3f5d9d 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -299,6 +299,10 @@ void __init setup_arch(char **cmdline_p)
 	riscv_init_cbom_blocksize();
 	riscv_fill_hwcap();
 	apply_boot_alternatives();
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+	if (riscv_isa_extension_available(NULL, ZICBOM))
+		riscv_noncoherent_supported();
+#endif
 }
 
 static int __init topology_init(void)
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
