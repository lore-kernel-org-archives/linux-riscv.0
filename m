Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94C7EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nK6ptzdDLiuTpeTTLB7E+S/+8/G4p4BSNLg3bRFkqLk=; b=JkmRZO4wHoY5/A
	87dwY/1WPoHwsU3R/aLhqC22Wwm1Y6HnqTodS3qKWYElJSq8bxHuyep9KpNTy3SA4cmVqlmPX4s9U
	dXr/xIpV56OmFvWkrgQU6THy9JJsoHp40Ft7riLKpxdnaS592ALF1LlroEncLRUw9Ng3azY0tPuhy
	3kvG+quFSVahJs3lMeZr4pWCsvQtbIu46+rf65uKldOvbZuhOcgzbz3OR2SNBanCeO48eIKy/zyPl
	cwuFBIDVKV+4mdOsQQHktGZXJ2JZ7/d0zaoOGVjVLeSpvyo0290JD/4qouWOndomSog5HmcYIF9lh
	9qZVYEtvKHK1THvXUR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInSC-00B5oa-1T;
	Mon, 10 Jul 2023 09:45:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInS9-00B5lw-2H
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:45:11 +0000
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qInRy-0007zw-0Y; Mon, 10 Jul 2023 11:44:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au, davem@davemloft.net, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, christoph.muellner@vrull.eu,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v5 0/4] Implement GCM ghash using Zbc and Zbkb extensions
Date: Mon, 10 Jul 2023 11:44:56 +0200
Message-ID: <5381895.Sb9uPGUboI@phil>
In-Reply-To: <20230613030216.GC883@sol.localdomain>
References: <20230612210442.1805962-1-heiko.stuebner@vrull.eu>
 <20230613030216.GC883@sol.localdomain>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_024509_745363_BDEF65EF 
X-CRM114-Status: GOOD (  20.22  )
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

Hi Eric,

Am Dienstag, 13. Juni 2023, 05:02:16 CEST schrieb Eric Biggers:
> Hi Heiko,
> 
> On Mon, Jun 12, 2023 at 11:04:38PM +0200, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > This was originally part of my vector crypto series, but was part
> > of a separate openssl merge request implementing GCM ghash as using
> > non-vector extensions.
> > 
> > As that pull-request
> >     https://github.com/openssl/openssl/pull/20078
> > got merged recently into openssl, we could also check if this could
> > go into the kernel as well and provide a base for further accelerated
> > cryptographic support.
> 
> I'm still a bit skeptical of the usefulness of a standalone "ghash"
> implementation, when in practice it will only be used as part of "gcm(aes)".
> Directly implementing "gcm(aes)" (instead of relying on crypto/gcm.c to compose
> "ghash" and "ctr(aes)") also allows some performance optimizations.
> 
> I asked about this on v4
> (https://lore.kernel.org/linux-crypto/ZCSG71bRuTzVutdm@gmail.com/),
> but I didn't receive a response.
> 
> Any thoughts on this?

somehow I always seem to overlook this when adapting the series :-(

I guess for me the main gcm was always a stepping stone to get
started and extend later. This is my first rodeo with crypto stuff
in the kernel, so this looks like a manageable chunk and as can be
seen by the discussion we had about licensing brings enough topics
on its own :-) .


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
