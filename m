Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F942C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 16:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=304woTyFSjNVpUOxAkvpaHxTS0YTfvqchQ8pgaPy1Y8=; b=xN0ZG5e/gg4cp1bWUaDQEkgDtz
	SPisEbcSfL+bzlh5FQT7fJN3X+LW5dzKyEAR99qaJDNXT0dbxXpaFstP1647+RJZGwS4It6MgvBHa
	itrXUcGYKscPV6A32H3rrVRnyluNyAEjv2cqvQc1tZNdNaJUURwo1BNCAvGmEOJWQHF9XkBJkcPAX
	ImiZDES69qvf3jSxfLqY68XzqwBeFQuSoPuzm7awHMHMLbtorC0qBSM2OGepPqTbqZRYmUA/uSLFe
	YlxAWtLrPqcnfpsPliN7Gx05DEFqFQLmwFR3mEez8kbzJSOFbqxU+W1HoUiwFiwjxumjg/f5dMDjL
	UYRO7Utw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQA8w-002Tkx-1M; Thu, 09 Feb 2023 16:51:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQA8s-002TjW-4P
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 16:51:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id r8so3498194pls.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 08:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFqj+biyDpY9pXqvmkLkzDhno/QTWqjT+mpxmEuFlIE=;
        b=VDTA9tS4LubStVk5KAn8x5cPGoOp99eJz0Kygp3vdTQUGkoiRVuoIS7n9bY8qwL85b
         rjwClE3hOwhV3Of1ekxPfOGBgY5HAqnTT+dM/8+tL0bXG6nJurzutM+JzB9Rn6VyUnEV
         GwSFt5EGOT2WL6Ibb7gaLwB85VqyWQnig8hDaaeXqkLPTTwOmAdcXirHzFpYCrDxtz75
         Bx0weyxL/oQVROo7My9Uxt8p7vvNM9uVFU2UVdz9cdJyTibKGf2ZvKkJiCtheffJdCMT
         IC82A+fCcrwt85502UiQ+XNLw2e+eXNbVDC6A08p023lu6BAWviul2X62bRmJpnUNXM8
         +pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFqj+biyDpY9pXqvmkLkzDhno/QTWqjT+mpxmEuFlIE=;
        b=JNNq7OHznNcyA36hcn72pc0oTUtF0jsdb24bXLPAqPx8mhtuErvlZCAmYmHnL3a+LH
         6LtrUdw/DibcTyrQqQXxulg7nd04USX70+I9zksPcta+HOjks96/n5ua+AWOYYzdfaCZ
         0+OVM0eZenfoaggIOEKWLqVdkH/WaVV25TTQ2m6jaO+BHTk2l6ixYOFahDyIQMX6xUh/
         I2ubAvufiuELrOsRARSRwzDcdJ9C6askRdiaXP2cdVHIm5T9KVzROHJ5jIirJB1ILwnd
         yuG7Lb/lcSjDHPgFpzBevgwKHOyOe1OJDcQR3/vjbGcLDvadC9TD3HEJaxvNJcZDoJiq
         qCWA==
X-Gm-Message-State: AO0yUKWPtQu7JWkMjAhim2oIuhncTwOWkIg48lGccKahrDNkczd+N+Qz
	14trieGnaGUwsN48/ucCTEz8pA==
X-Google-Smtp-Source: AK7set9dXtbFLqR0SLyd6Rfiqg0GWw0+da8IB1XBCGr+lJRziUoT47+K2T9x09vL9nopKJoJT5bMlA==
X-Received: by 2002:a17:90b:1c86:b0:22c:792:d342 with SMTP id oo6-20020a17090b1c8600b0022c0792d342mr13638710pjb.26.1675961483220;
        Thu, 09 Feb 2023 08:51:23 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id jw14-20020a17090b464e00b002338ff973d4sm101213pjb.11.2023.02.09.08.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 08:51:22 -0800 (PST)
Date: Thu, 09 Feb 2023 08:51:22 -0800 (PST)
X-Google-Original-Date: Thu, 09 Feb 2023 08:51:16 PST (-0800)
Subject: RE: [PATCH v2 4/6] dt-bindings: Add RISC-V misaligned access performance
In-Reply-To: <4bd24def02014939a87eb8430ba0070d@AcuMS.aculab.com>
CC: robh@kernel.org, evan@rivosinc.com, Conor Dooley <conor@kernel.org>,
  Vineet Gupta <vineetg@rivosinc.com>, heiko@sntech.de, slewis@rivosinc.com, aou@eecs.berkeley.edu,
  krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: David.Laight@ACULAB.COM
