Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA958C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:41:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AD66611CB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AD66611CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYZwr86YPGC04iraZxEHTxyis4mpPjetjbUY46uOlrY=; b=P43tRc/Yee2UCC
	3pWysL6YrG8+IGMlZ4j+M2q2Ryjvm4oVxyYyMKaXEoTiAS6ug8oAwIDUZcscXPxbWSMq5pHcTRGBd
	hV0k9Dy5F1VtRd6H7kG7SUamUNZachHs6MLTTorjRRSb1bPGT+3DmAfh/tk64YQJGszkjeWhVLfsY
	HwynnOWSSYDZcXE4k/OcBsoIMjsdE+rcPWhUrph3GgxHJWjG92p6VL9EaM+7Z38zQWAhcbC1bESgL
	/VSswCDS6bYMrZ2YIYNS+0l+jV6pzoQKFzKFbeAG6A4YYAy7XKbF/cAlnVx6Ojqrw7ZBkk32Jy5Ci
	l3XLkoLzsoChBDTTlYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mduno-00B8n5-Nm; Fri, 22 Oct 2021 13:41:44 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdunl-00B8la-QN
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 13:41:43 +0000
Received: by mail-pf1-f171.google.com with SMTP id t184so3714136pfd.0
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 06:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0+jUS6xI/DPxP6ZrnElaJwUrZ90DL/yMXbpKtqC1M5U=;
 b=xXQUq2bBrzBLftXLQrmDwuwKbE9tWFSLg/a2bYKkHBrktHwUGfBKClvWDlgzADIS3F
 vTOQ4jDfO+tPrO5wFvTk9YrV2H6uFCd4EHIkLTIL/qrEmNSLaqTefFrgYCw2J/5zO/zC
 tNJvP35Anp8Z+VnlVkq7uFoDWIVM3B+Va5qRg6Y2VQTG8QwK7s+ilRPcRAn3Chn/prK2
 dml6ma2L4VGPlpWo3JlBxAtbjrusUuT0a7R6/0cV/jyoymC+ECen9hagnHsPfPUAcLmr
 hhScbioJohDT3VbQ0i1JueXZCThdBIa+IGwBI29wNVXQPxFz2B2q2A/w4X4yzi+CLi/A
 dtjQ==
X-Gm-Message-State: AOAM531LBYip8YXCMTWNirqqIKqVCHXOEW5Oc8dQC6pSYEEod67aPgpL
 um1VC7C1RqY5bR+BRjaxhcTcbZ+pNgQaJsvQ2uU=
X-Google-Smtp-Source: ABdhPJx2bEGH38tYpjnj/Z7q11aMhmbP/LA+2K64aHqc6A0Bq7iVVU1ut4Jrlho/aCrHoSS8iE9jknaEW8LIrs98Szs=
X-Received: by 2002:a63:7047:: with SMTP id a7mr9320545pgn.458.1634910099521; 
 Fri, 22 Oct 2021 06:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <8735otjjjx.fsf@igel.home>
In-Reply-To: <8735otjjjx.fsf@igel.home>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Fri, 22 Oct 2021 15:41:28 +0200
Message-ID: <CANBLGcw+2MYSDmnKSjJHjPVGWo22kXngRpfQq2xrr8BYYLbhOw@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Andreas Schwab <schwab@linux-m68k.org>
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
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_064141_890904_C3D666FC 
X-CRM114-Status: GOOD (  11.75  )
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

On Fri, 22 Oct 2021 at 15:06, Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Okt 21 2021, Emil Renner Berthing wrote:
>
> > +config RESET_STARFIVE_JH7100
> > +     bool "StarFive JH7100 Reset Driver"
> > +     depends on SOC_STARFIVE || COMPILE_TEST
>
> Why does it need to depend on SOC_STARFIVE?

It strictly doesn't but most other drivers in the same Kconfig file
also depends on ARCH_something or SOC_something. In particular
RESET_K210 depends on SOC_CANAAN. I think this is to prevent
overwhelming the user with useless choices if they didn't enable the
relevant SoC, and for others there are the COMPILE_TEST option.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
