Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C78C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 14:25:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2622860E96
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 14:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2622860E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Upb4Sb7NkkQ6fBkEQSKhfHdN4trCU6RySeJsujMxg48=; b=4h4Yz1ed5kyEA6
	rhxJHiBtbjKXuAxD07PSnSJC57A7scviP6szJMU1t3kNAiaLoPxQOAzedojKEGciFDNDF5sRcLVZM
	08XW/HCa43Ib0ETqSC/1uVNLbIzJVX/JzEbZrnDFSNs4vOTfaf2M33Rx39QYBQgAr6d8i2dTFPJNK
	7QQaj4AIALzXs8yz2XEZxPW85i7Mr+RWpb9OriTwHT3ATTfqwPNqyOnqZ9aAThgEkhCqm+Ig/iWMW
	DuBV+J9uzafnpIMFWgFHxWw+G0lhYaMmXNvxo4cMAZSdFRI0FcJ2YNPVqjunNvBE0kVJN3fguSEl8
	Q0jn96jt1/GsLOTBSqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdvU7-00BHV0-T4; Fri, 22 Oct 2021 14:25:27 +0000
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdvU5-00BHTu-6d
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 14:25:26 +0000
Received: by mail-pf1-f172.google.com with SMTP id m14so3759940pfc.9
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 07:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jorqKoNvCog+RdJEWLLzk4/vugG3Lx6Xwa7r7jPCqTI=;
 b=C8shigGSNTLbHRHRnnRBV25kWjlVv4zxKfOppAYUM1jatxEM7r+HqJgJUXW6uKEX5W
 zcmDe7crkoDPrXVrMMDvx9dFWR0GgHkYb8+1mC52NSlOGj0Q6YHzpwrIKR/SAC5rDCas
 KKGu/cAibZE4tPtbUSU1jGkvm/rqbdaK9xpZb6KcsHudr74eWsK3kBAU0lbPTBNe2//6
 FoEZrYDb0MrvpdY7HGolMvTBFtSk4w55J7BFCaz7a7ylOvhrugFdA7pcdodaRE+7Kmbj
 a1A2U/GCEueTSDe8WGekkFQNUb/0E1xblGtqTJKmUsVxkOducelYN8skDd/yppfsgVTe
 Ti/g==
X-Gm-Message-State: AOAM533rRPc0IEaYUkzercZA24iJ72/s/VWpgxUe0wQBAe2ZZwpGf7Na
 dasS58UvJt4JzGlisMYTsTsuOlecJKv1wdnCGZ0=
X-Google-Smtp-Source: ABdhPJwwiGgg/wAhh2MuTJi/0OlJOC3w8grm3LkhekM9ZxjuDcMopYi54hXrYFPVSp69WJyB7UqQZkgeS1a1t8VrapI=
X-Received: by 2002:a62:5257:0:b0:44c:ed84:350a with SMTP id
 g84-20020a625257000000b0044ced84350amr12576754pfb.79.1634912723745; Fri, 22
 Oct 2021 07:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
In-Reply-To: <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Fri, 22 Oct 2021 16:25:12 +0200
Message-ID: <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_072525_268939_6AE45D02 
X-CRM114-Status: GOOD (  15.60  )
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

On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > Why all these ugly % 32 against constants?
> >
> > Because the JH7100_RST_ values goes higher than 31. There is a
> > BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> > machine.
>
> And? It's exactly what you have to use!

So you want me to use an unsigned long array or DECLARE_BITMAP and
juggle two different index and bit offsets?
Also is there a macro for handling that we'd then need 4 commas on
32bit COMPILE_TEST and 2 commas on 64bit?
If you have some other way in mind you'll have to be a lot more explicit again.

The point of the jh7100_reset_asserted array is that it exactly
mirrors the values of the status registers when the lines are
asserted. Maybe writing it like this would be more explicit:

static const u32 jh7100_reset_asserted[4] = {
        /* STATUS0 register */
        BIT(JH7100_RST_U74 % 32) |
        BIT(JH7100_RST_VP6_DRESET % 32) |
        BIT(JH7100_RST_VP6_BRESET % 32),
        /* STATUS1 register */
        BIT(JH7100_RST_HIFI4_DRESET % 32) |
        BIT(JH7100_RST_HIFI4_BRESET % 32),
        /* STATUS2 register */
        BIT(JH7100_RST_E24 % 32),
        /* STATUS3 register */
        0,
};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
