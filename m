Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB311C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 18:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VgTHsPAJ64SPH/q8V4R5wAPUS1H4RO7RcVixVF3jaQ=; b=U7sWAdvIxR3yLm
	rmEMDhXIOblmXh2ziMA315CTf8igw7BNnl4/5pwiLdc7Jk4ay8DwlsgBkTGR+OYxpHQLeMvFclLQE
	QGTQGdugWjktHG+nWxEusB5xRvKy/XZy9+STvhRUraRhL2Jhnw2/1rpX+32MqS7ckQsr3lymJiGKp
	s214078QPJFgLMjdpaMQtOPxSJ//DJeclnxYSkSfCdM64JBxLIjvpBAsZmr8Q17IWtHuDr4rn16wA
	WLrIfcOG59uJ5PGALWEY/R3Vy5Hc0VMMamJBrDDUjvHxrftvTNsLfNQ7/pvBuLH0iXVPAehrdp3O9
	PNSokJKiUF0gO67TRZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oziuO-003cTw-Nb; Mon, 28 Nov 2022 18:31:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oziY8-003P6l-1a
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 18:08:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1CD561359;
	Mon, 28 Nov 2022 18:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9F9C433C1;
	Mon, 28 Nov 2022 18:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669658890;
	bh=eyWmZfcSt1FxFqiqqUiJo8PogQtmS8k2hdJ7SpBKAIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/PEUa13PmOa/Q19PLkNRiYd/FiABQgqFaeNTfKS+m7wwsYugfQlOQ1Sh8eyA0xjP
	 LL02AiR3iZTF4uSMN1yUizvGRzqO2YwQ3nsLAgLXDIYZygYCIk1OV1FfdPFQD/t1Vq
	 YGOUPdDeNZ43bkGu9+qysMV1twiBGS1qG2KBnrnnS6flBQvwirQsgg9Lpxd9Ix7Zzs
	 imGbmCsEOG/orPEA/RhzV0iXGVBkwq36PdgKcTEx3ogjQTfd65A81+FOhiKySedTvG
	 BLjo3F+T0a3Vna6Xecc/hFfEFe17ZoF1z44c4x5WdZN+DnACNG8MZqkTmXVEa1V7U5
	 iPfoVcbiYrw9g==
Date: Mon, 28 Nov 2022 18:08:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: heiko@sntech.de, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	ajones@ventanamicro.com, guoren@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: riscv: fix single letter canonical order
Message-ID: <Y4T5BZTRZWqXpV2A@spud>
References: <7034611.lOV4Wx5bFT@diego>
 <mhng-fee0e650-fb2d-4e36-8f75-ef90d5028f41@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-fee0e650-fb2d-4e36-8f75-ef90d5028f41@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_100812_246624_75A00498 
X-CRM114-Status: GOOD (  35.41  )
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

On Mon, Nov 28, 2022 at 09:41:03AM -0800, Palmer Dabbelt wrote:
> On Thu, 24 Nov 2022 05:42:20 PST (-0800), heiko@sntech.de wrote:
> > Am Donnerstag, 24. November 2022, 14:04:41 CET schrieb Conor Dooley:
> > > I used the wikipedia table for ordering extensions when updating the
> > > pattern here in foo.
> > 
> > 	    ^ foo? :-)
> > 
> > > Unfortunately that table did not match canonical order, as defined by
> > > the RISC-V ISA Manual, which defines extension ordering in (what is
> > > currently) Table 41, "Standard ISA extension names". Fix things up by
> > > re-sorting v (vector) and adding p (packed-simd) & j (dynamic
> > > languages). The e (reduced integer) and g (general) extensions are still
> > > intentionally left out.
> > > 
> > > Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
> > > Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > 
> > So I have compared the new pattern to the isa manual,
> > and it looks like the order checks out, so
> 
> Which ISA manual?

For me, isa manual is the above github repo.

> There have been many mutually incompatible ISA string
> encoding rules, at least one of them was a change to the extension ordering.
> It's not entirely clear what the right answer is here, as we can't really
> parse ISA strings without also knowing the version of the ISA manual we're
> meant to parse them against.  Maybe we just accept everything?

I don't think accepting everything is the right thing to do. A minimal
amount of validation is still needed here, but I think we can deprecate
the DT property entirely & make it optional if a new-and-improved way of
encoding the in DT is used.

> IMO it's time to just stop using the ISA string.  It's not a stable
> interface, trying to treat it as such just leads to headaches.  We should
> just come up with some DT-specific way of encoding whatever HW features are
> in question.  Sure it'll be a bit of work to write that all down in the DT
> bindings, but it's going to be way less work than trying to keep around all
> this ISA string parsing code.

I'm a glutton for punishment, I'll try and come up with some sort of
other way to encode this information in DT that requires less parsing
and validation. As I said on IRC, something that more resembles:
if (of_property_wahtever("riscv,isa-foo")) { do_enable_foo() }

> I know I've said the opposite before, but there's just been way too many
> breakages here to assume they're going to stop.

:upside_down_face:

Either way, I think these two patches are worth taking in the mean time.

> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > 
> > > ---
> > >  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > index e80c967a4fa4..b7462ea2dbe4 100644
> > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > @@ -80,7 +80,7 @@ properties:
> > >        insensitive, letters in the riscv,isa string must be all
> > >        lowercase to simplify parsing.
> > >      $ref: "/schemas/types.yaml#/definitions/string"
> > > -    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
> > > +    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
> > > 
> > >    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
> > >    timebase-frequency: false
> > > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
