Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3DAC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 05:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXivB2aHBuPlJ2QF/aXDSrMjXzE5JPKwy2DskjTPkK0=; b=4wWuRy15qfAqhj
	8aonW2a8fEdVD6oSKmqhccoVDOn1U+1JAEOSa9aiu3FbLv8D0T1LLa6h+UShWNUzu3GkjKmdA8kGC
	gPpPRAzR/29w3G1aFc27PVlcAoHbs9IxM1VvMA0n5zjSdVPhuWvmsUnJo3ttht28qnF5DYJX8yk70
	JL5D2Xo0/3TJENNvZIDGhGiHaDGio9XZC3Mgl1Tn2nbujr7UZDhU5P7Qe8GOB0W4T5Vy2OPWIsSZc
	X2PfuW0EeYpHHEeC0bNj8+i1JV7MKX2NdFVt0GGD5E+UgZWWTkl0ZspSetx4RE1bL5e0bG/xaXUMU
	RR+5N2qyCOT4FQzkhyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozt1c-006Mmk-Ls; Tue, 29 Nov 2022 05:19:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozt1Y-006MkO-L9
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 05:19:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so13425313wmb.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 21:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FpUmcQBjCTcWeBttLoCWVwQC7ryZAPTXKUDNedSR73o=;
        b=TU1BE4d+8d8hQDYIKSlLlx7RUly2TYm2sJ028YYnkb6ZIcTOB59CIttBGoWjSoTt06
         Fs1Ek4mCnldzkYyQZtqehRmAvCdpxZ47O8a/Wt+dXP4BgrBDP+uE4OIJMF1+2FfCIkYf
         2cX1Q49OZBk2H1+jD8M+dbyodSaezg0/RjedMXGV7EY3c57wDJHoFvq4YW/qJhkB5B7z
         xyZNECEsQruSVhhr+Agn6SMNaf+l2bSZcJDTDteEC296ctOyJYFqNk8Zv9SY/hDRqJCT
         NiZ4xFyzX4mQeqsZjmhipSDiurRx1p9XHM/4VVzuss1X1lcFgnh4XPmLhstNg+txakQk
         yzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpUmcQBjCTcWeBttLoCWVwQC7ryZAPTXKUDNedSR73o=;
        b=L5Aau0/cCQAS8F7jhIXZL+W/Eu0bl5ot4K6GDSobDHO3MRuO8Bggz7ZgFhRPFVdMnS
         BIwce0aenCANmqv5+L7/jyY476/CIc1OxHFxaNe6wd7n6HAx68UMze9FpL6ApW0Sjs24
         zjIwbYr+8yqV/1qW1jz4oJUisW5r6DWKaElzJwBQLO71F7GTvsBBuhNx5D+4Oq32z0FU
         OuEfm8ed2zURB66ZiQ+/ACrQCrnU9q49QCY9Y24CdNQkHyuFRcZOWX2yQGsYIwAPox3R
         nYnLFv6PzTpXFbE58BCACeCZV+wbLZZqXHLDgdsV8ZBXDYEjihxs2qDxxHf9MEq/P127
         kI5A==
X-Gm-Message-State: ANoB5pm9vIf+G+ztuQ/O56lMMlhPFV1oZSnIVBKz5zPulw0W9Bd785Bj
	qj5N43Fuf3/BMsEDQEYIWYplfA==
X-Google-Smtp-Source: AA0mqf4Ty4v0djT/usoo7920TxGtt5C2ytOH086uEUEAyBmdTpf/mnfQxF8Pe63RRJSSjspBPpcgcA==
X-Received: by 2002:a05:600c:4f90:b0:3c1:aeb9:29b6 with SMTP id n16-20020a05600c4f9000b003c1aeb929b6mr26171384wmq.97.1669699153764;
        Mon, 28 Nov 2022 21:19:13 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003b4ff30e566sm967816wms.3.2022.11.28.21.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 21:19:13 -0800 (PST)
Date: Tue, 29 Nov 2022 06:19:11 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, heiko@sntech.de,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	guoren@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sunil V L <sunilvl@ventanamicro.com>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: fix single letter canonical order
Message-ID: <20221129051911.5xetsgfukxiljuhf@kamzik>
References: <Y4UJQYgCpnZJji9o@spud>
 <mhng-8141aa74-17c6-4692-a658-b5e4faad0c14@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-8141aa74-17c6-4692-a658-b5e4faad0c14@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_211916_725042_8117A83A 
X-CRM114-Status: GOOD (  60.90  )
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

