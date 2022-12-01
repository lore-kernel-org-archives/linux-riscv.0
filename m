Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECAFC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTUcUvSDqfV3ucvZBVq/VRvPVfGMHux20uk7+WG5Wng=; b=VDrjPrZgBB7lnw
	eWcbhtIW4hfWEWgIHXqGdKwXRIpqESWrke3UpVeDkzGGodZ+eebvzbTem/CYbPv/oJMSpmb41Ggok
	RZHaboMJdfxQzPIdKENCgWlaDrwBpsAHHn16WrvYbPXbDD1LI5ruC8m9hfRvNygE70BjhPNAGa6x2
	ySR7ozTsdXe+NdUyCXtPITMa9sn/ixbID4hj6WbSkDERwoHJx4kpAeN0JzMRwH1Ai2EILiE+nfarB
	8vPCeRg/BF2+lVWLULF4MoVVxW5iFz3hZALI9y2jkt+UdwqD1k+BXOt9AHLezA+jmEiplf+/fhmaJ
	fSiHjX4lSvvBcbZ8eIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fBY-005zm8-BU; Thu, 01 Dec 2022 08:44:48 +0000
Received: from mail-qk1-f173.google.com ([209.85.222.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fAP-005z1W-Fb
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 08:43:42 +0000
Received: by mail-qk1-f173.google.com with SMTP id x18so690075qki.4
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 00:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBR3BOXoBY5WpTgUL6g8XKshM6R6PFszC3zTZx0qYOk=;
        b=vEavrxrI29g0tlKyqA/ARFSK+I86ihikD/xaaP1Qm6vEpu9lC0qGdSj3GQ8qE/cLjZ
         aXEfEg+JIC6VICpUoD27wJTIJuw9Ipzv42CQT+4xGH34D8pnHvR/ikfVVm6wxBYuA5KI
         6kGrQz5NyuixUomBrAyK6psI9lzzq+E9XevezeqshzcUXg2n9JMz/cJuwyIvNncotXle
         AFY0quqlfG9QLLjb5tKONqs+PcSGLHIpxeA18IYZsz31lqlOZNHh/nr9bDRXMaP1UyFC
         5ICRAlvVwY5OfwhSwOi7c0WFhX5aX8uDWQ5UaGDuDtOjWo759JFxJpa+kUWz8tZ0mr7Y
         XMvg==
X-Gm-Message-State: ANoB5pmsqnUFfaxEZmmEiMNgDuMO3Eug3eKCZIqvVcIFpmzR0En+P3Sr
	5FCfGbbI1rYaFADayHdpAbobUgNoYeSb8Q==
X-Google-Smtp-Source: AA0mqf6q6j0iPlQieqF6rr3EpA+gmEcrxnXJepnSV/ulkrVh0m628Qe7TAdhJ/cznIyI/ti8RqKZJQ==
X-Received: by 2002:ae9:e90c:0:b0:6ce:abc0:5d4d with SMTP id x12-20020ae9e90c000000b006ceabc05d4dmr44287774qkf.121.1669884214459;
        Thu, 01 Dec 2022 00:43:34 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id j11-20020ac8550b000000b003434d3b5938sm2284259qtq.2.2022.12.01.00.43.33
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 00:43:33 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 7so1116742ybp.13
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 00:43:33 -0800 (PST)
X-Received: by 2002:a25:d655:0:b0:6fc:1c96:c9fe with SMTP id
 n82-20020a25d655000000b006fc1c96c9femr1037423ybg.36.1669884213221; Thu, 01
 Dec 2022 00:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20221118135715.14410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20221118135715.14410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Dec 2022 09:43:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWpya10MbGceexKNd+eJnTamcYWPbkxwxOCZZNthu6Xg@mail.gmail.com>
Message-ID: <CAMuHMdVWpya10MbGceexKNd+eJnTamcYWPbkxwxOCZZNthu6Xg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: renesas: rzfive-smarc-som: Enable WDT
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_004337_591240_2B88A728 
X-CRM114-Status: GOOD (  17.05  )
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

On Fri, Nov 18, 2022 at 3:00 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable WDT node on RZ/Five SMARC SoM.
>
> Note, WDT block is enabled in RZ/G2UL SMARC SoM DTSI [0] hence deleting
> the disabled node from RZ/Five SMARC SoM DTSI enables it here too as we
> include [0] in RZ/Five SMARC SoM DTSI.
>
> [0] arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

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
