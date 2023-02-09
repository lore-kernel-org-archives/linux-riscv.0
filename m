Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F27DC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpLoQvcM6844lhflXUE+/Av2515H9I49fGtETByBPrk=; b=pVcxBaY/ZzInla
	733SlfolzmnPKpCEph/AN7IUwTQRg+Ra4oPmYLm2++/v8dEpvWzPdeEw+PN/KsRK7FObXDIw2GEkl
	cqJ7eMPEvVhjIuJjPljIfpdEALaNZteVnfU+zyOmjgeGLfN62GfRBRKAEx94o3trXX/q2i0wNcj+h
	XuTylZUL337bEdINVdLf8tf8BRrj/HdNinHNetu8OzBqQPp+6kbWFIy9e3QPjaBCbtO53FMFRu6Pm
	+hfFCxF/89I9kW7DjI0lzOYU16alNFg/2vjQXJ0HGLcvkDKsK2n4pKJCwprPMcueb76bFxcWWMAvb
	XfakCSnDkqkk0bpJ2tug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ32I-000iXS-GN; Thu, 09 Feb 2023 09:16:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ32G-000iVk-RZ
	for linux-riscv@bombadil.infradead.org; Thu, 09 Feb 2023 09:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OyTk5mKIE3B1ZinYp02jJK4zD74KkckOpjPi4wSOd20=; b=g6rFLWSz2chGjkuh6H17awOihK
	6Us7IMKjgWdiU7SUusjVoleoKnVoc9E1C0AZUVuPJH/eG9vhkCOcyB5xzZyKtfOhBWN38CVMC+mRv
	iZeo75YI8aYv2+fNGv88qYYLBOHa+OsfVrwae3I8/30QLvVPTeuDcODQZRDTvo3ajmzb/LW3J5Rtb
	hSpBGhYmh7xKLJhDkwxohPVNxNtMZtzrECprr0wsa4Q4i8+vOkSi2mJeGxE5fWlVH7U56Al8nZwVb
	HJoddPP4Ab0U3q/vuWQuGNqS74vH0GMX4iBxo9uZRL492KW0xKRsT/iTCNNDx1a0QcPWvmMkpw4J2
	yMHoiqMg==;
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38] helo=formenos.hmeau.com)
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ329-0023fP-Fd
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 09:16:05 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pQ30m-009DIL-7L; Thu, 09 Feb 2023 17:14:37 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 09 Feb 2023 17:14:36 +0800
Date: Thu, 9 Feb 2023 17:14:36 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/4] crypto: starfive - Add hash and HMAC support
Message-ID: <Y+S5fBjZQZli9nBg@gondor.apana.org.au>
References: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
 <20230130154242.112613-5-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130154242.112613-5-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_091602_003651_0FF1D174 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jan 30, 2023 at 11:42:42PM +0800, Jia Jie Ho wrote:
>
> +	cryp->hash_data = (void *)__get_free_pages(GFP_KERNEL | GFP_DMA32, pages);

Why do you copy everything before you feed it to the hardware?
If the issue is alignment then surely you should only to copy
a small amount of header (and perhaps trailer) for that?

> +static int starfive_hash_export(struct ahash_request *req, void *out)
> +{
> +	struct starfive_cryp_request_ctx *rctx = ahash_request_ctx(req);
> +
> +	memcpy(out, rctx, sizeof(*rctx));
> +
> +	return 0;
> +}

You are supposed to extract the entire hardware state after each
operation and store that in the request context.  Since your
request context doesn't appear to contain any hash state, this 
can't possibly work.

Does your hardware allow the non-finalised hash state to be
exported, and re-imported later? If not then you can only
implement support for digest and must use a fallback for
everything else.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
