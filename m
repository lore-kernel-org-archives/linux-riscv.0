Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E5DC77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 13:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vr5oK9MY5YGo8fbEwg+Jad7uBCtZx+HnMHBn8JUzvDM=; b=KXfvpCR3Wyc3/c
	J5U/m14cMHJaC7qaULZ1e7K8ksrFVizF+F48T2G3DstgSfPOHAbAgDvSiXnctYgXYgAn1aogNkFc/
	8N6PKf7ifGtJc6RtW+bEqtZz18hftTuEymSm1tpYYm2oQrafHLt/DDZ/I2TQnNFNDMgXNmA/3Mpsz
	JT32MVLDvDWWhJ9ktHMnORrz4hzIRsAzxUYtY/21Q8THWxRRaTI7NKaQYTwIt89bK2COYUEMWJq7B
	bGf2KB+3oy/sovcsczC7cW3K9NCJlpnQ+jYpqWeKm6FaJrTikKM2cTydl+MlJ/H6vUZgDRm3ndlZS
	gR+/8kY486zJ5kLbsofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plrIW-00FGwv-2W;
	Mon, 10 Apr 2023 13:11:04 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plrIS-00FGvs-0R
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 13:11:03 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2ADE524E20A;
	Mon, 10 Apr 2023 21:10:30 +0800 (CST)
Received: from EXMBX167.cuchost.com (172.16.6.77) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Apr
 2023 21:10:30 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX167.cuchost.com
 (172.16.6.77) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Apr
 2023 21:10:29 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Mon, 10 Apr 2023 21:10:29 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: "David S . Miller" <davem@davemloft.net>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley
	<conor.dooley@microchip.com>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v4 4/4] crypto: starfive - Add hash and HMAC support
Thread-Topic: [PATCH v4 4/4] crypto: starfive - Add hash and HMAC support
Thread-Index: AQHZa3+jdYvISdTjqUmPzN0mADxyja8jpS2AgACU6YD//5HogIAAsqtQ
Date: Mon, 10 Apr 2023 13:10:29 +0000
Message-ID: <c1925af208b540c2bd78a16bc593ecae@EXMBX168.cuchost.com>
References: <20230410073752.39506-1-jiajie.ho@starfivetech.com>
 <20230410073752.39506-5-jiajie.ho@starfivetech.com>
 <ZDO/z++4/TE6AiIz@gondor.apana.org.au>
 <6df549e9-d0f6-23ca-882f-527c4e40b553@starfivetech.com>
 <ZDPgXyGZtMZw5G4q@gondor.apana.org.au>
In-Reply-To: <ZDPgXyGZtMZw5G4q@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [161.142.156.149]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_061100_630008_9D146D1D 
X-CRM114-Status: GOOD (  15.42  )
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

> Subject: Re: [PATCH v4 4/4] crypto: starfive - Add hash and HMAC support
> 
> On Mon, Apr 10, 2023 at 04:43:37PM +0800, Jia Jie Ho wrote:
> >
> > The hardware requires user to set a 'final' bit after data transfer completed.
> > This completion is to wait for the interrupt signal from device that
> > the final digest has been populated to the read registers.
> >
> > I'll do the finalize_request call directly in the next version.
> 
> Instead of the IRQ performing a completion, it could instead schedule a tasklet
> and do the callback directly from the tasklet.
> 
> Actually, the ordering between the IRQ and DMA callback is a bit confusing.
> Which one is supposed to occur first and how does it interact with the other
> event?
> 

The sequence of event would be:
1. Wait for DMA transfer to complete.
2. Set bit in device CSR to indicate final block has been transferred.
3. Device will send IRQ once result is ready.
4. Read out final digest value from device.

Thanks,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
