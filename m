Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8A7C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 16:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vz0zWP1zQ9zTCehWATmwhI77oS4QPh+f1/K3l0TlTrU=; b=pILc9+Tl0FRgDf
	ecBUQ3eW7AlJcK/RXpwctgj1CGGldanGsZrOJ+HfFvVi1fVJoytipcEUnUEsfDDL6+v1NgsddxohJ
	IgXI5VjEl3ZQlodfFjLmn1a19VUejFLx/79DmBDzvUXL+IAFlcW/QwUet8+2fuhY9quIOdM5AfarI
	ry8LzZNbN1ZvlwrGcaEe+vkqJXUAyak0ORkScJT6+exijFGTx2sT1SNIp9WiKKwvgZiUn5yx8/qJ1
	fsNrxtVsilLXy6ZtJz534FTXwBo+wgsDIBUZEvzDWKCqwr9/uimNC0yYK4nQ5KAGbc+HIvRZUCdIN
	eLTXxs8zPJPRhOlS3scw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mU1-008Zpn-Tm; Thu, 01 Dec 2022 16:32:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mU0-008Znf-1a
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 16:32:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 193256206C;
	Thu,  1 Dec 2022 16:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650AAC433C1;
	Thu,  1 Dec 2022 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669912336;
	bh=cMwzrRKMQ2waFYK+vs1kMdLHyXhAlnzImiEEX0QXs4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAaJawPCOdI05RzgTiR0YrbEamagB7IKEaOxAThb5E0xpyB9Qx4gsrfy/B+HXRGf1
	 vgmaeMrWxHnfNpNlXHWNxVD3OvrTiQZ5FhI67/74iHZeRHCqpBzQGTo3WugcIUjccH
	 KjcP+6WA+VtYEx9WEAfklqX9x3iRj3BKHPBuQny7frB7NGMJCechNmm133FFRL1h+p
	 Ri2YwgcOJWjJ0CA387ZFQo9xvNT/uJFpLQDLxG8FB8uIYnfX5nUxMvFSt/qNvbVO9A
	 rpWYJfeiDZFGQAbi2Mn0l6tektcyc8fU+W2oE9skmJtyCmEcWp3IDCq4idJTlqUEkb
	 u4nEbIdsVQYCA==
Date: Fri, 2 Dec 2022 00:22:23 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: guoren@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] RISC-V: Align the shadow stack
Message-ID: <Y4jUv42SRiMh+nEH@xhacker>
References: <20221130023515.20217-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130023515.20217-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_083220_144111_FCFF9EC5 
X-CRM114-Status: GOOD (  15.94  )
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

On Tue, Nov 29, 2022 at 06:35:14PM -0800, Palmer Dabbelt wrote:
> The standard RISC-V ABIs all require 16-byte stack alignment.  We're
> only calling that one function on the shadow stack so I doubt it'd
> result in a real issue, but might as well keep this lined up.
> 
> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
>  arch/riscv/kernel/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index be54ccea8c47..acdfcacd7e57 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -206,7 +206,7 @@ static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
>   * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
>   * to get per-cpu overflow stack(get_overflow_stack).
>   */
> -long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
> +long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
>  asmlinkage unsigned long get_overflow_stack(void)
>  {
>  	return (unsigned long)this_cpu_ptr(overflow_stack) +
> -- 
> 2.38.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
