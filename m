Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27F6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 08:38:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB7660F23
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 08:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CB7660F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYp96mygmGWD8eyRnS0otkcvx8tZB076AwcFG8OCrKo=; b=bunCB7h7hnt/J3
	7xuKaetJT0t76sYc4z3ferA7VBN+AJm53zoMoGSIMxKwA1myBtwZFEpoMwy41FcpvFU1ro+l+hwjq
	zO73rDcFV9ptA8cOE8tUF480gn7hLUsk/fppEGEoxgALGITSP7QfuVyMPpP/OA3XTmmzVyKXbBv0Y
	CQZyjLlHKo2sNJTOqHjX9KENKFTS6tlrHkvOHsMIjzwgSxvVr9Y2UCSJifGiIDrdCnmxdrOSusiJ+
	+m+P6Db+yJRYLxzcfo2Gs527VW4qRva+PFTqEppCHitily0CdbKK1w2l4PtNdQ3XWuj808PmD0cf4
	CoVl96HXjf1ORxPG0jFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZlw-00FbZi-La; Wed, 13 Oct 2021 08:38:00 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maYOf-00FHVK-So
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 07:09:55 +0000
Received: by mail-ua1-f47.google.com with SMTP id e7so2525763ual.11
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 00:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n2Vfle/L4DE8NNVonQeF5lDlU0mWpcADJWBKbo+5jlg=;
 b=0vQQnUoQ3LjQIoesdJwD0wzowlRs82nYOrVqIy86R1smmg9GscptuSUZDbLxsjzfyd
 6kiw90RzTi4tFpj4v5uFLDIQSunRlOxeF+pRMu67Mwj9ghH4MogWP29vYapJ5B4CHiNQ
 s6q0CGXyyChYkBApWusc7yNTBAOgFl2A27/+qzXt00DpVCajMzLStgShJnplt3/4OGWo
 avb3mGUxjbOIrEmPEStMjD8vueeV1/zXEvDEfwRzKuyOKgvzX47iOgtSJJpfwRcHRccG
 FvDoN/IoGQ+NJJMKnkdX4izQJTcHST9rXZ3l1Mz7MI3RvTIUGP1r6mP8/nUFLOfqmdd9
 BI6Q==
X-Gm-Message-State: AOAM530MUywkZXWRUhbZ/NaGVsFFq8unF3I6+uDpKjVG6kZIVCqP5XFg
 loJ4+qZKpZJNunEAQbRw3ZCv2gHs93dKqR1eWxQ=
X-Google-Smtp-Source: ABdhPJw9m3bolfmVg7DS3DCFf2Y3Gnn0kQSL4lmvuOhPzzjoHLSBo8TqPmo7TCeoJyzlugmfCsY/y5nnNy0Wk1eojM8=
X-Received: by 2002:ab0:311a:: with SMTP id e26mr28277722ual.122.1634108992835; 
 Wed, 13 Oct 2021 00:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-14-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-14-kernel@esmil.dk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Oct 2021 09:09:41 +0200
Message-ID: <CAMuHMdVq4pKovPsk0cAWSZ3T0-z8uVG1Bf306ya37BZnx0knpw@mail.gmail.com>
Subject: Re: [PATCH v1 13/16] dt-bindings: serial: snps-dw-apb-uart: Add
 JH7100 uarts
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
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
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_000953_968836_3095E71A 
X-CRM114-Status: GOOD (  15.53  )
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

On Tue, Oct 12, 2021 at 3:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> Add compatibles for the StarFive JH7100 uarts.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
