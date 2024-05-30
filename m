Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1C5C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 21:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9M2u9aaJn/0VWUKiFlmEygQSPfSwiyn+N74ZeZhlJM=; b=VsGeRDLnKBA40h
	RvIGyCIYz/UcsSJqHqewVtK8eFLow3IUwaZSEfH8TkG5JjszBaJ07PXLmKbxZowOvllvKiw7Sk30a
	vSqxCJnQYbGXH7ginzBIv9qlA5zKTfqoHGEjn7XyjEo9mWkD1do9pUHPwfE8mQWjbipe//XC++AIa
	4LxO0nSc9vbHhnmXxDlW2ZGCrrT8PPxwFnJ17lDlNPZ6Jxi782SCgFWgQjO+vjVDaE9xBjQ2cuI1v
	x/eLY/kLAa+wjGWj2W78BdCh5JvZbooNyFIOyLCNJ5A2NdztN75wMgWg+jOtNMJzI9QXezP6h+Wm2
	kjlrnQMFTDaXe4vmpVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCn2j-00000008QxN-2OAK;
	Thu, 30 May 2024 21:10:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCn2e-00000008QuR-2NxT
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 21:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0625C62846;
	Thu, 30 May 2024 21:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABA7EC32789;
	Thu, 30 May 2024 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717103430;
	bh=WDI7R5NJdDXyrncOhY5G4sEPOR0dtgD/wFPdOrwQ2Jc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=J8qVyjrLdh8Q1jInXVtPiyhTcwYtv2jp8pMeZcJRddTeZoag1o4PUdAqrei0JnHfI
	 sVgJqhQ3GlSBDPeZeuSyPTtILhJc/U1aSK48BasZVCWSs8gzyTWFBd9U1EhbcRFSeL
	 otjVa4AjMy5eVh1dLKH0FRQu+jMt8NvjMfwuIT7qiZARwiQ2l7kqkhpBoy2ADhDnFe
	 urw1brJJXf0GM+/KUsfFWvJbCM2yG3Z+6kCteGT0JF3Rg6DZK6ZnwOpQ+aAryeJcKM
	 xZtp13xXQW7o9EXG/H90f6SHVuENtWMsaaCx8OWaQs96+mGlHXdsnWbfDsO76N5RN1
	 7U2y/M3Ib0oCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 94B38D84BCD;
	Thu, 30 May 2024 21:10:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: prevent pt_regs corruption for secondary idle
 threads
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171710343060.6624.5427985016791432886.git-patchwork-notify@kernel.org>
Date: Thu, 30 May 2024 21:10:30 +0000
References: <20240523084327.2013211-1-geomatsi@gmail.com>
In-Reply-To: <20240523084327.2013211-1-geomatsi@gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 anup@brainfault.org, atishp@rivosinc.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, samuel.holland@sifive.com,
 alexghiti@rivosinc.com, conor.dooley@microchip.com,
 sergey.matyukevich@syntacore.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_141032_732763_5D26D963 
X-CRM114-Status: GOOD (  11.18  )
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

On Thu, 23 May 2024 11:43:23 +0300 you wrote:
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> 
> Top of the kernel thread stack should be reserved for pt_regs. However
> this is not the case for the idle threads of the secondary boot harts.
> Their stacks overlap with their pt_regs, so both may get corrupted.
> 
> Similar issue has been fixed for the primary hart, see c7cdd96eca28
> ("riscv: prevent stack corruption by reserving task_pt_regs(p) early").
> However that fix was not propagated to the secondary harts. The problem
> has been noticed in some CPU hotplug tests with V enabled. The function
> smp_callin stored several registers on stack, corrupting top of pt_regs
> structure including status field. As a result, kernel attempted to save
> or restore inexistent V context.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: prevent pt_regs corruption for secondary idle threads
    https://git.kernel.org/riscv/c/a638b0461b58

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
