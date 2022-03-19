Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F22C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Mar 2022 03:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XTtdbIOoqH9Vn5/zwre0xwHSjAoFBclZywUqVhZNGGk=; b=S+lQAL8U7wHiUM
	Fc5FPk4E/qfpfnivITF609FwPYpiGGGeor6YehA4L/Ljt1URCk+eUxZkL3vBQSs8addJDPjA5wY2e
	6sFE2o8JVrXvltIYmkrEZrQkjKmc1DcoMK190U+ERE4qHjf4qMnm7lTeb3vbRfoRnaY/gqcBozvKt
	eNtkaKnQJJSfSlz+VJzoT67jwwWl2GxVMBrwTdpvkbxDLZtiuoUFDAsU9Q/G5jj1IAKB9VAvYXvMi
	sJ5YBErVPbV2iiUBK0qiugdCBqw3h/di20Ph93KfK0aAGZ/uxb2cd8mz6QxIpRY+aONCfXQ1EKBwI
	eMSF33IA0r0ry2q1+3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVQBT-003BJ6-PU; Sat, 19 Mar 2022 03:55:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVQBQ-003BHj-Fk
 for linux-riscv@lists.infradead.org; Sat, 19 Mar 2022 03:55:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C60BD617DE;
 Sat, 19 Mar 2022 03:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB0EC340EC;
 Sat, 19 Mar 2022 03:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647662113;
 bh=YTk93zwuaGZlbGJYQpGVX2DQwDayvasBfkPYcHh8gIk=;
 h=From:To:Cc:Subject:Date:From;
 b=nKlhwcjbrbTFviWdQBTu3WNloG1jgLcDtDoTMwafpkUo0Wb84lOTYscr2NuACdEA7
 TZkKNzeVChhvA35+Ku/YlGkd8r7mIqpVTmtozurPhoWQQrGiFRInRRxoBSAXoIabeh
 Ix14wd0/aTu0OlnjrcGwqx+RRsvx1NlR8T0kx/Hv+GOoyW9S/KhCMcPbLJDmdNxFtc
 /s50rZmR5fC1vJ1YHqyIg0J1dGzOIBNthyLLoxyjJ99FbY93Y7CtdFfn2U3PFiovGB
 fKnsz5EUUnJGzuiKpsLj3VtAVyxzJZlj/a1DfpfrVdXrSuxpZ+xERjuUT+eJDpNuFv
 8f/K8jPnqs0+Q==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, boqun.feng@gmail.com,
 longman@redhat.com, peterz@infradead.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 0/5] Generic Ticket Spinlocks
Date: Sat, 19 Mar 2022 11:54:52 +0800
Message-Id: <20220319035457.2214979-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_205516_657908_49893A62 
X-CRM114-Status: GOOD (  20.03  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Palmer:
Peter sent an RFC out about a year ago
<https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>,
but after a spirited discussion it looks like we lost track of things.
IIRC there was broad consensus on this being the way to go, but there
was a lot of discussion so I wasn't sure.  Given that it's been a year,
I figured it'd be best to just send this out again formatted a bit more
explicitly as a patch.

This has had almost no testing (just a build test on RISC-V defconfig),
but I wanted to send it out largely as-is because I didn't have a SOB
from Peter on the code.  I had sent around something sort of similar in
spirit, but this looks completely re-written.  Just to play it safe I
wanted to send out almost exactly as it was posted.  I'd probably rename
this tspinlock and tspinlock_types, as the mis-match kind of makes my
eyes go funny, but I don't really care that much.  I'll also go through
the other ports and see if there's any more candidates, I seem to
remember there having been more than just OpenRISC but it's been a
while.

I'm in no big rush for this and given the complex HW dependencies I
think it's best to target it for 5.19, that'd give us a full merge
window for folks to test/benchmark it on their systems to make sure it's
OK.  RISC-V has a forward progress guarantee so we should be safe, but
these can always trip things up.

Guo:
Update V2 with Arnd's suggestion [1].

[1] https://lore.kernel.org/linux-arch/CAK8P3a0NMPVGVw7===uEOtNnu1hr1GqimMbZT+Kea1CUxRvPmw@mail.gmail.com/raw

Changes in V2:
 - Follow Arnd suggestion to make the patch series more generic.
 - Add csky in the series.
 - Combine RISC-V's two patches into one.
 - Modify openrisc's patch to suit the new generic version.

Guo Ren (1):
  csky: Move to generic ticket-spinlock

Palmer Dabbelt (1):
  RISC-V: Move to ticket-spinlocks & RW locks

Peter Zijlstra (3):
  asm-generic: ticket-lock: New generic ticket-based spinlock
  asm-generic: qspinlock: Indicate the use of mixed-size atomics
  openrisc: Move to ticket-spinlock

 arch/csky/include/asm/Kbuild               |   3 +-
 arch/csky/include/asm/spinlock.h           |  89 --------------
 arch/csky/include/asm/spinlock_types.h     |  27 -----
 arch/openrisc/Kconfig                      |   1 -
 arch/openrisc/include/asm/Kbuild           |   7 +-
 arch/openrisc/include/asm/spinlock.h       |  27 -----
 arch/openrisc/include/asm/spinlock_types.h |   7 --
 arch/riscv/Kconfig                         |   1 +
 arch/riscv/include/asm/Kbuild              |   2 +
 arch/riscv/include/asm/spinlock.h          | 135 ---------------------
 arch/riscv/include/asm/spinlock_types.h    |  25 ----
 include/asm-generic/qspinlock.h            |  30 +++++
 include/asm-generic/spinlock.h             |  11 +-
 include/asm-generic/spinlock_types.h       |  15 +++
 include/asm-generic/ticket-lock-types.h    |  11 ++
 include/asm-generic/ticket-lock.h          |  86 +++++++++++++
 16 files changed, 157 insertions(+), 320 deletions(-)
 delete mode 100644 arch/csky/include/asm/spinlock.h
 delete mode 100644 arch/csky/include/asm/spinlock_types.h
 delete mode 100644 arch/openrisc/include/asm/spinlock.h
 delete mode 100644 arch/openrisc/include/asm/spinlock_types.h
 delete mode 100644 arch/riscv/include/asm/spinlock.h
 delete mode 100644 arch/riscv/include/asm/spinlock_types.h
 create mode 100644 include/asm-generic/spinlock_types.h
 create mode 100644 include/asm-generic/ticket-lock-types.h
 create mode 100644 include/asm-generic/ticket-lock.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
