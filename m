Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22E4FA3743
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 22:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GlHSbNc2eU2omo/btsBoPtehPDQi+TitXcL44KD0zF4=; b=2E6+lMenc6qz1k
	70X9jzsgj8zISubVNtvgCYCUApjp66e0p9umADH7/q6+8Aq9ffFR1UEBjhZtf30h3mq4wwzI51Zy+
	+xrEt4AkD2ZLrWoeMVgCdLL1RsyFfCta1YKji+j6oIzflXvh65aUwX9D2iAIzGDYuX+3XOeyuffja
	nbYFsxa/NqNey4fjB+3/cd7qyZ4vOo4M/O3YpbD36ci5dvfaqPCEcrVSSyYpgfaichHi8E7v7Bwhv
	pFxEboIGUkf+JQwzDFlgeZp8KzgULkAkvG/xRObFuWpir9WBdsRPnOppmjrOpNO59LmysbIFLPOJD
	72AJSWqh/UyF5Sncdgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opGvs-003z8o-E4; Sun, 30 Oct 2022 22:37:32 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opGvp-003z56-Mf
	for linux-riscv@lists.infradead.org; Sun, 30 Oct 2022 22:37:31 +0000
Received: by mail-ej1-x634.google.com with SMTP id b2so25444380eja.6
        for <linux-riscv@lists.infradead.org>; Sun, 30 Oct 2022 15:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mvvzkff6DOL85U8amZ/DXhVJ4JENLNiq7XjnHhrGMvs=;
        b=f0QVCDZ5EVWlrUN1rKoSG+yS/A2K3M7mCkQ4bxP3jzMM/+mMruxSV5Usb/toSwsPBU
         RDjIqyagVzNRtdtTfqq7srhGfEWj70L+F0p1VlBdWpDl8A+1wpBB+MYo17QOF2lr8lJP
         wMqRerhgoRq7Tq3tubk2FH61N9zB1PNJ+PxSpdvet4Em/xVtxiMVpvrwzeqL1s6VuSOx
         oKCkeNTXo4vbJGuN9vW756plKb4qoj6zSoiJFGBUeYM28Ipm5ZD+PXrMsM5WL6zzRm02
         8zL2Zbh1DBl1tuiqY/oBA2wLMPJ6N0ihjW5UekqaI0m+sdIcVPDlpws3W+Dd6hhEJ9kf
         RhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvvzkff6DOL85U8amZ/DXhVJ4JENLNiq7XjnHhrGMvs=;
        b=S+j62E1ZX7mDrmBfu4i8ccBpmurXCsYCeb18Ses5o1YsWM3KgODD2FArRkgTdmtS2u
         xk1baPOZ861Y30Fhua4GViLTZh4LadSbatjuEy9GHeWD7N/PgmtsTd1ha4N8DRkJ1AUo
         S+xx3BTB7pWGrH2ThFqVbJowWdR/dHxZxh5FC3zAgLaEjntVa71D2OwGFZsKoqphjts2
         QvXMpcHWg/ir0q9696IfUSPxTUE8ukFxdBUdkeIj2Om5TlaBxFyEtPFkUIDeVkeiUTRe
         SHozc0HOzxjZ7nMio16x+aLzHuDvoKH9z6S/i3UGFQ9XkKX8CbeJEL1Tyl6LeqnPy32S
         h8Iw==
X-Gm-Message-State: ACrzQf0Osfw82u9dGGovZSKrHB8mNy2WXh408nqA3W0vyWtsLTXpV3Eg
	FkVCW+pwUjBntTJRcHseIn8tN1DHCJhTT90TGf8=
X-Google-Smtp-Source: AMsMyM4K4QK9yJsrNxEButWAcDD9G1p0AEwb26nEyCEdPv2RRCmrAW1IeJm/NMhanC2p48KjJY79xk+O5lrVh8jmUwA=
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id
 ww7-20020a170907084700b0077ff489cc25mr9809377ejb.80.1667169447405; Sun, 30
 Oct 2022 15:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <Y17BWPuEcmY7Bba3@spud>
In-Reply-To: <Y17BWPuEcmY7Bba3@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 30 Oct 2022 22:37:01 +0000
Message-ID: <CA+V-a8uKQ8QvYi5qLC9O=QAQN5CxNB7cOTmw4vk+ndB2R8d3nQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Add support for Renesas RZ/Five SoC
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_153729_772536_B524BF3C 
X-CRM114-Status: GOOD (  21.00  )
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

On Sun, Oct 30, 2022 at 6:24 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Oct 28, 2022 at 05:59:14PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi All,
> >
> > The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
> > 1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces such
> > as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications such as
> > entry-class social infrastructure gateway control and industrial gateway
> > control.
> >
> > This patch series adds initial SoC DTSi support for Renesas RZ/Five
> > (R9A07G043) SoC. Below is the list of IP blocks enabled in the initial
> > board DTS which can be used to boot via initramfs on RZ/Five SMARC EVK:
> > - AX45MP CPU
> > - CPG
> > - PINCTRL
>
> Hey,
> Looks like you've got a pair of warnings here from dtbs_check. I tested
> this on top of 20221028's next, with the three branches below merged in,
> hopefully my merges aren't the source of them:
>
> linux/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: pinctrl@11030000: 'interrupt-controller' is a required property
>         From schema: Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> linux/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: pinctrl@11030000: '#interrupt-cells' is a required property
>         From schema: linux/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
>
Thanks for the review and test. The warnings above are coming from [0]
as support for IRQC is missing, once that is added the warnings should
go away.

> With this sorted, whatever wasn't already is now:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Thanks for putting up with my messing around re: kconfig symbols and I
> am glad that we ended up being able to share the dts across archs in the
> end, so thanks to everyone involved in that :)
>
:-)

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/renesas/r9a07g043.dtsi

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
