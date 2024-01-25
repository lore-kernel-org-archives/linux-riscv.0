Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53E8C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 07:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xf6tYm3kV7zvNMneWlvTmaqIVIEIx/ZI/wZ0xNrL6iw=; b=T9rPwIz5FKHS93
	hjLO5e6ZsY/hVoDC5irXiqkbfrRJJGZ38aZ01rlFF3B893Z+Png86u7VRH30baGH9lCTqDamYL6kl
	XAuOEtitjhIqXt99rHVxuwUNjzP0F2bh/AKjFWEnA+SN0JlJNMkLclI2vT/IAVbcLXNPM0MC5+I08
	F3WHkzuOdzZueO4QUgbIujZXDwpaNoNA1aWfnXwlt0fymaYgvQTgUR6QvmCqd9fSVodcg3slD/af0
	SbZBsa1EnQjtBeF7foG8ijpKignVaa+rXtXkqOdl10gfOLflQgPjUW2yKr9zlzixjcCQN+XoOF/v9
	1Bk5l/bhsJZfMnlcw3IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSuE5-0073gM-2s;
	Thu, 25 Jan 2024 07:32:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSuDy-0073c0-21;
	Thu, 25 Jan 2024 07:32:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF3176211E;
	Thu, 25 Jan 2024 07:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9E8C433C7;
	Thu, 25 Jan 2024 07:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706167949;
	bh=4YJZl/HB/FeUJBFx4g+Hq4GWbhTEDrW8F8ywC05k2CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/qlP90bWA8vs1DoAh96IyHbdPjr4YyuZvDq0onY5ZuuTV08XQml8GYs0ScKoZDdk
	 kRNaiyxLgYIpzg1fYukUi9EtRFIRc727kYqe3wtWXR5gtzs35c/p1Y0J1fwyQZK1Ap
	 6AYBkhNKcCN91vd4Pq89IdOJXzTo/DfX9ptcP+9MEhnDjZshaFfmldWDYiRB/53swx
	 +1IA6GzmPSyirfoR+LyXczKV2zT5RxfrhLZ1jFEvHaBZKOwVLKW3QWPCviK1bmr2b8
	 GoXu6/VAAQ3DwKjghCy5ELrIOAk+v3Yh5RTjDRV/vZkGVh46K5kitkUo/oNKs++SiR
	 aXnmU6ZKh3AJg==
Date: Thu, 25 Jan 2024 09:31:57 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Lameter, Christopher" <cl@os.amperecomputing.com>
Cc: Huang Shijie <shijie@os.amperecomputing.com>,
	gregkh@linuxfoundation.org, patches@amperecomputing.com,
	rafael@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, yury.norov@gmail.com, kuba@kernel.org,
	vschneid@redhat.com, mingo@kernel.org, akpm@linux-foundation.org,
	vbabka@suse.cz, tglx@linutronix.de, jpoimboe@kernel.org,
	ndesaulniers@google.com, mikelley@microsoft.com,
	mhiramat@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <ZbIObaA6t9WbRw9y@kernel.org>
References: <20240123045843.75969-1-shijie@os.amperecomputing.com>
 <4a13353c-cf4b-a388-5776-389c61c63ec0@os.amperecomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a13353c-cf4b-a388-5776-389c61c63ec0@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_233234_723141_8B779803 
X-CRM114-Status: GOOD (  21.19  )
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

On Wed, Jan 24, 2024 at 09:19:00AM -0800, Lameter, Christopher wrote:
> On Tue, 23 Jan 2024, Huang Shijie wrote:
> 
> > During the kernel booting, the generic cpu_to_node() is called too early in
> > arm64, powerpc and riscv when CONFIG_NUMA is enabled.
> > 
> > For arm64/powerpc/riscv, there are at least four places in the common code
> > where the generic cpu_to_node() is called before it is initialized:
> > 	   1.) early_trace_init()         in kernel/trace/trace.c
> > 	   2.) sched_init()               in kernel/sched/core.c
> > 	   3.) init_sched_fair_class()    in kernel/sched/fair.c
> > 	   4.) workqueue_init_early()     in kernel/workqueue.c
> > 
> > In order to fix the bug, the patch changes generic cpu_to_node to
> > function pointer, and export it for kernel modules.
> > Introduce smp_prepare_boot_cpu_start() to wrap the original
> > smp_prepare_boot_cpu(), and set cpu_to_node with early_cpu_to_node.
> > Introduce smp_prepare_cpus_done() to wrap the original smp_prepare_cpus(),
> > and set the cpu_to_node to formal _cpu_to_node().
> 
> Would  you please fix this cleanly without a function pointer?
> 
> What I think needs to be done is a patch series.
> 
> 1. Instrument cpu_to_node so that some warning is issued if it is used too
> early. Preloading the array with NUMA_NO_NODE would allow us to do that.
> 
> 2. Implement early_cpu_to_node on platforms that currently do not have it.
> 
> 3. A series of patches that fix each place where cpu_to_node is used too
> early.

I think step 3 can be simplified with a generic function that sets
per_cpu(numa_node) using early_cpu_to_node(). It can be called right after
setup_per_cpu_areas().

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
