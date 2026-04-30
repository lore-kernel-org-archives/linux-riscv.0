Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD69FF886F
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 04:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzqQPv85geZNM2Jl1OKQdXRQAXV1TZtNUGvqU+PmCUE=; b=hRnSYpppYoxZxX
	xNiiAcvOowleoOVZjjdUVBTh9nihF3hCACrE4wHfJhb/y+9F+/aZE3kRYb2xEqfFII3EBtkZLpyuK
	eql4mzOEWQgZ4Fr49ZunW/NyMqhQ9Y8xhJzriC9yvMniPGe6GUjbNVE5idNeghEOYLqEP1Fzxd/4C
	DSxz092O2bmvNWAVCW6XIANBJNOZulrs/xnbPrnmFipcIx9vVh4/znpfuI2z+QXLt2OiLZY7SBBu7
	8MCjvuGNNbtHNXJuuoqGmYWOB0t4oeQAnxe5pf3fYsyxAFk8iD3U88+KBMumOA9Tsz+JfGw8539jZ
	E1gsFnNFJ2gVUb6nkxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIiU-00000004e2Q-2lDv;
	Thu, 30 Apr 2026 04:09:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIIiR-00000004e0f-1ZkX;
	Thu, 30 Apr 2026 04:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 161A043E87;
	Thu, 30 Apr 2026 04:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC32BC2BCB8;
	Thu, 30 Apr 2026 04:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777522163;
	bh=/yAJoCa+tdOOPshUE/A43LRN52owg3v5BFKm8i3T8LM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ea/vUlXO8QAMnZo9aS3eeiw/XXfsvC/WwV0ygYsWmMJaV+j2mdhgSMBDoucO3ixea
	 LecOLHdPEbaK7XnLzvzCMtN+Y+om3patozKnNyEB41SSR4aHLALWh/+h7gLqJr52yv
	 pNoWtmBGh/RDeFW0kmQraXtm0inHMHEsGHreHiHnOx7aOsSI4vZ90DencUUU8uz3Z6
	 J1NZSSJwb4k94jm3NqyObnW1pff8xDL0KNNRYMdzJc7A8UkQji12Ks5x9eZ3mnUThC
	 13EmSaGrV+qxVuJ06aXhrnaV0D2eyzclL0DEDEoLdq13b+X9u21heIL4vyk1ItYv9O
	 fqeFuBOOlKo+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDAF3809A07;
	Thu, 30 Apr 2026 04:08:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] KVM/riscv changes for 7.1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177752211779.2274119.18444543512578889035.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 04:08:37 +0000
References: <CAAhSdy0sU997x67zZe00ZVPVrOT-=X8zOUk3OxWXeDcn-rHeXA@mail.gmail.com>
In-Reply-To: <CAAhSdy0sU997x67zZe00ZVPVrOT-=X8zOUk3OxWXeDcn-rHeXA@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com, palmer@dabbelt.com,
 pjw@kernel.org, andrew.jones@oss.qualcomm.com, atish.patra@linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_210931_460153_148AFB31 
X-CRM114-Status: GOOD (  10.05  )
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

This pull request was applied to riscv/linux.git (for-next)
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
