Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FB8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 16:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3256C613A7
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 16:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3256C613A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Js+Z2YxtTd4+3z2upMQSqHndNONSkWo75Bd8g5yfGzQ=; b=CYHuhjY2385iQD
	aRkBxaWldfxx/cyUaH1mwt+od/GB8N1XKJL23aJ1U0nntgp7Y3ug0JCGkZE1+fPsWvFzeNfaSj/7d
	ibwJtRn0j3ZvvMFlbDjxaFvgsFbT9Os7VGLfgDhEkR5rpQjtgEu06DI5L1n5bIDS/Wl2WzjVOLpev
	2nvjmJq/KRaJXurBBtMaXszb1M2fsh64eNSU+bX+D5QglTBMXV9vNYKMbMpY1i48XrgVw/3fg+yZp
	7nWJfslLj6ORjF81T4Iz/xLBsipsHwiiIPIhZz+IcoyDoQRSEjaRs8qKDlUKlZ9DdFt6Emj8eWKq9
	3QFubPZ3fLrU3hLaZDxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn1Zw-002Ox1-I4; Tue, 16 Nov 2021 16:45:04 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn1Zt-002OwE-CE
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 16:45:02 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mrh9Y-1mJB1C0oOS-00nh0x for <linux-riscv@lists.infradead.org>; Tue, 16 Nov
 2021 17:44:58 +0100
Received: by mail-wr1-f46.google.com with SMTP id u1so38832611wru.13
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 08:44:57 -0800 (PST)
X-Gm-Message-State: AOAM5315MNZyt9OfeDFNI8g/zpgFqzTZXPRH1Ycxn116JF17LAt3pG+y
 fIuJ1s9thS/wRJpwhGwyhjfRCeZtJ7kFCJSm9jA=
X-Google-Smtp-Source: ABdhPJw2grIH+4dQ1gxr0lKUmKxg10LDamur/1rRU/k8eCH4kwjzR81J2UBp4rpjO0VtLkw61Vdo9nn7maLYQs6F238=
X-Received: by 2002:adf:efc6:: with SMTP id i6mr11299316wrp.428.1637081097413; 
 Tue, 16 Nov 2021 08:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk>
 <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
 <CAHp75VcCL1eSMaZy_KXdfY=UyTy-hxz4XN5TGkXd6Cf8p+pRNw@mail.gmail.com>
In-Reply-To: <CAHp75VcCL1eSMaZy_KXdfY=UyTy-hxz4XN5TGkXd6Cf8p+pRNw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 16 Nov 2021 17:44:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2aGYTK1238TLe0uX1zT=cDrngKVhq=iSXLBKmyHoVnBw@mail.gmail.com>
Message-ID: <CAK8P3a2aGYTK1238TLe0uX1zT=cDrngKVhq=iSXLBKmyHoVnBw@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Emil Renner Berthing <kernel@esmil.dk>, 
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
X-Provags-ID: V03:K1:yaB0uorPbEZKirzE4FcwOQUki2gKDFYmdgv0pdELOIBnhHWPLMi
 fo9OCzDuFXXPSlVCaHt8fb7ZCvCuCPRFNaaDYS8GCOPB9u41IQqFKSAky3SSBdQOOSZbRVX
 OAxKla48RxCvFy34t23zhimarF9HPrT3Gx/HijB17XsbpyADv9gDkhnQL7NfYcdprshw4we
 ZZs9qZdlEite04ps7fWcw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rDLrkldyW9Q=:7xnufqaA9y5hCAR6N0FQfX
 YMGDSa7g3ZXzWVfYSRSDGrujNpcn8C96IGk0zd1DqCcu7/lK4dO3siXKQ+7G2Uyy1tURlrQnQ
 jbfH644cbChLK5I4HKZP7/+/nnXERj7EhltedxOBnRmbDk7ds5elU8Z8Ia//Ki7xw1hNPF/zU
 R6Tr5BH7++UYPB/ITXRd87eFNxrbAO8YjMB8nixw/TS+bE5SaYXnAFD5eaUSdGJ0JdFM3qq5E
 MjYkM4YIcUuFdRjWNuwc1HrnGbN9mKuPVSljVcRM198zyOZDa9IYMoEqnXu35OOgFi0LhnZps
 7bhEmV/SfvWJqmYnrD8LW/Q+rkkiTBdT7K65lhgyoSrPGHhRDfTOcsLiFkvBbw4D2Jign0pX0
 emv4GR+vb8DXUdB5GeWyGlFJ+RFbemJXd2dA/jce2Hleci8XproG5a59lei5unI5zoqr4CIkp
 ncj4o5PQaVo1tlxfzB3SLtUBEy/VUilnetJJW8l3gQShJhPcvXrf5khK9DYIhvc3Hd52o0DIk
 XN/M/2oNGOzxB1DSt2lujXAcKmf2Becwk/QdJx0RL6DdNiJKzCtImpc/f8gWbRMkMPA+6gFR+
 MG3IcmKFWxYFZYsb9ahn5ne2jHtGYuDObSmHiid2656LdURGvaSE59zpsKfTfpyyGFgiNXJVN
 ORYPTG8wIZPVRf4IE8IVKQBuhfsM7t2VozsJvGo/H7GHOquSmULvFpY9XTsgZsBm/gskLF5zy
 ANK5xWG4Ra+EGiQayc4t4nQI6wb3UrRX9YWkU4GWQhrXGp+3STbDfwE0JxOfi6MOP4J2Tmn5Y
 60s04lrIIWkrTeZbxVEt/rc3MqtSPdTdckV1aJmHUhacxUL3dE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_084501_741252_9E73A4AD 
X-CRM114-Status: GOOD (  14.61  )
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

On Tue, Nov 16, 2021 at 5:13 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 16, 2021 at 6:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, Nov 16, 2021 at 4:01 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Why?
> Submitting Patches tells about chronological order and last SoB to be
> from the submitter.
> These both are correct. Note the difference between 'last SoB' and
> 'SoB to be last [line]'.
>
> Here is the excerpt:
> "Notably, the last Signed-off-by: must always be that of the developer
> submitting the patch."

I think having the S-o-b in the final line is far more common, and it does
help identify who added the other tags, i.e. the person signing off
immediately below. I don't reject patches that do this the other way round,
but it's something that felt unusual here.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
