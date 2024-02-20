Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B72C5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 01:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1caFei3CIqS3Oz21HxMnQ70gbJLrL59Mx3/N2jKqUo=; b=UTUHbDmkhZPvmU
	s+yoOBP7xR2cpq5lx9iYtvzLa4ScLsFwDgdoAX66SpRsKZI6eB/odaqudUjQdVuep51YwwmsG4dkk
	vxTCcb9lUss4KubCTWovAq7+pXhAWoIDqxdHFeWBMUKCVD+i7Oo1jLz9RQn3BmcSS5exUdlBqq4+8
	8TebzjTaunRAcg8PR2FUk9wSUMCiLFxdJPhyZLeRqSxQjsSfsOvQyhUHfhZ4bJoDUExgJOph5hN6S
	SOEUea6M2jZbr6zM8Yp2Wr1505aRbLzy4xnxBCBdDKva4fyEtWTHAilRJGAitOX05PzN3qRqONzIe
	QzQeriFbi2qaI4RhzVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcFCj-0000000Cmki-2BX4;
	Tue, 20 Feb 2024 01:45:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcFCh-0000000Cmjn-3A9o
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 01:45:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BE3C60EBC;
	Tue, 20 Feb 2024 01:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF93C433F1;
	Tue, 20 Feb 2024 01:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708393550;
	bh=xwMhIGtEqqY2ZsJjJOtA/QlKbBot/S9r36wBtxBVccA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O1W0cgbTEGgHawrTybfrqZA2h4w70iM1SEZtnjXNGPMnrpImDFWWacaxZdDvQeVpw
	 Tt2FSsPBWHrVRTCsluKvgjQVX9xG01G4hHeqhr5wvotXpT/xoxR/BtBuhVmGorB1S9
	 6JJoiQIrM7kaocCdYogkW5qw1XjN8hfeGl516L5RGjaymvfCSP/Q2YDx8Nou7dTsje
	 Fr8F1U32HoluRGf7UpFJOz0T7b6R8jAwoFZw/hoY+FHyGoU1cNvFpKQYdZuae0hSm0
	 NNrEhiFU/R3INlK/0x/LxEyv8VApX/phDuvX7ph3ZKzXY7v7L55lOyZZBFNGTFNIPZ
	 iIKEMP27yoHRA==
Date: Tue, 20 Feb 2024 09:32:43 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: fix NOCACHE_THEAD does not set bit[61]
 correctly
Message-ID: <ZdQBO4JetdQGecoi@xhacker>
References: <tencent_594131AD216D8DE97CCC8265DA5D8E45B808@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_594131AD216D8DE97CCC8265DA5D8E45B808@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_174551_854452_9D333856 
X-CRM114-Status: GOOD (  13.04  )
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

On Tue, Feb 20, 2024 at 12:32:09AM +0800, Yangyu Chen wrote:
> Previous commit dbfbda3bd6bf("riscv: mm: update T-Head memory type
> definitions") missed a `<` for bit shifting, result in bit[61] does not set
> in _PAGE_NOCACHE_THEAD and leaves bit[0] set instead. This patch get this
> fixed.
> 
> Link: https://lore.kernel.org/linux-riscv/20230912072510.2510-1-jszhang@kernel.org/ [1]
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Good catch! We're lucky just because _PAGE_NOCACHE_THEAD isn't used now.

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
>  arch/riscv/include/asm/pgtable-64.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index b42017d76924..b99bd66107a6 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -136,7 +136,7 @@ enum napot_cont_order {
>   * 10010 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Shareable, Non-trustable
>   */
>  #define _PAGE_PMA_THEAD		((1UL << 62) | (1UL << 61) | (1UL << 60))
> -#define _PAGE_NOCACHE_THEAD	((1UL < 61) | (1UL << 60))
> +#define _PAGE_NOCACHE_THEAD	((1UL << 61) | (1UL << 60))
>  #define _PAGE_IO_THEAD		((1UL << 63) | (1UL << 60))
>  #define _PAGE_MTMASK_THEAD	(_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 59))
>  
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
