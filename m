Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F70BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 13:22:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E046054F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 13:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02E046054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vrull.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ycbm5bXRRKLsz9nafcATlA2rKmXcdzIZj6ncuwyWEkQ=; b=I7ZO54G0i3Bv+R
	UHkPwQrZXsE5tPvsxqZgZ6k6zs6jFb4qwIzcyt1oXPckwtD4bpTtfuIFzOn0XyuOYrdn7eqb+R5Xs
	mR4tCXeVbGwPXQzWPNZE8V04nyHQcVX6RuBTXaKlzkhDoZJGCrDS5t+MHGLK7DMZDQJ1vkN+RO5Ho
	wyIMP7pZI3vk2Fdd5EOeS1a8bG+BJ5/WfDDDBc1+45yQ7GhT/qDjWNr1rx5arGQDGYJO7KtcnX4fb
	4d5AzTDx4L3t27ocz6zUKFV6jjcYwF3wa+ghqvHv0AkiPObQMQoFJGqh62Qbugw/2vxkTaRS9FLBZ
	jzpnKsK+vegbpq3Xs+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mezvY-00GWHT-3Y; Mon, 25 Oct 2021 13:22:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mezvV-00GWFs-Jq
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 13:22:11 +0000
Received: by mail-wr1-x430.google.com with SMTP id s19so12720108wra.2
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dHr5OHD5jpaUHwRPw9aH93bpMTz/ijSR6iNj3HeWX0s=;
 b=dBywuSgiJPi0D1S2vr4DoJq7T77YxIGCJ4mMgfU1wZFg1NE4zAn8AmG4mPRPFf7+qc
 ZSJrUumbL0079syfoR2CyAKgq0q+MCS43Gx7PO5URbNHdhHO8GneCUDG1Emf/f0qNPv/
 5Z1Z3YVsJ4l/RG7K8OZ5BQkGwcdA5qFpwDMMqiFPs8Ecaxj+fd8D5EAxTblxG6n5tGh7
 Ep/f7hyzQOg+IBVCR2VqteZC+cYAD35O3VSXUQIn8daTgVBg2706ggFDQwTt46LFT8vG
 z0ZrDRWWZb40w2oS1LN7rkqp5TC5HrQLvm42Fyk5y8oRZYeUsgrj6UHxG+300x8oz3QB
 /tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dHr5OHD5jpaUHwRPw9aH93bpMTz/ijSR6iNj3HeWX0s=;
 b=VqNvAS0PWTLzR+Cg3cew2QAw5STLQ6GXIduiuD/9jwYFL2zJ9idMLz98nTVxMCOm0X
 CBLJiZ7ssXNLJIu9f/jaUjYkmFs3MGAAxQffDvMIue4+RxVfrNRs3PFLGV+4QBHfOXXj
 FjOpGWSs5dzRrfrOT3ScN3qRCqANksAEP9zs1T7fX96oxKCVcKG++p09jERXaaQonctr
 f7cJWy62CvhrcXd4Q+TkxMrhAUTTcqXKuxy//PgwuY+g5hKJGLmjzE9W+NSesdYUD1FE
 vfTp63+vNJCjAxwL9xeP2uUw8MZxxKBbTMZ33YMvcHg34KEmCHVId8Ao5ThVqKsZohN4
 xh4Q==
X-Gm-Message-State: AOAM5315r31NvPiKMeiIXiBXg8ZdbO0+T0Od3Vp3aM92aEBjrL9qBe8J
 xo+HUlx/TTOGfUJ6RhVcCWKeJs+ecm+8Yzda1Ke7TQ==
X-Google-Smtp-Source: ABdhPJz5nKuH/w0FKB9WEVD82bBCnHRd2n8YsgxSr40uZXV9aVLRM0MQ++QJYWyVgoVf8kfjPS6XpV7zEbHEnScn5dc=
X-Received: by 2002:adf:c183:: with SMTP id x3mr21329364wre.90.1635168127135; 
 Mon, 25 Oct 2021 06:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <20211025040607.92786-2-wefu@redhat.com>
 <CAAhSdy1N-UQFnbFc7PSwf62y=gbvX7pK=vwUaG8m_KzdWx3AgQ@mail.gmail.com>
 <CAJF2gTT9T-TwTmGsfDH0Y05LO6dF6nGUUSGZW=RSackM0fUUyg@mail.gmail.com>
 <CAAhSdy1ZuQyWdVY5dmrnNVHe3oOYxhieW1upAhbnDvuxNL=YyA@mail.gmail.com>
