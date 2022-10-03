Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404B5C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 10:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xnfHreXurwOvqtSAsYCHYG02R+RMG93EiC9VU0hwZYc=; b=vFbKSZ+FVyiEgo
	PNy8jWABXfUCzO8+DdNOviQzHHzuwAq2LXZb97HQ8U1tktbK94aYzeVsj81SpJ/kKbGbF9K6KxHAB
	N8Xv5JpGZWbT8m5Damg+idI7hXhkjhKujL2RvJwSjSd0tabO/SyGQAw/VxKI4z1uyZ7ZTeI9E11Ow
	EzaGEvptZBrsN5uaAgmS2jy7gSsFIZStledajyZVc2ZLyA8cGnn8YhQQqi0kiF1dP78wuha3pfYQA
	8CMQop3Atd47b6nj1mO2LQUj9Vq6M7sRM+LSPmOXOh6chJBZe3kBkEP4VimswbzO81OShwKZt7BkO
	G/MpjaJk/wT9ebjZQcSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIqf-005KnS-Ew; Mon, 03 Oct 2022 10:38:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIqc-005Kmx-Ay
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 10:38:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1E67561032;
	Mon,  3 Oct 2022 10:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33EABC433C1;
	Mon,  3 Oct 2022 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664793532;
	bh=Wb5QlCQoIluCSve+kPlO0WTb8M6wqUHapBeGAV6z1uE=;
	h=From:To:Cc:Subject:Date:From;
	b=phnvPVGFboLC5HzqCpDPnTuFsS12xHr9qtLxkOWEvZTu3vcr+agYAGQlSmQoYxkLg
	 oDNJI8rnRDDttB4nHGWUg+5QMhzc30gnKDqPWT3hdU6sCWGNAwEw4+EKC5LhjM3kts
	 Hjfo73Val8taCpK2rJiICeq3sZxDygN0qYMTdG0kKA7Y41QSdZYRkZ3LH/NZlDegE2
	 3JhmPSzfhxSfGowBGJ4N4gx9dKjCrrCzsnQQfjim0dI91WcYtDpbtmKLT4MsMRg+86
	 zDo7rPxQaLCwCP0dX3VpOXRmGuBNIE73elot4s0Mtb1yfJGpr6t6baaRJl/Y2KYSBz
	 RIHAgP9oslN6Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] riscv: entry: further clean up and VMAP_STACK fix
Date: Mon,  3 Oct 2022 18:29:17 +0800
Message-Id: <20221003102921.3973-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_033854_455243_772ED012 
X-CRM114-Status: GOOD (  11.00  )
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

I planed to do similar generic entry transaction as Guo Ren did[1], and
I had some commits in local. Since Guo has sent out the series, I
dropped my version and just provide those in my local repo but missing
in Guo's series. However, this doesn't mean this series depends on
Guo's series, in fact except the first one, the remaining three patches
are independent on generic entry.

Since v2:
  - the patch of removing wrappers of trace_hardirqs_{on,off} is in
    Guo's v6 generic entry series[2], so remove it.
  - add a new patch to fix kernel info leakage.
  - collect Acked-by tag.
  - the GP saving and restoring macros range from x5 to x31 now per
    Guo's suggestion.

Since v1:
  - consolidate gp saving/restoring in mcount-dyn.S as well
  - avoid non-trival memory waste if NR_CPUs is large
  - collect Reviewed-by tag.

[1]https://lore.kernel.org/linux-riscv/20220918155246.1203293-1-guoren@kernel.org/T/#t
[2]https://lore.kernel.org/linux-riscv/20221002012451.2351127-1-guoren@kernel.org/T/#t

Jisheng Zhang (4):
  riscv: process: fix kernel info leakage
  riscv: consolidate ret_from_kernel_thread into ret_from_fork
  riscv: fix race when vmap stack overflow and remove shadow_stack
  riscv: entry: consolidate general regs saving/restoring

 arch/riscv/include/asm/asm-prototypes.h |   1 -
 arch/riscv/include/asm/asm.h            |  63 ++++++++++
 arch/riscv/include/asm/thread_info.h    |   3 -
 arch/riscv/kernel/asm-offsets.c         |   1 +
 arch/riscv/kernel/entry.S               | 151 +++---------------------
 arch/riscv/kernel/mcount-dyn.S          |  56 +--------
 arch/riscv/kernel/process.c             |   7 +-
 arch/riscv/kernel/traps.c               |  32 ++---
 8 files changed, 103 insertions(+), 211 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
