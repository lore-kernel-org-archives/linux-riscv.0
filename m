Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF83BC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SmTMy4b3qwPhxRPtbwim+ofYCGdZL4mbRz/WW/fgvdg=; b=JlA5SM2Qads9nX
	7gVTIP05entGbonVuL5qIDqG5HQln4OdHjXntubGV0+hSTKMCGniChd0j9BkH5oe8xhjXNxYGB4xJ
	4c0WkgaUt7MeV49f4M8rLUpV8yWS9cY6Z164i6CKq+EO2Za0lOy3zQotm5CAwV55yEBXNMDtBHb1z
	AL+wPqwmDo45oTiPWx7sBt5//eyaJC9m6yOYAslurBrD0sonRfN0FQWK9ZKZZ5wEaPcUCG47xRQsf
	E5BnGiOR+I1/da6b7kwhkI5zeqwQRKz9VPnZBBJTKxZxHXkt2qjDvr5/ArrKJpUudnRGEfjwxf68g
	OCHt59bma5cADQ4lIgxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ayG-003FfQ-2m;
	Fri, 26 May 2023 17:11:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ayD-003Fdh-1H
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 17:11:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0E83651C0;
	Fri, 26 May 2023 17:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09AA0C4339B;
	Fri, 26 May 2023 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685121076;
	bh=EFBwhFd9h5qljpxdSxEUl1LBAOZbrYHCRzIQKTfr4Eo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aqSdc9yjds0qBut4705CgMnspNEGuyhW+e1aoMQmGPboAeGFMDVvjfNAGTjvZCgZv
	 CyuYU9rrIt276VNDMQ4RkYntlG86VMvrqucBi6vr9aM+tc8munbsrRU0TZpnlEXrxc
	 UGbQiDbl21o6r6XyAlFF1w10ARU6M7vWRz3B2aYMqI5DQUtHVw/A/DH9hNaGuGnefq
	 O6dfGs+cFxuthKDzH5KyY70wbvnLgHdK9ilEpFIxbOUNcSZfn3hMsTYojY3Ejmoy6I
	 Y241nSqbxB7/nDNx99+A1sYt/6FtGfU2htL7glI0+OfpQ/GhvsPp02cit4tp7RJgfa
	 7kyyc8Qnzh61Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 3/6] riscv: mm: mark noncoherent_supported as __ro_after_init
Date: Sat, 27 May 2023 00:59:55 +0800
Message-Id: <20230526165958.908-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230526165958.908-1-jszhang@kernel.org>
References: <20230526165958.908-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_101117_475498_56372DF4 
X-CRM114-Status: GOOD (  10.72  )
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

The noncoherent_supported indicates whether the HW is coherent or not,
it won't change after booting, mark it as __ro_after_init.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/dma-noncoherent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index d919efab6eba..d51a75864e53 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -10,7 +10,7 @@
 #include <linux/mm.h>
 #include <asm/cacheflush.h>
 
-static bool noncoherent_supported;
+static bool noncoherent_supported __ro_after_init;
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 			      enum dma_data_direction dir)
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
