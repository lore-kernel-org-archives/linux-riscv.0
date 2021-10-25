Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9998C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 06:01:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99D9560F4F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 06:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99D9560F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/V+rjI1Jt+CKNhoM5XMCV2FE/LvDoWS52F4Ai+y9Hs=; b=G24wjMvCRCsY0q
	oPRU9j6ARYT/J5MeGo84jnzJuR2GKF3tnjcakLXibkHp/kEjB1wSZ39NlA6L1TZaAN7he420nNSUr
	i4TtG59u3Rizp9r+ft1V3A1WWSCjys7vlt0Z4+rSlQ+9t/Y/ymUxrJDYkDJVUr8mF6yhVmHkaLV/l
	pLF3EtF7r55G81+wTINJld3vHdQkouxZR8YiCvWbuQpTLsL5mCMTZil5+QV4Vv/PBntzcuOwCwDxd
	vleB7vLA8mkfuHxL0RAjkHd+RRoQGKAXTaUWMwLF10ZT0fevaRwBLd66Esp2T6aZDWZE+957cJJsy
	qLjDsQh/S5fONz1UyM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1met2b-00FLxK-IO; Mon, 25 Oct 2021 06:01:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1met2Z-00FLwZ-A5
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 06:01:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C0976108C
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 06:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635141658;
 bh=CuzeI+0Q9Euya1CQX3pyZPAzzTOCsyTDTkaMPkoJqGo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=myJ2s0g3UKm8NKDG6oO/IsdSzjQVU2jq93OWR4+6uq544YC4cq7r6ORnkR8g1vrBg
 T6FA4LXvDYpbOUzMkpqnkgvjJ/eKHMcvy1BYIgmjTb/rlVESQbTcIW1Z1ZzO0O7J7b
 oMWX4qYbQaFChEXuUDRnPRzLLG8GOjkBBfWXgBI3NV/1DtiK8yX8ZV/Q3Jgy3MYcZ8
 iW5Hze7QMhQNkKsUUPHhcbnnuJFYG+0F4WSFrUno292jjEBKeCd0nZ+BlH9KZGBAZU
 3NkPJqB6XCRmh9cw2QGqQNNZ1sNRbg+FkV7YeCBdnhCjwOa3ms9BYjWYRBZ5EzU4t/
 JftXaEpHxu9dA==
Received: by mail-ua1-f54.google.com with SMTP id h4so19867928uaw.1
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 23:00:58 -0700 (PDT)
X-Gm-Message-State: AOAM530ckFrtMupzD9W+mEgso2qxxl9Ua+TvDEWvXPlWr1GvYp6t6J1i
 3Op7MJ7ksyCZHYiIMmeVmDVXTdPFVOfeDSj+ggs=
X-Google-Smtp-Source: ABdhPJxBht3G4IWScUXK+IaOfdkjsis4dL/gBa1CnvEp5RIYyns3bsUObddpMGH50GRFWCGiAevIL/WMph7+cIwhQVQ=
X-Received: by 2002:a67:fa93:: with SMTP id f19mr12463846vsq.43.1635141657031; 
 Sun, 24 Oct 2021 23:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <20211025040607.92786-2-wefu@redhat.com>
 <CAAhSdy1N-UQFnbFc7PSwf62y=gbvX7pK=vwUaG8m_KzdWx3AgQ@mail.gmail.com>
In-Reply-To: <CAAhSdy1N-UQFnbFc7PSwf62y=gbvX7pK=vwUaG8m_KzdWx3AgQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 25 Oct 2021 14:00:46 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT9T-TwTmGsfDH0Y05LO6dF6nGUUSGZW=RSackM0fUUyg@mail.gmail.com>
Message-ID: <CAJF2gTT9T-TwTmGsfDH0Y05LO6dF6nGUUSGZW=RSackM0fUUyg@mail.gmail.com>
Subject: Re: [RESEND PATCH V3 1/2] dt-bindings: riscv: add mmu-supports-svpbmt
 for Svpbmt
To: Anup Patel <anup@brainfault.org>
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
X-CRM114-CacheID: sfid-20211024_230059_437189_8FC2FB57 
X-CRM114-Status: GOOD (  20.48  )
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

On Mon, Oct 25, 2021 at 12:17 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Oct 25, 2021 at 9:36 AM <wefu@redhat.com> wrote:
> >
> > From: Wei Fu <wefu@redhat.com>
> >
> > Previous patch has added svpbmt in arch/riscv and changed the
> > DT mmu-type. Update dt-bindings related property here.
> >
> > Signed-off-by: Wei Fu <wefu@redhat.com>
> > Co-developed-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index e534f6a7cfa1..76f324d85e12 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -59,6 +59,11 @@ properties:
> >        - riscv,sv48
> >        - riscv,none
> >
> > +  mmu-supports-svpbmt:
> > +    description:
> > +      Describes the CPU's mmu-supports-svpbmt support
> > +    $ref: '/schemas/types.yaml#/definitions/phandle'
>
> There were various proposals from different folks in the previous
> email threads.
>
> I think most of us were converging on:
> 1) Don't modify "mmu-type" DT property for backward
> compatibility
I agree. FuWei has followed that in the patch.

> 2) Add boolean DT property "riscv,svpmbt" under
> "mmu" child DT node of each CPU DT node. Same will apply
> to boolean DT property "riscv,svnapot" as well.
We have various proposals here:
@Philipp suggests firstly, but break the backward compatibility:
 cpu@0 {
    ...
    mmu {
       type = "riscv,sv39";
       supports-svpbmt;
       supports-svnapot;
    };

@guoren suggests reusing the mmu-type, but seems not clean.
cpu@0 {
   ...
   mmu-type = "riscv,sv39,svpbmt,svnapot";


@fuwei suggests simple name property in CPU section:
cpu@0 {
   ...
   mmu-type = "riscv,sv39";
   mmu-supports-svpbmt;
   mmu-supports-svnapot;

@Anup suggests:
cpu@0 {
   ...
    mmu-type = "riscv,sv39";
    mmu {
       supports-svpbmt;
       supports-svnapot;
    };

Any other suggestions? Thx.

>
> We also have bitmanip and vector broken down into smaller
> extensions so grouping related extensions as separate DT node
> under each CPU node will be more readable and easy to parse.
Do you mean combine mmu extensions with them together?
cpu@0 {
    ...
    extensions {
        supports-svpbmt;
        supports-svnapot;
        supports-bitmanip;
        supports-vector-v0p7;
    };

>
> Regards,
> Anup
>
> > +
> >    riscv,isa:
> >      description:
> >        Identifies the specific RISC-V instruction set architecture
> > --
> > 2.25.4
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
