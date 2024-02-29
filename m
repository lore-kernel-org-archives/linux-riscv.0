Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA12AC54798
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 22:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWdO1HXkXKmHvrxsw7yW140G+Rkl5zcE8E+OJq/YAOA=; b=rqsFxVQNBWN+JP
	EvoYo7EBxdfKTpgq2Eu3DvE0l18+XJBCfAusiH85nC5q4doP9cbAiNoPUtlpUM66MoH+gWJXaroEm
	rOVhQ/W+/J1HcUG4DY80gHrubF3iFtUekXNakT9xK/b1Whg3ob8+TSH3BzOZ+8SL93hJmu/+U4r3Q
	V6CWEyRLJznV9uN2Piq01IMGWJa7TPHCXP+zMJtzMBnAJoB9diB9hGnm7hASxV+STx0oRlNdNfGz9
	HSVMBqrWY4BapalPj2hvLMsCtMSAsDluVNbqy1HrcT2C39UoLxYBShK9k+sjDWg4PoLtZCNXs3ZcE
	4NwgG1M/dGLsOX45lrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfoc0-0000000FQ9j-3egZ;
	Thu, 29 Feb 2024 22:10:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfobs-0000000FQ7B-0wxt
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 22:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7CC3D6130E;
	Thu, 29 Feb 2024 22:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0C72C43399;
	Thu, 29 Feb 2024 22:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709244634;
	bh=Xshzz8u+GACm7zsgY24OGdncleyp/uFZ5N6ldpcM0R8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=J6rJJrLAUaaK4NQJY+PMgKVdYEZ/wVcC9zEA/uvLEjqA7Y5p+fgN/FRPS8g/uWvTX
	 LQsE/ADmPYFnWsOBkX0pHL9LggVUk2zst4fuO1s2C9r0BEElVbcRmX0vazd56k9mP5
	 AZ2Xyk0T9+NMCQr5rqr3ikYIiRRAZ4Egl13iCHhytCrwEDfemO8A54j4xA6AVAZXq6
	 l+z90znIVUPIaXvu8Mng5/ODpcbSeOmVBNkjGvI+nQIAkqcH0WvoetiKe5spm8WUJx
	 4du+cAXjLxYRsth1tGIqKZ3G+bj1qX7RAPpy7o6KURwv1O+dlWzWbEbbiB0WIG8FJB
	 oNs4zhr6kvzDw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5BB5D84BC5;
	Thu, 29 Feb 2024 22:10:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4] perf: RISCV: Fix panic on pmu overflow handler
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170924463467.14902.12108518439283100059.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 22:10:34 +0000
References: <20240228115425.2613856-1-fei2.wu@intel.com>
In-Reply-To: <20240228115425.2613856-1-fei2.wu@intel.com>
To: Fei Wu <fei2.wu@intel.com>
Cc: linux-riscv@lists.infradead.org, atishp@atishpatra.org,
 anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, alex@ghiti.fr,
 alexghiti@rivosinc.com, atishp@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_141036_425254_E1E3F27F 
X-CRM114-Status: UNSURE (   8.87  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 28 Feb 2024 19:54:25 +0800 you wrote:
> (1 << idx) of int is not desired when setting bits in unsigned long
> overflowed_ctrs, use BIT() instead. This panic happens when running
> 'perf record -e branches' on sophgo sg2042.
> 
> [  273.311852] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000098
> [  273.320851] Oops [#1]
> [  273.323179] Modules linked in:
> [  273.326303] CPU: 0 PID: 1475 Comm: perf Not tainted 6.6.0-rc3+ #9
> [  273.332521] Hardware name: Sophgo Mango (DT)
> [  273.336878] epc : riscv_pmu_ctr_get_width_mask+0x8/0x62
> [  273.342291]  ra : pmu_sbi_ovf_handler+0x2e0/0x34e
> [  273.347091] epc : ffffffff80aecd98 ra : ffffffff80aee056 sp : fffffff6e36928b0
> [  273.354454]  gp : ffffffff821f82d0 tp : ffffffd90c353200 t0 : 0000002ade4f9978
> [  273.361815]  t1 : 0000000000504d55 t2 : ffffffff8016cd8c s0 : fffffff6e3692a70
> [  273.369180]  s1 : 0000000000000020 a0 : 0000000000000000 a1 : 00001a8e81800000
> [  273.376540]  a2 : 0000003c00070198 a3 : 0000003c00db75a4 a4 : 0000000000000015
> [  273.383901]  a5 : ffffffd7ff8804b0 a6 : 0000000000000015 a7 : 000000000000002a
> [  273.391327]  s2 : 000000000000ffff s3 : 0000000000000000 s4 : ffffffd7ff8803b0
> [  273.398773]  s5 : 0000000000504d55 s6 : ffffffd905069800 s7 : ffffffff821fe210
> [  273.406139]  s8 : 000000007fffffff s9 : ffffffd7ff8803b0 s10: ffffffd903f29098
> [  273.413660]  s11: 0000000080000000 t3 : 0000000000000003 t4 : ffffffff8017a0ca
> [  273.421022]  t5 : ffffffff8023cfc2 t6 : ffffffd9040780e8
> [  273.426437] status: 0000000200000100 badaddr: 0000000000000098 cause: 000000000000000d
> [  273.434512] [<ffffffff80aecd98>] riscv_pmu_ctr_get_width_mask+0x8/0x62
> [  273.441169] [<ffffffff80076bd8>] handle_percpu_devid_irq+0x98/0x1ee
> [  273.447562] [<ffffffff80071158>] generic_handle_domain_irq+0x28/0x36
> [  273.454151] [<ffffffff8047a99a>] riscv_intc_irq+0x36/0x4e
> [  273.459659] [<ffffffff80c944de>] handle_riscv_irq+0x4a/0x74
> [  273.465442] [<ffffffff80c94c48>] do_irq+0x62/0x92
> [  273.470360] Code: 0420 60a2 6402 5529 0141 8082 0013 0000 0013 0000 (6d5c) b783
> [  273.477921] ---[ end trace 0000000000000000 ]---
> [  273.482630] Kernel panic - not syncing: Fatal exception in interrupt
> 
> [...]

Here is the summary with links:
  - [v4] perf: RISCV: Fix panic on pmu overflow handler
    https://git.kernel.org/riscv/c/34b567868777

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
