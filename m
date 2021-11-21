Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0884AC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Nov 2021 23:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7CrhQgOjlMATbFRD5ksFjXVsmRRMxOoBhA33PQUAHc=; b=opHMl6hAfC9cPN
	HrXALlQp6iM57zZcuen7KYeBdLFgAimN7tXbruI0IyEHA4dXAlpRmC2KmxFEfOE6Bq50yKBz/NJXE
	w/PNszHkezKqvccxS/0v0mezX5pgup7g9DyKrrS6/JyfO4oOGHYTASrwWp8CUKYVPqmG/JLEytc5x
	B4SC27Yrt0I7NSxxbOgmVoiAoB8ZZXEAEWXxcQFC5SDlbULL+TKwYfg4mCo+UZezpNa1+j3Ab+Yrw
	Hj3HvGyzVK/RJuPAKHsOCKzmxnNyg5HJIu2MRDJjhREjHhtBhcxLwRg2zZWjHpz8TW8H44VdcveHZ
	gpW7ry60I33QCTMLIOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mowN4-00EWWy-CB; Sun, 21 Nov 2021 23:35:42 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mowN1-00EWVq-3x
 for linux-riscv@lists.infradead.org; Sun, 21 Nov 2021 23:35:40 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so26148295otj.7
 for <linux-riscv@lists.infradead.org>; Sun, 21 Nov 2021 15:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BaBwOZhHd4DxX6OyrXmhy1nl2ZJax3QUSfV+91vGF7M=;
 b=K+j7e9qBhUAibBOZEuR3+OvgRRz5+9kXuJpfy7hOrCUUI5mVAVvfPjVaSaQWagEtmD
 VaQjSDZvZCKKfl/PaO0UdwCeIlqMJ7eJooO6eT7GjoXW1uvDDryVqntBnxqhbhpAdjE3
 CmxKLcWB9dGg5+uW12IGRoofHXHVRV9TegwAW6qUaX/HiDYCvGQYSP2/TGLWo1eJk41q
 HLONx6bHVQumcQ5Vy4Z+6fD/ZgNYF7VwvELj9YticGsmN4Q2lcnFiWT5fPI5W1ugXnAY
 wRaew207TxZ9kuepimcJjzsp7th6vntEkiki7IDzihCyEVwhCSWDlcpKyzXN5bcdu5J+
 tDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BaBwOZhHd4DxX6OyrXmhy1nl2ZJax3QUSfV+91vGF7M=;
 b=4iN24GyNTURtg8bfqzJZXfBTXkH49o+U6H7waLp+MQIfz6l/3VGbLAS80kvuOBhfbc
 tLd2U4JPgjtgf388maIgwCdsFsqsAXSjp/LYsbERZ9gDSexFN6nrtT31wU7B0Mr6AzHM
 QU8WCprNudBPWtwP2yiOBdnhzqYKav4snfjUR5r2FkjsFfQwV5ue+qwKaH6jOEA1ZcAL
 mJyIUBlZWZt9uPWV6lf41c+Zd/RLQDHVsVAddvbuBmD/prgRbzmP4Jjg4DTVnCEJVt1f
 MIGSfUukpF78stcgtm9wAmL2tz8MoWVrgIaoHda7q/sG9MXejL8m+enmOGJTOE2rYrbl
 cR4Q==
X-Gm-Message-State: AOAM531/1ZL0g2Iq/AoFdS5+ksOd8gpdswd5eHTY4QEXec4G7bbgCEyX
 tyotu0FV4FhOLQzar+V/244oltm5llxI45TofvhOHw==
X-Google-Smtp-Source: ABdhPJxP1hm4dAk3hP5iwxGTmVS5kCY5d1BVX1iWfJPo1f0KYbx3q9C2qhLGJ7JQjety/S6BZHEqWcsnr8krInQwy+4=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr21475101otg.179.1637537737964; 
 Sun, 21 Nov 2021 15:35:37 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk>
 <20211116150119.2171-13-kernel@esmil.dk>
In-Reply-To: <20211116150119.2171-13-kernel@esmil.dk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 Nov 2021 00:35:26 +0100
Message-ID: <CACRpkdbsRg3KB=xvhUPF3gVjE92pTwsbV+1SOJ=DXSE7c9VNHw@mail.gmail.com>
Subject: Re: [PATCH v4 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_153539_203615_1730939C 
X-CRM114-Status: GOOD (  16.68  )
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

On Tue, Nov 16, 2021 at 4:02 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

> Add a combined pinctrl and GPIO driver for the JH7100 RISC-V SoC by
> StarFive Ltd. This is a test chip for their upcoming JH7110 SoC, which
> is said to feature only minor changes to these pinctrl/GPIO parts.
>
> For each "GPIO" there are two registers for configuring the output and
> output enable signals which may come from other peripherals. Among these
> are two special signals that are constant 0 and constant 1 respectively.
> Controlling the GPIOs from software is done by choosing one of these
> signals. In other words the same registers are used for both pin muxing
> and controlling the GPIOs, which makes it easier to combine the pinctrl
> and GPIO driver in one.
>
> I wrote the pinconf and pinmux parts, but the GPIO part of the code is
> based on the GPIO driver in the vendor tree written by Huan Feng with
> cleanups and fixes by Drew and me.
>
> Datasheet: https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf
> Co-developed-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Drew Fustini <drew@beagleboard.org>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Overall there is nothing wrong with this, and it is in nice shape.
Let's merge it:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
