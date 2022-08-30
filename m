Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAFFECAAD4
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 20:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=faLpYQtzyMgadMj/n97py7crpiDab4q5jeYxFnkp1Uk=; b=RkJHBE+fBeioy+
	NK8DQduDI6v3PnAJMjjY86VGxu4eZZ+z3z3eV+V1K/9S5KeogFMSWa/gccKPW1n6d6MhO0l+xfGSd
	wBXHbi29P3wbxby6NBGsz2VYRfHIqzFrdgIkT6teT+tKNjr+pr9vakpZ6GiV0ofpktR8e9u2xo7rC
	PLX0oR82mAInidkEbpvWvs3HZWrr+7Yu78fOyHu90YyktX1l3+nQYfoEleiHILaplzvt++kbphtml
	22eyOOinLX+pLsCjbLRrkBFojtUTGdiiRuyeo6mE8ITDofX5++z4XbQ2VZSPCxOJ15hd5l9yMItk8
	ibo5cMboknFxaYmFVzag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT8Ia-001vDe-PL; Tue, 30 Aug 2022 20:57:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT8IX-001vCL-4s
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 20:57:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 667F561880
	for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 20:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B612C43143
	for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 20:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661893043;
	bh=iftuHYqQXTY9T/Jpg0WAmZaO4NFtXezaRWCYZ6TK3ig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sN4VuKXwsfijKIrdwPjxw4NxzoBbgK7Lox0+jXU7CWFZd7NuNAH8YfB9YRrON1H2e
	 Ign2ztR7Z18cKcRwpntRAKciL/Im4Y1zybhsvCWZ2eCg0Nsl4C7ZuTyheh3jt01mLy
	 Mlau/BTkjCJzMXT/wYvTnibXh8G+67o0svHApuryc4XyV1dPxGs50jScXBItoxOOBs
	 MZ3rej3kOXPmbMBikQg5kcyZpUZ7c9tW9FB1aO85szVVn0bI9Vc0RQjMBKL1J6k0Zo
	 CDsU4caak9l+0z4fo9Fsp3f92DXvvQbqUIAS0ApPTxfEiimAH2N0Tt4q/WvbaETQCl
	 f/zRNkDfPTVlA==
Received: by mail-ua1-f49.google.com with SMTP id d14so4732202ual.9
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 13:57:23 -0700 (PDT)
X-Gm-Message-State: ACgBeo0Oi4i1KMmcu80JfGy7zakCB73UwR0Sm1FxUWYVXbpIqBYacQeU
	5n+XPOH56COPHie7cR0dBSSvBr5ECeIQ4IFirQ==
X-Google-Smtp-Source: AA6agR6f85XnSpzHwZBKN0RRZyto5EZpAAgQSxtyliRBWdAaWrt2oixrLAfJCE0oQ44ghreW7ST5f7W6/kpWI4HA5iI=
X-Received: by 2002:a9f:23ec:0:b0:39e:c54f:ffc7 with SMTP id
 99-20020a9f23ec000000b0039ec54fffc7mr5975565uao.17.1661893042185; Tue, 30 Aug
 2022 13:57:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220825180417.1259360-1-mail@conchuod.ie> <20220825180417.1259360-2-mail@conchuod.ie>
 <5f00ab85-d5ac-728d-2157-e70f2a46cc90@canonical.com>
In-Reply-To: <5f00ab85-d5ac-728d-2157-e70f2a46cc90@canonical.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 30 Aug 2022 15:57:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLdYT5Bqn1aCd+vDxgOQAH_B2nMwsP9siATdK6DRte0QA@mail.gmail.com>
Message-ID: <CAL_JsqLdYT5Bqn1aCd+vDxgOQAH_B2nMwsP9siATdK6DRte0QA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: riscv: sifive-l2: add a PolarFire SoC compatible
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_135725_284302_B0BFD73A 
X-CRM114-Status: GOOD (  26.29  )
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

On Thu, Aug 25, 2022 at 1:36 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 8/25/22 20:04, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > The l2 cache on PolarFire SoC is cross between that of the fu540 and
> > the fu740. It has the extra interrupt from the fu740 but the lower
> > number of cache-sets. Add a specific compatible to avoid the likes
> > of:
> >
> > mpfs-polarberry.dtb: cache-controller@2010000: interrupts: [[1], [3], [4], [2]] is too long
>
> Where is such a message written? I couldn't find the string in
> next-20220825 (git grep -n 'is too long"').
>
> Why should a different number of cache sets require an extra compatible
> string. cache-size is simply a parameter going with the existing
> compatible strings.
>
> I would assume that you only need an extra compatible string if there is
> a functional difference that can not be expressed with the existing
> parameters.

Correct, but you have to account for unknown functional differences
aka errata as well. Otherwise, we need firmware updates to enable the
OS to handle errata.

> > Fixes: 34fc9cc3aebe ("riscv: dts: microchip: correct L2 cache interrupts")
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >   .../bindings/riscv/sifive-l2-cache.yaml       | 79 ++++++++++++-------
> >   1 file changed, 49 insertions(+), 30 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > index 69cdab18d629..ca3b9be58058 100644
> > --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> > @@ -17,9 +17,6 @@ description:
> >     acts as directory-based coherency manager.
> >     All the properties in ePAPR/DeviceTree specification applies for this platform.
> >
> > -allOf:
> > -  - $ref: /schemas/cache-controller.yaml#
> > -
> >   select:
> >     properties:
> >       compatible:
> > @@ -33,11 +30,16 @@ select:
> >
> >   properties:
> >     compatible:
> > -    items:
> > -      - enum:
> > -          - sifive,fu540-c000-ccache
> > -          - sifive,fu740-c000-ccache
>
> Why can't you simply add microchip,mpfs-ccache here?
>
> > -      - const: cache
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - sifive,fu540-c000-ccache
> > +              - sifive,fu740-c000-ccache
> > +          - const: cache
> > +      - items:
> > +          - const: microchip,mpfs-ccache
> > +          - const: sifive,fu540-c000-ccache
>
> Why do we need 'sifive,fu540-c000-ccache' twice?

Because it is in 2 different positions. While we can express that the
last N entries in a list are optional, there is no way in json-schema
to express entries at the beginning or in the middle are optional.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
