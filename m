Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911AEC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 22:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfpRhQv7jCxjchzTqhSCI0/SJ7nMr6aZqcVTkm6MSs4=; b=POBhMQYKvzcw2S
	dA9LSnEYBkaFg7POcncpwSz/NGeYZEmMG/lu7nOh9ztN6owuEM03M8PUl0lPXRzOdFstrWgB8BG/8
	pkiuH+3JJu40PYjktCLHeoQQbJ42z7BzCTH09cTGEofz/leXcVfs8u4ca3JH/R30cbMXwyHXX3+kM
	FMLO7CdGN5dHGsxEoPkQykeklo9yqG3sJS0FozDv1K5LXtsvjEF+reme17FdfsAx5pO5OwTq5wxoY
	N3k3/8AytCbddb2VoVra2XoRDoWFOwTd40R3nRJowStRdvr6buNlqerjIAf1O/slon6NgrvxxsYk9
	n5oP8Enyhve3S5a9lj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oalPg-007Izp-Q7; Tue, 20 Sep 2022 22:08:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oalPd-007IyH-Im
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 22:08:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 131CAB82B02;
	Tue, 20 Sep 2022 22:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199CBC433D6;
	Tue, 20 Sep 2022 22:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663711694;
	bh=iozzoV1Ygnf/OI6uhxz6HynhxoksV3GkhO3MAkxoiyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHAPXMGpunLSH+vmkDF1uQA7WIlplB6czRPu+jaAgQH8FHndy95kzAUM+4UICjNWO
	 XKX+VhRh4PEH7ymnp0S0gRwWbrKJitlFGCctprF4kAZQoJyHM4iXDoqm4BndzmIcTa
	 lEJGMyzKbohZj0HL9mmKaa9jwkh6bzzJrFYzFMIfSsCqG4L+g9iVLWo4b37BdtwcUK
	 MM0hpikHY8ky0Itn1z9Cjs2l6ooOMiEUFuzVW6xwXSQ9Ond2aechsVoQyFiTb4yk4i
	 gV93o8GovLQaNWEjqv3kl4d2BK5uo6W+jLgA3ZEZXnz86zwlJEtbvuMa2CYTqDQs1n
	 m+jUwoNAWHNfw==
Date: Tue, 20 Sep 2022 23:08:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Print SSTC in canonical order
Message-ID: <Yyo5ywIEOU0fbW+Z@spud>
References: <20220920204518.10988-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920204518.10988-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_150817_780874_83D33ED0 
X-CRM114-Status: GOOD (  19.25  )
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

On Tue, Sep 20, 2022 at 01:45:18PM -0700, Palmer Dabbelt wrote:
> This got out of order during a merge conflict, fix it by putting the
> entries in the correct order.
> 
> Fixes: 7ab52f75a9cf ("RISC-V: Add Sstc extension support")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

My OCD is a fan of this patch, so on that basis:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/kernel/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 0be8a2403212..87455d12970f 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -92,10 +92,10 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> +	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> -	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };
>  
> -- 
> 2.34.1
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
