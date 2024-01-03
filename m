Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E61C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niLeaXwDeEcHNCB8kwSPcX/nw1dT8SCKokyvxAtJgJM=; b=4zX1hOyoYT8b/R
	MUm72kS8wygy38G8gDWfNLGOk/wQ/g5r7p1mt9hz887mFPRcm+/UFgGmX1Xh5q+ScAWLWajzgJd8c
	4qizJtZOL5n/j2gxK40/4IRNSObkP1KlctxKXoINvJuywKFDGRh8J52cVtmr2n+K4DJdlqU2TjVs7
	uLIUHFJUchEO/6AWc8vIwW5gWK1srHGRGRFZJKM6H6n7k9SzsYUj1GN9p2UkjNHqeYFcrSYMq4xfl
	PydPEKDCyiQOIzZLh5qOHaTk0mp4EsxqnbVU7CXLBK+9HdTUvSOebV1v4eAB6FxtAEiVlelMC03ih
	HiEvTogum/2idUdbvnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3uB-00BME5-13;
	Wed, 03 Jan 2024 16:15:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2vb-00BDeo-00
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 15:13:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A497ACE1414;
	Wed,  3 Jan 2024 15:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C9DC433C8;
	Wed,  3 Jan 2024 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704294783;
	bh=QX+nMwXVzn0gGxlE1K2IkvWpvmG5/KS1sk6RCZ0yiIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3TJTsC8iSmtmbvbPqzz3uRI6cNoJFiZq0ejCKH357+uluHEWBWnFIvZH/LsmU50J
	 5CTshTIDIkC36IeAp5RKK+zyw42DrsEU1LXXy90j1nn1mR4R3ObVyCeaLieOIgcABt
	 /d5hFyGgkDUyn+KUh2LFSO1DBEjj89Plug9yiEM5dDvV11IdUoiONSPDrFroAVW8XG
	 zfFvVfhQyorewe+y17GRIh2aowzfRCxdh4pi7R+MLhn9Vsr9G37uXCQxoKw2ENAQeb
	 zO2UoMrT5gdhC+9fw+SN2ufKi2iVG33g2EZ2h5l9eU90wHyvZRSn1qBiS5IU9QKlbJ
	 ebY6TXHOBtAuw==
Date: Wed, 3 Jan 2024 23:00:20 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 10/12] riscv: mm: Make asid_bits a local variable
Message-ID: <ZZV2hKLKtqjhEdvY@xhacker>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
 <20240102220134.3229156-11-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102220134.3229156-11-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_071307_213396_9C769891 
X-CRM114-Status: GOOD (  15.95  )
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

On Tue, Jan 02, 2024 at 02:00:47PM -0800, Samuel Holland wrote:
> This variable is only used inside asids_init().

This is due to patch9, so can be folded into patch9.

> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> (no changes since v1)
> 
>  arch/riscv/mm/context.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index b5170ac1b742..43a8bc2d5af4 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -20,7 +20,6 @@
>  
>  DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
>  
> -static unsigned long asid_bits;
>  static unsigned long num_asids;
>  
>  static atomic_long_t current_version;
> @@ -226,7 +225,7 @@ static inline void set_mm(struct mm_struct *prev,
>  
>  static int __init asids_init(void)
>  {
> -	unsigned long old;
> +	unsigned long asid_bits, old;
>  
>  	/* Figure-out number of ASID bits in HW */
>  	old = csr_read(CSR_SATP);
> -- 
> 2.42.0
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
