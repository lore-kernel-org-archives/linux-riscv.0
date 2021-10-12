Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A076C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 15:21:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10B4360E0B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 15:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10B4360E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejo8tPB2xxS+JFFkXOKgIQpvIeiece4L/4dHt66x5so=; b=I/D/E9QfxuisMX
	0h1RDrU3+PTRewhBqDNNMsPZ5fsjzCs7UcN3tWZ7U+IYqp/k16miYCiIYb7XpQWJwJSq0w44ECour
	vtiMKJ4eCTgoVx8BukLDGFM0zrf4OjDRLXfO/u4XjgnYCiyaRqHmWuiIKurtebMdP52dsYqd655iW
	0njIaI3FDtSGiCnzKh/5DnCj7Qv6/VFPZT4a2SlOkns6cpAaLdMsmTqsR1SKBAtbFEXtezGqDWB/P
	gXwDESMtZ3wdDbsRse2zDcdr74rKob2F7yGO2nE7Qg2G3CjpphHmP163XsDJcrGKW292ier/TNe1V
	t7GxnH7QzWJdVgd0R8lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maJat-00DL1M-GX; Tue, 12 Oct 2021 15:21:31 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maJaq-00DL0G-9q
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 15:21:29 +0000
Received: by mail-ed1-x536.google.com with SMTP id d3so1018962edp.3
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fgwbge5K1EzbR8VI8a8H+Le1NZKMMr2m8pTON2xUTN8=;
 b=QzV9YbjGsg5t2ZQdqkJweilCwjmv4f72WtizTfjRD1Z69nHKwlfIiVk9MKiRlbEJ3M
 TIHpw/FxnC/HP+5SA6hgP4KYPicWuytgbi9wK8eIt5nmUVSYpScMPgY+o8EiY28/GHw6
 N0FLqSe4XHbska7BuYvfFGFuLxwQ5ehC37hDLaiWT7iLXWenpcMsDHXEpDwkNw1UoluY
 bChBoNeZU/DB1fJvp9iHrNPflFh88J+rkZLx20pNvxo6J434CKGA8xip4fm0zZb645PF
 duqJZMT7VmJha6C2jowMLglzgpTLnF6hzYtGuX12RQEr/03u8EZDNEWZlzQ1sAhaIRMH
 /WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fgwbge5K1EzbR8VI8a8H+Le1NZKMMr2m8pTON2xUTN8=;
 b=ixigMSjmCgUT57aDOSt68JJ2kLwzwJ71OX3MVq1iDBWcHLLyBEvTdvgkE5OS8fkVeT
 s1DpsXa0oegJZGmCv4E+gGosqXt6JzCEndz20xP7H1gagLqg+TWvqsMkGAu7rUZZ1Yq3
 RbEXQbo3KlLDflwjzO1ksGV5ji26Y1T2mxapJvJlc/7jUXElIe955weD5qCsOzW4Ci1o
 7r6BP3fMUqILOEtas4UNnjSfxHoP81UhPIhWAAaAeJ/pcD8+ZJQPQK9lfh+M2V9/cFhf
 hlXlKr2PVt5bSOO/aUSXM28PckusIzLNk3dd7wvxVO0Xy0TLNJXGpme1jsHYva7xt4Qt
 YpuQ==
X-Gm-Message-State: AOAM532hf/gW7ZQtLQgjwOcst+YDZlg9DPnDMT0/DTf/3+DrSKY33wJE
 KMeYjwANrEZrdY3BCqlYsKindy5XqO+qS0Lp+e0=
X-Google-Smtp-Source: ABdhPJyH2Cr0E/CmRn2fpGIMT6foljvhODeW0WmDCNiwPWy1V5M7oQBd/zsMp/jE5RFRB/+ZUOCr7c7fggDU4sXQp/0=
X-Received: by 2002:a05:6402:143b:: with SMTP id
 c27mr606000edx.224.1634052084925; 
 Tue, 12 Oct 2021 08:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-2-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-2-kernel@esmil.dk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Oct 2021 21:20:37 +0300
Message-ID: <CAHp75VcCCxPmnzoE5PSxtODdguoKa7VA1r2yrJRLQ=gOAevu2Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/16] RISC-V: Add StarFive SoC Kconfig option
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
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_082128_366141_B99E5330 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

On Tue, Oct 12, 2021 at 4:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Add StarFive Kconfig option to select SoC specific and common drivers
> required for these SoCs.

...

> +       select SERIAL_8250_DW

Is it critical for boot? Why?

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
