Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B7BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 16:13:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 466936187F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 16:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 466936187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6iJpB3VbQeoXrXZggdoEqH7HspSstM7cL6hyv0dLk8=; b=rpsSW4YGpQl97V
	dA9Xz1TPrjrj7aG0kSIogROlTpIAjMZRpGhphSouAum3E+91pjVnqAGOEWWAdp4S0w08pRH53oYIQ
	uX+h3OAD175qs7mAFwxWF6/zOvsigJMWw7iKdoehEfubBPhHAaC6MjAKLiGb+JKPAgCjqfp7d9Zlm
	bG1hejt2bdvjGFVcC2W7OLfAjfZ2pXnzaTX3/58oCA1tBltJASxM1S8oFkmSo7L8dAtL2GM9Qzb0r
	/U/G1eUkY7UfuPwJsjRQCcqoFDYpvAPedD2D3GysCnt7OUZIHyLYkLRCbo6/MBVIsUOdanRHfQvCX
	KcvILHuCG+c5fD6iQhkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn15g-002Iay-Vd; Tue, 16 Nov 2021 16:13:49 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn15e-002IaJ-Om
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 16:13:48 +0000
Received: by mail-ed1-x531.google.com with SMTP id g14so90279784edz.2
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 08:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=50QCkGUElk/jMFTX3H/2D+qJecjTCiwTPcIPrxs29UY=;
 b=lROBxbp6aw1lSJFZve0CLEi4r203O6x+xtEj4ordjC5YTDarvHSdJbgbfvOZeQ4ryQ
 dmel/Fomvo8b1w2IxT5JHIBLL9YmtpQBnc6aiL8Hpnhjn9y/Ms+zRyzsuXzsyi13N9B1
 rCjjSDOCjdoezAhHLmxac+RjiU/GAIoHBGRc6R232naf75seKfUcJhXtso17EAfNKyrx
 udsHnKa59eMP4lZl2tuZzYuXUlAn2LOKugdb0ndhYuAugSN+nGtB40egxYe9nC62qJz4
 fxWh0LgJ21Ig9tf8KDFyFN6bu4AiLlaRDjG/NhR5ixEMQ7LYwdvNKzwETWjwVedqr9cQ
 b7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=50QCkGUElk/jMFTX3H/2D+qJecjTCiwTPcIPrxs29UY=;
 b=p/xx3oX//163LanVhsXvgRdR0Tyc566AOW5jNQwEzJ788nnAvAnN5I1OuvNT0Sw4hk
 Oyl00MUSsdtc25EoxOnr7bCVhLoJDeYJzpXYzdEUE7x4Z5J15SM0LmF0BYYZf+a+6JUb
 DT0ZC0eRVAPGi0cr3Y950uHMSIXn6iem5x9HPPQ5PZe3XTx5aV8o+EeFEt1ts1Q9clQ4
 tkXOuZYGv8sE8q2WKZmVe358RS4Qud/XE55/LAIi38aHiDjI7Zl4GuWX+YMaX96pIZVt
 EqvbfZhyBKgb/CKeQB1n2bd0J6B/9ghMROk4vXa1GVabUiVuYfhCP/HXDKzak5emqs4R
 XQ2A==
X-Gm-Message-State: AOAM532X/aJte3C4HMojxiiMG1Cq014aYvFiY2OnEobu49mkTLRxWUib
 i+2VnA8s80tj47sYHU3UcvRDt8MAxm7EUxgcPvo=
X-Google-Smtp-Source: ABdhPJxz9YUq27598es1YhF6T5O+95wGFrkVO6obEtS3MnJuRp9PIA9hZgOWIYXzAalnrrOc/cFIJBlzV47JzYhjrgk=
X-Received: by 2002:a17:906:6a0a:: with SMTP id
 qw10mr11823300ejc.141.1637079225318; 
 Tue, 16 Nov 2021 08:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk>
 <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
In-Reply-To: <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Nov 2021 18:13:04 +0200
Message-ID: <CAHp75VcCL1eSMaZy_KXdfY=UyTy-hxz4XN5TGkXd6Cf8p+pRNw@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
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
X-CRM114-CacheID: sfid-20211116_081346_829269_E49F5926 
X-CRM114-Status: GOOD (  13.32  )
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

On Tue, Nov 16, 2021 at 6:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Nov 16, 2021 at 4:01 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> One general (minor) comment about the patches: please put your own
> 'Signed-off-by'
> into the last line of the patch description, below all the lines you
> took from other people, so
> instead of:
>
> | Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> | Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> | Acked-by: Rob Herring <robh@kernel.org>
>
> do this:
>
> | Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> | Acked-by: Rob Herring <robh@kernel.org>
> | Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

Why?
Submitting Patches tells about chronological order and last SoB to be
from the submitter.
These both are correct. Note the difference between 'last SoB' and
'SoB to be last [line]'.

Here is the excerpt:
"Notably, the last Signed-off-by: must always be that of the developer
submitting the patch."

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
