Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6C6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0NHc4S5WVhbnZ5MtgSrrPCWgQaAosgE+iiefnSoePc=; b=gOfL6553Md5as1
	BFcUL6DXzq4VH5iZC8eJMv+0Sz5JknYSCVAxKMD26MA/DMLviUvDf8lkdNZwZGjzA+kC74UP79Lln
	esDnCet3OE7CVCwaDgrIeDMIHj2DxcG8SBKC38t6CGwn31HYR2Pd32oDZOlBkip1r07uGAL9lpVJW
	l8BxD7RnvUurjlVkfj1Qe2zwSVWUJY2JflDhdGKnYJLTWGfA/smbhdvPCkMrHLfCbpOYoQzZBLxDj
	E7jfRVJQOOu4Lyte4YVrd/UitxbUumEnFYpEUarP0NJliIrP3DD26Z0S7i3K2gedBOzs3eYvtP2Mc
	kq/WrxDsmG7yh9kPnO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsjG-00BXk8-6l; Wed, 25 May 2022 15:15:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsjE-00BXiu-Qa
	for linux-riscv@bombadil.infradead.org; Wed, 25 May 2022 15:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R0bYa3bqxY9GPEpA3DafrOKo9H0NLHEqnpsYPkXf25w=; b=J0+uY2/pMpYQ3dBqX+MWze99WG
	4P9IpvGNxxyeg8YYsIjArAAzEp+nYSQS3mEVJupX68UH6ldRTOUjfVAnAT4axs1OIuA7jwQPKetqw
	MOQGDq8213H3j4NFXsw/hyHPmDsNbXPpnBaIOoEN0Vbk2pRXjMI50IJm4WS7ir9lE/j/k8ekX/krl
	4zhcroj1zdpqvZ82ZpwplW4qJfPzaJnEsnJz1Br4VY2N1XlAXkzZ6IULHs54pbwoDT1JfmM3h17zq
	kBUo7xxl+EFWf2tuCuSSqjevgjkiyOZenPuZkIrbjGnuLX9ZP0jiedCmm5v5hZY0NiZ7aR6ibqp8M
	XOWQTAbQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntsj6-001dfN-U7
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 15:15:11 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1ntsiW-0006cQ-BV; Wed, 25 May 2022 17:14:32 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr, samuel@sholland.org, cmuellner@linux.com, philipp.tomsich@vrull.eu, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: document cbom-block-size
Date: Wed, 25 May 2022 17:14:31 +0200
Message-ID: <4376261.8F6SAcFxjW@diego>
In-Reply-To: <20220518002529.GA1928329-robh@kernel.org>
References: <20220511214132.2281431-1-heiko@sntech.de> <20220511214132.2281431-2-heiko@sntech.de> <20220518002529.GA1928329-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_161509_322941_E746EDCA 
X-CRM114-Status: GOOD (  22.14  )
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

Am Mittwoch, 18. Mai 2022, 02:25:29 CEST schrieb Rob Herring:
> On Wed, May 11, 2022 at 11:41:30PM +0200, Heiko Stuebner wrote:
> > The Zicbom operates on a block-size defined for the cpu-core,
> > which does not necessarily match other cache-sizes used.
> > 
> > So add the necessary property for the system to know the core's
> > block-size.
> > 
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index d632ac76532e..b179bfd155a3 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -63,6 +63,13 @@ properties:
> >        - riscv,sv48
> >        - riscv,none
> >  
> > +  riscv,cbom-block-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Any value 0-2^32 is valid?

funnily enough there really seems to be _no_ constraints defined in the
spec [0] regarding the actual cache-block size.

It essentially only states
"The capacity and organization of a cache and the size of a
cache block are both implementation-specific"

and later in software-discovery:
"The initial set of CMO extensions requires the following information to
be discovered by software:
- The size of the cache block for management and prefetch instructions
- The size of the cache block for zero instructions"



[0] https://github.com/riscv/riscv-CMOs/blob/master/specifications/cmobase-v1.0.pdf


> 
> > +    description:
> > +      Blocksize in bytes for the Zicbom cache operations. The block
> > +      size is a property of the core itself and does not necessarily
> > +      match other software defined cache sizes.
> 
> What about hardware defined cache sizes? I'm scratching my head as to 
> what a 'software defined cache size' is.
> 
> > +
> >    riscv,isa:
> >      description:
> >        Identifies the specific RISC-V instruction set architecture
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
