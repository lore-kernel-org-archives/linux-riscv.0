Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA16CA9EC7
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9CXLRtpSmUCUUabciUQ/3iOsjdT+hMWiQv896Y7jig=; b=FTy1k/jD7zyXN6
	c5T37BXJgUkCMZdbFyFuR44eIxNxVOceXqIAK9UfawYD07ZNtmzyrBcLU3iK6PMHcOZOdyf2SUXq1
	j9UC1eao0nN6aJVtqu5cSPNzZ/TfKfmhl8ZBlUgvonAyHiCKDPxAg1yKAuP/v2E2iPMh8v1xa6EWz
	wODaV6Rtl+bOKGHk6rCtfXzUC5nn+VAauZP/9h7fmsTeDRiUmMjcmGO7gXlmwoif7zNHXWKCa6lRv
	GdmP+bBxkzX7LVFFKDt3VyeIHoADmdYl04S4k7hRO56sqVSYXyIAFb9VsW7CGfqBWV1LyBcg+WdBu
	0n4hhIBlQl8aaWeDTWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtmg-000000094Z0-18Pu;
	Sun, 11 Oct 2026 13:40:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtme-000000094Y8-0bQw
	for linux-riscv@lists.infradead.org;
	Sun, 11 Oct 2026 13:40:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A429343B15;
	Sun, 11 Oct 2026 13:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820601F0089C;
	Sun, 11 Oct 2026 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791726011;
	bh=dC6sK2uDDpjnsPQCMiprzwDVtvUZBRCHhZuHjbIbSXE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=X+ANgdx53YnCadU42EK77uENt55rFmD+tnaErltmgodFMXfj/9s8+y37LtsWrukny
	 Cx7wceCEjR8NtudAX/WUs7ygCz3c248LJH361ZGThkbSx4KXZUsXAcqcgYQET7o0+X
	 S7ld54U/nytHVp1pqAOi0KSfOKNsmYupdLKQ5iKPyablex3aWkPBBzfZOpealDCw8W
	 EWramJXdKjm3lsdmV3fhfk4GcPhizKvbHCShgacOMFjOMVWVzjeYpd/J1LN1kI/Dbs
	 2YtRPFYnKXmRwuJQFoy4eiwcjvEe/52b8Zuvsp4gjJsytxd6s+PJCpsfuMnYMcVj2t
	 LT0VQchO+BD6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773AA3811966;
	Sun, 11 Oct 2026 13:40:11 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 0/4] riscv, bpf: Prepare for upcoming daily CI
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179172601001.2055679.10398551714592277673.git-patchwork-notify@kernel.org>
Date: Sun, 11 Oct 2026 13:40:10 +0000
References: <20260930083522.1914145-1-pulehui@huaweicloud.com>
In-Reply-To: <20260930083522.1914145-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bjorn@kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 emil@etsalapatis.com, ihor.solodrai@linux.dev, puranjay@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com
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
by Alexei Starovoitov <ast@kernel.org>:

On Wed, 30 Sep 2026 08:35:18 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> For some time, bpf selftests on riscv64 have suffered from several
> silent breakages and test failures. These mainly stemmed from changes
> such as riscv ftrace atomic patching [0], qemu pmu behavior changes, and
> environment mismatches. While some issues have already been addressed in
> previous patches [1-3] and some are in progress [4], the remaining ones
> are handled in this series.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v3,1/4] bpf, riscv: Fix stack-passed arguments for indirect trampolines
    https://git.kernel.org/bpf/bpf-next/c/b4a1ecae94ae
  - [bpf-next,v3,2/4] selftests/bpf: Avoid jiffies quantization error in setget_sockopt
    https://git.kernel.org/bpf/bpf-next/c/153a855d0b3d
  - [bpf-next,v3,3/4] selftests/bpf: Update qemu config for riscv64 in vmtest.sh
    https://git.kernel.org/bpf/bpf-next/c/78142aa07ef6
  - [bpf-next,v3,4/4] selftests/bpf: Update DENYLIST.riscv64
    https://git.kernel.org/bpf/bpf-next/c/52e98bc77f32

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
