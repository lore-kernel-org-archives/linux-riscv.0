Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2966C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 23:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=t1azhCi02E8nuA3vFXymk0n9r49gqYZXlf4Su8Jtbq8=; b=OTK942Z7Y7InCKgeJ9aHxynTrx
	+jAz2+8AyaLR8HqDAEJG9lRVvn/LqGHaRQsbR1g32/c0gnRRAmuvKxJ3GjM/WwMIAlQqLb1/Dp8O6
	zz+SEuRnDrBmFBAT9XJqWYr2RWzWl2P0Iuop/vUo95DAx82Ov9tgP9aRZ562XPF232ZKqk0mX0Bcn
	ep2IRBd0iMICmX1DdqfqvLYKT64MjW/wJRCrCaFDXoAzCT26dnuzBskEQ+c9HraZxv2/FHa8Mcj4e
	CCl34Xm3ac226zLo5xeeqQpoTYzC87d5ctvkIHvBQXw/ZojvW/Upf71fWPCKo7wrG4B5+k5Y33NmU
	gcUvZ5xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oznkb-004owm-Ki; Mon, 28 Nov 2022 23:41:25 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oznkX-004ovi-MF
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 23:41:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id w37so6250056pga.5
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 15:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQvlx+1Mw3aNuJTA2b+/LRz8ikSIvWj9nKVnNpG8ijo=;
        b=uV0AGKeAUIsWOqhlt5UuZ8kTLBjmmuQI+QG30kdN2Vvo7an9ynfTxtYC3V9hOTue1Z
         mTHRDJJHY9e244Rn8QR+HFYm19V0lKYZ4AkO2PDJpMncIo9ykS666xf4rHkQpTMsDoUm
         mlpG5zo8yMsfnh5jz8+b7gd36tTCeu+akBDTlPERR1Ggs4ld1vY1DEkCiuz6lzn2zxkQ
         G5yFedaJyIhbk6DBeE6wobCcd+d+ku8l4GzO6/MUzL+ReIvlbnRV+14NbjvyUhERptyJ
         LFx1gl5mXs2HSLN5yJBSCyf1/1YIAib3iqije43C9hJUNANDG6wIdYfHZTeWOSP+BH5T
         aYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQvlx+1Mw3aNuJTA2b+/LRz8ikSIvWj9nKVnNpG8ijo=;
        b=hdrk5qm3SPrrTudBvexKWGDKSyKXkqV8ad8HIe7dNN6uZk0fGlr8Kt6UVGSA9qnX8x
         lJKLWGiZeZ94+WqQ7Inj3d5SzW33J13uKn5yo3/nCu2r7OeYUoBygtfCJCJOoMv76R2I
         uDdIpssrvSI0NhoSrqIz4OGzZhMbSkBl/hKKLKynYqathd7oHkbjwwcDTRMjQkgn2+Mc
         uIRspjHdZMkmZOamAVFxlnwzVvbK33Mdf6rZZAddxGNP4mLtWtJGgjYt9TpdIlY+Q9j4
         cqfETUYjSHFSrnhi/SIZZqxtUUSfcPzqwg3wlGEWXElbJKpBUo1LGb/Y1omxtg0mT4/4
         NE5g==
X-Gm-Message-State: ANoB5pn9CZYiSmMWmQOIErRU8kWipdK9jbCqPe7r+iZHY0AIz3i/fK+j
	xtk92FoKXscLMcN+7WvM683k3Q==
X-Google-Smtp-Source: AA0mqf7iqQc7XiA9Gtrgo5HG5Kpi2s1j0qBOVrnj75f4/YdH7FPftm9bTLLH6l19kQQt4C3qgHk7qg==
X-Received: by 2002:a63:e411:0:b0:45f:b2a7:2659 with SMTP id a17-20020a63e411000000b0045fb2a72659mr30146688pgi.132.1669678880217;
        Mon, 28 Nov 2022 15:41:20 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z13-20020a170903018d00b0018853416bbcsm9484405plg.7.2022.11.28.15.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 15:41:19 -0800 (PST)
Date: Mon, 28 Nov 2022 15:41:19 -0800 (PST)
X-Google-Original-Date: Mon, 28 Nov 2022 15:41:11 PST (-0800)
Subject: Re: [PATCH 2/2] dt-bindings: riscv: fix single letter canonical order
In-Reply-To: <Y4UJQYgCpnZJji9o@spud>
CC: heiko@sntech.de, linux-riscv@lists.infradead.org,
  Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, ajones@ventanamicro.com, guoren@kernel.org,
  devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-8141aa74-17c6-4692-a658-b5e4faad0c14@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_154121_748002_629C6172 
