Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE3ED25039
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 06:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2fBeliUj5Tj5XMc5fXBI55qI93x3OuRMrgOY+Nq1HE=; b=R4vTE7ocFGTYRn
	Y2Rxpr8v52PhZpMlBLypnFUc/4VYnYpM9JP3oqN9q5LZfx1CJB3885vO1oijP8qF8YknAKfBwu5Ln
	JwsssNeouzEYxXBlU+0PaFHo85aQ94hObR1hCVQ6e96uIGGmKahIiLYGcIPsFmw4kzSxO+KnMju2y
	FcwmaBU44WVff4NpPgTMUwKx4bwxhdyjVYuL/Zgh1pgp0PczOsBqewA/cnTsXPFVpjA4ntu2bAZRe
	gJt1qkeS2nQSYxmd0I6DtS0fT1k3cB/Lsm4rhAJZj4bv4C97Pjdfz6Fv+2eZOhQ83Qjvnf/xCwyAt
	T6qrxdFemj92GgP+ayLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfBtl-00000004qVv-3gVd;
	Mon, 12 Jan 2026 06:59:33 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfBth-00000004qVK-2tKO
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 06:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1768201169; x=1799737169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S86iPthB8Mz0CkECZazPVHa80rEM1013uyEDwE2IV5A=;
  b=Z8SonNeHzz+dz1Ke/vWL6sWo0evkUlF4oQvSx+xrUho+E0G0hBhCpD04
   JZQPKbwEWbWXfe5mIibFyucQ23SM39Og34xjPAeOA/6oPU4fcnJfy5+0p
   2g4FddbmG/cibus8cSgsgJOqvOucAZvqwWySLLcLhsOu6afyIveqPiHPe
   Ss7J9ODQeuY09b3SeSxjru6e/6zzLaWlmg+A5G+udE5OWik4OvAHFQOas
   fFhgrWYlwBMK8bL8hreEAiKbq0d+2BwYMBw93vFOCyAPPOdVUaOkn5Zdo
   0cWiSp58WiQoNwUw9AJC18uRnTkZMB/EgdOQDgimFwTwmZl6cb0okiIOD
   A==;
X-CSE-ConnectionGUID: BFmpUzc5RUCL7usDFXN6FQ==
X-CSE-MsgGUID: oUc5HCzQS9yTWs1GiycC+w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 08:59:25 +0200
X-CSE-ConnectionGUID: EsrqnE3ATQuiZ4VSoKzRGg==
X-CSE-MsgGUID: qZ26/BZARpCbFJcbJb1pDQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 12 Jan 2026 09:01:12 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 12 Jan 2026 08:59:24 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: lkp@intel.com,
	mick@ics.forth.gr,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	vladimir.kondratiev@mobileye.com,
	Vladimir.Kondratiev@mobileye.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	hch@infradead.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: [PATCH v2] dma-pool: don't allocate DMA32 pool if no 32-bit memory
Date: Mon, 12 Jan 2026 08:58:56 +0200
Message-ID: <20260112065857.3137331-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <202601120747.TAMpIDnI-lkp@intel.com>
References: <202601120747.TAMpIDnI-lkp@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_225930_264432_43B255C7 
X-CRM114-Status: GOOD (  12.66  )
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

If system have no 32-bit memory, GFP_DMA32 pool allocation will
obviously fail, so skip it.

Changes in v2: use arch-independent "memblock_start_of_DRAM" to get
DRAM base address

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 kernel/dma/pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index ee45dee33d49..ecd77a0272f2 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -209,7 +209,7 @@ static int __init dma_atomic_pool_init(void)
 		if (!atomic_pool_dma)
 			ret = -ENOMEM;
 	}
-	if (IS_ENABLED(CONFIG_ZONE_DMA32)) {
+	if (IS_ENABLED(CONFIG_ZONE_DMA32) && memblock_start_of_DRAM() < BIT_ULL(32)) {
 		atomic_pool_dma32 = __dma_atomic_pool_init(atomic_pool_size,
 						GFP_KERNEL | GFP_DMA32);
 		if (!atomic_pool_dma32)

base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
