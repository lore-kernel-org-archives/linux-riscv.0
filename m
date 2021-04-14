Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41734C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 12:46:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 005426109F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 12:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 005426109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jZwNbGQ3Y3ZXSzpG5jt3XpobqWJPBhvvN5ja6CQIXi0=; b=j/aNZmoeX9KHS8gH21+Jm+2YZ
	vy0bNuQrebQzzPcbSH0ScfGRc1UcJBU+eKZlgI05aR0Ks4/Fwpj64SL08mh5krr+9ziFYc9sCSYfN
	Adrc6Ls4+zUZYBNDWqU3dTuYtJkQLHTjXOGi6nsX9mID9O5UB5ntUHlxlTGbNVeaTJXNxyNZ2R8xL
	dXTkdP97PKCS2l5ol5Fj5WXArejzjwrNiVM1E7gD7Y8Bq7s/TvsKSN6B/alz50xPp6SOHu3eAA8pa
	LOxzg+M0zkD0xgf3+z21D+bMH3XZOYnuHYexNc+la7Oi+71dSxcEbULb9QZLjtwZkvehoUlHt5UXW
	sNfQ4N0dA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWetv-00CcxX-LN; Wed, 14 Apr 2021 12:45:47 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWets-00Ccwo-Eh; Wed, 14 Apr 2021 12:45:44 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 88DDF30015A;
 Wed, 14 Apr 2021 14:45:43 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4DF3F203CF7D2; Wed, 14 Apr 2021 14:45:43 +0200 (CEST)
Date: Wed, 14 Apr 2021 14:45:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com
Subject: Re: [RFC][PATCH] locking: Generic ticket-lock
Message-ID: <YHbj987Ks0JOKw/X@hirez.programming.kicks-ass.net>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
 <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
 <YHaU4uxr6emrivuu@hirez.programming.kicks-ass.net>
 <YHawVOIHmDPbTmoB@hirez.programming.kicks-ass.net>
 <YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net>
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

On Wed, Apr 14, 2021 at 12:16:38PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 14, 2021 at 11:05:24AM +0200, Peter Zijlstra wrote:
> 
> > That made me look at the qspinlock code, and queued_spin_*lock() uses
> > atomic_try_cmpxchg_acquire(), which means any arch that uses qspinlock
> > and has RCpc atomics will give us massive pain.
> > 
> > Current archs using qspinlock are: x86, arm64, power, sparc64, mips and
> > openrisc (WTF?!).
> > 
> > Of those, x86 and sparc are TSO archs with SC atomics, arm64 has RCsc
> > atomics, power has RCtso atomics (and is the arch we all hate for having
> > RCtso locks).
> > 
> > Now MIPS has all sorts of ill specified barriers, but last time looked
> > at it it didn't actually use any of that and stuck to using smp_mb(), so
> > it will have RCsc atomics.
> > 
> > /me goes look at wth openrisc is..  doesn't even appear to have
> > asm/barrier.h :-/ Looking at wikipedia it also doesn't appear to
> > actually have hardware ...
> 
> FWIW this is broken, anything SMP *MUST* define mb(), at the very least.

As near as I can tell this should do. The arch spec only lists this one
instruction and the text makes it sound like a completion barrier.

---
 arch/openrisc/include/asm/barrier.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/openrisc/include/asm/barrier.h b/arch/openrisc/include/asm/barrier.h
new file mode 100644
index 000000000000..7538294721be
--- /dev/null
+++ b/arch/openrisc/include/asm/barrier.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_BARRIER_H
+#define __ASM_BARRIER_H
+
+#define mb() asm volatile ("l.msync" ::: "memory")
+
+#include <asm-generic/barrier.h>
+
+#endif /* __ASM_BARRIER_H */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
