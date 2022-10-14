Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817F9C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 02:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmNWA7sUBVsZtP5XcmeptU+WgN8xaOJmr+h7l6dXYZA=; b=lkkjI5rim/N/+T
	R8NkWCNNh1qKPVyDM/ujlOg+FYBsP7TZzvFuDwmjoPdzlP71s25cYh+OeSB8Ay6i7vyuNBdEwpu3q
	7S3001946lHHK4d6EPR7ONJ8iEBWsu/BKwY83LXKrQR43zTM4TGL1djH3s1Ozw9aa5dmA40dXR1iv
	zuV1q0Hgegvu0cZxWkqMqP1sX4WD3umiJf/eJ0ZgEqdc29QbwOCPa5X5WyDLAwnB8P93RXLSRZhXz
	7Lbdeisdc/YwQOCxcRkC6yp+dJWY++767W7fiVDdNkg9/m3gQZfLHzvxyHjVFaqcjbqUa6/LUWX/d
	xwddwNSOmvOH1k0LnBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojA5R-00DMal-LH; Fri, 14 Oct 2022 02:06:09 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojA5O-00DMYf-RU
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 02:06:09 +0000
X-QQ-mid: bizesmtp66t1665713125t0dqa2lu
Received: from [192.168.50.235] ( [113.72.147.11])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Oct 2022 10:05:24 +0800 (CST)
X-QQ-SSF: 01000000000000B09000000A0000000
X-QQ-FEAT: 2w1wQVt6itRSuTllDZ9c9Ncos8L/9I0A7xLMcJaSF7QfOTy00g1XU9/te0E+F
	u9+R5cNiUMb+3Gxnu/jD8XTWeJNgCEPTWzy+rsT//Kh6LYfRsZwdtcxaTcoD0ON+maBm+K2
	oJV5WixWyamuOzzL1Vttws3ETFJ0i1LVuW3fv/J5BSJAOiKspFGGzhTskEWVCCMih9SPqjJ
	Cg041J/HHc+Rb/6NmNobZiZLHwUctb/P4TEtSPN9we9Lz02rplMZB0uAxa6KfvdRad9xXK+
	MZS/lyqLVCJxm9r6rhz06SHHwEN1wiNcU/0ln0vPr68YN+a9RZWaojCNkpj7E53WYUxMoqn
	+EYoj3o1P4udrqrgjLeIDscuE7OORTnuaeIUPaeSLH+g2nn4/k=
X-QQ-GoodBg: 0
Message-ID: <9A0A65FD121C76C0+be2a3620-d30f-b6ac-3241-89b40191030b@linux.starfivetech.com>
Date: Fri, 14 Oct 2022 10:05:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 26/30] pinctrl: starfive: Add StarFive JH7110 driver
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930074341.6386-1-hal.feng@linux.starfivetech.com>
 <CACRpkdYMQ98Q1iXr7-YdUkQrSK8aauZuSFeDp2f7ubNH_W7_HQ@mail.gmail.com>
 <CAJM55Z91TL4eLOjZsRVZuxspcL40gG2MQRZf31h0L2yyaW--Cg@mail.gmail.com>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <CAJM55Z91TL4eLOjZsRVZuxspcL40gG2MQRZf31h0L2yyaW--Cg@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_190607_242227_110D6C48 
X-CRM114-Status: GOOD (  15.75  )
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

On Wed, 5 Oct 2022 15:31:59 +0200, Emil Renner Berthing wrote:
> On Tue, 4 Oct 2022 at 10:57, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Fri, Sep 30, 2022 at 9:45 AM Hal Feng
> > <hal.feng@linux.starfivetech.com> wrote:
> >
> > > From: Jianlong Huang <jianlong.huang@starfivetech.com>
> > >
> > > Add pinctrl driver for StarFive JH7110 SoC.
> > >
> > > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> >
> > Since Emil submitted the first driver I would really appreciate his review
> > on this version.
> 
> I tried really hard to come up with a good way to share code between
> the JH7100 and JH7110 drivers, but so many details different on the
> JH7110 that it's probably best to just have a separate driver, so that
> part is fine.
> 
> As mentioned elsewhere this driver certainly shouldn't be accepted
> without following the generic pinctrl and pinmux bindings. You can see
> the driver I wrote here:
> https://github.com/esmil/linux/commit/c2633315385fef1a25aa3711facef07d915820e1
> 
> It is certainly not perfect and far from complete, but at least it
> does follow the generic bindings. Feel free to copy all or parts of
> that.

Thanks for your great contribution! We will rewrite the pinctrl driver
and bindings so make them follow the generic pinctrl framework.

Best regards,
Hal


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
