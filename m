Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665E2CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 09:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7lEbupBloXaBR9KcywliGlIAS6LeXmxw66evHsbrcw=; b=EfXaEiRyRBYFek
	Vn+rIM4JBltDNDKQfi63wFmBgB40wQgc/ue2SWQn+GOmZphjeO9chDqNTe20RGll/Y1KNd+TmEHjy
	a91SjgMIzZHvdgmeGyeKCzH7vefmFoFAZfVP/i44+Kjx3l3c284cdqLf4XApzJnlK9uX0QWS7sakO
	za8rUAH8aKER3QIJaV/jlN64W6YVVsKL0KOs9XSpmjJ1L3j1FEMOrFMnHAk8dW4K1IGFVZm5kqUxQ
	yo0sDR65phV7R8IwssA3cqxVV73JYfxGN0upsFcz6DVe6j30sRMQa14jngvuBCBRIPjAAYddd1Q60
	OtsYiI1wWNXzMVFWaAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqWz-000000021RP-068j;
	Fri, 15 Aug 2025 09:15:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umq8X-00000001uZu-1vRA
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 08:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7361611BD;
	Fri, 15 Aug 2025 08:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CA6C4CEEB;
	Fri, 15 Aug 2025 08:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755247808;
	bh=kfPlf93Sj5KMZI/komEcYnnrbjVcN1G2q4OnGPbOjX0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YILBKYwOYHCHwdGFkJgc3s56PIA4f6nPB58Z/ahVuQrqRyYP0pi1fTQyxkbfBHFTX
	 TMn33JPiKuQ1orAunZC07h5+WzZqNR/Qpn5S2pu0gjBW+nQCn9aRn7YAaxeNcgOcnV
	 4x6jngqwkkAns6R3SehdAmcQmqo+9Y2vUEgbZPllpiVmIYTQaMozPZTkzmstXpWu7n
	 DSm6cTZez2SfGGjaHsiGaWIlwlVO2e1qw3TN1GJ6yhlQASoYd51sBwMPrGnLE1fwCB
	 XWJMjq19FCgFHcznppIbVl0MgEyDxSKyqKIOqzmm9e4dhNbddUB1cYFrHZ2LdPAJGp
	 yvvHjV/C2be9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE2139D0C3B;
	Fri, 15 Aug 2025 08:50:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 00/10] Add support arena atomics for RV64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175524781950.988422.3130461067803981757.git-patchwork-notify@kernel.org>
Date: Fri, 15 Aug 2025 08:50:19 +0000
References: <20250719091730.2660197-1-pulehui@huaweicloud.com>
In-Reply-To: <20250719091730.2660197-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bjorn@kernel.org, puranjay@kernel.org,
 palmer@dabbelt.com, alex@ghiti.fr, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, pulehui@huawei.com
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

This series was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Sat, 19 Jul 2025 09:17:20 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> patch 1-3 refactor redundant load and store operations.
> patch 4-7 add Zacas instructions for cmpxchg.
> patch 8 optimizes exception table handling.
> patch 9-10 add support arena atomics for RV64.
> 
> [...]

Here is the summary with links:
  - [bpf-next,01/10] riscv, bpf: Extract emit_stx() helper
    https://git.kernel.org/bpf/bpf-next/c/02fc01adec1c
  - [bpf-next,02/10] riscv, bpf: Extract emit_st() helper
    https://git.kernel.org/bpf/bpf-next/c/d92c11a6b55b
  - [bpf-next,03/10] riscv, bpf: Extract emit_ldx() helper
    https://git.kernel.org/bpf/bpf-next/c/01422a4f2c78
  - [bpf-next,04/10] riscv: Separate toolchain support dependency from RISCV_ISA_ZACAS
    https://git.kernel.org/bpf/bpf-next/c/ec74ae56626b
  - [bpf-next,05/10] riscv, bpf: Add rv_ext_enabled macro for runtime detection extentsion
    https://git.kernel.org/bpf/bpf-next/c/5090b339eeb3
  - [bpf-next,06/10] riscv, bpf: Add Zacas instructions
    https://git.kernel.org/bpf/bpf-next/c/de39d2c4cdb6
  - [bpf-next,07/10] riscv, bpf: Optimize cmpxchg insn with Zacas support
    https://git.kernel.org/bpf/bpf-next/c/1c0196b878a6
  - [bpf-next,08/10] riscv, bpf: Add ex_insn_off and ex_jmp_off for exception table handling
    https://git.kernel.org/bpf/bpf-next/c/b18f4aae6a5d
  - [bpf-next,09/10] riscv, bpf: Add support arena atomics for RV64
    https://git.kernel.org/bpf/bpf-next/c/fb7cefabae81
  - [bpf-next,10/10] selftests/bpf: Enable arena atomics tests for RV64
    https://git.kernel.org/bpf/bpf-next/c/dc0fe956144d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
