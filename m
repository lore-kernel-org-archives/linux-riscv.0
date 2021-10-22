Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B57C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:37:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5671161163
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5671161163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWRGvBqf7hqqSSsZ2JEIQjCfsxuyWlVCP1npj/4dzVs=; b=gKDeQsrUpHOdZL
	luGhCyBGoH/lkViPUrMjxh5YhsOPwiU80VmqqZwMQREguHDqe2NivYtt5JG7Q+8yWJWXdVtessBQO
	IubL8WIwFA9S9T7LfwEvfUg2o1YviqnvzfM4oBebNB0EuPmi5Z8NiXTiLd5u+BYiX02eRN9v+1Ad0
	cw1uERvD7UFJrK157rENl/DiDf1TuDCxGKJcjpeJ+ZJcMTbKWRprZiwlB5R/j1YBM317J8a+XJPK+
	OUE3ODzgq8B90TAsFP6oGhE2YW7rNdOLK4LVjAx31SOhU9EGmNZrPPuSGexxA4XjHgtERai7sAsaa
	jnFWsFrGdy9S/WvzzbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mduj6-00B7nu-TA; Fri, 22 Oct 2021 13:36:53 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mduj3-00B7m1-4X
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 13:36:50 +0000
Received: by mail-ed1-x532.google.com with SMTP id l13so1916571edi.8
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 06:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3VqjR5oI/ait3rohMOusYdeugPboOfYtc3O9o05eMHQ=;
 b=Q1yRtDerJPfkd6V6vThQqZzlZX02K8g1faPyh5JvGtWbxyqlvyJdVLUGTYwPQ3saLq
 //fIB06jwTGHRGxKPLs8MJWyLB830xmXmsTkCETeG1taPcahOXie4rvc7CK5zltFt8oF
 oPUshuRuTnd0iZXy0ny9kVNx8mrm1ouS31YXXV69DYolYaT48xWqECVE7DhkqpFj8Azm
 VWMFDlsZTra/bzin+kya2NessF7ZGFHODA9zaBsoaYq5uCJaZikR/QWJcRu4iqFGwBxl
 7SUxGngqa3kITyZSSsSKeCn5rbO8WWtCwQv7XozRKVi8eu+fjf3xq7bGmV9vMO/W2GeJ
 DmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3VqjR5oI/ait3rohMOusYdeugPboOfYtc3O9o05eMHQ=;
 b=Kg3SsjmAzX3y3OQbMPna3mAmBCL1zGcgSwcNSmAlUPhggiNu88I7gY7QJ8jP26mvR0
 Upsdcml6f4OTUacBJLolwch844RKIUEdDl3H69zZUOp8VsX06eqN6mfM4vJ5hpotxbCO
 8Fx6Rt2GmUB7kt8bPf7Ll98jVQ37XWhUotRb9tobeHo+57ZFDTYirbWG7w9mGmB5xjqf
 oeN+MjIeMc7TXNxA/rkKjm/dKa9Z5s5/5o2C1iyauJB3IUDiJ/u3TOKAK5eusoUwbv6m
 6xgK2CcHKWOJ14YbGhMPG5Zofn2lG/tMC5KsVcSaHZO0CydrYyKy0zd96K7NZCqldkZS
 17bQ==
X-Gm-Message-State: AOAM5313ilEC9OkZzHOPahbWIAkxDMK8WXCEmgLImYm7LaIboqyIrfkY
 7FIDAG/lQC0vsXFFvyHjdEIoTxurJOY8Lwydxog=
X-Google-Smtp-Source: ABdhPJxTUPfm1rVOGx8gokzVv5igP9B4UGk9EquAWiBprb/AKADuLLwJMD4BsQNPgSHNpLkA0ym/zi0SHdqrUZTvc64=
X-Received: by 2002:a17:906:5a47:: with SMTP id
 my7mr14903725ejc.128.1634909805119; 
 Fri, 22 Oct 2021 06:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-7-kernel@esmil.dk>
 <CAHp75VcS7ZZCciAgBH2QU7u8CiHzveAOsvSdv2DQBvpBn_6opQ@mail.gmail.com>
 <CANBLGcyHpxuT9N+H8Lk=5CjMb1=-17_sH3dBzALCMYpAEZfeuw@mail.gmail.com>
In-Reply-To: <CANBLGcyHpxuT9N+H8Lk=5CjMb1=-17_sH3dBzALCMYpAEZfeuw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Oct 2021 16:35:49 +0300
Message-ID: <CAHp75VfjmYONiuaQMybCvnfswZKvwBVAXH+sFirOoOb9YEzYHg@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_063649_219449_31B8849A 
X-CRM114-Status: UNSURE (   7.90  )
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

On Fri, Oct 22, 2021 at 4:13 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 14:34, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

...

> Hmm.. this function doesn't return int, but struct clk_hw *, hence the ERR_PTR.

Ah, indeed, sorry. Got your point.

Of course one may try 'return ERR_PTR(dev_err_probe())', but this looks ugly.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
