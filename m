Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68BEC44507
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 01:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2rdpDDsb9K4vRAT1LN9Kv9TMIXT8xGL30chH1S22xw=; b=0HMC4+TLyQvFd8
	RglD8iz0uIdc2SYlOnkSPGHz+k82vFHnqDnU7LocfJvXJCk3Y2ZARVxV99AEhtukHDdn0llDccJ6j
	x0BFv+v5a4776FBMScxfIHJ+9WRlJzCkS7yGnhHKblo9RGQ2Rq+3P8DbuU02FAattsD8IEqolDyGZ
	HJhQ6KGNpTBEuEb9Zm6tI8MsU5Tt0qx7tVbttYOnGXap8/UDGb41XOxB6AZfnUPKG1nuIIozIXK8r
	Hbn7ZNYaoDSmC5vqp8TNBYdn5K6JHwOt2AwZaMuRO5zh+wOC7TLrDJDOBwVRq/yop0nzt8zw7u/Gl
	p5fm6fv/9MrZqZMxdQ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoca-0000000Da7r-3Bsl;
	Wed, 15 Jul 2026 01:41:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjocZ-0000000Da7i-1VZ6
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 01:41:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C0EDE4386F;
	Wed, 15 Jul 2026 01:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552791F000E9;
	Wed, 15 Jul 2026 01:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784079670;
	bh=c2yD+a6SRC6DPgaNSBntZqirVxqqAFQ+OowsdXoQtSQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=GQsS7p/4MNsG2Bh6lSkaDurZkB6L+AOzAA5JltpVhzOfHYetwXyLzw2L+ANR0/4NH
	 l0r0QA5HxLOvbt7GaxVH2H5h23EvZhPD3u0AaXUPnhik5uGPI2wD2xC2QSX5WuAiVB
	 mxoZFQvqB3nrPVzHFnY5fD36t/jpSg7unDlu/lIbhRJVNdAJJd9nBwuGe/rRpkYBQt
	 s3dh609pqakvvr8xfdMGoBIXMvGVwfDoxVWvfFkQrJ09Ruhn+1nyXyfYuSikuHJrnf
	 HNVyoJaodvJuoHuaQQJ7mBMCFmBivmX1nxiwng93hj+I3MzjSsB5aiz9/bOOLHyN7P
	 Y5onR4hTUdN+g==
Date: Tue, 14 Jul 2026 19:41:09 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Paul Sherman <shermanpauldylan@gmail.com>
cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
    paul.walmsley@sifive.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH v2] riscv: smp: set CPU 0 possible in setup_smp()
In-Reply-To: <20260714223301.5265-1-shermanpauldylan@gmail.com>
Message-ID: <0fcf59d9-fbf5-3f1c-910d-3e269fdadf75@kernel.org>
References: <20260714223301.5265-1-shermanpauldylan@gmail.com>
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

On Tue, 14 Jul 2026, Paul Sherman wrote:

> setup_smp() calls set_cpu_possible() for CPUs 1..nr_cpu_ids-1 but
> never for CPU 0 (the boot CPU). x86 handles this via
> init_cpu_possible(cpumask_of(0)); RISC-V has no equivalent.
> 
> Without CPU 0 in cpu_possible_mask, rcu_init_one()'s
> for_each_possible_cpu() loop skips it, leaving rdp->mynode=NULL.
> rcutree_prepare_cpu() then dereferences NULL and hangs.
> 
> Exposed on Sophgo SG2042 (64-hart, 4-NUMA) with Linux 7.2-rc3.
> 
> Fixes: a4166aec1130 ("riscv: Deduplicate code in setup_smp()")
> Signed-off-by: Paul Sherman <shermanpauldylan@gmail.com>

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
