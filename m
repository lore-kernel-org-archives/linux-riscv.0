Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CF5C56202
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 10:43:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17673208CA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 10:43:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="URAh3bWu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17673208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xom8Sp9y7bv1s+kCnWGYvjy82qT89tPYXsgLn6peyvI=; b=URAh3bWujat1GyTtvMf/9Snhy
	GppCmyZZmQkepwvVI4NNDuXCX/njpVtRJtYRySmf+ZK6lRMojFQMqVWbJHgf1spwBVbq8dmD7E3NI
	WH3ETaxXtx3f0dLEcW5iSoEi+BOIHVUx0djCsymbfXc37u368nc7g6KjrB1StYs9MNgrX5ST8MLBR
	bUGV/E2iVdAmkV+3YsY1CTPKuYWjTMrhreeqIz+aHIwqLLbMD4tMt0RvO7uZIpiVH+NrxywAaHiR9
	9UMtiMTzGnlp8by3+7ndUnKiHKgfPV3/9OFx3Kb3oDjYM6l/ejgCIAUuwTcHwAO9Obts3LT3ufze+
	QoiCXuGRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiEjs-00034p-Pd; Thu, 26 Nov 2020 10:43:00 +0000
Received: from mail-oo1-f65.google.com ([209.85.161.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiEjq-00034M-Do
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 10:42:59 +0000
Received: by mail-oo1-f65.google.com with SMTP id r11so296956oos.12
 for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2020 02:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JP/o0KCxV+hjR4qYH26j/gYgrajM2R1HBMLwhM9o1z0=;
 b=qQSNWeg45tKf0yEysd9Ov3dzUnhItWeFJL7d5BJ+B7xFQG+WOVtZnjVnc87AOXBDew
 dLOHGjoBSdRd0f1yx3KLx5F4dUxXrEdd3k9LWk/HatQkAkJfwBd+eEVwDT8ICk7wDUnC
 3ku7DHhy5ftTdPjNWBtBcWlQRBaNNLXCKNRhFL89qBF+nSF/COn1mw1KV6r3elsTmCGa
 j9AMYRF1GLpsjhqNH9rPgFVdi4aaln8YrCVi7dfGFZTR0ZGxlJc2PXt7uGSZ+JGHury9
 EQb3IeKo5P8ng0X0kMNl4hJH3Z+Zb50nEznQPQNpLhY6Cn60+qBA2MrkxMAF8eo1TtiR
 mzKA==
X-Gm-Message-State: AOAM5326Lgqs7YizHzWvzOKS90cc2cTdm57esNk0Itc0Vxz1xPqlORt1
 gaysywz+zKpEwLGveOz1zwSvsF6lmyGJp4Fo7Xc=
X-Google-Smtp-Source: ABdhPJxSUujMoQ0N/5YrOv0NkzjAOa1DYFknhYanT7tS1RZmC6dOxwX49R3l21pExpAU9KLPRmFl+mNeZMpsj+2TkBc=
X-Received: by 2002:a4a:abc9:: with SMTP id o9mr1585403oon.1.1606387377622;
 Thu, 26 Nov 2020 02:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
 <20201124043728.199852-10-damien.lemoal@wdc.com>
 <CAMuHMdXov3Dr7EmAeE7yrKRmtu_L3539u9cjeiGiaRu32YVPQQ@mail.gmail.com>
 <CH2PR04MB6522F476C51D4C65F116BE9EE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
In-Reply-To: <CH2PR04MB6522F476C51D4C65F116BE9EE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2020 11:42:46 +0100
Message-ID: <CAMuHMdU_3B4jogmeisykbeH8QCbUrKMM3Zd8qHftdGGKYbtJoQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] dt-bindings: Document canaan, k210-fpioa bindings
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_054258_533334_9336938D 
X-CRM114-Status: GOOD (  18.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Tue, Nov 24, 2020 at 11:05 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2020/11/24 18:49, Geert Uytterhoeven wrote:
> > On Tue, Nov 24, 2020 at 5:40 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> >> Document the device tree bindings for the Canaan Kendryte K210 SoC
> >> Fully Programmable IO Array (FPIOA) pinctrl driver in
> >> Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml. The
> >> new header file include/dt-bindings/pinctrl/k210-fpioa.h is added to
> >> define all 256 possible pin functions of the SoC IO pins, as well as
> >> macros simplifying the definition of pin functions in a device tree.
> >>
> >> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> >
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
> >
> >> +  canaan,k210-sysctl-power:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >> +    description: |
> >> +      phandle of the K210 system controller node and offset of the its
> >
> > of its
> >
> >> +      power domain control register.
> >
> > Your k210-sysctl-v15 branch has a bogus trailing space here.
>
> Oops. Forgot to push the fixed up patches. Just did it now (forced update
> k210-sysctl-v15).

$ make dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml:59:1:
[error] syntax error: found character '\t' that cannot start any token
(syntax)

DT binding files should use spaces, not TABs.

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
