Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA54CCCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 02:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhFAMUKkDU1l10+Imqv3aWTVmb+Zdj+Vq/3pByCRBPU=; b=OPadhESurncM2k
	h11NOTrsQbGU0Y/9+sJ7NjZJda/qTPT4xXqXesn/emQBwxtI5/5QTUqE7045g/DgNfVBrMQocwuUg
	f2OwwLT9N4GanqcBVtIzKK8c8WRfN8MEJGYIjqYL+M1jkhDfsqs9a4Ar+Yxe1O49j4uCdRq6pTsMJ
	bC3/wAr0dwmMnqzF6K/gGeDX1mU96Q9g4obCZANxS2n3V2+1mqBc74tqtgNDhQ/E7cP8gG+ykO4tX
	XouWU2yM5Q7eXDFhdFBWGxI00mI5ohrAJuR/TJdKLgFa/OIw/QEZ8zkgQckfV6pzhalh6KvCdoi8P
	4mGUcZwpOaR47/2037tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72qz-00000007UyX-2Aja;
	Fri, 10 Oct 2025 02:27:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72qy-00000007UyA-17qi
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 02:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8633860274;
	Fri, 10 Oct 2025 02:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF31C4CEE7;
	Fri, 10 Oct 2025 02:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760063250;
	bh=ac4VtTda8SJRSe7ya6qERv9chI6J5rNgon5I14QHQy0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WNX0xmHvBiFXxv4mqNdaXwfKcAosh5PPPpszwfbWljExYKQ7ylm65jrdqKFPAfARV
	 WM9X/9nWqGrxDcDCPKBpkE3xWWjPAezq18hjJOOKfimQ8ePlsdOO/FKTz6Ye9EaiLn
	 uw+mnHVAnUogKtYbbi/WGlWSKdLR/MQD7JN/rzXsccDpd0w3U3gqwKLRvHr9+9Tv9j
	 rOJ6wTM6G9FYWM0+ZYTA8O7xWieWYWSr694a9UYw9MQ2Cj9qPUw9K544EZkaKfD8tW
	 RG3PiLSsUteZ/HPfrn0wkKake8vRSb6bMLAbdIfY9IH4923Lc2riE3YTEBUoNXNe3V
	 i/hRDi5gBaU9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E633A55FB5;
	Fri, 10 Oct 2025 02:27:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/9] perf build: Support building with Clang
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176006323800.354358.6110592426551858799.git-patchwork-notify@kernel.org>
Date: Fri, 10 Oct 2025 02:27:18 +0000
References: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
In-Reply-To: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org,
 jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
 justinstitt@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, james.clark@linaro.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 llvm@lists.linux.dev
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
by Arnaldo Carvalho de Melo <acme@redhat.com>:

On Mon, 06 Oct 2025 17:21:22 +0100 you wrote:
> This series adds support for building perf with Clang, following the
> discussion in [1]. Because the Android NDK uses Clang by default,
> enabling Clang builds naturally covers Android as well.
> 
> The series is organized as follows:
> 
>   - Patches 1~2: Fix two bugs found with Clang.
>   - Patches 3~7: Correct CROSS_ARCH, Disable thread safety analysis for
>                  perl header, and dismiss Clang build warnings.
>   - Patches 8~9: Enable Clang in the Makefile and update the
>                  documentation.
> 
> [...]

Here is the summary with links:
  - [v3,1/9] tools build: Align warning options with perf
    https://git.kernel.org/riscv/c/53d067feb8c4
  - [v3,2/9] perf python: split Clang options when invoking Popen
    https://git.kernel.org/riscv/c/c6a43bc3e8f6
  - [v3,3/9] perf build: Correct CROSS_ARCH for clang
    https://git.kernel.org/riscv/c/ed33e5e43c1e
  - [v3,4/9] perf build: Disable thread safety analysis for perl header
    https://git.kernel.org/riscv/c/e7e86d7697c6
  - [v3,5/9] perf test coresight: Dismiss clang warning for memcpy thread
    https://git.kernel.org/riscv/c/50b7e7082a3d
  - [v3,6/9] perf test coresight: Dismiss clang warning for thread loop
    https://git.kernel.org/riscv/c/244a1ac76a67
  - [v3,7/9] perf test coresight: Dismiss clang warning for unroll loop thread
    https://git.kernel.org/riscv/c/9ec46fc93803
  - [v3,8/9] perf build: Support build with clang
    https://git.kernel.org/riscv/c/4772e66cb45e
  - [v3,9/9] perf docs: Document building with Clang
    https://git.kernel.org/riscv/c/0a75ba3e842c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
