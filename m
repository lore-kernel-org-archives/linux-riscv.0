Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203DFC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 05:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKXUYeoRzwLOwSECMA622q8VQ64iq3KIWijxj2h/5JM=; b=XZK3yJILsfp2U8
	Nj6vhz88Dr4Z3wyivikzpaYf56vORg8X2j8xv5LJXffI4ZQs7FTyvH+k3Hy5YpOOt8gBhNvppZ8Wa
	8jHb4sf/XNvXvXpDxQ8zM13CsOnwAPO/1zU0K1Uwazis+Ra59q/MCYcavvBeYxw7atZn7gd8vDrDo
	SI1mVgCAW39PiBwgw70wycUIjC5er5vKCs63EJIdLsL7awwyp/hDD+D8P0c6xaiYIZOPFrDgcK3cX
	YdeXZCd7uVhnIsr8r+zOQMJCjUz0PFGY1N3EVKO4xj+QJ8pGqep6cVCTvcv/qNFq04spob2dSNP3Y
	rScArNd7Gjckhqrcb85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGY78-004yqA-30;
	Fri, 22 Dec 2023 05:30:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGY75-004yoo-2b
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 05:30:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD19F60B1A;
	Fri, 22 Dec 2023 05:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03688C433C9;
	Fri, 22 Dec 2023 05:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703223022;
	bh=6I9qfQLjBMaQPaOGDmtTa+br3HH/Vcx62bcuPR3D2Rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MC/G7jSHPCYcjeOQR3xCch1pJ9WkJGRs6camdOWKs7wniTmcZDRdodvrMz9UhH19b
	 6VjMUfFxWvmFwXvZKXjIPuTM9dBJMj1AxjLwgBDG/li9uM8dP+ntfSOl4Cqan71QGw
	 3TEa1oQziZxdG0mVaG/oIrUSkSggHfKFguEPQLrFe7u1CglSlGm2dKgV13S2Ob5rvQ
	 /ct6EKZxUyTKlc9+9Z8HsKMoqdqUb1wPdRVZ8R66Et7rj5+iheJj5oKgdivu2mxRfX
	 UwfbPHeVq2oQN6V1DOEJvjA3wxByMIHC+lzUJ+r46z7xJZFav9zvI6N2ALzI5F7I1v
	 2DnsOf0B2zl9Q==
Date: Thu, 21 Dec 2023 23:30:14 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, charlie@rivosinc.com,
	ardb@kernel.org, arnd@arndb.de, peterz@infradead.org,
	tglx@linutronix.de, Vincent Chen <vincent.chen@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [v7, 01/10] riscv: Add support for kernel mode vector
Message-ID: <20231222053014.GC52600@quark.localdomain>
References: <20231221134318.28105-1-andy.chiu@sifive.com>
 <20231221134318.28105-2-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221134318.28105-2-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_213023_889905_71C88647 
X-CRM114-Status: GOOD (  16.98  )
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

On Thu, Dec 21, 2023 at 01:43:08PM +0000, Andy Chiu wrote:
> +/*
> + * We use a flag to track in-kernel Vector context. Currently the flag has the
> + * following meaning:
> + *
> + *  - bit 0-7 indicates whether the in-kernel Vector context is active. The
> + *    activation of this state disables the preemption. On a non-RT kernel, it
> + *    also disable bh. Currently only 0 and 1 are valid value for this field.
> + *    Other values are reserved for future uses.
> + */
> +
> +#define RISCV_KERNEL_MODE_V_MASK	0xff
> +
> +#define RISCV_KERNEL_MODE_V	0x1

Is there a reason this isn't just a single bit flag?

> +static inline void riscv_v_ctx_cnt_add(u32 offset)
> +{
> +	current->thread.riscv_v_flags += offset;
> +	barrier();
> +}
> +
> +static inline void riscv_v_ctx_cnt_sub(u32 offset)
> +{
> +	barrier();
> +	current->thread.riscv_v_flags -= offset;
> +}

What is the purpose of the barriers above?

> +static inline u32 riscv_v_ctx_cnt(void)
> +{
> +	return READ_ONCE(current->thread.riscv_v_flags);
> +}

What is the purpose of using READ_ONCE() here?

> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 4f21d970a129..5c4dcf518684 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -187,7 +187,6 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
>  	*dst = *src;
>  	/* clear entire V context, including datap for a new task */
>  	memset(&dst->thread.vstate, 0, sizeof(struct __riscv_v_ext_state));
> -
>  	return 0;
>  }

Unnecessary whitespace change.

Otherwise this patch looks good, thanks!

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
