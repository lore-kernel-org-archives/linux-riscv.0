Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A42C25B08
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 12:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XC1BUuwI1VXcwamcn+NuaWeyz9vf77mTbaY6cHmqWoc=; b=XspQ0EN2euNX6B
	19HRJymwKPU0RgAaVyRUY5kT54cvCHnaOifLRkr9nyUxdyIoMMlDxeLTHXhGhHKLYVAbU0mNdH3cD
	FHousuf4SF/F1d6f+tA0ZDKlkiHgdluKdO5+uCLcFG7p+Oj8TqiLquZj5Xut9v3x8+9gbgEOle9bc
	CopDYxal3xgZLUjwkpMhAHSW9VajF2lJ/8HuWgqTin/6Q0h0e5s8Cavh+V0xLyKfmaBVwvfIXm9cO
	QBKgoaJqC6CeUMe43JwFkjhgYjThddqH+Wm+gywqy+R0XXNI7KBef7MYnEV06ZozM2Kljk0dduK17
	UgZxnaEZfdBd/KgilcCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPNGV-009hQK-80; Sat, 20 Aug 2022 12:07:47 +0000
Received: from mail-qv1-f44.google.com ([209.85.219.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPNGS-009hNS-2P
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 12:07:45 +0000
Received: by mail-qv1-f44.google.com with SMTP id j1so5083896qvv.8
        for <linux-riscv@lists.infradead.org>; Sat, 20 Aug 2022 05:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ZR3FjkuW5iiRmrC3UtyKJcWdpW3MmZDZj9swwhPKMYc=;
        b=SKubccnIJcnGkEnisl2AQK0wENEYbSw3cWvDzxqmYe/MzWbZUscCsuV1Anbndg+tEf
         stwTqZ76lFxC6wW8DKHuSyJHLJsSG55OwB/LReHfznX4Ktz4lXb/jxV8c+w6y6NYHwWw
         EeD9qd/SjyvGZkIHXGhFSchxLs8A6hOrYnQ+KAwaCPjsXnAW+7jjM+UmcLcO/DOGgXfo
         ZvyWsbyfxXibxcBcrS9jKtNx4GSpU9lUC5m2oSQbtfErk6YE1e9veOZWBqy8LkLruz5w
         Q8XzZ/VxU+GGV6PF1cgN6Ns4w2yNDL2wR9Ls4p3vqNA416rjilYaGaU6YmEPbkNIQcQ+
         aZVA==
X-Gm-Message-State: ACgBeo2B8JzXOdgd1ls8obAdF8O1t4tglT2hyKcMMiKuZlpmoXJ7bfS4
	QWl2bDmtjX1b3UlBdgB955FCWLdsdrsJ1g==
X-Google-Smtp-Source: AA6agR6/AgBxzbLsQLp+JVRsTTBo18LV6HyZqhN2IRAl8EBJguDK8HW5aRuWzrTPTjqXxAcl0Gehiw==
X-Received: by 2002:a05:6214:226b:b0:474:7c12:ecf9 with SMTP id gs11-20020a056214226b00b004747c12ecf9mr9735167qvb.37.1660997261379;
        Sat, 20 Aug 2022 05:07:41 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id h5-20020a05620a400500b006bbb07ebd83sm6523332qko.108.2022.08.20.05.07.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Aug 2022 05:07:40 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-324ec5a9e97so182937127b3.7
        for <linux-riscv@lists.infradead.org>; Sat, 20 Aug 2022 05:07:39 -0700 (PDT)
X-Received: by 2002:a81:f47:0:b0:31f:434b:5ee with SMTP id 68-20020a810f47000000b0031f434b05eemr12132492ywp.383.1660997259528;
 Sat, 20 Aug 2022 05:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <e9b00bb5-bb78-091f-9c10-96c156690469@microchip.com> <CAMuHMdUGttswcSGeOdrJLeoZLmoeKhm7R82L-3wLJnagmZ4dBA@mail.gmail.com>
 <47cec683-dc17-7aa2-3511-b0244020d571@microchip.com>
In-Reply-To: <47cec683-dc17-7aa2-3511-b0244020d571@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 20 Aug 2022 14:07:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUSud4-0ercQe3cyg1RXqg4DKTfgvPh5wc8ibca6dyDKQ@mail.gmail.com>
Message-ID: <CAMuHMdUSud4-0ercQe3cyg1RXqg4DKTfgvPh5wc8ibca6dyDKQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_050744_197607_8FC7CBDA 
X-CRM114-Status: GOOD (  27.38  )
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

On Sat, Aug 20, 2022 at 10:49 AM <Conor.Dooley@microchip.com> wrote:
> On 20/08/2022 09:45, Geert Uytterhoeven wrote:
> > On Fri, Aug 19, 2022 at 8:40 PM <Conor.Dooley@microchip.com> wrote:
> >> On 15/08/2022 16:14, Lad Prabhakar wrote:
> >>> Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
> >>> Single).
> >>>
> >>> Below is the list of IP blocks added in the initial SoC DTSI which can be
> >>> used to boot via initramfs on RZ/Five SMARC EVK:
> >>> - AX45MP CPU
> >>> - CPG
> >>> - PINCTRL
> >>> - PLIC
> >>> - SCIF0
> >>> - SYSC
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> >> That aside, by convention so far we have put things like extals or
> >> reference clocks below the /cpus node. Could you do the same here too
> >> please?
> >
> > Really? We've been putting them at the root node for a long time,
> > since the separate "clocks" grouping subnode was deprecated.
> > The extal-clk is not even part of the SoC, so it should definitely
> > not be under the /cpus node.
>
> Under may have been a confusing choice of words, I meant "physically"
> under it in the file. Maybe after would have been a better choice of
> words? I wasn't suggesting you put it inside the CPUs node.
> Does that make more sense?

Oh right, you mean the order of the nodes. Yes, "extal-clk" should
be after "cpus", following alphabetical sort order, as the nodes have no
unit addresses.

Sorry for missing that in my review.  I also misread "below"
(in Dutch there is only a single word for "below" and "under" ;-)

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
