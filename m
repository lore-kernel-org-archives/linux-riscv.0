Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75495C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ik37x49Pc/1tLK7V7QN0BfNZRGCPwP0Io0zHGzIrqW0=; b=pQs7xn3xcPwLUD
	Q5xoc9eaMLnaxj6aNjuaAlxbnoSafMMIp7axcjVlzWK/ZLYS4Kxhzculd7yI+JXN6PBWV+xmc4z+A
	lushMiTvrniASy5tVTMwc+683LdDBKsW2xi56wK92To9QfpoK55XRPvtXVzpePohc9hRBRbSeLj0O
	Oq1scaqOQj7MyI/dQtSZybDKfdXB6CMBG8O1j6BjZIZ3MgkQVN3NhQeo74MAG8Qt+R2+HYcTzHfPA
	K+czZWdnhs+TsXcKjTVamijviy4YF0J7NKJScMSfdwekLf+e9M2Fs+vXKZvOFw+t1tJo58EUC9j7E
	g2+5uN9waF1i0rsbCg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Ajc-0076jV-0f;
	Thu, 09 Nov 2023 19:30:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1AjW-0076gk-12;
	Thu, 09 Nov 2023 19:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B7C76B82166;
	Thu,  9 Nov 2023 19:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 102BFC433C8;
	Thu,  9 Nov 2023 19:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699558228;
	bh=phixewqizGe+SBDzZcFJRD1v4skCnp3xVsHaSY0lgYw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=huSZHBmEaowJqPBfCijYdwP27Yg2gGZpPEiF0Vd53KsJbxGmK3xVIMbbtzBUiWXAU
	 j/PviM/cw/JkiczVOVrUspBfiAiDse0qJWJmJ/VyPG3uwLIg09qonzwNkEfeKHH3Tk
	 iJLgS1eHUEecuH2IRfMqQyueXTo0uDBUTQpyZqR0PkcH1KYI0GD+q1+96C2tY44PDX
	 fMlifMaNls50CWBjXKUpwtUPWNlRaxTPj+OKBC7joc92E0uV+Ungx4wOXeZF+tN9br
	 68Sj4zCpY7DAPcZkXlpi3uAyK4xXfuXSuiciVWl/HmuCFGJTXjIStkSi3w2cyiMrmR
	 +nFYB5UMJ/ZNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E865FC3274C;
	Thu,  9 Nov 2023 19:30:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes v2] drivers: perf: Do not broadcast to other cpus when
 starting a counter
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169955822794.13763.6368866008257927086.git-patchwork-notify@kernel.org>
Date: Thu, 09 Nov 2023 19:30:27 +0000
References: <20231026084010.11888-1-alexghiti@rivosinc.com>
In-Reply-To: <20231026084010.11888-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
 anup@brainfault.org, will@kernel.org, mark.rutland@arm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 ajones@ventanamicro.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, cleger@rivosinc.com, peterlin@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_113030_647833_D5595A06 
X-CRM114-Status: UNSURE (   8.26  )
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

On Thu, 26 Oct 2023 10:40:10 +0200 you wrote:
> This command:
> 
> $ perf record -e cycles:k -e instructions:k -c 10000 -m 64M dd if=/dev/zero of=/dev/null count=1000
> 
> gives rise to this kernel warning:
> 
> [  444.364395] WARNING: CPU: 0 PID: 104 at kernel/smp.c:775 smp_call_function_many_cond+0x42c/0x436
> [  444.364515] Modules linked in:
> [  444.364657] CPU: 0 PID: 104 Comm: perf-exec Not tainted 6.6.0-rc6-00051-g391df82e8ec3-dirty #73
> [  444.364771] Hardware name: riscv-virtio,qemu (DT)
> [  444.364868] epc : smp_call_function_many_cond+0x42c/0x436
> [  444.364917]  ra : on_each_cpu_cond_mask+0x20/0x32
> [  444.364948] epc : ffffffff8009f9e0 ra : ffffffff8009fa5a sp : ff20000000003800
> [  444.364966]  gp : ffffffff81500aa0 tp : ff60000002b83000 t0 : ff200000000038c0
> [  444.364982]  t1 : ffffffff815021f0 t2 : 000000000000001f s0 : ff200000000038b0
> [  444.364998]  s1 : ff60000002c54d98 a0 : ff60000002a73940 a1 : 0000000000000000
> [  444.365013]  a2 : 0000000000000000 a3 : 0000000000000003 a4 : 0000000000000100
> [  444.365029]  a5 : 0000000000010100 a6 : 0000000000f00000 a7 : 0000000000000000
> [  444.365044]  s2 : 0000000000000000 s3 : ffffffffffffffff s4 : ff60000002c54d98
> [  444.365060]  s5 : ffffffff81539610 s6 : ffffffff80c20c48 s7 : 0000000000000000
> [  444.365075]  s8 : 0000000000000000 s9 : 0000000000000001 s10: 0000000000000001
> [  444.365090]  s11: ffffffff80099394 t3 : 0000000000000003 t4 : 00000000eac0c6e6
> [  444.365104]  t5 : 0000000400000000 t6 : ff60000002e010d0
> [  444.365120] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
> [  444.365226] [<ffffffff8009f9e0>] smp_call_function_many_cond+0x42c/0x436
> [  444.365295] [<ffffffff8009fa5a>] on_each_cpu_cond_mask+0x20/0x32
> [  444.365311] [<ffffffff806e90dc>] pmu_sbi_ctr_start+0x7a/0xaa
> [  444.365327] [<ffffffff806e880c>] riscv_pmu_start+0x48/0x66
> [  444.365339] [<ffffffff8012111a>] perf_adjust_freq_unthr_context+0x196/0x1ac
> [  444.365356] [<ffffffff801237aa>] perf_event_task_tick+0x78/0x8c
> [  444.365368] [<ffffffff8003faf4>] scheduler_tick+0xe6/0x25e
> [  444.365383] [<ffffffff8008a042>] update_process_times+0x80/0x96
> [  444.365398] [<ffffffff800991ec>] tick_sched_handle+0x26/0x52
> [  444.365410] [<ffffffff800993e4>] tick_sched_timer+0x50/0x98
> [  444.365422] [<ffffffff8008a6aa>] __hrtimer_run_queues+0x126/0x18a
> [  444.365433] [<ffffffff8008b350>] hrtimer_interrupt+0xce/0x1da
> [  444.365444] [<ffffffff806cdc60>] riscv_timer_interrupt+0x30/0x3a
> [  444.365457] [<ffffffff8006afa6>] handle_percpu_devid_irq+0x80/0x114
> [  444.365470] [<ffffffff80065b82>] generic_handle_domain_irq+0x1c/0x2a
> [  444.365483] [<ffffffff8045faec>] riscv_intc_irq+0x2e/0x46
> [  444.365497] [<ffffffff808a9c62>] handle_riscv_irq+0x4a/0x74
> [  444.365521] [<ffffffff808aa760>] do_irq+0x7c/0x7e
> [  444.365796] ---[ end trace 0000000000000000 ]---
> 
> [...]

Here is the summary with links:
  - [-fixes,v2] drivers: perf: Do not broadcast to other cpus when starting a counter
    https://git.kernel.org/riscv/c/61e3d993c8bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
