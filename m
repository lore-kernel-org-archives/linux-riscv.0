Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF44C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5M1c3WVMGkEgY/p6sRHZjmOgK9vZnXemwRxGrtYKrPo=; b=eXd9QXwL2kKoPA
	G5FNQHhd4nahKo1Uj8deR1tGwXSgtmTaNzy7AQVGlmLC8Mt23OOdi7JLrjm2PknRG/yN9rj3gch9v
	m5TOT5rjj0stNmgbvzj/j/b12cFpHw8Aorbyo0Xhz4WQohX0JGoCzq/4pQWB7venzqObikgWA/xRL
	JDbpFLMxkxb3Qvk5SnZfxDrELDz5GTT89QhDfMe1t7Va4P28aRaFJrxJQkMkgES/5AKUnjDZQzkPc
	MLaA3G7MXwZnmZIJaoFfMrFj0SCPJvswtbWvjMgBFJY6wg3b6/w8YxyezRZFk86vloR4bvmKxP3CM
	0R7hbOY6NllTqrBQuGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHIA-00CPtj-7U; Wed, 02 Nov 2022 17:12:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHI7-00CPqa-7M
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 17:12:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 44894B80DA8;
	Wed,  2 Nov 2022 17:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862F8C433C1;
	Wed,  2 Nov 2022 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667409156;
	bh=+kXg0AnyKL/yScM5ZpSouZN8e2TVAvvNgXX6EJiKW7E=;
	h=From:To:Cc:Subject:Date:From;
	b=hEgCoycpB6J1T5HC+Re6SnkeRnP0QfYP5e7wbcT445y0reEll/Ej5UdZqRVSgVeo3
	 WI/VAofvqGsFYIkEJLxUdf6M/ru616OjmF1WxnsgseWwz5+3oGTiw0kAZSHTuKNE1U
	 9oTPfVjciyp4R+LzZMBytiaU/0YUq3ThTkstBKvQRfjLZd1F3YfQ5AwfeytFUcafRS
	 u3fV9MW17Fq0JxKAgPfkFOVC1kG8nz7FNSO9WYLozhIawafKn2VtljzKP4iWvo8s23
	 aoI2M8rh4f80884o6pEVI63dgdBBqEDvawTlbu5+OtYs2efuj1TX9BuxjwmDUaeZHb
	 P4NpjrMfbBY6Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] riscv: vdso: fix section overlapping under some conditions
Date: Thu,  3 Nov 2022 01:02:54 +0800
Message-Id: <20221102170254.1925-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_101239_465356_ACBF17ED 
X-CRM114-Status: UNSURE (   9.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

lkp reported a build error, I tried the config and can reproduce
build error as below:

  VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
ld.lld: error: section .note file range overlaps with .text
>>> .note range is [0x7C8, 0x803]
>>> .text range is [0x800, 0x1993]

ld.lld: error: section .text file range overlaps with .dynamic
>>> .text range is [0x800, 0x1993]
>>> .dynamic range is [0x808, 0x937]

ld.lld: error: section .note virtual address range overlaps with .text
>>> .note range is [0x7C8, 0x803]
>>> .text range is [0x800, 0x1993]

Fix it by setting DISABLE_BRANCH_PROFILING which will disable branch
tracing for vdso, thus avoid useless _ftrace_annotated_branch section
and _ftrace_branch section. Although we can also fix it by removing
the hardcoded .text begin address, but I think that's another story
and should be put into another patch.

Link: https://lore.kernel.org/lkml/202210122123.Cc4FPShJ-lkp@intel.com/#r
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---

Since v1:
 - fix the issue by setting DISABLE_BRANCH_PROFILING

 arch/riscv/kernel/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index f2e065671e4d..d6092ff678fd 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -17,6 +17,7 @@ vdso-syms += flush_icache
 obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
 
 ccflags-y := -fno-stack-protector
+ccflags-y += -DDISABLE_BRANCH_PROFILING
 
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
