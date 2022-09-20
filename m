Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C84C54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9JyFtNrp3wRZehUT/2wwoN/GGMBkTpSIbAWqrI9aPU=; b=lzntdNH0W/XCx8
	I2ARrByXOAgc3ISBjf0zHB/zIpG+N8tl5pyAQHOyC2DbmwUcvLOkcS0hrapbC1/PwKZoSB/KUklJU
	5UilAQegQc6mgdqQOdo7tXc2FtLKFaCJlkUveI8maYNBHuP55rCPznbFut1VhiDhUs6q5/PqyZ2iP
	FZ37fVffVzH+aU72/bdeV1gUwqhBJftFE7NqM2PkwW/C+MjuAavHXJV5GWtcALA48YML9hkYb9CeP
	LjfKEihjhcMJW2NFLBbO7kVMh2URpkZI0PXItxFDGtzGoG4coZczW+B5oBqYe1ZAqk46ZGkdGcRN7
	dQzypKPVdAlW2Nw8dkJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oabvl-003YM9-OA; Tue, 20 Sep 2022 12:00:49 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oabvi-003YK3-Li
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 12:00:48 +0000
Received: by mail-qt1-f173.google.com with SMTP id r20so1451892qtn.12
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 05:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Nzu6kCwqk+cs06IVV+BbpSyucH7pJu1yrAhFxm/Mxog=;
        b=nlEPR5zPBTSv0Y6CifbDhLtuV2TMB/XXwfsin7FJ1MbhqtvSSq4jl1qt3DxlZXUdd6
         mjwr8bsjlhWQ6ynxkFO3Bs7vZX07l7YE2MPgQ/DotB6C/8XZw9oELG/7o4onUSEz1Kcf
         0kfr9IgVYZtAyQp38PYBGCnz+8ddYSmhdqk6Enp2bf5apcqiTRfj2lXADtXMQmKrdCl2
         k7sSlP2nMaSia/FeLuR+Zbqjn2g5KTfwBcQVZ3wf+4em6ZWD+TZYRTCg9xNp0JUYjs39
         KGbrjXaM/yeSNp+vXupsFcnLKwBm5k2FunYFWWp/0J3tzI+tT+AFLlxdlPdaHSQmt/Um
         i9oQ==
X-Gm-Message-State: ACrzQf23EMpPRrF6l4pwgUlXMaIOo3XVlMTyAJShbi1IHzPi8/1K4VOx
	IsnZlBPQeVaChmPhS+CkyioyEM3MwgpkTw==
X-Google-Smtp-Source: AMsMyM5iKyIMvAce9ydP5ODjhCt+VxFiS1DOSsQ6ui1cmB6BzKNdJcM7bi8Viy9Gk+tuzNqsISVdEA==
X-Received: by 2002:a05:622a:408a:b0:35b:b5fa:5e32 with SMTP id cg10-20020a05622a408a00b0035bb5fa5e32mr18555667qtb.122.1663675242489;
        Tue, 20 Sep 2022 05:00:42 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id m15-20020a05620a24cf00b006cbdc9f178esm15883qkn.25.2022.09.20.05.00.40
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 05:00:41 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3487d84e477so24051697b3.6
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 05:00:40 -0700 (PDT)
X-Received: by 2002:a0d:de43:0:b0:349:31bd:e8d5 with SMTP id
 h64-20020a0dde43000000b0034931bde8d5mr18450435ywe.283.1663675240491; Tue, 20
 Sep 2022 05:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220915181558.354737-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220915181558.354737-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Sep 2022 14:00:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnrJuPUM9=-b1i8yWvBtVzDm8GNMXdbyNb3KFpK87cLw@mail.gmail.com>
Message-ID: <CAMuHMdVnrJuPUM9=-b1i8yWvBtVzDm8GNMXdbyNb3KFpK87cLw@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] dt-bindings: soc: renesas: Move renesas.yaml
 from arm to soc
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_050046_731902_7FB92A78 
X-CRM114-Status: GOOD (  22.67  )
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

Hi Prabhakar,

On Thu, Sep 15, 2022 at 8:17 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> renesas.yaml lists out all the Renesas SoC's and the platforms/EVK's which
> is either ARM32/ARM64. It would rather make sense if we move renesas.yaml
> to the soc/renesas folder instead. This is in preparation for adding a new
> SoC (RZ/Five) from Renesas which is based on RISC-V.
>
> While at it drop the old entry for renesas.yaml from MAINTAINERS file and
> there is no need to update the new file path of renesas.yaml as we already
> have an entry for Documentation/devicetree/bindings/soc/renesas/ folder.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> rename from Documentation/devicetree/bindings/arm/renesas.yaml
> rename to Documentation/devicetree/bindings/soc/renesas/renesas.yaml

Fine for me.  With the yaml path inside fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
