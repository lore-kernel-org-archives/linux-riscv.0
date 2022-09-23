Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DE5ECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 12:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZioOrmqNvY0VK9MzLpw8S1h9iENjRTN1gZdjMPuQi4A=; b=lN7748FdOxc2Jl
	oujQZxGXPd+OZI+lAJHJgO8qEuxZBHVmk9DZunW5Fv757AxIvS+/q20EcIcwSdwpXiSF3Chum3zLj
	wjyaWBjPSAioNTdun0UsqS6u+AnG8v31AKAtkbtkqaOcrlnl6zQVol+S7J+jgP9HkSqtu4tUfvknY
	MG6xn7caxGhLASI6KLaDPpZw5x3uTuFxBq0FmSRZ6MeRqTzTXlj1VXh1r/HL1RLyHgaxkPE+rZfNl
	sdQfWB+2/ul0rRsoNR9JSGBJ9lXIP/c9iaQCvhUwIuALqgzcFAemOEcJ4FVuZgvqq1E1QdKbiPayV
	z9zSaahHrKFi4rIuXGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obhuH-004CgP-DP; Fri, 23 Sep 2022 12:35:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obhu6-004CcT-1W; Fri, 23 Sep 2022 12:35:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F4E96240F;
	Fri, 23 Sep 2022 12:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37D0C433D6;
	Fri, 23 Sep 2022 12:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663936536;
	bh=09mRcGKCdicT2EiSwx9poKFuF1lbe1qx/utrbBqmAEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVhposLZ4eSYsfYBEGn0xEJoN1w20CmjPf17c4nlgftI1AGQLkbJMleVNE0YE2rfr
	 9ACGFcEs49/PgEJ67PD9YOyp6YCXelJnMunqwTQRxYpCFlWBIapw0aw+713MakhE/t
	 9H1ntgFvNuISQ5xFGfyTSaBcPNs6Ds6reFX5I3pmnbKVw+O6LAuwjzp0Q+B0zBFqaA
	 06Pqm4RHTZK79wEWD+44sGRzjUQzV4B2dMUX6qXVspnMnbOqMdnBCL9Sl/GAkHszUA
	 vKkvYR9frDDEYZdj09VN6EcQi3Tq2874ShSnnHk3Kt0DbQJYGS21j3rifPvFPK23ZS
	 DJHljxTFkkDuQ==
Date: Fri, 23 Sep 2022 13:35:30 +0100
From: Will Deacon <will@kernel.org>
To: Liao Chang <liaochang1@huawei.com>
Cc: catalin.marinas@arm.com, guoren@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, mhiramat@kernel.org,
	rostedt@goodmis.org, mark.rutland@arm.com, maz@kernel.org,
	alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64/kprobe: Optimize the performance of patching
 single-step slot
Message-ID: <20220923123529.GB13942@willie-the-truck>
References: <20220923084658.99304-1-liaochang1@huawei.com>
 <20220923084658.99304-4-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220923084658.99304-4-liaochang1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_053538_149335_460DD946 
X-CRM114-Status: GOOD (  18.53  )
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
> 
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

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
