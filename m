Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC64C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 23:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVhy563v5uFvtsfueg9hd/Oj8Ohtg2bNJgyK9h4JM1w=; b=oRbT/40OprYy7Z
	QFhPUzQa4uMD/GQisawcoLAQixQuREAKXw3i3SJHQ+W5Kjj3NS+eiMy5+ksggBQzMpqfE4B5KL2ZG
	WAeURGPjEqY4qsmdX6nm63FGWmFAsN3F7KB/BnWCX0wuwutxcRvHpbtT5WV/64UhBmEGw4LYRZltM
	DRDjNSZVTj/NGxlOukXZ+gJK9cyAWroyzLMxIE/M4C2GGctMWCKscJ13J25Q6bONvzOhe5MXrEywA
	H8aPL+SJdivbSoe9D4NHzSRucbqNIsGRzIMhWjtA69ZG2tM86eDDUfgJdb+PUqsLvyCL1uEYSnTgi
	Ut+eVgBouSf/YUGS0E2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1proRf-0051aB-08;
	Wed, 26 Apr 2023 23:21:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1proRZ-0051Yw-1m
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 23:21:05 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1proR6-0000Cq-Lc; Thu, 27 Apr 2023 01:20:32 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au, davem@davemloft.net, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, christoph.muellner@vrull.eu
Subject: Re: [PATCH v4 0/4] Implement GCM ghash using Zbc and Zbkb extensions
Date: Thu, 27 Apr 2023 01:20:31 +0200
Message-ID: <7664296.GXAFRqVoOG@diego>
In-Reply-To: <20230426225550.GA65659@sol.localdomain>
References:  <20230329140642.2186644-1-heiko.stuebner@vrull.eu>
 <20230426225550.GA65659@sol.localdomain>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_162101_590186_FE289CC9 
X-CRM114-Status: GOOD (  16.28  )
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

Am Donnerstag, 27. April 2023, 00:55:50 CEST schrieb Eric Biggers:
> On Wed, Mar 29, 2023 at 04:06:38PM +0200, Heiko Stuebner wrote:
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
> One more question.  It seems that this patchset uses the RISC-V scalar crypto
> extensions.  I've been hearing rumors that the RISC-V scalar crypto extensions
> have been superseded by the vector crypto extensions.  Is that accurate?  I
> wonder if it's worth putting effort into implementations that use the scalar
> crypto extensions when they might already be obsolete.

Yes there are the vector crypto extensions - still deep in the
ratification process.

And of course the RISC-V speciality, all extensions are separate
entities that core manufacturers can select at will.

And I guess the whole vector extension + vector-crypto extensions
might require more investment for manufacturers, where the variants
introduced here also "just" work with bitmanip instructions (Zbb + Zbc
extensions).


But for me, this small bit of scalar crypto is also sort of a stepping
stone :-). Previous versions [0] already included patches using the
vector crypto extensions too, I just split that into a separate thing,
as _this_ series actually uses ratified extensions :-)


Heiko



[0] https://lore.kernel.org/lkml/20230313191302.580787-12-heiko.stuebner@vrull.eu/T/



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
