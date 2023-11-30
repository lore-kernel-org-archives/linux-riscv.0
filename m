Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0BFC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 06:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NpF0f6HMcAC5iW1CtOPITSWXvbBoqWPJ2QL1GbrZY/k=; b=PumKI/3zPesTNx
	qBbNPIFufG1Ivtde78IzIjyF6f/9uWTvpsBibnArd+UtK+7hkU2n1LKYRsxl421TLDtmuJHXftYbM
	OD8HFvJ3nemxWmqaNnofGsYl32Hs+48/Kf3sCXYCM6Tzhj2WRho1ugaIl3K5TRx8qbGqxwJRgPIMu
	jE6BzcCfsCHNpeGEemHrotHKstgREmMc+CAV1sG9QEi/3UaMGKPTeGlxTFc+4d1O5UZV1P77kS5AE
	CN/zq6IsLbIJY6IyxfoQTIbJvaaWmmPg1FobVrULQCS7y/tGrj5ynKtAjcZWbBbYlqnqu4yXcZfC7
	51EAjtpfBu2xw9v0uLbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8aBE-00A05N-2a;
	Thu, 30 Nov 2023 06:05:44 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8aBB-00A03Z-1H
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 06:05:43 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1F18F24E260;
	Thu, 30 Nov 2023 14:04:52 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 30 Nov
 2023 14:04:51 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 30 Nov
 2023 14:04:51 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Thu, 30 Nov 2023 14:04:51 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: "kernel@esmil.dk" <kernel@esmil.dk>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "krzk@kernel.org" <krzk@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"anup@brainfault.org" <anup@brainfault.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>, Michael Zhu
	<michael.zhu@starfivetech.com>, "drew@beagleboard.org"
	<drew@beagleboard.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH v2 1/6] dt-bindings: riscv: Add StarFive Dubhe compatibles
Thread-Topic: [PATCH v2 1/6] dt-bindings: riscv: Add StarFive Dubhe
 compatibles
Thread-Index: AQHaIol1JcCnwq8cUEOHXow7o5B+9LCQ2lcAgAGGuzA=
Date: Thu, 30 Nov 2023 06:04:51 +0000
Message-ID: <08daada77b3e40049ef83f4eb762240c@EXMBX066.cuchost.com>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
 <20231129060043.368874-2-jeeheng.sia@starfivetech.com>
 <20231129-revisit-prefix-5327168e91f3@spud>
In-Reply-To: <20231129-revisit-prefix-5327168e91f3@spud>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_220541_745165_EE809355 
X-CRM114-Status: GOOD (  15.49  )
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
> Sent: Wednesday, November 29, 2023 10:46 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; krzk@kernel.org; conor+dt@kernel.org;
> paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; daniel.lezcano@linaro.org; tglx@linutronix.de;
> anup@brainfault.org; gregkh@linuxfoundation.org; jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu
> <michael.zhu@starfivetech.com>; drew@beagleboard.org; devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH v2 1/6] dt-bindings: riscv: Add StarFive Dubhe compatibles
> 
> On Wed, Nov 29, 2023 at 02:00:38PM +0800, Sia Jee Heng wrote:
> > Add new compatible strings for Dubhe-80 and Dubhe-90. These are
> > RISC-V cpu core from StarFive Technology and are used in StarFive
> > JH8100 SoC.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index f392e367d673..493972b29a22 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -48,6 +48,8 @@ properties:
> >                - thead,c906
> >                - thead,c910
> >                - thead,c920
> > +              - starfive,dubhe-80
> > +              - starfive,dubhe-90
> 
> s goes before t.
Noted. Will fix it.
> 
> Cheers,
> Conor.
> 
> >            - const: riscv
> >        - items:
> >            - enum:
> > --
> > 2.34.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
