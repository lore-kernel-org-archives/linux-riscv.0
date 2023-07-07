Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6691EEB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 17:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyiJU3Kot33FL3VEjRGBoTs4Tn+yhNGrpuISIRRhyZM=; b=nFb6+n3ZDbEHsM
	r2/oJ1XrVUXNiZynxHXmH3p8O8lLEH37KNccIrv7LC67VZluFFh8f50ghwL5AfUBDXA/Ah7ETzIq+
	LKK+bEDKKYJUiLQCuO4xledmy+E3r/BU9/iim+qYHtBGN19z4dif2sTpq7x8zqojqLc9TNojPw37N
	yTYzxpJR/jNmQMDuRZM/AgQ+2U3QUAebL1ROKO6sYor6n9Z2COoxJMyoX09u8Aoo0R1qOIFnQFWxn
	TypLj2yg+tHWdXgp5tkE5XN+5YZ+QUXibzA4Sbn0SO9Ybrt9J6pVhHO5H8+N6f1O0r+iMkCQeZ4LQ
	deweW/dq8Did0v/aqQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHpib-005MmG-02;
	Fri, 07 Jul 2023 17:58:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHpiW-005MlX-0c
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 17:58:07 +0000
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qHpiL-0001bc-JS; Fri, 07 Jul 2023 19:57:53 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 davem@davemloft.net, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, christoph.muellner@vrull.eu
Subject: Re: [PATCH v5 4/4] RISC-V: crypto: add accelerated GCM GHASH implementation
Date: Fri, 07 Jul 2023 19:57:52 +0200
Message-ID: <2640941.X9hSmTKtgW@diego>
In-Reply-To: <ZIw6z7MNJ8Nq1q+k@gondor.apana.org.au>
References: <20230612210442.1805962-1-heiko.stuebner@vrull.eu>
 <20230612210442.1805962-5-heiko.stuebner@vrull.eu>
 <ZIw6z7MNJ8Nq1q+k@gondor.apana.org.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_105804_248848_A8560FE2 
X-CRM114-Status: GOOD (  12.01  )
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

Am Freitag, 16. Juni 2023, 12:34:55 CEST schrieb Herbert Xu:
> On Mon, Jun 12, 2023 at 11:04:42PM +0200, Heiko Stuebner wrote:
> >
> > +struct riscv64_ghash_ctx {
> > +	void (*ghash_func)(u64 Xi[2], const u128 Htable[16],
> > +			   const u8 *inp, size_t len);
> > +
> > +	/* key used by vector asm */
> > +	u128 htable[16];
> > +	/* key used by software fallback */
> > +	be128 key;
> 
> Where is the fallback?

Thanks for catching this. The fallback is of course not needed for the
Zbc-based variants but only for the future vector-based variants.

So this should not be in here but instead get added once its user is too.
I've moved this over to that part, that I'll post separately.

Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
