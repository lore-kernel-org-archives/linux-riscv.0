Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6A9C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 19:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnUKp+DSQvViVo14Yq6hg+OlqZCQav7Di7/IW7URNSo=; b=XAPWD04gVdLmki
	85KtGzRDU2F5+LtesFsEoh23li+nZYEKtBAdtgk60jgDWb5WHPavMQiBt0foSoFn4Amq3nQQJCVrz
	QK/9uCuODIONiLAh2zbx5qK/EawN16XRTwmr7mGE8ahelt3eo6UIDewkikJhNoiT9997YIhfE+3PC
	tukIuokEyo/5w/P3vytXK5rHfbGcDcBqL/0Vh7zpDAzeRXGzrcnAW/DBgHBpthvkrfYftV/uH9kt7
	WCSme0Fcn1YkTyXl012KXwJTshTrzLPqDMjgZGC70LO6L0lKBAqqsffuHKt48h5P5lZ+wo7SfIkNm
	D8qnJKXFJQhrGEcJZcBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1AjY-0076hn-2j;
	Thu, 09 Nov 2023 19:30:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1AjV-0076gi-2Y;
	Thu, 09 Nov 2023 19:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73C746116C;
	Thu,  9 Nov 2023 19:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 165E7C433C9;
	Thu,  9 Nov 2023 19:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699558228;
	bh=KqVoMWqDd+E2EyR7rl60ZOeBi5OJfRT+yFEADYzm+Io=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tVF2iN1FInSUL+GFPK8pXeonyFJ2l4wEFqyYJj40cNm+DLeZTF5RInzK6QM5xQLHC
	 FGMwZgQ8H6wKKQKYmC4RNErwZtzeSnGE7ySZV85tef3vqJdBJWy+eZWfn0MzbyXtGd
	 U/AFCSTaoesrK0U2VwfaZHCwaTQoPFiUzOTZWLERGMlkHZaEoswH3lWK5wOOf+JIsV
	 cOBenYMpWLyZpCi9Qf6dakgysHtyAhtXMH+fit+veNmAaad12xzvPMAXsXswECkwSS
	 UpqKO0eljvaLKZK6Vq6AldHFhSiZTcCtf5tiS6ZaH/C84Luw/O3DuxHRsh/HRLY3Jx
	 FVmHBcWL60YHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0F80C43158;
	Thu,  9 Nov 2023 19:30:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] drivers: perf: Check find_first_bit() return value
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169955822798.13763.2357053646375342945.git-patchwork-notify@kernel.org>
Date: Thu, 09 Nov 2023 19:30:27 +0000
References: <20231109082128.40777-1-alexghiti@rivosinc.com>
In-Reply-To: <20231109082128.40777-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
 anup@brainfault.org, will@kernel.org, mark.rutland@arm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_113029_937959_EF029C05 
X-CRM114-Status: UNSURE (   9.26  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu,  9 Nov 2023 09:21:28 +0100 you wrote:
> We must check the return value of find_first_bit() before using the
> return value as an index array since it happens to overflow the array
> and then panic:
> 
> [  107.318430] Kernel BUG [#1]
> [  107.319434] CPU: 3 PID: 1238 Comm: kill Tainted: G            E      6.6.0-rc6ubuntu-defconfig #2
> [  107.319465] Hardware name: riscv-virtio,qemu (DT)
> [  107.319551] epc : pmu_sbi_ovf_handler+0x3a4/0x3ae
> [  107.319840]  ra : pmu_sbi_ovf_handler+0x52/0x3ae
> [  107.319868] epc : ffffffff80a0a77c ra : ffffffff80a0a42a sp : ffffaf83fecda350
> [  107.319884]  gp : ffffffff823961a8 tp : ffffaf8083db1dc0 t0 : ffffaf83fecda480
> [  107.319899]  t1 : ffffffff80cafe62 t2 : 000000000000ff00 s0 : ffffaf83fecda520
> [  107.319921]  s1 : ffffaf83fecda380 a0 : 00000018fca29df0 a1 : ffffffffffffffff
> [  107.319936]  a2 : 0000000001073734 a3 : 0000000000000004 a4 : 0000000000000000
> [  107.319951]  a5 : 0000000000000040 a6 : 000000001d1c8774 a7 : 0000000000504d55
> [  107.319965]  s2 : ffffffff82451f10 s3 : ffffffff82724e70 s4 : 000000000000003f
> [  107.319980]  s5 : 0000000000000011 s6 : ffffaf8083db27c0 s7 : 0000000000000000
> [  107.319995]  s8 : 0000000000000001 s9 : 00007fffb45d6558 s10: 00007fffb45d81a0
> [  107.320009]  s11: ffffaf7ffff60000 t3 : 0000000000000004 t4 : 0000000000000000
> [  107.320023]  t5 : ffffaf7f80000000 t6 : ffffaf8000000000
> [  107.320037] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [  107.320081] [<ffffffff80a0a77c>] pmu_sbi_ovf_handler+0x3a4/0x3ae
> [  107.320112] [<ffffffff800b42d0>] handle_percpu_devid_irq+0x9e/0x1a0
> [  107.320131] [<ffffffff800ad92c>] generic_handle_domain_irq+0x28/0x36
> [  107.320148] [<ffffffff8065f9f8>] riscv_intc_irq+0x36/0x4e
> [  107.320166] [<ffffffff80caf4a0>] handle_riscv_irq+0x54/0x86
> [  107.320189] [<ffffffff80cb0036>] do_irq+0x64/0x96
> [  107.320271] Code: 85a6 855e b097 ff7f 80e7 9220 b709 9002 4501 bbd9 (9002) 6097
> [  107.320585] ---[ end trace 0000000000000000 ]---
> [  107.320704] Kernel panic - not syncing: Fatal exception in interrupt
> [  107.320775] SMP: stopping secondary CPUs
> [  107.321219] Kernel Offset: 0x0 from 0xffffffff80000000
> [  107.333051] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
> 
> [...]

Here is the summary with links:
  - drivers: perf: Check find_first_bit() return value
    https://git.kernel.org/riscv/c/c6e316ac0553

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
