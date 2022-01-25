Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FAAC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 16:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UMs9j0NSTcC5jH0F9hryIkgYuxv0Q54baJpnYGDwbhs=; b=4YMyYvaZ5gMv+p
	W+hsoIqiMCHrOOb80ZMMBkxe4pJbFmaadZZ0hppyMtMefvSPqO4mRWBSATI6VPUsOoHHVkJjKUNuS
	EJHpsZsCVPdFKnGokss88F4MWj0/e9DcqBKk+ixBE7AbT2nP2RIudg/Kw9XZzMVVQHgSAoJqeYre+
	OBs/FJuYAamseWyK+oG9FQpLgVq1NbKLn+HX1TXO6u2nmVgxdx96xhF9qyN93wDqB5iE23bcZzC1c
	BpkXduigtEFQqTv4vx71laBfIsUwXAx3ehTimL/DBTelgcRW3ZaVoDSDPE6c76JYKKre1HH3o6AWy
	x4NIMyzHWhzR6nHXjwxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCP95-008oiy-0X; Tue, 25 Jan 2022 16:58:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCP91-008ohc-O9
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 16:58:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48BE260907;
 Tue, 25 Jan 2022 16:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADE8C340E6;
 Tue, 25 Jan 2022 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643129890;
 bh=uOqnm11FpH1adpfb3UZE/9ohT+Ih/nE0Pk0trATO/qQ=;
 h=From:To:Cc:Subject:Date:From;
 b=EakeZI4KcUK1oDesp+SP28y7+ja3m4oFhAYkxmXw0R/JYt2TIwjesfrGCFy4XdIkb
 /AWSYUU0A+T5qpsmLK7FUGt6K77nRGJkr6r6K5s59sA97iHfNk3PCIRsxNIVo9y9fG
 t4BWsisJnaXFlWK6C/2fOYZa81HN6bYnG4q8gsNmw7+wmJQ7y97kRE70udJAoS7X2D
 0DG11ionJa1Wfr+Rc5hlLAyTMBqVRV0Uun1KhOMDPhHVX04w/KwHe484lrTRFQPZc1
 IzHKg7siOB/GxssIfb5rtt00Pdy4rTKHchZ0DihEqnNd6a6WJioyh7ZENnfPvvTDhL
 X0kZreDIJkc1Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: [PATCH 0/3] unified way to use static key and optimize
 pgtable_l4_enabled
Date: Wed, 26 Jan 2022 00:50:33 +0800
Message-Id: <20220125165036.987-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_085811_865916_8D0899C8 
X-CRM114-Status: GOOD (  13.85  )
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

Currently, riscv has several features why may not be supported on all
riscv platforms, for example, FPU, SV48 and so on. To support unified
kernel Image style, we need to check whether the feature is suportted
or not. If the check sits at hot code path, then performance will be
impacted a lot. static key can be used to solve the issue. In the
past FPU support has been converted to use static key mechanism. I
believe we will have similar cases in the future. For example, the
SV48 support can take advantage of static key[1].

patch1 introduces an unified mechanism to use static key for riscv cpu
features.
patch2 converts has_cpu() to use the mechanism.
patch3 uses the mechanism to optimize pgtable_l4_enabled.

[1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html

Jisheng Zhang (3):
  riscv: introduce unified static key mechanism for CPU features
  riscv: replace has_fpu() with system_supports_fpu()
  riscv: convert pgtable_l4_enabled to static key

 arch/riscv/Makefile                 |   3 +
 arch/riscv/include/asm/cpufeature.h | 105 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/pgalloc.h    |   8 +--
 arch/riscv/include/asm/pgtable-64.h |  21 +++---
 arch/riscv/include/asm/pgtable.h    |   3 +-
 arch/riscv/include/asm/switch_to.h  |   9 +--
 arch/riscv/kernel/cpu.c             |   2 +-
 arch/riscv/kernel/cpufeature.c      |  29 ++++++--
 arch/riscv/kernel/process.c         |   2 +-
 arch/riscv/kernel/signal.c          |   4 +-
 arch/riscv/mm/init.c                |  23 +++---
 arch/riscv/mm/kasan_init.c          |   6 +-
 arch/riscv/tools/Makefile           |  22 ++++++
 arch/riscv/tools/cpucaps            |   6 ++
 arch/riscv/tools/gen-cpucaps.awk    |  40 +++++++++++
 15 files changed, 234 insertions(+), 49 deletions(-)
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
