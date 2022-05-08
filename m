Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACBBC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  8 May 2022 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CM3r+HISzq0DSuyVzk1Q6O1/veMJNzqVzY44TtM+R5o=; b=n5hozTIZIxYlPj
	MKshNcCCfPjR5cpMvN2QfHjE7v9/DQVmKJsv0ETWTKkg7LoE5Y86PCJlNpglcb//4gToQrHjqAovU
	3BLdJwHIb5Vfn8RAKxUzUktoiFQUBNefow/xrlPrDc/hDjEiX+pinH2qv3PyY2Pj6cuQXa8RDGoXE
	zPvy21eu7asx/IWFTpKY81OHJXODwBJ+11gpuPD3H8MKi17jQ+UAV0bmHRvvd5dDr/gi1tkgsN/El
	q7XERUJJJ/etZ/opon5g+tOaqVe/r3aBEdP+yBjpaiIOe/ztpS24E2BGHsu8DQT8UdAQh+69R/kBK
	N1BS/F5Tu/LVBdqu/Q1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnjaD-00Aazt-1k; Sun, 08 May 2022 16:16:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnja9-00Aayj-RE
 for linux-riscv@lists.infradead.org; Sun, 08 May 2022 16:16:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB41E611F3;
 Sun,  8 May 2022 16:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21AFC385AC;
 Sun,  8 May 2022 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652026583;
 bh=CkIfvyZhn3UwDJ95LJhpy4E2fC0AEDACS/lXd1lmtwM=;
 h=From:To:Cc:Subject:Date:From;
 b=JGdlu0gLkAb4XE6UFvVOrQL6j2fjO/l6RdQhmATeanZ1iTdtm2tZFccq3eWQB9q+E
 VFBx+xKbpKkvYmW6Ei4J1Xo4vKGUPPIPf2Hxh0w/uvM0LVhvj8T27N4NfRJ1xUTIli
 XV2fOkCDlnt+GhlYNh0WckeoeJYrMGD4JtoHexNPrYFiNHNzy38X0t0zSZeQiYIHL3
 yvDv9UZZHwV6MkL4hIZfUl0K8HIMed3lvnE5TxrK1eKT6k0UCCU1R/YYVwvFwQyLVo
 bHxiTLDjYh2p/jwA6Yzpz+Wf0RXNKz4B2Mcmkaswo5bwDY1RePoM6CX/QnrDqFkwLk
 /1qwsgtP83pqw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH v2 0/4] unified way to use static key and optimize
 pgtable_l4_enabled
Date: Mon,  9 May 2022 00:07:45 +0800
Message-Id: <20220508160749.984-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_091629_962229_2299E93A 
X-CRM114-Status: GOOD (  14.56  )
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

Currently, riscv has several features which may not be supported on all
riscv platforms, for example, FPU, SV48, SV57 and so on. To support
unified kernel Image style, we need to check whether the feature is
suportted or not. If the check sits at hot code path, then performance
will be impacted a lot. static key can be used to solve the issue. In
the past, FPU support has been converted to use static key mechanism.
I believe we will have similar cases in the future. For example, the
SV48 support can take advantage of static key[1].

patch1 is a simple W=1 warning fix.
patch2 introduces an unified mechanism to use static key for riscv cpu
features.
patch3 converts has_cpu() to use the mechanism.
patch4 uses the mechanism to optimize pgtable_l4|[l5]_enabled.

[1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html

Since v1:
 - Add a W=1 warning fix
 - Fix W=1 error
 - Based on v5.18-rcN, since SV57 support is added, so convert
   pgtable_l5_enabled as well.

Jisheng Zhang (4):
  riscv: mm: init: make pt_ops_set_[early|late|fixmap] static
  riscv: introduce unified static key mechanism for CPU features
  riscv: replace has_fpu() with system_supports_fpu()
  riscv: convert pgtable_l4|[l5]_enabled to static key

 arch/riscv/Makefile                 |   3 +
 arch/riscv/include/asm/cpufeature.h | 110 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/pgalloc.h    |  16 ++--
 arch/riscv/include/asm/pgtable-64.h |  40 +++++-----
 arch/riscv/include/asm/pgtable.h    |   5 +-
 arch/riscv/include/asm/switch_to.h  |   9 +--
 arch/riscv/kernel/cpu.c             |   4 +-
 arch/riscv/kernel/cpufeature.c      |  29 ++++++--
 arch/riscv/kernel/process.c         |   2 +-
 arch/riscv/kernel/signal.c          |   4 +-
 arch/riscv/mm/init.c                |  52 ++++++-------
 arch/riscv/mm/kasan_init.c          |  16 ++--
 arch/riscv/tools/Makefile           |  22 ++++++
 arch/riscv/tools/cpucaps            |   7 ++
 arch/riscv/tools/gen-cpucaps.awk    |  40 ++++++++++
 15 files changed, 274 insertions(+), 85 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpufeature.h
 create mode 100644 arch/riscv/tools/Makefile
 create mode 100644 arch/riscv/tools/cpucaps
 create mode 100755 arch/riscv/tools/gen-cpucaps.awk

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
