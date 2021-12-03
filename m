Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC978C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 15:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFyf78YAXs/mxsmHdpuvZnvMQiyXvz0PgBW56JAL8k0=; b=HIJZk6xeogXF62
	ANuIFL7tcsjtWNNRGadGHaU4rpm7kVa6H9Jb/H8yTwa/50A8uRskicxo5EsSVZErfLxz0qJTH0fAt
	LzSB3aeKoLqiBXO/hBOm3NxdSw2vE7XZnBFOZZahTMA0YmkbqYMyLUcNMDsdJ79SkbJ6dUkB6xSL0
	t3jid/Ne8+0Sn0xp3x213ZuhRHUskFEMfqXsSwBN/QzwveqXkrDf5LZG8JdWzJOnkzGMLguaHjmgC
	1XYu3ei2aSM0kP0NjzdVdhv5IqJacBBI32HqhxVnfraPv+ZUiO1N8Pwavr+4+yhXiBygyxe9v8JCU
	Pfqt2JRhvGpukx5bWozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtAoM-00GREP-Kd; Fri, 03 Dec 2021 15:49:22 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtAoJ-00GRDm-L8
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 15:49:21 +0000
Received: by mail-ua1-f50.google.com with SMTP id t13so6242587uad.9
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 07:49:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5lTP3GYrvp77utQMxLBdQ7RLbq80WIEYhMGIxXVDv2M=;
 b=Top9h5GEyWbeCoJN3EbFIKSuwxSSWjXDcirsWEVKC5OPAeJnMO+00cidoQ0kz1qk0i
 +AdD4vKZ/VkZ/Gwmz2Br3tgKTvGZHqR0RLyB1njkPQVoXAW/269gkypTHGiOu6MPZZeO
 2WYDRKAX6W1y5k9HX0+d3tpSW1Hx6ZdJWz3PrKKJgfH0mYIZ/yZl33Fd6gG13OVjUSLi
 XEsK0yz2F79lEHfbj/CmXX+RlsPL0YtFKgyrbZXenrJiEI2bFAFi0tmODSrwjrCjr61w
 hvYVGa7E5w0w7VDKziM5Z+5KG6QZNEbwc6zQ8s+FC7NprGq9c0d3tBNewTqkJ67UnLBn
 mWog==
X-Gm-Message-State: AOAM531FdbQ7L8IauTtLTYroS0o+oY/mP4GeAkeliiV2vcmxcttBu/d/
 BtF7tMPE48TneOThDnmsqGtrllPtWt9Y9/S0
X-Google-Smtp-Source: ABdhPJx2BSy/GrfmgMJJA5vyvb2kWUeGL27D/LIONCEk6Zanar4l4E7wKiOVWsVHG2hbVHVjz8/gYA==
X-Received: by 2002:ab0:44e:: with SMTP id 72mr22318519uav.121.1638546557352; 
 Fri, 03 Dec 2021 07:49:17 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id bi35sm521796vkb.3.2021.12.03.07.49.16
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 07:49:17 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id i6so6283176uae.6
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 07:49:16 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id
 o16mr20781860vst.5.1638546555292; 
 Fri, 03 Dec 2021 07:49:15 -0800 (PST)
MIME-Version: 1.0
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-7-geert@linux-m68k.org>
 <3b8442c7-fafb-421b-cd5b-4b57d1b545c3@canonical.com>
 <fc4a0c49-1a3f-68d6-de54-820d3e9c0938@microchip.com>
 <738f161a-038a-b6f1-1ff7-65674ae75d06@microchip.com>
In-Reply-To: <738f161a-038a-b6f1-1ff7-65674ae75d06@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Dec 2021 16:49:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWrMBpQCyHiQ-ut5=0p1xKU1RF6bGjWGnOv=kdvCtp+Hw@mail.gmail.com>
Message-ID: <CAMuHMdWrMBpQCyHiQ-ut5=0p1xKU1RF6bGjWGnOv=kdvCtp+Hw@mail.gmail.com>
Subject: Re: [PATCH 6/9] riscv: dts: microchip: mpfs: Fix reference clock node
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, Lewis Hanly <Lewis.Hanly@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_074919_716967_AAD818B7 
X-CRM114-Status: GOOD (  31.25  )
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

Hi Conor,

On Fri, Dec 3, 2021 at 4:30 PM <Conor.Dooley@microchip.com> wrote:
> On 26/11/2021 10:16, conor wrote:
> > On 26/11/2021 09:48, Krzysztof Kozlowski wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >> the content is safe
> >> On 25/11/2021 16:31, Geert Uytterhoeven wrote:
> >>> "make dtbs_check" reports:
> >>>
> >>>      arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml:
> >>> soc: refclk: {'compatible': ['fixed-clock'], '#clock-cells': [[0]],
> >>> 'clock-frequency': [[600000000]], 'clock-output-names':
> >>> ['msspllclk'], 'phandle': [[7]]} should not be valid under {'type':
> >>> 'object'}
> >>>        From schema: dtschema/schemas/simple-bus.yaml
> >>>
> >>> Fix this by moving the node out of the "soc" subnode.
> >>> While at it, rename it to "msspllclk", and drop the now superfluous
> >>> "clock-output-names" property.
> >>>
> >>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >>> ---
> >>>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 13 ++++++-------
> >>>   1 file changed, 6 insertions(+), 7 deletions(-)
> >>>
> >>
> >> It is also logical because refclk usually is not a property of the SoC.
> >> It actually might be a property of board...
> > This is one of the fun FPGAisms like the GPIO interrupt configuration.
> > This clock setting is determined by what design has been loaded onto the
> > FPGA - the msspll outputs are configurable, I could redo my FPGA design
> > and change this to 500 MHz etc. In turn the msspll clock is set by
> > another clock source that is actually on the board of either 100 or 125
> > MHz.
> >
> > Since it's not set until bitstream programming time, I would agree that
> > that property should be moved to out of mpfs.dtsi. (typo fixed)
>
> Geert/Krzysztof,
> Would the following make sense:
> - Since the refclk hardware is a part of the chip, move the refclk out
> of the soc node but leave it in mfps.dtsi
> - The clk freq itself is set by the fpga bitstream, so move the
> clock-frequency property to mpfs-icicle-kit.dts?

That was exactly what I had in mind when I read your previous email.

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
