Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5806DC636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 16:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzmRq1k/tZcH/uT3WDVTb/yI6qEoiCIT3HvFAPpA/xM=; b=xmI+od64CP0pww
	/ygihcEYS+pJFWwR9vTjLJdRTaupMuPXP1jozWxfMYCbolEAWJ7ViobnHeSDHhcx9n1/SCpzRZWJn
	3NS8ESIF/yFtoZ7tuHNjPEDe6UfjbVCOO3atH+KpVpO3/pB83UJ42owl4+abSTNFYesgQZyokEvHF
	4LQwhHO5ep6bo2dxWvMQi3WucKoFLb4nCbs5L7UZ5mcqcsVimalfM1rcNdggaODM09hQtwDB3wHQY
	yOXwPkLCQpR/T58nFfiowxmbPVs5UMvS3VlAAAZu1XnMNjDtjyCCKvhPG56V08zH+2jZ5KnYhxfMM
	iLVfjILQWFo3gal92kEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRc8o-00Fb8d-N5; Mon, 13 Feb 2023 16:57:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRc8m-00Fb7b-2U
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 16:57:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B59E2611B4;
	Mon, 13 Feb 2023 16:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B47C4339C;
	Mon, 13 Feb 2023 16:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676307438;
	bh=ef21h0MzKbePTAgMmCqsteVlUArbe4r01a+6XKMdXIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7lvMHaI8QA86U3B12poWtqC4oevr297M5WJcVJ0TnLjkHetcquXI9u9aOFB706/a
	 sE0uBXUmjlXueH1R9QNWRaFuPd4FeMSW228GKkBdkhZKKS9+Jv6wkNQ6GzTsgjaj+i
	 a/vUGbyCfpVFmw3jnhlUmpOm7bx3z6lpW+0eM52Urw7j52FSx0vfVcFYQkRBGs/IPD
	 yy/5eUlNucMqgWE8uQCtqAKVnAU1kOtgdtqoAH5GodI4BumKxvkkafQ2NbGVWwnCST
	 JrCIQE+Yrxv5P/i6SOdZwj6dN7B5+/JAqsKvDBhMwxA+ehSVynjqFPybfQadwLoZAK
	 9xmX+jDzVA4mg==
Date: Tue, 14 Feb 2023 00:46:47 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph Muellner <christoph.muellner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: Fix early alternative patching
Message-ID: <Y+ppd3YEM0BB6O5l@xhacker>
References: <20230212021534.59121-1-samuel@sholland.org>
 <20230212021534.59121-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230212021534.59121-2-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_085720_197083_7F55F0EA 
X-CRM114-Status: GOOD (  15.02  )
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

On Sat, Feb 11, 2023 at 08:15:32PM -0600, Samuel Holland wrote:
> Now that the text to patch is located using a relative offset from the
> alternative entry, the text address should be computed without applying
> the kernel mapping offset, both before and after VM setup.

Good catch!
> 
> Fixes: 8d23e94a4433 ("riscv: switch to relative alternative entries")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> 
>  arch/riscv/errata/thead/errata.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index c0bea5c94128..1dd90a5f86f0 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -102,9 +102,7 @@ void __init_or_module thead_errata_patch_func(struct alt_entry *begin, struct al
>  
>  			/* On vm-alternatives, the mmu isn't running yet */
>  			if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> -				memcpy((void *)__pa_symbol(oldptr),
> -				       (void *)__pa_symbol(altptr),
> -				       alt->alt_len);
> +				memcpy(oldptr, altptr, alt->alt_len);
>  			else
>  				patch_text_nosync(oldptr, altptr, alt->alt_len);
>  		}
> -- 
> 2.37.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
