Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD08C54EE9
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Sep 2022 16:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JBLhdbtNpmLAiuSAeFaJlaG0TYbp7Cm3Y9TndpVTtPc=; b=Qj95/evh9Jb5hs
	qwozhIqQkiGVjH/jIa5DHbqEa8qFoiy3rnaWaEkdRqZIuMocOykMcjjZe6QsUWgwjKZzBlc9zY8QP
	8tPEw9sSKKZstCLdmZfEoxXYnSQaBcFnl7l/NjXqITSU3E7gnqcnlZry/0a28Sd38HxAkr0PMyUvM
	WGYE4J/bZ/GfQwBFt0IlTNat48dP/l+YBG4IBFIoXMJUqjTjBonW8JupXm15b5jrY9IVEgCJmVEhG
	vzz0rq5WbmgL7jPQy5+BbZw6YZOfGk606u7f803snl08qlx7FP/JQ16VVP1xwHN31Wwwg5vNpKR1P
	s4brl0JqWxjQm/QeD+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocUZU-00EwQe-K3; Sun, 25 Sep 2022 16:33:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocUZR-00EwMN-EA; Sun, 25 Sep 2022 16:33:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 93FA1B80782;
	Sun, 25 Sep 2022 16:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38668C433C1;
	Sun, 25 Sep 2022 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664123608;
	bh=Jc7NPPQi/AxLruVk6vIStJKeePhKZzkV23avx60HytI=;
	h=From:To:Cc:Subject:Date:From;
	b=MO/OH7thtlmoZzoXvFWnzueTijLa4tB4Dl1sB9aLNM65BHkOzNXon7zmEX2wxs0DK
	 Vbojfu9mOpMD5yTgyf5ecrYkNHsE/7GFWIwVmwbWZSiTB1sUqgwuRqpvGy43632pt1
	 mdSvwC6GH6iQGqGPLQXoemUmHLbZs7Ytaz7Mqd6gjT+QOVjN/zDzjawBnwg61a/I2N
	 TXtz07CaMlPrj1PjrAjevHhtDClAaIP8TIhvg+qbx2xCE9E+R2E5HOUijxTGaaIm8c
	 yMzdgJeCHJmhOAaBNMupCTsXcPLCCMvTVjzBWlfM1G5ToMUPeGLnWQF84ZBB7PUqVp
	 3U6YKRgoQtb/w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v3 0/3] riscv: kvm: use generic entry for TIF_NOTIFY_RESUME and misc
Date: Mon, 26 Sep 2022 00:23:57 +0800
Message-Id: <20220925162400.1606-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_093333_661370_9D978690 
X-CRM114-Status: UNSURE (   9.81  )
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

This series is a preparation series to add PREEMPT_RT support to riscv:
patch1 adds the missing number of signal exits in vCPU stat
patch2 switches to the generic guest entry infrastructure
patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
RT

After these three patches merged, the left RT patches are similar as
other arch.

Since v2:
  - splict the series into two separate ones, one for next another for
    RT.

Since v1:
  - send to related maillist, I press ENTER too quickly when sending v1
  - remove the signal_pending() handling because that's covered by
    generic guest entry infrastructure

Jisheng Zhang (3):
  RISC-V: KVM: Record number of signal exits as a vCPU stat
  RISC-V: KVM: Use generic guest entry infrastructure
  riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK

 arch/riscv/Kconfig                |  1 +
 arch/riscv/include/asm/kvm_host.h |  1 +
 arch/riscv/kvm/Kconfig            |  1 +
 arch/riscv/kvm/vcpu.c             | 18 +++++++-----------
 4 files changed, 10 insertions(+), 11 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
