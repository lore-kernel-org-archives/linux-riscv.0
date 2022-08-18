Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55370C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 14:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i03pehyniRWLUwbQOy0XmTvXvnYS97eeQXAREZd/X7E=; b=WeqdvPz0YcbDjq
	jCgZ5yLEWxlJfA53gUF8AkZV8EHj86XvcdiUwhDVeLUmuoZPqO/oQ7iuId02j/DT4WZTYuqpKpd/E
	42ZzwiNgEJDC60q6aeeTiWYemzOopfdti2aJY5wVtjQOzzFYUENoYM1fftpQUiHJcEG1q6p91UjZT
	LBCWZdK8oEuODmNryo4pXD6XiyQWUFjEWf9Zm2SlptkX2vMmoZitH8pGY5PcyoB1REEb9AWEWXkxo
	Oyh6ckBHtPHo1WklXm4mV/M6e7OAVvMQKnVy2VAAwBCVyKF9+m0+zIDBh8rSeM/3+Mja+bZzTO463
	8XprITWFxInFktZfkCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOgx1-006KgW-5H; Thu, 18 Aug 2022 14:56:51 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOgwO-006KLP-Mo
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 14:56:17 +0000
Received: by mail-qv1-f43.google.com with SMTP id p4so1358595qvr.5
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 07:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Z5riCaypRqhNHMxmNIhnODlP9dCEQqyLvOBXtOwqdlQ=;
        b=HuC7/rTchUz5IYnO1eBuHGeyZEfNSuKahyRbAsxVyjiIcxVB/j30/8cjIta/OV9hIG
         vViY/kApJrZiTOaBZ/g5hx2gqHcSUEE9/uz0wBXx24c1k58yPX9uUyZTCohmMfxygGUH
         78YQ328NHhrUgL2RRz28xVMxEE+R/k3txunmP6I42liu3Zb7Rt+CpY0Uc6M3rZg+4MzY
         sWJMWPeFCOX7mCubbTiuG+pVXW5IIzc464T989pCpBHG03+LLwzH7I/11DvEdcUBSEUf
         /5HWBV66wze5w4W3MRgkziX6XvypxK/62vVbvmkfW7c+HRw4bZSkc1jgXHrFnsOGLtz9
         0q1g==
X-Gm-Message-State: ACgBeo3HG/uOpYEX7QQ+23paAq1/3QdMVkuq4Z9ahRM2X4nDI24oieT7
	N7SkgffqdIZ0hWnAe2moUWEwxfHG5C9avQ==
X-Google-Smtp-Source: AA6agR4MHUDzcNijGZX5wvpB2TRQTKytYhNLhC1B93TprDB6XTv/CQT983mSY432P7ZpveuPQo9cjQ==
X-Received: by 2002:a05:6214:c21:b0:493:4aa2:ef9 with SMTP id a1-20020a0562140c2100b004934aa20ef9mr2839870qvd.131.1660834570903;
        Thu, 18 Aug 2022 07:56:10 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id ga10-20020a05622a590a00b003430589dd34sm1149183qtb.57.2022.08.18.07.56.10
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 07:56:10 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-32a09b909f6so48667627b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 07:56:10 -0700 (PDT)
X-Received: by 2002:a81:658:0:b0:334:a23e:6caa with SMTP id
 85-20020a810658000000b00334a23e6caamr3027947ywg.283.1660834569918; Thu, 18
 Aug 2022 07:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220815151451.23293-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220815151451.23293-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Aug 2022 16:55:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxxdfGoqELDZY7fT2v=hv1Kgsy=nrTSLivaDQVy0FMww@mail.gmail.com>
Message-ID: <CAMuHMdXxxdfGoqELDZY7fT2v=hv1Kgsy=nrTSLivaDQVy0FMww@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: riscv: Add Andes AX45MP core to the list
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <Conor.Dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_075612_795294_BF50C022 
X-CRM114-Status: GOOD (  18.72  )
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
> The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> Single) from Andes. In preparation to add support for RZ/Five SoC add
> the Andes AX45MP core to the list.
>
> More details about Andes AX45MP core can be found here:
> [0] http://www.andestech.com/en/products-solutions/andescore-processors/riscv-ax45mp/
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

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
