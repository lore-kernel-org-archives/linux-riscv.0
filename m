Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC24C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUxJiCPLc2R/dflNiqC2JlWHOMRhUItu/CvMgXwGizE=; b=zFB3ZAp9TKflAP
	P6sliXNY7ihMjidJSoFqiCHqiYjIkbft6PXpU6zl9G8Cg3f9Iwcy8T7Af6c5tM1PbBni47Mzkt7tR
	rTEPTR6UflFiRMOwLCSdTHIAe/tJlxW5a3bSx/R4WpCni/xy5QeFhyYYmNjKkcS3aZ7ZjfJqxPl5R
	UyH60SIQaZABO5gD4cskWQJq3t93OhEAcAYAoB2KKrhuWR2IcvsdGif++3Keib1t7q6/IYd0fn5FL
	mF1uI9f0jrtyv7f2wKhoTlcV+Oj1DaXL5dG4R85BmzneJfDSXs5IyaKJTmrk/RLVeGo6GYZXEFGUg
	kFOac83Rkfy4/5pdARIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFeAf-00CCc8-SR; Wed, 11 Jan 2023 16:41:49 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFeAc-00CCbg-Rp
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 16:41:48 +0000
Received: by mail-vk1-f181.google.com with SMTP id b81so7466149vkf.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 08:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zptl82ttrhrV63pMTO0viIa9cKU9Map9hB06vVk8Wqo=;
        b=KUFPK80XE79MuYwF/7roqlxrdT9Jg999H1yvoNrxt6cydxShEvRCcvQwlqTXAKLCsw
         CREe6u48E4Ff1jF0gXgwEzGqpLtgaqgdb+SZiee96P0vjN6zXvIdlF38zchjB8Jt9/Yn
         Jqdj3hhsYde7qoOQan+G9enb6rRZTeSD3Ar8FBB0H2gWByBu2AP6ReY0pzFbnuQ5j6sy
         80dkf8+4OF7GCML5li+7ckCC+tZKqTG6FVo5+0DlzVkSJu6xRAes5vC3CyT29GUonme6
         4HBN7JTLsqjDhrlV/tabdo0aAefMFDRiIJyIKKoSL7+3TCTKbqP+5FzxUpqXx8i5DgdW
         6xCA==
X-Gm-Message-State: AFqh2kokmFflfr9UA40XY2eEUrepVb+q8m9PenOViX2Uq88rjEYjhLDU
	9RlRGnxp/QpkCt8YWAibn1lNae5ekZcBiA==
X-Google-Smtp-Source: AMrXdXtH68rDIV0YII+loK1aYjGfEo5INoZhykGPY+O18XLgZQcv6t+0L1ccFMtdYhHuPJcVLhrzbQ==
X-Received: by 2002:a1f:3147:0:b0:3da:822e:4d70 with SMTP id x68-20020a1f3147000000b003da822e4d70mr7664049vkx.12.1673455304157;
        Wed, 11 Jan 2023 08:41:44 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a0c4600b007054feab4aesm9229232qki.27.2023.01.11.08.41.43
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 08:41:43 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-4d13cb4bbffso82118627b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 08:41:43 -0800 (PST)
X-Received: by 2002:a81:1751:0:b0:4bd:caff:589e with SMTP id
 78-20020a811751000000b004bdcaff589emr2155587ywx.502.1673455303487; Wed, 11
 Jan 2023 08:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20230102222233.274021-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230102222233.274021-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Jan 2023 17:41:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXVPdWb2GGSOoVSLNNE6k-JpKnqMGXwpJH=HaGz94GHQQ@mail.gmail.com>
Message-ID: <CAMuHMdXVPdWb2GGSOoVSLNNE6k-JpKnqMGXwpJH=HaGz94GHQQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: renesas: rzfive-smarc-som: Enable OSTM nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_084147_618263_F4CCAC10 
X-CRM114-Status: GOOD (  18.14  )
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

On Mon, Jan 2, 2023 at 11:22 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable OSTM{1,2} nodes on RZ/Five SMARC SoM.
>
> Note, OSTM{1,2} nodes are enabled in the RZ/G2UL SMARC SoM DTSI [0] hence
> deleting the disabled nodes from RZ/Five SMARC SoM DTSI enables it here
> too as we include [0] in RZ/Five SMARC SoM DTSI.
>
> [0] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * Rebased patch on top of [0]
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/?h=renesas-riscv-dt-for-v6.3

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.3.

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
