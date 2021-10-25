Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF3CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 06:08:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D1F56023D
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 06:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D1F56023D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPHJrF/iVbIbOxUd75zKvPT3vWcp/EudnyOXfpG+vKw=; b=yqWV+mWIk1AL6b
	W1DI1MEHxQJaS3PVbhqOZRy2EpQptFe948235f1Szy4JDxRjT4J7sLu5PYRsfM+3CDFI8YrDtxcD/
	pVgjTttPRe+rNL8aABqqV8aRiTH2871SEkXY+8CVeZRTupw3VNXNpTcCedruBjTkZDFgg/4A0YCdw
	fC/yuVgHmad/bGI4VCr7fh+zuk5Pvtb6CJMztCs9fOY9SI4qhmkDxhNqh6LKn6KKzzkpVkcKB08SW
	bYR5VIt0wKYGTnlrAXrUCOAVUUYrX028+RrbtZFD33o8u3xCyVhPVmRQQTBKzqvu2YPy9DVHwFsaO
	o4tcd1h5pur6YfmdRdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1metA5-00FMhH-RD; Mon, 25 Oct 2021 06:08:45 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1metA2-00FMgW-JI
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 06:08:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u18so7267323wrg.5
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 23:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LGkRycj0d3BgvWsn3mqfLGnFcKdGcdIEmfaEWsojsoA=;
 b=RutRlINtDvCq2A2xg1lqlbsaVbTYFWtCjSCs91oJFS7J5ijaZ0/KKXPdEnEMmXdOp9
 ra8YOmlmjCYB+l3ELTTby0zgtclDNXgjstjLPujDO16qXR3uW0pQCzQxQ6Brfj9vHd+S
 r1q4tqd7x9kXx6yqtBIZxxEg+rfxC37SN0S9jrr8QbMtOssruTYELFGadeQXVKcvD6WP
 cf/F3dx92bKkxFrn7KgYlp1vWO+M/XmvBZ4ejnwuJ7a2Qc2jNqpG4YErx77GaRqHnXv5
 iyBcEluhcn0Cu+vW1DvKO6fdpwbFoAXYnIzFJcj5RPdFhD/1RbcT2fwHhqT6pm8X9aGI
 GKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LGkRycj0d3BgvWsn3mqfLGnFcKdGcdIEmfaEWsojsoA=;
 b=eMGnXdvHWjK0PXZnSXwZW4e80KzGh2L0wacZPjjK2QJI+voIGU1AY/QudXrUunjuRZ
 9f84UfvBXNziIfHQiGR2+KxBCajf8i9kcfwZLbIsgF32DFS7IcwqpUAkwf+1Uh/WCD0a
 0vay9LFbBPdjzoqoiBqTu9S9lyazgt1Op1RF8Yw4scBUmZ7naoPmsj5A7yxndGpbLwLA
 qE7Rcunh6pC+TarDOUMxo7WWQaYj8EFDDf1AEy+4h3ksFLXk0bpKnJMnDiMDXvXfBkdk
 Y0S9tWIw2pt53SBY7DVbB2c/lvcW69bEg7oiXW/cxpB1+o8QI/gqk9S7Zko9apxYGzfI
 Jq2w==
X-Gm-Message-State: AOAM532rnJVD6r7f74HAeYD7ACr65dKEL5dTt+RXZpoqt5K2KJR9DCxt
 QcKT7urUKrVTmPLZUOC1p+1EAL9V/W6upGJAWdOGXw==
X-Google-Smtp-Source: ABdhPJxo61B3UhJ1Hqmx+YwhbQWISYFBHmDSQ2UBVE+fx6sumH0Qh2AtVNl9yTqySp7SN0F9ztWiKNp4F8iXtmXvoIM=
X-Received: by 2002:a5d:5849:: with SMTP id i9mr21493562wrf.331.1635142119602; 
 Sun, 24 Oct 2021 23:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <20211025040607.92786-2-wefu@redhat.com>
 <CAAhSdy1N-UQFnbFc7PSwf62y=gbvX7pK=vwUaG8m_KzdWx3AgQ@mail.gmail.com>
 <CAJF2gTT9T-TwTmGsfDH0Y05LO6dF6nGUUSGZW=RSackM0fUUyg@mail.gmail.com>
