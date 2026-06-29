Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B01C43602
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pz6uZqRtrxXXKgPmQ6GGGAkgUzU18dXB4papL/YTRoY=; b=KilkzHmVVEQHe9
	N9mp+FCNDV5ZofmIfbGF+oORUvI0nzzWIwS1EAFfUgTClZfSJzb7GKnFMSZEcCPpkq9oaVzcutv3r
	GrH38z0hvdxpPCyPL2BvJVKhmgGbmY1iEPE+4XDIYi96EpjvuubyMuIRS+C015oPd0u1jStBloA1X
	NA6rEW9CnA/xSydNwLECuZzNVGKlly2IKX0pstQ8QXrH2zFuBj+UyJo6ac7uc1wuBtF3c21hq5WWQ
	3Xx+QPMIqy/0EOpDjBLMwCAqycBzcsSB6VSJQzFRMUb91lvfQehm1J7Aj0CU+8bSJO7ANp/miar22
	NTPklxV2wLXANviLCLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDLE-0000000ExmH-3tlA;
	Mon, 29 Jun 2026 14:52:08 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDLC-0000000ExkU-0ajN
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 14:52:07 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bd745cf7c7so1113655e0c.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 07:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744725; x=1783349525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrA9ccFaco9J2BZQ3eRpFjtGI3CKCK/xF2koXbFr26M=;
        b=X30MB9uVd90QkTwwK7+7xN7+nDjlnk3981H7wyTzpykSGoLOmNIIAHY7bTd7DW5RHE
         axnf+V8wYPE8f+MeBi+/dbtEKlceVPE/ldRPMwsvFlCiPzSe4kostVWHcvj9DKWEFUlQ
         YhWyLfq4g10a4OcFxirjmQJDyQ3p02pguefxV96ZHx3wPs4MrYbsebbHGt13VJI+CHQ0
         CxpoqVD2hNohV5dEHwCdwimoo3XKqTbuFJymsuf+aMjosJnyYn13lSjm09Ori+eS1YaE
         gT1MBaZuUBKE2qn/Lw5iCGQI7H/y0PEoyCANw53k9kfbePuvTwUYJv1aBDXPrHgkx/T8
         /68A==
X-Forwarded-Encrypted: i=1; AHgh+RrcYoq2603ZEvG8UrlIrreONra4ahnwIRHSgcQ3RC4yq+4jIp2p9EvXqIlZem4JkEcMcVz4VHSOeUYW7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMmibIzHY/JhQLHQ91sWO49UZC/C/3oYyk3Lcl+YGME2zB/xKb
	TQmORdUs/bgFTw3qfKr+H7YWAo8JOk1CtQLkYjroc7OBKaA5+LRKjz1WE2GmvStT
X-Gm-Gg: AfdE7clTSqV0g86K419Bf1wNVmuhjMRxckGjxrrb2EmrmD2YkxPLSJtX7LrrhhYLqrh
	PVBLenZgYhoUCZu/yqqV3Ug/bgmal/XKuilWY0omF1Yzr4Mv5RINWXw6ZnsZG20eZf7u3h+T2hM
	9I3fdgtxN22HlMeEl8bxD2xVQ2G7ozvZR11kxrbIn5UuhOmy8/uJrFq6zlFhjPoAVA4XunDuVfa
	jS+voBJ7n6G3c0aL7OpLXS5fhsQQVWi+xcGovDBZwqoWdsnHcIA1hb5NKamlQOhWjQtj190fPqv
	sDXYhQphBjqlH0QCPI0m8vyI2BaGu5g6xbGDWYJymPIaj3xxQ2SusBbbsIy0B+C7+BPrKbaHs+L
	H34XhwjaPeJobL2GmhtUdLCwas/TeIO+04IeFSyhDakzXmv5jQW3w0p5rxC9ofxXO//8WX08v76
	F1IxiFbWTMIJCx3IIZwQ8VP7alu8UC1kJWphMNn1M+Mf5puVhzqg==
X-Received: by 2002:a05:6122:134f:b0:5bd:abb7:4937 with SMTP id 71dfb90a1353d-5bdabb7628cmr1430954e0c.14.1782744724836;
        Mon, 29 Jun 2026 07:52:04 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bd790c054dsm5797721e0c.13.2026.06.29.07.52.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:52:02 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-73915ff1d64so235994137.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 07:52:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrPErmPJE0ns95+0ZvXLxAnQvWaTABTydrJt5SLDmRa4XZIc6R5eLeadMxkPFB7OhHM9NB4NKuRXBPslg==@lists.infradead.org
X-Received: by 2002:a05:6102:c86:b0:738:ecd7:198e with SMTP id
 ada2fe7eead31-738ecd71defmr1394925137.19.1782744721048; Mon, 29 Jun 2026
 07:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com> <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
In-Reply-To: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 16:51:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
X-Gm-Features: AVVi8CdkJoaQviVQ7ltoNYHwA2g-kW32TDsBBJn2QkEKdC-zwJrV4O3to75iJ6g
Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_075206_185902_1739B9B2 
X-CRM114-Status: GOOD (  28.53  )
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

Hi Bartosz,

On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> >> This is essentially the same hardware as sa8775p rev3 but the PHY is
> >> managed by firmware over SCMI.
> >
> > So why can't it be reuse the DT bindings, and be compatible with
> > qcom,sa8775p-dwmac-sgmii-phy?
> >
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
> >
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  power-domain-names:
> >> +    items:
> >> +      - const: serdes
> >
> >> +examples:
> >> +  - |
> >> +    phy@8901000 {
> >> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> >> +        reg = <0x08901000 0xe10>;
> >> +        #phy-cells = <0>;
> >> +        power-domains = <&scmi7_dvfs 0>;
> >> +        power-domain-names = "serdes";
> >
> > Ah, this uses power-domains, while the existing bindings for
> > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > I guess the clock is the correct hardware description?
> >
> > Adding to my list of examples for backing a hardware-to-SCMI remapping
> > driver...
> >
>
> Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> driver instead of the MAC driver where it was previously. Instead of cramming
> both HLOS and firmware handling into the same driver, I figured it makes more
> sense to have a dedicated, cleaner driver as the two share very little code (if
> any).

I think you are mixing up DT bindings and driver implementation?

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
