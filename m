Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538F5ECD98B
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OB/EMIq2hDb8UCpsMQ2Isemp0GgVh1B5HY+pgbjPGDc=; b=Qb/v5RmcMmf5+8
	vVhQty5OFJk8ONDp1FGDB91qKevz1hg9bKpCay7WirujlO9/kI+4zUzhYyrczkQZ1uHv1+is/mmy/
	PzA90ETWSHT8C9Y/pEkOH6VhxKUv+MgBGpg1AoYtY8WmF1JcZjhjH8NoHojCPxfjGCC8ebhXViebs
	p4EC/AJjx2vKvgBKgF9l+O1CRrYyRH4rir4tYpdcaP7jdWJsL42l/eDRkwWyltt189AkUU1FQRDFW
	1geNI7bjqCw/iOHrqFIZTd4bT/VkdZ4MXRIpGN8C8K+T2iYTDrJZ3/qMH6z6eGPt5EMVgQczIErF+
	qo+a+ddyQoHRFx1fc/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIgb-0000000B8Ys-0Ku1;
	Fri, 06 Feb 2026 10:03:37 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIgX-0000000B8Xl-3BPn
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 10:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=cH28OCzUCXtIb8rf4iZ/cLsOgAzYvktJTCaR2EzPIi4=; 
	b=V8PR9CTcHMjJ8QWdpKrMNH33+V0npPyybclURKkiBN42b3rCcKFdDrllBgACxr+bbOzAGDyEYQW
	vSAK37PyPPPAKzDYubWQVMFapVSJS/51YDYuHN6uPXudV6cxwaxjoe5zofc+MTVFxJbmEngIJBYrL
	lc07Eeb8beEmD7ccT5WrYAMP0svQn5TKMU1Z6ZSy1NRb0KsC4vto56N1DkjObh8+WdpSzz0JhU72O
	NB3IdJlHKDdpllHsX8Dzc9PgHEBBAgWN1EunofMkHIGWSXH+mCR85ktrG4FYhZHV+pC5hWVlmaVcD
	sIpkahJa36o/b9B+BdFZNX0BDLP5DCYhE0jA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1voIg8-004yZR-0a;
	Fri, 06 Feb 2026 18:03:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 06 Feb 2026 18:03:08 +0800
Date: Fri, 6 Feb 2026 18:03:08 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"David S . Miller" <davem@davemloft.net>,
	linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH V2] crypto: aegis128: Add RISC-V vector SIMD
 implementation
Message-ID: <aYW8XJk44phI3JSG@gondor.apana.org.au>
References: <20260126092411.243237-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126092411.243237-1-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_020333_795400_9508263A 
X-CRM114-Status: GOOD (  13.57  )
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

On Mon, Jan 26, 2026 at 05:24:11PM +0800, Chunyan Zhang wrote:
> Add a RISC-V vector-accelerated implementation of aegis128 by
> wiring it into the generic SIMD hooks.
> 
> This implementation supports vlen values of 512, 256, and 128.
> 
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
> V2:
> - Add config dependency of RISCV_ISA_V to fix the issue reported by kernel test robot;
> - Add return value in preload_round_data() and aegis128_round().
> 
> V1: https://lore.kernel.org/all/20260121101923.64657-1-zhangchunyan@iscas.ac.cn/
> ---
>  crypto/Kconfig              |   4 +-
>  crypto/Makefile             |   4 +
>  crypto/aegis-rvv.h          |  19 +
>  crypto/aegis128-rvv-inner.c | 762 ++++++++++++++++++++++++++++++++++++
>  crypto/aegis128-rvv.c       |  63 +++
>  5 files changed, 850 insertions(+), 2 deletions(-)
>  create mode 100644 crypto/aegis-rvv.h
>  create mode 100644 crypto/aegis128-rvv-inner.c
>  create mode 100644 crypto/aegis128-rvv.c

In light of the recent move of aes from crypto to lib/crypto,
perhaps the same should be done for aegis?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
