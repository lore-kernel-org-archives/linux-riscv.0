Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A25C2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 19:31:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBC54221FE
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 19:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dmAnQX34";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LAH0bwix"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBC54221FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U0/cjrdhrjL0VXkUE/Zk4beH+seL2poBQuWY0xeOKHY=; b=dmAnQX34WNtqjJYWAufeWeOpgN
	vgV8AXSIgYnY2iX7ea1JPEUGXBubWoy9yU+hNXaL63yNz6ZctbwIadcUgW03e9Qi95v9thRsZbPCL
	ZBfygitAQV3qQvGZ1bDfgSniJE9+cR7SHK2DI6JzePeEkRVKGgPc3x3NJ6ZqMsplTMhVSepJ2sUnO
	1coBA8P+arR+KJAY+w+WK9cM+X1frzbnbl2c1k6Q/TsvUhh+ndqrunpB2MXoZWU9BdFh4gV56Sc/+
	cHI0/ZbRYLoHQo0nwA+imSmpwfJAWNiK39BJIdJjQEIlXRt4Z/YZdxRPZoawNTlUzd+Sq9PJKlspA
	1LkVIERA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf6gu-0000SZ-9X; Tue, 17 Nov 2020 19:31:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf6gt-0000SM-LA; Tue, 17 Nov 2020 19:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=0w7Ozk28Ycs+oUmhikFWAD+C3GsZMaJDoL2VuQ4QW/c=; b=LAH0bwixan6uK8YQ8JD4EflJE3
 siRCA/CVKgxv1pPzkVhV3r53qtSX0jAGKOmXRhI+LU2Y3fPWsGmHslJwRKOucTjTb/qbojQ0PrxUz
 8t5ifqatu4bANn5H4jxLXkvf9D4z0cV/ZYow0UETIVvvk3P3QQVtJzbSb+stcLranSMEhiPXO/Vf9
 AgVOmgh1dhBpF3pbnpnGz2yH1P/ZJl+0D//6o+OUQQuv3LAnGfBIHsdb12H3iCqv39MMxoeJRgkka
 XYD5nhx2qd+nwf0aM/7woXZdL1rQFsv2trE/B8bTzBDcvU0fZ2Z6MAyUlCJTwJiu/8QmrZpKdsakY
 uBxyGYyg==;
Received: from [2601:1c0:6280:3f0::bcc4] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf6gr-0005l4-Gg; Tue, 17 Nov 2020 19:30:57 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] RISC-V: fix barrier() use in <vdso/processor.h>
Date: Tue, 17 Nov 2020 11:30:53 -0800
Message-Id: <20201117193053.18990-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Albert Ou <aou@eecs.berkeley.edu>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, Arvind Sankar <nivedita@alum.mit.edu>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

riscv's <vdso/processor.h> uses barrier() so it should
#include <asm/barrier.h> to prevent build errors.

Fixes this build error:
  CC [M]  drivers/net/ethernet/emulex/benet/be_main.o
In file included from ./include/vdso/processor.h:10,
                 from ./arch/riscv/include/asm/processor.h:11,
                 from ./include/linux/prefetch.h:15,
                 from drivers/net/ethernet/emulex/benet/be_main.c:14:
./arch/riscv/include/asm/vdso/processor.h: In function 'cpu_relax':
./arch/riscv/include/asm/vdso/processor.h:14:2: error: implicit declaration of function 'barrier' [-Werror=implicit-function-declaration]
   14 |  barrier();

This happens with a total of 5 networking drivers -- they all use
<linux/prefetch.h>.

rv64 and rv32 allmodconfig now build cleanly after this patch.

Fixes: 3347acc6fcd4 ("compiler.h: fix barrier_data() on clang")
Fixes: ad5d1122b82f ("riscv: use vDSO common flow to reduce the latency of the time-related functions")
Reported-by: Andreas Schwab <schwab@linux-m68k.org>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arvind Sankar <nivedita@alum.mit.edu>
Cc: linux-riscv@lists.infradead.org
Cc: clang-built-linux@googlegroups.com
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
---
v2: update Fixes: tags (Nick);
    also built allmodconfig cleanly on rv32;

 arch/riscv/include/asm/vdso/processor.h |    2 ++
 1 file changed, 2 insertions(+)

--- lnx-510-rc4.orig/arch/riscv/include/asm/vdso/processor.h
+++ lnx-510-rc4/arch/riscv/include/asm/vdso/processor.h
@@ -4,6 +4,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/barrier.h>
+
 static inline void cpu_relax(void)
 {
 #ifdef __riscv_muldiv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
