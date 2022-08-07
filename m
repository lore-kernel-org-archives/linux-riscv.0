Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9349C25B08
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Aug 2022 22:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hq8lGrJTxc71d2sEV+DxaoC6jrPCbP9RwwDgV8aEC+I=; b=UU1dlthHIB4gLQ
	p0N6wm2QwoAKybhuEywlGnHnV/xF9s7CZG3bZo4dg8YkoDkGhmGMi2l9SzKWStgdCmBFbYkwI8l9Q
	4XD8GdLDSN0r2hXXgeRVTv5McK+ggkgpz/Dt9HHfu1fwbheRmrtttdKg/lIuYNPc5KYwZMjiUzKWS
	10vnsnIDR8K2hljU5Z9qHvkyCQzMmJCENinzmiCY6TQ8gwZy73KR5f6tRJ3q4O6SibBUM/hpToHeg
	+jstFyF+AsVdOHN5I8kfTLgSdzTAFyV/sJrd2Dobq6l+L2A4zpxakC/hDGM0nwrqnhlnj5TzOjcD4
	O1qhigtI9HGDXP1Qy8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKoT9-003SXy-Uz; Sun, 07 Aug 2022 22:09:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKoSu-003SKW-4r; Sun, 07 Aug 2022 22:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=x4+1SyuBnrsfLH3HBApRgaK+TGzqaCKJHHZnZyL8QS8=; b=nu/cBWDS99rOTqn80qBNQjT8uK
	XOac2xWsTFDD6kBvHa9wYsprv1AqpHPZKL4PmsfGHE5hCfXSv/H8H2/teaAbY+TDBirmg9n1wxjOt
	6PdTk8pOpKx963XwOBtwXdCEF/4LB6zLW4LEWT29np7gUmbCZy5XsE18f0XwWGyFjka9nVaKLAyQf
	lXghFir0KRS6W6jQBOwRu9XqavxA58iXNUINdo/muia/uZRyQ/jEiLzO/wZ7k6yCQaJcLxf4tza4y
	3XHJG3eJKKEptiHDJTINiY8H4vKwk/7gtGxgrVrM8Yrj1kw6eopKjPQ5+wOImhQoVfu8+W6IO3HKs
	uBNZ2e8g==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKoSq-00DL2b-E7; Sun, 07 Aug 2022 22:09:40 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-api@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v2] kernel/sys_ni: add compat entry for fadvise64_64
Date: Sun,  7 Aug 2022 15:09:34 -0700
Message-Id: <20220807220934.5689-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
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

When CONFIG_ADVISE_SYSCALLS is not set/enabled and CONFIG_COMPAT is
set/enabled, the riscv compat_syscall_table references
'compat_sys_fadvise64_64', which is not defined:

riscv64-linux-ld: arch/riscv/kernel/compat_syscall_table.o:(.rodata+0x6f8):
undefined reference to `compat_sys_fadvise64_64'

Add 'fadvise64_64' to kernel/sys_ni.c as a conditional COMPAT function
so that when CONFIG_ADVISE_SYSCALLS is not set, there is a fallback
function available.

Fixes: d3ac21cacc24 ("mm: Support compiling out madvise and fadvise")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Cc: Josh Triplett <josh@joshtriplett.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-api@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
---
v2: patch kernel/sys_ni.c (for any arch) instead of arch/riscv's
    unistd.h (Arnd)

 kernel/sys_ni.c |    1 +
 1 file changed, 1 insertion(+)

--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -277,6 +277,7 @@ COND_SYSCALL(landlock_restrict_self);
 
 /* mm/fadvise.c */
 COND_SYSCALL(fadvise64_64);
+COND_SYSCALL_COMPAT(fadvise64_64);
 
 /* mm/, CONFIG_MMU only */
 COND_SYSCALL(swapon);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
