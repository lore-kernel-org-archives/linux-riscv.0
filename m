Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E84C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTJWzzVpqpLIWEJ3kKgxphUv+7Yci7fz9dh4lpwlNw0=; b=ZDDeNIGb222WHn
	sNqe/ayV1/nOkMPfymPzXpSU6gE4dG6nMLf/qsCLkqLXqRw06MkdkT8gt32M8qsRilxL3kB9j5UBt
	R7WkgYetkpiwLCS0mRq7DBZ+XPW8fI1XajNx19URuzWVWjObkVNqL6pHmk9O3L6DtZtaEK1sFlRWC
	7mrpDvzs0RroP7ox1zu1Vtm0cWq/BHD6e4bpx7aXrAVd6MDTF/CAtllVmOpz3UjUUxzBCrPm7vfRL
	PsIhgLGuuqjFQtyMRKAx89AJggDIgHzZmwcPdjPdK+l0RvgUqEkdyzSMhguLi6zP3nW2nhDURLise
	aVJ9lDScEU0rWp4QW1hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD4uS-007INP-90; Sun, 17 Jul 2022 14:06:12 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD4uQ-007IKq-Cu
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 14:06:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id w7so6954852ply.12
        for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RdbURAzaMtVKAm64U+lquu3tOi67fTVfwC/Ylbpg1cc=;
        b=ICV9hw4EtODKZGQv3rQMabyMNI88qatQoPnBFoz3hXBRGPb5h+t6FJmb83wHfYCx/F
         SQyaaArLuXR8ClHqfk0nFBTF+ThgI1G2PqM097KhhdvNTAAbmfGmE9XCsK9wFPPNYBfU
         O94dGiu9pW7XWSKWKHiTGiFByaJL9BxImdtcSSzwRVweasBXif+yw1rMpf9SAtcY6POC
         /Ow44OdOJzFZMsacPGE3T53UlutIXEF7a/NM36SEurCvz3ZGx7Abi9m0HV9gs+e32hEa
         bvMS7sLFSb9Y7XaCbzzFLMhTQyVGjimMmJh9qWILeFM29lF/d7mXfayd8H41HtfZlE/+
         gS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RdbURAzaMtVKAm64U+lquu3tOi67fTVfwC/Ylbpg1cc=;
        b=DCrlUQxDIWuthJHewu8KtHQx1kPeeFLqyZb8OHr7PnIK3Sznp57m8G9O6RF2rbbyHS
         wj51kVOIBgtTybZ1QbthY9xEoZM/NbL8zbR4yXGIGqbZXT+98nPMuuNuz+GOx517/pUn
         P6VpnA20ykDwthexQ83ufaE9NGhzznz6xGsTzMTBmHgWLn9bweh10XfyvlxHFblSMhoo
         z1nGz/snJ9AUwEcHzLGrihHAoUEyLNRJQzhoPIU8tU67uLR+ZqLRg1mCcUYWmNX9XTuL
         1V3M+ptjyI+xt6YjFar4GR405uRvkcyreA9ijmFfpaGVPVeI3QtOk+cnruUp3sr0lPBr
         eBgA==
X-Gm-Message-State: AJIora+d/xBo9qQe6uJjOUHqDq6KGxhX2XkW2oS1ZFAQVJM/5OEyJHHm
	OiFCc++2eJP6Q7AXe9cUOIiGPurpaAThUPG9OR0=
X-Google-Smtp-Source: AGRyM1t17yxrUlssmp+E4vMnncQfhmMUXO1Ek8ekp/27kHZbCuwzkR1qoKrvES0/x9uWPZoyBZKwMIYDojiwt5K/U2s=
X-Received: by 2002:a17:90a:bc04:b0:1f0:506d:78b9 with SMTP id
 w4-20020a17090abc0400b001f0506d78b9mr27489758pjr.4.1658066762846; Sun, 17 Jul
 2022 07:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
 <20220705210143.315151-5-emil.renner.berthing@canonical.com> <20220717105754.GE14285@duo.ucw.cz>
In-Reply-To: <20220717105754.GE14285@duo.ucw.cz>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Sun, 17 Jul 2022 16:05:51 +0200
Message-ID: <CANBLGcw=jM4r5+UY5RZsf9zHdG7ga83hN2DnCvCcpdQGnWaY8g@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] riscv: dts: sifive unmatched: Add PWM controlled LEDs
To: Pavel Machek <pavel@ucw.cz>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Vincent Pelletier <plr.vincent@gmail.com>, 
	Bin Meng <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Ron Economos <w6rz@comcast.net>, Qiu Wenbo <qiuwenbo@kylinos.com.cn>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Stephen L Arnold <nerdboy@gentoo.org>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Mark Kettenis <kettenis@openbsd.org>, 
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, David Abdurachmanov <davidlt@rivosinc.com>, 
	linux-leds@vger.kernel.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_070610_459878_B0C30AA7 
X-CRM114-Status: GOOD (  12.74  )
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

On Sun, 17 Jul 2022 at 12:59, Pavel Machek <pavel@ucw.cz> wrote:
> On Tue 2022-07-05 23:01:43, Emil Renner Berthing wrote:
> > This adds the two PWM controlled LEDs to the HiFive Unmatched device
> > tree. D12 is just a regular green diode, but D2 is an RGB diode with 3
> > PWM inputs controlling the three different colours.
> >
> > Signed-off-by: Emil Renner Berthing
> <emil.renner.berthing@canonical.com>
>
> Acked-by: Pavel Machek <pavel@ucw.cz>
>
> (This is dts change, I'd rather not take it through the LED tree).

Makes sense. Palmer, will you consider this?

/Emil
> Best regards,
>                                                         Pavel
>
> --
> People of Russia, stop Putin before his war on Ukraine escalates.
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
