Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369BBC49EA1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+jfZUNHL6ckQVat8H8ZIi0t3BMOF2GhVoUyZ0nwx/M=; b=2xXSJ/c3vB0xdG
	sgiLTsHRbsLvChren0OQan1qt/BIRISykc/tDMCKaaqnqeKL9aJLYxEYzygNmV/BtmYlF8u489TK6
	+d5BDkzXCAQg2D/KR0TLA9Ru/Oj4JTATfhWSHEYlrxs1D0OkBKOS9cM+CHIG8BKu1/FM3FRzZLGjA
	IeOVZ7+gRcsAYb75RHK7sEkfZDt+Bd4NLkzUTG0Uj+X8hziFq9QxzMVa0hyagntb4Pp/haB91DgfX
	XDV8TYnrqh7kPv3c7Y6PIiVoGL1LF38/ZIKx/m9LKyDqyeaEZz5qE8a2B3B5iQiS2BQUfdXt46z06
	8pNoEVVQoicffJ+CvVLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYs0-000000067W1-2Aoo;
	Thu, 01 Aug 2024 16:41:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYr1-000000067A8-0Xj7
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 16:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E7D8628B2;
	Thu,  1 Aug 2024 16:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3617C4AF0B;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722530437;
	bh=cm88tP/Dp1Y8OMyog3ReSR+5U6PYD1gdvoFDyAqqrGA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NpwKZWD8xlDHvM5Wr5EP1TritZv5c6YBqI41ANcluQfaNqMZgP2bF/3b0soGyJwnf
	 xgXdD4NP07UVbKqvmPeVJkirKzbRHllIyy/EGRUgXvzRAmBLXZppM0uu2OYn4STrhP
	 XhTLNOP/lqNP7ZYXaXvbXzLot9zB0HHTTSb7F19z+VZ1tACt1Hx/mO45hqhOEg9smh
	 MTh3hnls60Spof2JUZVbUeGKy34bgUPhFjNvYetOR7idjb7RgUeuUL6hBUePfyQB2A
	 0iaH/vFKbw8Nd9Ss3OvvkcFB7ckTeN++mKLwwMWmwd/SRi9aJNOJh2Zx0WIBSja5Kg
	 42CLMj3LnEqwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 85C93E8877A;
	Thu,  1 Aug 2024 16:40:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] perf arch events: Fix duplicate RISC-V SBI firmware event
 name
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172253043753.13740.1828763400860823722.git-patchwork-notify@kernel.org>
Date: Thu, 01 Aug 2024 16:40:37 +0000
References: <20240719115018.27356-1-eric.lin@sifive.com>
In-Reply-To: <20240719115018.27356-1-eric.lin@sifive.com>
To: Eric Lin <eric.lin@sifive.com>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, irogers@google.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, peterlin@andestech.com, dminus@andestech.com,
 locus84@andestech.com, jisheng.teoh@starfivetech.com, inochiama@outlook.com,
 n.shubin@yadro.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_094039_345548_D9E79D27 
X-CRM114-Status: UNSURE (   8.45  )
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

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 19 Jul 2024 19:50:18 +0800 you wrote:
> Currently, the RISC-V firmware JSON file has duplicate event name
> "FW_SFENCE_VMA_RECEIVED". According to the RISC-V SBI PMU extension[1],
> the event name should be "FW_SFENCE_VMA_ASID_SENT".
> 
> Before this patch:
> $ perf list
> 
> [...]

Here is the summary with links:
  - [v2] perf arch events: Fix duplicate RISC-V SBI firmware event name
    https://git.kernel.org/riscv/c/63ba5b0fb4f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
