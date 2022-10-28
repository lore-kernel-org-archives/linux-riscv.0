Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96133ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 11:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mHIx5hLUQOxNJbh9OaoAI1hEF2PaY54SFSEtgCRxC+g=; b=hL6v/tv4K1H5e/
	zQ1TdWBpTUkrUWLyoAmBKLfxiS92geXXUyZAXNZfvNZoWO1PbmVOyb9c91L8hM/2xtFrZkjjmF+QO
	i3lI1S3nd9ZuCx/s3Cs5P/xfjFuJD0aJ6IFseus1LvAnBe0DO/8Stww2QXnGL9EU14jbRpe4nEz2i
	3YYc41W+nzzafHQLXhsRWBv3W9MDbPZRGaqRErHmw9EYvf250Mpiz6zqMeSs8lSkEEob3elN1Lsza
	25v4Te7lHQjkOwzh2TTsHdJeGiXSD+4kgqsEypeK9hQcgkcKWiWSx5bc9P76tBtxd1l1FBmwPegXK
	OjwGF899uXQKFyMttk1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooNe6-00GyGU-F4; Fri, 28 Oct 2022 11:35:30 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooNds-00GyCO-HK; Fri, 28 Oct 2022 11:35:17 +0000
Received: by mail-qt1-f178.google.com with SMTP id r19so3250616qtx.6;
        Fri, 28 Oct 2022 04:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yam5XYWQb6y7gKmWe0fD9G/82ZNnLxLp0NPkpKXtkPQ=;
        b=PvX5Vr6xvUyJ3+2DXgBq6M0VNs6joCBc+VAFMb+WJW1e9K1FCg1OD7y8S2BDG8zMTS
         bY3AfhcMdvgIzZuMiyC75ygGv2Y2tFHc6f0xbFtFqgX4wsBop7krdDp2D3fKPDXyJO87
         6JEbLJJlLzviFNJhgF2bal7PGB93JNarRTWXF6coIvb7Veupwrjc+aWdfX3NrWxOSjyU
         OPGlYHRFsxtzHJ0cevYwaHAbnzupFFka+LbdZHAADjhS9NIG+pcsqyvGjJeFJioBOyq7
         EyjqnDkmoTzoClEaotosfEs/a0N/5+91HsmsprraDQKdWo+LkckOQlN9kPTJeJ6sIFwd
         W2Gg==
X-Gm-Message-State: ACrzQf2gD/XROXlt66fD/2iJbNke9xw9AHB6mo+yd9RWPSQvzvZa/0/F
	Gt6s2gCk06WFA9yiaTyq2x734CzWtSzcOw==
X-Google-Smtp-Source: AMsMyM4uBQmTI6x1tce4udg+Eyis9Hq8jcAadiitD+LOWOahWYv4cakVSdoF1gtwLmPTXefMPRk6hw==
X-Received: by 2002:a05:622a:3d2:b0:39c:f353:d031 with SMTP id k18-20020a05622a03d200b0039cf353d031mr46144340qtx.249.1666956914815;
        Fri, 28 Oct 2022 04:35:14 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id d17-20020a05622a15d100b003434d3b5938sm2301500qty.2.2022.10.28.04.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 04:35:14 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id z192so5869307yba.0;
        Fri, 28 Oct 2022 04:35:13 -0700 (PDT)
X-Received: by 2002:a25:d64e:0:b0:6cb:7faa:af94 with SMTP id
 n75-20020a25d64e000000b006cb7faaaf94mr16836632ybg.36.1666956913602; Fri, 28
 Oct 2022 04:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221025220629.79321-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221025220629.79321-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Oct 2022 13:35:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXw0DTAXFjqutP4X2E3gzkBQ579tHPfjtLC2X0j3R-+Lw@mail.gmail.com>
Message-ID: <CAMuHMdXw0DTAXFjqutP4X2E3gzkBQ579tHPfjtLC2X0j3R-+Lw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a07g043: Split out RZ/G2UL
 SoC specific parts
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_043516_600180_20BA2E7A 
X-CRM114-Status: GOOD (  20.80  )
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

On Wed, Oct 26, 2022 at 12:06 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Move RZ/G2UL SoC specific parts to r9a07g043u.dtsi so that r9a07g043.dtsi
> can be shared with RZ/Five (RISC-V SoC).
>
> Below are the changes due to which SoC specific parts are moved to
> r9a07g043u.dtsi:
> - RZ/G2UL has Cortex-A55 (ARM64) whereas the RZ/Five has AX45MP (RISC-V)
> - RZ/G2UL has GICv3 as interrupt controller whereas the RZ/Five has PLIC
> - RZ/G2UL has interrupts for SYSC block whereas interrupts are missing
>   for SYSC block on RZ/Five
> - RZ/G2UL has armv8-timer whereas the RZ/Five has riscv-timer
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.2.

> ---
> RFC->v2
> * Updated commit message about timer

Right. And I'll add while applying:

  - RZ/G2UL has PSCI whereas RZ/Five have OpenSBI


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
