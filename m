Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9C3C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 23:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGIt1yMcjbdBBv2sG8jNiExEh5NBpcC9ZkV3YBdkXxM=; b=kielaN5ihr4D2e
	4X138Kmj4ZwChkxBkCxI4uQfqYfbGna31gDwrJyeUrSbhAZ+nzPbT28zL6sRC/Iko7uUaJWJqwX1w
	mpsIushjXE6ZREdiYjKuBuJVTbl/hAVcxQGgl+stEcQ9z+b8r8D5uiW3G49bCz87mN4DgN/rx+oFy
	G1ej0iUPnGJ+MXJ9ux2SAkVuTTX4jXhWhs6a6GhEoVrtTstBiQ3lLb+N7uYYs/24I3SOQb11iB3Ws
	7hEbxAsIomF1cKnodiWlOfz2UzX7JmHpUiDaySDwxQbPUALHtdpeFjM4x5k0JWsn+s5k2pRb9MiKL
	R8akIsnGq/yGEtsHhstA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK64o-004aPG-0V;
	Thu, 13 Jul 2023 23:50:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK64k-004aOP-1A
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 23:50:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F80461BA0;
	Thu, 13 Jul 2023 23:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3AF2C433C9;
	Thu, 13 Jul 2023 23:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689292220;
	bh=106eGJVdrylFUJYLLjs32mAengt7pnJ5aTLxjWXCFfo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BWVBEQ35xeyk6eB3oWhRVdqLvkjuqndjV83IwQ8KJNOc/qKAXFlKhaq+sTVa+g64u
	 djzGybh63PLFcxByU/B18AimmiAORR7FGh8C+nyvOjbgzNZ6ofT34vrD/uPrkJZKFA
	 +i+XuIidCjMUd64VsJUHILxpuGB7iooedWZzrH1e7W8bwYGkvXZ6e4xm2EHAZWvOR/
	 j0+rfUc/hW198gqQLTzHbv+iebRDNoR8VKyye2xk2A7E+go+Nc8e/3C9J+33bHtGu0
	 0JYrhq2/MbVCdBFY25SGUfphfKxbEccoQ6wwvGeOAdtaZcPFQhno+Ss/psa/RF4URJ
	 jWsPPCUbBGCmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A726EE29F46;
	Thu, 13 Jul 2023 23:50:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Don't include Zicsr or Zifencei in I from ACPI
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168929222068.13465.18252134214903655361.git-patchwork-notify@kernel.org>
Date: Thu, 13 Jul 2023 23:50:20 +0000
References: <20230711224600.10879-1-palmer@rivosinc.com>
In-Reply-To: <20230711224600.10879-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_165022_463724_91236D32 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 11 Jul 2023 15:46:00 -0700 you wrote:
> ACPI ISA strings are based on a specification after Zicsr and Zifencei
> were split out of I, so we shouldn't be treating them as part of I.  We
> haven't release an ACPI-based kernel yet, so we don't need to worry
> about compatibility with the old ISA strings.
> 
> Fixes: 396c018332a1 ("RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - RISC-V: Don't include Zicsr or Zifencei in I from ACPI
    https://git.kernel.org/riscv/c/ab2dbc7acced

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
