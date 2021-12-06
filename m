Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAF7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 15:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifyRSxFfAqEo79AExPGG4DLRFQo/rimurM93w8B7EX8=; b=3/h2B/vBRC/U4h
	foLRKXr/25oUfk/XSsnn75zAhFKGJ2Rc5uHdoQtl1ttqtdm60sCKYlCfnTOQA79mvjJ5DFlF67SGO
	7gOptRWFlJ7uL4Xji2+Mj/iuurQFwW8yeb5BqG/qlMAl2QxEIGUMCxR/Enx4/AQhlQ0LzQQPdZCjV
	/4ML4m3/I6C3HwjmJkxxxx/RGlWTAgXtScPb/QA92v3vyzFE1XKUvaQRwEvftpdRT8Mh85YvLBDFU
	30q2zG7hWWoS/gF2PS2T12RFk3vPjYnZrkQnkq3owQxWdHwTmpuzxPtEBfXPmafvXpAsj87E+GJxz
	KC/anzK7hMJAH1gTnzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFeP-004PwD-6U; Mon, 06 Dec 2021 15:11:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFe0-004Ply-GI
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 15:11:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C721D61333;
 Mon,  6 Dec 2021 15:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9BAC341C2;
 Mon,  6 Dec 2021 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638803467;
 bh=U/XXFOPv34D0TreArL806EvYm/WhdZkqjsAHo+8vbsc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sBppVPtQwwPnjYq9/6k76KsKhYGK5RsaltsWG1YuSDnb7xcbYZbfQ5XzxyNhKDHqa
 fmCyFVFCpPtaV10H4fZ8c/FpDQWseyd2lMLsvQyBICW9MQ2757wa9EeZkujWDrJmCg
 EcqlKVctM3diiIjRJ6thMJf7bT3QPXsNGwhD299Xhn0/xqn0J8cYJxbFabx8SrsYad
 PSn+9AHoGImkjMbVZOT345oy2WPGJneTdrSGxTSYkz0IlX40nVoa0uzeK9yOP/ODa+
 swlP6vu6ma/Vm27tTxf2wdDpn8EecfM3YxTQkvG4a1hDS0s5BM49OLxQ//O03VzCuf
 q4KGrMxjH6eRA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] riscv: mm: init: remove unnecessary "#ifdef
 CONFIG_CRASH_DUMP"
Date: Mon,  6 Dec 2021 23:03:49 +0800
Message-Id: <20211206150353.731-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206150353.731-1-jszhang@kernel.org>
References: <20211206150353.731-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_071108_681585_FB723FB7 
X-CRM114-Status: UNSURE (   9.67  )
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

The is_kdump_kernel() returns false for !CRASH_DUMP case, so we don't
need the #ifdef CONFIG_CRASH_DUMP for is_kdump_kernel() checking.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 3c0649dba4ff..745f26a3b02e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -790,12 +790,10 @@ static void __init reserve_crashkernel(void)
 	 * since it doesn't make much sense and we have limited memory
 	 * resources.
 	 */
-#ifdef CONFIG_CRASH_DUMP
 	if (is_kdump_kernel()) {
 		pr_info("crashkernel: ignoring reservation request\n");
 		return;
 	}
-#endif
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
