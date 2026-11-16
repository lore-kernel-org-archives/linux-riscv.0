Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF362606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 12:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fa7KjpmC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h6i2kbJu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yg02Pv9jYgtjPDZJ1GRSpLmSvL+4Ff3yaQRx9dqASJI=; b=Fa7KjpmCW9UVziU/Rg/MR+H3VD
	MS+NBwEy+ydarnnSSQ2A3yvGOmAsK+oNLBqUqthn7BGP1M4x3rbgpeOQnDfITHFDGwewSzhgmRpzx
	j7750UXeaOnvmphK2b3FpoZXmp76kNt9Sm1N814fE9poPMpbRorlnrUMEv/I5lNGASJ+ISzo8WOpt
	XUsjbk/G8ONrPUx1o4cy6UwR51OGuEMsqf00Cnl0gA07ge1/Fs6qaDN68n4B3l90PoQbtMcFx3hed
	VaKF5Jx1awR+s4V4+NG7okc89V2g98ow+cTQeOjsYbSRRdJJAoC/99hjhtQTFx2iFwd2q5p99dErB
	ihO5e5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvgl-00000002Kdn-2F5j;
	Mon, 16 Nov 2026 12:19:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvgk-00000002Kdg-0zpj
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 12:19:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7053E439ED;
	Mon, 16 Nov 2026 12:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335D81F000C4;
	Mon, 16 Nov 2026 12:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831597;
	bh=Y+b7pepc+bqSJnjvX8gOa7j05vvfbGVSW+Ko5NDA4NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h6i2kbJuFcncsmN96i+B4eX/8pFwpz8E8Mj0REJTflzdzEb762gWULzIIoik2F4KM
	 pj78evRrW48pcJRQuHXSpbctZ6lrijH0BxBJIdQvPf5MKD7SsQpFX+jvHSBi6ijBro
	 bn2NqV23Kd9e5AK9NYaISlCfV3uL09YyX1FyxW8VPfRKrZDmxd7oU1kkqtQKUgnzlo
	 lzWossq90I4NOU9bLdEdu1jKUGxcm8uqOZGYj3WRs/kz0ksSRQH8Ej0avNY3Lmzz08
	 MaPZKqiAVbboL/9T+JNNSRHEdDUnMEgRN7Q8M16NsmWdo/UDBI8ltiHE50MdGVPSQs
	 rZGCww+HqQJQQ==
Date: Mon, 16 Nov 2026 19:59:42 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Zong Li <zong.li@sifive.com>, ivanrwcm25@gmail.com
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, debug@rivosinc.com, samuel.holland@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH] riscv: usercfi: Don't inherit parent shadow stack for
 user workers
Message-ID: <avrwLtiPQWedXpY_@xhacker>
References: <20261116032558.130928-1-zong.li@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261116032558.130928-1-zong.li@sifive.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 07:25:58PM -0800, Zong Li wrote:
> User-space background workers created through the copy_thread() args->fn
> path (such as io_uring io-wq/SQPOLL threads and vhost workers) share the
> parent's memory space (CLONE_VM) but never return to userspace.
> 
> Currently, these workers inherit the parent's user_cfi_state bookkeeping
> via dup_task_struct() (e.g., enabling shadow stack and pointing to the
> parent's live shadow stack base). When such a worker exits, mm_release()
> invokes shstk_release(), which incorrectly executes vm_munmap() on the
> parent's active user shadow stack. This triggers a fatal SIGSEGV
> (SEGV_MAPERR followed by SI_KERNEL) in the parent process during its next
> function return check (sspopchk).
> 
> Fix this by explicitly clearing the inherited shadow stack bookkeeping
> (setting base and active state to 0) in the user worker branch of
> copy_thread().

+ Ivan,

I think Ivan has fixed this issue in
https://lore.kernel.org/linux-riscv/20261028154315.1272705-3-ivanrwcm25@gmail.com/

Besides the issue, he also fixed another bug in riscv. The only
difference is whether set_active_shstk(p, 0) is needed or not.

And in the same series, a selftest is also added. So IMHO, we'd better
take Ivan's version.
Just FYI, arm64 has merged the fixes into linux-7.4-rc3

> 
> Fixes: 61a0200211d3 ("riscv: Implement arch-agnostic shadow stack prctls")
> 
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/kernel/process.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 34c1d498d1ca..4bc95acc5462 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -261,6 +261,15 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  		p->thread.s[0] = (unsigned long)args->fn;
>  		p->thread.s[1] = (unsigned long)args->fn_arg;
>  		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
> +
> +		/*
> +		 * User workers (io_uring io-wq/SQPOLL, vhost) share the parent's mm
> +		 * but never return to userspace. Don't inherit the parent's shadow
> +		 * stack bookkeeping, otherwise shstk_release() on their exit would
> +		 * vm_munmap() the parent's live shadow stack.
> +		 */
> +		set_shstk_base(p, 0, 0);
> +		set_active_shstk(p, 0);
>  	} else {
>  		/* allocate new shadow stack if needed. In case of CLONE_VM we have to */
>  		ssp = shstk_alloc_thread_stack(p, args);
> -- 
> 2.43.7
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
