Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92400C4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sdxa5yLxzo/QiCWRCOpaqZjlcLlOOkdxktW0I2KOmQg=; b=AsJV6cUHW7cgeZ
	EBfrBNaKjCh22ZYEPGAcwycj4GFUow/qM9azQcxODaZVbnZFsKCdIU3jrrH7uy6a9TlJv7zpxV+Kg
	zSA0/K5gp086vtdtGbfVvxmuD2RzLNiUByXziHyA17E3uJVeS6J74vx96hWa4alMcD7mkUtWfK8Oq
	K41xm+fRplrXhhz8+jdi+HcrWsBwOAghHA/dCxbZshE0cRRSQjqCXf58Z6n5vtW3r983MrLmdXtnh
	bYpSRGSIMVXzepLgDp1vqiUuFOH2J9suqZ+tyt5XYoy2KjaN7V4XLbrYc75tOiU+8zOxMrygfbAGV
	5I32Tcc3Ylh03frl/ouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNd7K-00DOou-0S;
	Wed, 10 Jan 2024 18:15:54 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rNd7H-00DOoO-0n;
	Wed, 10 Jan 2024 18:15:51 +0000
Message-ID: <63046420-264a-4e7c-b45c-17f0486ba4d9@infradead.org>
Date: Wed, 10 Jan 2024 10:15:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] membarrier: Create
 Documentation/scheduler/membarrier.rst
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, mathieu.desnoyers@efficios.com,
 paulmck@kernel.org, corbet@lwn.net
Cc: mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
 charlie@rivosinc.com, rehn@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240110145533.60234-1-parri.andrea@gmail.com>
 <20240110145533.60234-3-parri.andrea@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240110145533.60234-3-parri.andrea@gmail.com>
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

Hi,

On 1/10/24 06:55, Andrea Parri wrote:
> To gather the architecture requirements of the "private/global
> expedited" membarrier commands.  The file will be expanded to
> integrate further information about the membarrier syscall (as
> needed/desired in the future).  While at it, amend some related
> inline comments in the membarrier codebase.
> 
> Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> ---
>  Documentation/scheduler/index.rst      |  1 +
>  Documentation/scheduler/membarrier.rst | 37 ++++++++++++++++++++++++++
>  MAINTAINERS                            |  1 +
>  kernel/sched/core.c                    |  7 ++++-
>  kernel/sched/membarrier.c              |  8 +++---
>  5 files changed, 49 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/scheduler/membarrier.rst
> 
> diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
> index 3170747226f6d..43bd8a145b7a9 100644
> --- a/Documentation/scheduler/index.rst
> +++ b/Documentation/scheduler/index.rst
> @@ -7,6 +7,7 @@ Scheduler
>  
>  
>      completion
> +    membarrier
>      sched-arch
>      sched-bwc
>      sched-deadline
> diff --git a/Documentation/scheduler/membarrier.rst b/Documentation/scheduler/membarrier.rst
> new file mode 100644
> index 0000000000000..ab7ee3824b407
> --- /dev/null
> +++ b/Documentation/scheduler/membarrier.rst
> @@ -0,0 +1,37 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +========================
> +membarrier() System Call
> +========================
> +
> +MEMBARRIER_CMD_{PRIVATE,GLOBAL}_EXPEDITED - Architecture requirements
> +=====================================================================
> +
> +Memory barriers before updating rq->curr
> +----------------------------------------
> +
> +The command requires each architecture to have a full memory barrier after
> +coming from user-space, before updating rq->curr.  This barrier is implied
> +by the sequence rq_lock(); smp_mb__after_spinlock() in __schedule().  The
> +barrier matches a full barrier in the proximity of the membarrier system
> +call exit, cf. membarrier_{private,global}_expedited().
> +

What does "The command" refer to above and below, please?

Thanks.

> +Memory barriers after updating rq->curr
> +---------------------------------------
> +
> +The command requires each architecture to have a full memory barrier after
> +updating rq->curr, before returning to user-space.  The schemes providing
> +this barrier on the various architectures are as follows.
> +
> + - alpha, arc, arm, hexagon, mips rely on the full barrier implied by
> +   spin_unlock() in finish_lock_switch().
> +
> + - arm64 relies on the full barrier implied by switch_to().
> +
> + - powerpc, riscv, s390, sparc, x86 rely on the full barrier implied by
> +   switch_mm(), if mm is not NULL; they rely on the full barrier implied
> +   by mmdrop(), otherwise.  On powerpc and riscv, switch_mm() relies on
> +   membarrier_arch_switch_mm().
> +
> +The barrier matches a full barrier in the proximity of the membarrier system
> +call entry, cf. membarrier_{private,global}_expedited().


-- 
#Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
