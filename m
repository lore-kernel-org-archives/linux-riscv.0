Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716D6C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 11:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/HIDTHmi1Pa1eQLfarzWpWu3bSpIONxnOvw9EzAJKY=; b=GD3DN4y4DZfn+c
	CKas4fSGOp/bY3q17P2J8xOC3ptJloTXzxkEtJRMySDziQMfbYf2LqzmK+ePLjQ9srZN+w87b42AX
	Jlyvn8Q2f8O/NJzCVOakFaCGVCadGeKFhCsYTkg4EaakEut/hbukuPJmo0RkLnFdK51/kqoMTqHuD
	zV+iNj/ber9fwg65j/CmWoaSErMav76+NJAFU6FZ6+cNocDX58rVU1pIY4oZXSRFnCvdLme8IGewc
	3A0lT6U5BzEzb7i2s3wrP/BoBL6pBUDkJE2dRcJcHeTyQwgOVszI9b+pGjp7mcRkvNmE9MNvFCicb
	30QiJF1ka9C/TgzN1lVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP0MO-006xF9-Uh; Fri, 19 Aug 2022 11:40:20 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP0MJ-006x8N-JZ
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 11:40:20 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-33365a01f29so114170927b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=V9Potjv6AygNMhgt+2OrpuJbud0dJblX7JtOBcX4tTc=;
        b=JhYvMSyYebnn/hH7W9E+SRJbQ/fAouSceya3rqItBq1mUu2XfX/4aesOWMFoqkaAJd
         YrBuKJMbKU3YQXzv1dLL2cgd5DMejo+X2iiH7WpkxfaGnw0zAAZuKbAkmPt7tCXP3Xpx
         kDLc5P/s7rK4E8b6QkrziPbuHbF4jps2FMyhsGzCk9s8i9Hq7FEPxGVdgYnkpkafoKx4
         9joN1M/K5fUaAxE9koqrRGIMxVRIx9971qLdYcOT+Saj1DLYcWVGsMX/+szKp7CIPnaQ
         +oPsAW1sZS4qUJKI1oBcarJzhOFflwwyTB7+Cw5oEC2fmBywy697klj9eftjoOvbGiKV
         /I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=V9Potjv6AygNMhgt+2OrpuJbud0dJblX7JtOBcX4tTc=;
        b=4L1wwxkemYPtlTRDiexnBwh5RjG8OkZlt8X62fe+MuUEHL9LvP+pwFRmQLkt76hLFa
         awwJenyX7ko+KtDweptR2FMkehnVnGQw320W2aQQajAr8qEzsaTysXsHx+uGoaqDCNEE
         lMZ1WEaOUz2BSfWocCBDiFLdlaB2Zplr1G/m+r0N9V5Hn/Zvbnn/xz0+aHlQ1zOQ4puF
         hdlt5ArUY+nxt/Q4fh6TH5ANV2qNYnodGqTMPGFNdvv4EZ6WIaGzGG66HRPGFgnZwi1C
         ONuJqmFJmxe2BU7FgVKjNbszxW2fvtOJkwwMuhIBQqDstXa4kdFtpIT0Jh/vDJtBboXJ
         H1lQ==
X-Gm-Message-State: ACgBeo3iilGHsP0gb/z2QQa+tML9YG2rYOl9fcQQhADwoMYex4h+eWrX
	85kiffUZ4J8u2K7z+tqkeer33s1sOg0VHQ8UGyU=
X-Google-Smtp-Source: AA6agR5z/ae+3LUGHfPSdewFjNX850w3XDC/3VpieBRg+2ppKfE9XKW9bOyxaAObw85xyckVTg//mgFGeudhjeaxTyU=
X-Received: by 2002:a05:6902:20a:b0:670:c563:9180 with SMTP id
 j10-20020a056902020a00b00670c5639180mr7057933ybs.401.1660909207895; Fri, 19
 Aug 2022 04:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <07342070-d96c-59fc-f9dd-b65cd742d97a@microchip.com> <CA+V-a8uNRr+WPX=YC+UMT4ch4S5XwsatHCzUoSt+hTk4C=cheA@mail.gmail.com>
 <CAMuHMdXjWsUF1_CnojrvT+EyEmAp25jkT2TyWSisGinAGgMb3w@mail.gmail.com>
In-Reply-To: <CAMuHMdXjWsUF1_CnojrvT+EyEmAp25jkT2TyWSisGinAGgMb3w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 19 Aug 2022 12:39:40 +0100
Message-ID: <CA+V-a8t-O8ro8U3n46sjMS=HBJC-09V2hrdNXUCyhEZDrsiTfg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <Conor.Dooley@microchip.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_044018_361204_C7114723 
X-CRM114-Status: GOOD (  27.01  )
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

Hi Geert,


On Fri, Aug 19, 2022 at 9:25 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Aug 15, 2022 at 10:16 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Aug 15, 2022 at 8:00 PM <Conor.Dooley@microchip.com> wrote:
> > > On 15/08/2022 16:14, Lad Prabhakar wrote:
> > > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > > >
> > > > Enable the minimal blocks required for booting the Renesas RZ/Five
> > > > SMARC EVK with initramfs.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v1->v2
> > > > * New patch
> > > > ---
> > > >  arch/riscv/boot/dts/Makefile                  |  1 +
> > > >  arch/riscv/boot/dts/renesas/Makefile          |  2 ++
> > > >  .../boot/dts/renesas/r9a07g043f01-smarc.dts   | 16 ++++++++++
> > > >  .../boot/dts/renesas/rzfive-smarc-som.dtsi    | 22 +++++++++++++
> > > >  arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi | 32 +++++++++++++++++++
> > > >  5 files changed, 73 insertions(+)
> > > >  create mode 100644 arch/riscv/boot/dts/renesas/Makefile
> > > >  create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
> > > >  create mode 100644 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> > >
> > > Just to sort out some of my own confusion here - is the smarc EVK
> > > shared between your arm boards and the riscv ones? Or just the
> > > peripherals etc on the soc?
> > >
> > RZ/Five SoC is pin compatible with RZ/G2UL Type 1 SoC (ARM64). RZ/G2UL
> > SMARC EVK carrier board can be swapped with RZ/Five or RZ/G2UL SMARC
> > SoM and still be used.
> >
> > > If it is the forver, does the approach suggested here for the
> > > allwinner stuff make sense to also use for risc-v stuff with
> > > shared parts of devicetrees?
> > > https://lore.kernel.org/linux-riscv/3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com/
> > >
> > it does make sense. But I wonder where we would place the common
> > shared dtsi that can be used by two arch's.
>
> You can keep it under arch/arm/boot/dts/renesas/, and refer to
> it from riscv as <arm64/renesas/...>.
> Cfr. the symlinks under scripts/dtc/include-prefixes/arm64/ and
> e.g. cros-ec-keyboard.dtsi.
>
Thanks for the pointer.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
