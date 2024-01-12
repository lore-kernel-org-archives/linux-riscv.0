Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9270C47DA6
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 06:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDH+TVh6aU4UtmEFExrMNYfMw4xYDHlUs5vqJ3e7bQs=; b=w0Mo10lSDVgG39
	ZM/kVf/FLqW9mrvgdP0UinuXZVdI1swWmyQ8+h7KDiTkkvkZkF+4AZ0QUzulTWPydb6yKCDc28c5X
	PapLb3meBSjHev3+drSMN6fy6/am568QWgtc+z8ec2l77z+s/KE9quPUgLxqXv/0Q+8yUE8fkgKVJ
	EbhWK/QLTFrxwp7LEqXhRD5OF3HphfzMrVFLCE+vsP0PT8f3P/ygBl4ZXSLEqFNJA8DHpM9q0vU7r
	z3MatljRjzjfO/deJUgx4AOx8Uu3w6Jo7IvluVXe4CAx+Zr8RVgkDgQykvADaJbnMxI6Yanf67jjD
	u/XjDmjSDODVcGNGC+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOB3v-0020v5-0w;
	Fri, 12 Jan 2024 06:30:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOB3s-0020sC-0x
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 06:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9BD88B8217D;
	Fri, 12 Jan 2024 06:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D49B9C433C7;
	Fri, 12 Jan 2024 06:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705041030;
	bh=z9Fr8cpdcINCzvCVvgPPST4M/CTDfXNy6fF+xsO0Z+I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AvhxErs+1WjyUXwocIuaQ888i4KZYLWhkFlC4wtWnr4SK90i7TBeF9v8XdXC4pWIK
	 jtNIRqb5xHhUTes2RhvmNqocM4tYoEnVx85QHNWyynMSzfBaxYoqr2MLjWaW7NTorM
	 n+VFfWOL4crc7XZWgLiJjsyW8S5rzoTC2z5v7e8QxSl/RXEuBGHH3tm/MovlOHv8bS
	 ear7bBowY510OCilaPAGrDHSObRfKchoAaZ4mHRtuKaytwWz1XuzO5DtB8NXTbMrMa
	 Iz/v+KlvpDPgCW+IwJcoXU2j7rkThjUZu0o91CxV+XzM9AluJzWK1yAPjLHjvcelIk
	 mM0RsvLdlxDrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B96D2D8C972;
	Fri, 12 Jan 2024 06:30:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [v10, 00/10] riscv: support kernel-mode Vector
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170504103075.17535.16233182023874920613.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jan 2024 06:30:30 +0000
References: <20240111131558.31211-1-andy.chiu@sifive.com>
In-Reply-To: <20240111131558.31211-1-andy.chiu@sifive.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 bjorn@kernel.org, charlie@rivosinc.com, ardb@kernel.org, arnd@arndb.de,
 peterz@infradead.org, tglx@linutronix.de, ebiggers@kernel.org,
 aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_223036_499376_D44A176C 
X-CRM114-Status: GOOD (  11.43  )
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

On Thu, 11 Jan 2024 13:15:48 +0000 you wrote:
> This series provides support running Vector in kernel mode.
> Additionally, kernel-mode Vector can be configured to run without
> turnning off preemption on a CONFIG_PREEMPT kernel. Along with the
> suport, we add Vector optimized copy_{to,from}_user. And provide a
> simple threshold to decide when to run the vectorized functions.
> 
> We decided to drop vectorized memcpy/memset/memmove for the moment due
> to the concern of memory side-effect in kernel_vector_begin(). The
> detailed description can be found at v9[1]
> 
> [...]

Here is the summary with links:
  - [v10,01/10] riscv: Add support for kernel mode vector
    https://git.kernel.org/riscv/c/c0ae350f714f
  - [v10,02/10] riscv: vector: make Vector always available for softirq context
    https://git.kernel.org/riscv/c/ebf52ac30e4f
  - [v10,03/10] riscv: Add vector extension XOR implementation
    https://git.kernel.org/riscv/c/9ff97211a623
  - [v10,04/10] riscv: sched: defer restoring Vector context for user
    https://git.kernel.org/riscv/c/f4471252f3b9
  - [v10,05/10] riscv: lib: vectorize copy_to_user/copy_from_user
    https://git.kernel.org/riscv/c/145ca6eddd70
  - [v10,06/10] riscv: fpu: drop SR_SD bit checking
    https://git.kernel.org/riscv/c/25a830944773
  - [v10,07/10] riscv: vector: do not pass task_struct into riscv_v_vstate_{save,restore}()
    https://git.kernel.org/riscv/c/9dece8bf0343
  - [v10,08/10] riscv: vector: use a mask to write vstate_ctrl
    https://git.kernel.org/riscv/c/c05992747c96
  - [v10,09/10] riscv: vector: use kmem_cache to manage vector context
    https://git.kernel.org/riscv/c/660217429614
  - [v10,10/10] riscv: vector: allow kernel-mode Vector with preemption
    https://git.kernel.org/riscv/c/aa23c6172d33

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