On Mon, Nov 28, 2022 at 03:41:19PM -0800, Palmer Dabbelt wrote:
> On Mon, 28 Nov 2022 11:17:21 PST (-0800), Conor Dooley wrote:
> > On Mon, Nov 28, 2022 at 10:12:17AM -0800, Palmer Dabbelt wrote:
> > > On Mon, 28 Nov 2022 10:08:05 PST (-0800), Conor Dooley wrote:
> > > > On Mon, Nov 28, 2022 at 09:41:03AM -0800, Palmer Dabbelt wrote:
> > > > > On Thu, 24 Nov 2022 05:42:20 PST (-0800), heiko@sntech.de wrote:
> > > > > > Am Donnerstag, 24. November 2022, 14:04:41 CET schrieb Conor Dooley:
> > > > > > > I used the wikipedia table for ordering extensions when updating the
> > > > > > > pattern here in foo.
> > > > > >
> > > > > > 	    ^ foo? :-)
> > > > > >
> > > > > > > Unfortunately that table did not match canonical order, as defined by
> > > > > > > the RISC-V ISA Manual, which defines extension ordering in (what is
> > > > > > > currently) Table 41, "Standard ISA extension names". Fix things up by
> > > > > > > re-sorting v (vector) and adding p (packed-simd) & j (dynamic
> > > > > > > languages). The e (reduced integer) and g (general) extensions are still
> > > > > > > intentionally left out.
> > > > > > >
> > > > > > > Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
> > > > > > > Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
> > > > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > >
> > > > > > So I have compared the new pattern to the isa manual,
> > > > > > and it looks like the order checks out, so
> > > > >
> > > > > Which ISA manual?
> > > >
> > > > For me, isa manual is the above github repo.
> > > 
> > > Which commit, though?
> > 
> > mutt won't let me paste a clown face emoticon.
> > 
> > > > > There have been many mutually incompatible ISA string
> > > > > encoding rules, at least one of them was a change to the extension ordering.
> > > > > It's not entirely clear what the right answer is here, as we can't really
> > > > > parse ISA strings without also knowing the version of the ISA manual we're
> > > > > meant to parse them against.  Maybe we just accept everything?
> > > >
> > > > I don't think accepting everything is the right thing to do. A minimal
> > > > amount of validation is still needed here, but I think we can deprecate
> > > > the DT property entirely & make it optional if a new-and-improved way of
> > > > encoding the in DT is used.
> > > 
> > > Sorry, by "everything" I meant "everything that's even been allowed by the
> > > ISA manual".  Just accetping anything would be bad ;)
> > > 
> > > > > IMO it's time to just stop using the ISA string.  It's not a stable
> > > > > interface, trying to treat it as such just leads to headaches.  We should
> > > > > just come up with some DT-specific way of encoding whatever HW features are
> > > > > in question.  Sure it'll be a bit of work to write that all down in the DT
> > > > > bindings, but it's going to be way less work than trying to keep around all
> > > > > this ISA string parsing code.
> > > >
> > > > I'm a glutton for punishment, I'll try and come up with some sort of
> > > > other way to encode this information in DT that requires less parsing
> > > > and validation. As I said on IRC, something that more resembles:
> > > > if (of_property_wahtever("riscv,isa-foo")) { do_enable_foo() }
> > > 
> > > That seems way simpler to me, thanks!  We'll still need to support whatever
> > > was here as a legacy format, but at least we won't need to add a bunch of
> > > new stuff to it -- that's where the parsing starts to get really
> > > complicated.

While it's easy for Linux to add new DT nodes when new extension support is
added, it's not so easy to add new ACPI objects. The current plan for ACPI
is to use the ISA string[1]. With that in mind, I think Linux should
continue to parse the string for DT as well.

[1] https://docs.google.com/document/d/1LlCefO_0GQ_7Tf3lzfMPETEfMlGo2FfLRJ09IMqJKEk/edit

> > 
> > Yah, and "deprecated" in dt-schema doesn't actually do anything at the
> > moment other than let humans know not to use something. Just gonna have
> > to do some sort of "feature-wise AND" between the existing things we
> > parse from the isa string & whatever riscv,isa-foo stuff later on.
> 
> I suppose this is more of a Rob question, but could we just make the DT
> bindings match the current ISA manual's rules and then have the kernel's
> "riscv,isa" string parser accept more orderings to remain compatible?
> 
> Sort of a API vs ABI stability question, but for DTB and bindngs.
> 
> > > FWIW, there's a similar dicussion going on in GCC land right now.
> > > 
> > > > > I know I've said the opposite before, but there's just been way too many
> > > > > breakages here to assume they're going to stop.
> > > >
> > > > :upside_down_face:
> > > >
> > > > Either way, I think these two patches are worth taking in the mean time.
> > > 
> > > Yep, just as long as it doesn't break any of the strings that were valid
> > > according to previous versions of the ISA manual I'm fine with it.
> > 
> > I don't think so. I had been looking around for a supposed order for
> > where to actually put H, which had been dropped - and the only place I
> > recall seeing that was Wikipedia - which now seems like an awful
> > decision since the order there looks kinda off anything I see in dozen
> > or so spec PDFs I have downloaded. But that's where I got the K & V
> > ordering from that I now think is wrong (and doesn't match any PDF I
> > have). The other changes relax rules and add letters so they should be
> > okay too.
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> as it sounds like there aren't even any fixed rules, so I guess none of this
> even matters?

IMHO, we should try to get the spec changed to say that the only order
which matters is that single letter extensions come first (in any order)
and then multi-letter extensions come after (in any order). Parsing
becomes simple and we can publish the string in proc in any order too,
maybe preferring alphabetical order for neatness.

Thanks,
drew

> 
> > 
> > > > > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > > > > >
> > > > > > > ---
> > > > > > >  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > index e80c967a4fa4..b7462ea2dbe4 100644
> > > > > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > > > @@ -80,7 +80,7 @@ properties:
> > > > > > >        insensitive, letters in the riscv,isa string must be all
> > > > > > >        lowercase to simplify parsing.
> > > > > > >      $ref: "/schemas/types.yaml#/definitions/string"
> > > > > > > -    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
> > > > > > > +    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
> > > > > > >
> > > > > > >    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
> > > > > > >    timebase-frequency: false
> > > > > > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
