Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5686C2B9F7
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 18:55:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 812B361360
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 18:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 812B361360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8Nv+7EY23Ye+JYzmka1qhdMiyTi4FVRYWf4OfRi64RQ=; b=xt2o8fvxu+xaW9
	a/bAdzVTL2AGy5GNTEaa91x/h5jXxUoNzEGI054jeCOJ+iCb4tXqYSglATb0Bv+f8WLfXcmpsAXBe
	/eUURs5u/E5cEzEw0KDMG5AGOp5qyGMHsp4Zi1P6VF38VBhZozx1G7jJsnN3pDLPiLwJygORD7ja2
	LQ1/KUe97raOVVz5UGzClETwlCK5zyrhPhZ7uH9klf/urJ1Q8yvYwrnWuWg3GUOJ+rrf/VaYuhaw/
	p869ZfMEYmpDP7r6Vh2jldyTHLZWi5c9RMXbuS0sMYwe5VOfgyxgMkzYCwznFhZQBv3mu8/nbpXQx
	VJmBeXSipt/XKQXvfHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llFiz-001Yho-Lc; Mon, 24 May 2021 18:54:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll4RS-000j6W-EO
 for linux-riscv@lists.infradead.org; Mon, 24 May 2021 06:51:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A9CF6105A;
 Mon, 24 May 2021 06:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621839116;
 bh=hn/pNdORUktwb876bgR0Q9d7/7wCHAT4MmtogXIo1fI=;
 h=From:To:Cc:Subject:Date:From;
 b=OyLPKyKN4zCBvU1tXo+4+eiqPf0uANbR6+w/b1cVC6Hb6dyNlVHepztt/rGDEDz3S
 QAJ4G661BTNRHFqAsX7vn2T9uldInvS0oEc/jRsgscxg3Xo7CQGDzsy2449DxBtmsP
 eSKyh3moIbEbOZfntQbDUui/mYqJUBYDmg5RJDod/X6QQwxyosXHNQNlreC0k3+lo0
 j1ZMCqqjh6d+xn/ZDbyq9NYzsUn/gutXKm8ixERLfxWudQoVvgbx1r7jHPt14GdXj7
 tzMq5Q4YWwpfYz19ZUdjJK7eYdZWyGcEPpFfo/L7OOqfkRfz+23uraImrNrf3rOct/
 tM1L24PbV4j9g==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 1/3] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
Date: Mon, 24 May 2021 06:51:06 +0000
Message-Id: <1621839068-31738-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_235158_527647_DC2F130F 
X-CRM114-Status: UNSURE (   6.53  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Kernel virtual address translation should avoid care asid or it'll
cause more TLB-miss and TLB-refill. Because the current asid in satp
belongs to the current process, but the target kernel va TLB entry's
asid still belongs to the previous process.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/pgtable.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 78f2323..017da15 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -135,6 +135,7 @@
 				| _PAGE_PRESENT \
 				| _PAGE_ACCESSED \
 				| _PAGE_DIRTY \
+				| _PAGE_GLOBAL \
 				| _PAGE_CACHE)
 
 #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
