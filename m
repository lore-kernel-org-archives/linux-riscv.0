Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4B6CCD184
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhUhZlwJEHfjY48I/Uc8fu+9HIu+dJoLRBsZos1Aeds=; b=yWyMgRDodxnk0T
	iRsQPPmKgSy8Co+u4WNByJaORGoJt2bb2zewF4lkxG5j6IkuulcChOknJYFZ2kJlIKxF/pRzjq3dT
	AyY+3pkl3pGpN43/r8S/oe9GFD4bOSEst1I4zfaNdEurlzjEfzbyQByCwmTNHLpFzEzyeefcsSwJm
	K+LPze1iXqTEtj8MASrKOr+UCnNbVaZFr3tAiJKJI2RMFRbI7PDeZ2RqFX4b9p+d5GR5rB203AGa4
	KPljLvHbHkaQkBhNie8nVOCTa1g5OYX5g2Vn1ks+tWiKfK+buGVCBIA2LbsHgDhB5X2hJ05lXFwdu
	o8j1jVPnW34fojR0Vawg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6tm9-00000006igl-3NBY;
	Thu, 09 Oct 2025 16:45:57 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6tm6-00000006ifW-2XPA
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 16:45:56 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3FED9261CB;
	Thu,  9 Oct 2025 18:45:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egymjzkv544U; Thu,  9 Oct 2025 18:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1760028349; bh=wberWs9YpAk0bNvu7bEr1POX6t5V9/F8FyMAKk2Qcc4=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=QVFYOH3ZLgeXxcaVzMfSy7LgqwUsnwWVljRK8Co3yZfO3ttn2NNuHMxWfLww2A/F7
	 qF5wJDSAAxY2kKtLGQO9TftcPqVIW7cUG3t8qkShCqSVfwBJRGn5zzHmtcDxwCdTFl
	 +TOib7Jj91hu3GN8oZ/cwoYr48vKgOrYda6SCMIWhQDjqfzrD01LuJNfcUloyo5gVT
	 PoKVu87c+ADsTYRvyC/KJSOjHueiCWmsQ0KL1WQHmYcmz/eLzztQgSmLNE03vF0x16
	 ww4zgZfEaS7AJQX8XVjU/q6rAKBiDntYDsWCdb/okel3h0hCVWUjR0raRTDN3hsGn7
	 ck+/mV0Mp0KVA==
Date: Thu, 9 Oct 2025 16:45:18 +0000
From: Yao Zi <ziyao@disroot.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com,
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
	ardb@kernel.org, willy@infradead.org, guoren@kernel.org,
	ziy@nvidia.com, akpm@linux-foundation.org, bjorn@rivosinc.com,
	ajones@ventanamicro.com, parri.andrea@gmail.com,
	cleger@rivosinc.com, yongxuan.wang@sifive.com, inochiama@gmail.com,
	samuel.holland@sifive.com, charlie@rivosinc.com,
	conor.dooley@microchip.com, yikming2222@gmail.com,
	andybnac@gmail.com, yury.norov@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] riscv: add support for Ziccid
Message-ID: <aOfmnjJmQAdR1wD4@pie>
References: <20251009134514.8549-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251009134514.8549-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_094554_781023_6B79BB6E 
X-CRM114-Status: GOOD (  18.63  )
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

On Thu, Oct 09, 2025 at 09:45:14PM +0800, Yunhui Cui wrote:
> The Ziccid extension provides hardware synchronization between
> Dcache and Icache. With this hardware support, there's no longer
> a need to trigger remote hart execution of fence.i via IPI.

This description looks wrong to me: Ziccid only guarantees code
modification **eventually** becomes visible to remote HARTs, not
immediately. Quoting a paragraph from documentation of Ziccid[1],

> Since, under Ziccid, instruction fetches appear in the global memory
> order, the RVWMO progress axiom suffices to guarantee that stores
> **eventually** become visible to instruction fetches, even without
> executing a FENCE.I instruction.

and an issue[2] in the same repository (Ziccid hardware implementation &
software model),

> > Is fence.i still necessary in any case with the presence of Ziccid
>
> The only thing that Ziccid guarantees is that stores eventually become
> visible to instruction fetch. It doesn't guarantee that stores
> immediately become visible to instruction fetch, even on the same
> hart.
>
> So, fence.i is still usually necessary. The only situations in which
> fence.i is not necessary is when race conditions in code patching are
> functionally acceptable, i.e. when it doesn't matter whether the old
> code or new code is executed.

So it's definitely wrong to state "there's no longer a need to trigger
remote hart execution of fence.i".

> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/include/asm/cacheflush.h |  4 ++--
>  arch/riscv/include/asm/hwcap.h      |  1 +
>  arch/riscv/include/asm/switch_to.h  | 10 ++++++++++
>  arch/riscv/kernel/cpufeature.c      |  1 +
>  arch/riscv/kernel/ftrace.c          |  2 +-
>  arch/riscv/kernel/hibernate.c       |  2 +-
>  arch/riscv/kernel/jump_label.c      |  2 +-
>  arch/riscv/mm/cacheflush.c          | 16 ++++++++++++++--
>  8 files changed, 31 insertions(+), 7 deletions(-)
> 

...

> -void flush_icache_all(void)
> +void flush_icache_all(bool force)
>  {
>  	local_flush_icache_all();
>  
>  	if (num_online_cpus() < 2)
>  		return;
>  
> +	if (!force)
> +		asm goto(ALTERNATIVE("nop", "j %l[ziccid]", 0,
> +			RISCV_ISA_EXT_ZICCID, 1)
> +			: : : : ziccid);

and even in the patch, a remote-fence is still triggered if
flush_icache_all() is called with force set to true.

Best regards,
Yao Zi

[1]: https://github.com/aswaterman/riscv-misc/blob/e4fe3aa7b4d5b/isa/ziccid.adoc?plain=1#L139-L158
[2]: https://github.com/aswaterman/riscv-misc/issues/4#issuecomment-2884984633

>  	/*
>  	 * Make sure all previous writes to the D$ are ordered before making
>  	 * the IPI. The RISC-V spec states that a hart must execute a data fence
> @@ -41,6 +46,7 @@ void flush_icache_all(void)
>  		sbi_remote_fence_i(NULL);
>  	else
>  		on_each_cpu(ipi_remote_fence_i, NULL, 1);
> +ziccid:;
>  }
>  EXPORT_SYMBOL(flush_icache_all);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