Message-ID: <mhng-8736b349-e27a-4372-81ca-3a25d2ec1e94@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_085126_366799_6C1ABF32 
X-CRM114-Status: GOOD (  33.43  )
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

On Wed, 08 Feb 2023 04:45:10 PST (-0800), David.Laight@ACULAB.COM wrote:
> From: Rob Herring
>> Sent: 07 February 2023 17:06
>>
>> On Mon, Feb 06, 2023 at 12:14:53PM -0800, Evan Green wrote:
>> > From: Palmer Dabbelt <palmer@rivosinc.com>
>> >
>> > This key allows device trees to specify the performance of misaligned
>> > accesses to main memory regions from each CPU in the system.
>> >
>> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> > Signed-off-by: Evan Green <evan@rivosinc.com>
>> > ---
>> >
>> > (no changes since v1)
>> >
>> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 15 +++++++++++++++
>> >  1 file changed, 15 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml
>> b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> > index c6720764e765..2c09bd6f2927 100644
>> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
>> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> > @@ -85,6 +85,21 @@ properties:
>> >      $ref: "/schemas/types.yaml#/definitions/string"
>> >      pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
>> >
>> > +  riscv,misaligned-access-performance:
>> > +    description:
>> > +      Identifies the performance of misaligned memory accesses to main memory
>> > +      regions.  There are three flavors of unaligned access performance: "emulated"
>> > +      means that misaligned accesses are emulated via software and thus
>> > +      extremely slow, "slow" means that misaligned accesses are supported by
>> > +      hardware but still slower that aligned accesses sequences, and "fast"
>> > +      means that misaligned accesses are as fast or faster than the
>> > +      cooresponding aligned accesses sequences.
>> > +    $ref: "/schemas/types.yaml#/definitions/string"
>> > +    enum:
>> > +      - emulated
>> > +      - slow
>> > +      - fast
>>
>> I don't think this belongs in DT. (I'm not sure about a userspace
>> interface either.)

[Kind of answered below.]

>> Can't this be tested and determined at runtime? Do misaligned accesses
>> and compare the performance. We already do this for things like memcpy
>> or crypto implementation selection.

We've had a history of broken firmware emulation of misaligned accesses 
wreaking havoc.  We don't run into concrete bugs there because we avoid 
misaligned accesses as much as possible in the kernel, but I'd be 
worried that we'd trigger a lot of these when probing for misaligned 
accesses.

> There is also an long discussion about misaligned accesses
> for loooongarch.
>
> Basically if you want to run a common kernel (and userspace)
> you have to default to compiling everything with -mno-stict-align
> so that the compiler generates byte accesses for anything
> marked 'packed' (etc).
>
> Run-time tests can optimise some hot-spots.
>
> In any case 'slow' is probably pointless - unless the accesses
> take more than 1 or 2 extra cycles.

[Also below.]

> Oh, and you really never, ever want to emulate them.

Unfortunately we're kind of stuck with this one: the specs used to 
require that misaligned accesses were supported and thus there's a bunch 
of firmwares that emulate them (and various misaligned accesses spread 
around, though they're kind of a mess).  The specs no longer require 
this support, but just dropping it from firmware will break binaries.

There's been some vague plans to dig out of this, but it'd require some 
sort of firmware interface additions in order to turn off the emulation 
and that's going to take a while.  As it stands we've got a bunch of 
users that just want to know when they can emit misaligned accesses.

> Technically misaligned reads on (some) x86-64 cpu are slower
> than aligned ones, but the difference is marginal.
> I've measured two 64bit misaligned reads every clock.
> But it is consistently slower by much less than one clock
> per cache line.

The "fast" case is explicitly written to catch that flavor of 
implementation.

The "slow" one is a bit vaguer, but the general idea is to catch 
implementations that end up with some sort of pipeline flush on 
misaligned accesses.  We've got a lot of very small in-order processors 
in RISC-V land, and while I haven't gotten around to benchmarking them 
all my guess is that the spec requirement for support ended up with some 
simple implementations.

FWIW: I checked the c906 RTL and it's setting some exception-related 
info on misaligned accesses, but I'd need to actually benchmark on to 
know for sure and they're kind of a headache to deal with.

>
> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
