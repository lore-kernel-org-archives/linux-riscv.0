Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA37C19F29
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Aug 2022 02:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=padx49Iq2WjaJWW8K12L9Jfc7ukmJJkiEFWw6Yw3EzM=; b=DqPMafDUASfRUW
	pAiJ/LOofZ7XJWk5HDciI8LYMBD2dZDSX1nylE82xLMYTSwXupsNsA3sVtn/3MTiarp16vSBcS/ET
	Wg311Hi5NVH/D7n73OQqC3wl8VLb1j4At+3oZ57MUL9NOnZwfNhBIqoBdSczqQNin4uxuYdyJcrN/
	GG0B8uExqsEmDqdIx7GDLqMUFaCnbA6ALkDJM7g6EL/0UQv9RhEIwBa8AZZIkEW2+j7am3sEEq+TI
	TBe5aptvOytVAOuhFNXSRTWub1f8pVJhVZIi6d21P64+z+IrEOxZJ+LaRLMTVj5liTE3E2hDHEKt/
	L/dXDzrgcx+l2pk4+fkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJR0t-00Eua1-9d; Thu, 04 Aug 2022 02:55:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJR0r-00EuLM-Ay
	for linux-riscv@lists.infradead.org; Thu, 04 Aug 2022 02:55:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D9E3AB823B1;
	Thu,  4 Aug 2022 02:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4694CC433D6;
	Thu,  4 Aug 2022 02:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659581701;
	bh=NAbVm/nXXyhNpdbg8nzJ5becF+EsxM+Ud3RVYm5SLI0=;
	h=From:To:Cc:Subject:Date:From;
	b=egesjTcYbSHr1A3+IjC4NFJF9T/4KsnMSAYDAAAZYRz0mEltVwpwq0tv2nD6eBb5v
	 UABfR8Ba0bgrqgi6uK6N/XYONEPLy9ouujpixQB0lTs0W7wAP4fL2Wistj6QKPC/Mx
	 Kknlh7/wlbTON79liAx7P9n3eX5Y5vf1xZXe0Gyco7g5PjnXucIHHCX9Qi1ej4vMc6
	 FrwPjzC8DbdOmhpWQitk7dkFk4wHYUeFzBPferrbm718fdpgDFPeSwLctVGzbpagc+
	 BbMStOs7HzvKaAoyjPyLiLRQ1jg7XIwpJRaMLha2mgSxFgjg0loN+dcgA1oVBSgU0v
	 8/56ig6S1KDnA==
From: guoren@kernel.org
To: guoren@kernel.org,
	arnd@arndb.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Christoph Hellwig <hch@lst.de>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH V2] uapi: Fixup strace compile error
Date: Wed,  3 Aug 2022 22:54:48 -0400
Message-Id: <20220804025448.1240780-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_195505_557568_67E23059 
X-CRM114-Status: GOOD (  12.50  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Export F_*64 definitions to userspace permanently. "ifndef" usage made it
vailable at all times to the userspace, and this change has actually broken
building strace with the latest kernel headers. There could be some debate
whether having these F_*64 definitions exposed to the user space 64-bit
applications, but it seems that were no harm (as they were exposed already
for quite some time), and they are useful at least for strace for compat
application tracing purposes.

Fixes: 306f7cc1e9061 "uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in fcntl.h"
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Reported-by: Eugene Syromiatnikov <esyr@redhat.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Heiko Stuebner <heiko@sntech.de>
---
 include/uapi/asm-generic/fcntl.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/uapi/asm-generic/fcntl.h b/include/uapi/asm-generic/fcntl.h
index 1ecdb911add8..3a389895328a 100644
--- a/include/uapi/asm-generic/fcntl.h
+++ b/include/uapi/asm-generic/fcntl.h
@@ -116,13 +116,11 @@
 #define F_GETSIG	11	/* for sockets. */
 #endif
 
-#if __BITS_PER_LONG == 32 || defined(__KERNEL__)
 #ifndef F_GETLK64
 #define F_GETLK64	12	/*  using 'struct flock64' */
 #define F_SETLK64	13
 #define F_SETLKW64	14
 #endif
-#endif /* __BITS_PER_LONG == 32 || defined(__KERNEL__) */
 
 #ifndef F_SETOWN_EX
 #define F_SETOWN_EX	15
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
