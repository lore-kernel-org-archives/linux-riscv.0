Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF23EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 19:59:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F81360F70
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 19:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F81360F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rqdo3cB0eCtn8rnARodrc+9Q9NWsbQOSWYkCnwGZ6g=; b=w2xflJ9MoxaeWk
	cV/nGuBh9PROkU7KHpWF8Nvqiok3JqH1KBnE0vqEr2swoErNWeyROCBN6+1+yiDGgzsWllFlDZYqa
	FjK1UC8lN7wZzLY+5QyP+LVjlBJa/nvEfW6oCGww+gctxX3DSw0w5nMkoxlSe9CrO0DhPUKXFqqWL
	gKIqR7S9suYWynhU3KDEjh9aOf9Y1JThGC9hBGy9ZNyRr999vBtx3S04pcP4tOIxNI8CtSmnsa2PK
	uvsiw7nPvRoXsfygaU39rpAkX0JmcsMP5nVGVvolXcl1kfPVLSK1CV4HwFC+Aj3/ytuCK9NOJ9O4/
	ar9lQz+OV9yjKW4PKe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhzw8-002rgF-EJ; Tue, 02 Nov 2021 19:59:12 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhzw5-002rfk-EP
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 19:59:11 +0000
Received: by mail-pl1-f179.google.com with SMTP id t11so477949plq.11
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 12:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RkF10ejv+ZfbbBVLr9JViJZH+YXp2/4h2Ubp9f1gi2c=;
 b=yNsS+urBjRkFby/zNUNQakcYqDfbL4Qb1Srdnij4Uqdse5J1PuKWaVwy5pOwQHhS7R
 pqucaZuYAskvLDAiMKT2yr3FgztLmvsDfj+hosMd7VpIBrJvE7fbQ1CNFltUWfTAgCNk
 8z43yLpO+UhocqksiXXxgZGCysEN1QhAd6OOsdI7rH+VEFR9evNQmNtMCpa7UML7/zfB
 e/mviE4ZGN20B3JDfSmJOm/XMX9VP3uR+uhI1d+7LrHL68QTef7k7ZIryubQMijgRFPE
 vdtieISY36wKYFOlxSeFECdeBAfg6bWiiHbnDIq7YSGLq4a1s3x6f95f4pCnmIzmB5eR
 bkQA==
X-Gm-Message-State: AOAM531Tj3JZf/9/lCc+xPxsjGu7mUqSvn2b/gsblf8paVMLvU7OBbHA
 OxpGnFbGSDfLje463VRGwe1CrH88keH9CnZ0lJk=
X-Google-Smtp-Source: ABdhPJzAfyeKaGl5VCZ/L0KzMJgJN7/MZZr3d178DvhBBn4vWjScd0QbjXhDeG6xtMzYne48NrYC54CQIPNWsHmSO+U=
X-Received: by 2002:a17:903:11c5:b0:13f:ef40:e319 with SMTP id
 q5-20020a17090311c500b0013fef40e319mr33828546plh.33.1635883148168; Tue, 02
 Nov 2021 12:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
In-Reply-To: <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 2 Nov 2021 20:58:57 +0100
Message-ID: <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
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
X-CRM114-CacheID: sfid-20211102_125909_526216_C8C54DBA 
X-CRM114-Status: GOOD (  26.05  )
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

On Tue, 2 Nov 2021 at 20:43, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> +Cc: Yury (bitmap expert)
>
> On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > Add a driver for the StarFive JH7100 reset controller.
>
> ...
>
> > +#define BIT_MASK32(x) BIT((x) % 32)
>
> Possible namespace collision.
>
> ...
>
> > +/*
> > + * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
> > + * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
> > + * same line.
> > + * most reset lines have their status inverted so a 0 in the STATUS register
> > + * means the line is asserted and a 1 means it's deasserted. a few lines don't
> > + * though, so store the expected value of the status registers when all lines
> > + * are asserted.
> > + */
>
> Besides missing capitalization,

I'm confused. it was you who wanted all comments to capitalized the same..
64bi
if it sounds like bitmap, use bitmap.
> I have checked DT definitions and it seems you don't even need the
> BIT_MASK() macro,
>
> > +static const u32 jh7100_reset_asserted[4] = {
> > +       /* STATUS0 register */
> > +       BIT_MASK32(JH7100_RST_U74) |
> > +       BIT_MASK32(JH7100_RST_VP6_DRESET) |
> > +       BIT_MASK32(JH7100_RST_VP6_BRESET),
> > +       /* STATUS1 register */
> > +       BIT_MASK32(JH7100_RST_HIFI4_DRESET) |
> > +       BIT_MASK32(JH7100_RST_HIFI4_BRESET),
> > +       /* STATUS2 register */
> > +       BIT_MASK32(JH7100_RST_E24),
> > +       /* STATUS3 register */
> > +       0,
> > +};
>
> Yury, do we have any clever (clean) way to initialize a bitmap with
> particular bits so that it will be a constant from the beginning? If
> no, any suggestion what we can provide to such users?

The problem is, that even if we could initialize this without the
monstrosity in our last conversation a 64bit bitmap would still
produce worse code. As it is now it's simply a 32bit load and mask
with index and mask already calculated for the registers. In the
status callback the mask can even be folded into the register read
mask. With a 64bit bitmap you'd need to calculate new 64bit index and
masks, and then conditionally shift the bits into position.

If this reflection of the 32bit registers bothers you that much we
could alternatively do

static bool jh7100_reset_inverted(unsigned int idx)
{
  switch (idx) {
  case JH7100_RST_U74:
  case JH7100_RST_VP6_DRESET:
  ..
    return false;
  }
  return true;
}

It'd still produce worse code, but at least it would be readable.

/Emil

> ...
>
> > +       dev_dbg(rcdev->dev, "reset(%lu)\n", id);
>
> These debug messages are useless since one should use ftrace facility instead,
>
> --
> With Best Regards,
> Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
