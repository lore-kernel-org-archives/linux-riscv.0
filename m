Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BEAC76196
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 13:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+NJdpsjIDDztM59eib+fvl/4zdHmFvZREeeucfsmEF4=; b=Lym//vXbkbA79p
	44DDd9/dMs6z/1u4OLlkgB8dixZ5dkynX+D+C25hkxuduz4ArXYxavVFjDpIyqoiAwnRmM2O6YNrP
	cYglGEdG5X9pic84WoFrUP3SLwP8n5gMFrv2eRvcNJ5gWxGygbxaDW64VkuTetrlfT3xWMI6L5b5i
	QCaQEL8BiskJ43XY11hKfnuCWEwozsiI0HqgaPng42zxDYhQTCtZVjMSrQF9Opg8RqapMQb9Bj1Kb
	QKASdzlYbow8nd7BPRiYZkbnVXiBYiT5DS44Ug0zD3xCCP3+HZZBY4AiP6gYOe0btUOq9TdVHxi/7
	AtTgmgsiMzE7ChFIxMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plrh4-00FIZl-26;
	Mon, 10 Apr 2023 13:36:26 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plrh1-00FIYW-0P
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 13:36:26 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id EF6EC24E171;
	Mon, 10 Apr 2023 21:35:44 +0800 (CST)
Received: from EXMBX164.cuchost.com (172.16.7.74) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Apr
 2023 21:35:45 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX164.cuchost.com
 (172.16.6.74) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Apr
 2023 21:35:44 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Mon, 10 Apr 2023 21:35:44 +0800
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
Thread-Index: AQHZa3+jdYvISdTjqUmPzN0mADxyja8jpS2AgACU6YD//5HogIAAsqtQ//+FIACAAIes4A==
Date: Mon, 10 Apr 2023 13:35:44 +0000
Message-ID: <2b33000067d54d9e83d5a81ef102d2a9@EXMBX168.cuchost.com>
References: <20230410073752.39506-1-jiajie.ho@starfivetech.com>
 <20230410073752.39506-5-jiajie.ho@starfivetech.com>
 <ZDO/z++4/TE6AiIz@gondor.apana.org.au>
 <6df549e9-d0f6-23ca-882f-527c4e40b553@starfivetech.com>
 <ZDPgXyGZtMZw5G4q@gondor.apana.org.au>
 <c1925af208b540c2bd78a16bc593ecae@EXMBX168.cuchost.com>
 <ZDQPLGG+DorFwZ+1@gondor.apana.org.au>
In-Reply-To: <ZDQPLGG+DorFwZ+1@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [161.142.156.149]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_063623_536522_9C914FE1 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

> > The sequence of event would be:
> > 1. Wait for DMA transfer to complete.
> > 2. Set bit in device CSR to indicate final block has been transferred.
> 
> OK, 2 should be done in the DMA callback function.
> 
> > 3. Device will send IRQ once result is ready.
> > 4. Read out final digest value from device.
> 
> 4 should be done from a tasklet scheduled from the IRQ handler.
> 

I'll update the driver accordingly. 
Thanks again for the advice.

Regards,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
