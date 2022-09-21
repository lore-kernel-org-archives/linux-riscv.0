Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939EFECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 07:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u80+2asKVVMFPJWcfRFw7tBpjcPGDILaiEYnmSGzu6k=; b=kuGVbk3l8Cb8Ne
	9Ov+rpcEad09+byzRzz36ESkDMLjk5uuul6XjBL4AX+AgOrbqRA1riz/mB+Que80exSkvRvZqnbwB
	EkOxUm2Ja3tTLdmyxpC6D3kP8OfJxFcRiUlnELCXRHTB/z4UVR7c8E8jc+jL3cHCwMQ9FbAk4bZdZ
	pU2+ZBK/DvsN+h7hpxe/GSPFzc+XSMfL30S34n9qK3AdfSZxS/0NocKUdMoz7EetdlsMTS8p1vNvK
	dpUOKKulCvOPXQV9osKjrj4LsUsVVliCFbLrb9zWX3l282LOUuQNP9IsaolAOv1KaVwkpR9Sv751a
	HUqjSixbOvFx9+hceCYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oauUc-009hWq-Ia; Wed, 21 Sep 2022 07:50:02 +0000
Received: from mail-qk1-f171.google.com ([209.85.222.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oauUY-009hTu-4c
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 07:50:00 +0000
Received: by mail-qk1-f171.google.com with SMTP id u28so3429992qku.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 00:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YKleuzdmkhtfbEdrDq5PbIw/9ZW5U210A5YEzz/fnok=;
        b=n3m9luXJd5kLEqKKvYxUb0aOY/Oqy3WAKie8pZZCchpuG+ZcGJp/kL7BgR/UVClvdg
         vdkf85o4MAlCLX3HJYyuLN3wY56ikhLmjbiOLk5rWWsIY1gMeHihmFGF4taMDGUtQV+2
         FIzfRTp7HeXt1y9IGKuQ4gNfjRmGA+5xy6shDhL+9n6lwuiVJ3rNaCPvq3xuHTa0lSP4
         WtA0Foc+TK/0beXikfYtn7jEGlAL5xg6GC/ggHFK4wzegd3RME5Csl7/zoKDBoeI6Wom
         /KLD6wWa9xg4j0nfMc8VNPNCDkr5JwZCURlZM9hRwOO+EUqQjLI8vsemPdG3QZecGmOY
         q+Yg==
X-Gm-Message-State: ACrzQf2r5cf71VEgrw5qognzIfVxKHrZUq4xOt9IkXryBDGNq05maEFn
	Z9m/8R0Vuoqc/7/EoZA5h4TRALNAw+ggyg==
X-Google-Smtp-Source: AMsMyM5HCMGXZ18pOQGyffBbijZCLulnPzIivYojcCLT32uJzKkrJ/0ol4P9JvaenCg8ccbZvM1p5g==
X-Received: by 2002:a05:620a:4549:b0:6ce:76ce:3400 with SMTP id u9-20020a05620a454900b006ce76ce3400mr18668743qkp.328.1663746596088;
        Wed, 21 Sep 2022 00:49:56 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id x7-20020a05620a098700b006bc56c063fcsm1360545qkx.62.2022.09.21.00.49.55
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:49:55 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id p69so6941234yba.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 00:49:55 -0700 (PDT)
X-Received: by 2002:a5b:506:0:b0:6af:ffac:4459 with SMTP id
 o6-20020a5b0506000000b006afffac4459mr21105286ybp.365.1663746594861; Wed, 21
 Sep 2022 00:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220920184904.90495-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OS0PR01MB5922AFDAFE3DEBBFFF875875864C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59224D591B8A227A5655ECDE864C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CA+V-a8s-6FLu-5D44-Szt8eN1V0rhPxm+cO4OrcKmT90O8LoXg@mail.gmail.com> <OS0PR01MB59220E0803C83EC63954340E864F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59220E0803C83EC63954340E864F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Sep 2022 09:49:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViUPjWHg0=99HE=GdsuKRTEF37A-OcTf218Kag=sByMg@mail.gmail.com>
Message-ID: <CAMuHMdViUPjWHg0=99HE=GdsuKRTEF37A-OcTf218Kag=sByMg@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] riscv: dts: r9a07g043: Add placeholder nodes
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Atish Patra <atishp@rivosinc.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_004958_260838_4C6F59AC 
X-CRM114-Status: GOOD (  25.00  )
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

Hi Biju,

On Wed, Sep 21, 2022 at 7:22 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v4 07/10] riscv: dts: r9a07g043: Add placeholder
> > nodes
> > On Tue, Sep 20, 2022 at 8:26 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > Just ignore my mail, As I realised IRQ property in each node will be
> > a problem.
> > >
> > Yes the IRQ numbers are different (offset of 32) along with the IRQ
> > parent.
> >
> > Refer this thread [0] where other SoC vendors have similar issues,
> > maybe in future when DTC becomes more clever we can use single SoC
> > DTSI for both.
>
> Not sure, May be the macro suggestion mentioned in that thread will work for us??
> As it is just only the interrupt properties that differ which is
> handled in macro. A Generic macro in common dtsi which is
> expanded in RISCV or arm64 specific dtsi to get proper one??

I brought it up with the DT people in a separate thread[1].
Please continue the discussion there.
Thanks!

[1] https://lore.kernel.org/r/CAMuHMdUPm36RsxHdVwspR3NCAR3C507AyB6R65W42N2gXWq0ag@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
