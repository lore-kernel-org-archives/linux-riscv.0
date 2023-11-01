Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8442CC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 02:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FM92v2Jawx1vdhMGfjHLHN3k0SJwuKozaIYJCIL/IPM=; b=S+qQULGt3WaQ0c
	Wgt1E41Tkiu5wOZV46BQWgvNszpF4dRwNB6X9rhIAgPU+CSBy6gJMQ7fyFZ1BIUV9b9BcucZqwUhs
	ClJNjfh0qEZEKjDPjYdEVDwJ1B/r8PRiMywb7//WpkMoew0oUwyY2xJ6D6/RpUE9kyKbMx822FGtt
	kqnJCh2pCFlVLztXhWWxAIKZJ3UR659lVtlXcrWeYou0pwEJTu9dPMyzJJ5/bKpH35m6YuofCWK9P
	bgkAN4bVlzfblZr9KgEGp+KjskmPy8TNO7j6hQmOc993wwLcbLbmjAH44N+koXxXy0aavg3Cgi6Pq
	I0kTmxcWTQHgf8K5i7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy0tS-006WQY-11;
	Wed, 01 Nov 2023 02:23:42 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy0tN-006WOi-2A
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 02:23:40 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A24B58139;
	Wed,  1 Nov 2023 10:22:47 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 1 Nov
 2023 10:22:47 +0800
Received: from [192.168.120.47] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 1 Nov
 2023 10:22:46 +0800
Message-ID: <7d64ea1d-b573-4a69-ba0c-4cbfab638c5e@starfivetech.com>
Date: Wed, 1 Nov 2023 10:22:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] pwm: opencores: Add PWM driver support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Hal Feng <hal.feng@starfivetech.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
References: <20231020103741.557735-1-william.qiu@starfivetech.com>
 <20231020103741.557735-3-william.qiu@starfivetech.com>
 <20231020112539.gctx5uj2rrhryulo@pengutronix.de>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20231020112539.gctx5uj2rrhryulo@pengutronix.de>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_192337_878099_81BDE617 
X-CRM114-Status: UNSURE (   7.40  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIzLzEwLzIwIDE5OjI1LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPj4gKwl2b2lk
IF9faW9tZW0gKmJhc2UgPSBwd20tPmRhdGEtPmdldF9jaF9iYXNlID8KPj4gKwkJCSAgICAgcHdt
LT5kYXRhLT5nZXRfY2hfYmFzZShwd20tPnJlZ3MsIGRldi0+aHdwd20pIDogcHdtLT5yZWdzOwo+
PiArCXUzMiBwZXJpb2RfZGF0YSwgZHV0eV9kYXRhLCBjdHJsX2RhdGE7Cj4+ICsKPj4gKwlwZXJp
b2RfZGF0YSA9IHJlYWRsKFJFR19PQ1BXTV9MUkMoYmFzZSkpOwo+PiArCWR1dHlfZGF0YSA9IHJl
YWRsKFJFR19PQ1BXTV9IUkMoYmFzZSkpOwo+PiArCWN0cmxfZGF0YSA9IHJlYWRsKFJFR19PQ1BX
TV9DVFJMKGJhc2UpKTsKPj4gKwo+PiArCXN0YXRlLT5wZXJpb2QgPSBESVZfUk9VTkRfQ0xPU0VT
VF9VTEwoKHU2NClwZXJpb2RfZGF0YSAqIE5TRUNfUEVSX1NFQywgcHdtLT5jbGtfcmF0ZSk7Cj4+
ICsJc3RhdGUtPmR1dHlfY3ljbGUgPSBESVZfUk9VTkRfQ0xPU0VTVF9VTEwoKHU2NClkdXR5X2Rh
dGEgKiBOU0VDX1BFUl9TRUMsIHB3bS0+Y2xrX3JhdGUpOwo+IAo+IFBsZWFzZSB0ZXN0IHlvdXIg
ZHJpdmVyIHdpdGggUFdNX0RFQlVHIGVuYWJsZWQuIFRoZSByb3VuZGluZyBpcyB3cm9uZwo+IGhl
cmUuCj4gCgpIaSBVd2UsCgpUaGUgY29uY2x1c2lvbiBhZnRlciBjaGVja2luZyBpczogd2hlbiB0
aGUgcGVyaW9kIG9yIGR1dHlfY3ljbGUgdmFsdWUgc2V0CmJ5IHRoZSB1c2VyIGlzIG5vdCBkaXZp
c2libGUgKDEwMDAwMDAwMDAvNDkuNU0pLCB0aGVyZSB3aWxsIGJlIGFuIGVycm9yLgpUaGlzIGVy
cm9yIGlzIGR1ZSB0byBoYXJkd2FyZSBhY2N1cmFjeS4gU28gd2h5IGlzIHJvdW5kaW5nIGlzIHdy
b25nPwpyb2NrY2hpcCBhbHNvIGhhcyBhIHNpbWlsYXIgaW1wbGVtZW50YXRpb24gZHJpdmVycy9w
d20vIHB3bS1yb2NrY2hpcC5jCgpCZXN0IHJlZ2FyZHMsCldpbGxpYW0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
