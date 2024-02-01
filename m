Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD338C47DDB
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 10:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HaexapclvbHqteQS2QIaapc6fXpBpgQhRMZD61V2GV4=; b=eIEXpXjatU+BDT
	C23is3DqMNzq9IpeotJVI3J3IKziOLzPaSh2pyyi8Kl9b6MMDYw0pxIYdflNL5pm/+9mHptw+1/G0
	WMnWCH+MixjTeNsT3R6h9Uvepe+rauoEYvlW2R0n42MZeNTkxHJvw3rQldXFWrrXeY5P8hxIqugpZ
	hEEyslXUmA9a0PFN1RsrXAhYQDwEledouvBW9SIvr6s1Fc0e9OLaCrs+jxxNwWXK9AgRmxwXm9LSA
	cl0HZ2iwQt7dWZuDNkwe3E8JreYldfY+AZ8c8c9yDdVgoTzgOfOhZTlp0wljdMO2oHqyJKAbTNZuv
	+OFqLW/LTpgcuAEVbfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVUUg-00000007UbK-322f;
	Thu, 01 Feb 2024 10:40:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVUUe-00000007Uaz-0eNM
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 10:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EF6961DF6;
	Thu,  1 Feb 2024 10:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42FCBC43399;
	Thu,  1 Feb 2024 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706784027;
	bh=XaG0HTa5bdiZUGiMcDQ0KA5J9y1Mt48AeFOL+u1Drd0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ue+SoNsPgTZAimqUVy5rIYex/14lNlZMmPq+EV8Qua2OfHWthNQ2wQQjer3Jo/mK7
	 RKdKkIUaar3lHB45M9WYYfITZwnwBGU3NSWzvVz3PBWSP8yOUBh9oTL1MneiMvtgVq
	 kK5LbaGZ86DA6xBNYxuhUoNrgp4r7kNE6/9oCdV3E7fX3hRuNzHBX5YHTNq8BOqjhW
	 6NhU9iIyUttXlY4zOLuhcQ9RNghUwttSFTYqG1kyJvwAd7hBlBwmnsjc89SJGoizWH
	 JAQUHqZwMS1JOCYQt0yO3pLmwheTsqU592r9bE/bc+nK8OT+y74P7/tzrS5XYaN0SZ
	 AuEyFhr2P/FFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2E98DC1614E;
	Thu,  1 Feb 2024 10:40:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next 0/2] Enable inline bpf_kptr_xchg() for RV64
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170678402718.13930.11085578984728371793.git-patchwork-notify@kernel.org>
Date: Thu, 01 Feb 2024 10:40:27 +0000
References: <20240130124659.670321-1-pulehui@huaweicloud.com>
In-Reply-To: <20240130124659.670321-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, bjorn@kernel.org, houtao1@huawei.com, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org,
 palmer@dabbelt.com, luke.r.nels@gmail.com, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_024028_261099_1B2AEDC8 
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

This series was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Tue, 30 Jan 2024 12:46:57 +0000 you wrote:
> This patch is the RV64 implementation of inline bpf_kptr_xchg()[0]. RV64
> JIT supports 64-bit BPF_XCHG atomic instructions. At the same time, the
> underlying implementation of xchg() and atomic64_xchg() in RV64 both are
> raw_xchg() that supported 64-bit. Therefore inline bpf_kptr_xchg() will
> have equivalent semantics. Let's inline it for better performance.
> 
> link: https://lore.kernel.org/bpf/20240105104819.3916743-1-houtao@huaweicloud.com [0]
> 
> [...]

Here is the summary with links:
  - [bpf-next,1/2] riscv, bpf: Enable inline bpf_kptr_xchg() for RV64
    https://git.kernel.org/bpf/bpf-next/c/69065aa11ca6
  - [bpf-next,2/2] selftests/bpf: Enable inline bpf_kptr_xchg() test for RV64
    https://git.kernel.org/bpf/bpf-next/c/994ff2f79739

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
