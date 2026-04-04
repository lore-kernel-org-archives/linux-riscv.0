Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8997E88D73
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 01:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iI+HO38BjaBA76l5wBWZ2TcuwsVBLBraGkH+Hqo9UMM=; b=2+SBpGpU9m76rF
	fhnpVi/8VCUWzgmYMGUJPnDOPcqViOGab+vPJz3vUisQx/gQq4/qbbXwQgObqhxuY+olBNBK4sApV
	wUHphJfVZ+WovzMB1M1qbW9ZvUvbtGaBwo3lvYeFLiSPtcdQI5N1H0gie1KVijZ1GGGvn4AA9M9mj
	KUvOj5Q4kUw1osW8uJOqPA/9gW70xiA/P9wtSdVsvoFKTQmqjA380OmcvqLlWkupISiQj1zXt8by+
	hGTy7DluVlKOCKg9qpqnDHU4Cj8d4nzge7bwnG+RHBqdi0gdgPAJjfSRVPvswCeaQv25pTp9Mecz5
	rOZPp6/wm2xhJhae2VEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q0S-00000002oIo-2jmA;
	Sat, 04 Apr 2026 01:41:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8q0R-00000002oIM-3jFx
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 01:40:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8B3A60008;
	Sat,  4 Apr 2026 01:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB12EC4CEF7;
	Sat,  4 Apr 2026 01:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775266858;
	bh=ivuhrIaTVLnuIArBzndyE8aUuR5zdDlFZooJ4oon2WQ=;
	h=From:To:Cc:Subject:Date:From;
	b=RGpxC/KfsYvmrJX9Jk0M7F4CydNSVjBoP+M8fmzyLTxNIbc4358obUClY2tu3JyHm
	 L8DqHBKaLbc1PWGRHskHnZrm0tcpZkKkfI+LpDmsK135+79Wi4A/jZShSC94xDMFUp
	 OtFP8sqD9ptk4TwU21M/pGQdOulqZDIVDt9kCRlKaXohoPn5VxPkhdmhH8pp6Y58pG
	 eyilUYveIl4Ln7R0babfFQUtj3Peh3P1C2kpObg3l9cT/K0lVvlms4VD8kYE0VyU0T
	 ljdfw/j8/BEve7QHbAuyaxHtOFAhCe7fYB+mAig06cGU2zb2eucqxpRm5rb5xNKoCU
	 BHiwGWB/3fH7A==
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org,
	tglx@linutronix.de,
	peterz@infradead.org,
	broonie@kernel.org
Subject: [PATCH 0/6] Restructure per-task CFI prctl() and ptrace interfaces
Date: Fri,  3 Apr 2026 19:40:56 -0600
Message-ID: <177526680875.878386.16551569883089050686.stgit@seppa>
X-Mailer: git-send-email 2.51.0
User-Agent: StGit/0.19
MIME-Version: 1.0
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

Restructure the per-task CFI indirect branch landing pad prctl()
interface, as suggested by Linus [1].  In place of the current
approach, which follows the style of shadow stack control prctl()s
(PR_{GET,SET,LOCK}_SHADOW_STACK_STATUS), adopt the style of the
speculation control prctl() constants (PR_{GET,SET}_SPECULATION_CTRL).

Then, to improve readability, expand "indir_br_lp", "lpad", and
related abbreviations in the interfaces, also as requested by Linus.
While here, expand "ss" in the shadow stack ptrace macros to "shadow
stack".

While here, let's fix a few bugs in the interfaces that we should have
caught earlier:

- Fix a misspelling of "PTRACE" in one of the macros that is defined
  in a uapi header file

- Add a "lock" parameter to the state locking functions, fixing a bug
  when a locked process calls exec()

This series is intended to be applied before the v7.0 release, since
it changes user API constants.  This series applies on commit
2ff48e0382102b29cba20cdd8bf16a0f045f6e33 ("selftests: riscv: Add
braces around EXPECT_EQ()") in the RISC-V fixes branch.


- Paul

1. https://lore.kernel.org/linux-riscv/CAHk-=whhSLGZAx3N5jJpb4GLFDqH_QvS07D+6BnkPWmCEzTAgw@mail.gmail.com/

---

Paul Walmsley (5):
      riscv: ptrace: cfi: fix "PRACE" typo in uapi header
      riscv: ptrace: expand "LP" references to "branch landing pads" in uapi headers
      prctl: rename branch landing pad implementation functions to be more explicit
      riscv: ptrace: cfi: expand "SS" references to "shadow stack" in uapi headers
      prctl: cfi: change the branch landing pad prctl()s to be more descriptive

Zong Li (1):
      riscv: cfi: clear CFI lock status in start_thread()


 Documentation/arch/riscv/zicfilp.rst               |   63 ++++++++++++--------
 arch/riscv/include/asm/usercfi.h                   |    8 +--
 arch/riscv/include/uapi/asm/ptrace.h               |   42 +++++++------
 arch/riscv/kernel/process.c                        |    2 +
 arch/riscv/kernel/ptrace.c                         |   22 +++----
 arch/riscv/kernel/usercfi.c                        |   39 ++++++------
 include/linux/cpu.h                                |    6 +-
 include/uapi/linux/prctl.h                         |   37 +++++-------
 kernel/sys.c                                       |   30 +++++-----
 tools/perf/trace/beauty/include/uapi/linux/prctl.h |   36 +++++------
 tools/testing/selftests/riscv/cfi/cfitests.c       |   13 ++--
 11 files changed, 154 insertions(+), 144 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
