Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D62EC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 13:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jaeM7mxSqIS1uUB4vC2z5KRE9vpL1/zoYlzZFylv8jc=; b=q7ErIAG6/DGCoy
	tPGajR9hzdMwDRs5jbE1bch2sxmkJL7ddPueGTAeVwDJB7o8DKr49pwpaan1X0TGRxhbJiMqTksG2
	uvmaY0/Pw9vTXP3OKG7fyeS262FJs/gkkofVreBOr9ZYdmFsFhItlOrczMA0BOs5IGejrLDqVsrK8
	IdbopJGK0/hOb0BbTEQ4dUu9XjKbHChKifqZ1fB6/4lxjnZO0X96zuAgxV0x4e1i9/7yobxpkNhd7
	8b2Illqrsx7NOO9HUZS/qWtqzI6dqvL72nLtnsldXvtD29myWIgINS7mwlTt+rlcYsvzlk0UAz858
	mKTwCjYtV+SgySFeCRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7GoO-0056Fx-BF; Fri, 01 Jul 2022 13:35:56 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7GoL-0056Ec-Pf
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 13:35:55 +0000
Received: from [167.98.27.226] (helo=[10.35.4.171])
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1o7Go9-00077s-ML; Fri, 01 Jul 2022 14:35:41 +0100
Message-ID: <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk>
Date: Fri, 1 Jul 2022 14:35:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH] crypto: flush poison data
Content-Language: en-GB
To: Corentin Labbe <clabbe@baylibre.com>, herbert@gondor.apana.org.au,
 hch@lst.de, heiko@sntech.de
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20220701132735.1594822-1-clabbe@baylibre.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220701132735.1594822-1-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_063553_864131_D6794300 
X-CRM114-Status: GOOD (  16.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 01/07/2022 14:27, Corentin Labbe wrote:
> On my Allwinner D1 nezha, the sun8i-ce fail self-tests due to:
> alg: skcipher: cbc-des3-sun8i-ce encryption overran dst buffer on test vector 0
> 
> In fact the buffer is not overran by device but by the dma_map_single() operation.
> 
> To prevent any corruption of the poisoned data, simply flush them before
> giving the buffer to the tested driver.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> 
> Hello
> 
> I put this patch as RFC, since this behavour happen only on non yet merged RISCV code.
> (Mostly riscv: implement Zicbom-based CMO instructions + the t-head variant)
> 
> Regards
> 
>   crypto/testmgr.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> index c59bd9e07978..187163e2e593 100644
> --- a/crypto/testmgr.c
> +++ b/crypto/testmgr.c
> @@ -19,6 +19,7 @@
>   #include <crypto/aead.h>
>   #include <crypto/hash.h>
>   #include <crypto/skcipher.h>
> +#include <linux/cacheflush.h>
>   #include <linux/err.h>
>   #include <linux/fips.h>
>   #include <linux/module.h>
> @@ -205,6 +206,8 @@ static void testmgr_free_buf(char *buf[XBUFSIZE])
>   static inline void testmgr_poison(void *addr, size_t len)
>   {
>   	memset(addr, TESTMGR_POISON_BYTE, len);
> +	/* Be sure data is written to prevent corruption from some DMA sync */
> +	flush_icache_range((unsigned long)addr, (unsigned long)addr + len);
>   }
>   
>   /* Is the memory region still fully poisoned? */

why are you flushing the instruction cache and not the data-cache?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
