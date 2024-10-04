Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5088CF885A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 19:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKLzFZCuSdJpbFJbB3DAC+hr81FWmeXX+MDPLYfQ/Co=; b=Jc7/P36XHqfgeu
	2dRu3DikphhLvB+gNcub7w2qcbM0QlhKbqMcKFnCPgsAB8JImDvusX9NZySQd1TpgIUlD50Y6gXRB
	ezLGvPxcWFyqATqsBjZ1F4WB+RoFshkZtQjacQpg6SiokobJ4ECTGICvVIwTt1gKk1UB/yiJ1VCNs
	c6SKCLA+NXf9ROC5lrTpcoy6pyhYF/N+2xN4yEZ3lE31+GStezGzojbRmMUqHDWa0/4aHOliopk5I
	tVZ1R0BWXRCjDy3DFF5fQgd3JUg+YOXaXkZBnTx6P1DCCUb55Bz+LgA/GYDYN2tezPbFrkdLZUCIE
	YGEhookBGtzsUp1K6N2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swo27-0000000DujP-1xso;
	Fri, 04 Oct 2024 19:32:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swn22-0000000Dhg2-1POO
	for linux-riscv@bombadil.infradead.org;
	Fri, 04 Oct 2024 18:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Dh6e7TC6y0r+780Sx8h+VCv6oYXqaMiqaz7H838+hqo=; b=JZYf0pjZKmmAvkoOaQGZOgwepA
	RmYMxIQC0frfZXQioBxpcxcX+MBacDLwYkNU2zo+5p6EJwhABYM6YgF96BfemXzVf9zfp68RAzOeD
	eEiDQCz0wcH2nTyy64jZuoP1Dt0BhhIuBx3n7Q0daibUH6xy5caXDJ/thXiYC1J+bh+3+TFbKSWPm
	mff7zDdgtSdYDw/im1Q0bzNfjVKkovZz5XFMBkJrgo3rcJFnoE3stGyOM7FEDXb272N2CXBB8K1St
	0m8khVFoVK75hgEkiQCjJ3nNGn2qyzGv1QfIAJ10jUY5Crc8KrVsjFQ9an5cAZlkOrYo9TDesKLsO
	PQkFhUzA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swn1y-00000003smF-2xYz
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 18:28:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FD635C5BFF;
	Fri,  4 Oct 2024 18:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBD4C4CECC;
	Fri,  4 Oct 2024 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066477;
	bh=lQwW8GvhU7cntpyWPbWqgvJ1TFtT/WD4eXCDKKYmQDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ptjxfsPpJSg5gdYuejUtwHSh8A1bGddY9nY9BIDu/R94pYny8MAoBOmUkBBCQaBEx
	 Wbg1zfG1xqG6RyanxvfOnWkoOrXS7TonWpE5X0mEf5feB5p4DSP3szxM0zZ1k9DfVu
	 ezPSr6TCqv4NAWD9AAKuXGo3rr4LjTRDzvht+au2B7vMBzS3Rnl/ng4ZaovACqDfko
	 JP3UX3Uq5TrxiE17lOS3Hib2gBIDtlpRdZuPvPIJ2+CZyY491oHHdLida59bylJINT
	 kbB4nvLuiTViJhIRji/ykoG6DAfwDWIq4IC10y2w7AECfQeOlP0PHEFLqno4VJYLPK
	 bFeRiULTqPXKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 21/42] RISC-V: Don't have MAX_PHYSMEM_BITS exceed phys_addr_t
Date: Fri,  4 Oct 2024 14:26:32 -0400
Message-ID: <20241004182718.3673735-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182718.3673735-1-sashal@kernel.org>
References: <20241004182718.3673735-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_192759_132733_F540D463 
X-CRM114-Status: GOOD (  12.22  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

[ Upstream commit ad380f6a0a5e82e794b45bb2eaec24ed51a56846 ]

I recently ended up with a warning on some compilers along the lines of

      CC      kernel/resource.o
    In file included from include/linux/ioport.h:16,
                     from kernel/resource.c:15:
    kernel/resource.c: In function 'gfr_start':
    include/linux/minmax.h:49:37: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '17179869183' to '4294967295' [-Werror=overflow]
       49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
          |                                     ^
    include/linux/minmax.h:52:9: note: in expansion of macro '__cmp_once_unique'
       52 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
          |         ^~~~~~~~~~~~~~~~~
    include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
      161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
          |                           ^~~~~~~~~~
    kernel/resource.c:1829:23: note: in expansion of macro 'min_t'
     1829 |                 end = min_t(resource_size_t, base->end,
          |                       ^~~~~
    kernel/resource.c: In function 'gfr_continue':
    include/linux/minmax.h:49:37: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '17179869183' to '4294967295' [-Werror=overflow]
       49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
          |                                     ^
    include/linux/minmax.h:52:9: note: in expansion of macro '__cmp_once_unique'
       52 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
          |         ^~~~~~~~~~~~~~~~~
    include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
      161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
          |                           ^~~~~~~~~~
    kernel/resource.c:1847:24: note: in expansion of macro 'min_t'
     1847 |                addr <= min_t(resource_size_t, base->end,
          |                        ^~~~~
    cc1: all warnings being treated as errors

which looks like a real problem: our phys_addr_t is only 32 bits now, so
having 34-bit masks is just going to result in overflows.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Link: https://lore.kernel.org/r/20240731162159.9235-2-palmer@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/sparsemem.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/sparsemem.h b/arch/riscv/include/asm/sparsemem.h
index 63acaecc33747..2f901a410586d 100644
--- a/arch/riscv/include/asm/sparsemem.h
+++ b/arch/riscv/include/asm/sparsemem.h
@@ -7,7 +7,7 @@
 #ifdef CONFIG_64BIT
 #define MAX_PHYSMEM_BITS	56
 #else
-#define MAX_PHYSMEM_BITS	34
+#define MAX_PHYSMEM_BITS	32
 #endif /* CONFIG_64BIT */
 #define SECTION_SIZE_BITS	27
 #endif /* CONFIG_SPARSEMEM */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
