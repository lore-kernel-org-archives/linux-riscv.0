Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84801C3064E
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 15:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0UIk3a10iXDATtA4w8MAyaTsY+OcuJNoZLcG2dPiZY=; b=L7IDHXjRNfX/xO
	hEaDkIxwxlRcezFzOqky/C4GooNF9P936eXIWvqbBP2qkfqFndiBoz5x7aB/o46x2zWFdQuIVgrZ5
	xNG3uB58R8dvKVlytgI7QSLzqusY8Y001dqfYdwH0Z17SY5Dlzp6pNGqXxEzDyPvbp7uxeUba8jKS
	itl78ifCqAkvF7dG7J7miK9khzune7lslpYzaVsHANd1awrHnVYnezSGmN+4lB8zmlsS+umeoGvcK
	oTJtckRseCicVVbixyXJMRq0kuFTf9e5DXcnKYDCgldqzS9luu2pBynfJKF7nl4cSkYqF0wCftS7Q
	CNZfi9J3FDIMSN06qgfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWenV-006fTQ-2i;
	Thu, 17 Aug 2023 15:20:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWenS-006fRj-17
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 15:20:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5BF4B61E4E;
	Thu, 17 Aug 2023 15:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE2E0C433C9;
	Thu, 17 Aug 2023 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692285624;
	bh=NfOEJNXNpKdohlsC54VKkIQeTA+pi3oxUi+fegoDms8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m8k+4yi2KrnIbAyVLtanud5zOz3gxKdpBrYc9Mf9cyIM4WavnCq9eC7pDs7mzBU9p
	 0iUb1aMrMfOmL63sVcYJXcV1ohvZLl20XkmXXfEnx1SQ49VAQ/h57j0+kleqMSh8ni
	 JDGmmQ98Fb64QnoDYZwFBnGmO5dH0cXz7wrmMm1dE1GWs0ZzsFCltU1Apj5FnMtmw5
	 fXnjSMv1JDc41jpDIBEImh68wCD7vZM4Xil3uJ+tpXyQiLQpJhtg+pz623hVRlpRx8
	 TnogrILg9tx8B9MUsmqzCO4a5zGCGbJTiZ5rsC0jqrD/AjrPLkhFwsRZUroAN7i9Yy
	 ggJuQfvg8tDfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A4A61E1F65A;
	Thu, 17 Aug 2023 15:20:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2 0/2] riscv: stack: Fixup independent softirq/irq stack for
 CONFIG_FRAME_POINTER=n
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169228562466.20811.13415270526946490389.git-patchwork-notify@kernel.org>
Date: Thu, 17 Aug 2023 15:20:24 +0000
References: <20230716001506.3506041-1-guoren@kernel.org>
In-Reply-To: <20230716001506.3506041-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 paul.walmsley@sifive.com, falcon@tinylab.org, bjorn@kernel.org,
 conor.dooley@microchip.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_082026_450201_113C0999 
X-CRM114-Status: UNSURE (   9.34  )
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sat, 15 Jul 2023 20:15:04 -0400 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The independent softirq/irq stack uses s0 to save & restore sp, but s0
> would be corrupted when CONFIG_FRAME_POINTER=n. So add s0 in the clobber
> list to fix the problem.
> 
> <+0>:     addi    sp,sp,-32
> <+2>:     sd      s0,16(sp)
> <+4>:     sd      s1,8(sp)
> <+6>:     sd      ra,24(sp)
> <+8>:     sd      s2,0(sp)
> <+10>:    mv      s0,a0		--> compiler allocate s0 for a0 when CONFIG_FRAME_POINTER=n
> <+12>:    jal     ra,0xffffffff800bc0ce <irqentry_enter>
> <+16>:    ld      a5,56(tp) # 0x38
> <+20>:    lui     a4,0x4
> <+22>:    mv      s1,a0
> <+24>:    xor     a5,a5,sp
> <+28>:    bgeu    a5,a4,0xffffffff800bc092 <do_irq+88>
> <+32>:    auipc   s2,0x5d
> <+36>:    ld      s2,1118(s2) # 0xffffffff801194b8 <irq_stack_ptr>
> <+40>:    add     s2,s2,a4
> <+42>:    addi    sp,sp,-8
> <+44>:    sd      ra,0(sp)
> <+46>:    addi    sp,sp,-8
> <+48>:    sd      s0,0(sp)
> <+50>:    addi    s0,sp,16	--> our code clobber the s0
> <+52>:    mv      sp,s2
> <+54>:    mv      a0,s0		--> a0 got wrong value for handle_riscv_irq
> <+56>:    jal     ra,0xffffffff800bbb3a <handle_riscv_irq>
> 
> [...]

Here is the summary with links:
  - [V2,1/2] riscv: stack: Fixup independent irq stack for CONFIG_FRAME_POINTER=n
    https://git.kernel.org/riscv/c/8d0be64154cf
  - [V2,2/2] riscv: stack: Fixup independent softirq stack for CONFIG_FRAME_POINTER=n
    https://git.kernel.org/riscv/c/ebc9cb03b21e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
