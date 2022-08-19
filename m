Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B33BC25B0E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkGGgD644LdYFtSJoaXdgkLztml2SQyraDK7DNFb5Bs=; b=heLiF6AGkGIzxS
	q8HaAQ0GyV3mMEh8qvT8sEnvmRIw3lvquRhkffSVDz7PAUwkdqzvJ/+sEA816OgMMmofkYGgNq3qC
	ogbAXQNslDoiYDnRgz4b/K7ugmkppIGYRO4NcFJFjKwFoXN8ngMepLqsWRHVqiV1gsABsrG4if5TV
	rJEQPNgTZkFAiv5uidoD4OQkIUfi70iP8oCEyTqehKcZq80ACxz0oeyNUwoYmawqjmETdPGA5wxFJ
	o+SbrABvmI+1EVsodd6unvKmgiIJxBS19aGlIh1oqHH0xEpK651suRPappl2jPAn81lnjUkDpVIok
	Ty5G3n5urr7ZtJaw7x/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxeg-004JBC-28; Fri, 19 Aug 2022 08:47:02 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxed-004J5O-2v
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 08:47:00 +0000
Received: by mail-qt1-f177.google.com with SMTP id l5so2869967qtv.4
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 01:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+CK74Trg82hJrsPmCVARJr/hdgf8gZ1Ixa5AUbpaM6I=;
        b=8G00BlAgCDu+G70FwLBlUDxBDdyCa9ZCfa4/8lga81BNwy7a2dL9QbeSbwwP7c7YlE
         YCD3PB6J1OEAbEiesjdta8fooMCTuZLohAN87kN1t4Meo4z0HTw2UnIfANNP57TN2vK2
         NVc6KLgUpHDAKAX65BGXi/u4wkEHBDp6HUB2gdabALDy7niq3VjvfiGczfGGnFyR8UNn
         XMriK4aO1Urkl+OypmUCDuNP6/UbFYW8BoEmnbvLt+/Wh5qpYRj46ne47G5yTib15MlD
         DpQWD2YnG7L9OA1A9q8K4ytZ/BNpWipt+RuFHSBe80wkoeg95CQJygkrmD3jWOyEjhBT
         6ljA==
X-Gm-Message-State: ACgBeo2KKo87OzlnpEcKd2UmxglU5U9iroUUyReHq+WIUjWzVn76duAt
	RgXrHB+mG1sRHlhgnxTLizVgi5T8dCLuqQ==
X-Google-Smtp-Source: AA6agR5d9pX16k52o4B6YuZbNWWraLB1Ef6hsVkfxeS+GF8h5icheIaUWzvHYuKwBIew9AgcdolbuA==
X-Received: by 2002:a05:622a:1009:b0:343:568f:fee4 with SMTP id d9-20020a05622a100900b00343568ffee4mr5869835qte.178.1660898816767;
        Fri, 19 Aug 2022 01:46:56 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id z15-20020ac8100f000000b003435f947d9fsm2473100qti.74.2022.08.19.01.46.55
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 01:46:56 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-335624d1e26so104622137b3.4
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 01:46:55 -0700 (PDT)
X-Received: by 2002:a0d:eb45:0:b0:333:f813:6c79 with SMTP id
 u66-20020a0deb45000000b00333f8136c79mr6505642ywe.384.1660898815488; Fri, 19
 Aug 2022 01:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220815151451.23293-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Aug 2022 10:46:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVn50f3HuphyqeGmgzXA_TqHdqDJO7C3YZd=qMA9ZRigQ@mail.gmail.com>
Message-ID: <CAMuHMdVn50f3HuphyqeGmgzXA_TqHdqDJO7C3YZd=qMA9ZRigQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] RISC-V: configs: defconfig: Enable Renesas RZ/Five SoC
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <Conor.Dooley@microchip.com>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_014659_171472_2D8B230D 
X-CRM114-Status: GOOD (  17.70  )
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

On Mon, Aug 15, 2022 at 5:16 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable Renesas RZ/Five SoC config in defconfig. It allows the default
> upstream kernel to boot on RZ/Five SMARC EVK board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
But this may need a respin if "[PATCH v2 4/8] RISC-V: Kconfig.socs:
Add Renesas RZ/Five SoC kconfig option" is changed.

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
