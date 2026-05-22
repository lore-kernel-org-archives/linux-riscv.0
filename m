Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA74CD5BB1
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 12:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2A0dFSEeS9AAwVREMXh2VVB3I1FrjpZGh8mfTHmiYks=; b=I6foIxgrV/BAU0
	XVhiu72CH8W57dZeRs2IZzhlN+JPuotJRc9rhoHuSMTX6/7HXL4s2QgQYlPEvzV9DWhuMIAQmBhUD
	nf3JNXu/9HYpJZKk6g+oWaptxhlJvksMUP9Rk+5LImpbSMNx/BdmI83k+THyBopkr/L8M0oIdqPgz
	1ynl2tMtCMhSyUtR3JoHKkW7oCA6+WNATgQju2yvqM/t25TNHQD0Y19RKpXroX6cXE7EH+a+i7aB7
	WWuFDtwPIbyEcTe69A4MVL1mIxOSpiSpDg4csIgnMdeOJFNM0xIm/9bs0ou3o2oWW+KXIwbUsRxkq
	lAn9Q5+dIXp1i2i5a1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQP2J-0000000AmUE-1h1t;
	Fri, 22 May 2026 12:31:31 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQP2E-0000000AmT0-0feh
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 12:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=l74tzO3KJHUizv9WPRmAVf0vyTVxPTERjksbYexfXe8=; 
	b=lb4R/PxSZNO2q0S4oZFy9Qld714Ua6syCwv+MNBkXhC9qMnXivcPLFk3JF+LzxHz43jlKt4zxr9
	fqIyolHzcJ4Pt5gLSph8lJuuGnBgI9DWZakTnlqaxKZZB1gRh63KaI0+BAQ3lxLz0gRD5hLiOPbWr
	o54zg4hCAqv6Y5ySK9mmWuOCbTV/clrjxIH6/K2P0HGdjGTh/5wRttwGykJ19N3GZLKPZzl3SwX/D
	p7Lu/rwsUGMfJrB2LASB3lS+IQDJd7F1Qfdezf0f/3ZcxAV57FvKXlALPzOw2BVDxaVYhPxly56MQ
	smWcCrDar5Z2u6DdXjd1+I4Pj/h1tQB+LSKQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wQP1o-00GSO9-33;
	Fri, 22 May 2026 20:31:01 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 22 May 2026 20:31:00 +0800
Date: Fri, 22 May 2026 20:31:00 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: riscv - replace min_t with min in
 riscv64_aes_ctr_crypt
Message-ID: <ahBMhKb4YmeVf376@gondor.apana.org.au>
References: <20260514165509.527721-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260514165509.527721-2-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_053126_200556_9F360CFB 
X-CRM114-Status: UNSURE (   9.95  )
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

On Thu, May 14, 2026 at 06:55:10PM +0200, Thorsten Blum wrote:
> Use the simpler min() macro since the values are unsigned and
> compatible.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  arch/riscv/crypto/aes-riscv64-glue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
