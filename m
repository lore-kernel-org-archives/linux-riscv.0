Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD97FC38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DjWNiIbLNZC8xyDwl4ffuq3F01K/1H9lbAzrAAeCAls=; b=mogmtYh1+m4Rtm
	wRiIge6E6qDZfaowL/hUIqdTsM6b/CUa/mrD7huWwLZX83Qu7bF7LSJh4MWCVgDLWmDv0aHxllzUp
	EeXBPl7bcaY1C4HbWmR+vi0vI195HB/uHkSwSyoSi2c/DG0LKDQPUwZ25fQtDsuc9EFRPligdU2z9
	Hl6W+q7Q6pp/01ynPpA8rJUi/bwDZ+Nny4x8h33NjD98bYESQ37jwT74KIOPeKevBr/yx0lKTNmxk
	3NQ4MrZAUawT3bNxdwopHuFPM34avCyo7VKMVygwOiIqHM3iXXjQzV1MXXTCybicqZ45VoBUX3b1r
	Uj9oBJThK8kmqkHsKQGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooNao-00GxCU-6A; Fri, 28 Oct 2022 11:32:06 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooNaY-00Gx9q-SZ; Fri, 28 Oct 2022 11:31:52 +0000
Received: by mail-qk1-f170.google.com with SMTP id f8so3186141qkg.3;
        Fri, 28 Oct 2022 04:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n41bBGLdctrsHUVRRarV2Di1E8TbeCdMm8nLJHc7p30=;
        b=AzpsMJlSG/cKmXiD2PANstSYjBc+UiW+2ZZuxCYyoO7x1w3sxGpOV4mFBfdy5nGv8+
         NDpqxSB85eVb14leDDC2BR/B4V7Teq2v2umtfa8vQs/3O4xaoF2ZMs6aMQX67tT1odYv
         bkoOLtFHYu63zxUXOYfzb6sSgLUAu19xIIt2KX84Pz0GojxlGEGF1XaPMYIYKRzCPIIL
         K7wDZ/HUo+WO+4geUXiJeSN3BgOynUA8i2pdPd/zdmfe5R2o5AI/KVO8c50GndNLEluP
         mQC/GNMLb35YE7vSmgkgtt3jLYhdYV1cvSkMW2vcR0sXddkEHZkiATmnqaN1p2gytVMC
         yCuQ==
X-Gm-Message-State: ACrzQf3o02iS9G54dfTO8Q6+o1t26ML8KC/4ThDx5EHYMNpgJOZJrlCF
	KL5uj87fluBwtZuTYFOPOU+oqd/XPCHK4A==
X-Google-Smtp-Source: AMsMyM4lNVh3DlrfEwX3VOToyYzCQ0qu7LMAQPhK89BHH3xtjN4BtuoPz/iByXAhe6PJKKnSUeOYsA==
X-Received: by 2002:a05:620a:bc2:b0:6cf:468e:b8ce with SMTP id s2-20020a05620a0bc200b006cf468eb8cemr37014973qki.699.1666956708176;
        Fri, 28 Oct 2022 04:31:48 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id fb26-20020a05622a481a00b0039cb9b6c390sm2219563qtb.79.2022.10.28.04.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 04:31:47 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-3691e040abaso44503067b3.9;
        Fri, 28 Oct 2022 04:31:47 -0700 (PDT)
X-Received: by 2002:a81:3d2:0:b0:36b:6772:75a3 with SMTP id
 201-20020a8103d2000000b0036b677275a3mr29799990ywd.383.1666956706935; Fri, 28
 Oct 2022 04:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221025220629.79321-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221025220629.79321-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Oct 2022 13:31:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-OXF3hG2im4SNsFsLXES84PVKkOxo5gRAi1dD7V6BnQ@mail.gmail.com>
Message-ID: <CAMuHMdW-OXF3hG2im4SNsFsLXES84PVKkOxo5gRAi1dD7V6BnQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r9a07g043: Introduce
 SOC_PERIPHERAL_IRQ() macro to specify interrupt property
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
X-CRM114-CacheID: sfid-20221028_043150_944791_F1C41555 
X-CRM114-Status: GOOD (  19.63  )
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

On Wed, Oct 26, 2022 at 12:06 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Introduce SOC_PERIPHERAL_IRQ() macro to specify interrupt property so
> that we can share the common parts of the SoC DTSI with the RZ/Five
> (RISC-V) SoC and the RZ/G2UL (ARM64) SoC.
>
> This patch adds a new file r9a07g043u.dtsi to separate out RZ/G2UL
> (ARM64) SoC specific parts. No functional changes (same DTB).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> rfc -> v2
> * Changed the SOC_PERIPHERAL_IRQ() macro to just accept IRQ number

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.2.

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
