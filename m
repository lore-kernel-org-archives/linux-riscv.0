Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A4CD462BF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7hoMX7uNfFDzwhvJF3gxgFM/rirdVEd8Rm48FBKVbA=; b=1nCMF9LEfq7apn
	DKISEmqYp6hO2lvAiaM33XI+1FwTGk0Sgoiitd29i4YPjrXYtOOKQW0sWcpMOW6CZnsK2+qcjpkzk
	+yE2zOGb8NoiKdRPZyTZNt7iFRBfHZrRZUry9vEpzHwgPHbG9Ee8uEtwE8TfKfXDgOUvplDPFM7qk
	bxdTa8iA08PlKszeX+aRMsXShaAxTiSLvNM5QJhHqU37vcGY5YXoX5aJpX3aUgrm6m9DUa+zCSmPr
	VltGZod8zXtncdBz+Xlx8YGM/QU4YxHGAWh9FR5J4afpr3p2e65mDGErFUopKXp3fmIGXpgjxjSZ0
	mhyi1Rd6SJuUdKx5t7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBF33-00000007Flj-065s;
	Wed, 13 Nov 2024 15:12:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBF30-00000007FkN-1Ats
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 15:12:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61111A40C4C;
	Wed, 13 Nov 2024 15:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21583C4CEC3;
	Wed, 13 Nov 2024 15:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731510765;
	bh=TFqBsCEEhiEfUZXx4rlGwlcvCf9x/nrUHFsj/Ii/Gnc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=enaSTBNQt0IiBQIiu7I69IWa79Y00emUOBHMQmq+W0IYB1CGcDtJcoTz58JjLF8NS
	 5hGay2n3XUoE2c4i6NtTOBFIG75mQHhoA/mgweNWoVCnEgKSDGu193CpRzKKOe/bAp
	 5hnXo+lJ/rPOVxNu9oz/vf7WSlY6Bs+J3RFgqXagoAlA9z6VcKnRd/1SygjKmeQ8X1
	 3ZpNgY60ZgKaGoKczU5A3j9dPM8mPhTokpL6EGt9cCTDHwSqY63XHFw50psLnnSL0y
	 MVedQEtlvbmBMEDq1iEItNs/I6QVCv9DMTP1vTDy9G2FY2FCJ82chUPeAP0zVWQi8c
	 Hf06mFby3gkEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDAD3809A80;
	Wed, 13 Nov 2024 15:12:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 00/13] Zacas/Zabha support and qspinlocks
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173151077551.1250875.2817493635093268101.git-patchwork-notify@kernel.org>
Date: Wed, 13 Nov 2024 15:12:55 +0000
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
In-Reply-To: <20241103145153.105097-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, parri.andrea@gmail.com, nathan@kernel.org,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com,
 boqun.feng@gmail.com, arnd@arndb.de, leobras@redhat.com, guoren@kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_071246_469286_7CD5B4B9 
X-CRM114-Status: UNSURE (   9.48  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun,  3 Nov 2024 15:51:40 +0100 you wrote:
> This implements [cmp]xchgXX() macros using Zacas and Zabha extensions
> and finally uses those newly introduced macros to add support for
> qspinlocks: note that this implementation of qspinlocks satisfies the
> forward progress guarantee.
> 
> It also uses Ziccrse to provide the qspinlock implementation.
> 
> [...]

Here is the summary with links:
  - [v6,01/13] riscv: Move cpufeature.h macros into their own header
    https://git.kernel.org/riscv/c/010e12aa4925
  - [v6,02/13] riscv: Do not fail to build on byte/halfword operations with Zawrs
    https://git.kernel.org/riscv/c/af042c457db0
  - [v6,03/13] riscv: Implement cmpxchg32/64() using Zacas
    https://git.kernel.org/riscv/c/38acdee32d23
  - [v6,04/13] dt-bindings: riscv: Add Zabha ISA extension description
    https://git.kernel.org/riscv/c/51624ddcf59d
  - [v6,05/13] riscv: Implement cmpxchg8/16() using Zabha
    https://git.kernel.org/riscv/c/1658ef4314b3
  - [v6,06/13] riscv: Improve zacas fully-ordered cmpxchg()
    https://git.kernel.org/riscv/c/6116e22ef33a
  - [v6,07/13] riscv: Implement arch_cmpxchg128() using Zacas
    https://git.kernel.org/riscv/c/f7bd2be7663c
  - [v6,08/13] riscv: Implement xchg8/16() using Zabha
    https://git.kernel.org/riscv/c/97ddab7fbea8
  - [v6,09/13] asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
    https://git.kernel.org/riscv/c/cbe82e140bb7
  - [v6,10/13] asm-generic: ticket-lock: Add separate ticket-lock.h
    https://git.kernel.org/riscv/c/22c33321e260
  - [v6,11/13] riscv: Add ISA extension parsing for Ziccrse
    https://git.kernel.org/riscv/c/2d36fe89d872
  - [v6,12/13] dt-bindings: riscv: Add Ziccrse ISA extension description
    https://git.kernel.org/riscv/c/447b2afbcde1
  - [v6,13/13] riscv: Add qspinlock support
    https://git.kernel.org/riscv/c/ab83647fadae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
