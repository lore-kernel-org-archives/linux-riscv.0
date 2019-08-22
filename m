Return-Path: <SRS0=8Mks=WS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9FEC3A59D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 06:56:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD18233A1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 06:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Neb1+SEl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCD18233A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJHgMMCHfulH9VaME+gqizFTF2aT8BBCa2FRP0zYqgU=; b=Neb1+SEleJa1r4
	cufzg9UcB2pdapXR9fqexFSV4z78S1c/jQk/kbBJIqnenVxUKAXxK8wwAkFq1rfuGEyYsvsJzZp8l
	Hm/0Qya/Xi9NT8Vs8H10gnLuN0ihARr/Q9QPf4fJ0pmxlxP44kOMqw6tQwWVsC93ClAn3StJkMQYA
	NYgDZuFRssiFEdE9R9h0Ydg0J+3Y/paUrJ8tYLAlqWY5OqSkTRg5W+3KyqixETQ+ip6DzuV5hMZxp
	8f1+NCyiBj4LPhj0+rRHW/yhC+k0hfupepy3nDJkqh/1NBkoIu6B3y6DHPbL4Z+aafJcz4rmtuOU/
	oEvS3ykPhgdwshHWcjng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0h1B-0008ID-A3; Thu, 22 Aug 2019 06:56:21 +0000
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0h16-0008GU-Rq; Thu, 22 Aug 2019 06:56:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 1/8] riscv: fix the flags argument type for
 riscv_riscv_flush_icache
Date: Thu, 22 Aug 2019 15:56:05 +0900
Message-Id: <20190822065612.28634-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822065612.28634-1-hch@lst.de>
References: <20190822065612.28634-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

While uinptr_t is identical to unsigned long for all Linux platforms,
defining a flags argument as an uinptr_t doesn't make any sense, so
change it to an unsigned long instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/vdso.h | 2 +-
 arch/riscv/kernel/sys_riscv.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index 7a7fce63c474..a87a9d106220 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -27,6 +27,6 @@ struct vdso_data {
 	(void __user *)((unsigned long)(base) + __vdso_##name);			\
 })
 
-asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
+asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, unsigned long);
 
 #endif /* _ASM_RISCV_VDSO_H */
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index f3619f59d85c..61f100acbd4c 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -55,7 +55,7 @@ SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
  * in there for forwards compatibility.
  */
 SYSCALL_DEFINE3(riscv_flush_icache, uintptr_t, start, uintptr_t, end,
-	uintptr_t, flags)
+		unsigned long, flags)
 {
 	/* Check the reserved flags. */
 	if (unlikely(flags & ~SYS_RISCV_FLUSH_ICACHE_ALL))
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