X-CRM114-Status: GOOD (  54.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 28 Nov 2022 11:17:21 PST (-0800), Conor Dooley wrote:
> On Mon, Nov 28, 2022 at 10:12:17AM -0800, Palmer Dabbelt wrote:
>> On Mon, 28 Nov 2022 10:08:05 PST (-0800), Conor Dooley wrote:
>> > On Mon, Nov 28, 2022 at 09:41:03AM -0800, Palmer Dabbelt wrote:
>> > > On Thu, 24 Nov 2022 05:42:20 PST (-0800), heiko@sntech.de wrote:
>> > > > Am Donnerstag, 24. November 2022, 14:04:41 CET schrieb Conor Dooley:
>> > > > > I used the wikipedia table for ordering extensions when updating the
>> > > > > pattern here in foo.
>> > > >
>> > > > 	    ^ foo? :-)
>> > > >
>> > > > > Unfortunately that table did not match canonical order, as defined by
>> > > > > the RISC-V ISA Manual, which defines extension ordering in (what is
>> > > > > currently) Table 41, "Standard ISA extension names". Fix things up by
>> > > > > re-sorting v (vector) and adding p (packed-simd) & j (dynamic
>> > > > > languages). The e (reduced integer) and g (general) extensions are still
>> > > > > intentionally left out.
>> > > > >
>> > > > > Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
>> > > > > Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
>> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> > > >
>> > > > So I have compared the new pattern to the isa manual,
>> > > > and it looks like the order checks out, so
>> > >
>> > > Which ISA manual?
>> >
>> > For me, isa manual is the above github repo.
>>
>> Which commit, though?
>
> mutt won't let me paste a clown face emoticon.
>
>> > > There have been many mutually incompatible ISA string
>> > > encoding rules, at least one of them was a change to the extension ordering.
>> > > It's not entirely clear what the right answer is here, as we can't really
>> > > parse ISA strings without also knowing the version of the ISA manual we're
>> > > meant to parse them against.  Maybe we just accept everything?
>> >
>> > I don't think accepting everything is the right thing to do. A minimal
>> > amount of validation is still needed here, but I think we can deprecate
>> > the DT property entirely & make it optional if a new-and-improved way of
>> > encoding the in DT is used.
>>
>> Sorry, by "everything" I meant "everything that's even been allowed by the
>> ISA manual".  Just accetping anything would be bad ;)
>>
>> > > IMO it's time to just stop using the ISA string.  It's not a stable
>> > > interface, trying to treat it as such just leads to headaches.  We should
>> > > just come up with some DT-specific way of encoding whatever HW features are
>> > > in question.  Sure it'll be a bit of work to write that all down in the DT
>> > > bindings, but it's going to be way less work than trying to keep around all
>> > > this ISA string parsing code.
>> >
>> > I'm a glutton for punishment, I'll try and come up with some sort of
>> > other way to encode this information in DT that requires less parsing
>> > and validation. As I said on IRC, something that more resembles:
>> > if (of_property_wahtever("riscv,isa-foo")) { do_enable_foo() }
>>
>> That seems way simpler to me, thanks!  We'll still need to support whatever
>> was here as a legacy format, but at least we won't need to add a bunch of
>> new stuff to it -- that's where the parsing starts to get really
>> complicated.
>
> Yah, and "deprecated" in dt-schema doesn't actually do anything at the
> moment other than let humans know not to use something. Just gonna have
> to do some sort of "feature-wise AND" between the existing things we
> parse from the isa string & whatever riscv,isa-foo stuff later on.

I suppose this is more of a Rob question, but could we just make the DT 
bindings match the current ISA manual's rules and then have the kernel's 
"riscv,isa" string parser accept more orderings to remain compatible?

Sort of a API vs ABI stability question, but for DTB and bindngs.

>> FWIW, there's a similar dicussion going on in GCC land right now.
>>
>> > > I know I've said the opposite before, but there's just been way too many
>> > > breakages here to assume they're going to stop.
>> >
>> > :upside_down_face:
>> >
>> > Either way, I think these two patches are worth taking in the mean time.
>>
>> Yep, just as long as it doesn't break any of the strings that were valid
>> according to previous versions of the ISA manual I'm fine with it.
>
> I don't think so. I had been looking around for a supposed order for
> where to actually put H, which had been dropped - and the only place I
> recall seeing that was Wikipedia - which now seems like an awful
> decision since the order there looks kinda off anything I see in dozen
> or so spec PDFs I have downloaded. But that's where I got the K & V
> ordering from that I now think is wrong (and doesn't match any PDF I
> have). The other changes relax rules and add letters so they should be
> okay too.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

as it sounds like there aren't even any fixed rules, so I guess none of 
this even matters?

>
>> > > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>> > > >
>> > > > > ---
>> > > > >  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
>> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > > > >
>> > > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> > > > > index e80c967a4fa4..b7462ea2dbe4 100644
>> > > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
>> > > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> > > > > @@ -80,7 +80,7 @@ properties:
>> > > > >        insensitive, letters in the riscv,isa string must be all
>> > > > >        lowercase to simplify parsing.
>> > > > >      $ref: "/schemas/types.yaml#/definitions/string"
>> > > > > -    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
>> > > > > +    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
>> > > > >
>> > > > >    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>> > > > >    timebase-frequency: false
>> > > > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
