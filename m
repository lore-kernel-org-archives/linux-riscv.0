Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07805EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VN0brssYw7mS03HfEb8mfrB0IYHDnJe664pElgF9oN0=; b=P9T7zjXXA6ivBm
	HJcRb6K3ObL9E2cJyvcqemUN9h52DHAm2IaG9/3FHMHutGL45bzc/7leFvssLmm033V5i/8EE4sER
	x7GA/cDFHkoT5Q/kBX7sfa/m+ny+5Lq0mP2lDpLsn8k29C95Oqv4sX/VEXaoILiqtOVftO/qh8hY3
	etyADEmky5jwOjZZMJ6fWlpVAg3fLMfwYkVItGhdlvlzYP790Z4cpGjtIGYwFUg0YySuPTnEDWieV
	jdfBM/MB0hP4clr3zPhOdZqVyig4noWCs7VvfdwCMCA/ZIIM1LX6koAZ1nrF7GtG+8Wem+hFzB5TQ
	Xzz/RukiwFtuT1keWXSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEN9-009e6R-0t;
	Mon, 03 Jul 2023 07:53:23 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEN5-009dyL-0F
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 07:53:22 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 46C3B24E268;
	Mon,  3 Jul 2023 15:52:17 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Jul
 2023 15:52:17 +0800
Received: from [192.168.155.85] (202.188.176.82) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 3 Jul
 2023 15:52:12 +0800
Message-ID: <017dd7a1-302b-b4be-6b3d-3da0021a9b32@starfivetech.com>
Date: Mon, 3 Jul 2023 15:52:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 3/3] riscv: dts: starfive: Add TRNG node for VisionFive
 2
Content-Language: en-US
To: Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt
	<palmer@rivosinc.com>, <olivia@selenic.com>, <herbert@gondor.apana.org.au>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>, <linux-crypto@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230117015445.32500-4-jiajie.ho@starfivetech.com>
 <mhng-348475f1-5880-4951-9692-78210a17acd3@palmer-ri-x1c9a>
 <ZKCgXvcbWBGWZnsU@aurel32.net>
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
In-Reply-To: <ZKCgXvcbWBGWZnsU@aurel32.net>
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_005319_414396_0A1FB92D 
X-CRM114-Status: GOOD (  15.44  )
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

On 2/7/2023 5:53 am, Aurelien Jarno wrote:
> On 2023-03-14 18:45, Palmer Dabbelt wrote:
>> On Mon, 16 Jan 2023 17:54:45 PST (-0800), jiajie.ho@starfivetech.com wrote:
>> > Adding StarFive TRNG controller node to VisionFive 2 SoC.
>> > 
>> > Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
>> > Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
>> > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
>> > ---
>> >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 10 ++++++++++
>> >  1 file changed, 10 insertions(+)
>> > 
>> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> > index 4ac159d79d66..3c29e0bc6246 100644
>> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> > @@ -455,5 +455,15 @@ uart5: serial@12020000 {
>> >  			reg-shift = <2>;
>> >  			status = "disabled";
>> >  		};
>> > +
>> > +		rng: rng@1600c000 {
>> > +			compatible = "starfive,jh7110-trng";
>> > +			reg = <0x0 0x1600C000 0x0 0x4000>;
>> > +			clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
>> > +				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
>> > +			clock-names = "hclk", "ahb";
>> > +			resets = <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
>> > +			interrupts = <30>;
>> > +		};
>> >  	};
>> >  };
>> 
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> It appears that this patch has never been applied, although the rest of
> the series has already been merged. Unfortunately it doesn't apply
> anymore due to other changes to that file.
> 
> Could you please rebase and resend it?
> 

Hi Aurelien,

This patch is dependent on
https://patchwork.kernel.org/project/linux-riscv/patch/20230518101234.143748-2-xingyu.wu@starfivetech.com/

I'll send a new patch for this dts node after all dependencies have been merged.

Thanks,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
