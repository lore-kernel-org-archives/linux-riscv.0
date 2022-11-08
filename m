Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8145C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 16:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xc88fAp4SZbkovz+vHP7HAqCktxBFllnc35j4mewEko=; b=qMysBGsOVQZnSP
	+vvek5EapZQ6hV5EdW2afFaHmzwkJaVVKxIY+i+czQHqkUi5GJA5Gt58+mTI8bGGg/O6935jbNjh6
	7P920MWuE+78t1eWiOtQn8ryR3Y/zS19TeCWfaooPR52w4S0t7ae0Z9ZKmVdpB38zl9ul1u+rhFrk
	FdlPjgNW46xcrvcqxAE7GM8hpSdkgPo6JpczG2WSqSzdoFfDlplK/nZUGDsRc5Q70Ya3CuVqx7ubq
	yJIvCZZHqdEMGNB3gzYUzfJ6A4ZIGjRJmR1H17370fiKyXUrY0JJAQzx6qwYtYd5UxyRSe3DlS8bb
	k3Pl+JHak8bQypmdz8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osR4H-006bVK-Ou; Tue, 08 Nov 2022 16:03:17 +0000
Received: from mail-qv1-f52.google.com ([209.85.219.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osR4E-006bUY-Pt
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 16:03:16 +0000
Received: by mail-qv1-f52.google.com with SMTP id lf15so10073297qvb.9
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 08:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgYwl0gmnsxFOUsgyWE/Sl4MS1UpSQ37yRLVhvYKL6w=;
        b=0i1ervtL90yG60yMkp/JrnRxmR5s48MqyRyHdyRQUSfsGawKouQL0lWZXP6KZuM4xg
         AZWtutK4YeXzixthKkn9cJAABmNgdf/XH/5ayNU+6V2MYYszfxyE1UT7Gbip14yoQOC1
         82KMjHCXljlXn23bhdGx2r32Np9kzlBf1nvrnCkZyYrhZcGZNEq+4RThfddWSPTSU6/W
         LaKtPSpMhDYlgN+0h49M4u/5yQYLhOwio7KzLSPkdVEngWUptmunwGREfOvbeDPRwRL+
         XteIAPYXpipiHSPUfbFzu/Eke6I1p1t3gN6FQ0k3RnFooYHvpV3QEqYh3CuZIRgc8D8I
         eJGg==
X-Gm-Message-State: ACrzQf2l54RWiIwNP0zV1duKo7IOKZoTetxJGm6vgy2J9+ifblwav2je
	c8TMk+/sKBpJ9YphYaoIkQmv3GzbjWddE0yB
X-Google-Smtp-Source: AMsMyM4/B+xlb2iGSv+v8TtXKqf50UL+3UUpHUSI44125HkMpYKLKV/vJt+lHFiqaFdwfF6k3Mr4KQ==
X-Received: by 2002:a05:6214:d67:b0:4bb:7435:9468 with SMTP id 7-20020a0562140d6700b004bb74359468mr51932990qvs.68.1667923391132;
        Tue, 08 Nov 2022 08:03:11 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id br37-20020a05620a462500b006cf19068261sm9411825qkb.116.2022.11.08.08.03.10
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 08:03:10 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id y186so13233533yby.10
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 08:03:10 -0800 (PST)
X-Received: by 2002:a25:6b07:0:b0:6cd:3a43:bfe5 with SMTP id
 g7-20020a256b07000000b006cd3a43bfe5mr43158792ybc.89.1667923389628; Tue, 08
 Nov 2022 08:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y17BWPuEcmY7Bba3@spud> <CA+V-a8uKQ8QvYi5qLC9O=QAQN5CxNB7cOTmw4vk+ndB2R8d3nQ@mail.gmail.com>
 <Y17+pHAg/SBJAEXq@spud> <CA+V-a8t-niCHSWo_CSRSkPS4ND12DAkiwxWxOM1vNn=oBKKd_w@mail.gmail.com>
 <CA+V-a8utoDSKcZFdtJ0BKwvPfcvf0WVH2Va-Fv_-pKC1FOOVsQ@mail.gmail.com> <Y2lLpCRpTQL+0dsR@spud>
In-Reply-To: <Y2lLpCRpTQL+0dsR@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Nov 2022 17:02:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjZGTNM7pUqxwXd08bjuPEFUuUwKFGx01FVCqOGnc6hQ@mail.gmail.com>
Message-ID: <CAMuHMdXjZGTNM7pUqxwXd08bjuPEFUuUwKFGx01FVCqOGnc6hQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Add support for Renesas RZ/Five SoC
To: Conor Dooley <conor@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_080314_860762_4DF5CF6E 
X-CRM114-Status: GOOD (  43.99  )
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

On Mon, Nov 7, 2022 at 7:17 PM Conor Dooley <conor@kernel.org> wrote:
> On Mon, Nov 07, 2022 at 06:03:41PM +0000, Lad, Prabhakar wrote:
> > On Sun, Oct 30, 2022 at 11:01 PM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Sun, Oct 30, 2022 at 10:46 PM Conor Dooley <conor@kernel.org> wrote:
> > > > On Sun, Oct 30, 2022 at 10:37:01PM +0000, Lad, Prabhakar wrote:
> > > > > On Sun, Oct 30, 2022 at 6:24 PM Conor Dooley <conor@kernel.org> wrote:
> > > > > > On Fri, Oct 28, 2022 at 05:59:14PM +0100, Prabhakar wrote:
> > > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
> > > > > > > 1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces such
> > > > > > > as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications such as
> > > > > > > entry-class social infrastructure gateway control and industrial gateway
> > > > > > > control.
> > > > > > >
> > > > > > > This patch series adds initial SoC DTSi support for Renesas RZ/Five
> > > > > > > (R9A07G043) SoC. Below is the list of IP blocks enabled in the initial
> > > > > > > board DTS which can be used to boot via initramfs on RZ/Five SMARC EVK:
> > > > > > > - AX45MP CPU
> > > > > > > - CPG
> > > > > > > - PINCTRL
> > > > > >
> > > > > > Hey,
> > > > > > Looks like you've got a pair of warnings here from dtbs_check. I tested
> > > > > > this on top of 20221028's next, with the three branches below merged in,
> > > > > > hopefully my merges aren't the source of them:
> > > > > >
> > > > > > linux/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: pinctrl@11030000: 'interrupt-controller' is a required property
> > > > > >         From schema: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > > > > > linux/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: pinctrl@11030000: '#interrupt-cells' is a required property
> > > > > >         From schema: linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > > > > >
> > > > > Thanks for the review and test. The warnings above are coming from [0]
> > > > > as support for IRQC is missing, once that is added the warnings should
> > > > > go away.
> > > >
> > > > Right. I merged in the stuff in Geert's trees & I don't think I saw any
> > > > pending patches in the cover that I missed. Is there something else that
> > > > adds the support that's not going to make v6.2? I got rid of all the
> > > > dtbs_check warnings for v6.1 and I'd really like to keep things that
> > > > way!
> > > >
> > > Sorry that pacth wasn't posted yet so I hadn't mentioned it in the
> > > cover letter. I'll make sure I get it posted asap and merged for v6.2.

> > BTW on the riscv patchwork I see status as fail "Patch does not apply
> > to for-next" does that mean I need to resend re-basing on your tree?
>
> Nah, I though that Geert would be applying this patchset, no?
> If that's the case, it only needs to apply to his tree.
>
> Geert, are you waiting for an ack from Palmer?

I can take:
  - [PATCH v5 4/7] riscv: dts: renesas: Add initial devicetree for
Renesas RZ/Five SoC
  - [PATCH v5 5/7] riscv: dts: renesas: Add minimal DTS for Renesas
RZ/Five SMARC EVK
  - [PATCH v5 6/7] MAINTAINERS: Add entry for Renesas RISC-V
(4/7 and 5/7 depend on my renesas-arm-dt-for-v6.2 branch) and funnel
them to the SoC-people.

I can take
  - [PATCH v5 3/7] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
  - [PATCH v5 7/7] riscv: configs: defconfig: Enable Renesas RZ/Five SoC
with an ack from Palmer.

The rest
  - [PATCH v5 1/7] dt-bindings: riscv: Sort the CPU core list alphabetically
  - [PATCH v5 2/7] dt-bindings: riscv: Add Andes AX45MP core to the list
should probably go through the riscv tree, to avoid merge conflicts
when support for other SoCs is added?

Thanks!

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
