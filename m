Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A20C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 19:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mw+p2466rbyc9GaSXhHHqLKZMQJJmSR27RSQK20bM7I=; b=N+R1mD55Yfm2SX
	FG/F41tg2CPkhnU65XZWkUQT9Jvg6eI+Zeu3eawGn2oCekmXrq/Y0zTsH2agW/KKDe1cEscLpP88q
	I1VCF+1rV8DWiOMAVKnBC85ouf6lBDQXkY5BYAFB4wvfQ8x/kqBDkBWcBQlQlV56+8teI6XieUF5i
	eb9DpUD2ij2uyELMrN0WUcNdFInATWQLBYWHa1osAPTSvuf4qatJsWUYRRoc7cp2aWayotjU3AZjh
	jc/AoelxvoXWXXXBIebcPQxVzHqbygH4IWC26ELCaDiv3qst2dSN3uk/TfQzHlG0Wp2uuax+kXLG+
	KsGRzYEuHymYtSXe/plg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozjdE-003wHV-3C; Mon, 28 Nov 2022 19:17:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozjdB-003wFu-K1
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 19:17:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0D877B80FA1;
	Mon, 28 Nov 2022 19:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C69AC433C1;
	Mon, 28 Nov 2022 19:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669663046;
	bh=yQ5hUODoRr61GX9YNtGAbFsGAu4JgPpjVKyNBXT2dv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cHmRlT6l6Yh89J+B8WGGzv5ffbu+yVFvvTvPOH9WA2H2STmDJH4mDCFnBh7xpBOSl
	 YeDHWPZqA8pxuA7+iERraR5QzXvzXksTwrEdEI+b/ZxL+5VBf1fNPqYifMWC1eiGW4
	 Wh6YTnYrdb0jHSJb+IPHoQVAZoC3GpUIZp9BDZZtDSDWZ4yef2Dnqck2g7DWdmEx4S
	 1q7feEwvdQYF0rNiVe1Wv1+7DH2JWGTmYowGgEvUuKzNASv37lKOZMzaljEK505QNT
	 al1ldUrGp4LVLUzomidYtjs0rK80pd2p8M0bxIOug/TshSo2Z5KXNLf78JbfyejUk0
	 55I/1sT5SRmhA==
Date: Mon, 28 Nov 2022 19:17:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: heiko@sntech.de, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	ajones@ventanamicro.com, guoren@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: riscv: fix single letter canonical order
Message-ID: <Y4UJQYgCpnZJji9o@spud>
References: <Y4T5BZTRZWqXpV2A@spud>
 <mhng-eebb4b54-4332-40f8-8c6d-cb239d3ce924@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-eebb4b54-4332-40f8-8c6d-cb239d3ce924@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_111729_986210_1E943266 
X-CRM114-Status: GOOD (  51.11  )
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

On Mon, Nov 28, 2022 at 10:12:17AM -0800, Palmer Dabbelt wrote:
> On Mon, 28 Nov 2022 10:08:05 PST (-0800), Conor Dooley wrote:
> > On Mon, Nov 28, 2022 at 09:41:03AM -0800, Palmer Dabbelt wrote:
> > > On Thu, 24 Nov 2022 05:42:20 PST (-0800), heiko@sntech.de wrote:
> > > > Am Donnerstag, 24. November 2022, 14:04:41 CET schrieb Conor Dooley:
> > > > > I used the wikipedia table for ordering extensions when updating the
> > > > > pattern here in foo.
> > > >
> > > > 	    ^ foo? :-)
> > > >
> > > > > Unfortunately that table did not match canonical order, as defined by
> > > > > the RISC-V ISA Manual, which defines extension ordering in (what is
> > > > > currently) Table 41, "Standard ISA extension names". Fix things up by
> > > > > re-sorting v (vector) and adding p (packed-simd) & j (dynamic
> > > > > languages). The e (reduced integer) and g (general) extensions are still
> > > > > intentionally left out.
> > > > >
> > > > > Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
> > > > > Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > >
> > > > So I have compared the new pattern to the isa manual,
> > > > and it looks like the order checks out, so
> > > 
> > > Which ISA manual?
> > 
> > For me, isa manual is the above github repo.
> 
> Which commit, though?

mutt won't let me paste a clown face emoticon.

> > > There have been many mutually incompatible ISA string
> > > encoding rules, at least one of them was a change to the extension ordering.
> > > It's not entirely clear what the right answer is here, as we can't really
> > > parse ISA strings without also knowing the version of the ISA manual we're
> > > meant to parse them against.  Maybe we just accept everything?
> > 
> > I don't think accepting everything is the right thing to do. A minimal
> > amount of validation is still needed here, but I think we can deprecate
> > the DT property entirely & make it optional if a new-and-improved way of
> > encoding the in DT is used.
> 
> Sorry, by "everything" I meant "everything that's even been allowed by the
> ISA manual".  Just accetping anything would be bad ;)
> 
> > > IMO it's time to just stop using the ISA string.  It's not a stable
> > > interface, trying to treat it as such just leads to headaches.  We should
> > > just come up with some DT-specific way of encoding whatever HW features are
> > > in question.  Sure it'll be a bit of work to write that all down in the DT
> > > bindings, but it's going to be way less work than trying to keep around all
> > > this ISA string parsing code.
> > 
> > I'm a glutton for punishment, I'll try and come up with some sort of
> > other way to encode this information in DT that requires less parsing
> > and validation. As I said on IRC, something that more resembles:
> > if (of_property_wahtever("riscv,isa-foo")) { do_enable_foo() }
> 
> That seems way simpler to me, thanks!  We'll still need to support whatever
> was here as a legacy format, but at least we won't need to add a bunch of
> new stuff to it -- that's where the parsing starts to get really
> complicated.

Yah, and "deprecated" in dt-schema doesn't actually do anything at the
moment other than let humans know not to use something. Just gonna have
to do some sort of "feature-wise AND" between the existing things we
parse from the isa string & whatever riscv,isa-foo stuff later on.

> FWIW, there's a similar dicussion going on in GCC land right now.
> 
> > > I know I've said the opposite before, but there's just been way too many
> > > breakages here to assume they're going to stop.
> > 
> > :upside_down_face:
> > 
> > Either way, I think these two patches are worth taking in the mean time.
> 
> Yep, just as long as it doesn't break any of the strings that were valid
> according to previous versions of the ISA manual I'm fine with it.

I don't think so. I had been looking around for a supposed order for
where to actually put H, which had been dropped - and the only place I
recall seeing that was Wikipedia - which now seems like an awful
decision since the order there looks kinda off anything I see in dozen
or so spec PDFs I have downloaded. But that's where I got the K & V
ordering from that I now think is wrong (and doesn't match any PDF I
have). The other changes relax rules and add letters so they should be
okay too.

> > > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > > >
> > > > > ---
> > > > >  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > index e80c967a4fa4..b7462ea2dbe4 100644
> > > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > @@ -80,7 +80,7 @@ properties:
> > > > >        insensitive, letters in the riscv,isa string must be all
> > > > >        lowercase to simplify parsing.
> > > > >      $ref: "/schemas/types.yaml#/definitions/string"
> > > > > -    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
> > > > > +    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
> > > > >
> > > > >    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
> > > > >    timebase-frequency: false
> > > > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
