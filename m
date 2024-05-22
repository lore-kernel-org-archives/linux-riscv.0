Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E99C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPCM7yBYcqHeaHefJ7RM5df13f1ctd6O0hnPIpYJDxE=; b=BpFuY3ezcvpr8f
	tnEJkvDxYxjkJ4BbxnSpfOQa3YteoF4DJ50ic/jFET4C1t4qIyXXdpc7rZ4hN+oYzHtwczbM6c+xP
	t1dXQzuVwsHh8vg8fAblRr7Z89gSxRCpbLbZwtHnMyxmqHJ+AQxK//KFwbGKdYonc4ECbBe7PQItU
	Hcau3uTVh/5BXJSs01fHTc0+e7xYFwH+s8rktHATpVDPJZyqnTb738ImbSEPVsk1iAlUp7AL+mJtW
	YvYg5SRZWhgeEYUvoKsVZtXGyyznPl9l2G8WCQTN4hV5fi1ur7BPne8rvLfo83z+rClCnKHkAskaP
	iEjP/1HozxRV1OIZNtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vS2-00000004RhC-2zCZ;
	Wed, 22 May 2024 23:32:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vRa-00000004RRm-0UCI
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:32:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38F72CE1377;
	Wed, 22 May 2024 23:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C3BFC3277B;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716420743;
	bh=ITZrsOmg5tle9AF+jDyC89IYV8YjFwFBD6zQa+9C89g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FsLdjpD+a1E5SGHUUoJ3FG16lJCbNEx2RuOCnWcK4L9Q/H7AaJppG+Qd/mphGNtmw
	 hTaTJdxb/YFJqHhH9ZcTdhuPtWfL0R207u1qOznWG6vcBAK9PkSZ/b8O26aUAXMPNa
	 o4SbXJ3VLEjS56eYPyII4KWmkpW0Scb5Zq06AnpT0qsKzLydzYs6rQLGhCx1ra2dAb
	 95qqo8g4evTfpMbboGjSh7O070UFXYAJbie5jlS16rm2e9eG4kXYmLQeujRfGKd56p
	 uWLpezr/89iiQQYbfkWP1wa/lICMqoLCNb59bAbmIeVbGD1RhLIpqyYdL29nKrHohq
	 M7ssv8wkgfrVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 663CAC43619;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/68] Define _GNU_SOURCE for sources using
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642074340.9409.18366005588959820799.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:32:23 +0000
References: <20240522005913.3540131-1-edliaw@google.com>
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
To: Edward Liaw <edliaw@google.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org, mic@digikod.net,
 gnoack@google.com, brauner@kernel.org, richardcochran@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 ast@kernel.org, daniel@iogearbox.net, davem@davemloft.net, kuba@kernel.org,
 hawk@kernel.org, john.fastabend@gmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@android.com,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_163226_748606_D88238E4 
X-CRM114-Status: UNSURE (   8.68  )
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

This series was applied to riscv/linux.git (fixes)
by Tejun Heo <tj@kernel.org>:

On Wed, 22 May 2024 00:56:46 +0000 you wrote:
> Centralizes the definition of _GNU_SOURCE into KHDR_INCLUDES and removes
> redefinitions of _GNU_SOURCE from source code.
> 
> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> asprintf into kselftest_harness.h, which is a GNU extension and needs
> _GNU_SOURCE to either be defined prior to including headers or with the
> -D_GNU_SOURCE flag passed to the compiler.
> 
> [...]

Here is the summary with links:
  - [v5,01/68] selftests: Compile with -D_GNU_SOURCE when including lib.mk
    (no matching commit)
  - [v5,02/68] kselftest: Desecalate reporting of missing _GNU_SOURCE
    (no matching commit)
  - [v5,03/68] selftests/arm64: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,04/68] selftests/arm64: Drop duplicate -D_GNU_SOURCE
    (no matching commit)
  - [v5,05/68] selftests/bpf: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,06/68] selftests/breakpoints: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,07/68] selftests/cachestat: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,08/68] selftests/capabilities: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,09/68] selftests/cgroup: Drop define _GNU_SOURCE
    https://git.kernel.org/riscv/c/c1457d9aad5e
  - [v5,10/68] selftests/clone3: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,11/68] selftests/core: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,12/68] selftests/damon: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,13/68] selftests/drivers: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,14/68] selftests/exec: Drop duplicate -D_GNU_SOURCE
    (no matching commit)
  - [v5,15/68] selftests/fchmodat2: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,16/68] selftests/filelock: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,17/68] selftests/filesystems: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,18/68] selftests/firmware: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,19/68] selftests/fpu: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,20/68] selftests/futex: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,21/68] selftests/futex: Drop duplicate -D_GNU_SOURCE
    (no matching commit)
  - [v5,22/68] selftests/intel_pstate: Drop duplicate -D_GNU_SOURCE
    (no matching commit)
  - [v5,23/68] selftests/iommu: Drop duplicate -D_GNU_SOURCE
    (no matching commit)
  - [v5,24/68] selftests/ipc: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,25/68] selftests/kcmp: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,26/68] selftests/landlock: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,27/68] selftests/lsm: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,28/68] selftests/membarrier: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,29/68] selftests/memfd: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,30/68] selftests/mincore: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,31/68] selftests/mm: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,32/68] selftests/mount: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,33/68] selftests/mount_setattr: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,34/68] selftests/move_mount_set_group: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,35/68] selftests/mqueue: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,36/68] selftests/net: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,37/68] selftests/net: Drop duplicate -D_GNU_SOURCE
    (no matching commit)
  - [v5,38/68] selftests/nsfs: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,39/68] selftests/openat2: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,40/68] selftests/perf_events: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,41/68] selftests/pid_namespace: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,42/68] selftests/pidfd: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,43/68] selftests/ptrace: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,44/68] selftests/powerpc: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,45/68] selftests/proc: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,46/68] selftests/proc: Drop duplicate -D_GNU_SOURCE
    (no matching commit)
  - [v5,47/68] selftests/ptp: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,48/68] selftests/resctrl: Drop duplicate -D_GNU_SOURCE
    (no matching commit)
  - [v5,49/68] selftests/riscv: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,50/68] selftests/riscv: Drop duplicate -D_GNU_SOURCE
    (no matching commit)
  - [v5,51/68] selftests/rlimits: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,52/68] selftests/rseq: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,53/68] selftests/safesetid: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,54/68] selftests/sched: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,55/68] selftests/seccomp: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,56/68] selftests/sigaltstack: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,57/68] selftests/sgx: Compile with -D_GNU_SOURCE
    (no matching commit)
  - [v5,58/68] selftests/splice: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,59/68] selftests/syscall_user_dispatch: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,60/68] selftests/thermal: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,61/68] selftests/timens: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,62/68] selftests/tmpfs: Drop duplicate -D_GNU_SOURCE
    (no matching commit)
  - [v5,63/68] selftests/uevent: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,64/68] selftests/user_events: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,65/68] selftests/vDSO: Append to CFLAGS in Makefile
    (no matching commit)
  - [v5,66/68] selftests/vDSO: Drop define _GNU_SOURCE
    (no matching commit)
  - [v5,67/68] selftests/x86: Append to CFLAGS in Makefile
    (no matching commit)
  - [v5,68/68] selftests/x86: Drop define _GNU_SOURCE
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
