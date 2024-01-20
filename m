Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EF2C47DAF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 22:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/aEE3VGnwTh2rKkAJcMe4y1zoPgjpaJzOPP2ERrDn5w=; b=KKF7xIvg9+g3Jn
	SxG/4do6ywrY/Danf4h9g71KLVWjgLCo66eAstiY0ZR/TxHFDp7sPKfDBs5iKnscLd1wsS7RsxvCV
	c7H1FRV5ivnyUxBjPoTgXbxHAdBFK4KninN2DJnfCG0s2rrRyRjLpya0KRR7OaOz7WK0wgvygJsJl
	P+HB/sexab3mcKs8Hy5jijhPFxjdjDcNp44v/96P6qdgtSr8XV3prhvSztaQogEpWP2y5lr89M4d7
	RDVv+mPFv9x08KHA+vgSGprOuYkIg1NtlR2wHsDhFfqKSE5XR8DpZKMngDMD/R2fpaAy4nu0UseMw
	hTBK1zVjMFhz56z3pbug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJdu-008VIf-0C;
	Sat, 20 Jan 2024 22:16:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbE-008OCi-1Q;
	Sat, 20 Jan 2024 21:09:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 84F9960C28;
	Sat, 20 Jan 2024 21:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E313C433F1;
	Sat, 20 Jan 2024 21:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784995;
	bh=g34/xJKX2jsxi0amyi4X5bqKFQE7wPjdskyTTdrZlQ8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NTP/xeCrPIQp9brjrnROcvMyiFSb/O3sc9moYMvDrgNJhInVzGjJtzc7Ugu9CGIY5
	 DJ+4wgZAxaojyAMMvDF0etxc9iyZkMI71uERD4LvcDlSNKPiw5cmlns4mE3VtqtIO3
	 MG7yQdLkbY4ZR/ZhbInuSzcmqB3p17uoecap2YjHKmTXapmdrbXVAiPfUGT+02DIrP
	 fZaYV/Sc9yVXs4DGwrmycDO8AVqsiw1keg18A43p0Q6PGRsStYh53yhGACqZBWdL5z
	 H/A/uIPA1idOGJHVyJ7xVoxWyPndle2EFHCxdSRZpB07RgVtGqduALQtsaXzAYJ72i
	 5szhiu6AEq4bw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3D6D3D8C96C;
	Sat, 20 Jan 2024 21:09:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/13] RISC-V: Add steal-time support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499524.24348.16462593200054070695.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:55 +0000
References: <20231220160012.40184-15-ajones@ventanamicro.com>
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 virtualization@lists.linux-foundation.org, anup@brainfault.org,
 atishp@atishpatra.org, pbonzini@redhat.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com,
 srivatsa@csail.mit.edu, guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_130956_524476_F52EA2A1 
X-CRM114-Status: UNSURE (   8.49  )
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

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Wed, 20 Dec 2023 17:00:13 +0100 you wrote:
> One frequently touted benefit of virtualization is the ability to
> consolidate machines, increasing resource utilization.  It may even be
> desirable to overcommit, at the risk of one or more VCPUs having to wait.
> Hypervisors which have interfaces for guests to retrieve the amount of
> time each VCPU had to wait give observers within the guests ways to
> account for less progress than would otherwise be expected. The SBI STA
> extension[1] provides a standard interface for guest VCPUs to retrieve
> the amount of time "stolen".
> 
> [...]

Here is the summary with links:
  - [v4,01/13] RISC-V: paravirt: Add skeleton for pv-time support
    (no matching commit)
  - [v4,02/13] RISC-V: Add SBI STA extension definitions
    https://git.kernel.org/riscv/c/6cfc624576a6
  - [v4,03/13] RISC-V: paravirt: Implement steal-time support
    (no matching commit)
  - [v4,04/13] RISC-V: KVM: Add SBI STA extension skeleton
    (no matching commit)
  - [v4,05/13] RISC-V: KVM: Add steal-update vcpu request
    (no matching commit)
  - [v4,06/13] RISC-V: KVM: Add SBI STA info to vcpu_arch
    (no matching commit)
  - [v4,07/13] RISC-V: KVM: Add support for SBI extension registers
    (no matching commit)
  - [v4,08/13] RISC-V: KVM: Add support for SBI STA registers
    (no matching commit)
  - [v4,09/13] RISC-V: KVM: Implement SBI STA extension
    (no matching commit)
  - [v4,10/13] RISC-V: KVM: selftests: Move sbi_ecall to processor.c
    (no matching commit)
  - [v4,11/13] RISC-V: KVM: selftests: Add guest_sbi_probe_extension
    (no matching commit)
  - [v4,12/13] RISC-V: KVM: selftests: Add steal_time test support
    (no matching commit)
  - [v4,13/13] RISC-V: KVM: selftests: Add get-reg-list test for STA registers
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
