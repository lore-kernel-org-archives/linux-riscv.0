Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18B0C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 23:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkGHmbh5W8IRPEMz9J1UnNcwKYgXxjBLqTp1GapXEi8=; b=dQnPZFVmG+h2Rp
	uisLzwYyPm7Dp0rI1dgJpZ0u5jrnfpxyvNeXAHt7sfEo6/Npk58iBGMzXO3GkzDxRSLAoihfsu/J/
	8tKBFVmstEWMIcKUQnVldaiV8DURj5zWDKwu7QKkcdWZuXZ2JB67G3gYme7LseJGz/2i5nWDLlm6v
	SF6WqyZ22C0/c3xdvPYl7yRAbNP3QJ2Sr3d4U5qy532DX9C72jMH4eNWfIn16EWkit3xkYP5nPPsJ
	bVNR7WRT9Halmoc6GZ+ielkrn8/CXf5Cvg54EzS8mNcbxS6XGSjnosQldVU32IyxdAYeg9uXrvKA0
	eK9OiSWGGUdP1cgSRqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPn7-0059tv-1H;
	Wed, 16 Aug 2023 23:19:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWPn4-0059tX-2Z
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 23:19:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D0C9640E9;
	Wed, 16 Aug 2023 23:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE7DC433C7;
	Wed, 16 Aug 2023 23:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692227941;
	bh=H/XS22Tf9sINJzysUCyiMHOKnBn7BLtWKuHebYdTUUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7OREH2mS5x8+0IGnoyO6tSTVjOD0KuZDB+yS9EB5Bo235f13Ku9eaQIoYvDFX1U2
	 jnwGko3ypaAs/TzFYyNzbbvnwbrBWCwsoccZS0QHZKc3Dfhu/+PWkWSa0bVMzNzMz7
	 iBvjIBCveCxhH0VhbuiE95HWWXJpQQ8K94GTG0xy7G1aveKjigRNZxYo02mZEZHbuF
	 yvJpCV3k80PL3Fy7rof7xnUEbbcwNk4xXtWHFW7nWOV/PvIAAoKUOR/eK+KwYJXwEi
	 s5mqWf0Eu6ao/gQIU5TaqfVp11fpnDLcT2DJu1tMUR9Mm9sOt608TY9BFvgCwNEUYB
	 O1/fMcRkXh4Ew==
Date: Wed, 16 Aug 2023 19:18:53 -0400
From: Guo Ren <guoren@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	vineetg@rivosinc.com, bjorn@kernel.org, greentime.hu@sifive.com,
	paul.walmsley@sifive.com, guoren@linux.alibaba.com,
	anup@brainfault.org, atishp@atishpatra.org, heiko.stuebner@vrull.eu,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [v2, 0/5] riscv: support kernel-mode Vector
Message-ID: <ZN1ZXcwYZtABNdUy@gmail.com>
References: <20230721112855.1006-1-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721112855.1006-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_161902_922587_51D97A44 
X-CRM114-Status: GOOD (  30.31  )
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

On Fri, Jul 21, 2023 at 11:28:50AM +0000, Andy Chiu wrote:
> This series provides support for running Vector code in kernel mode. The
> implementation is based on the v12 series of the Vector series, but with
> some additions. First, we introduce a mechanism to defer restoring
> Vector context for userspace programs (patch 1). This is similar to
> arm64 and x86's approaches when dealing with extra userspace register
> context. And it is benefitial to both Vector in user and kernel-mode.
> Then, patch 2, 3 add the kernel-mode Vector patch from v12 with minor
> modifications. At the end of the series, patch 4, 5 add supports for
> making kernel-mode Vector code preemptible. We do this by adding
> kernel-mode Vector context, and keeping track of the frame where V
> context is last valid. We believe that enabling preemption of running V
> is a critical path for getting V more generally available in the
> kernel-mode. Besides, with status.VS, we can easily tell if
> saving/restoring V is required. This reduce the level of cost when
> running SIMD in kernel mode as compared to other arches. Other arches
> usually do not have a way to tell if extra context is dirty. Thus, if
> they also want to support running preemptible code with extra registers,
> then they must save/restore extra context at each context switch even if
> registers are not dirty.
> 
> The series is tested by loading a kernel module on a preemptive kernel.
> The module launches multiple kworkers which run Vector operations and
> verifies with scalar code. Also, the module provides userspace intefaces
> via fops to verify if we can run Vector code on syscall path.
Would it be contributed to kernel tools/testing/selftests/riscv/?

> 
> Updated patches: 1, 2, 3, 4, 5
> New patches: -
> Unchanged patches: -
> Deleted patches: 6 (moved to 5)
> 
> Changelog v2:
>  - fix build issues
>  - Follow arm's way of starting kernel-mode simd code:
>    - add include/asm/simd.h and rename may_use_vector() ->
>      may_use_simd()
>    - return void in kernel_vector_begin(), and BUG_ON if may_use_simd()
>      fails
>  - Change naming scheme for functions/macros (Conor):
>    - remove KMV
>    - 's/rvv/vector/'
>    - 's/RISCV_ISA_V_PREEMPTIVE_KMV/RISCV_ISA_V_PREEMPTIVE/'
>    - 's/TIF_RISCV_V_KMV/TIF_RISCV_V_KERNEL_MODE/'
> 
> Changes from the vector v12 series (for patch 2, 3):
>  - return a failure code when kernel_vector_begin() fails.
>  - Do not immediately restore user's V context.
> 
> Andy Chiu (3):
>   riscv: sched: defer restoring Vector context for user
>   riscv: vector: do not pass task_struct into
>     riscv_v_vstate_{save,restore}()
>   riscv: vector: allow kernel-mode Vector with preemption
> 
> Greentime Hu (2):
>   riscv: Add support for kernel mode vector
>   riscv: Add vector extension XOR implementation
> 
>  arch/riscv/Kconfig                     |  10 ++
>  arch/riscv/include/asm/entry-common.h  |  13 +++
>  arch/riscv/include/asm/processor.h     |   2 +
>  arch/riscv/include/asm/simd.h          |  52 +++++++++
>  arch/riscv/include/asm/thread_info.h   |   6 +
>  arch/riscv/include/asm/vector.h        |  50 +++++++--
>  arch/riscv/include/asm/xor.h           |  82 ++++++++++++++
>  arch/riscv/kernel/Makefile             |   1 +
>  arch/riscv/kernel/asm-offsets.c        |   2 +
>  arch/riscv/kernel/entry.S              |  45 ++++++++
>  arch/riscv/kernel/kernel_mode_vector.c | 146 +++++++++++++++++++++++++
>  arch/riscv/kernel/process.c            |  10 +-
>  arch/riscv/kernel/ptrace.c             |   2 +-
>  arch/riscv/kernel/signal.c             |   4 +-
>  arch/riscv/kernel/vector.c             |   5 +-
>  arch/riscv/lib/Makefile                |   1 +
>  arch/riscv/lib/xor.S                   |  81 ++++++++++++++
>  17 files changed, 495 insertions(+), 17 deletions(-)
>  create mode 100644 arch/riscv/include/asm/simd.h
>  create mode 100644 arch/riscv/include/asm/xor.h
>  create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
>  create mode 100644 arch/riscv/lib/xor.S
> 
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
