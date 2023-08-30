Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C17C83F14
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P2rG6KLeUwsQ+TSWnfmFdO1/d4mZVDvYeWqbSkd8X2c=; b=UeZ9V/l+OMOu7k
	ENoptf13WInNdSWY0cqNaBkVLegyTLBgCjwoZJfrneCnSKKW2jjq2ypc4JpgR/6g52I6zRhYWNl/g
	jaet8u8fEaePMirBjEdUwJ8e4xMoKyac/uSZzevng3tdvean/t2fYfQPjjWD21+0Wrc0Xwz3huun6
	xG9jpSRZ1pieBeROBKqPz3j2OGBDCggIXpqIGvDNug/l1D81aAy1CuSmZdsMIYv4ZZSDOBXMUdKEI
	tabi73JsjpGm5kj3XOOnQ37s750sPEcuxhRsLY08QJIGYzWsBubjeqPVMkkenj4OvUcWX0OMgvGcX
	KSacF46TKwJ7CN/xDeoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL85-00DXrE-34;
	Wed, 30 Aug 2023 13:21:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7g-00DXXt-0A
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:20:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E722622C1;
	Wed, 30 Aug 2023 13:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE567C43215;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401635;
	bh=zW83V15pttqQqoyclpx9Yc+p0D/cxwhn1//298m9yXM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MtprTzxLhEQg6X4K0qLXHGM67s0Zh4eOVAGDnSwhopvup8gGJ8o2c1qi/HMyv1Q2z
	 /C2I2awv8OrFCeVCcrzXPljm1ymynSfwmffoN4SIOkGQijUlnbnPfOWrDGMLmHGLSZ
	 Lm5uINVnRe7zSueEE39AZtGjuA/6Wv+5fdHIbng949u/PsjUurd1LB1ikS61cncyqN
	 iIpm8YGPB0rNsE88cX7MdEb7IYQ8bYHnprmOoR+GMgAokhzovOq3wpWlU0HKcIjue5
	 URAI6kMA+3LgHA+xMBciEvUOvnh3NB33r2eWnxGoUJRY0WEe7BN5T2ZCzyqxntlaM4
	 sp0u5dll8eubQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D9C94E26D49;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] riscv: support ELF format binaries in nommu mode
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163488.19859.4409393808859164434.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230711130754.481209-1-gerg@kernel.org>
In-Reply-To: <20230711130754.481209-1-gerg@kernel.org>
To: Greg Ungerer <gerg@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, viro@zeniv.linux.org.uk,
 ebiederm@xmission.com, keescook@chromium.org, brauner@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062040_150821_3960FE78 
X-CRM114-Status: GOOD (  11.06  )
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

On Tue, 11 Jul 2023 23:07:52 +1000 you wrote:
> The following changes add the ability to run ELF format binaries when
> running RISC-V in nommu mode. That support is actually part of the
> ELF-FDPIC loader, so these changes are all about making that work on
> RISC-V.
> 
> The first issue to deal with is making the ELF-FDPIC loader capable of
> handling 64-bit ELF files. As coded right now it only supports 32-bit
> ELF files.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] binfmt_elf_fdpic: support 64-bit systems
    https://git.kernel.org/riscv/c/b922bf04d2c1
  - [v2,2/2] riscv: support the elf-fdpic binfmt loader
    https://git.kernel.org/riscv/c/9549fb354ef1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
