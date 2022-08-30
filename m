Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF63C0502A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 06:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c1h6Inug8jE1jgaAiCO760sjabpr0ZxF3YoBdeNDZ7E=; b=Lfx/CD4JcNUjGH
	wvEPMaF8Li6Gvl7BPV57NIxCi5DnX4I91Dub63xSRDCTKWV5gjxRVHyKOeNbhSvWmHkTKEOyc1Q65
	fvR9oVZzU8Vfltb8lsTdbIlHtdvSXX7e3sCuFXzMAC6z0cB9sScbpZCDdpLZygdTrq8i04Ssx0T7j
	THUeu8O40iIzJBvQb/oEmTb42qCi1JLbUb4k6tlUt74c3NDGrFpxy8Kb0lhy/Gf3F+oosR5c7iurt
	gLUiFdHRLvuN4nFZKvL8tJAw6YFa7zhXSW/0IY7P0qclcw//nYMvNxMiTRpzvgQ6GnaeFx/qhPdp5
	RxoPNrmC2CdwatVN14Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSv8P-00EZMK-JZ; Tue, 30 Aug 2022 06:54:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSv7u-00EZ86-M0; Tue, 30 Aug 2022 06:53:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E95B3B816A3;
	Tue, 30 Aug 2022 06:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14459C433D7;
	Tue, 30 Aug 2022 06:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661842410;
	bh=WZxYgPjZxU7c0eL5H4bK4Uo9kDBByWGt0wFQ+gNBmEk=;
	h=From:To:Cc:Subject:Date:From;
	b=nufhHi0HplC5xFdh2kg+QheRPNhIBp5dtQjaCmd+6ZPvzj08VHR5xtZboL753P4ny
	 ai0R0O+TF4TCzz2Br11U8QeePHhqlTcZ3h920Rhfjbwtzc38HBKb0TqxiLzkSZf/4G
	 b2jyRtmeyHeBjipaSz1J1M0jHE91/z1Ha6ALWyZA+o9OMd9mgpcsYTf1RN5ZCWTAk1
	 XSzBPuOt0iojskPui2Stdz8tczdibVXbu5wVzb6EvkAbSJcv4vrQvW0t1wrlJVe7yp
	 vImRZAIdL+vVqVqltFgWZrIPu3Vacn4cXi5FmD2j75nFwkYEivtVEZX7JOZ0Fsg9w3
	 /AQ8KMH3fteqA==
From: guoren@kernel.org
To: oleg@redhat.com,
	vgupta@kernel.org,
	linux@armlinux.org.uk,
	monstr@monstr.eu,
	dinguyen@kernel.org,
	palmer@dabbelt.com,
	davem@davemloft.net,
	arnd@arndb.de,
	shorne@gmail.com,
	guoren@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	sparclinux@vger.kernel.org,
	openrisc@lists.librecores.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 0/3] arch: ptrace: Cleanup ptrace_disable
Date: Tue, 30 Aug 2022 02:53:13 -0400
Message-Id: <20220830065316.3924938-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_235334_916244_2F5535E8 
X-CRM114-Status: UNSURE (   8.32  )
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

From: Guo Ren <guoren@linux.alibaba.com>

This series cleanup ptrace_disable() in arch/*. Some architectures
are duplicate clearing SYSCALL TRACE.

Guo Ren (3):
  riscv: ptrace: Remove duplicate operation
  openrisc: ptrace: Remove duplicate operation
  arch: ptrace: Cleanup ptrace_disable

 arch/arc/kernel/ptrace.c        |  4 ----
 arch/arm/kernel/ptrace.c        |  8 --------
 arch/microblaze/kernel/ptrace.c |  5 -----
 arch/nios2/kernel/ptrace.c      |  5 -----
 arch/openrisc/kernel/ptrace.c   |  1 -
 arch/riscv/kernel/ptrace.c      |  5 -----
 arch/sparc/kernel/ptrace_32.c   | 10 ----------
 arch/sparc/kernel/ptrace_64.c   | 10 ----------
 kernel/ptrace.c                 |  8 ++++++++
 9 files changed, 8 insertions(+), 48 deletions(-)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
