Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1EEC54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 14:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Lbf10Wm210G6H5KNC/h9n/+0k2XGFp8MMrog/IR8ZA=; b=C5zLkm2cpOJQDV
	sIKGcP7TuZn762x3DHJjuhyR/FFBSxEso7G5LHpjCy2o94WtDA/qDAd8ib1yjYWDd0GDjKDTxigmG
	oNBzDPXMvst5oude0Rfw7FBbaiDQzGjxeA716XJ7YUbKLQmUDYmrL4+5Ws4k+B6K840JB9k8SPdwa
	ql/vGMjuxF2kQzC+kFv1LT8gLOl4SeyxZNXl6mXl/0qY/JgJjIGLn9bMrsZCY6FCbOF+4QYcCrWoa
	yw73XQvoZyZ+pTHKt2F/yaJWpYmZI499f0SAx+PNVETXjLn7V9soHpcxeK/tiTvOdsx6tHBoWyVVE
	pQ02T+6e37G23yWiad9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oadsd-004Koh-OL; Tue, 20 Sep 2022 14:05:43 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oadsa-004KmG-OY
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 14:05:42 +0000
Received: by mail-ed1-x535.google.com with SMTP id z97so3975982ede.8
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=EwHes8ZciAYGoy8BwMgXo7aFIkW9k1/APFM7gcA+YE4=;
        b=UNDKskzLSAqbQLUP+UeVxwK0UrKWnS2e0H/TwbCQJ2rixeaZaYlbvCdGVYky9wfOby
         tp77xiWquLD1kWTMXO3uaWndWNce0DO6Tk/8LoU6eUapjDLrI0DkVT2VOESjxO5pjgm+
         dtagsyw2LVi+F7SCvTt6bRm4tbwmPSpojCL1wPR5020nN8WG2wjhN0BJ8J76o6cYTOM2
         44np7Wcpo+TYzPQZHqhhUNCQU56IFY4g4iMZJ1w+ltXtvEhbArAOijIiatTP1QHxBtEt
         SJbr4N+xQE3+on7lfFHYYb8DJ9C4mw1R5U3Co6UQ0VnZYbyu9J3orCJgOjAdOtOyHftD
         nTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=EwHes8ZciAYGoy8BwMgXo7aFIkW9k1/APFM7gcA+YE4=;
        b=qPD6BBg0Kx1ivq60JmrNMLth9ap6+SUMKBNVFYDgshD8tE9nB60Syscyz81UZRXTAY
         Ii+zw/VsrnLex7+vMJ/wgBVKwC7NX7Q84U7WKp/LbSI1kTY76HuJvWA6kbHHe7UojLEW
         AyCoD3BPSRovxtBdMR7AGSMwBlNZthhhZ44BE/mpA6J2FIVMguxR3iac5RtcOh0Sa7i6
         gbWxS6+lDeKR20yJ5/LUFBG5XeZioS6kI9CzWZ6onG+6VdPt20rce8xYei9SSOqAMe/E
         xmJVgVMCMv8uMtURv5RChClRVQJnbeTCEzXHy/8ofRthTzdRmO/1vvz8l7fQN4yjHbnm
         +2jg==
X-Gm-Message-State: ACrzQf0TQ3OWX6BkAcJtiQnv9ayovH1OPpGwYNN1bsnPBECmmnfAFa7g
	YMeyOXm6B0q5jYTXZL0lG3B+jHD9Ddisw665ghc=
X-Google-Smtp-Source: AMsMyM5XSfvvCDjeoAw6txH9Jh1QnO4jMEY9JZD9n/EemS81naNt3d916d86R2GXAfqdBjhL4qYHRFonHHvh+LhWNDo=
X-Received: by 2002:a05:6402:518d:b0:451:6655:5fb4 with SMTP id
 q13-20020a056402518d00b0045166555fb4mr20197904edd.150.1663682735470; Tue, 20
 Sep 2022 07:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW99EutciosPtOTU9AztfvfMdKTaS+YRmpmS4VnhZ9KAA@mail.gmail.com>
In-Reply-To: <CAMuHMdW99EutciosPtOTU9AztfvfMdKTaS+YRmpmS4VnhZ9KAA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 20 Sep 2022 15:05:05 +0100
Message-ID: <CA+V-a8s9y0Jq4TJk9E_ptsZTW3iCoysaBSrUeQV8qfDFO3wzeQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_070540_822578_62E103A3 
X-CRM114-Status: GOOD (  25.04  )
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

Thank you for the review.

On Tue, Sep 20, 2022 at 1:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Sep 15, 2022 at 8:17 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable the minimal blocks required for booting the Renesas RZ/Five
> > SMARC EVK with initramfs.
> >
> > Below are the blocks enabled:
> > - CPG
> > - CPU0
> > - DDR (memory regions)
> > - PINCTRL
> > - PLIC
> > - SCIF0
> >
> > Note we have deleted the nodes from the DT for which support needs to be
> > added for RZ/Five SoC and are enabled by RZ/G2UL SMARC EVK SoM/carrier
> > board DTS/I.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > * Dropped RB tags from Conor and Geert
> > * Now re-using the SoM and carrier board DTS/I from RZ/G2UL
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dts
> > @@ -0,0 +1,27 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/Five SMARC EVK
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corp.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +/*
> > + * DIP-Switch SW1 setting
> > + * 1 : High; 0: Low
> > + * SW1-2 : SW_SD0_DEV_SEL      (0: uSD; 1: eMMC)
> > + * SW1-3 : SW_ET0_EN_N         (0: ETHER0; 1: CAN0, CAN1, SSI1, RSPI1)
> > + * Please change below macros according to SW1 setting on SoM
>
> "on the SoM" (like in r9a07g043u11-smarc.dts)?
>
Agreed, I will update it.

> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi
> > @@ -0,0 +1,42 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/Five SMARC EVK SOM
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corp.
> > + */
> > +
> > +#include <arm64/renesas/rzg2ul-smarc-som.dtsi>
> > +
> > +/ {
> > +       aliases {
> > +               /delete-property/ ethernet0;
> > +               /delete-property/ ethernet1;
>
> OK
>
I assume you are OK with dropping the above too?

> > +       };
> > +
> > +       chosen {
> > +               bootargs = "ignore_loglevel";
> > +       };
> > +};
> > +
> > +#if (SW_SW0_DEV_SEL)
> > +/delete-node/ &adc;
> > +#endif
> > +
> > +#if (!SW_ET0_EN_N)
> > +/delete-node/ &eth0;
> > +#endif
> > +/delete-node/ &eth1;
> > +
> > +/delete-node/ &ostm1;
> > +/delete-node/ &ostm2;
>
> Given they are all placeholders, do you really need to delete them?
> (more below)
>
I did retest without deleting the place holders and I dont see any
issues (or splat) while booting up so I'll drop them while sending the
v4.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
