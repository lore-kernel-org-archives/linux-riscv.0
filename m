Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF15C3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 03:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tOMKRPb5wORj3QfQuQumklvu0aFEvCrgc3U0+O843A=; b=dlPM+LpH+IOkt2
	2V+euE+kMn14ua/xkG0mTlmc3kMwTaXphRpHVize7AKI7pQK8tBhOXllYx587+Q5M/WgPAGHxjWIf
	W8QcIkLuRHgmQWoUNC+mJkeEFeFT3+xe/G4OO+skPnVoQJz9Bzaz1BkClJTM9qZGvCRKYAr8vdXuw
	HyFA+nvbJbtGsXS/JXniG+GMX5YGkvBVUO3VtuIgyPju7F8JeA2IK31XVZeKX+DH5jKVmUqzl4ajm
	L8qENcOBWpcmzXy2BcIId8z0gb52LbF6InRprjofeoK2wnRZy58hD/4ph6hXppogYYViM4+lwvTU6
	IjN0oMxCdORsY+zX2YMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2P3o-00H38u-Hr; Tue, 06 Dec 2022 03:56:00 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2P3m-00H34s-4S
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 03:55:59 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9655F24DFC2;
	Tue,  6 Dec 2022 11:55:27 +0800 (CST)
Received: from EXMBX065.cuchost.com (172.16.6.65) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Dec
 2022 11:55:27 +0800
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX065.cuchost.com
 (172.16.6.65) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Dec
 2022 11:55:27 +0800
Received: from EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e]) by
 EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e%16]) with mapi id
 15.00.1497.044; Tue, 6 Dec 2022 11:55:27 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: "Conor.Dooley@microchip.com" <Conor.Dooley@microchip.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "kernel@esmil.dk" <kernel@esmil.dk>,
	"davem@davemloft.net" <davem@davemloft.net>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [PATCH 6/6] riscv: dts: starfive: Add crypto and DMA node for
 VisionFive 2
Thread-Topic: [PATCH 6/6] riscv: dts: starfive: Add crypto and DMA node for
 VisionFive 2
Thread-Index: AQHZBH/4vZHP2U3n+EalaiuTkXOjPK5WreUAgAHaqdCAAEbuAIAHdAQg
Date: Tue, 6 Dec 2022 03:55:27 +0000
Message-ID: <39ac3ec838e94154b232617433910352@EXMBX068.cuchost.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-7-jiajie.ho@starfivetech.com>
 <1673ef8b-179e-3b03-b3f8-8d347c70d8c3@microchip.com>
 <4ddddceba3dc437daca27374dd2f6fd7@EXMBX068.cuchost.com>
 <Y4jslJfTVtQ9cIGm@spud>
In-Reply-To: <Y4jslJfTVtQ9cIGm@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_195558_331169_6C7974B5 
X-CRM114-Status: GOOD (  11.35  )
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



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Friday, December 2, 2022 2:04 AM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>
> Cc: Conor.Dooley@microchip.com; robh+dt@kernel.org;
> herbert@gondor.apana.org.au; linux-crypto@vger.kernel.org;
> kernel@esmil.dk; davem@davemloft.net; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; linux-riscv@lists.infradead.org;
> krzysztof.kozlowski+dt@linaro.org
> Subject: Re: [PATCH 6/6] riscv: dts: starfive: Add crypto and DMA node for
> VisionFive 2
> 
> On Thu, Dec 01, 2022 at 06:17:26AM +0000, JiaJie Ho wrote:
> > > -----Original Message-----
> > > From: Conor.Dooley@microchip.com <Conor.Dooley@microchip.com>
> 
> In that case, the SoB block should look like:
> 
> Co-developed-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> 
> Similarly for any other patches they may have co-developed :)
> 

I'll add these in the v2.

> If the hardware is always present, why not drop the "disabled" in jh7110.dtsi
> & these two entries marking them as "okay" in the .dts?
> 

Okay, I'll update these too. 
Thanks again for the suggestions.

Best regards,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
