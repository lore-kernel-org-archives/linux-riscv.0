Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEFFC531DD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 17:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1wDPp+uLEufM2SbEbw+bBeCqNoM2eguQGggsCPFEk0=; b=UkT7J4FqLpI92t
	GZXrMgl6JkW35JcZy48JB05Dwm7E/TUewBL6KwLw8QHn/4VleP3HI1EvP4b8e9QN7p7/CzBb+jPLl
	C1uD+vxa4cAPqrnLYbOjeQG4995wlL+86hNZYTQf7E0skxDLmciysNgodA5tubdWBY9iEs/UTrF/D
	Y5NhwPJDzq51XxMHUOOt36ku1Qm9+wQWDavU+IHgkmeg5LFS2ctQfAq32aKUIYUEe6ROJtjFwt+S+
	iAci/cs3/gzLZ8midBBp65CuymPttAlRxX1ccqGylQfJCkiRx8Fgl9Vbrma1gaVMO8U6LyuMMy8oq
	V64RcmIotVjh3JLx4/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seecV-0000000AhBm-0tVu;
	Thu, 15 Aug 2024 17:50:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seecQ-0000000Ah9x-2HJo
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 17:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 136EB61F63;
	Thu, 15 Aug 2024 17:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF50FC4AF13;
	Thu, 15 Aug 2024 17:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723744237;
	bh=yh77SP+oACYrB3sXOB80npZ0M/G33RPegdX00oDB2kc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DJZyXac1dPBN1Z9PStXS0ak451BFCQbSNn7zYomPtk6i5HrTjoANn6Ubpki++v6lp
	 MiSUIUfzc6kbVPsqB8Orp3yYJuQlJmOC4hZTkG3gajzg4mPz7sIqTQyFRSbukaxKp5
	 4/ShCFk1anxwlj2n9nNVJjd0Mz4wXETxlJfukvqbf+q5bC55nMuyOSqCvoGy6IpSYg
	 LZX+L+F89exIIpjKGBEZN6FV5nMgalUZO+SkOc44lXyjg6gVB+DpcXEh4QgS4jCrul
	 vROWLbW8SMm7mcqtSynUwxZ2oFNtvdM6GW2gGNylLaGFaoqOiLPjuGPLyi/lMcrSlT
	 Q3309HuX6MSpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE03382327A;
	Thu, 15 Aug 2024 17:50:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/2] RISC-V: hwprobe: Misaligned scalar perf fix and rename
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172374423644.2967007.14196195556000349824.git-patchwork-notify@kernel.org>
Date: Thu, 15 Aug 2024 17:50:36 +0000
References: <20240809214444.3257596-1-evan@rivosinc.com>
In-Reply-To: <20240809214444.3257596-1-evan@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, cyy@cyyself.name,
 aou@eecs.berkeley.edu, alexghiti@rivosinc.com, ajones@ventanamicro.com,
 andy.chiu@sifive.com, anup@brainfault.org, ben.dooks@codethink.co.uk,
 bjorn@rivosinc.com, charlie@rivosinc.com, cleger@rivosinc.com,
 conor.dooley@microchip.com, costa.shul@redhat.com, erick.archer@gmx.com,
 gustavoars@kernel.org, corbet@lwn.net, paul.walmsley@sifive.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_105038_645397_CB064EA8 
X-CRM114-Status: GOOD (  12.12  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri,  9 Aug 2024 14:44:42 -0700 you wrote:
> The CPUPERF0 hwprobe key was documented and identified in code as
> a bitmask value, but its contents were an enum. This produced
> incorrect behavior in conjunction with the WHICH_CPUS hwprobe flag.
> The first patch in this series fixes the bitmask/enum problem by
> creating a new hwprobe key that returns the same data, but is
> properly described as a value instead of a bitmask. The second patch
> renames the value definitions in preparation for adding vector misaligned
> access info. As of this version, the old defines are kept in place to
> maintain source compatibility with older userspace programs.
> 
> [...]

Here is the summary with links:
  - [v4,1/2] RISC-V: hwprobe: Add MISALIGNED_PERF key
    https://git.kernel.org/riscv/c/c42e2f076769
  - [v4,2/2] RISC-V: hwprobe: Add SCALAR to misaligned perf defines
    https://git.kernel.org/riscv/c/1f5288874de7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
