Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438F0C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 16:08:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1104613DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 16:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1104613DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZyFn+f9Hvn5qxme9cmMXOxzrYWF9QKITn6/1Q6vKeM=; b=zTqLMFWO9E4nQh
	i9pf05cB4rT1aw3VrJe8pwRbFf+TH7go/z7VX0UD5ONjPW4CEuss0utIJA1J84k+JXFdLV10li/Px
	Ew/UiV9DXFi+zygDIJ6wRD1fwIS29pGlCw7vUsuhnNeEqPuyRqCpI5Y1TGMkeN9H1wYYM1n1alQSn
	KLJrBle3O/kbMneA5oScsxWHq2vNVyXzLMZBxG6j/pV40S08qlIHUom8fOdrK8lYv2EI+k1FWhgat
	gLIGLDmIm6w2Mz1V/baHOT0pKqAjsdxHz308mwZmzA6kw8XkkHaO8aW/Y5nOfoWscZTS6BIPscWM7
	V6t3dj0qiQ9dHZEwZ51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn10N-002HOs-Ay; Tue, 16 Nov 2021 16:08:19 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn10J-002HND-W4
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 16:08:17 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N0FE1-1mR3qG1g99-00xODd for <linux-riscv@lists.infradead.org>; Tue, 16
 Nov 2021 17:08:11 +0100
Received: by mail-wr1-f49.google.com with SMTP id d5so38622809wrc.1
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 08:08:11 -0800 (PST)
X-Gm-Message-State: AOAM533juNPE2CyIoL/KFLK6XLuT97t+IPOQqpHoEa1/ljyOlDE6Q3qK
 70YmIeEFYpV6Mpy4wjfVAYsTDyxBXfkzCU+8MkM=
X-Google-Smtp-Source: ABdhPJzhVa1Gld1OIgwekMITNW9WNUSf74CcnJN4vc2E+/epq+jCDHswwl2sO6HxKGWhIEJta2sjg10rMxFMi1drm9g=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr10808562wrd.369.1637078890957; 
 Tue, 16 Nov 2021 08:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk>
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 16 Nov 2021 17:07:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
Message-ID: <CAK8P3a38+Osmr7SjD42ZEQzOPwWXM7x+31a5E4bRWVp6JdMS_w@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
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
 Matteo Croce <mcroce@microsoft.com>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:XECHXXtIYJPxm0donoYlftsp1/g8saozH6GDaCwqIEZGfJ2IO0u
 udFDjZsxIRKEjfv/2RT/3NuzJIRCGW8sqFhUxEZuwIb9XxOnMToOhaneP2WUSuaPkFKBFN/
 NPQ+RLqd1KJW7RGDu5ESlhr5CSFVxU/Wm8P8nq8qQ65/q/nILVyCGbV8W3+LDnSNfTDioxV
 2ka+mxdgDWiXAFTAaLQJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A7mSSMRx154=:MUkDLt3Mtun13MKKr4pzHp
 56/CWYIuqq7KJK2JJVZeLL70xhGaWbyQ1xu6Bav6+Vq8Z7DYHd3MCvK8RzIPats8ns+gsZMjd
 EviLhp94QcS1mGsS36AZCSFZLAgZr4CRfTq7IoJ05wx0jn+7Fjluz8DgNnqPl81G50fanh7+6
 2wmejonhqlaDuOn0JAgHIhSkyXkkyCy+8gBKg/Px71Ix/pkKfy+dqyjhOWVQhO4uShro07qVl
 lhrfjRlZTqWfeBJ+iO2qFqfZ3eGDQPM34d1n4viLBnf5AFDQGQIT07TSpAJh62zZJf1A+Lpb9
 +adq52yQgWFzYqwDRTlyPbVryx4wdMqQaKwP9q70Z/nHzt81e9kym746bLqwkMLbj7XAgJ0YD
 OIj9P89YI/lGk7BxWgie7QXqz9Gsh2E+h2ymxKyGc7TOpjajqTDSEANu0bnnaNzTo1iOjMHGE
 tvT/nRGeK4NrKKejLal/Zm8uskk//QAMDmPttJfo5+f0bk6YB1XKG2i3FlIMl5vy0XbG9jWjl
 JilDL/y4cbjWpYI0m9HRLnBWQcjX6M31915uJQ5RRvQDSLWjGcuiI2lWlASEJSbYxsfpHwjJN
 /e/0Cg4UkjPMNrVBSeAOJLHFNg0sR1Ud5IYhQtDq248L3ivFyKidK5bIBVaRmXgYQaYhxj+qm
 f9UeHHPLIcRytTsr2EP2f8NbPG53dhaFiKEpzdBAI+23NkW4aJdyzVGFx6AiqjsNu6p4sdGPE
 nd14XrGs7X8O7SG0NLQYOmmBfaCuYs3/ze00cwQ6BBcpRIqLlKJOQKFcra+wpT246DGXp1jxr
 NCAfT49djOoFRQNAeRVv01qpxAgYGAcMin58O1HNMIzgXtu+28=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_080816_374056_B3045DD1 
X-CRM114-Status: GOOD (  27.41  )
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

On Tue, Nov 16, 2021 at 4:01 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> This series adds support for the StarFive JH7100 RISC-V SoC. The SoC has
> many devices that need non-coherent dma operations to work which isn't
> upstream yet[1], so this just adds basic support to boot up, get a
> serial console, blink an LED and reboot itself. Unlike the Allwinner D1
> this chip doesn't use any extra pagetable bits, but instead the DDR RAM
> appears twice in the memory map, with and without the cache.
>
> The JH7100 is a test chip for the upcoming JH7110 and about 300 BeagleV
> Starlight Beta boards were sent out with them as part of a now cancelled
> BeagleBoard.org project. However StarFive has produced more of the
> JH7100s and more boards will be available[2] to buy. I've seen pictures
> of the new boards now, so hopefully before the end of the year.
>
> This series is also available at
> https://github.com/esmil/linux/commits/starlight-minimal
> ..but a more complete kernel including drivers for non-coherent
> peripherals based on this series can be found at
> https://github.com/starfive-tech/linux/tree/visionfive
>
> [1]: https://lore.kernel.org/linux-riscv/20210723214031.3251801-2-atish.patra@wdc.com/
> [2]: https://www.linkedin.com/pulse/starfive-release-open-source-single-board-platform-q3-2021-starfive/

Thanks for adding me to Cc, I've had a look at the series and didn't
see anything
wrong with it, and I'm happy to merge it through the SoC tree for the
initial support
in 5.17, provided you get an Ack from the arch/riscv maintainers for it.

One general (minor) comment about the patches: please put your own
'Signed-off-by'
into the last line of the patch description, below all the lines you
took from other people, so
instead of:

| Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
| Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
| Acked-by: Rob Herring <robh@kernel.org>

do this:

| Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
| Acked-by: Rob Herring <robh@kernel.org>
| Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

Regarding the coherency issue, it's a bit sad to see yet another hacky
workaround
in the hardware, but as you say this is unrelated to the driver
series. I'd actually
argue that this one isn't that different from the other hack you
describe, except
this steals the pagetable bits from the address instead of the reserved flags...

          Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