In-Reply-To: <CAJF2gTT9T-TwTmGsfDH0Y05LO6dF6nGUUSGZW=RSackM0fUUyg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Oct 2021 11:38:27 +0530
Message-ID: <CAAhSdy1ZuQyWdVY5dmrnNVHe3oOYxhieW1upAhbnDvuxNL=YyA@mail.gmail.com>
Subject: Re: [RESEND PATCH V3 1/2] dt-bindings: riscv: add mmu-supports-svpbmt
 for Svpbmt
To: Guo Ren <guoren@kernel.org>
Cc: Wei Fu <wefu@redhat.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_230842_706545_BA37CD89 
X-CRM114-Status: GOOD (  25.10  )
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

On Mon, Oct 25, 2021 at 11:30 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Mon, Oct 25, 2021 at 12:17 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Oct 25, 2021 at 9:36 AM <wefu@redhat.com> wrote:
> > >
> > > From: Wei Fu <wefu@redhat.com>
> > >
> > > Previous patch has added svpbmt in arch/riscv and changed the
> > > DT mmu-type. Update dt-bindings related property here.
> > >
> > > Signed-off-by: Wei Fu <wefu@redhat.com>
> > > Co-developed-by: Guo Ren <guoren@kernel.org>
> > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > Cc: Anup Patel <anup@brainfault.org>
> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > index e534f6a7cfa1..76f324d85e12 100644
> > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > @@ -59,6 +59,11 @@ properties:
> > >        - riscv,sv48
> > >        - riscv,none
> > >
> > > +  mmu-supports-svpbmt:
> > > +    description:
> > > +      Describes the CPU's mmu-supports-svpbmt support
> > > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> >
> > There were various proposals from different folks in the previous
> > email threads.
> >
> > I think most of us were converging on:
> > 1) Don't modify "mmu-type" DT property for backward
> > compatibility
> I agree. FuWei has followed that in the patch.
>
> > 2) Add boolean DT property "riscv,svpmbt" under
> > "mmu" child DT node of each CPU DT node. Same will apply
> > to boolean DT property "riscv,svnapot" as well.
> We have various proposals here:
> @Philipp suggests firstly, but break the backward compatibility:
>  cpu@0 {
>     ...
>     mmu {
>        type = "riscv,sv39";
>        supports-svpbmt;
>        supports-svnapot;
>     };
>
> @guoren suggests reusing the mmu-type, but seems not clean.
> cpu@0 {
>    ...
>    mmu-type = "riscv,sv39,svpbmt,svnapot";
>
>
> @fuwei suggests simple name property in CPU section:
> cpu@0 {
>    ...
>    mmu-type = "riscv,sv39";
>    mmu-supports-svpbmt;
>    mmu-supports-svnapot;
>
> @Anup suggests:
> cpu@0 {
>    ...
>     mmu-type = "riscv,sv39";
>     mmu {
>        supports-svpbmt;
>        supports-svnapot;
>     };
>
> Any other suggestions? Thx.
>
> >
> > We also have bitmanip and vector broken down into smaller
> > extensions so grouping related extensions as separate DT node
> > under each CPU node will be more readable and easy to parse.
> Do you mean combine mmu extensions with them together?
> cpu@0 {
>     ...
>     extensions {
>         supports-svpbmt;
>         supports-svnapot;
>         supports-bitmanip;
>         supports-vector-v0p7;
>     };

I meant separate group nodes like this:

cpu@0 {
    ...
    mmu-type = "riscv,sv39";
    mmu { /* Only considered when mmu-type is present and mmu-type !=
"riscv,sv32" */
        riscv,svpmbt;
        riscv,svnapot;
    };

    bitmanip { /* Only considered when "B" is present in the ISA string */
        ...
    };

   vector { /* Only considered when "V" is present in the ISA string */
       ...
   };
    ...
};

Regards,
Anup

>
> >
> > Regards,
> > Anup
> >
> > > +
> > >    riscv,isa:
> > >      description:
> > >        Identifies the specific RISC-V instruction set architecture
> > > --
> > > 2.25.4
> > >
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
