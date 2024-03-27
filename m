Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D284C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1clmue3OyW9oAgdSczapCToITuhR82iwXxOj7Y9SlQ=; b=b5pw/No/ajaCUc
	evOTlo8eShkqe+0wZyGF+uboKcoBL95UVzmIGRNBqSkC05W9TXzjSnnyz0GCHUmXUTyoYs9vhHOt2
	Zq0/Mkd5wzkBjR3HRXNK/UqSukw+3GDTtRfmUDBsAb54hfCq4zQ8yRD3HA9EB1uE/cEzInbMoV5w1
	OKgusMnFKezCPBUb+b4xv0Rkjpnu7/2NipUlVcvnIYKiKuVDGU6CH7owkyZY9/OyKYMBI2vOBjPId
	DwNWytMUW6ZXc0jq5H4nQ5BRX+ynbchNDshp2mHgI8A7lBrkrElqOdL4Y/FM/xlhnsy8ve2etgwPp
	H3qi62lpmGuYDMPr/4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXqO-0000000AXqd-3G2e;
	Wed, 27 Mar 2024 18:17:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpXqJ-0000000AXoF-2bvl;
	Wed, 27 Mar 2024 18:17:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C461D61446;
	Wed, 27 Mar 2024 18:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680A4C43390;
	Wed, 27 Mar 2024 18:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1711563462;
	bh=cuOPfgYarGsg6xpTgF2yo+uJ/Cd9/PbvYrZtfzWIAWA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RkxWd7fxszjbkBAhnxMMmGIe1h9FKHAVl8O+/y4E+OyVKiv7IRTOoVWnBexJe9Qi9
	 +TAsEnYgru/VQSeepmbuUfEprBv2RQg5xWifJm48Tf7YU36SeMA36iZubYcx/pS1In
	 9D8kpe1b6ypL+O0tgl7HcF34HzDsZeDajYeDtxlE=
Date: Wed, 27 Mar 2024 11:17:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Huang Shijie <shijie@os.amperecomputing.com>
Cc: gregkh@linuxfoundation.org, patches@amperecomputing.com,
 rafael@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, yury.norov@gmail.com, kuba@kernel.org,
 vschneid@redhat.com, mingo@kernel.org, vbabka@suse.cz, rppt@kernel.org,
 tglx@linutronix.de, jpoimboe@kernel.org, ndesaulniers@google.com,
 mikelley@microsoft.com, mhiramat@kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
 cl@os.amperecomputing.com
Subject: Re: [PATCH v3] NUMA: Early use of cpu_to_node() returns 0 instead
 of the correct node id
Message-Id: <20240327111740.f8d3802b0eae15bcb8727e04@linux-foundation.org>
In-Reply-To: <20240126064451.5465-1-shijie@os.amperecomputing.com>
References: <20240126064451.5465-1-shijie@os.amperecomputing.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_111743_814328_5E647FA4 
X-CRM114-Status: GOOD (  12.80  )
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

On Fri, 26 Jan 2024 14:44:51 +0800 Huang Shijie <shijie@os.amperecomputing.com> wrote:

> During the kernel booting, the generic cpu_to_node() is called too early in
> arm64, powerpc and riscv when CONFIG_NUMA is enabled.
> 
> There are at least four places in the common code where
> the generic cpu_to_node() is called before it is initialized:
> 	   1.) early_trace_init()         in kernel/trace/trace.c
> 	   2.) sched_init()               in kernel/sched/core.c
> 	   3.) init_sched_fair_class()    in kernel/sched/fair.c
> 	   4.) workqueue_init_early()     in kernel/workqueue.c
> 
> In order to fix the bug, the patch introduces early_numa_node_init()
> which is called after smp_prepare_boot_cpu() in start_kernel.
> early_numa_node_init will initialize the "numa_node" as soon as
> the early_cpu_to_node() is ready, before the cpu_to_node() is called
> at the first time.

What are the userspace-visible runtime effects of this bug?



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
