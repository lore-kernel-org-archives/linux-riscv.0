Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B53C19F2D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4borb/sYYzW4r+S72kPu9Lgkvau82xfpSmtGWoq+Zs=; b=xk7DsT5SAZ5H1M
	9cYQqaUifWNXbprcu99Q0L0FI2upd73zEL6PGikvrLy4+IxLOaTO0MNQk0dFfZmKbOhc0AgMuY/0H
	RrQv31xrKR6pB+clNJNT6SKyz5BK9hNFM0tA/XSJvM53WsU+Q8HR5YOKM1+xrmw/aiufaxFyYROwH
	+VOg4/DtMB+jV4mHqUi3ct6VuvvjPH/OSJtCrBnso53fYJarv+Uf8vzyiDt9U3s7MID3KgYg+k4pp
	UhxYw8is7n+TfSmCNwcychvmF9mEFf6cfUK0JwZY9CtfkLi+6Rt1eY6n8L93VOrYTXvoPxUFO77+B
	Tanjvekl8YQYUmkUg6SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM2gD-009CCI-Pz; Thu, 11 Aug 2022 07:32:33 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM2gB-009BNR-0s
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 07:32:32 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-31f661b3f89so164568497b3.11
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 00:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=6u3hj+Y//vHpQbWemLUBU1B8OjMJneU5QhJwoYuwFe4=;
        b=iAGICYiTai5WT5ADZ4g/9P8h9qzyXwh/Kivi5/pDrj+yO5M8JbFTZFn/S5TDKTEzAC
         EZPffeybriTAjUbIe/ch30xzcmjPrfW0VPQGSXc4876uF94MYQNFNXsFOsbMBHCzLwQm
         Xn3KV2S3w1eqrk+/V2cxPDfSKg3k2mooVwV8sl87bwKqmC5us5e+9YVPuZAvRQkSiPmP
         izKGxlTbTQUM5c/w+JoBQ6IMZcM1jiuQLCdALal3saSNLL/vUUzO2PuTOQjKKkjbfeP1
         BGF3U5qEYnOEAJDYgxhSQxu6tByZ/H6dbraRX6kikmtlh4UiHlQlT+7McAs/HXBuUaRS
         +03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6u3hj+Y//vHpQbWemLUBU1B8OjMJneU5QhJwoYuwFe4=;
        b=kJlO0YBm6e47Okj5SQsVsopQwT02m3EktVaaY4GExipaurhxJu8jhiOBQQUpagd8yp
         UlhOTpun25ksrNxXX2AoFN9jcJ9oov/qgMIkr7fj7kyevq1MNf5dscTQm5Vqbaq6xcKP
         h8iaqwVs3kCGNCGxpSE8bfNEN3alQ2ODt417tOgPB8ZaAJFdFb7vZtUV0hXEjd7QLqyw
         4wkwM5Twu6mvR6OJ3FA6CXCVDRuTz2IJtOLeUPSVxumu12nSxVh6/MJXDb9f570xva63
         qCS2TPP+8yp2QOHg1JYayF34fo+4rnfkaVbo1MGXXFd5+9/lkX/GJD9YRNemKDpHGSae
         tBUg==
X-Gm-Message-State: ACgBeo1zBa5KOdPVexPIhdwIaEf3QHIfcolymyl9kRaBh9Jd28LE9xQz
	VpYvRiwgvW3RC3ydnBwuFG6CF0F5MBTr4dS8nYQ6IAfspCs=
X-Google-Smtp-Source: AA6agR5TGJLwSsVW06H2UxMeXJYwBpsk1ZgGTLbVxkvQWThby/NO+cLwCc/kVjK14zW+I3WZaeWWW1LqnkiCjwGjFr0=
X-Received: by 2002:a81:8345:0:b0:323:9a15:7fd6 with SMTP id
 t66-20020a818345000000b003239a157fd6mr28544907ywf.104.1660203149471; Thu, 11
 Aug 2022 00:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220811070506.12252-1-lukas.bulwahn@gmail.com> <47742925-2d0d-7313-f811-aa17e35ce81a@microchip.com>
In-Reply-To: <47742925-2d0d-7313-f811-aa17e35ce81a@microchip.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 11 Aug 2022 09:32:18 +0200
Message-ID: <CAKXUXMzaR_503UMXmoRe4CvUuek50VJb+33R6xYf3Op4tw78ZQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry for RISC-V/MICROCHIP POLARFIRE
 SOC SUPPORT
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Daire.McNamara@microchip.com, linux-riscv@lists.infradead.org, 
	Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	kernel-janitors <kernel-janitors@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_003231_112928_ABD6750C 
X-CRM114-Status: GOOD (  24.84  )
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

On Thu, Aug 11, 2022 at 9:14 AM <Conor.Dooley@microchip.com> wrote:
>
> On 11/08/2022 08:05, Lukas Bulwahn wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Commit 3cbd67384677 ("MAINTAINERS: add the Polarfire SoC's i2c driver")
> > adds the file entry for drivers/i2c/busses/i2c-microchip-core.c, but the
> > file is actually named drivers/i2c/busses/i2c-microchip-corei2c.c.
> >
> > Repair this file reference in RISC-V/MICROCHIP POLARFIRE SOC SUPPORT.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > Conor, please ack.
>
> FFS... Silly mistake from me there, keep getting caught out by
> the maintainers entries when I do an inter-version rename.
> Is there something I can add to my build scripts, other than the
> get_maintainer selftest to catch these?
> Thanks Lukas.
>

I am not aware of another script. Why do you see the need for another one?

I acknowledge that ./scripts/get_maintainer.pl --self-test=patterns
does take a few seconds (roughly 30 or so) and it checks the whole
MAINTAINERS file. Is that just not performant enough?

I usually have a set of patches in a local branch (all those patches
were sent out, but are pending somewhere) to get to zero warnings from
this script. In the last few years, I did get to some points in time
that ./scripts/get_maintainer.pl --self-test=patterns reported zero
warnings on linux-next, but then new issues were introduced and the
hunt continued. When we are back at that point of zero warnings, I
will ask the intel 0-day testing team to include the '
./scripts/get_maintainer.pl --self-test=patterns' check into their
patch testing efforts, and hopefully that reduces the chance of
picking a patch with such an issue and we can keep it almost always at
zero warnings (wishful thinking on my side).

Lukas

> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> >
> > Arnd, please pick this minor non-urgent clean-up patch.
> >
> >   MAINTAINERS | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9203efedea1e..797fde7e1821 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17544,7 +17544,7 @@ F:      Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
> >   F:     arch/riscv/boot/dts/microchip/
> >   F:     drivers/char/hw_random/mpfs-rng.c
> >   F:     drivers/clk/microchip/clk-mpfs.c
> > -F:     drivers/i2c/busses/i2c-microchip-core.c
> > +F:     drivers/i2c/busses/i2c-microchip-corei2c.c
> >   F:     drivers/mailbox/mailbox-mpfs.c
> >   F:     drivers/pci/controller/pcie-microchip-host.c
> >   F:     drivers/rtc/rtc-mpfs.c
> > --
> > 2.17.1
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
