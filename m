Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F390DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 17:01:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C22D461AA2
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 17:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C22D461AA2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvFC/EHPXhwyavou8AbkJ4b5Lh9gudavxaDunuNYndk=; b=mZGxtSmKPyBGCJ
	wu2YObqG+cfV88liydtCpQSoXBddRKTaTJj+hH1W25pBXSGLChLrS36LlVp/BX9aIb1hCXR3eQYXO
	S2T+DgFfd0zyYSVGe2nDfxys1m3eQquJW5doQDLcnG3CS5rQRyGTJx3frrAlx+jmhTJxXc3ntPLjB
	7kRGSFoF2V9OFOqyFnOEgosCwetkRGJTRTZlqaEXvitVFFD7vQhod3yKN6SwqI5GvyZhMfKbg144K
	uNvrXAaPsGVV/cq3ALvpW6JjlW3lMHhira3pzFzfApCy+bgh2nftCi/5Yp8L7DPHRdGM9gTzkrgdz
	Twf4Q3yA85+nJmaYSbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn1pn-002QA7-9s; Tue, 16 Nov 2021 17:01:27 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn1pk-002Q9O-0U
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 17:01:25 +0000
Received: by mail-pj1-f52.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so3457310pjb.4
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 09:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2kB/IHHiXlPLoleXGBLCycFQAExYoaFFexggp5bSVo=;
 b=cF/LNeod1qvMmEfh1r5TEM9NrboALexlHkEqE7YwfuxxoU6GvI+sBVXRRI/ECpdaHI
 YsR3KtY5ciE+aq/bhnnoIX6WBO2VuTn5Arr2Ch1cwRQwuOXQFPxG145lFkgaJhA9Y0+Z
 giwyjyCyFSQ1v6goknM5RgwcbOlM4wMKpeUtLNF0f5jwWaLRBPLSiw1ZHQ5bFVJYr8Ku
 tQ2E1duDkIK7LE34CpsxqBJFWwvmsREQfkM2eYjJh7adsDsYfzovAMGwBQNkHWcNWIlb
 lvHNn/rcQaPeK+m7I2CTK452T8lPGqxGdsts8+PJlZ85KMDDWFMqMEEUItapOae8qfa3
 ZHeQ==
X-Gm-Message-State: AOAM5301C8SNb9mHgAzhSzwzn8JGJD9cUqDePajNIg/gtYNbwQDsvO0Q
 24Rs44aA+sG6J6it+4BWf3ch6+42JfNZRfUasR4=
X-Google-Smtp-Source: ABdhPJw0NtCCj4JMiGtWQRMS7H6HN1JmlLLVDM8Xio5FAaX/As3zCBQM5/nUUZvd9N918T/3wjE+WofsTrql8xuMV3M=
X-Received: by 2002:a17:90a:ab17:: with SMTP id
 m23mr599032pjq.194.1637082082818; 
 Tue, 16 Nov 2021 09:01:22 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk>
 <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
 <CAHp75VcCL1eSMaZy_KXdfY=UyTy-hxz4XN5TGkXd6Cf8p+pRNw@mail.gmail.com>
 <CAK8P3a2aGYTK1238TLe0uX1zT=cDrngKVhq=iSXLBKmyHoVnBw@mail.gmail.com>
In-Reply-To: <CAK8P3a2aGYTK1238TLe0uX1zT=cDrngKVhq=iSXLBKmyHoVnBw@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 16 Nov 2021 18:01:11 +0100
Message-ID: <CANBLGcz5MaEK+i4GwhJK2sJ9qXoW7GhvZXOKEj8_SB_ZnGgGTQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
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
X-CRM114-CacheID: sfid-20211116_090124_071541_A8B65EA5 
X-CRM114-Status: GOOD (  16.61  )
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

On Tue, 16 Nov 2021 at 17:44, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Nov 16, 2021 at 5:13 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Nov 16, 2021 at 6:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Nov 16, 2021 at 4:01 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > Why?
> > Submitting Patches tells about chronological order and last SoB to be
> > from the submitter.
> > These both are correct. Note the difference between 'last SoB' and
> > 'SoB to be last [line]'.
> >
> > Here is the excerpt:
> > "Notably, the last Signed-off-by: must always be that of the developer
> > submitting the patch."
>
> I think having the S-o-b in the final line is far more common, and it does
> help identify who added the other tags, i.e. the person signing off
> immediately below. I don't reject patches that do this the other way round,
> but it's something that felt unusual here.

Then I'll stick to what's most common. In any case patch 12 and 16 got
it wrong by both conventions.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
