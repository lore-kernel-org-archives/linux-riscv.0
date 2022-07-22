Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182B9C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 18:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/0MO9JS6YUSJtzoZJB7B7eAEbWFlWmEWMAsJ7HYbys=; b=vGN9pT1MQNNLlb
	54xIdTK4xwKT6c47A2rocoN0VhCKiwrQ8m4xHpw44tZMus+HgSaaTb24ALlSaTUVQwliqsJeoTuDv
	ei69JB1YfR0oU3RQ1/NL97pXjGwm1Qsesz+3BdMAKWXT7pdcpvJDW2HZN0o0nwQGsJQ0pXvrKAX6D
	SC4//S7GVF2sTjQ0+J4bnSbexqldazBRWotpH1dJxJdwFgmrw+le/h+d1sPkHhYhRRRzq55QxQBB8
	hxn0pHJOTAQV4+iwZZFoOmOPmSDXpmJ35wq3PLuFIMrXdBcNGm4FfRut8+Cq+DeIxdqK7wc4Y0vH0
	dC0eS6JzjBv2iiF4F0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEx6A-008lly-CQ; Fri, 22 Jul 2022 18:10:02 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEx67-008ljN-Gh
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 18:10:00 +0000
Received: by mail-il1-f181.google.com with SMTP id n13so2684543ilk.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 11:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PIQt+5ITwOzmhuISQoyrlkf2sasQzT8bLBRP5gAJJHI=;
        b=R2tz7RZj28moZWhVpJ8dJZ+k0f5jzMrUpY/0hYmDSjqeIQkz+eMe9F5LQcJ+nEkUEh
         dGfyh8io4peita1m6GWnhwmrYmaP4z9MDV6UtJGG64R+iOETWmW6NTXLUZ/C9MvmDfIi
         Dvn0SlF7acYX3HA4lJTEfhib38fCO9/7rzTHpCZnqjy104/OooDXPMxEL59EkPUDM8YO
         C1EJ9ugz+FGyDK/omLOaaH19hToon5qQWLQjerQCIBrLaRCXAQ4y3TxxSaRs/P0DLUjt
         kp7XFX2BfyqO4nul4HefumciTvcEpI4qmUPWByOOlEAxvOmqaEcHmggCHjTogjAYeYRj
         rulQ==
X-Gm-Message-State: AJIora9AJGT3WHSvWuTyl1FsgFi1MshGsUYdh3BqF0qSWDzJ4g/M08Uz
	4/UEV/G63w+w1FNYtcuVaA==
X-Google-Smtp-Source: AGRyM1viYesRRMCE+hE3852h7f+4YHNmRnNBlfzb2xqh4FaCp1/QljiBpc+/NB38QuvSIp2ETH6ijg==
X-Received: by 2002:a05:6e02:b21:b0:2dc:6d2d:5a61 with SMTP id e1-20020a056e020b2100b002dc6d2d5a61mr495214ilu.273.1658513397529;
        Fri, 22 Jul 2022 11:09:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x15-20020a92cc8f000000b002dd12857a13sm1950282ilo.80.2022.07.22.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 11:09:57 -0700 (PDT)
Received: (nullmailer pid 3797638 invoked by uid 1000);
	Fri, 22 Jul 2022 18:09:55 -0000
Date: Fri, 22 Jul 2022 12:09:55 -0600
From: Rob Herring <robh@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Geert Uytterhoeven <geert+renesas@glider.be>, LKML <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Phil Edworthy <phil.edworthy@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH RFC 1/2] dt-bindings: interrupt-controller: sifive,plic:
 Document Renesas RZ/Five SoC
Message-ID: <20220722180955.GA3770737-robh@kernel.org>
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220524172214.5104-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220605142333.GA3439339-robh@kernel.org>
 <CA+V-a8smk8TqyWpm1KXo-3dKnCAodKsiYsaqnK_3ubfXE9YauQ@mail.gmail.com>
 <20220706215827.GA572635-robh@kernel.org>
 <87a69lmesa.wl-maz@kernel.org>
 <20220712181916.GI1823936-robh@kernel.org>
 <878roy16iw.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878roy16iw.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_110959_575665_F58953B3 
X-CRM114-Status: GOOD (  20.06  )
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

On Tue, Jul 12, 2022 at 08:21:27PM +0100, Marc Zyngier wrote:
> On Tue, 12 Jul 2022 19:19:16 +0100,
> Rob Herring <robh@kernel.org> wrote:
> > 
> > On Thu, Jul 07, 2022 at 10:51:33AM +0100, Marc Zyngier wrote:
> >
> > > Can you please have a look at the latest instance[1][2] of this
> > > series, as posted by Samuel? I've provisionally queued it, but only on
> > > the provision that you would eventually ack these patches.
> > 
> > I did already[1]. They passed checks, were already in linux-next, and I 
> > didn't see anything major needing comments, so I marked it N/A (meaning 
> > someone else applies it) without comment.
> > 
> > Rob
> > 
> > [1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220630100241.35233-2-samuel@sholland.org/
> 
> How are people supposed to track this if it doesn't appear on the ML?

Look at patchwork?

How am I supposed to track maintainers that will rebase what they have 
in next to add acks and those that won't?

> That's not really an ack, AFAICT. That's a "I don't care".

I still look at it, so really it's an implicit ack. In this case, I 
probably just saw the irqchip-bot mail and missed your reply to the 
cover.

> Does it mean I'm free to take any random DT patch unless you or a bot
> shouts? I'd rather know.

Wait for acked/reviewed-by to apply? Isn't that the process?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
