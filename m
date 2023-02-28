Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC47C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blNcInsKmgePr+h3gAwX3HcQcgq4wjRUw19a0trY8Z8=; b=3OYwFsLCiszY3K
	6DKtONRnihnZkudbjr8hLRer5YOixhORZkuGq7DlaFuNTIyy+2dkIgALBFDRhBchUdtdCKUSwM746
	9HB0XlhRW1YUMproIcGPC6Q6rvBuSM6o5J3X5nqoS8LLWyO/3JuqsfWX/UkKMiAwbH89ttd5FaQX8
	NQhRxaHazM7Spd3xxl+INBCoyFq9QQQlK8KamGlUghNgJ9frCW1teyMM2Mkku3mvh9qblpiJJGRln
	NZu2949CvAQq5kZsbQBkihO2JHOSWxrNyWJD5k9NLfkP6W6xuqdEocN4xhRy+c4CviAy7/TwY50Iv
	hmP8WTxI2+MWPEGaM16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1P2-00DZGy-8p; Tue, 28 Feb 2023 14:56:28 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1Oy-00DZDM-Oa
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 14:56:26 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17227cba608so11180928fac.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 06:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5ioO1pIepGfs4SqLPVfsMcAuwOTg1zSb7b6ZK0A88s=;
        b=ih9zEX2/Pn34ikdKo/JQn7w8liAtATo8fgHZctl+7KQMDZILR1+aXqo4lPxnex2hkt
         QHCZrBaphX7ir0n/bkLAzSN4nxlVChOmxZkFgQdd2l1yRBzAngfSpmUqXk49p0xM6tmq
         gFCPuJHHHUexqE4JKXQTtrByaGG8jx/BXtmf2zJJar427PGZsdQtT81xuWkuuWG+80L2
         d8Uw/EuDAW60Wgt+FA4QC7BetTxEucIJaMeHHBPLs3bYtIh1Iwp1WCg5dP/nO7md5AeP
         F7rB4wKDWIihqMn2MxKkVW9OCdKL6Xw/ChgmPEcHDIkEvxiy1nfa07eU1aH3cQrSNHmM
         9GGw==
X-Gm-Message-State: AO0yUKWZFbrDaznssc0H8w/fPi89UO0IRMTen0fET/tULUcSI+1ubaCc
	LDvVFFTiUb8fRo3tCfIx4w==
X-Google-Smtp-Source: AK7set+W45Qn/7/1YbmF3TWAhYItsVzxA7GfCwF6t4mgcwhbvhEsNDIOss2JQCOTYam578+VvcvXBw==
X-Received: by 2002:a05:6870:8a2c:b0:172:7236:a5c0 with SMTP id p44-20020a0568708a2c00b001727236a5c0mr1663030oaq.13.1677596177578;
        Tue, 28 Feb 2023 06:56:17 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w11-20020a9d70cb000000b0068bb3a9e2b9sm3696943otj.77.2023.02.28.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 06:56:17 -0800 (PST)
Received: (nullmailer pid 3231849 invoked by uid 1000);
	Tue, 28 Feb 2023 14:56:16 -0000
Date: Tue, 28 Feb 2023 08:56:16 -0600
From: Rob Herring <robh@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: David.Laight@aculab.com, evan@rivosinc.com, Conor Dooley <conor@kernel.org>, Vineet Gupta <vineetg@rivosinc.com>, heiko@sntech.de, slewis@rivosinc.com, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/6] dt-bindings: Add RISC-V misaligned access
 performance
Message-ID: <20230228145616.GA3205994-robh@kernel.org>
References: <4bd24def02014939a87eb8430ba0070d@AcuMS.aculab.com>
 <mhng-8736b349-e27a-4372-81ca-3a25d2ec1e94@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-8736b349-e27a-4372-81ca-3a25d2ec1e94@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_065624_826317_51112554 
X-CRM114-Status: GOOD (  43.39  )
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

