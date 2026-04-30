Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E4BCD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FD1Wg2fSyH0IWKTUNUHBpNEq//wohDxSgutVMEwayww=; b=yx94d978u97cLM
	Ro7+02hyTxoZZdQqhstDHA42IMvS//b9pTax3TBsFqfMdHcg0rr5IkmNvf7C9hs5FnotkqJ6gSXMI
	IwSgbCs49tMUVrQtdxgi/23LV+B33HDGHhBb/2h0rdM+4gvPChjweKySdjH42FQtcsHV1VNdtHlz9
	aa+Z8w/+kt0HcNFu+BY85ynhHkWPZ52dYCD9glm8Tz8Zx6vFYVpMOvqrs9t6R828jHRG9I02tWWJM
	rNk6BPG9QJOV7H9JT90+8SpJROOH9wC3U5HtTS1buhsk3rXf4uqGZJXXJ0+35hg91V64XMYK+oGi9
	6ytl6Kz73pWmatgw7yrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4S-00000004YY0-2eRY;
	Thu, 30 Apr 2026 03:28:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII32-00000004X5J-3xS4;
	Thu, 30 Apr 2026 03:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3300F61344;
	Thu, 30 Apr 2026 03:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC919C2BCB8;
	Thu, 30 Apr 2026 03:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519603;
	bh=GMxRZN/UtMTJF8yKD1Ke513bn+WSJy15blPJ0tX5gfg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KRU5slQpE347j7zarnXTd98IfdcwAwWAv5FaN7VKfqW4w+FLBeunoUwuW1Gl+MC5j
	 1o2lneUKYMNx3FtNXlHv4v6kDGx8CLpXjLpftfJxHKm8cwO4vw3j7AwpfmGLCPXlw9
	 vKXfnBabJJ84EocUa5b7Sr8tT8gGM9ckSdo9rVGRAfAGwG4d082VtaJ8QJT0bYW4rd
	 Xo7BZUVpifR9m7RUXbfe/XZYBHEtSj/FfIQ91PxzEVnTqbCQTyI6sngdMaoJkQpGJr
	 uPZodzZ7fwEQavdj6qn5ieGrp4jT8vzCeilaPMWSzDBYAFoUWp1SZ/8IS7Y+qlgcCH
	 FrEY1w81628ZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD213809A07;
	Thu, 30 Apr 2026 03:26:00 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] KVM/riscv changes for 7.1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751955879.2274119.5780580511705921514.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:58 +0000
References: <CAAhSdy0sU997x67zZe00ZVPVrOT-=X8zOUk3OxWXeDcn-rHeXA@mail.gmail.com>
In-Reply-To: <CAAhSdy0sU997x67zZe00ZVPVrOT-=X8zOUk3OxWXeDcn-rHeXA@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com, palmer@dabbelt.com,
 pjw@kernel.org, andrew.jones@oss.qualcomm.com, atish.patra@linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
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

This pull request was applied to riscv/linux.git (fixes)
by Paolo Bonzini <pbonzini@redhat.com>:

On Sun, 12 Apr 2026 18:44:24 +0530 you wrote:
> Hi Paolo,
> 
> We have the following KVM RISC-V changes for 7.1:
> 1) Fixes for issues in steal time accounting, vector and
>     PMU which were discovered by KVM API fuzzing
> 2) Split huge pages during fault handling for dirty logging
>     so that write permission is restored for smaller pages
> 3) Improve kvm_arch_vcpu_load() performance by skipping
>     CSR restore if VCPU is reloaded on the same core
> 4) Implement kvm_arch_has_default_irqchip() for KVM selftests
> 5) Support configuration of per-VM HGATP mode from KVM
>     user space
> 6) Some more preparatory changes for nested virtualization
>     such as:
>     6.1) Factored-out ISA checks into separate sources
>     6.2) Added hideleg to struct kvm_vcpu_config
>     6.3) Factored-out VCPU config into separate sources
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] KVM/riscv changes for 7.1
    https://git.kernel.org/riscv/c/d880d2a9c694

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
