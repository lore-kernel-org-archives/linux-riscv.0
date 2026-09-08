Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE62C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 03:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoGU7K23OI7AnWeVKeSRPfSaLB6HLcwsVnUhCSOLZRk=; b=XMfUmKRsCSIG97
	A0SBGKka17WclhbIAlc4E41oI3I+oaavSarM7uQ5U2VhLyk+g42kemU2uhX2yJsUEw89XooTkKttn
	8r6SXdKcbXg1eXtKZgp5gZ45J2G0MQ+Pkvz58DM+uotMJXHUJyfrSkvrSoC+CCqzdUdmCvSPCCRlY
	0D73fEc7mtbB3YTsX2WML0bd34Bs88S15e+pf5jCY/atLjm5mmAdVvhBgr17tIs3RRfcbkgHz3P1O
	/bAZyd+T0QDzF/aq2RPCsad86ZloOg1yL/IZ24Wu5fL6P7FrtB6MEdsGpEwzPSLXCABu2oJSM+FCa
	Y5vdql6Bj1xyk0DjyhrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3mwB-0000000805o-1gco;
	Tue, 08 Sep 2026 03:55:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3mw9-0000000805i-2Vrm
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 03:55:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FC5F40334;
	Tue,  8 Sep 2026 03:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F4C1F00A3A;
	Tue,  8 Sep 2026 03:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788839756;
	bh=R0ctmnURbfF1jhA+WdoNmvVL13yO/rBUKyBio3eC778=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LNos+MKcLezGnUD2SYPmGwoSzWVCG2L6wUaryMRgXYcoZXan2cPQawTc25mB8jhEW
	 waNvgZlZhvn1C7xcWyz9domfw7U3n92IiJ/4mdgp/KqG6eL6QlMEdDTdNSCKkkPg/z
	 1Xbs3NaU7dtnSVaojJtpL7bkD1TG+BI8ctzFle/KRoTvgdWvwXIVRtOfS9WO8sSbgq
	 ulqybM65fXy/cSv65BFLpa3JVbYzc5mAMAoBjIMMe0YwVunaBHdbuOKKw7IFiLx0CL
	 ooRU+mx6ZhvIKXJFIEgZ8jaX4zDJxdLW4Z7mVmDJTq0zmjtYQnpWHK8v20Fwd1tinS
	 LR8Z5reatLAWQ==
Date: Tue, 8 Sep 2026 11:36:08 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix load_unaligned_zeropad() fixup for RV32
Message-ID: <ap-CqOtyN9qvWHOb@xhacker>
References: <20260907190750.26303-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260907190750.26303-1-kmehltretter@gmail.com>
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

On Mon, Sep 07, 2026 at 09:07:50PM +0200, Karl Mehltretter wrote:
> The fixup for load_unaligned_zeropad() runs when REG_L crosses into an
> unmapped page. REG_L is lw on RV32 and ld on RV64, but the fixup assumes
> an 8-byte load: it rounds the address down to 8 bytes and derives the
> shift from three address bits.
> 
> On RV32, a load starting in the last three bytes of a mapped page selects
> the word four bytes earlier and shifts it by 40, 48, or 56 bits, more than
> the register width. The caller gets earlier bytes instead of the string
> tail followed by zeroes. This affects RV32 MMU kernels built with
> RISCV_EFFICIENT_UNALIGNED_ACCESS=y, which selects DCACHE_WORD_ACCESS
> and lets dcache name hashing and comparison and strscpy() use this
> path.
> 
> Derive the alignment and offset masks from sizeof(data) instead of a fixed
> 8. This makes RV32 use the correct source word. RV64 code is unchanged: the
> complete extable.o is byte-for-byte identical before and after.
> 
> Fixes: d0fdc20b0429 ("riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
> Tested on RV32 QEMU virt/TCG with a KUnit guard-page test. Before, the last
> three offsets returned fill bytes from the previous word (0xa5, 0xa5a5, and
> 0xa5a5a5) instead of the string tail (0x44, 0x4433, and 0x443322), and the
> suite failed. After, all three cases and the suite passed.
> 
> Built full RV32 Images for both sides with GCC 15.2.0. The complete RV64
> extable.o is byte-for-byte identical before and after the change.
> 
>  arch/riscv/mm/extable.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
> index dd1530af3ef1..e252eba55ede 100644
> --- a/arch/riscv/mm/extable.c
> +++ b/arch/riscv/mm/extable.c
> @@ -68,8 +68,8 @@ ex_handler_load_unaligned_zeropad(const struct exception_table_entry *ex,
>  
>  	addr = regs_get_gpr(regs, reg_addr * sizeof(unsigned long));
>  
> -	offset = addr & 0x7UL;
> -	addr &= ~0x7UL;
> +	offset = addr & (sizeof(data) - 1);
> +	addr &= ~(sizeof(data) - 1);
>  
>  	data = *(unsigned long *)addr >> (offset * 8);
>  
> -- 
> 2.53.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