In-Reply-To: <CAAhSdy1ZuQyWdVY5dmrnNVHe3oOYxhieW1upAhbnDvuxNL=YyA@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 25 Oct 2021 15:21:56 +0200
Message-ID: <CAAeLtUCM=01oue8hZQ_hTgzRDXu1qdgtyqyKBG5kOzXCbbUxYQ@mail.gmail.com>
Subject: Re: [RESEND PATCH V3 1/2] dt-bindings: riscv: add mmu-supports-svpbmt
 for Svpbmt
To: Anup Patel <anup@brainfault.org>
Cc: Guo Ren <guoren@kernel.org>, Wei Fu <wefu@redhat.com>,
 Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>, 
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
X-CRM114-CacheID: sfid-20211025_062209_686972_1D086E3D 
X-CRM114-Status: GOOD (  30.23  )
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

On Mon, 25 Oct 2021 at 08:08, Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Oct 25, 2021 at 11:30 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Mon, Oct 25, 2021 at 12:17 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Mon, Oct 25, 2021 at 9:36 AM <wefu@redhat.com> wrote:
> > > >
> > > > From: Wei Fu <wefu@redhat.com>
> > > >
> > > > Previous patch has added svpbmt in arch/riscv and changed the
> > > > DT mmu-type. Update dt-bindings related property here.
> > > >
> > > > Signed-off-by: Wei Fu <wefu@redhat.com>
> > > > Co-developed-by: Guo Ren <guoren@kernel.org>
> > > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > > Cc: Anup Patel <anup@brainfault.org>
> > > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > index e534f6a7cfa1..76f324d85e12 100644
> > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > @@ -59,6 +59,11 @@ properties:
> > > >        - riscv,sv48
> > > >        - riscv,none
> > > >
> > > > +  mmu-supports-svpbmt:
> > > > +    description:
> > > > +      Describes the CPU's mmu-supports-svpbmt support
> > > > +    $ref: '/schemas/types.yaml#/definitions/phandle'
> > >
> > > There were various proposals from different folks in the previous
> > > email threads.
> > >
> > > I think most of us were converging on:
> > > 1) Don't modify "mmu-type" DT property for backward
> > > compatibility
> > I agree. FuWei has followed that in the patch.
> >
> > > 2) Add boolean DT property "riscv,svpmbt" under
> > > "mmu" child DT node of each CPU DT node. Same will apply
> > > to boolean DT property "riscv,svnapot" as well.
> > We have various proposals here:
> > @Philipp suggests firstly, but break the backward compatibility:
> >  cpu@0 {
> >     ...
> >     mmu {
> >        type = "riscv,sv39";
> >        supports-svpbmt;
> >        supports-svnapot;
> >     };
> >
> > @guoren suggests reusing the mmu-type, but seems not clean.
> > cpu@0 {
> >    ...
> >    mmu-type = "riscv,sv39,svpbmt,svnapot";
> >
> >
> > @fuwei suggests simple name property in CPU section:
> > cpu@0 {
> >    ...
> >    mmu-type = "riscv,sv39";
> >    mmu-supports-svpbmt;
> >    mmu-supports-svnapot;
> >
> > @Anup suggests:
> > cpu@0 {
> >    ...
> >     mmu-type = "riscv,sv39";
> >     mmu {
> >        supports-svpbmt;
> >        supports-svnapot;
> >     };
> >
> > Any other suggestions? Thx.
> >
> > >
> > > We also have bitmanip and vector broken down into smaller
> > > extensions so grouping related extensions as separate DT node
> > > under each CPU node will be more readable and easy to parse.
> > Do you mean combine mmu extensions with them together?
> > cpu@0 {
> >     ...
> >     extensions {
> >         supports-svpbmt;
> >         supports-svnapot;
> >         supports-bitmanip;
> >         supports-vector-v0p7;
> >     };
>
> I meant separate group nodes like this:
>
> cpu@0 {
>     ...
>     mmu-type = "riscv,sv39";
>     mmu { /* Only considered when mmu-type is present and mmu-type !=
> "riscv,sv32" */
>         riscv,svpmbt;
>         riscv,svnapot;
>     };
>
>     bitmanip { /* Only considered when "B" is present in the ISA string */
>         ...
>     };

Please disregard this comment regarding bitmanip/B.
The B bit in the misa CSR is not used for any signalling regarding
Zb[abcs] (or the other Zb-extensions), so this entire node is not
needed and B in the ISA string is not related to any of the Zb*
extensions).
All Zb* extensions are directly visible from the ISA string.

>    vector { /* Only considered when "V" is present in the ISA string */
>        ...
>    };
>     ...
> };
>
> Regards,
> Anup
>
> >
> > >
> > > Regards,
> > > Anup
> > >
> > > > +
> > > >    riscv,isa:
> > > >      description:
> > > >        Identifies the specific RISC-V instruction set architecture
> > > > --
> > > > 2.25.4
> > > >
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
