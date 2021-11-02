Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A17C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 12:59:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D036108F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 12:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13D036108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhqWT26z0NWdAgDdvXr2i0uvKqcgzqiWuyV3k2NL8PE=; b=dpWg2hJsRCg1JT
	O8sXmO71i/DH0KviXatty7dzBIHmOXZxgzJYGd6t4A8Y2Z/G17v34USAM2FVA15dUxXWHml2sB8YU
	qks3hXQaXP6Xz+yo0Gd1afry1PLflJYo63dBeGR4vUeta9Kj3qbj/z8DC7YvSbbDQsUujrwTR6yaH
	9Upe6LsX/XEDTUQsX9HNRkuUhryksh0l5Qif+jC5Q3YcXfTqC6NgPp201IuUdtPgFRZpjM15jbKux
	u3E11npjeql2L+DFmZDgiL8/kN4ql2xHfSdLpr8f7gptBe+co28eWWlCoHEE7Dgzcox5mpkvvtjn5
	9EJplSkih7GU2VYGfTvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhtNl-001iZZ-VV; Tue, 02 Nov 2021 12:59:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhtNj-001iZ6-Us
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 12:59:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AFC86109D
 for <linux-riscv@lists.infradead.org>; Tue,  2 Nov 2021 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635857955;
 bh=TLibQ2sAtuchOSgK2Ni0etFgDHTzqtxTyTAAiZxTceE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aaQFcL3qnIXciIl/fTtzlBFPb6ORcVMS3N2OHXBQFtITOM7WilAGSG8girIB7gK65
 UmQcFUsjDIMBcQa1RuwlUBYYzxP2plLjaZ5KJdEny3JmvuuyrKo05SZIpuhmyQxxah
 KnSgDaweQ8r8E0Cj0nD2H+eptIhPD2i76f4yToaVx1JdEsivUPNk1l4YsckfXBotiu
 6Ek6eIjJhuUeaKeeREPpug/o+eVNHzHNDdoH2q0WNzsEPWiq7XtuYq4wEESkaOHvGl
 5wS2UCLXoMUhULkcP4M/Mq7YjC/1NZ0zUtFvo6wewC8gVia4kV4iEO18OOvBv7ATiO
 BOTJ7VFO0C+Jw==
Received: by mail-ed1-f46.google.com with SMTP id j21so52854401edt.11
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 05:59:15 -0700 (PDT)
X-Gm-Message-State: AOAM5301Ew4ji/FMBF0fYkW4n+BSayRPrNL9U0CvLFZCn2Gf9O8x1335
 qpiCObHPJlSXdkMjVRoa0qsR2G+1XuV/h18h4Q==
X-Google-Smtp-Source: ABdhPJwmer+eSqw0gozwh3gsBtNEiNXEBI/Ss90zfBiPdnFU6tby1sbtEINC2SPnN4GARQFGAiiVNk39RYtRrUishEk=
X-Received: by 2002:a17:907:980d:: with SMTP id
 ji13mr17255292ejc.466.1635857954130; 
 Tue, 02 Nov 2021 05:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-2-guoren@kernel.org>
 <CAJF2gTSDTXu7HsABTHfTbCd2TNpHBpzSMqYGh9Av8kzJ+6AOPw@mail.gmail.com>
In-Reply-To: <CAJF2gTSDTXu7HsABTHfTbCd2TNpHBpzSMqYGh9Av8kzJ+6AOPw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Nov 2021 07:59:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKRizEaqmgVnfMWr2A_AHMFLjDpYNTHahTLPgSAtGYCLg@mail.gmail.com>
Message-ID: <CAL_JsqKRizEaqmgVnfMWr2A_AHMFLjDpYNTHahTLPgSAtGYCLg@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] dt-bindings: vendor-prefixes: add T-Head
 Semiconductor
To: Guo Ren <guoren@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_055916_036970_F8F585FF 
X-CRM114-Status: GOOD (  16.73  )
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

On Mon, Nov 1, 2021 at 9:21 PM Guo Ren <guoren@kernel.org> wrote:
>
> Hi Rob,
>
> ping? If there is no problem, could you help pick up this patch into your tree?

Generally DT patches go with the rest of the series. And you need to
send them to the DT list so that automated checks run and they are in
my review queue.

>
> On Sun, Oct 24, 2021 at 9:33 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Add vendor prefix for T-Head Semiconductor [1] [2]
> >
> > [1] https://github.com/T-head-Semi
> > [2] https://www.t-head.cn/
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index a867f7102c35..f532a8830693 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -1169,6 +1169,8 @@ patternProperties:
> >      description: Terasic Inc.
> >    "^tfc,.*":
> >      description: Three Five Corp
> > +  "^thead,.*":
> > +    description: T-Head Semiconductor Co., Ltd.
> >    "^thine,.*":
> >      description: THine Electronics, Inc.
> >    "^thingyjp,.*":
> > --
> > 2.25.1
> >
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
