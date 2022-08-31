Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683D4ECAAD1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z/bi5IzS2UUs56qRn0CsCZU2uzGG801UxJV+9gszl3M=; b=kcqLq8G3Ws1087
	ak2i1uczRzMYGvxbXoodL1CowN4DWZ+vz/78mUIxR9xlfsNnE63hVQ788WsfwhEEt+xHKEmdFYx9V
	vvjr06F/We9K7xfRw+8KUw0m3ydc3QiC8s+0xUdbxtmbyvhTQnENp/9EZU72hQYRz3pLWPWhpa7Zi
	gPQFDChonwUyEs1B3Ctl10NG/sSII8v1IoCapcBr8acGG3TUqqooOlEpK/c2Yh8HTDbeaGvtAr09v
	uqas555V8rI5FH7ccjy83TO4MZKZhPYr3ws23pbBWSSqKNPdVR12Joq9beggb3gnaMe7W4YT4pTDI
	t7imvE5pajn/EmVSJM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTS8l-007VNM-Ky; Wed, 31 Aug 2022 18:08:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTS8i-007VLj-P2; Wed, 31 Aug 2022 18:08:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9A2661BF0;
	Wed, 31 Aug 2022 18:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431B7C433D6;
	Wed, 31 Aug 2022 18:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661969315;
	bh=+JjElnI5IjOCD0ml2rzIPbAQ+2yKUfZWwuoUc78T+4U=;
	h=From:To:Cc:Subject:Date:From;
	b=Hfa+oD1uUUs2d9r0k5XrVD0NjeEB8EEqrGsuhqiXSJsWdk9oPHgxQs3PlHlA41btc
	 YvHMiJk0ha3z2itd9l1pGNll45OnmpJ1quUsu/rkWQjEAxVWMo+hryCMaoCLta3G4M
	 6QoryKkOTwmn5HwJsdlR41K7nTGvKXD9vMP1BlE7CNNO501Wty7/OOzrCgkfrkQNmx
	 s7FJW8wv1Td+Cv+EmWBMyIqUGHB9FYkYPtC4x5dR8QVZE5TPWp90d1Hvc6/eO1p+8k
	 U6SxWyOER38RdBgD/fPQgjs9gryoD4H5T/eE4DBULcvCUNfHC/u/Xa/I3Z7OGZP0TV
	 2tuLz7Q57y5Jw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 0/5] riscv: add PREEMPT_RT support
Date: Thu,  1 Sep 2022 01:59:15 +0800
Message-Id: <20220831175920.2806-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_110836_889884_58165BD9 
X-CRM114-Status: GOOD (  10.61  )
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

This series is to add PREEMPT_RT support to riscv:
patch1 adds the missing number of signal exits in vCPU stat
patch2 switches to the generic guest entry infrastructure
patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
RT
patch4 adds lazy preempt support
patch5 allows to enable PREEMPT_RT

I assume patch1, patch2 and patch3 can be reviewed and merged for
riscv-next, patch4 and patch5 can be reviewed and maintained in rt tree,
and finally merged once the remaining patches in rt tree are all
mainlined.

Since v1:
  - send to related maillist, I press ENTER too quickly when sending v1
  - remove the signal_pending() handling because that's covered by
    generic guest entry infrastructure

Jisheng Zhang (5):
  RISC-V: KVM: Record number of signal exits as a vCPU stat
  RISC-V: KVM: Use generic guest entry infrastructure
  riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
  riscv: add lazy preempt support
  riscv: Allow to enable RT

 arch/riscv/Kconfig                   |  3 +++
 arch/riscv/include/asm/kvm_host.h    |  1 +
 arch/riscv/include/asm/thread_info.h |  7 +++++--
 arch/riscv/kernel/asm-offsets.c      |  1 +
 arch/riscv/kernel/entry.S            |  9 +++++++--
 arch/riscv/kvm/Kconfig               |  1 +
 arch/riscv/kvm/vcpu.c                | 18 +++++++-----------
 7 files changed, 25 insertions(+), 15 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
