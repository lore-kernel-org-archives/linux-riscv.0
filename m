Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E93DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 16:22:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E43C61872
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 16:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E43C61872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjrqUOvTBT1XYxZ/ylrGskNx3eoOLIe3c8Xnsj0fmi0=; b=OM/4rlcnkuY7BC
	uXWYM+DwVocCQvFz60xOB1JQSAzSpMncGpqmWIL5n/PVM7p4G8ivcnqKoR3vnimJqln/PuJesyPWj
	+mVfjjdDCXjkG1ZoDL1XqmHk/i01vqv/m3x0nc+G5T6kme44jioz3YWFsZnaWFcaM3OuGsy7Gh3w7
	r7TSQT+2lqIKjgDrXYZWpTnPqrA+AO8TlZz7nD7W4BBbdlReT5yOSQxiFyCPCCuv7r/dtSOZusTyn
	K3JxoJLQqVAzSdYmcHjcwSzCRSMP2WTnr3wAWT6F1Uo42GyVqn+Qkg7K8w4zG/uJA/osVr4w3jtiS
	4UCHlie66DAeervUPW5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn1DW-002Jhv-7M; Tue, 16 Nov 2021 16:21:54 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn1DT-002Jgh-LP
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 16:21:53 +0000
Received: by mail-ed1-x531.google.com with SMTP id z5so30422945edd.3
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HbjQZ9qC9PVy9xyUznsD044YzcKQcNeflsU41tNyEx8=;
 b=adkmREf//AVW+01II7pYaKJQurnlV6epCtfgqSPf+f1uy25bpjBD2NWbKHm3knPCwp
 j8CtrEIWA4SLI+qqiMVjVUDm540HNAH/R+k1Zz0v3oaZHJSNQnaRCV2M8rbvjylWrA0A
 kTwCkiw+0NBNj2Hd8VJeZKxcYGOj1dWUDiMX9CBIPz+uzLfgU5V8irwwaG5vye/XKwPf
 sohcc1AM9dL+M1WVOIsDGJc02GaGUTdVcP/0utjf7ZajIXP1je2BpPUejZB33SyfWY69
 ggFROuynTLfWDShw2WNe5hxcse81BsM2jWrlwpxlKmlOhUuCetL5kbe6ZJ0d2OlFr6Er
 e7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HbjQZ9qC9PVy9xyUznsD044YzcKQcNeflsU41tNyEx8=;
 b=h23kqqu7zYCOkfFsOk2CQRFGwQZNk5PEmLON5+qZ6Zh8V5LiFN0gIZrj/ZPpNCz8Wi
 xdj6XGyvlxITbp+BAEB8YhfxF9LFZqDtM2EF6+Ed7qPyMpNn0VzoLj70XQUxby1ACGiT
 a/nijOIbTlsi6aO/K/IBLDLzKEBGTAmexe4lA4LPlNIRvUXRAl01j9V6/raJKvT4c4zW
 0T0ZMiV1AdNeFr11kmE/63/+d7hgmE4VWWkjSwq4B4HVxRyTX/hoXJ5aq8/JNnKZcRYh
 A9g96KEnM15b8IUjFD+f+47Y8scpscbWLdDZccZYMcZsbc32WMHDebC4eeZ/fe2IAbav
 Xi6w==
X-Gm-Message-State: AOAM532VtcCBaPTljx6bdECpj2oC3C4ELxaTrJK723qg0KmjkQCiEp+y
 4kLXz7kC4AhoZ0rrprSPG3Ltz0dFxOSN9kYZuco=
X-Google-Smtp-Source: ABdhPJw0xUYhZeCDQ1K16VL4b8hQ89kn7JVjj324pCSD8CvqzYdih+ZW2BrxBBJPvwrJJPKEZ/nnOEWAzmDejrK4XYI=
X-Received: by 2002:a05:6402:84b:: with SMTP id
 b11mr11743912edz.107.1637079710222; 
 Tue, 16 Nov 2021 08:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk>
 <20211116150119.2171-10-kernel@esmil.dk>
 <CAHp75VcUziRv4_U9aDfKu2SKnqj1dab7y+N90tw0JaEKxWW_wQ@mail.gmail.com>
 <CANBLGcz-sRBVGDc2sLtuTdwUesi4QDgB9yCZqhZpMfF6f5dReg@mail.gmail.com>
In-Reply-To: <CANBLGcz-sRBVGDc2sLtuTdwUesi4QDgB9yCZqhZpMfF6f5dReg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Nov 2021 18:21:09 +0200
Message-ID: <CAHp75VdJ1xZ8ZGSwjKdvcQzkyfTKcEDzVBLkhdh-Vp3Cx=HdBA@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Emil Renner Berthing <kernel@esmil.dk>
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
 Matteo Croce <mcroce@microsoft.com>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_082151_741168_F2F9EFA8 
X-CRM114-Status: GOOD (  16.31  )
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

On Tue, Nov 16, 2021 at 6:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 16 Nov 2021 at 17:01, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Nov 16, 2021 at 5:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > +#if BITS_PER_LONG == 64
> > > +#define jh7100_reset_read      readq
> > > +#define jh7100_reset_write     writeq
> > > +#else
> > > +#define jh7100_reset_read      readl
> > > +#define jh7100_reset_write     writel
> > > +#endif
> >
> > No need, just use always readq() / writeq() and include io-64-nonatomic-lo-hi
>
> Hmm.. how would that work on a 32bit architecture where sizeof(long)
> == 4? The whole point of this is to read chunks in sizes matching the
> words in the bitmap later on.

Why not? You just put some amendments, see below an example.

...

> > > +       void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + offset * sizeof(long);
> > > +       void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(long);
> > > +       unsigned long value;

      void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + off64;
      void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + off64;
      u64 value;

> > > +       value = jh7100_reset_read(reg_assert);
> > > +       if (assert)
> > > +               value |= mask;
> > > +       else
> > > +               value &= ~mask;
> > > +       jh7100_reset_write(value, reg_assert);

value = readq(...);
...update...
writeq(value, ...);

> > > +       /* if the associated clock is gated, deasserting might otherwise hang forever */
> > > +       ret = readx_poll_timeout_atomic(jh7100_reset_read, reg_status, value,
> > > +                                       (value & mask) == done, 0, 1000);

readq_poll_timeout_atomic()

Maybe at the end of the day simple use of u64 will be better than bitmap.
Up to you, you have got the idea. Either way you may put my tag.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
