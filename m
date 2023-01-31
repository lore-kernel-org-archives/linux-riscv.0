Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7F1C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 07:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/bXsZM4xTV4lTbyt41PMW7qBVaIILj0OM0KxdOdU1I=; b=EtOQofz5kwAJMh
	T5V3yX7q3DUhYTQ8IrQQ+CdGGlKN2fxomx42IOert8w2G08/CWqrn4XPa3JlmHTso+ouVtq4qivwc
	ZqkaIIx+93zXzNkoEqpEAtCaYYvpfhwuibW4uhlxXhnAndFhkVfjsyUsPXpoU6MIvzqNl/IA2/Zyj
	yOVwW6xHBpgHDxrAYxt/HqLIekjgTyOO16eEc4MxO5lHApCOCgaEfNylUieLN5dWjHpWq2cvrHKJd
	xMCesBYgq/J3RYUe4ewr5BV+cngYTWLqR9nmuQiMd0SQnU2lyl6gLccFUMPvHRcKnUWNanotj41sM
	GylEE4WsH6udFWbddXlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMl56-006Ztr-8U; Tue, 31 Jan 2023 07:29:28 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMl51-006ZqQ-Ox
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 07:29:26 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id E590724E1D1;
	Tue, 31 Jan 2023 15:28:54 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 31 Jan
 2023 15:28:54 +0800
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 31 Jan
 2023 15:28:54 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Tue, 31 Jan 2023 15:28:54 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: Olivia Mackall <olivia@selenic.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor.dooley@microchip.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH] hwrng: starfive - Enable compile testing
Thread-Topic: [PATCH] hwrng: starfive - Enable compile testing
Thread-Index: AQHZMj8fsXkTT9lyaUa0z6voqL4hdK64JkoA
Date: Tue, 31 Jan 2023 07:28:54 +0000
Message-ID: <2b7520a85def477d9650120a0bd01860@EXMBX168.cuchost.com>
References: <20230117015445.32500-1-jiajie.ho@starfivetech.com>
 <20230117015445.32500-3-jiajie.ho@starfivetech.com>
 <Y9OveVKTkX8cRhyP@gondor.apana.org.au>
In-Reply-To: <Y9OveVKTkX8cRhyP@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_232923_967116_44A5739A 
X-CRM114-Status: UNSURE (   5.38  )
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

> Enable compile testing for jh7110.  Also remove the dependency on
> HW_RANDOM.
> 
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> 

Reviewed-by: Jia Jie Ho <jiajie.ho@starfivetech.com>

Thanks,
Jia Jie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
