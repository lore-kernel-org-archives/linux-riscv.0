Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C9DC369D3
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Apr 2025 14:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+27QRLAq/iwUdN63j8JNUJBFwD3zbkFP813laeLEVco=; b=CeOnlphCysVbQl
	jBGuNGTxZOpu2ZIXz4IEKr7sAcqPZh5od/6+U4H5IvSZQIKEvCPa9GwMETorypS0Btu0OXlBQjl3H
	MYV5jEyivTgHjB3W9DP7hxuASwP7y3CLI/2CXds0paC8mFC7NxYeURycGxQAItiWlko4JcGeIbWh+
	mPzbJ8NroifNjOr5uwL3AJPVAZTAF+xgEGRo0L36vAhXjB1ZaHez/0JGxGIK4rvhUjwB/DHhfiJFE
	u+kpFTTeck+8wDDXC11+FJLZ++QcCNuiFT6PB6doYG3OWF1XXeW7fUlJjw8XB0co8Lz7W6hWfRa7Y
	6IPyGqWFRUI4WIp/LlxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92gy-00000003dgp-0yyy;
	Sun, 27 Apr 2025 14:09:12 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92f1-00000003dVG-1P6O;
	Sun, 27 Apr 2025 14:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bjaQCYAZZv7TZCyYcpymHM3x4tGRpcCplG+gYWSYS9Y=; b=Y5RhSc5/FybI7zmz9SHjUsOJyt
	6y13MP9+31En+C9RdXh+jvvPfmcEs8+ugf/lrbM+EuMyfHqK2AbcS8TSq6nIW/o0J5hLQbnKW2dwO
	5PDPeGJ0dMiB+I1jO7FLhSzAAUHoGPP0xtZH8fUgS54mB21PslHj4y/wIynDPQmglvHJFPSzYGQUS
	e6SLa2lor/mFtkN8PODNuoz4j9cgiiqr6ML354CiGk2KNJSUINJ8HzdvV/YfmSH+b2/2lTMTZ+f9n
	8+V6BnpZAT4ZOKXfyim5oaRqg6ehnl6jo5JsXrJNniEO3jfXP0RfbAfbnaxToW16RVxQ/wE8t43b+
	zz+/7N0Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u92ev-001PEG-1R;
	Sun, 27 Apr 2025 22:07:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 22:07:05 +0800
Date: Sun, 27 Apr 2025 22:07:05 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v2 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <aA46Cfr7p6dMXwvU@gondor.apana.org.au>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
 <20250427123514.GA1161@quark>
 <aA4mAlozk3RvxvTe@gondor.apana.org.au>
 <20250427125641.GB1161@quark>
 <20250427131138.GC1161@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250427131138.GC1161@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_070711_372838_811B7E21 
X-CRM114-Status: GOOD (  12.22  )
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

On Sun, Apr 27, 2025 at 06:11:38AM -0700, Eric Biggers wrote:
>
> By the way, as I mentioned in my cover letter:
> 
>     For now the SHA-256 library is well-covered by the crypto_shash
>     self-tests, but I plan to add a test for the library directly later.
> 
> But due to your gratuitous changes where crypto_shash is no longer built on top
> of the normal SHA-256 library API, that's no longer the case.
> 
> So while I do still plan to add a SHA-256 library test anyway, I don't see the
> reason for not also making crypto_shash just do the right thing.

OK at least this objection makes sense.

I'll add an additional sha256 shash implementation that wraps
around the lib/sha256 interface so we don't lose that testing
coverage.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
