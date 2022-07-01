Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7815CCA47B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19jYZXS5eddKtP/kBX4xvOlsmuhlDMyJvhoX7U2E34E=; b=an7AdfXm9/pEu3
	Pg+W2N2cBr/5hzx4fgH4AjNVS4qD5oK/N5oSsnJkhiUmktRopwkYNE3056nN58bLmsXlqU63JTvca
	fuqcSP3MH1ccAebROFRiAlyBZ/9X2L9WtG+PZK2qkZYzsQCh5fDp+i+ExTw6xb1peZigiGvf8ZkJK
	WqRTrcJFnF9PRP0Ol0O09iZ2Lmc0rUGyn6+23IETw3sYFy6qabGsbiRLgh5jjYWtClNQTDqJBHDRH
	ktkSgHRwvOUYzXhc6TqRZno+WyqzPgLzgagQG+RffqSHz0D7nGfZ/BOlwnChI6YtpLiN4aKq0jhUj
	YyUOWYV9tt+w926DDkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Hku-005NHZ-SN; Fri, 01 Jul 2022 14:36:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Hkr-005NGL-Vb
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 14:36:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89713113E;
	Fri,  1 Jul 2022 07:36:19 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03FFE3F792;
	Fri,  1 Jul 2022 07:36:17 -0700 (PDT)
Date: Fri, 1 Jul 2022 15:36:14 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: herbert@gondor.apana.org.au, hch@lst.de, heiko@sntech.de,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Ben Dooks
 <ben.dooks@codethink.co.uk>
Subject: Re: [RFC PATCH] crypto: flush poison data
Message-ID: <20220701153614.0a576f9c@donnerap.cambridge.arm.com>
In-Reply-To: <20220701132735.1594822-1-clabbe@baylibre.com>
References: <20220701132735.1594822-1-clabbe@baylibre.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_073622_111435_B0A74340 
X-CRM114-Status: GOOD (  21.26  )
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

On Fri,  1 Jul 2022 13:27:35 +0000
Corentin Labbe <clabbe@baylibre.com> wrote:

Hi,

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
>  crypto/testmgr.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> index c59bd9e07978..187163e2e593 100644
> --- a/crypto/testmgr.c
> +++ b/crypto/testmgr.c
> @@ -19,6 +19,7 @@
>  #include <crypto/aead.h>
>  #include <crypto/hash.h>
>  #include <crypto/skcipher.h>
> +#include <linux/cacheflush.h>
>  #include <linux/err.h>
>  #include <linux/fips.h>
>  #include <linux/module.h>
> @@ -205,6 +206,8 @@ static void testmgr_free_buf(char *buf[XBUFSIZE])
>  static inline void testmgr_poison(void *addr, size_t len)
>  {
>  	memset(addr, TESTMGR_POISON_BYTE, len);
> +	/* Be sure data is written to prevent corruption from some DMA sync */
> +	flush_icache_range((unsigned long)addr, (unsigned long)addr + len);

As Ben already mentioned, this looks like having nothing to do with the I
cache. I guess you picked that because it does the required cache cleaning
and doesn't require a vma parameter?

But more importantly: I think drivers shouldn't do explicit cache
maintenance, this is what the DMA API is for.
So if you get DMA corruption, then this points to some flaw in the DMA API
usage: either the buffer belongs to the CPU, then the device must not write
to it. Or the buffer belongs to the device, then the CPU cannot expect to
write to that without that data potentially getting corrupted.

So can you check if that's the case?

Cheers,
Andre

>  }
>  
>  /* Is the memory region still fully poisoned? */


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
