Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319EAC001E0
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 00:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NBWIxWxbI59sghTSIFk5tEZbQ5geQ97HnLZK4mtiQHU=; b=HHhzceKHpNrWad
	CdtUTZKNSLsSMzN0uAOMb8meL//dcevaKhb0tse1dmePmaUe5X+FpHE7o7GwhVvXnTa+62XAAe6Le
	eIn2WWVJ7o+N13M36sN/5+GQnFLIdScc97mHqKwtmdhGvAXwlHAMn5/AlQNqHVygpLkO5XmFOk1Ri
	epkRZhIUyRTW8TDPMj9XfwgM3I/YoGq/mF4mJzyI88Gvm5n9l7spX5mNJ7Gy44NKBh0zBfsO5UDED
	7Dj6L1Z4+0SyAgU40bagTYVyFvE41UvBElGV2JlTVavOwBDXGaEF47iepjUS6LNcAPXlv4allIGvj
	Pf0JExF4deWuRhCpLSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKpQ4-009j5b-0i;
	Sun, 16 Jul 2023 00:15:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKpQ0-009j34-2a
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 00:15:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7290160C4E;
	Sun, 16 Jul 2023 00:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3B3C433C7;
	Sun, 16 Jul 2023 00:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689466513;
	bh=X6hTcvtJBK7dd2SCGFkBhw9aiwlqXCXsF5zEG0CNbnw=;
	h=From:To:Cc:Subject:Date:From;
	b=MWdWp6KASNJjzqYRAXOjBuKgG/7fkrdNiXgYlgLalGY9LulRL6o30PkpSSpzv5ybB
	 X7ahc6tTYmlLkQzk1n1BmZcAg7P2G1g9+GuC37CWYEoF0AypT9Q4zGs4AM0m49FjeA
	 GKoM9xl0UpvfH9vErJLimz5QX53O7h8tvbzxQgqr1im5sgPNqi0CAbc9+Uj37NPUei
	 5aEyrHPsLCSQe4PCY4LtjoEinvhwhjeGM9p2+0GWEf80gXmlHPRhMRAN+UzZoSNtpS
	 0EZLoN0/jbas70QOBZufRvadwJ085yilH+GIZgCFYXHaGMaYy6t7t8OQ11+y0vJzX1
	 EBt2+19XmVoXQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	falcon@tinylab.org,
	bjorn@kernel.org,
	conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 0/2] riscv: stack: Fixup independent softirq/irq stack for CONFIG_FRAME_POINTER=n
Date: Sat, 15 Jul 2023 20:15:04 -0400
Message-Id: <20230716001506.3506041-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_171520_901094_73319C07 
X-CRM114-Status: UNSURE (   7.97  )
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

The independent softirq/irq stack uses s0 to save & restore sp, but s0
would be corrupted when CONFIG_FRAME_POINTER=n. So add s0 in the clobber
list to fix the problem.

<+0>:     addi    sp,sp,-32
<+2>:     sd      s0,16(sp)
<+4>:     sd      s1,8(sp)
<+6>:     sd      ra,24(sp)
<+8>:     sd      s2,0(sp)
<+10>:    mv      s0,a0		--> compiler allocate s0 for a0 when CONFIG_FRAME_POINTER=n
<+12>:    jal     ra,0xffffffff800bc0ce <irqentry_enter>
<+16>:    ld      a5,56(tp) # 0x38
<+20>:    lui     a4,0x4
<+22>:    mv      s1,a0
<+24>:    xor     a5,a5,sp
<+28>:    bgeu    a5,a4,0xffffffff800bc092 <do_irq+88>
<+32>:    auipc   s2,0x5d
<+36>:    ld      s2,1118(s2) # 0xffffffff801194b8 <irq_stack_ptr>
<+40>:    add     s2,s2,a4
<+42>:    addi    sp,sp,-8
<+44>:    sd      ra,0(sp)
<+46>:    addi    sp,sp,-8
<+48>:    sd      s0,0(sp)
<+50>:    addi    s0,sp,16	--> our code clobber the s0
<+52>:    mv      sp,s2
<+54>:    mv      a0,s0		--> a0 got wrong value for handle_riscv_irq 
<+56>:    jal     ra,0xffffffff800bbb3a <handle_riscv_irq>

Changelog:
V2
 - Fixup compile error with CONFIG_FRAME_POINTER=y
 - FIxup stable@vger.kernel.org tag

Guo Ren (2):
  riscv: stack: Fixup independent irq stack for CONFIG_FRAME_POINTER=n
  riscv: stack: Fixup independent softirq stack for
    CONFIG_FRAME_POINTER=n

 arch/riscv/kernel/irq.c   | 3 +++
 arch/riscv/kernel/traps.c | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
