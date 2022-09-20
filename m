Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D299C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 20:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJNEUrwWGdP1Zh9/ojqnAjGGJO/aQIwIi5QeMhDVr1M=; b=ZeT1B9t/I2LgkC
	dr0mAnWHVNGBomAVkNynf/WCeRKnv5NSW6eKrtLcyPksgIXaruHjNN7NLGfjRYhHornQtvtP9up/y
	Ie7yKQ2jfJfnIdLmSy+JZGHVnK4/q7zVb8NtpAC+YcDcvlI+sApaVtiFyoN9BD2GbPv/27ZAwZTmx
	gjR7NcCgAoRu33THI/k7ueM3i9MSy8G6rHdhjCXuqYKMCdwxWtzsZ+oCtss4D6gcZuzzXXxoE/0qW
	u3lVdZnxwKj9mvJA7O9OMteY6gWRTlpYWxGJh+FEutah0TpRBXcifOqA4ISiYwJh8pjIUn1OcGIbY
	9sFDiA5oDpbHwzkEwHzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oak5s-006POO-AC; Tue, 20 Sep 2022 20:43:48 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oak5o-006PN4-U8
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 20:43:46 +0000
Received: by mail-ej1-x62d.google.com with SMTP id r18so9013038eja.11
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jBYi/prDHJ/YGLg3ZKqzYTis+OjXr+YK/sv9ncXaUME=;
        b=f/j4uuGL/tiflOwbHSPnTfIVpPgul7i097N3hMDMg4++9IX/1bDaTHNvhOBfyAkZEN
         jKIcyIOZMs4Kh/yrkIPYLZR6IO8fC6C+GrfWs6Sx0FPUg7Jj2+skO6lRjCzZLMnOWzG1
         8Qtcf4zKz/H1K2M3LmtxkN5dcrBh26fSP3P6mP4cJeSfVCBGNDJGq3Yd5E04/8YcSwCh
         ByyD+vJokLDEs2sjcMtyD9ctOSMd7EfxeYwkqxWfAHG6jDWJflhQRkY1SFhCTkfUZOF5
         xQNC9teg/8VczSx+4nekCCX9QOLGtLm9oRXR8HKXiB0Pt6gjk4IvvSEXOETQ08GcVgq3
         nKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jBYi/prDHJ/YGLg3ZKqzYTis+OjXr+YK/sv9ncXaUME=;
        b=T1kY68XgviBdCNDTuusy6p4JmYyvVQgyGNXD2qYRBq+PSIcVPE7ZGA1qxSAkagv89Q
         i6lmH8C26Us5n7aGuPWRPQ4NR9hEoW2jdz3Ry3MFVU97q8nTXlC3aiPfAMOW5aXrkCOx
         bU5B/lD+zAHDt4hjeaEH8f3UqmVeNO3WtzUUtgfxVjK58SGi0T4dMDPLJ1Jk/B/MIYlW
         JkRmngOW/XYEh5ECQ8mWNT7mzRCqO3R9+oqOv9OZsYTaozfAeQbCSkwsMkq6dLQ6EU+C
         hU93Y7FVuRU5Uq9kOErPWOwbscRtcHII5bfHPYeOAaE8+/agpi5M88SV+pNPquzaGh+m
         Q9Rg==
X-Gm-Message-State: ACrzQf2YC8397f4mZXqt0OFq7eKA7w1keWYwdbg8hzK0YtBU+hjqsSlj
	PxsUCmxjnGnG6V1u11M9N+7C41qhl13i2XRG4WhQWSu/vwg=
X-Google-Smtp-Source: AMsMyM6FV3L2vQq/kixJuKIe7/X+wQ6X2iewUO6IInLUgnMmhdJnYUKGmuB5aDLmUdLhuC3e/QjxVBFENBPqjleSzlk=
X-Received: by 2002:a17:907:3f93:b0:780:1b17:1160 with SMTP id
 hr19-20020a1709073f9300b007801b171160mr18182563ejc.196.1663706621629; Tue, 20
 Sep 2022 13:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YyoSgGlkIB8GMog8@spud> <CAMuHMdXfkX-AOusfOn-6fmaJavWWoD1mW8QNqUCUdkHuz=3FsA@mail.gmail.com>
 <YyoWlSQPWVnkaU+T@spud>
In-Reply-To: <YyoWlSQPWVnkaU+T@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 20 Sep 2022 21:43:14 +0100
Message-ID: <CA+V-a8uLD4zbxuN0GJ+Augwiu=oH_FnQ7+muQU30zdoxMxrBAw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] Add support for Renesas RZ/Five SoC
To: Conor Dooley <conor@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Atish Patra <atishp@rivosinc.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_134345_530616_3FF8C8F7 
X-CRM114-Status: GOOD (  26.17  )
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

Thank you for the review.

On Tue, Sep 20, 2022 at 8:38 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Tue, Sep 20, 2022 at 09:24:05PM +0200, Geert Uytterhoeven wrote:
> > Hi Conor,
> >
> > On Tue, Sep 20, 2022 at 9:20 PM Conor Dooley <conor@kernel.org> wrote:
> > > On Tue, Sep 20, 2022 at 07:48:54PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
> > > > 1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces such
> > > > as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications such as
> > > > entry-class social infrastructure gateway control and industrial gateway
> > > > control.
> > > >
> > > > This patch series adds initial SoC DTSi support for Renesas RZ/Five
> > > > (R9A07G043) SoC and updates the bindings for the same. Below is the list
> > > > of IP blocks added in the initial SoC DTSI which can be used to boot via
> > > > initramfs on RZ/Five SMARC EVK:
> > > > - AX45MP CPU
> > > > - CPG
> > > > - PINCTRL
> > > > - PLIC
> > > > - SCIF0
> > > > - SYSC
> > >
> > > Ran into one complaint from dtbs_check:
> > > arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: usb-phy@11c50200: '#phy-cells' is a required property
> > >         From schema: /home/conor/.local/lib/python3.10/site-packages/dtschema/schemas/phy/phy-provider.yaml
> > > arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: usb-phy@11c70200: '#phy-cells' is a required property
> > >         From schema: /home/conor/.local/lib/python3.10/site-packages/dtschema/schemas/phy/phy-provider.yaml
> > >
> > > Other than that which should be a trivial fix the whole lot looks good
> > > to me...
> >
> > That's due to the placeholders...
>
> Right, but #phy-cells will be added into the usb-phys once you (plural)
> figure out how to integrate with the existing CMO stuff?
>
Yes indeed.

> > Currently it is not yet a requirement that "make dtbs_check" is warning-free.
>
> I was really hoping that it could be a requirement for 6.1 onwards. I've
> managed to clear all of the other ones from arch/riscv.
>
Maybe i'll fix it and respin the series (along with the Kconfig.socs sorted).

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
