Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBC3D462B9
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 15:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0492XhaMItj45/xpUWsdFJ84A2Cx6cnxMC9E+ldlzJs=; b=R9iPQ8tnxY9qGb
	Cpq8HYnnPjnzJatXlUZOJoJBiOcTcfQn5+sJNHSQh9A20QyqhAavrb012rg/RBzUfw8EG5SfxI1sj
	Q8g8W9zRxaOX26rfgKrzDzPes5H1j2FH/oO3q2gMKU6l4uzuMZ+qCR7jXyYopclNcimtGISKeBIS1
	/3rNhLnSsMDNP9O0sf+Q9tks7ojmSyQs8NGGqHAqoApEur11A2ZdzkpsIBiHs2H5b0WXnp248xjr6
	iXBnfcE8xZs7hzuboX8mIjTaQDDfh6EbfUu4tP7e1leLvuYrHdNKrscmuPgVHmp0Phg5/A8hs9Mc6
	7lOl9S65h4R32DuUDgKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBF37-00000007Fnp-0oAy;
	Wed, 13 Nov 2024 15:12:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBF32-00000007Fkp-0kJZ
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 15:12:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30F475C58E2;
	Wed, 13 Nov 2024 15:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4EBC4CEC3;
	Wed, 13 Nov 2024 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731510766;
	bh=+mOm1jVBlMQl06mqGb93rPEPLa+Adk6NChbI8ONl/FY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FBBBy31WBOhcPfZ8wMelhHag7Oju1fWFqLKGEU+k86hfHQCglpNh1yTu06JbNRbpT
	 u+lZGKDPg7Qfiml5/l8B20o2qTixnuiQ/BNS9uLetQ5XaW5CPMsHT/R0FDPjQIgzUx
	 Le+OEq2yOXCgA3SFI4lsVJ/8SSgHpG9D+yklx4RRQre6bCXfhh8E9y0Tlhf9KUCFYF
	 Op6pBP5CPMT+cOnU5zHBIuH6xtap6Rxr7qinY+eNebTQZTSj8Nx75D5OjGPQvquGUM
	 pshCm0Z0C4CZ4CImeyc7/4moQWS5JrWFHB1QsTAcEdAgAgwzmS5/L5H+U2ePjjxvfE
	 2MY3waRGyTB3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342473809A80;
	Wed, 13 Nov 2024 15:12:58 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/13] Zacas/Zabha support and qspinlocks
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173151077674.1250875.11061543352254749516.git-patchwork-notify@kernel.org>
Date: Wed, 13 Nov 2024 15:12:56 +0000
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
In-Reply-To: <20240818063538.6651-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, parri.andrea@gmail.com, nathan@kernel.org,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com,
 boqun.feng@gmail.com, arnd@arndb.de, leobras@redhat.com, guoren@kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_071248_269452_FCFDDB43 
X-CRM114-Status: UNSURE (   9.28  )
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

On Sun, 18 Aug 2024 08:35:25 +0200 you wrote:
> This implements [cmp]xchgXX() macros using Zacas and Zabha extensions
> and finally uses those newly introduced macros to add support for
> qspinlocks: note that this implementation of qspinlocks satisfies the
> forward progress guarantee.
> 
> It also uses Ziccrse to provide the qspinlock implementation.
> 
> [...]

Here is the summary with links:
  - [v5,01/13] riscv: Move cpufeature.h macros into their own header
    https://git.kernel.org/riscv/c/010e12aa4925
  - [v5,02/13] riscv: Do not fail to build on byte/halfword operations with Zawrs
    https://git.kernel.org/riscv/c/af042c457db0
  - [v5,03/13] riscv: Implement cmpxchg32/64() using Zacas
    https://git.kernel.org/riscv/c/38acdee32d23
  - [v5,04/13] dt-bindings: riscv: Add Zabha ISA extension description
    (no matching commit)
  - [v5,05/13] riscv: Implement cmpxchg8/16() using Zabha
    (no matching commit)
  - [v5,06/13] riscv: Improve zacas fully-ordered cmpxchg()
    (no matching commit)
  - [v5,07/13] riscv: Implement arch_cmpxchg128() using Zacas
    https://git.kernel.org/riscv/c/f7bd2be7663c
  - [v5,08/13] riscv: Implement xchg8/16() using Zabha
    https://git.kernel.org/riscv/c/97ddab7fbea8
  - [v5,09/13] asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
    https://git.kernel.org/riscv/c/cbe82e140bb7
  - [v5,10/13] asm-generic: ticket-lock: Add separate ticket-lock.h
    https://git.kernel.org/riscv/c/22c33321e260
  - [v5,11/13] riscv: Add ISA extension parsing for Ziccrse
    (no matching commit)
  - [v5,12/13] dt-bindings: riscv: Add Ziccrse ISA extension description
    https://git.kernel.org/riscv/c/447b2afbcde1
  - [v5,13/13] riscv: Add qspinlock support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
