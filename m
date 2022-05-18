Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3CFC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/bxZfyoNBmel79ofzgYmgmqxTjvZZnLeyTiFPawruQ=; b=xUd9QBgspZ+5FG
	RS1g3ko4DRPz2iv2lTSxaCjYkcm9bQufR2N52CrRxEJxqJbHTRGnMOOFH8NnvDsXS8Qp2g2+PwSge
	p6OEQOZP45xaV7eZIussww5hur4/WNe5McHRg25pm9qQALo1E6cTXSWEhGu4JhG1zic3EbLfGacyn
	FtSLeSssaOPIPbg7aASzuoXLdOiGCvqS1eDi+acusUtFvmzY2LcYmhVTAvfwuEjGTvwi8vBo/cRST
	iNChMd0owovPRd2BqUcGmMXDEKssVIAx5TAuMrdIeYJ+KKJFUsZumv9yYhHbthXCePLmfDOYHMwgm
	BhujjGXbbmAIuNC4m7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrEx3-000Zie-UE; Wed, 18 May 2022 08:22:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrEwz-000ZZK-W6
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 08:22:36 +0000
Received: by mail-wr1-x429.google.com with SMTP id t6so1563487wra.4
 for <linux-riscv@lists.infradead.org>; Wed, 18 May 2022 01:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=trjJ+b0UjHlSF876BjNjmr4z+E9qBj2MQAPe6nMnBlA=;
 b=kFQL87UQWcFbmG99QsHcYpdeBr7/o0aCWLZs4cACELBQusFJkwnRf0pnFO4BDWplkx
 cDH2SaMQtqvmmKd7YarcDr6MKTgLipa+MYrk5MqwCbBnMNf0NtADKSO1xlrn93fWfEL/
 kOPiVL45nY/gbVwf2E1xkzd1+wEqe/kxQhllGmASlFvU84YmE2Hylbv0Gk16JInDXOvT
 cqqGAdCBMYABt4E8pwn6a5vPq5uFMzhvZn8SBBEMtLTWXJxLINkJVYQgvss+bOHe0FgK
 AWYyC7JcIRMSt2qMLbJGKE/3FiNuDammjR3pelAzq11lv/7jtKbhXzmbP7fWxM5jPlte
 zRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=trjJ+b0UjHlSF876BjNjmr4z+E9qBj2MQAPe6nMnBlA=;
 b=DhVgsVbsWPfMjbRJ5Z5ni9IkliwATv/oUJd1/qBAQMO42NVHyLsErPCGzXRWe+paYC
 DT/U8JTa0mCaXmWtqq918N6+CqriNT3OJdgKz/GTW52pTatFThvgFF/XorqTWY9+6GH4
 ZqpleREzicRhRqL7loOesAdCgDFnFrCLazkWlt4LWeglxY6YQe0PaJ7zVuIqxUJNdssk
 92E+aqmq1mXzX/GsSVMQxe6gjnZlRApU0LB9P8pChk5V/DpbAIJPHOCoB5+xWvuecvht
 I/mbc14XeWTWCZeky1n066hwI9cJtkXbsL/4cwA3GDnO/fimtavh4iI6U5pixVggO76j
 Y+4w==
X-Gm-Message-State: AOAM532fVxj3npBW7vbIbwGHK9xKaGFRjQvSPyzCpxdVco901nccbe2Z
 iM4PseN/q62i2dZZjCz418w9m2ZEwfCPAuT7QzjIeQ==
X-Google-Smtp-Source: ABdhPJyR3TK3AZ6vFSIVdWlbdx57iSv9BfywlkDpHw7WENtz/yeCErgNkkD7SzI8rPZAtra5UA7HzAA1/Ep30orloL4=
X-Received: by 2002:a5d:618f:0:b0:20c:ffa0:95a8 with SMTP id
 j15-20020a5d618f000000b0020cffa095a8mr15420395wru.306.1652862148610; Wed, 18
 May 2022 01:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220511214132.2281431-1-heiko@sntech.de>
 <20220511214132.2281431-2-heiko@sntech.de>
 <20220518002529.GA1928329-robh@kernel.org>
In-Reply-To: <20220518002529.GA1928329-robh@kernel.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 18 May 2022 10:22:17 +0200
Message-ID: <CAAeLtUBLpDHeJHfPtaUb_OLZb_6cUQa1Z_F+06pkdJMSHtWrfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: document cbom-block-size
To: Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wefu@redhat.com, guoren@kernel.org, atishp@atishpatra.org, 
 anup@brainfault.org, mick@ics.forth.gr, samuel@sholland.org, 
 cmuellner@linux.com, krzk+dt@kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_012234_127506_AAB41088 
X-CRM114-Status: GOOD (  21.65  )
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

+David Kruckemyer (who is chairing the CMO task-group within RVI).

On Wed, 18 May 2022 at 02:25, Rob Herring <robh@kernel.org> wrote:
>
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
>
> > +    description:
> > +      Blocksize in bytes for the Zicbom cache operations. The block
> > +      size is a property of the core itself and does not necessarily
> > +      match other software defined cache sizes.
>
> What about hardware defined cache sizes? I'm scratching my head as to
> what a 'software defined cache size' is.

This seems to be a misnomer, as the specification doesn't use the term
and rather talks about the "size of a cache block for [operation
name]".

There are currently two such 'operation sizes' discoverable by software:
- size of the cache block for management and prefetch instructions
- size of the cache block for zero instructions

For whatever it's worth, cache operations in RISC-V attempt to
disassociate the underlying hardware cache geometry from software.
See https://github.com/riscv/riscv-CMOs/blob/master/specifications/cmobase-v1.0.1.pdf
for the CMO specification, and the discoverable parameters are listed
in section 2.7.

Philipp.

> > +
> >    riscv,isa:
> >      description:
> >        Identifies the specific RISC-V instruction set architecture
> > --
> > 2.35.1
> >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
