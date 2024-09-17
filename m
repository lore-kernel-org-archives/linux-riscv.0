Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E75CAC587
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 16:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dc4R21+WG5K6zyKVQYtZ85qRkhZuYsw0xue87Wra5Jo=; b=1l6gvHTZawg2LJ
	LmEwmYY27XfQ1AjbBjqTnN+MdkwZuz1tmOrorB233aqv9CivZodY2UfvBgMaVH6p5fIL/bOMqdT7t
	cAfy6+NsHxPM9pHrVojOcdw/hYinXtC8wadznPrGpisgSktYK+eVo3WjveXmHnltCiBoaHZCZVkPb
	5OqtQuFqeIyfhkIDeGJFWZpQv00uFP+6T+v6PSuMoVKW/MCAztVbJdfcCTbl8OCkAeY980iU1RsW6
	YbkI8nhpMcoRfFtKyWiNHPVhZhYn04o6UlLqepe6Go+yS/NNlB+Dy8RGRs/6RQ1fEq26AK96/1h2r
	azGgZw0ysSLdNyFnAgjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqb69-00000006VZN-2hc1;
	Tue, 17 Sep 2024 16:30:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqb63-00000006VWk-1VMq
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 16:30:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7BE58A41E54;
	Tue, 17 Sep 2024 16:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C6CC4CEC7;
	Tue, 17 Sep 2024 16:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726590634;
	bh=n8dn2bjcElj/LDkfC5Nleu23VSK9RpWWAwKQKheaEcQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tNU0I6nM0REJ/0pj8JLbG9OcfLFwoHAAeqcqpqEqhnMO0LDaxpPuN8Slpx7+YNCqd
	 38wCkkkkxwiwxVyOS/jkCXz4BzdRWdKWZiEqfT9eFcypQOC4gtoKQT0SLgSZ6LiUIC
	 iztcbochOTtG+2qd2tuKzRZWVMJLJbT0BNC8PvIICtzksjWmsO+gjmoB465gmajX+5
	 mLR2Z5buTGx6TPPxKPnAIT4pFXX5CjRu096WiYTEHIFpSXNWpIZXoej/N2OhNhZgw6
	 aanhNIZnWRDz3NZ23ZJi4DQIbvKTXjRuDEaKLXUlg0BzN2LfV600cTZGQ15KEDsLFK
	 Oeccd4OVCNhxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE373809A80;
	Tue, 17 Sep 2024 16:30:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Randomize lower bits of stack address
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172659063576.214459.13320691016694584543.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 16:30:35 +0000
References: <20240625030502.68988-1-cuiyunhui@bytedance.com>
In-Reply-To: <20240625030502.68988-1-cuiyunhui@bytedance.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
 alexghiti@rivosinc.com, conor.dooley@microchip.com, bjorn@rivosinc.com,
 sorear@fastmail.com, cleger@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_093036_133117_E3D5F4E6 
X-CRM114-Status: UNSURE (   9.01  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 25 Jun 2024 11:05:02 +0800 you wrote:
> Implement arch_align_stack() to randomize the lower bits
> of the stack address.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/include/asm/exec.h | 8 ++++++++
>  arch/riscv/kernel/process.c   | 9 +++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 arch/riscv/include/asm/exec.h

Here is the summary with links:
  - riscv: Randomize lower bits of stack address
    https://git.kernel.org/riscv/c/048e2906d4ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
