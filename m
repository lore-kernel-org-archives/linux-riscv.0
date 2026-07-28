Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487FEC54F4C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZPNoY/I8KpBv2yiv1BZpaBD0mEpDGg2Hpm8kRdVg8jY=; b=JPat5ckh6/xWjW
	A4oYSvTFzfLSE16F7DQz78PaXDCg5Sv3bUCRfp5FAjlhUzICx+z3yFXZ2zEXGmAbWJQgABpHJqUMW
	DUlleP5bwJLTZBrc59TRnae8cabEf9H2cTdoqev0V1IP267ldUWciQjkPSx1g5jQb7QaZ/ZF2sLIp
	CVc7ynuVrjK+0oyUf21CE3q9x3kPXDnU9HAB/DlbcPd9akHIzv1X4dNZm7rrXFKQNlffrCkVbVOVz
	iQWTwJfF5o67rdMh782wdx9szGL5oiPiEO/RyY6F5n9MzjG1O+GtOdXgWvfVEqo7yBL2pVrn6VHWU
	pPWkMY3sq4JAPJyAJ0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woic0-00000005Ruy-02np;
	Tue, 28 Jul 2026 14:16:52 +0000
Received: from out28-123.mail.aliyun.com ([115.124.28.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woibw-00000005Ru7-1XX0
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 14:16:50 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.0744582|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0077261-0.0014522-0.990822;FP=2580275551777208554|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033045213054;MF=mingfeng.lin@redrisc.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.iXVrDu6_1785248193;
Received: from open01.kxhcluster.com(mailfrom:mingfeng.lin@redrisc.com fp:SMTPD_---.iXVrDu6_1785248193 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 28 Jul 2026 22:16:39 +0800
From: Mingfeng Lin <mingfeng.lin@redrisc.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Mingfeng Lin <mingfeng.lin@redrisc.com>
Subject: [RFC PATCH] riscv: kasan: Flush TLB after switching to temporary page table
Date: Tue, 28 Jul 2026 22:16:30 +0800
Message-ID: <20260728141630.1635367-1-mingfeng.lin@redrisc.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_071648_572389_404623F3 
X-CRM114-Status: UNSURE (   8.04  )
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

kasan_init() switches satp to tmp_pg_dir before clearing the early
KASAN mappings from swapper_pg_dir. Both page-table roots use ASID 0.

A write to satp neither invalidates address-translation caches nor
orders page-table updates with subsequent address translations. An
out-of-order implementation can have speculative memory accesses and
their page-table walks in flight when satp is written. Without an
SFENCE.VMA after the switch, such a walk can complete later and install
a translation derived from swapper_pg_dir while that page table is being
cleared.

This is especially problematic with KASAN. Compiler-inserted checks read
KASAN shadow memory before ordinary accesses. If an obsolete or faulting
translation for the shadow is installed, the shadow load raises a page
fault. The RISC-V page-fault handler is itself KASAN-instrumented, so it
performs another shadow access before it can handle the original fault.
The same bad translation can therefore cause recursive page faults and
prevent kasan_init() from reaching the final satp switch and TLB flush.

Flush the local TLB after installing tmp_pg_dir and before clearing
swapper_pg_dir. This also orders the writes that initialized tmp_pg_dir
before subsequent implicit page-table accesses.

Fixes: 96f9d4daf745 ("riscv: Rework kasan population functions")
Signed-off-by: Mingfeng Lin <mingfeng.lin@redrisc.com>
---
 arch/riscv/mm/kasan_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index c4a2a9e5586e..a2a1051590e3 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -487,6 +487,7 @@ void __init kasan_init(void)
 
 	create_tmp_mapping();
 	csr_write(CSR_SATP, PFN_DOWN(__pa(tmp_pg_dir)) | satp_mode);
+	local_flush_tlb_all();
 
 	kasan_early_clear_pgd(pgd_offset_k(KASAN_SHADOW_START),
 			      KASAN_SHADOW_START, KASAN_SHADOW_END);
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
