Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E60C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 03:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfTes9kQIwmB2sVf0tVgHzpkHcBmXe12R9Dtfidagz0=; b=DYVA8FUZAfodFo
	T+v4lGJT6DGSKYHS6fReLgjtcZF/BPssQ6Rc/XKAksVTNxfXqSnKchYlALti+eXf1kQUCRGkdhVUj
	69zfllupVz7t3UokSH3aCnZLRFzfWBHs0mqROsnLbm5b+S6B4pwgeWngcP0Qyrs0gqGwXhDvtYJzx
	4NfKi4I/06a42LgC9OA/2hr5JAcjCo2gyPmiOSkMZiOjUa+I15cuUpbaXMgcJIPo3V/9mjdB1DnCg
	a4RDbhyw1TMe/wuyfaV4cqlh72I9xfWK5ZQoRWzjU3IsU6IXBELAT/RHlVMHUN5xD4jrBjfVO8uQE
	iyzOMb3rz93CH1jh6etg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh0Ne-00BcTR-RO; Sat, 08 Oct 2022 03:20:02 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh0NY-00BcQH-2m
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 03:20:01 +0000
X-QQ-mid: bizesmtp81t1665199102tpuhbm7o
Received: from [192.168.0.179] ( [113.85.219.225])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 08 Oct 2022 11:18:20 +0800 (CST)
X-QQ-SSF: 0100000000000060B000000A0000000
X-QQ-FEAT: Xz3VOcA7Mr3FZ3OhgK4//97wG8mXezqudifr+ShDF71jo6ZVNegJFLWSbQFjs
	41Jkwc4FOs1oe/FY1u2vbwzyJsrWi07okA/K9Kw8EcCWxzXCDMZjCtIecmdYWkahSCFZmq2
	FlZUaOWjGBheO9+8V1nF8nJLhkK0tq1vOo2Y865x5+gXgoM+figV3SUenuKBQBYi2ppIYYt
	zbUI+FFvvQwk1WTagPRUVB8dtcleD3gu0azJcoLMfx49m0J8R5r3y4EK17gIkJR0yc1c+UG
	0ia8wSy9vJGL0dNANOgjtjEu6Or+njZqd8XIbyahDoFBISbvIxLs9uVPIdQnfhor+THm8xL
	NaZwtBbKzX7gkQpcg1bdYyZpa4QAljGfhbt9pfnHJUJbPI+HtcKLhzm2vIcyg==
X-QQ-GoodBg: 0
Message-ID: <98CA462042A5283C+38a7a131-b02a-e4a2-180d-1e64cb788af3@linux.starfivetech.com>
Date: Sat, 8 Oct 2022 11:18:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 00/30] Basic StarFive JH7110 RISC-V SoC support
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <CAJM55Z8zg=-meSGhFnVh4Tb4=5M3sHis1oapzXCEipyDkuyvyg@mail.gmail.com>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <CAJM55Z8zg=-meSGhFnVh4Tb4=5M3sHis1oapzXCEipyDkuyvyg@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_201956_633465_05ACF474 
X-CRM114-Status: GOOD (  17.23  )
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

On Wed, 5 Oct 2022 15:05:45 +0200, Emil Renner Berthing wrote:
> On Thu, 29 Sept 2022 at 16:34, Hal Feng <hal.feng@linux.starfivetech.com> wrote:
> > This series adds basic support for the StarFive JH7110 RISC-V SoC to
> > boot up and get a serial console. This series includes basic clock,
> > reset, pinctrl and uart drivers, which are necessary for booting.
> > It's should be noted that the reset and clock driver codes of JH7110
> > are partly common with those of JH7100, so the common codes are
> > factored out and can be reused by drivers of JH7110 and other more
> > SoCs from StarFive.
> >
> > The JH7110 is the upgraded version of JH7100 and also the first official
> > released version of JH71XX series SoCs from StarFive Technology Ltd.
> > The VisionFive 2 boards equipped with JH7110 SoCs are launched
> > recently [1]. More information and support can visit RVspace wiki [2].
> >
> > This series is also available at
> > https://github.com/hal-feng/linux/commits/visionfive2-minimal
> >
> > [1] https://www.cnx-software.com/2022/08/23/starfive-visionfive-2-quad-core-risc-v-sbc-linux/
> > [2] https://wiki.rvspace.org/
> 
> Hi Hal,
> 
> Firstly thanks for working on this! And sorry about the late reply. On
> the next version could you please cc
> emil.renner.berthing@canonical.com since it seems to handle the
> mailing list a bit better.

OK, I will cc to your new email instead on v2.

Best Regards,
Hal

> I see you've changed the clock/reset and pinctrl quite a bit, so I'll
> comment on that separatel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
