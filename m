Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2DBC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVpkZ4Om11CTs/fqp6a2iyEy9kxg6vqcw6spuo39soU=; b=WfyxvaivU2pkbf
	BqWCkBbNMbyjw30zS2/1T5+3uSz6xfU5PPJah1y1W6dgW4L6Cn9pkPgiM4tmjBaoi00X23qh/xvJW
	o5Tt1oKEHjTiGVguno4M+oCtlVJZ18qmLR3kFwauCP7dfTwtBY4tHnAeFtqJ8puoDAcCE1vTm/mOa
	jplv2leNs/O1O28s0yDh2rQTiWxRsL06qvLisvA65B0xeB1JH539s65R9mYAkfj2nWyt5FY6jn63K
	hvFpg/XqYxZ14eF0jZnkXRtj0QrUlJUXFcYrdJs+ieR8U56pwIfp8KDa6ZyVKImncAEb2Zjjo3PB2
	Wdg+wI0FgZSFjq6MD91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrFaD-000izB-4V; Wed, 18 May 2022 09:03:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrFa9-000ixg-IA
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 09:03:03 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nrFa3-0007Q7-65; Wed, 18 May 2022 11:02:55 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com,
 guoren@kernel.org, atishp@atishpatra.org, anup@brainfault.org,
 mick@ics.forth.gr, samuel@sholland.org, cmuellner@linux.com,
 krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: document cbom-block-size
Date: Wed, 18 May 2022 11:02:54 +0200
Message-ID: <1893094.PYKUYFuaPT@diego>
In-Reply-To: <CAAeLtUBLpDHeJHfPtaUb_OLZb_6cUQa1Z_F+06pkdJMSHtWrfQ@mail.gmail.com>
References: <20220511214132.2281431-1-heiko@sntech.de>
 <20220518002529.GA1928329-robh@kernel.org>
 <CAAeLtUBLpDHeJHfPtaUb_OLZb_6cUQa1Z_F+06pkdJMSHtWrfQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_020301_650770_7C347AFC 
X-CRM114-Status: GOOD (  30.37  )
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

Am Mittwoch, 18. Mai 2022, 10:22:17 CEST schrieb Philipp Tomsich:
> +David Kruckemyer (who is chairing the CMO task-group within RVI).
> 
> On Wed, 18 May 2022 at 02:25, Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, May 11, 2022 at 11:41:30PM +0200, Heiko Stuebner wrote:
> > > The Zicbom operates on a block-size defined for the cpu-core,
> > > which does not necessarily match other cache-sizes used.
> > >
> > > So add the necessary property for the system to know the core's
> > > block-size.
> > >
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/cpus.yaml | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > index d632ac76532e..b179bfd155a3 100644
> > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > @@ -63,6 +63,13 @@ properties:
> > >        - riscv,sv48
> > >        - riscv,none
> > >
> > > +  riscv,cbom-block-size:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> >
> > Any value 0-2^32 is valid?
> >
> > > +    description:
> > > +      Blocksize in bytes for the Zicbom cache operations. The block
> > > +      size is a property of the core itself and does not necessarily
> > > +      match other software defined cache sizes.
> >
> > What about hardware defined cache sizes? I'm scratching my head as to
> > what a 'software defined cache size' is.

I agree that this should be worded better. The intent was to tell that this
is different from say the l1-cache-block-size.

I.e. these values can be the same but don't need to be. But I guess I got
too much lead on by a kernel implementation detail (L1_CACHE_BYTES constant)


> This seems to be a misnomer, as the specification doesn't use the term
> and rather talks about the "size of a cache block for [operation
> name]".
> 
> There are currently two such 'operation sizes' discoverable by software:
> - size of the cache block for management and prefetch instructions
> - size of the cache block for zero instructions
> 
> For whatever it's worth, cache operations in RISC-V attempt to
> disassociate the underlying hardware cache geometry from software.
> See https://github.com/riscv/riscv-CMOs/blob/master/specifications/cmobase-v1.0.1.pdf
> for the CMO specification, and the discoverable parameters are listed
> in section 2.7.
> 
> Philipp.
> 
> > > +
> > >    riscv,isa:
> > >      description:
> > >        Identifies the specific RISC-V instruction set architecture
> > > --
> > > 2.35.1
> > >
> > >
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
