Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5621BC5478A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 19:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlP+OJBHJUvNlC7jG2ksp6q1MMAXQXHiZw6MDH029fY=; b=osFaOm9jmuDo1V
	f0/gP0lgdvn6kQJ8ooQwaviFVy79W6DmmygRmIfDBTsemIOKSIVeFkhkXaH9P8wBs8ypHmUfzI1V2
	gRKfIb95Hhc0SKmDQdLKb3yfo7an6c2cj6/wxIqd3KW/1ngCxfBvSWofDMztNs3g+f3Sg/l4jPvYZ
	m8PfJPbXCeQxhGrrgGcdZP+ZvhfCROZAKjCX9yFBWt1QGsxJXpYeTV4CHUn6rvmQOqNbLQZCF+jJU
	vtlVY1oOjEcV6rdJpx4SDFs2oZG+97U6RRmrP/DkzMXV2qEV3tUm1X9MvRKW4Nwm4agMw9qDPSLMA
	9eU2SLI8lYWoF8hWDlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcsbz-00000002N18-24Ni;
	Wed, 21 Feb 2024 19:50:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcsbv-00000002MzS-3pWv
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 19:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B58ECE1D69;
	Wed, 21 Feb 2024 19:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70ECCC433F1;
	Wed, 21 Feb 2024 19:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708545029;
	bh=P9XNMzb7yrJkUl8ylgZe9V6S39LQZndDJiB/yDEpT/k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OW+iTfZ2iL7h+tXJGNvJqPAfGvzAojx6Z/PSpeXYsAyurVOl8s+3iLeyb8SId2m22
	 IkMRoLD7pypQ8zmtBKx2zeh5H/3haEAMLidw9UmC9U4K2dKljBA0/k1++W43o+S0Ks
	 /fVDE5C+fidCZkXVM0exKbCcL3S2IEzx1e/omHSdGBsYPclAoXFh2TeCNU7JEE1Lhz
	 HoMWUjyPLmLL8VwoNoAJZ5CgjhMpcsys6DbOXUUD9dRFESO6R+/GUwWVgy4mWE5xxH
	 N0beU/EdiatulBzs0sxFFeD+BITTRP9WedtdcrQY2ORn04pHqjslD1NZypKazqYjvg
	 5zBhXiHk6UXkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54346C00446;
	Wed, 21 Feb 2024 19:50:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of tree
 LLVM
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170854502934.2044.9675160060874211968.git-patchwork-notify@kernel.org>
Date: Wed, 21 Feb 2024 19:50:29 +0000
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
In-Reply-To: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, masahiroy@kernel.org,
 nicolas@fjasle.eu, andy.chiu@sifive.com, conor.dooley@microchip.com,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev,
 stable@vger.kernel.org, ebiggers@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_115032_183601_3B3BD98F 
X-CRM114-Status: GOOD (  10.27  )
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

On Thu, 25 Jan 2024 10:32:10 -0700 you wrote:
> Hi all,
> 
> Eric reported that builds of LLVM with [1] (close to tip of tree) have
> CONFIG_AS_HAS_OPTION_ARCH=n because the test for expected failure on
> invalid input has started succeeding.
> 
> This Kconfig test was added because '.option arch' only causes an
> assembler warning when it is unsupported, rather than a hard error,
> which is what users of as-instr expect when something is unsupported.
> 
> [...]

Here is the summary with links:
  - [1/2] kbuild: Add -Wa,--fatal-warnings to as-instr invocation
    https://git.kernel.org/riscv/c/0ee695a471a7
  - [2/2] RISC-V: Drop invalid test from CONFIG_AS_HAS_OPTION_ARCH
    https://git.kernel.org/riscv/c/3aff0c459e77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
