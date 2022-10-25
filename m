Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DB9C38A2D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 12:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rywGOwOajrHQU+tt8QhkpX2tKXSUsmkj+EMf3He1ols=; b=3Up6g72k3S5baa
	swvPXlH5hIaeEEpEm8ZD37Nvr9PCKFykxYI+dRV8j35kDh81V6AYyEfjiu5jKIHfWzynoRlKzukgE
	hnMK1Gx9eIk8Wo0Swu6MzzaZakv6AMZkLnij7+tg24iAbVwtOBdRTXHw1R4QjgleKwaB+er/KD+Xd
	4QDu/DOqq72Oh1NVbKeR936FhhiovlNFWpVkbfiVBilm5es5PoQXdm8lcHZ+AlK4MxFjphnPDZQDM
	hnopflEwDC4NjRzi4dv5408d1Z44ShFTHKo61w3O0CRQan/5QdZKpcQv7hbQyhu2N5MAano2F7v4S
	cugyoaQILnglCq2NMazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onJEs-005Dly-Ey; Tue, 25 Oct 2022 12:41:02 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onJEp-005Dkx-TX; Tue, 25 Oct 2022 12:41:01 +0000
Received: by mail-qt1-f181.google.com with SMTP id hh9so7340874qtb.13;
        Tue, 25 Oct 2022 05:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lao/ypUUNI0LjIKEvGEpGGZT7cntnLS2PFomcQrERvE=;
        b=UPrFnri1HQAphwomJzGPtzHOTiD8GMv7AfGUfra01vJppssYC83tDKquz3Pbcw4E7H
         NLB7xSbVUfOizWLMoAzcbV75Y05F1cfRrVp9S5TI8TYHtaoKUG1326vYjJk46QlV8a+V
         mIT0L/3Xm7l6zOgMWhb266tBhQ68P9GU8WkhzdxBEepRyY+84bTpmD69QbdCmo11GCsa
         GFvK0RGx/akl45gWAl37rUn6x5mKalVFB7VN9ME8WS+OFSezKAPfW7+u+Ph6pQkgsT7m
         8+X8rjRq/opB1Bcj+PAsiUCTDyVBkVNrIdxicJetgiCcKzQnJlw7bgyJkJj0+69Uo8fC
         wEKg==
X-Gm-Message-State: ACrzQf0zPdobmLfxFjRaZa6k+6Z2FD9aCGdaRSYxcVj9tluXlFOd12y1
	45y0Fy9qkBiNWMCor0osTtYmYf3/7cyk8A==
X-Google-Smtp-Source: AMsMyM6qlVonfJF5YtneL9fMhMMRMqFnvbOazk1J5ESC78woQ+B2ZaUUNVrQd5m+1n3n0qwnaoLhew==
X-Received: by 2002:a05:622a:56:b0:39c:de49:9ec9 with SMTP id y22-20020a05622a005600b0039cde499ec9mr32457850qtw.181.1666701657974;
        Tue, 25 Oct 2022 05:40:57 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id b10-20020ac8678a000000b0039a3df76a26sm1567839qtp.18.2022.10.25.05.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 05:40:57 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id f205so14427247yba.2;
        Tue, 25 Oct 2022 05:40:57 -0700 (PDT)
X-Received: by 2002:a25:4fc2:0:b0:6be:afb4:d392 with SMTP id
 d185-20020a254fc2000000b006beafb4d392mr31753639ybb.604.1666701657095; Tue, 25
 Oct 2022 05:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Oct 2022 14:40:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfExBuXNiRBaPRqaX9AvDprTHec7+1K-7Un6gDf6VWJA@mail.gmail.com>
Message-ID: <CAMuHMdVfExBuXNiRBaPRqaX9AvDprTHec7+1K-7Un6gDf6VWJA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] RZ/G2UL separate out SoC specific parts
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, DT <devicetree@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_054059_972933_F858BD77 
X-CRM114-Status: GOOD (  25.36  )
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

On Thu, Sep 29, 2022 at 7:24 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
> so that this can be shared with the RZ/Five SoC.
>
> Implementation is based on the discussion [0] where I have used option#2.
>
> The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
> identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
> created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
> (r9a07g043F.dtsi)

Thanks for your series!

> r9a07g043f.dtsi will look something like below:
>
> #include <dt-bindings/interrupt-controller/irq.h>
>
> #define SOC_PERIPHERAL_IRQ_NUMBER(nr)   (nr + 32)
> #define SOC_PERIPHERAL_IRQ(nr, na)      SOC_PERIPHERAL_IRQ_NUMBER(nr) na

Originally, when I assumed incorrectly that dtc does not support
arithmetic, I used "nr" and "na" in the macro I proposed to mean RISC-V
("r") resp. ARM ("a") interrupt number.  Apparently the names stuck,
although the second parameter now has a completely different meaning ;-)

However, as the NCEPLIC does support interrupt flags, unlike the SiFive
PLIC, there is no need to have the flags parameter in the macro.

Moreover,  it looks like the SOC_PERIPHERAL_IRQ_NUMBER()
intermediate is not needed, so you can just write:

    #define SOC_PERIPHERAL_IRQ(nr)  (nr + 32)

> #include <arm64/renesas/r9a07g043.dtsi>
>
> / {
>    ...
>    ...
> };

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
