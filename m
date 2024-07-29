Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1799EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0fbgX7ZSKASs7QEd3crBABz42hjTAn1Gcaq1fVl7Ih8=; b=L5Tr9KDqfWmLde
	y9DVRSYZmanlbcAdW+ejDM6HctxZYoEaKT8F4NpaJcXaSrV/WT7kHA/lKm/QrYE08u6YJpZsYaHhm
	sh4MiFfYei46IYr5EuH15npQWx/IPLjmgfF5gqLda0zsdqlc8flwFXyFyoAGMt3Aw60hRuNYK5IZU
	TlmHEfdXeRKVHno4F6qf7LxcgbJ41uCpLT33E2Wp1Z0b5ipL4CbeNGTXvdqwAHeB6nyyr9TKp8zn/
	lHYmYR2OAxs3jzuN/jfhFady04ht0XcQj+hSB+iy7SfdgAPP76wscFkHW0UZMKDhpH6LoS/zfE6y4
	ZvCQ/09FURevS8CNdpvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTSL-0000000C60t-0zFL;
	Mon, 29 Jul 2024 16:42:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTSI-0000000C5zT-0Ceg
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 16:42:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6063A61B30;
	Mon, 29 Jul 2024 16:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 147D5C4AF0A;
	Mon, 29 Jul 2024 16:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722271357;
	bh=nCnPffQC0wgQl4iUSLFuXT0GVZKZigWkCmO8K+HKrV0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=J8O0SRMqSIldPgMelk9OHwXBycOQ4m+0kniUpxjRCPApfQlOmb/fQXwgyGTP+jEnx
	 oCnb7I2czDYO5X8g6yRNj17vWWgg2HTfpmsWlANAWF1amgJsNc1i189PwwnoyXgq9z
	 vfaE5e/SZ0b7i9bKXHmQ94bF4RulgtIO/G/8ErZr1Oh9g/vVZsBYnr2AUpEUnAlMuh
	 bZcpLTeuKFPSo0x0zbTaagjkmK0hiwnKHDqfAv8oIRXI75YRa26gqC6zGhU1DxJV1K
	 MGaTsQJDvWJKt2Tr53LdtC0Gzx3+08E1UTDzBlqNVsP1JNwFMlqEeafb0ELYqw07Bd
	 E4iAx6hEGQW7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F3C34C43338;
	Mon, 29 Jul 2024 16:42:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Patches for the 6.11 Merge Window, Part 2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172227135699.3603.496634508586968231.git-patchwork-notify@kernel.org>
Date: Mon, 29 Jul 2024 16:42:36 +0000
References: <mhng-d1533559-79a3-401a-8eee-a743b80b3bb2@palmer-ri-x1c9>
In-Reply-To: <mhng-d1533559-79a3-401a-8eee-a743b80b3bb2@palmer-ri-x1c9>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_094238_172237_C5A3CF93 
X-CRM114-Status: UNSURE (   6.67  )
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

This pull request was applied to riscv/linux.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Sat, 27 Jul 2024 06:29:14 -0700 (PDT) you wrote:
> merged tag 'riscv-for-linus-6.11-mw1'
> The following changes since commit f557af081de6b45a25e27d633b4d8d2dbc2f428e:
> 
>   Merge tag 'riscv-for-linus-6.11-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2024-07-20 09:11:27 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Patches for the 6.11 Merge Window, Part 2
    https://git.kernel.org/riscv/c/c9f33436d85b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
