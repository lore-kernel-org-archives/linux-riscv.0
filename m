Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11FCC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 23:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uj30wrpek0Fql98nwKPSX/Ct0XrwqeORBNFdHE4fSE0=; b=HfO6L2OiuhwXkd
	q4PAiyL7Kr7cQs4PKGGs4JLfqhejTMZsFZ1oI8k7LZZ+ntLlHzeRvQtLXVeqEPo7nJt+u7ZBGohDy
	otWNufr8KTH6KKNhyk9mpGPYoBv3RDDEtGRd12ft9dD7zZNSSyUJGtPzaDYd21Dl6cPj6brkbhhjy
	lbKBwfZPn4UKhMS/JgtnNZWFYiJEmbsCI2qFHsDzXoxUBExVSghX14vhy4tUYbuFeUUfCLHwVwM6g
	AbBo0+nBzmd+pF00MMEumsPTl5wrHAg4a7Vf9zCcV8QyWU7pQjEhsLKXqKZA8tEZwtyujAQMkr9/j
	MGeaFCO/xJoRT9JL6gWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGgc-00Awxl-VL; Thu, 10 Nov 2022 23:10:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otGga-00AwwV-Cm
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 23:10:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7EB3E61B97;
	Thu, 10 Nov 2022 23:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0B52C433B5;
	Thu, 10 Nov 2022 23:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668121814;
	bh=VyvqkhmfvPygyTuScNJXZ35iPK4Sj22wV1/y+Ggp/tY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CZvIgXJw+6iu2XihbXFAwtthepV+oKFqSYWpHYaHwqWiiEG/FB7GjbR4D2OI3vzpN
	 +Ss9/h41QNNo6PVu7Y+kgEpy//esBa/jsxJb+ksTFNRSWA9daoPJOHDWWlE4d1Mthx
	 zsouWiinAh9AtpYBE6tghOWBDckik4HHjrvbP3PO3ibZ7QcoN8WRgx6DSxq9t/RDuX
	 tQ34eRnZoIjdiHAjEzWbYYttx8efwn9Wh1Pu15UZB2iW8PbrlnsxP+Rc/6jbfpOE4L
	 h1ygdob3L0Z72ZHi/C0nNWy3z7knbO7LbnT2dQZMIqL8Yp7ZfvUnyDIASt5gXy25On
	 g2LMp+zrsmGAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A6FA4C395F8;
	Thu, 10 Nov 2022 23:10:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] riscv: fix reserved memory setup
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <166812181467.9076.159650897116586866.git-patchwork-notify@kernel.org>
Date: Thu, 10 Nov 2022 23:10:14 +0000
References: <20221107151524.3941467-1-conor.dooley@microchip.com>
In-Reply-To: <20221107151524.3941467-1-conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 daire.mcnamara@microchip.com, anup@brainfault.org, atishp@rivosinc.com,
 mick@ics.forth.gr, linux-kernel@vger.kernel.org,
 valentina.fernandezalanis@microchip.com, e.shatokhin@yadro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_151016_532962_5BFDD3B7 
X-CRM114-Status: GOOD (  13.68  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 7 Nov 2022 15:15:25 +0000 you wrote:
> Currently, RISC-V sets up reserved memory using the "early" copy of the
> device tree. As a result, when trying to get a reserved memory region
> using of_reserved_mem_lookup(), the pointer to reserved memory regions
> is using the early, pre-virtual-memory address which causes a kernel
> panic when trying to use the buffer's name:
> 
>  Unable to handle kernel paging request at virtual address 00000000401c31ac
>  Oops [#1]
>  Modules linked in:
>  CPU: 0 PID: 0 Comm: swapper Not tainted 6.0.0-rc1-00001-g0d9d6953d834 #1
>  Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
>  epc : string+0x4a/0xea
>   ra : vsnprintf+0x1e4/0x336
>  epc : ffffffff80335ea0 ra : ffffffff80338936 sp : ffffffff81203be0
>   gp : ffffffff812e0a98 tp : ffffffff8120de40 t0 : 0000000000000000
>   t1 : ffffffff81203e28 t2 : 7265736572203a46 s0 : ffffffff81203c20
>   s1 : ffffffff81203e28 a0 : ffffffff81203d22 a1 : 0000000000000000
>   a2 : ffffffff81203d08 a3 : 0000000081203d21 a4 : ffffffffffffffff
>   a5 : 00000000401c31ac a6 : ffff0a00ffffff04 a7 : ffffffffffffffff
>   s2 : ffffffff81203d08 s3 : ffffffff81203d00 s4 : 0000000000000008
>   s5 : ffffffff000000ff s6 : 0000000000ffffff s7 : 00000000ffffff00
>   s8 : ffffffff80d9821a s9 : ffffffff81203d22 s10: 0000000000000002
>   s11: ffffffff80d9821c t3 : ffffffff812f3617 t4 : ffffffff812f3617
>   t5 : ffffffff812f3618 t6 : ffffffff81203d08
>  status: 0000000200000100 badaddr: 00000000401c31ac cause: 000000000000000d
>  [<ffffffff80338936>] vsnprintf+0x1e4/0x336
>  [<ffffffff80055ae2>] vprintk_store+0xf6/0x344
>  [<ffffffff80055d86>] vprintk_emit+0x56/0x192
>  [<ffffffff80055ed8>] vprintk_default+0x16/0x1e
>  [<ffffffff800563d2>] vprintk+0x72/0x80
>  [<ffffffff806813b2>] _printk+0x36/0x50
>  [<ffffffff8068af48>] print_reserved_mem+0x1c/0x24
>  [<ffffffff808057ec>] paging_init+0x528/0x5bc
>  [<ffffffff808031ae>] setup_arch+0xd0/0x592
>  [<ffffffff8080070e>] start_kernel+0x82/0x73c
> 
> [...]

Here is the summary with links:
  - [v1] riscv: fix reserved memory setup
    https://git.kernel.org/riscv/c/50e63dd8ed92

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
