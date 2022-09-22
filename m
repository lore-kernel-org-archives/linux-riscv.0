Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7309C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRQZCzTcNWOwYwe/AMOKVozlobN671Vzq7LVXDEgP/U=; b=STYVqFlVYBw7Vq
	f1m78cW3c5/QGZT+NMfSIgKMiZDzIVFYVYcVSNqcRlC4mzFrLgx48EWT0aE3oz203AhKUUFTkkEGr
	nGsT4nvtcfhpkPb2FfbFoIRyCpnbAXrRR+uFZrsiwtRaU+1P6ZYNHApNVokQRgL3qsczUG+TvkBnh
	2lOhLdTTOMpvlPH8wLo6cZQyVpRv1Fda9aQHRpFfo7hSzb5Lp6mRRsMs1nw3ZkJCeElfdcnTH9fRH
	Y8XvKX2QKPe/Rm5kCeCsGGZYFTgfePPtXMwVlptv6M4Pip9gVsaZtUc5v5t0Kf6mUK0O0htoLUrOi
	4OvfDx3vRQ3HLIFTjI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMQ2-00FiC8-4A; Thu, 22 Sep 2022 13:39:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMPr-00Fi8s-0Y; Thu, 22 Sep 2022 13:39:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C0436149C;
	Thu, 22 Sep 2022 13:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43ECEC433D6;
	Thu, 22 Sep 2022 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663853937;
	bh=WQkxwy9+uM/SRC2FYHzdcCK+w8RTynMDiFOabZD95zU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqamFD9iHOgMkzfGfAVzBv5ruLzL74FJ+zgXEJRtt4fqOC8g4XUhva9pxRb0bxxSz
	 njVb6WM0qIpLWWGhhXYtzCKd/XpNjTrix8qJYMPPZXzpVFi3qwET6MalRnv0RzlWdC
	 oC7q5R1Od2Il90uExl+izBlL3Qz3UtGEt88mlbRjaIl9IjDqQXDpzX5ZuE9dlrJQ+Y
	 16bMnC+3s32qHgraWd1C+zqjBOJKi/7oka3d7KduRNW2VUx9lQphiPfS1ACvTihTE3
	 M8zAG2R76g/2SDU9F033fiU5vLoPmuSEtFvmDwTkfw6RfwO2NCFwXeaaHUKuM28pE/
	 V9Hl/k2hsF7lw==
Date: Thu, 22 Sep 2022 14:38:51 +0100
From: Will Deacon <will@kernel.org>
To: Liao Chang <liaochang1@huawei.com>
Cc: catalin.marinas@arm.com, guoren@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
	mhiramat@kernel.org, maz@kernel.org, alexandru.elisei@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH V2 3/3] arm64/kprobe: Optimize the performance of
 patching single-step slot
Message-ID: <20220922133850.GC12095@willie-the-truck>
References: <20220913033454.104519-1-liaochang1@huawei.com>
 <20220913033454.104519-4-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220913033454.104519-4-liaochang1@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_063859_109852_12BB7524 
X-CRM114-Status: GOOD (  18.86  )
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

On Tue, Sep 13, 2022 at 11:34:54AM +0800, Liao Chang wrote:
> Single-step slot would not be used until kprobe is enabled, that means
> no race condition occurs on it under SMP, hence it is safe to pacth ss
> slot without stopping machine.
> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  arch/arm64/kernel/probes/kprobes.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index d1d182320245..5902e33fd3b6 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -44,11 +44,10 @@ post_kprobe_handler(struct kprobe *, struct kprobe_ctlblk *, struct pt_regs *);
>  static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
>  {
>  	kprobe_opcode_t *addr = p->ainsn.api.insn;
> -	void *addrs[] = {addr, addr + 1};
> -	u32 insns[] = {p->opcode, BRK64_OPCODE_KPROBES_SS};
>  
>  	/* prepare insn slot */
> -	aarch64_insn_patch_text(addrs, insns, 2);
> +	aarch64_insn_write(addr, p->opcode);
> +	aarch64_insn_write(addr + 1, BRK64_OPCODE_KPROBES_SS);
>  
>  	flush_icache_range((uintptr_t)addr, (uintptr_t)(addr + MAX_INSN_SIZE));

Hmm, so it looks like prior to your change we were doing the cache
maintebnance twice: once in aarch64_insn_patch_text() from stop machine
context and then again in the flush_icache_range() call above.

I suppose the cleanest thing would be to drop the flush_icache_range()
call and then use aarch64_insn_patch_text_nosync() instead of
aarch64_insn_write() in your change.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
