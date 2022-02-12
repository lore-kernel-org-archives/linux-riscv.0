Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68090C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Feb 2022 12:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9yyF+c3URvSnpu2HwNrYpodMB9QRbSArEzLF6LHric=; b=RWNBc3M+OvG1qm
	eM7VUdBwCT573XTkCYYYPFzESB+Pxe/b1BuRcqBNkde28gmd+pB7ctx1Uf1DNLA35SBJG2+Q+tyds
	ECOkfGK95G1mL6DvBuTQeMMSGUEAMSx0WsRvkFoAoQ59OVuo1wcsc/vEFJc0we2KYWejyZdBVgRpp
	H6ggSwi5V+A+Ur24mNRd3aDN3ZWAQ82X25ha0SY6JH8cJjoTENXC/p1H3+t5ikX5wlgCxvqb2SXQY
	rYDIwZ6uErGwFZTSFXQZjWTN1hIrpC9EXANwTJ23Dw7YFHmawMjUD+AcxL5/dnEPE14MuVWl1mx9c
	U1ZeEPvZCcXt+rAZ7zwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIrr6-009s1Q-1v; Sat, 12 Feb 2022 12:50:24 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIrqh-009rw4-Jx
 for linux-riscv@lists.infradead.org; Sat, 12 Feb 2022 12:50:02 +0000
Received: by mail-lf1-x131.google.com with SMTP id u6so21591443lfc.3
 for <linux-riscv@lists.infradead.org>; Sat, 12 Feb 2022 04:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=idWS+dy/9zcAHhOmUKByw810+cre1HyYia7KtD9MJdE=;
 b=J7ZSlDBaOxGSKMrZf0Pc7V6AlASUvZJmt3m2fxlRMAaWwjlrr1h2gdgmKl4Rnx2dSm
 IfmWMj9Dc858vbexwMx0tLWVbdzgodTOTiYxhpCOpvTsTaO8XL1MpX8pToBRfgox5nB7
 6aqOSyrSo4nycHtj99MRQ1Uxnd2BXMW3SVTStB35tLc5KQa2DnL3DxqE29h26CFk1bQO
 Jn8MOivWUIokAnvury7OjQMa+1RaxZk3uSX1NpJ3+ib031eOMJVAFDhXh1Ifssb6azz/
 X0Z2Nucf3B2ww7UsNN2kc2wp8nG2AXJ8paGqnnBPuAOUrpi2avcR+xBe651OFQlzOI2w
 cgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=idWS+dy/9zcAHhOmUKByw810+cre1HyYia7KtD9MJdE=;
 b=2le7yZX5frAJLI2jxNxK5OrlneKBRNS5BiP+Ie7MCQ3lDwocfuY5NpqKPFSekPWSF0
 RK/K+HzF1SkleeROKMDcFy/UI3NsiD1YkpLqqcr2OlXx10HMJTlRV/rHLk9Fh+S9/iPG
 P15joLJcSufzz2YMbdnqbZ8O/MxwshSd9lBYtF+Zt/51E4o+iOxOL5Lxs06ewF1z9ffi
 mYwZ5TnE3QmMpLKecEWTgKgRJS4DVJN1gtAzjBuehdMkt4jdH/u8DKtc0+mgUuN0EKIQ
 jVZqPuupr8pYXaPOCLwsb+cv74bUZJy8FfXsl8xvLY/sjL+tzbWPDYIylvtmC7jE0aAn
 cZtw==
X-Gm-Message-State: AOAM531oUkTTTjnXQr+8aAvOtt6a3VhyhtQhKfydeOtnmoK/dzu0Wala
 /aeK0b2xr+ZAzaFKRPGA2a+XuogQnoodp1mg2a5yRQ==
X-Google-Smtp-Source: ABdhPJzeHH07yDCVZVPUyyeoJRx73u7xqaZhnqbnL0ultgwjz50bXvR8YJh2OO11LoYsIZl66imqJHcVEOKUk0SGq3M=
X-Received: by 2002:a05:6512:33c8:: with SMTP id
 d8mr4325765lfg.41.1644670197034; 
 Sat, 12 Feb 2022 04:49:57 -0800 (PST)
MIME-Version: 1.0
References: <20220210054947.170134-1-apatel@ventanamicro.com>
 <20220210054947.170134-2-apatel@ventanamicro.com>
 <20220212114355.GF20866@duo.ucw.cz>
In-Reply-To: <20220212114355.GF20866@duo.ucw.cz>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 12 Feb 2022 18:19:46 +0530
Message-ID: <CAK9=C2VzzT=GDyuptuxQj0y++Rb0SaZXCuoL1+ncpGWcYHqr1g@mail.gmail.com>
Subject: Re: [PATCH v11 1/8] RISC-V: Enable CPU_IDLE drivers
To: Pavel Machek <pavel@ucw.cz>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Rob Herring <robh+dt@kernel.org>, Sandeep Tripathy <milun.tripathy@gmail.com>, 
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>, 
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 kvm-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_044959_708770_DF4B283B 
X-CRM114-Status: GOOD (  10.57  )
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

On Sat, Feb 12, 2022 at 5:13 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > We force select CPU_PM and provide asm/cpuidle.h so that we can
> > use CPU IDLE drivers for Linux RISC-V kernel.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Anup Patel <apatel@vetanamicro.com>
>
> This is quite... interesting. Normally we have one signoff per
> person...

I was working for Western Digital (WDC) when I first submitted this
series and recently I joined Ventana Micro Systems.

Regards,
Anup

>
> Best regards,
>                                                         Pavel
> --
> http://www.livejournal.com/~pavelmachek

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
