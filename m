Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6796C83F14
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzD81Z0hJqghTZP3AwR0GK+sG1aEiit8KDVOJZOjlyE=; b=NDgTWZBszCS7rs
	9GKjrnR0Cm4LrzUUG4NGPr1HYtAwM1Gx3ae/2pJdFhsOuY6kv7DcfEiIbwZVhqGRPZCfmNIBF5MMu
	3skpyKLl1KvJiDsHYqrcDvBW/cMjt6JbTAMyADCT/XiyCJh3jRCGrszSpgjMwtqd9BjJ9593yeBAL
	pSpChbHMLEca6l2q1b5RrwFBc48f6geGGDmTbG8EGh1Jx1Ed2TcGgwrXODz+6YCDOoarLd3hxNnL7
	/so+GX7nlFM9aMrV4h7RtNWHlcyPx2DhCnyGptQ2cfG2wrT6IcKsLMBz2wt4VsONIGRt+R90mzis2
	iTHwiw0OvjLCvZTZoVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7q-00DXeX-1a;
	Wed, 30 Aug 2023 13:20:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7c-00DXUY-1S;
	Wed, 30 Aug 2023 13:20:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E21E60C84;
	Wed, 30 Aug 2023 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80511C433C9;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401634;
	bh=lU/0eFOBFVkuTE1IldAB8o4ifPlzPWcD6cixm0reo2A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bgzOKPRbpUn291lsqU9Z1dLg3L/B12TOne9+koWorFDPSeaeOhmTvGUyhG+gI2BjL
	 xXPEehjiwSkhyeGIYoF9Q1pA4XNU6fSdeogfImQ1EIV9keK0BLa+4TNeCLaYYcbyCO
	 7FnQaKKMDtuJIUdo1NuLBx1O3NjG3fZUffKkTqjJJI0NlZASxhdts9yqpli5nt45La
	 5wIp6B4CWg94mqnotehPPrsl6Z0Xqior9mZDZZ3hCMOrhauaBD2NUk3EzJ2zqDSuqq
	 atVcsLU96cpPto61Ly3S1JiE1NdGpyqSmp6DL+3VlITZL7meH19E5plCwb6Q6LEseh
	 lPU/joGQnSL5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 629B6C64457;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 00/10] riscv: Allow userspace to directly access perf
 counters
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163439.19859.16491167037069434691.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, peterz@infradead.org,
 mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, namhyung@kernel.org,
 irogers@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, atishp@atishpatra.org, anup@brainfault.org,
 will@kernel.org, robh@kernel.org, ajones@ventanamicro.com, remi@remlab.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062036_593724_0E42DE97 
X-CRM114-Status: GOOD (  11.49  )
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

On Wed,  2 Aug 2023 10:03:18 +0200 you wrote:
> riscv used to allow direct access to cycle/time/instret counters,
> bypassing the perf framework, this patchset intends to allow the user to
> mmap any counter when accessed through perf.
> 
> **Important**: The default mode is now user access through perf only, not
> the legacy so some applications will break. However, we introduce a sysctl
> perf_user_access like arm64 does, which will allow to switch to the legacy
> mode described above.
> 
> [...]

Here is the summary with links:
  - [v6,01/10] perf: Fix wrong comment about default event_idx
    https://git.kernel.org/riscv/c/366d259ff597
  - [v6,02/10] include: riscv: Fix wrong include guard in riscv_pmu.h
    https://git.kernel.org/riscv/c/f117ae55b019
  - [v6,03/10] riscv: Make legacy counter enum match the HW numbering
    https://git.kernel.org/riscv/c/e8b785e98abb
  - [v6,04/10] drivers: perf: Rename riscv pmu sbi driver
    https://git.kernel.org/riscv/c/d5ac062d82d8
  - [v6,05/10] riscv: Prepare for user-space perf event mmap support
    https://git.kernel.org/riscv/c/83c5e13b8cbb
  - [v6,06/10] drivers: perf: Implement perf event mmap support in the legacy backend
    https://git.kernel.org/riscv/c/50be34282905
  - [v6,07/10] drivers: perf: Implement perf event mmap support in the SBI backend
    https://git.kernel.org/riscv/c/cc4c07c89aad
  - [v6,08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
    https://git.kernel.org/riscv/c/57972127b20e
  - [v6,09/10] tools: lib: perf: Implement riscv mmap support
    https://git.kernel.org/riscv/c/60bd50116484
  - [v6,10/10] perf: tests: Adapt mmap-basic.c for riscv
    https://git.kernel.org/riscv/c/26ba042414a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
