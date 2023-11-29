Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F6AC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 10:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WaKWFp+4ouIRPhD7+Fr/YDITzLodCSEjvwPyCntQMYQ=; b=FnJNgdxVrkI/J7
	cQ+8eNc/CLrNFqWnduwP9ogkZTTzv8uXZzplGD/59BwdADAiMjsCjVhQ3r/fJOGu/8z/xmPu5+Vna
	kTthp+QxngOOiDiWJykGF/15blT0iLBzOAHJLiHDDLOAJV8ec2E87h8phQCiFVNf2VX4gICUsFcpY
	TkY79NR1blyEtDtPhXi1CUiwGGpAYdksaA0Fa+PMg3iHk+VBZNqppF7mlIxQerGrpJIg463ZExufT
	5AbtooUSHEpTJpXSwKFBJmEhxVBHugT95MjwUtax4ToaYgKR1x01wBdn7ed194rfEONq6Fd/nVGJ8
	1UaCZ2gugEDGAUmxf+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Hsx-007pnk-0g;
	Wed, 29 Nov 2023 10:33:39 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Hsu-007phr-1H
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 10:33:38 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 95B8024DB83;
	Wed, 29 Nov 2023 18:33:11 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Nov
 2023 18:33:11 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Nov
 2023 18:33:11 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Wed, 29 Nov 2023 18:33:11 +0800
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
Thread-Index: AQHaIomVReB7ZsOIbUqhwwRlprdVx7CQcD2AgACjd5A=
Date: Wed, 29 Nov 2023 10:33:11 +0000
Message-ID: <d5a3a8798333431fbb2aee573383a8e4@EXMBX066.cuchost.com>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
 <20231129060043.368874-6-jeeheng.sia@starfivetech.com>
 <8f2f241d-580a-4906-949a-b99b5a600868@linaro.org>
In-Reply-To: <8f2f241d-580a-4906-949a-b99b5a600868@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.54.3.230]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_023336_754256_57D5958E 
X-CRM114-Status: GOOD (  24.44  )
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
> Sent: Wednesday, November 29, 2023 4:26 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> krzk@kernel.org; conor+dt@kernel.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> daniel.lezcano@linaro.org; tglx@linutronix.de; conor@kernel.org; anup@brainfault.org; gregkh@linuxfoundation.org;
> jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu <michael.zhu@starfivetech.com>; drew@beagleboard.org
> Cc: devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH v2 5/6] dt-bindings: serial: cdns: Add new compatible string for StarFive JH8100 UART
> 
> On 29/11/2023 07:00, Sia Jee Heng wrote:
> > Add new compatible string for UART in the StarFive JH8100 SoC.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> 
> The patch is quite different than v1. Are you sure the review is
> applicable? If it was given for v2, where is it?
This patch is impacted by the comment suggesting the exclusion of patch 5 in V1. In V2, this patch adds compatible for cdns-uart-r1p8, allowing us to continue using the cdns uart.
> 
> > ---
> >  Documentation/devicetree/bindings/serial/cdns,uart.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> > index e35ad1109efc..0d05305778f2 100644
> > --- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
> > @@ -20,6 +20,10 @@ properties:
> >          items:
> >            - const: xlnx,zynqmp-uart
> >            - const: cdns,uart-r1p12
> > +      - description: UART controller for StarFive JH8100 SoC
> 
> This is duplicating compatible, drop.
Do you mean drop compatible for starfive,jh8100-uart ?
> 
> > +        items:
> > +          - const: starfive,jh8100-uart
> > +          - const: cdns,uart-r1p8
> 
> Don't add things to the end of the list, but keep order. I would suggest
> to put it at the beginning, so before Xilinx.
I'm trying to get what you're asking, but it's a bit confusing for me. So, I thought it might be easier if I just share the code below. Please let me know if this addresses your comment?
properties:
  compatible:
    oneOf:
      - description: UART controller for StarFive JH8100 SoC
        items:
          - const: cdns,uart-r1p8
      - description: UART controller for Zynq-7xxx SoC
        items:
          - const: xlnx,xuartps
          - const: cdns,uart-r1p8
      - description: UART controller for Zynq Ultrascale+ MPSoC
        items:
          - const: xlnx,zynqmp-uart
          - const: cdns,uart-r1p12
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
