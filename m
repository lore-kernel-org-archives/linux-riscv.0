Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3015CD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuSWP4BsyH61hzXaZIKlSPjh9bCwXfBKIlbPWCQayY8=; b=TWts5VrDbkJEuM
	DMUT9WvwdKVOtnIXU/45TvBfFIcarcI56PHS0M91fmC4vvGRdCJpEPDVLYcnq01HQUudFHbeAk/Xj
	1/uUwChZgP0+9CUXR8EwbzsFNg8Rnq1VkaDMdG93Mp3uCsHe2hW4DGCh5kuZLm5F1EdphhKGHGMpd
	uG4lRhzfnUhrZ2guqwTMQANcMEeljH06OMwvLRIKmO3O5mi/tRTOECIhO/z4RLoOkhP17fVY+QsBd
	kmFznwjKgLFbwZM9kzRRbzW1QvULluEreiLFVy9LMhJPmD2HAhrBuYTjAX63xyutpb/lRM6uJEJ11
	ZeILoIlLhxDPF0nZyDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYer-00000007OT8-3qyv;
	Wed, 10 Apr 2024 14:10:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYem-00000007OQ6-0zjX
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85A9BCE29CF;
	Wed, 10 Apr 2024 14:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F286C43394;
	Wed, 10 Apr 2024 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712758229;
	bh=pRgnzoGAqN+8AmHMkslGDM2NWRVdlaRT9PhcUTzgJJY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=msU30hyIMeAZQZysjcS6nFd+A1m/bQG/yLGXEvqM3/QhZNHaK92i6sS7+k5ZvJ/J8
	 rMZb+AEl50BIQWKhEKfN7GJ9KmluajYdrA4EWxqwd+DEE/N7hbT8AU6oWrTwDpL6O9
	 aMS6lId5NtmTZ2EXnATJ+5KuWlNznBM8r+D1Qi6+RlRFN8AT+9WtkxjEqu/jMWbUGn
	 XdXB42FII76a9l0D/z36dXCZjIjh3W+sbIxPO53ReoZ8vQTsYONHA4X/N+xUr+0yOb
	 ymGobJUfVfKV+TZtTmrcFAaFKVbA6Xi/LbH5JZ1mVSD7nSzu5igqAAWsEUbf61wtTV
	 BdyWDP5KuFDkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4DD23D60310;
	Wed, 10 Apr 2024 14:10:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: only flush icache when it has VM_EXEC set
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171275822931.12683.7449228181407944312.git-patchwork-notify@kernel.org>
Date: Wed, 10 Apr 2024 14:10:29 +0000
References: <tencent_6D851035F6F2FD0B5A69FB391AE39AC6300A@qq.com>
In-Reply-To: <tencent_6D851035F6F2FD0B5A69FB391AE39AC6300A@qq.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alexghiti@rivosinc.com, conor.dooley@microchip.com, jszhang@kernel.org,
 andrew@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_071032_522230_99B0A2C7 
X-CRM114-Status: GOOD (  10.29  )
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

On Wed, 10 Jan 2024 02:48:59 +0800 you wrote:
> As I-Cache flush on current RISC-V needs to send IPIs to every CPU cores
> in the system is very costly, limiting flush_icache_mm to be called only
> when vma->vm_flags has VM_EXEC can help minimize the frequency of these
> operations. It improves performance and reduces disturbances when
> copy_from_user_page is needed such as profiling with perf.
> 
> For I-D coherence concerns, it will not fail if such a page adds VM_EXEC
> flags in the future since we have checked it in the __set_pte_at function.
> 
> [...]

Here is the summary with links:
  - RISC-V: only flush icache when it has VM_EXEC set
    https://git.kernel.org/riscv/c/542124fc0d5c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
