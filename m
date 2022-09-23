Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7245ECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXhflmtVVpFPVXEiX0rLAIDfJdDo1sksFh//4mltEAo=; b=ze7N64S+qEFLuZ
	uKl3xqOUXazaI4+ByzIvc3M58bbOvTVKerygBMfq4eF13vkgRG6ZEJev25tCqkO7ZUlWlP6GMZdvA
	tsDLZm4T6rZnJyx9UH0KsYjEOyDUUZKbmI3UOWXsQkpHKAtmPJrEHyLaOg8TGQLioLJoMXYxVkvcd
	Ox5n1ExF3lFb2yLm540My+fICR6dBg8Yw6MwG7BSL78N20D7KszyyRuQKptkssB9cXZB3/uNAWtOF
	Cn2e3HtE75ca86GrQUuUAU4jg/42M3+QYeUjiL50802aAu0DoqgtGJAnaUVSqjwmPVqFtjTjpfOaP
	TbPafB9dFnmo/ySsOZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obhy6-004EUV-RR; Fri, 23 Sep 2022 12:39:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obhxv-004EP0-8r; Fri, 23 Sep 2022 12:39:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA1D3139F;
	Fri, 23 Sep 2022 05:39:39 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.80.223])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2B323F73B;
	Fri, 23 Sep 2022 05:39:30 -0700 (PDT)
Date: Fri, 23 Sep 2022 13:39:28 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Liao Chang <liaochang1@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	mhiramat@kernel.org, rostedt@goodmis.org, maz@kernel.org,
	alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64/kprobe: Optimize the performance of patching
 single-step slot
Message-ID: <Yy2pAEvWKVloVr3U@FVFF77S0Q05N>
References: <20220923084658.99304-1-liaochang1@huawei.com>
 <20220923084658.99304-4-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220923084658.99304-4-liaochang1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_053935_381096_FFA01F1E 
X-CRM114-Status: GOOD (  20.24  )
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

On Fri, Sep 23, 2022 at 04:46:58PM +0800, Liao Chang wrote:
> Single-step slot would not be used until kprobe is enabled, that means
> no race condition occurs on it under SMP, hence it is safe to pacth ss
> slot without stopping machine.

I think this is correct, but this depends on a couple of subtleties,
importantly:

* That the I-cache maintenance for these instructions is complete *before* the
  kprobe BRK is written (and aarch64_insn_patch_text_nosync() ensures this, but
  just omits causing a Context-Synchronization-Event on all CPUS).

* That the kprobe BRK results in an exception (and consequently a
  Context-Synchronoization-Event), which ensures that the CPU will fetch the
  single-step slot instructions *after* this, ensuring that the new
  instructions are used.

It would be good if we could call that out explicitly.

Thanks,
Mark.

> Since I and D caches are coherent within single-step slot from
> aarch64_insn_patch_text_nosync(), hence no need to do it again via
> flush_icache_range().
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  arch/arm64/kernel/probes/kprobes.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index d1d182320245..29b98bc12833 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -44,13 +44,10 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
>  static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
>  {
>  	kprobe_opcode_t *addr = p->ainsn.api.insn;
> -	void *addrs[] = {addr, addr + 1};
> -	u32 insns[] = {p->opcode, BRK64_OPCODE_KPROBES_SS};
>  
>  	/* prepare insn slot */
> -	aarch64_insn_patch_text(addrs, insns, 2);
> -
> -	flush_icache_range((uintptr_t)addr, (uintptr_t)(addr + MAX_INSN_SIZE));
> +	aarch64_insn_patch_text_nosync(addr, p->opcode);
> +	aarch64_insn_patch_text_nosync(addr + 1, BRK64_OPCODE_KPROBES_SS);
>  
>  	/*
>  	 * Needs restoring of return address after stepping xol.
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
