Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9998C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Dec 2023 08:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qufBVKC9hHpaTOgBz5Ydhsl3XL0HhekUj5ql5N5gavo=; b=2YrzFzvcgFM4WJ
	i8aZQ1rCtvatFA/UtoeFur2TDbr29q9fYLEENos5p5aeZKvObZAfW6uGrKC+vB+20AwDilo0iR1tV
	u6/e/g/44LbT6fAqzrNouLBjUlywBiF8SuRzYXN529fM0vVrzNnXn4D661BHa37lnULtV+YdbE0BS
	RqV0W4Bk2stFoAEc4Juvm3lDFN7VHjUxvkcur74Kbd/MerK0+NOsmRNXaQzvI5S8GiSehEMtWggHx
	uSRb3pfUtgeTxrMaTVGxj9/yLX+fr/lrh02exS8UOQ1CLE94WiZq4lGx67ulhCnTDLZJycyYRxbMa
	kyfxoW1V9CmLmFiO8Tjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJrD4-004E20-1g;
	Sun, 31 Dec 2023 08:30:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJrD0-004E1N-37
	for linux-riscv@lists.infradead.org;
	Sun, 31 Dec 2023 08:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 073F1CE03F7;
	Sun, 31 Dec 2023 08:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49B3C433C7;
	Sun, 31 Dec 2023 08:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704011406;
	bh=aZhtYj/T/UdJIfbSV07e0EOQZDtYDIT0xAMU5nB5hU0=;
	h=From:To:Cc:Subject:Date:From;
	b=D3VrHiZcMw2M0LJxuM7GYDRB+1Fb/LQKhlkIV7VDradB7BcD7/1uLIRcy8sy2gzjO
	 Oui9ZAwWD87lisYtxCBg3NgC1Ekuw+knyUqyBH2HCrLcNDtZI8xUrojoyoE2Lc9Lwz
	 WDJKnyNIjh23gm1qbRyq3XeW+itsHf72Mwo47ZRkr89HiSFnQeUq22qpaapK9j1MZr
	 bj6JfNvAIiXqCLG9B7xKi58so+NL+B3olYel9NIsApj8iljT24Ldi6iZMd7WOebAqL
	 A/iDLywTaiIMiBfgcRu6QATP7wRJx9qozUH/iel95RD5bp3NKY/5VPEiKkS6mIkRbL
	 MBOlezQSLb8QA==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	panqinglin2020@iscas.ac.cn,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	leobras@redhat.com,
	peterz@infradead.org,
	keescook@chromium.org,
	wuwei2016@iscas.ac.cn,
	xiaoguang.xing@sophgo.com,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	uwu@icenowy.me,
	jszhang@kernel.org,
	wefu@redhat.com,
	atishp@atishpatra.org,
	ajones@ventanamicro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 0/3] riscv: Add Zicbop & prefetchw support
Date: Sun, 31 Dec 2023 03:29:50 -0500
Message-Id: <20231231082955.16516-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231231_003011_340277_9FB461E2 
X-CRM114-Status: UNSURE (   8.49  )
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

This patch series adds Zicbop support and then enables the Linux
prefetchw feature. It's based on v6.7-rc7.

PATCH[1] - Add Zicbop support
PATCH[2] - Add prefetchw support
PATCH[3] - Enhance xchg_small

Changelog:
V2:
 - Separate from the qspinlock series
 - Optimize coding convention with last review advice
 - Add DEFINE_INSN_S type in insn-def.h
 - Add CBO_PREFETCH_I/R/W

V1:
https://lore.kernel.org/linux-riscv/20230910082911.3378782-4-guoren@kernel.org/

Guo Ren (3):
  riscv: Add Zicbop instruction definitions & cpufeature
  riscv: Add ARCH_HAS_PRETCHW support with Zibop
  riscv: xchg: Prefetch the destination word for sc.w

 arch/riscv/Kconfig                 | 15 ++++++++
 arch/riscv/include/asm/cmpxchg.h   |  4 +-
 arch/riscv/include/asm/hwcap.h     |  1 +
 arch/riscv/include/asm/insn-def.h  | 60 ++++++++++++++++++++++++++++++
 arch/riscv/include/asm/processor.h | 16 ++++++++
 arch/riscv/kernel/cpufeature.c     |  1 +
 6 files changed, 96 insertions(+), 1 deletion(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
