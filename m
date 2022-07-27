Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D4FC19F29
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHt1wgjpDJO2w777I4AMrZWYeqRscf5By8vFguKtmlk=; b=E4BIbwQHQFFGq8
	BKiwl1TrRr2lUXNWnDKAUT+3/7t01y1vSRdOhmAyh4oMRAMhwpU1WiiPJgOGM9Cqe/uuX6sHL7DwE
	MgkXR9tIEx9/MEJoA/ZwOHUL+lQTG4Ap+I/kdxoDXMW/xPsjSlRzQac0ImE+/cMr941NhoECikm5V
	4HszJtQI44ABIuEvLnL4EvdivYCvlcocuQqkAhWZY07TiP/UMGgjdDMHM2L0DZJKnzkPJUSt72W8R
	HXiK9VY4BQPKAzwIXqkcz2kW6PJnqJTxf7GElshRaeKNqq+7pDaFgoeYSYVu6lkJSwfBhvUlUJz2Z
	7LUBrtJuTpDeqK4w7FUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcRc-00BB56-KW; Wed, 27 Jul 2022 08:31:04 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcRZ-00BB1t-R9
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:31:03 +0000
Received: by mail-yb1-xb31.google.com with SMTP id c131so29099292ybf.9
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lMQ6MzKO4jVrKuo9MQJs2hunXZNbN/6XhlZSMs6O3qQ=;
        b=PsSNWPTTliI2TkTnuFteKWoRbYUjQOc1fggFhpxgXJGYJvBawQ98/rpfuA2XNqwpO2
         +Ocz7HBDc+1bU5C4XjZc3Rb4QSkvDQGEtwmBJbJ1eDmV3SvrwIZLm85g3Jjvn31OoD09
         q3et9y2X/7rHiqPoI3SehR/bGGUWPPEYL8TZbWTCjutGkvFXkaIxpiqOjuF9U1rqBwxS
         d644Ejz/C1L9bu+uw7j31uKtbRswfGH85/rKX7j5Mbvw2G/9hpCMw5G1JlhlA7CjA6Fj
         MOLdZF7jNJajYTB7aBhFz2+5mtHeMRmS9x16jby3UjqRoVJiovYxq6kzu8o45HghytWE
         4zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lMQ6MzKO4jVrKuo9MQJs2hunXZNbN/6XhlZSMs6O3qQ=;
        b=4DOvis744GzvZZxeTxX40vyigyqtBLqnX4o8UmJL0rbDFz0aYglw3/y2NVOdLuNQ07
         G020wjD22rELFywTQ7d+hjTDMLiMZdkjpTvEypVNsT1A6s5WtxrMetquN9j3iqw5NXvs
         4ybm16spH29naKZu/tTtexR38NSZUVZEpEP2pqMYns2Z5jR1I6vYM/+f9bnnCVOWUyFe
         1eXDS1V5tklLpe2fEA9De7XSqWJ3rDRMk+yiSh2xqJmqQak05lDHs8Lmq2kyTgwVMK3e
         1AdgcXUQVFaLUPZLDTsF75YGV9gWBfOO7rr+7/STGhKQabpy9VbhzTCKRqruIYL/dFcz
         KrOA==
X-Gm-Message-State: AJIora8Jg32t+0L5BMgfchVwRdXeRFmspNF1EX3tNEV+2IrNtZ1xPIh8
	v+xHB9ywW2X+vYae0s8srILakKsC8dof+VwQ7V8=
X-Google-Smtp-Source: AGRyM1vpUsVjD1ybSSmSGeK4NXqsi3Dx+hXAOInHiOv+cY4eJ1nmeGjIHzJ1YrD2CFZRsw3XBJIKnvSKBHEsvWKm7/E=
X-Received: by 2002:a5b:508:0:b0:66e:db78:cc3f with SMTP id
 o8-20020a5b0508000000b0066edb78cc3fmr17203541ybp.299.1658910659135; Wed, 27
 Jul 2022 01:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <cc6f723a-441e-55fc-5044-890d45fb79b4@microchip.com> <CA+V-a8vwhsa2S2UX+hi0MPnrjpfRYLzo1Ca1vffx-5A9jr6Hpg@mail.gmail.com>
 <bcc1dbc9-37a2-157a-1da2-7e51d3edb6f7@microchip.com>
In-Reply-To: <bcc1dbc9-37a2-157a-1da2-7e51d3edb6f7@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 09:30:32 +0100
Message-ID: <CA+V-a8urJWn4Ob2Xs0w7f5YHJ1Ak362cM0427e494VqGREkYPw@mail.gmail.com>
Subject: Re: [PATCH 6/6] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: Conor.Dooley@microchip.com
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
	anup@brainfault.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_013101_909359_0239720A 
X-CRM114-Status: GOOD (  14.85  )
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

Hi Conor,

On Wed, Jul 27, 2022 at 9:21 AM <Conor.Dooley@microchip.com> wrote:
>
>
> On 27/07/2022 09:09, Lad, Prabhakar wrote:
> > Hi Conor,
> >
> >>
> >> Missing files? Where is your Makefile for this directory?
> >> Or the board dts?
> >>
> > My plan was to get the initial minimal SoC DTSi and then later
> > gradually add the board DTS, but it looks like I'll have to include it
> > along with this series.
> >
>
> You could still add a minimal dts & add more things to it over time I
> guess?
>
Agreed.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
