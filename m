Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09C7C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 16:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qngu9FCX9fZu6Eibs1a4+99K+wPCE+XdWu3pVBENGRs=; b=qrSjoiS8KlOhqm
	l/juI07x3vIJsmB8LhHP0pK6UXpw2pQEgMOMgSsDsSG9QUbgACV9ohiSkPphZMTI0Coy9VOrPZz8j
	mdN21mvRXa0OHFByNNk9b+AJu/6KdMwRHoh8qSiHjJB5cRjFD9S0spJD1a2hmwGRsKtZV0N0GcbAH
	S0+wRfdvQbMIWuQeTl7r2+Embw/Kyt0IIbvUssZscsiBstA5hLlobXGBPck2E1lkBBiF6GS0A8gEU
	V9qt/EIf6rChniTZJQ7iSNqwe+3Rij+hwE6rqFd+cRSAf66Wuiv6njd5vaA+zkWsi04/lkfDuMbqs
	KAbCvpZD2nrZmH1pMuAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhBTi-00000009svg-0Dkd;
	Mon, 04 Mar 2024 16:47:50 +0000
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhBTe-00000009sto-12Ks;
	Mon, 04 Mar 2024 16:47:46 +0000
Message-ID: <b7f3fb0c-6c26-42c7-858c-231f4982a761@infradead.org>
Date: Mon, 4 Mar 2024 08:47:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix compilation error with FAST_GUP and rv32
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240304080247.387710-1-alexghiti@rivosinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240304080247.387710-1-alexghiti@rivosinc.com>
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



On 3/4/24 00:02, Alexandre Ghiti wrote:
> By surrounding the definition of pte_leaf_size() with a ifdef napot as
> it should have been.
> 
> Fixes: e0fe5ab4192c ("riscv: Fix pte_leaf_size() for NAPOT")
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>


Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  arch/riscv/include/asm/pgtable.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 25ca14f6942c..54d26a07fa63 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -439,9 +439,11 @@ static inline pte_t pte_mkhuge(pte_t pte)
>  	return pte;
>  }
>  
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
>  #define pte_leaf_size(pte)	(pte_napot(pte) ?				\
>  					napot_cont_size(napot_cont_order(pte)) :\
>  					PAGE_SIZE)
> +#endif
>  
>  #ifdef CONFIG_NUMA_BALANCING
>  /*

-- 
#Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
