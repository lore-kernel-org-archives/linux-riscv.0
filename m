Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBEEC00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 18:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkWsrXCNqYqoeaE6paFE5pCiJ4Z2jaL865r3KG+Pg1E=; b=i5R1XR9nait/EL
	B84Qm6a11WptXgSLdUuqxIRNTrTSVqAg/PEwuj/J58iD6aGxDgHPxE7KB77WSCgCGxJ0LpaV6rxqn
	QEuqRTBvU0N2vISaF2JIlK5qoELpREZUj7ZBQ48hNr2lz8DTy98Usop9QSkLyRovoqIxgdMHk01O7
	Z5ztx+a3LV6EpCbBtJFDRqvCfAGfh8tbIJc6GMoeYEs6qWbJ17IFokzTbhuVI6rIbKQ0cB/PCqRmN
	gG5Zl7QM3ECDwZvVP20eAOJP2MsUVgvG9hAqGa8qeRzGPtWbolAJMCDi4RbKOAescLysH8gIa7Qmy
	PW7jJlNW8HQ0+pRzklAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOk38-007sz1-PJ; Thu, 18 Aug 2022 18:15:22 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOk35-007swX-KU
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 18:15:21 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-33365a01f29so63384627b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 11:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=O+By8SMEsmKfUQcl5iTzfeSzCB2mzamR2FlbcS3iWL4=;
        b=OwJpheqT025swB+aQkicuRDS+5JK7bUrIY7PUJDoAKH86DJWZlcq6Pe9apJpXfgVqD
         adOT/+026BI4sRPQYb22IS/Qc9wiFvCfBhrjfuywrQfij9F3n8Ua7Hg2XIs5itKOSAUj
         lRfnUqtrh+K4hsTzYxzvNys4P/sksuatUIYrJ6Y/PMibiSF3ZZJ6H1ieERbMjlicpjyR
         n3Lbd7LCkcZePV37TLPniIPFYo9RPFK2RHBuuJ+oS4H2BigeX4Gwp3wMhEKaHknGNCw+
         +dUMMxCE1HHU8a/LA6Gx4/DNu9t8FN9wE+bNAzb8V+S3F2jUVSmyF4XKV/dMozVwEEpL
         Ovtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=O+By8SMEsmKfUQcl5iTzfeSzCB2mzamR2FlbcS3iWL4=;
        b=p7N5BY57rfRhPQZep1tUAPUOfQQJwWnXsxOhULgIbimGCrDOAc919Bn3jr7btSaH5G
         DYg1VYjOFpj8QxqfLWumxbanVmBOwiWJ7NBpd1AStF7HnAE0SSM+jGVHzEUNOiO+CZCw
         7jO7r6mL6N6kUJTvMZwVk9JH+1qDdISo7305IUP6MhmwCcx3FmruEmrtGewaSB3kNY7i
         tmt4mwMHT8iT42NKHjG9Xn1iTwg8bsIoSAH/+0UYvMHBngab6pv2ySnO5F22MvYnuoV6
         XcAL70R1CL17C7ZkP15zXSQmllzhf81OzzpR8/TIfFGcyf/u9UyYpZiKFRxvmMaAD3vY
         8ynQ==
X-Gm-Message-State: ACgBeo1r5qr78fzKz+TSZKsd07QTji+j8eg13blZmob7pBKr68SB+n+u
	D8TsfxVbqHQzBrr3s2kBKF6v1AX2cv1nses4fjE=
X-Google-Smtp-Source: AA6agR7JYpjH33vGbyFyKa+MW4WlwRlRszKVF+PruKNgD58gus/PmNbDQfsg4w839r1gZXy45mqFPwFmt959K4pZJuo=
X-Received: by 2002:a25:8b8c:0:b0:67b:5c18:870 with SMTP id
 j12-20020a258b8c000000b0067b5c180870mr4072997ybl.244.1660846517231; Thu, 18
 Aug 2022 11:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUaketBpEfoSKeSJ4SuYwOTLoqJ_FCp=G8HmVudhv3zWw@mail.gmail.com>
In-Reply-To: <CAMuHMdUaketBpEfoSKeSJ4SuYwOTLoqJ_FCp=G8HmVudhv3zWw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Aug 2022 19:14:49 +0100
Message-ID: <CA+V-a8tSWshjoEqq=bwsY8eMfTe_QkZ-Uv+c3QBvZtD0XXgA+g@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: soc: renesas: renesas.yaml: Document
 Renesas RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <Conor.Dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_111519_718578_8F5421CD 
X-CRM114-Status: GOOD (  17.76  )
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

Hi Geert,

Thank you for the review.

On Thu, Aug 18, 2022 at 4:01 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Aug 15, 2022 at 5:16 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Document Renesas RZ/Five (R9A07G043) SoC.
> >
> > More info about RZ/Five SoC:
> > https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > @@ -415,11 +415,12 @@ properties:
> >                - renesas,rzn1d400-db # RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
> >            - const: renesas,r9a06g032
> >
> > -      - description: RZ/G2UL (R9A07G043)
> > +      - description: RZ/Five and RZ/G2UL (R9A07G043)
> >          items:
> >            - enum:
> >                - renesas,smarc-evk # SMARC EVK
> >            - enum:
> > +              - renesas,r9a07g043f01 # RZ/Five (RISC-V core)
>
> Should we be consistent, and leave out the "(RISC-V core)" comment,
> or add it everywhere?
>
Rather leave it for now ;) . If Rob agrees on your suggestion on
splitting (renesas,{rmobile,rcar-gen[1234],rza,rzg,rzn,...}.yaml that
would make it cleaner.

> Note that several of the SoCs listed in this file have SuperH or
> RealTime ARM cores, so going for the former means a lot of work.
>
Agreed.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
