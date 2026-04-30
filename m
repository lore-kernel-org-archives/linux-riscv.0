Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0199FF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74CqCAzSi+Fz/t4qnCD029Y+eC/mqkmbzrAlgop0UZU=; b=dMzw1KyEnJdZcY
	zmD8+3dY7coynQmLS6Gtg0zSoqg4xd65U38Q6nc+8pka4ZX5qHhEgtrE8xzw1QbDMDVJEbtnKTEK2
	xhvrqb9+zgOU9gZ/TNBrWqcHABP7xnvm6N/jhBEycGOWpERhow0ecLXPjG8buAnCDhw0AvzgbwkB4
	ysW1k2l92s4TJ5KIf7+aQ+JQsruk/AXp3rt7YvYIbMWxrCMgvQhBHhBKzwLWf3YU5qe2fODA3YQ2v
	2qWzfUD2g1W3tOaM4Y1Ubtj7kiG/t6G9M8Vkid1GfMpdyTIrRiV1gkI8UVhQwTfEsfTHxVyt5yJ/C
	Q0xrrV8dZ6838dZRK77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII30-00000004X0Y-01yJ;
	Thu, 30 Apr 2026 03:26:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2Q-00000004WWA-3E6w;
	Thu, 30 Apr 2026 03:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 383FE6133C;
	Thu, 30 Apr 2026 03:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB7EC2BCB9;
	Thu, 30 Apr 2026 03:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519565;
	bh=mg07WEIAKsuSxne/3AsIHVpCoZ2+I3HzqZDVUkFi0EI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dEtKXXx/jMjmFbAtXeqD7/QiR1wdAqG/KtNxyr+sYfrq55w3MraFUzAiv6YRAKSQE
	 8/y04V85AsmlvhfXuuEQOnr8vSHBqrNDGRQzyUZmi6eS6CjFKbZ9zUcIMAa6P02HJv
	 uJmjDRS5vTN4twzXaN2BvwIJUCca0XLP87peLxo78ipSppchY42CBJAjuLYlWYKV3n
	 CxLCnudyNDkMZZGHJB/Dwtx778/YMY3scP8Ycr7QGZKppi365e5pc8UM8cqFmRbbLZ
	 uzS+u19sKjIwjocwLX04nWrWqFtt5aenkYLt/yOL+7UQ4qB+wQPWwa/MxRUs3iiUem
	 e35K0GuOfLXIg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDB53809A07;
	Thu, 30 Apr 2026 03:25:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/8] perf unwind: Refactor get_entries to allow dynamic
 libdw/libunwind selection
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751952104.2274119.14762312333480941665.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:21 +0000
References: <20260413024805.1316480-2-irogers@google.com>
In-Reply-To: <20260413024805.1316480-2-irogers@google.com>
To: Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, acme@kernel.org, 9erthalion6@gmail.com,
 adrian.hunter@intel.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com,
 andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com,
 blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com,
 howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com,
 jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, mingo@redhat.com, namhyung@kernel.org,
 palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org,
 shimin.guo@skydio.com, tglozar@redhat.com, tmricht@linux.ibm.com,
 will@kernel.org, yuzhuo@google.com
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
by Namhyung Kim <namhyung@kernel.org>:

On Sun, 12 Apr 2026 19:47:58 -0700 you wrote:
> Currently, both libdw and libunwind define 'unwind__get_entries'. This
> causes a duplicate symbol build failure when both are compiled into
> perf.
> 
> This commit refactors the DWARF unwind post-processing to be
> configurable at runtime via the .perfconfig file option
> 'unwind.style', or using the argument '--unwind-style' in the commands
> 'perf report', 'perf script' and 'perf inject', in a similar manner to
> the addr2line or the disassembler style.
> 
> [...]

Here is the summary with links:
  - [v4,1/8] perf unwind: Refactor get_entries to allow dynamic libdw/libunwind selection
    (no matching commit)
  - [v4,2/8] perf build loongarch: Remove reference to missing file
    https://git.kernel.org/riscv/c/841dbf4871c5
  - [v4,3/8] tools build: Deduplicate test-libunwind for different architectures
    (no matching commit)
  - [v4,4/8] perf build: Be more programmatic when setting up libunwind variables
    (no matching commit)
  - [v4,5/8] perf unwind-libunwind: Make libunwind register reading cross platform
    (no matching commit)
  - [v4,6/8] perf unwind-libunwind: Move flush/finish access out of local
    (no matching commit)
  - [v4,7/8] perf unwind-libunwind: Remove libunwind-local
    (no matching commit)
  - [v4,8/8] perf unwind-libunwind: Add RISC-V libunwind support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
