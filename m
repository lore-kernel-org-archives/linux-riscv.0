Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18871C001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzJKM67O2sxRM1ToQYv+E5FoYnTEUehrvaPE2zPvQDA=; b=3WJ0Ifa7u3j7y5
	v0CdAJ1LdBuPQzzBWnreFkk/O3kQjxNRasridUXfkQQrXb8ieT3+IyGvWgCqKBPMr5Zr3Dkgd/TK6
	cfgYV7Jb+EQ/qDLftQBXDJklxFSOj+IK2ybOpkTtTIvOMju/2NLU2V6d9wt3Szq4zDjDuKyWtx8nE
	4jiiiLvSs/w0iRioZqiNqIL7Bu/bSSkAFrEI+AiqO1y+SuqQIEuVQGTuv73rK/BN0fMITvMdGwgm/
	VEsDF5XNqha7cUZPI5jyydPziGRgFGNhNnZyVfF2QuZ5DSPwzQep3nwlQjtvHGf4La35zpMCrJnfu
	VskdoAHojAXQToaUqz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrEP-00C266-36;
	Fri, 04 Aug 2023 09:36:25 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRrEL-00C24Y-2D
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 09:36:23 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qRrDs-003baZ-Uj; Fri, 04 Aug 2023 17:35:54 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 04 Aug 2023 17:35:52 +0800
Date: Fri, 4 Aug 2023 17:35:52 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Rob Herring <robh@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] hwrng: Enable COMPILE_TEST for more drivers
Message-ID: <ZMzGeELPudVhTvRF@gondor.apana.org.au>
References: <20230728195015.1198427-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230728195015.1198427-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_023621_868645_2BAB2F8A 
X-CRM114-Status: UNSURE (   8.86  )
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

On Fri, Jul 28, 2023 at 01:50:15PM -0600, Rob Herring wrote:
> There's quite a few hwrng drivers which are easily enabled for
> COMPILE_TEST, so let's enable them.
> 
> The dependency on HW_RANDOM is redundant, so drop that while we're here.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Passed allyesconfig builds on arm, arm64, x86, riscv, powerpc, sparc
> ---
>  drivers/char/hw_random/Kconfig       | 35 ++++++++++++++--------------
>  drivers/char/hw_random/amd-rng.c     |  1 +
>  drivers/char/hw_random/ingenic-rng.c |  2 +-
>  3 files changed, 20 insertions(+), 18 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
