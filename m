Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC95CC5AC67
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 18:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFLPBveS6KsGJYfEbcEKFArG+xepuJr7RFl8UOuN+3I=; b=gOC9JSaw71okPI
	sE8syq3Zd0ksr+/bRF6QHksoy1hoReg3ljBFdCmWrGuCdayBq6ECdUQp+f/NkP0K8dr69WFOlv0LS
	huI79Cd56hHSNe6QLslU3gMZ56w73LVULdGjoyH1xDXdttrr3UUzXAM6LVFHBwwyh4oZjWr9Vw4Hl
	aT1lge7ysYRjaqe8GOtRtKLB6T3/JGAi5TdvfoqV3k/APSq1rxVNJbx11q9suS/GDfzCM0LcNMet4
	RdBPgIUHmfhxdBsb+oqrC+gLcoOHP0DJPsnDuRpN2j0K2w5JyZQvNjd4QSWfdXZ6R2OFh4fgNm2u9
	NiQwroOFTHCMcCA856KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3AU-00000006Wp3-3KDp;
	Thu, 06 Aug 2026 18:50:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws3AT-00000006Wog-20xt
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 18:50:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBBDA41968;
	Thu,  6 Aug 2026 18:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9081F000E9;
	Thu,  6 Aug 2026 18:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786042212;
	bh=RJJW14A/nX6VrjipjthjIHHraIYxFJQivG437GtHCGs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=TrAnScLwiSiregMmTEqnckhD7zWRhYsvskLI1UDtohWU2LlWDN9A2GS7WPXvp3Ea2
	 6HYloAK24/c7IngZoukOfW0xotteDRNh5eVURCLWUiGaH8ro/Ga1OuQhrDLgAcbmmN
	 Y5WrFB54xOr2kqC/f3BvD9P/3WFIazIjsPQuadXGy8NphCqgus6sNCAyZdFWS2DIhZ
	 FSkV4CCYNxBpa/Dyn0LZFgQCW431JG+1UfwcB099P2qPka5KivQAUuzgpapt2uvvQY
	 dGq9xt9bbA9suJ7/dOfZdjceVm11b6KAgd51eeae/fdnzyZHgV4JDT6S7VAv+7ZwQ2
	 R5fbARGkfcE1Q==
Date: Thu, 6 Aug 2026 12:50:11 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Rui Qi <qirui.001@bytedance.com>
cc: linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
    Kees Cook <kees@kernel.org>, Jingwei Wang <wangjingwei@iscas.ac.cn>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: hwprobe: Register unaligned probes before
 usermode
In-Reply-To: <20260721150511.1607105-1-qirui.001@bytedance.com>
Message-ID: <8884ef1b-9fd2-7300-d7f1-38d061cabf0c@kernel.org>
References: <20260721150511.1607105-1-qirui.001@bytedance.com>
MIME-Version: 1.0
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

On Tue, 21 Jul 2026, Rui Qi wrote:

> The hwprobe vDSO data is populated by the first riscv_hwprobe syscall.
> Some values, such as MISALIGNED_VECTOR_PERF, may depend on the async
> vector unaligned access speed probe registered by
> check_unaligned_access_all_cpus().
> 
> That initcall currently runs at late_initcall level. However,
> rootfs_initcall enables usermode helpers before late initcalls run, so an
> early helper can execute userspace and call riscv_hwprobe first.
> 
> In that case complete_hwprobe_vdso_data() consumes the initial
> pending_boot_probes reference, populates the vDSO cache, and marks it
> ready before the later async probe is registered. The eventual probe
> result then cannot update the already-ready cache.
> 
> Move check_unaligned_access_all_cpus() to fs_initcall_sync. This still
> runs after clocksource_done_booting(), so the ktime_get_mono_fast_ns()
> benchmark uses a stable clocksource, but it runs before rootfs_initcall
> enables usermode helpers.
> 
> Any async hwprobe probe is therefore registered before userspace can
> trigger the one-time vDSO cache population.
> 
> Fixes: 6455c6c11827 ("riscv: Clean up & optimize unaligned scalar access probe")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>

Now that we've queued a patch to get rid of the async hwprobe 
infrastructure, is this patch still needed?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
