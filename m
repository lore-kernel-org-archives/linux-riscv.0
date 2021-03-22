Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1390FC433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 17:36:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D7CC6195D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 17:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D7CC6195D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pd+fS1/670DOFUlsskApHsP9IsTFRQ98ZH8chO3p7HA=; b=OUHoALvb+ygkHe4W36ql3LGx5
	lzHAaRA6URIFfFxf5bIyWP8grZwT+S+RurqgJvpHh5Nqu5PbuVbbBFpCvTILm1y/PWz4Aef21Dqmc
	QtjXnOf6R/4Gd8V1Zq4WLRbJHDZFLelSUxqVFvT4uTDjsR7bzP23SAZ7+k3JD4JL+WVLZQj85AK0c
	50wPqGYtdMe294C18zF779Ax8h19RxXgO50i4c8LlLhNcpJCUt9dpZyP6O/493X+4lnBHorSGqb1A
	lM/WqGUpvYrirvXl+pKTX/AuqFcHticXQbAqExjWi3FU2Ql8yE0wtiDrVvZ+M+TU0h25UbDgCLb7u
	vE5iniQSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOOTV-00CAeR-4g; Mon, 22 Mar 2021 17:36:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOOTQ-00CAdn-Se
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 17:36:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09D4861998
 for <linux-riscv@lists.infradead.org>; Mon, 22 Mar 2021 17:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616434575;
 bh=VdW4om2AyPCfqy4wAovCR7HUVEe2frovxQ0Cc8nEk7s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Mh9yoSTNMWrpBFxp7mRAqgfTfZOlph3dYZnhso+XBF99dtzEHkgBu1YOy2DccLzzn
 fUylSmXKjiXNkdvZx/WKnjEV+5GnHZAVRPf8FAuQ+FX2zNlEFwMnVuBx3/7QcHBGRR
 VmCt4+L4cInUjBNq78zxXp4FBDQOleC4/KxA9aQVsnHM3Zt5q+sPQ+9++fOCLAChGA
 ZrbBCoyVviPqoFFBHsivxNrK5fArDQmqAhFcrkwkX3XZuyzri6iX5TjfgUyKO2BGWn
 +jNA3cIftCwjS8BGd8BxZpoBiA5+h4IHlX0hKg0akAFueiGgUW8oqUusCrgeyLdw+R
 NAjf6bEHS7S5w==
Received: by mail-ed1-f48.google.com with SMTP id h10so20338862edt.13
 for <linux-riscv@lists.infradead.org>; Mon, 22 Mar 2021 10:36:14 -0700 (PDT)
X-Gm-Message-State: AOAM53163dw4Oox7LK5vF49dATq15f4DaKbHE5MU/1J+4Ne0sulaDSXy
 RTd6Ph3zkvjbaSFteAKGEBKiY3TQOFZcjEgs8g==
X-Google-Smtp-Source: ABdhPJx2NmuQG0Y5DzdS5+450riDgemRYrFCSvVWhwcs0YPSA/NP54tZmFoCyKBJEdQ1WhL/o13t1FITdk/T511dQts=
X-Received: by 2002:aa7:c403:: with SMTP id j3mr718221edq.137.1616434573540;
 Mon, 22 Mar 2021 10:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <1599734644-4791-1-git-send-email-sagar.kadam@sifive.com>
 <1599734644-4791-3-git-send-email-sagar.kadam@sifive.com>
 <20200922203429.GA3188204@bogus>
 <CAMuHMdXPG-+EOCrQZi1deKv1yYMBtohprUVYW_-Shdp_gfQs5Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXPG-+EOCrQZi1deKv1yYMBtohprUVYW_-Shdp_gfQs5Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 22 Mar 2021 11:36:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJSF=p657tdvm4CW_LYi93t6vG0aOmQxUmYYW3_5h5UHQ@mail.gmail.com>
Message-ID: <CAL_JsqJSF=p657tdvm4CW_LYi93t6vG0aOmQxUmYYW3_5h5UHQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: riscv: convert plic bindings to
 json-schema
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sagar Kadam <sagar.kadam@sifive.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lee Jones <lee.jones@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yash Shah <yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_173617_330872_FF353DE2 
X-CRM114-Status: GOOD (  18.73  )
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

On Mon, Mar 22, 2021 at 9:38 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Sagar, Rob,
>
> (replying to an old email, as this one seems to be the most appropriate)
>
> On Tue, Sep 22, 2020 at 10:34 PM Rob Herring <robh@kernel.org> wrote:
> > On Thu, Sep 10, 2020 at 04:14:03PM +0530, Sagar Kadam wrote:
> > > Convert device tree bindings for SiFive's PLIC to YAML format
> > >
> > > Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
>
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
>
> > > +
> > > +  '#address-cells':
> > > +    const: 0
> > > +    description: Should be <0> or more.
> >
> > Drop. 'or more' is wrong. If there's a case with more, it will need to
> > be documented.
>
> Why do we have the "'#address-cells': const: 0" at all...
>
> > > +required:
> > > +  - compatible
> > > +  - '#address-cells'
>
> ... and why is it required?

It is only required if an 'interrupt-map' points to this node.
Currently dtc is warning if it is missing always, but there are plans
to relax dtc to only warn when 'interrupt-map' is present. Of course,
if you had 'interrupt-map' in an overlay, you'd want #address-cells in
the base dt and there's no other way to check that than making it
required.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