On Thu, Feb 09, 2023 at 08:51:22AM -0800, Palmer Dabbelt wrote:
> On Wed, 08 Feb 2023 04:45:10 PST (-0800), David.Laight@ACULAB.COM wrote:
> > From: Rob Herring
> > > Sent: 07 February 2023 17:06
> > > 
> > > On Mon, Feb 06, 2023 at 12:14:53PM -0800, Evan Green wrote:
> > > > From: Palmer Dabbelt <palmer@rivosinc.com>
> > > >
> > > > This key allows device trees to specify the performance of misaligned
> > > > accesses to main memory regions from each CPU in the system.
> > > >
> > > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > Signed-off-by: Evan Green <evan@rivosinc.com>
> > > > ---
> > > >
> > > > (no changes since v1)
> > > >
> > > >  Documentation/devicetree/bindings/riscv/cpus.yaml | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > index c6720764e765..2c09bd6f2927 100644
> > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > @@ -85,6 +85,21 @@ properties:
> > > >      $ref: "/schemas/types.yaml#/definitions/string"
> > > >      pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
> > > >
> > > > +  riscv,misaligned-access-performance:
> > > > +    description:
> > > > +      Identifies the performance of misaligned memory accesses to main memory
> > > > +      regions.  There are three flavors of unaligned access performance: "emulated"
> > > > +      means that misaligned accesses are emulated via software and thus
> > > > +      extremely slow, "slow" means that misaligned accesses are supported by
> > > > +      hardware but still slower that aligned accesses sequences, and "fast"
> > > > +      means that misaligned accesses are as fast or faster than the
> > > > +      cooresponding aligned accesses sequences.
> > > > +    $ref: "/schemas/types.yaml#/definitions/string"
> > > > +    enum:
> > > > +      - emulated
> > > > +      - slow
> > > > +      - fast
> > > 
> > > I don't think this belongs in DT. (I'm not sure about a userspace
> > > interface either.)
> 
> [Kind of answered below.]
> 
> > > Can't this be tested and determined at runtime? Do misaligned accesses
> > > and compare the performance. We already do this for things like memcpy
> > > or crypto implementation selection.
> 
> We've had a history of broken firmware emulation of misaligned accesses
> wreaking havoc.  We don't run into concrete bugs there because we avoid
> misaligned accesses as much as possible in the kernel, but I'd be worried
> that we'd trigger a lot of these when probing for misaligned accesses.

Then how do you distinguish between emulated and working vs. emulated 
and broken? Sounds like the kernel running things would motivate fixing 
firmware. :) If not, then broken platforms can disable the check with a 
kernel command line flag. 

> 
> > There is also an long discussion about misaligned accesses
> > for loooongarch.
> > 
> > Basically if you want to run a common kernel (and userspace)
> > you have to default to compiling everything with -mno-stict-align
> > so that the compiler generates byte accesses for anything
> > marked 'packed' (etc).
> > 
> > Run-time tests can optimise some hot-spots.
> > 
> > In any case 'slow' is probably pointless - unless the accesses
> > take more than 1 or 2 extra cycles.
> 
> [Also below.]
> 
> > Oh, and you really never, ever want to emulate them.
> 
> Unfortunately we're kind of stuck with this one: the specs used to require
> that misaligned accesses were supported and thus there's a bunch of
> firmwares that emulate them (and various misaligned accesses spread around,
> though they're kind of a mess).  The specs no longer require this support,
> but just dropping it from firmware will break binaries.
> 
> There's been some vague plans to dig out of this, but it'd require some sort
> of firmware interface additions in order to turn off the emulation and
> that's going to take a while.  As it stands we've got a bunch of users that
> just want to know when they can emit misaligned accesses.
> 
> > Technically misaligned reads on (some) x86-64 cpu are slower
> > than aligned ones, but the difference is marginal.
> > I've measured two 64bit misaligned reads every clock.
> > But it is consistently slower by much less than one clock
> > per cache line.
> 
> The "fast" case is explicitly written to catch that flavor of
> implementation.
> 
> The "slow" one is a bit vaguer, but the general idea is to catch
> implementations that end up with some sort of pipeline flush on misaligned
> accesses.  We've got a lot of very small in-order processors in RISC-V land,
> and while I haven't gotten around to benchmarking them all my guess is that
> the spec requirement for support ended up with some simple implementations.

If userspace wants to get into microarchitecture level optimizations, it 
should just look at the CPU model. IOW, use the CPU compatible to infer 
things rather than continuously adding properties in an adhoc manor 
trying to parameterize everything.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
