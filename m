Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04C5C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 03:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yALFPNjZvnu3VdjhoKxi45EFPHruKQzrwKzg7DZYQyI=; b=JFQVgYkeLx+0Ks
	Iw6E55D4KwwsYp4yFqNW6N60AfYAqkEGM2mC8qV19N/e4ESg7I2R37SMFKHoRgHtBGRpC2tMufZL5
	fiPM/wFfI8Xow27ek2QiKjGRFdog8ls2LdJfYjMWRM1pKjtrHYdsoaQXPz2fsVmtRisRY7LidWWrs
	3Fh2Yc1ZLT86y7gRalc1cT4fisvsoVpyrE5SUQWvhkPCaAsU/xyAFL/tTnOL/+I8hSu/cee6L5vNu
	qkgcW9RUMWR4KjSQa1EF0N8YH5CFAB8ginD7hgWM24grjEHt9iweocOX1SoAIMpPXbctoeEBEBMeT
	IcJX9g/PiTUq0BWmAaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh0mj-00Bf1e-VL; Sat, 08 Oct 2022 03:45:58 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh0md-00BexC-2R
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 03:45:56 +0000
X-QQ-mid: bizesmtp83t1665200686tzpdo9vx
Received: from [192.168.0.179] ( [113.85.219.225])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 08 Oct 2022 11:44:44 +0800 (CST)
X-QQ-SSF: 0100000000000070B000000A0000000
X-QQ-FEAT: 5q30pvLz2icsEuufAGCipRcNEAph5F1NreXxmwTiOB81pjLvIeHTUCJHoejvj
	xszPS/H7HnRPCCwPI76Wy6OgloCXqv3WBfz+JCNR6CvwHY8jIiK7OaSs4BSz3FHgyDWm18M
	oaRfvlN9I9TAJ/2luWIMMslqd4pAJ145pQsI/sT7o95rfvr4YXDu0luZFoV6fOraDZRqXO0
	L26Ewd0+jc8P1Z3CUfFEnzxgZ9lx63QvxRxuB6Dz+LQUh7b5oTbz6pQNde69BTIYZ8u+HBX
	Ci8t6uuccQ+2QZ4hm7IqzvkW5164wMP8NVGAMap/WQup2FhDKWi5GRwuHDBVd1GVM0KjYIT
	s3RB1I3QAnJPYSb7Io2o/DVdiLtoOjnthc396jbELnR/+r20Y1tyoa9xl8g70IipdeIRQDt
X-QQ-GoodBg: 0
Message-ID: <394AB2D3535D9461+093b7754-53cb-87c7-8f0e-68326a1ab3c5@linux.starfivetech.com>
Date: Sat, 8 Oct 2022 11:44:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 01/30] dt-bindings: riscv: Add StarFive JH7110 bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
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
 <20220929143225.17907-2-hal.feng@linux.starfivetech.com>
 <5cd77839-d75b-9290-5d34-90d6464938d6@linaro.org>
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <5cd77839-d75b-9290-5d34-90d6464938d6@linaro.org>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_204551_624903_BE626EC0 
X-CRM114-Status: GOOD (  10.55  )
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

On Thu, 29 Sep 2022 16:34:22 +0200, Krzysztof Kozlowski wrote:
> On 29/09/2022 16:31, Hal Feng wrote:
> > From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Drop last "bindings" from subject, it's redundant.

Will fix. Thanks.

> 
> > 
> > Add device tree bindings for the StarFive JH7110 RISC-V SoC and the
> > VisionFive2 board for it.
> > 
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/starfive.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> > index 5b36243fd674..543be573921d 100644
> > --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> > @@ -21,6 +21,9 @@ properties:
> >        - items:
> >            - const: beagle,beaglev-starlight-jh7100-r0
> >            - const: starfive,jh7100
> 
> Blank line.

Will fix. Thanks.

Best Regards,
Hal


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
