Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D139AC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 11:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+LcaEQtVj6xxwPar72DWU+9Lk9uOm67zxF7KsWlpgE=; b=ELCFImjO8Hm6Dr
	I6EUkL2ccsAl0ZZcoV7R71B5FCK+Iv5HJJcu+ApzxymU6SlwRQ1AKqX1kzvyt/aNxiga0AasPkB0n
	hk9LhfnkLZQJIQ6KZ9WSi2GaZt+zxnsJDUQJ32hoAeS+rXy/sqxEjvlwMwiS7yRSynJHC64wFUehq
	8UrU0nYII59f5GBtwKu5HjxqDkVgt+jkxTOWsBeXtMDxPDatVEbhWWSQ/UoHpHKhRqWWj4vrPfyn5
	JgsYB63FDNDDRhaCo9xmuxNODGvy6MXxsTzzkqLQ1yGVthiQkWokAiynw+WH90Dams2gJlpsiuEL4
	NYFlLszny5FMExe80+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qx3ic-001fGg-2Y;
	Sun, 29 Oct 2023 11:12:34 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qx3iZ-001fEg-2h
	for linux-riscv@lists.infradead.org;
	Sun, 29 Oct 2023 11:12:33 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qx3iE-00CDCL-5X; Sun, 29 Oct 2023 19:12:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 29 Oct 2023 19:12:16 +0800
Date: Sun, 29 Oct 2023 19:12:16 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
	ebiggers@kernel.org, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	christoph.muellner@vrull.eu, heiko.stuebner@vrull.eu
Subject: Re: [PATCH] crypto: riscv/aes - Implement scalar Zkn version for RV32
Message-ID: <ZT4+EDcsYgBN+wot@gondor.apana.org.au>
References: <CAMj1kXF0e+MKyDJPS7r=LWusEBCaw=t03JC=+Dz0Qk+GmY+uXw@mail.gmail.com>
 <mhng-ff1fe914-36e9-42e8-88ac-44c7f6976e3d@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-ff1fe914-36e9-42e8-88ac-44c7f6976e3d@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_041231_870771_DD6C748A 
X-CRM114-Status: UNSURE (   7.40  )
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

On Fri, Oct 27, 2023 at 06:11:40AM -0700, Palmer Dabbelt wrote:
>
> I don't really know much about the crypto stuff, but looks like there's
> still a "struct crypto_cipher" in my trees.  Am I still supposed to be
> waiting on something?

Yes lskcipher has now been added.  Please don't add any new code
through the old crypto_cipher interface.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
