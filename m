Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED3EE7B5F9
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 12:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKEwrL91mtdw/GC2UZcWzzNi07EqWx5QJGL+CUbLnYY=; b=G3WTQc8tVYa+/1
	65ALWpj+v+IQtx8Z7gWgf0kMdHqGdlHGsXflEXAJuCaugyUMuoy05EgfJ8mu0OXSNi3+3xPOCscY6
	9rhY+NRgvCucBntvpe6yplH7wQKaAJDFWkx2UZ6bgINby1+IFSwACcACdENorPB8TKpM+UVlwAKgO
	PcO0KE8wo68eDqPYDDftHO7aFG2mEYUo15c+tcO9p4S3kM80qbXPPYUP3F/KAGs64g+0znBAXMbFX
	mvzL4D51omKOKdbU6XVmopboy5J2cX9rp0I4tBQQ+3HVkLowrk0NJeCU3na7N6gv8+Jx/tGw0IHUg
	maRZoShf26XNlJtPaBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0qv-00HaVK-39;
	Wed, 04 Oct 2023 12:19:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0qt-00HaUf-1G
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 12:19:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7F40BB81D0C;
	Wed,  4 Oct 2023 12:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A09C433C7;
	Wed,  4 Oct 2023 12:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696421980;
	bh=Jjv+CIZgDjDEX/17AWRFDrfvrea0mMzt1tHHLzjMDhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SAcdhEBL+OvdiOlN1gqsikDxDKbJgV7ZN6NkjJqaOhajhIAe64VzacCg03JZ5U4W3
	 Q1N2ZuhuCkSBttSxuWRpl9w+Ta24ATd7f3ZKhFYoDawizaQxrTaJAmdEESSGU8odye
	 NKgDKgTXqUuwEggQ7rLy9qoDoLGy4vKhjJWz+5raTcbFLRbcLiamifjkGDcF+mg6Jc
	 6CcN5J7HuMPDYk03BG92kNN7n+keXt7cU5ALkR7Qksz+30dBDK8gl0BwVVCouml5xD
	 8qTId8y4ImeJZi0q+T6qYyAZxKbkPx/XhjHcukdEGat6AGXw0xWYWMBHZsHgjMuBGV
	 HLTyVimzl0Bqw==
Date: Wed, 4 Oct 2023 20:07:35 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>, Drew Fustini <dfustini@baylibre.com>
Subject: Re: [PATCH v2] riscv: mm: update T-Head memory type definitions
Message-ID: <ZR1Vh6kXay3uNvs0@xhacker>
References: <20230912072510.2510-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230912072510.2510-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_051943_571530_80EE6F58 
X-CRM114-Status: GOOD (  16.81  )
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

On Tue, Sep 12, 2023 at 03:25:10PM +0800, Jisheng Zhang wrote:
> Update T-Head memory type definitions according to C910 doc [1]
> For NC and IO, SH property isn't configurable, hardcoded as SH,
> so set SH for NOCACHE and IO.
> 
> And also set bit[61](Bufferable) for NOCACHE according to the
> table 6.1 in the doc [1].
> 
> Link: https://github.com/T-head-Semi/openc910 [1]
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Tested-by: Drew Fustini <dfustini@baylibre.com>

Hi Palmer,

I believe this is a fix, could you please review and take it for 6.6
fix?

Thanks

> ---
> 
> Since v1:
>  - collect Reviewed-by and Tested-by tag
>  - rebase on linux 6.6-rc1
> 
>  arch/riscv/include/asm/pgtable-64.h | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 7a5097202e15..9a2c780a11e9 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -126,14 +126,18 @@ enum napot_cont_order {
>  
>  /*
>   * [63:59] T-Head Memory Type definitions:
> - *
> - * 00000 - NC   Weakly-ordered, Non-cacheable, Non-bufferable, Non-shareable, Non-trustable
> + * bit[63] SO - Strong Order
> + * bit[62] C - Cacheable
> + * bit[61] B - Bufferable
> + * bit[60] SH - Shareable
> + * bit[59] Sec - Trustable
> + * 00110 - NC   Weakly-ordered, Non-cacheable, Bufferable, Shareable, Non-trustable
>   * 01110 - PMA  Weakly-ordered, Cacheable, Bufferable, Shareable, Non-trustable
> - * 10000 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Non-shareable, Non-trustable
> + * 10010 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Shareable, Non-trustable
>   */
>  #define _PAGE_PMA_THEAD		((1UL << 62) | (1UL << 61) | (1UL << 60))
> -#define _PAGE_NOCACHE_THEAD	0UL
> -#define _PAGE_IO_THEAD		(1UL << 63)
> +#define _PAGE_NOCACHE_THEAD	((1UL < 61) | (1UL << 60))
> +#define _PAGE_IO_THEAD		((1UL << 63) | (1UL << 60))
>  #define _PAGE_MTMASK_THEAD	(_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 59))
>  
>  static inline u64 riscv_page_mtmask(void)
> -- 
> 2.40.1
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
