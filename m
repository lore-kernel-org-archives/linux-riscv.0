Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87F8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 22:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5bLThOaMJvyh6VFMyYTaq8Joxhm9wINz+3EpZsJaew=; b=pnlj8qp5mfo9gi
	Y67FlIBFDazwGQ2xbkevzN2XVnD+JegGc4kCnZzVAXCl/SvBCsEfeHUsoPwaRj8gqNwVtJ1C403Oj
	c0UnLAdB9ROre7Ith7edgwgsoFkrhcfiBGhMcMDOqVJCrWAu2e9tVCLHBWgPu2EJWNXZM+LPEX6sd
	y9OZqPNJPQwG0R2Zo7aSfy9OA5yO+NsE8qzuuTjUcnD50DOfgMlW4ewKUePuW6cJtNZzx9kE51H2t
	zz7gojD7E6UQyrV7frxurLdqzZyjYp82Q+nm280HN5Uoj6lHxTF5lTnKIOBnjrkU2hggrzix5apjh
	e5uDxWE/cYDtXSZ8RovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxyCL-002gWt-2H; Wed, 23 Nov 2022 22:26:29 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxyCH-002gUr-IA
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 22:26:27 +0000
Received: by mail-io1-f47.google.com with SMTP id i85so130106ioa.5
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 14:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Md22OrgObOx6DJr1ojJ7e+OLdIlThpqngt384PGuCOQ=;
        b=hhQQgGBrpLZwopH/ZLl+wca8IFJ/Bu4is59+lopUJ2DCpOpViWWG2EzzuQfF7CGxZU
         rDO3bGRUV4x1YDWHqX6bt/KbH7YmzhfoWetXCArj1cX8sk2WYC1CBWg0qVJHedDFZAQ5
         WpCTadBM6xdXLvYnGwYaNZjzYDhfXQ9At19qLiPps8zcI+QNTCC487Rbrn7oLVHaeF6p
         2tac9Fqe5YdUckAoJhav5/43YtsvyFcXVpZWQ9drkVHhlttuPbLHxXkBqKwA9lNvQCeb
         0jkzN3YmkM0iZeizU+SOoeEYELQ6eUh+HdfXZ54JcDHkuwP09fGzV203A3DgnoXkzcPX
         cIJg==
X-Gm-Message-State: ANoB5pk4Vh/18NeMVQnE6mhUOhUaATl4fTH5XgSNeOg918AbeaTYTkxX
	EajdQ5Ik6HHLlc9asrVkLQ==
X-Google-Smtp-Source: AA0mqf5kzl4MXkOhcYULiC7EDYSS0a6ABHItbyx+DROc/VOx1kAqziBldZZSdsDen3xapJ9BYjl7LA==
X-Received: by 2002:a05:6638:296:b0:363:79c4:b889 with SMTP id c22-20020a056638029600b0036379c4b889mr4970556jaq.292.1669242383774;
        Wed, 23 Nov 2022 14:26:23 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u29-20020a02b1dd000000b003880914948fsm556036jah.6.2022.11.23.14.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 14:26:23 -0800 (PST)
Received: (nullmailer pid 2616920 invoked by uid 1000);
	Wed, 23 Nov 2022 22:26:24 -0000
Date: Wed, 23 Nov 2022 16:26:24 -0600
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: sifive,ccache0: Support StarFive
 JH7110 SoC
Message-ID: <20221123222624.GA2611087-robh@kernel.org>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-5-hal.feng@starfivetech.com>
 <Y3duiJguYE6VrVLP@spud>
 <Y3dvCPP1g0LzzHFO@spud>
 <a5193e23-efe1-fa65-15de-d53b80b87d63@starfivetech.com>
 <Y3yRTuo69JUsfLqk@wendy>
 <0f9e423e-37c0-a838-bf25-f9b6784a31d0@starfivetech.com>
 <Y3yd+tfFl4yvXOx6@wendy>
 <b57bdf1c-19f4-3d70-7618-16817669abc5@starfivetech.com>
 <CAJM55Z-aQfvUZXNtaorAk4acpbbVsj-f-8TQn6uZXQosD=MORA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z-aQfvUZXNtaorAk4acpbbVsj-f-8TQn6uZXQosD=MORA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_142625_616911_FF570B78 
X-CRM114-Status: GOOD (  29.67  )
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

On Tue, Nov 22, 2022 at 11:35:28AM +0100, Emil Renner Berthing wrote:
> On Tue, 22 Nov 2022 at 11:16, Hal Feng <hal.feng@starfivetech.com> wrote:
> >
> > On Tue, 22 Nov 2022 10:01:30 +0000, Conor Dooley wrote:
> > > On Tue, Nov 22, 2022 at 05:55:57PM +0800, Hal Feng wrote:
> > > > On Tue, 22 Nov 2022 09:07:26 +0000, Conor Dooley wrote:
> > > > > On Tue, Nov 22, 2022 at 04:40:23PM +0800, Hal Feng wrote:
> > > > > > On Fri, 18 Nov 2022 19:39:52 +0800, Conor Dooley wrote:
> > > > > > > On Fri, Nov 18, 2022 at 11:37:50AM +0000, Conor Dooley wrote:
> > > > > > > > On Fri, Nov 18, 2022 at 09:17:10AM +0800, Hal Feng wrote:
> > > > > > > > > From: Emil Renner Berthing <kernel@esmil.dk>
> > > > > > > > >
> > > > > > > > > This cache controller is also used on the StarFive JH7110 SoC.
> > > > > > > >
> > > > > > > > "... and configured identically to that of the FU740"?
> > > > > > > > Anyways,
> > > > > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > > >
> > > > > > > Actually, after looking at the next patch - why can you not fall back to
> > > > > > > the fu740 one since you appear to have the same configuration as it?
> > > > > >
> > > > > > Right, I will drop this patch and use "sifive,fu740-c000-ccache" as
> > > > > > compatible in dts.
> > > > >
> > > > > Uh, that's not quite what I was suggesting. Rather than using that one
> > > > > in isolation, you can do the following in your dt:
> > > > > "starfive,jh7110-ccache", "sifive,fu740-c000-ccache"
> > > > >
> > > > > And then in the driver we need to make no changes - unless down the line
> > > > > we find some sort of issue that requires special handling etc. There's
> > > > > no harm in having a "starfive,jh7110-ccache" IMO.
> > > >
> > > > Just like what microchip did as blow?
> >
> > below
> >
> > > >
> > > > Documentation/devicetree/bindings/riscv/sifive,ccache0.yaml:
> > > > properties:
> > > >   compatible:
> > > >     oneOf:
> > > >       - items:
> > > >           - enum:
> > > >               - sifive,ccache0
> > > >               - sifive,fu540-c000-ccache
> > > >               - sifive,fu740-c000-ccache
> > > >               - starfive,jh7110-ccache
> > > >           - const: cache
> > > >       - items:
> > > >           - const: microchip,mpfs-ccache
> > > >           - const: sifive,fu540-c000-ccache
> > > >           - const: cache
> > >
> > > No, I don't think this is correct either. You'd do something like:
> > >
> > > >       - items:
> > > >           - const: starfive,jh7110-ccache
> > > >           - const: sifive,fu740-c000-ccache
> 
> For the record I don't think the line above should be there. The
> fu7400-c000 is a specific tapeout and pretending the JH7110 is that
> tapeout is not right. Especially when there is already the
> "sifive,ccache0" string for the generic IP.

All it really says is that this h/w will work with any client (OS) 
that understands 'sifive,fu740-c000-ccache'. Maybe 'sifive,ccache0' is 
sufficient too, IDK.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
