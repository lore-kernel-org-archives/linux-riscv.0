Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C773C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 18:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBQ1p7RPVKRMD5lGDviOJvabnMNTJCfehtypTpFNBrc=; b=SvkwYI+f8/hmZv
	NB6JL5QBn0vurt3xxbD+cNVpxP6US1emhhl19/5XcVUN+FyPD27NP4zjpWBCfD79LWyUEA19VlI0f
	xUK4ZmUkA7GBX5fSDi1pjVzeyddr8H18Jf+Oz90AUs2UT2ko9AYTMnYnx0Cs2R2eyKXQrxvxQNTOd
	/MsDXK2VNSEFmtlVKry/eTacxUw+o0Fkienujn3kTv9+tgjeuIcTsM3PeTIJEfugvp34qWXRUbuna
	xQ1iUH81u3aoWSbS48o6nPVZz01UMFNNjIaCM9wnic6MDcQ4vD7jAG+9ITrDtoU5LZDvk0z7Uds5y
	J+bPT0UPtPh84Dii6cLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohF1A-00Dzzr-MQ; Sat, 08 Oct 2022 18:57:48 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohF17-00DzzD-CM
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 18:57:47 +0000
X-QQ-mid: bizesmtp88t1665255258tpzq9y8b
Received: from [192.168.0.179] ( [113.85.219.225])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 09 Oct 2022 02:54:17 +0800 (CST)
X-QQ-SSF: 0100000000200090B000B00A0000000
X-QQ-FEAT: 2aB7Y8UOkmPkPMNeCU9D3ga5YoRbEIqL1KC8KFDdIkY5MNJpOgc3ZKG/gxh+q
	tIyW3rJ0wzkKyCuqCwoV2xIymEMWMJR/4HtKSUyu9CcbfHPW2xl6doxSioe1Aq4sNtqB7Sl
	BrSm/RhQbI7TXLjPpS7BHqE519HdiFmr0p5w2bcojiCUgvNJUJVkXdVypW3hsrfcjtXMFLR
	VGSCOGgc2XZitLhR9u+wbmZTKeHiUSt9IoO86ERYSRJ9Q54pVg27NKhvLjjQsysXCkNiTRY
	dQcuk2HrH6f2vaB154XQi22zeSyIutnuoqgtSBv/VrT0luU4VeVcZV2v1WkWCPMr2mpC8tT
	xBNm/NlHq30bjtNhU3Mr6Ov5UNtMVhFiFrSG0nMyypZH2m2dlCTK6G1ilkXcA==
X-QQ-GoodBg: 0
Message-ID: <F3EFC1097B3F50DD+9675984c-d18b-f70e-1e07-715c7ce23836@linux.starfivetech.com>
Date: Sun, 9 Oct 2022 02:54:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 04/30] dt-bindings: sifive-l2-cache: Support StarFive
 JH71x0 SoCs
Content-Language: en-US
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
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
 <20220929143225.17907-5-hal.feng@linux.starfivetech.com>
 <YzW60PDwnJ7GeLYK@spud>
 <b2880b7b-c50d-9161-4278-615cf66c2094@codethink.co.uk>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <b2880b7b-c50d-9161-4278-615cf66c2094@codethink.co.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_115745_748418_760D3FAD 
X-CRM114-Status: GOOD (  11.81  )
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

On Mon, 3 Oct 2022 10:26:44 +0100, Ben Dooks wrote:
> On 29/09/2022 16:33, Conor Dooley wrote:
> > On Thu, Sep 29, 2022 at 10:31:59PM +0800, Hal Feng wrote:
> >> From: Emil Renner Berthing <kernel@esmil.dk>
> >>
> >> This cache controller is also used on the StarFive JH7100 and JH7110
> >> SoCs.
> >
> > Ditto this patch, hopefully [0] will have landed as 6.1 material
> > before you get around to an actual v2.
> >
> > Thanks,
> > Conor
> >
> > 0 - https://lore.kernel.org/linux-riscv/20220913061817.22564-1-zong.li@sifive.com/
> 
> Also, the l2 cache is being proprely named the ccache (composable cache)
> as it is not necessarily an L2 cache.
> 

Thanks for reminding. I will modify the code, based on the patches from Zong Li.
I hope his patch series will be merged as soon as possible.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
