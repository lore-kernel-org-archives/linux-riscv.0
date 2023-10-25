Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377F4C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 12:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwGA+zOdhbBes2P87nKr0L2grkzXqrsRiHYzFN/JbnM=; b=Lj2Q081Dg2E1Gj
	aC9EG43knokTY0h9jjPoibspBQhfOIyZs2+T79Yk2TD8Q9F3+w6UGzpLULdjMV9tDYptdHqUYsYnM
	eki7DgItSjSfPf4kPvx2f1dMyzWMGdugh8gN1NFjFjnn3mFFJk1jH6eEXaGgjnpRne1UehzgYDo/Y
	UU2LIWK++y/5qLye5WpdQDbIlL/9oMLjUDs0aBQp+GZbWGBOQP2z3CuNd5MbgfuwH8KZpKgEbvuOp
	rqzxI5vVQsFlkwyR9qFTZrZb+9tpz0rFuZc1bac6uqg/Djj2cUp/b+0WVZdAsx8cRI3+DaBRqlBJf
	r922vNSO6lgBFT7Z36WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdMm-00CL3d-1M;
	Wed, 25 Oct 2023 12:52:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdMj-00CL2P-1j;
	Wed, 25 Oct 2023 12:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3F/VPYVxQQPlC4GYJcoGjOrbvtpKw8aYmzGOYzcFJ6I=; b=Z+9W82UB7PDtFMMIASUBUdniRI
	zeJjphb3sY9S6RUftogueBqGQfkT4HJG6YiO1PJGBcmwx6UF4INYZnXlgeC3RP6q9MW8+UiTlLTr7
	oODKzTBxeA9W4BirqqZ511zD4K8ZM7U0A3MmvUVroCoZlA3hTOshf+bvov12MiyfuJbhHFiRCFCPt
	PJo9orqWMBTUZaiJV1cKUUNJXTFDp2Jx8JTb74wHVVkdkWvD1l5l9v0rNJUkrrLmPSOa9mKMXphxz
	VcsV6mQwMyoeD485EilrTCuYebFzPrsagcBMHpTNmgSGl6utFNUc3DXlJIzzyF3YdpqYg+3EUE9bG
	n7MAtCgw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdMW-00GLXG-09;
	Wed, 25 Oct 2023 12:51:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 77DD130047C; Wed, 25 Oct 2023 14:51:51 +0200 (CEST)
Date: Wed, 25 Oct 2023 14:51:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, viresh.kumar@linaro.org,
	lenb@kernel.org, robert.moore@intel.com, lukasz.luba@arm.com,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v3 5/6] cpufreq/cppc: set the frequency used for
 computing the capacity
Message-ID: <20231025125151.GF31201@noisy.programming.kicks-ass.net>
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-6-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231018162540.667646-6-vincent.guittot@linaro.org>
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

On Wed, Oct 18, 2023 at 06:25:39PM +0200, Vincent Guittot wrote:
> Save the frequency associated to the performance that has been used when
> initializing the capacity of CPUs.
> Also, cppc cpufreq driver can register an artificial energy model. In such
> case, it needs the frequency for this compute capacity.
> We moved and renamed cppc_perf_to_khz and cppc_perf_to_khz to use them
> outside cppc_cpufreq in topology_init_cpu_capacity_cppc().
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  drivers/acpi/cppc_acpi.c       |  93 ++++++++++++++++++++++
>  drivers/base/arch_topology.c   |  15 +++-
>  drivers/cpufreq/cppc_cpufreq.c | 141 ++++++---------------------------
>  include/acpi/cppc_acpi.h       |   2 +
>  4 files changed, 133 insertions(+), 118 deletions(-)

Perhaps split this patch into code movement and actual change for ease
of review? As in, I'm having trouble finding the actual changes ;-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
