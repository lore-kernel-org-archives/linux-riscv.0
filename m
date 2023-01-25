Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B5EC27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 11:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Qmpp/cwVcy8wcBWziVSDAD0Z/WznQyHR2DhWtAgvcc=; b=sCsglwdBD1QRaj
	JjVFOEhISAN5T3fjXaXLUtaMYWoyjBQpR+p9ywalJFvoGMRB4Kj1YcLxc24KfSPsQkoHEKfHCZGgO
	qK4cgozrnW+iY3ybUk9B6zrYIwAVDmA85vdm89DN6M+jy7KL4OoyH309hVJ5GFA8qCZu0lkiVZHEq
	/GZMr2Nd1zsatF/bCQPRnIBaFvCfrjmMZdnqp/HIePZ2ZLAWF73BXeNVYw7HyyXJc2yRUxHh9eY1i
	4UA+UtQ1A83uUj+GgFVMOmpkoVEAx60nnLLv0+wQ68wjKNo+FfhBcnj1bNdUj1CPj4lhR+vjREB3z
	KdwTAcw5aa3e7N7sTiNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKe9g-007CGF-Ab; Wed, 25 Jan 2023 11:41:28 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKe9d-007CEb-Bx
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 11:41:26 +0000
Received: by mail-qt1-f172.google.com with SMTP id o5so15615658qtr.11
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 03:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0Lw6g01TroemQ7j6adGGcs3s/PeT68xQ37YefaRRX8=;
        b=pIAyVXojuX2X2hj9BSFzwRLYO6EqBRtW6jLcEWYK1c2wd8TBYUHfW4otndFuaVNrsW
         h1HvyFxjtnGMBx3xnw40AqrBSVi/N14Ax2dHeHl0VNeqXuLlwXbvoq/UAq4IcwgE9k2E
         3jKdmB6PZKmH1oGL/t0Cegni/mI68hbqjUFxw1U49knNaSFDmdeQekHA9E28TUQfV57F
         4RL29o0NpSk/ItQEgu1vvJ69h3dSsGLVJwFqrhVArJYbHCBCM6+78CAavCnqbHjLc/BF
         3jhH9gMiPLbcet/kuhqg2IPMDyE7Ftm9zfQyrOJNi2Vtnf+zCkQPuuoy7VCKVrK+3m0U
         1urQ==
X-Gm-Message-State: AFqh2kpJ4WhTo92gPX4GVACcclkTBBfeibDNAbSRhC+sNPByLwQWre9k
	aSHkkkSEg/ofk4zYAtKecK7m3APVHERueQ==
X-Google-Smtp-Source: AMrXdXv31Ef7qJByU7F9Om/IAg1RI/BCrGryIdacTq1M86GFvbWcQ5vEeNmZCyOAJ+ZdPneAM2XLgA==
X-Received: by 2002:ac8:6bc5:0:b0:3a9:6b48:a130 with SMTP id b5-20020ac86bc5000000b003a96b48a130mr42899967qtt.34.1674646881259;
        Wed, 25 Jan 2023 03:41:21 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id bb5-20020a05622a1b0500b003b646a99aa6sm3125643qtb.77.2023.01.25.03.41.20
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 03:41:20 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id m199so6851853ybm.4
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 03:41:20 -0800 (PST)
X-Received: by 2002:a25:37d4:0:b0:80b:8602:f3fe with SMTP id
 e203-20020a2537d4000000b0080b8602f3femr556918yba.36.1674646880330; Wed, 25
 Jan 2023 03:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20230102222708.274369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230102222708.274369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jan 2023 12:41:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5Aj_BNSOOOCTiqi3oLWV7qNv6-pbEo6ytf88DJB8taA@mail.gmail.com>
Message-ID: <CAMuHMdU5Aj_BNSOOOCTiqi3oLWV7qNv6-pbEo6ytf88DJB8taA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: renesas: rzfive-smarc-som: Drop PHY interrupt
 support for ETH{0,1}
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_034125_423309_E62F1F0D 
X-CRM114-Status: GOOD (  20.55  )
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

On Mon, Jan 2, 2023 at 11:27 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> IRQC support for RZ/Five is still missing so drop the interrupts and
> interrupt-parent properties from the PHY nodes of ETH{0,1}.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi All,
>
> This patch is to avoid build issues due to patch series [0]. This patch
> applies on top of [1]
>
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20230102221815.273719-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221229230300.104524-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

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
