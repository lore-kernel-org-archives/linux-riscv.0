Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4394AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXCwRR+kJEaRhb1q9PLS+HT6zzYjX0mEL1iVPmTu2lo=; b=JoAKwbWUS+on5B
	5uSVbYFW8ViseczIsVRao2K50KOgB4d7p0XFTIBUtlLJAKa9Tb96cNNizynhnhiVibuAQA45plvBm
	3XZnAwZ/QakTzLCYcMgoL8ZBGSAlDdI2x5FZUFLnuARODYp1iY/0/Q2gZwU4cT3oWUS25grC38UVV
	gLKs8upHO1gbz1vjFQLuO+aae/4qGLkpFTevyrkOrfYOH1Ap4SZ++KbRJiv5YWjW3xuY99dWV7LbG
	NPOCldVLki7sEUvbSMSiDQLOrXn5/mCUmdTR5KoqJVAdNsmwtt6e9AWC/+RLO6No6jOJ1MKCzE41X
	1hBuz2/2d1A+/13e5Y3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidYR-008Wsm-DY; Wed, 12 Oct 2022 15:21:55 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidYN-008WqY-8m
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 15:21:53 +0000
X-QQ-mid: bizesmtp67t1665588064t60qpwjk
Received: from [192.168.1.231] ( [113.72.146.141])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Oct 2022 23:21:03 +0800 (CST)
X-QQ-SSF: 01000000002000B09000B00A0000000
X-QQ-FEAT: KIY2vMteGsnGVHU+ba51y7vPyCbSJaIaZ6gxnecS9ihrQQ367JLoPxBIpdNbj
	wlbEPxPu/5ajoHlIXg6QhPtejOg4CZ7gCycgNWfh5YL1hPaCldCSGwcN6tzEdQwtt0Pr9Ni
	EHf5nhCGXvAqQZwRBK6+j/D0a1NzK+cx+/yMLFVXaJtCvhCAA9EAfVSX0aXACTP7JCIWGEi
	zLa/M2SnrL+l3WF4guJJCAFD34U02adfqy1bp+/cmQ7HopUnq286iLGRUvjhJ4FHPw9qgZM
	xd3wdNV8fJd5Yj7u3UohYqwngziPBVBtQySkNPR5BDl9THlQ6wlemfyQN6hWSQfR8nSE1Hs
	GDKWyWS5XvLtuegT39Q/5HzwV9YEC2RplY1tsVI9ueMMcOt9sqmZrMeQiBFbQ==
X-QQ-GoodBg: 0
Message-ID: <3BC97E98404F6FB8+c46d2e75-a2ce-96a2-04bd-f37a7f63ff31@linux.starfivetech.com>
Date: Wed, 12 Oct 2022 23:21:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 12/30] dt-bindings: reset: Add starfive,jh7110-reset
 bindings
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,
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
 <20220929175147.19749-1-hal.feng@linux.starfivetech.com>
 <20220929184349.GA2551443-robh@kernel.org>
 <8BEAFAD2C4CE6E4A+0a00376c-1e3e-f597-bcf6-106ff294859a@linux.starfivetech.com>
 <2f1d1afd-3c97-6ce0-8247-6e1c4a24e548@linaro.org>
 <4769BE3503398017+b1699221-ccc9-a0c1-0b11-141ce9644d74@linux.starfivetech.com>
 <9f04267d-2592-b303-9b79-9cef672c970a@linaro.org> <Y0bJkGQklX+eOGyW@wendy>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <Y0bJkGQklX+eOGyW@wendy>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_082151_672738_92463A4B 
X-CRM114-Status: GOOD (  21.79  )
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

On Wed, 12 Oct 2022 15:05:04 +0100, Conor Dooley wrote:
> Hey Hal Feng,
> 
> On Wed, Oct 12, 2022 at 09:33:42AM -0400, Krzysztof Kozlowski wrote:
> > >>> These two properties are the key differences among different reset controllers.
> > >>
> > >> Different as in different compatibles? Please answer the questions..> 
> > >>> There are five memory regions for clock and reset in StarFive JH7110 SoC. They
> > >>> are "syscrg", "aoncrg", "stgcrg", "ispcrg" and "voutcrg". Each memory region
> > >>> has different reset ASSERT/STATUS register offset and different number of reset
> > >>> signals. 
> > >>
> > >> Then these are not exactly the same devices, so using one compatible for
> > >> them does not look correct.
> > > 
> > > One compatible can just be matched by one device? I think this is what
> > > confuses me.
> > 
> > I don't understand the question.
> 
> If two SoCs have exactly the same device/peripheral then they _can_ use
> the same compatible. If they share some common, viable feature-set then
> one can "fall back" to the other depending on what your Venn diagram of
> common features looks like. I've not been following this too closely,
> but I think what Krzysztof is suggesting is that you have a jh7100 and
> a jh7110 compatible. Then in your driver you just "know" that if you
> match against jh7110 which values to use for register offsets & vice
> versa for a match against the jh7100. There's many examples over the
> tree for how to handle this sort of thing rather than including it in
> the devicetree.
> 
> Maybe Rob and Krzysztof will scream at me for this description, but
> devicetree is about how periperhals etc are connected together in the
> system not about the internals of a given peripheral.
> 
> Following that logic, the devicetree should not contain register offsets
> etc that are a known quanitity once you've determined that you are running
> on vendor,soc-foo.
> 
> Hopefully that helps with your confusion somewhat?
> Conor.

Yes, anyway, thank you for the detailed reply.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
