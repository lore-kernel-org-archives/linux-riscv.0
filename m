Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3878C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 13:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioX3s/sDCm3RrCSDdW8dc0rtRxSiztohrehv16CPXQ8=; b=vDX8ri4c/xVeAq
	x94iMUzYs9cKafrK5H03EZsGngmCPDW++uQDaTMvsk6GGs5uPcHtVlwmzp6x6gXrr0rlOOOsP7LF1
	O1ozsEeTZMlNJzyeGcz15epk6nFvD3tqAJU/YvfINDJmvxPRwdGFxwq9/rBliPxopxTxQKSoG1V60
	Fe7XWdDE3uYBSr+Hg+LHHBYFGObSJoU1bRVszBYnIIwtRWbnCIODfXOw6MzF6pBR0vx02fd98FRip
	64qlAHHmMoEXWeLIJY66UgrAOb9330Kuk+2lLNsLsoNJG4FN4Q8pdqoDliwrPOhyrSwoRq1ct81YL
	C5sl2p6knV2fTCnIDBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGwf-009uBt-38;
	Wed, 17 May 2023 13:11:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzGwd-009u9u-0N;
	Wed, 17 May 2023 13:11:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9BFB364710;
	Wed, 17 May 2023 13:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB3FC433A0;
	Wed, 17 May 2023 13:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684329114;
	bh=9B5dm6uPcP99pu9DbgwVzUA/R+xqpwJ+x8zkV0/Vqc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KeFwGIi38GKw31XBFip9DpSNaAPrSt+ly1tSHZlHJrUQWVYjO1Fj/sEgW+9BoVS0P
	 1CrH3z3kj7gZ+Vr3uvhUt8V+7wc31EPrn9XE0ouppLIc4CVNNyDqrxV3hSyS0OYCcT
	 l6bP27FiyG5vaBbcs1CEMoLgy4FK3NoP8/k/lHQ4NbbcS554m3wfxgTcIxR8LnL/1k
	 w4FDAsAOVUKikEub9HmaUUnNVrFTBKOFClJ6tqzPc8F5THSvUHsl1wW7KSrODpL1Hc
	 vIHWM9fXWcirhdtfcUUfuWVrVUe5drsdLKZft1YCHcGKupFyIGgZk3oWSTFEILf4s7
	 1sLZ52Eo3Zk7g==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@redhat.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Pavel Machek <pavel@ucw.cz>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	audit@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH 02/14] mm: page_poison: always declare __kernel_map_pages() function
Date: Wed, 17 May 2023 15:10:50 +0200
Message-Id: <20230517131102.934196-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517131102.934196-1-arnd@kernel.org>
References: <20230517131102.934196-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_061155_251862_BE476107 
X-CRM114-Status: GOOD (  15.41  )
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

From: Arnd Bergmann <arnd@arndb.de>

The __kernel_map_pages() function is mainly used for
CONFIG_DEBUG_PAGEALLOC, but has a number of architecture specific
definitions that may also be used in other configurations, as well
as a global fallback definition for architectures that do not support
DEBUG_PAGEALLOC.

When the option is disabled, any definitions without the prototype
cause a warning:

mm/page_poison.c:102:6: error: no previous prototype for '__kernel_map_pages' [-Werror=missing-prototypes]

The function is a trivial nop here, so just declare it anyway
to avoid the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/mm.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 27ce77080c79..e95d7c575ea6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3453,13 +3453,12 @@ static inline bool debug_pagealloc_enabled_static(void)
 	return static_branch_unlikely(&_debug_pagealloc_enabled);
 }
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
 /*
  * To support DEBUG_PAGEALLOC architecture must ensure that
  * __kernel_map_pages() never fails
  */
 extern void __kernel_map_pages(struct page *page, int numpages, int enable);
-
+#ifdef CONFIG_DEBUG_PAGEALLOC
 static inline void debug_pagealloc_map_pages(struct page *page, int numpages)
 {
 	if (debug_pagealloc_enabled_static())
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
