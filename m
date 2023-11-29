Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9184CC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCeEJUYJtZWKPpQdT11GKxvlGBnHgf4/vfO1GlY+wGU=; b=2CqaZTJg62V0X0
	tuM4gL1B9234oEOKMuLREYvmu0s+1T2X/F6Y4c1ttB5JgR2kTmtaapsGS8zlBmtwnMkKxVIZcS3xp
	9QFvrqXicLw6SmtqLtYi2RXwUEKxhW38zAcf24rDErAJVeytJuRLZAWfLEMBGciOLqUAmWdrW5f+s
	6xAs3p6WEE8MKFhwJJMMkbLkkRz11p7lBL6EDqkdlk7AQfKIjXnQgCzikQbBQC7zjVJNfMdGrGBVt
	y0q2Oh0FMaV8TmPI9pyk6JzJhqCUJJdR15GYCjonlWrtKTC5E1M2J6eXkPg6R7VohEMYcbywkTKt5
	tp127K939vz3OpgrkdGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KRA-008RGA-1V;
	Wed, 29 Nov 2023 13:17:08 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KR6-008RF8-1M
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 13:17:07 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B8FCB24E03E;
	Wed, 29 Nov 2023 21:15:52 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Nov
 2023 21:15:52 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Nov
 2023 21:15:52 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Wed, 29 Nov 2023 21:15:52 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "kernel@esmil.dk"
	<kernel@esmil.dk>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"krzk@kernel.org" <krzk@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"conor@kernel.org" <conor@kernel.org>, "anup@brainfault.org"
	<anup@brainfault.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "jirislaby@kernel.org" <jirislaby@kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>, Michael Zhu
	<michael.zhu@starfivetech.com>, "drew@beagleboard.org" <drew@beagleboard.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH v2 5/6] dt-bindings: serial: cdns: Add new compatible
 string for StarFive JH8100 UART
Thread-Topic: [PATCH v2 5/6] dt-bindings: serial: cdns: Add new compatible
 string for StarFive JH8100 UART
Thread-Index: AQHaIomVReB7ZsOIbUqhwwRlprdVx7CQcD2AgACjd5D//4WkAIAArSFA
Date: Wed, 29 Nov 2023 13:15:52 +0000
Message-ID: <a0181b9c536a4692bab5eb827af1636c@EXMBX066.cuchost.com>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
 <20231129060043.368874-6-jeeheng.sia@starfivetech.com>
 <8f2f241d-580a-4906-949a-b99b5a600868@linaro.org>
 <d5a3a8798333431fbb2aee573383a8e4@EXMBX066.cuchost.com>
 <068ca34d-a930-4542-bde3-4fbb4c228807@linaro.org>
In-Reply-To: <068ca34d-a930-4542-bde3-4fbb4c228807@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.54.3.230]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_051705_167453_01E8ED15 
X-CRM114-Status: GOOD (  31.60  )
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
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Wednesday, November 29, 2023 6:53 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> krzk@kernel.org; conor+dt@kernel.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> daniel.lezcano@linaro.org; tglx@linutronix.de; conor@kernel.org; anup@brainfault.org; gregkh@linuxfoundation.org;
> jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu <michael.zhu@starfivetech.com>; drew@beagleboard.org
> Cc: devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH v2 5/6] dt-bindings: serial: cdns: Add new compatible string for StarFive JH8100 UART
> 
> On 29/11/2023 11:33, JeeHeng Sia wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Sent: Wednesday, November 29, 2023 4:26 PM
> >> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> >> krzk@kernel.org; conor+dt@kernel.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> >> daniel.lezcano@linaro.org; tglx@linutronix.de; conor@kernel.org; anup@brainfault.org; gregkh@linuxfoundation.org;
> >> jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu <michael.zhu@starfivetech.com>; drew@beagleboard.org
> >> Cc: devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan
> >> <leyfoon.tan@starfivetech.com>
> >> Subject: Re: [PATCH v2 5/6] dt-bindings: serial: cdns: Add new compatible string for StarFive JH8100 UART
> >>
> >> On 29/11/2023 07:00, Sia Jee Heng wrote:
> >>> Add new compatible string for UART in the StarFive JH8100 SoC.
> >>>
> >>> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> >>> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> >>
> >> The patch is quite different than v1. Are you sure the review is
> >> applicable? If it was given for v2, where is it?
> > This patch is impacted by the comment suggesting the exclusion of patch 5 in V1. In V2, this patch adds compatible for cdns-uart-
> r1p8, allowing us to continue using the cdns uart.
> 
> Please wrap your replies.
I am sorry, but may I know the preferred length of characters?
> 
> How does this answer my concern about review tag?
My bad. I should have obtained your consensus before proceeding with the changes
to this patch, especially after dropping patch 5 as requested in version 1.
> 
> Do you understand that my comments are inline under the exact line which
> is questioned?
Yes, lesson learned.
> 
> >>
> >>> ---
> >>>  Documentation/devicetree/bindings/serial/cdns,uart.yaml | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> >>> index e35ad1109efc..0d05305778f2 100644
> >>> --- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> >>> +++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> >>> @@ -20,6 +20,10 @@ properties:
> >>>          items:
> >>>            - const: xlnx,zynqmp-uart
> >>>            - const: cdns,uart-r1p12
> >>> +      - description: UART controller for StarFive JH8100 SoC
> >>
> >> This is duplicating compatible, drop.
> > Do you mean drop compatible for starfive,jh8100-uart ?
> 
> No, drop description and use directly " - items"
Ok.
> 
> >>
> >>> +        items:
> >>> +          - const: starfive,jh8100-uart
> >>> +          - const: cdns,uart-r1p8
> >>
> >> Don't add things to the end of the list, but keep order. I would suggest
> >> to put it at the beginning, so before Xilinx.
> > I'm trying to get what you're asking, but it's a bit confusing for me. So, I thought it might be easier if I just share the code below.
> Please let me know if this addresses your comment?
> > properties:
> >   compatible:
> >     oneOf:
> >       - description: UART controller for StarFive JH8100 SoC
> >         items:
> >           - const: cdns,uart-r1p8
> 
> Order is fixed, thanks. But drop description and bring back specific
> compatible. You must have specific compatibles, always.
Noted.
> 
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
