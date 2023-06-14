Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3E8EB64DB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 17:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbOKQvHqJsgtuvVBw1Oc8OMoelL/doHyUinBxSDbKSI=; b=RmlPNdwHDGWWUy
	FS4qL6qz/sULFlbfkMUFgt5UttCf6QVm1pR8eQ7XUh8IQ9oqT/qDH3DO+hTCqzzghhAtkmJSUnD+o
	o8gtj8QcHRhI94o+ZiLRVM2nEnGbaMUZSB57HudOCuv5Qgo08hm0shW+n0Rz/2phP5iPqooxHRobp
	wRQ88rZk3/NHYQsCWtevl96cYLtWq3kdshJaD5nKBLrkWfwDsB1oT1EouvBE+YlxkHFuOTRAisQ+W
	NrlGQYngGDFdss8B9BEEv04T/9iOH1s1x8kBlJifXrlrRndMNH5GOCNMQ5FmiMP84XAA9JNyrzS+i
	YwmNmjXLMke41J4Oc47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Tx3-00CIgF-2U;
	Wed, 14 Jun 2023 17:06:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Tx1-00CIea-0G
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 17:06:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 936F4644D0;
	Wed, 14 Jun 2023 17:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95D1C433C0;
	Wed, 14 Jun 2023 17:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686762390;
	bh=r6WmK6pN8JZLuhkdUWl3EWEdgWXW6Xnybl6dJtROQn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nZaXe/FqPg/6fky/CfXosBUmIW2Noo0nes4r5ymfjKVsNeqFuSRyQAxyHOhicbU4t
	 xguaueQOiZ7lg7LuC9SFyUrh2P0DrP3BRZFk6aEj9nORUFle74Q5tC3e4MSpJGVIf6
	 iAj3cXwcdUq7gEUrskoIk0W5QGsDA6llLPqkweStT0KmYkBlSmlFQOTLsM/fQ1O0Qk
	 56pLS9sQSNLyZrPYWsipzdZWhQ0Mv8kFIuGEJ5pgp+58IqvqMeiX8ZtjYPh+F2mr5c
	 RBtDCpKC/7v0rAvStUEsSXbFRMkDH0hhOUcuriJEokWCAD6jTa0Zy7HMREtmJj/CK4
	 vBbwyiuiVZz3Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 3/3] riscv: mm: mark noncoherent_supported as __ro_after_init
Date: Thu, 15 Jun 2023 00:55:04 +0800
Message-Id: <20230614165504.532-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230614165504.532-1-jszhang@kernel.org>
References: <20230614165504.532-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_100631_164655_8616632F 
X-CRM114-Status: UNSURE (   9.62  )
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

The noncoherent_supported indicates whether the HW is coherent or not,
it won't change after booting, mark it as __ro_after_init.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
