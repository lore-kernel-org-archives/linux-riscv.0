Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9008C00140
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 14:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I6FdGBR5Q99sHRcX4jEfWN/s2EiQy5PU/mhMaNNECSA=; b=XsWE0zf4q4+6Ro
	BKw06iXUS5tYC3pjzDG4bS0Ri3HgAvsT198DHL5Fg5/nwSfd1p2Ah/+mh2NawIph6Eq5WJuLcQZUP
	bxZV96iQzev86oXD2nkRW0tjRel5/BpGylMaognjvl7GcFqlX7QvnAI0SxKNWld2TUhW81jTnS5Gy
	7+Jioieq99HslrF+q9RsZgO1RKCpYWbmKeMjf+ajfP+V8OQkZBqhyOq5iWBdNESIrQwJy+DT4k/ww
	l39IeTZGxpAUndaR5HzU5v36vsIErcAVn6Hb+KVklCzx32f3du7U8qXeJ311FC2PxGttFXvb723y0
	5uChxAShT6mFZgv7N1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPlvN-00BHsx-GW; Sun, 21 Aug 2022 14:27:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPlvJ-00BHpK-Np
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 14:27:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BAED60ED9;
	Sun, 21 Aug 2022 14:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3276EC433D7;
	Sun, 21 Aug 2022 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661092052;
	bh=w/PkrSzM/YSb7wa9LQoXCP3wB1H/7EbaPvzXWLdFQ+4=;
	h=From:To:Cc:Subject:Date:From;
	b=P4l2sSNSRd6fKLtyuxgZwmpLCFeiqXTLY9U4TL0OmoXNDrsHG8VL38AT2ZluD2vJB
	 NNSWMuaqhAH37SPiydGhEUaxFg3JVs8RekJDNEx/h9ZIUNfhFB5etI0WQJJYQkCoZK
	 bM/9xz6vyNEntdsT+ver8E+Xaudsb7vliVcdpIB6gqOUg2XFUDNb7B7lqJ3lmD7JB5
	 Dg7Itif42nhm+IhpXPwJbrGoQ2NScayiwYBp15qlKVa5FyroK2ETTQaQ1oX3Eh3vsf
	 AX7Ei1U9ofCYz1VImXqyZuZI1Mq10eJe/lCuG3KVdHF+gxTs7m9F89Aa7gz73VXzUE
	 ywmHsn++m3hpA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: compat: s/failed/unsupported if compat mode isn't supported
Date: Sun, 21 Aug 2022 22:18:19 +0800
Message-Id: <20220821141819.3804-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_072733_923811_FB05BF0D 
X-CRM114-Status: GOOD (  12.20  )
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

When compat mode isn't supported(I believe this is the most case now),
kernel will emit somthing as:
[    0.050407] riscv: ELF compat mode failed

This msg may make users think there's something wrong with the kernel
itself, replace "failed" with "unsupported" to make it clear. In fact
this is the real compat_mode_supported meaning. After the patch, the
msg would be:
[    0.050407] riscv: ELF compat mode unsupported

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index ceb9ebab6558..b0c63e8e867e 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -105,7 +105,7 @@ static int __init compat_mode_detect(void)
 	csr_write(CSR_STATUS, tmp);
 
 	pr_info("riscv: ELF compat mode %s",
-			compat_mode_supported ? "supported" : "failed");
+			compat_mode_supported ? "supported" : "unsupported");
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
