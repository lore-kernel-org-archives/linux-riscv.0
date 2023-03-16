Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AD2C6FD19
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gv9qR2qrR1Sx/6iv2U/nYSs1GivWxhuLEhf12KPt7pk=; b=ar/D+JDgz5MhLq
	pOUeFkP9qG8wynht1SNgVVvg5z3p+FUSQSLInyKpqx7PQL5y7zRc4Igzvjp5nRDbhGKbAgo11GbRH
	KJ+BNlZXkDv80+/X8ImD4J3DvlU+oSm8HtFXCaxsSk3wYUik4LkdPv8magu7Roe5iZ+dz3hkSxIQe
	lhMF6Q4IG958orLOmJdJZs/6+WPpW/YTux4Spk+YhtQwEHTxKJlBJF47y9qRf9g0EJNNNRu1yAaVZ
	oqyAe+6+YeUXapgY3U3PNvyCLXcvGPtBfBpfrwGov3FRetY7L8W+M5y3XvInMgZvg/8OZ1Pa+W4mQ
	VPwyi0e0vH1I+jB9iyHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pciyy-00FfaP-2U;
	Thu, 16 Mar 2023 08:29:08 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pciyu-00FfYz-2X
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 08:29:06 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7A0B224E2E2;
	Thu, 16 Mar 2023 16:28:41 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 16:28:41 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 16:28:40 +0800
Message-ID: <b7766151-cf21-a5b4-e0ef-7b070e9e5c33@starfivetech.com>
Date: Thu, 16 Mar 2023 16:28:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 4/6] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
References: <20230316043714.24279-1-samin.guo@starfivetech.com>
 <20230316043714.24279-5-samin.guo@starfivetech.com>
 <cfeec762-de75-f90f-7ba1-6c0bd8b70dff@linaro.org>
 <93a3b4bb-35a4-da7c-6816-21225b42f79b@starfivetech.com>
 <9038dba0-6f72-44a1-9f57-1c08b03b9c31@linaro.org>
 <d2bb7fa5-206f-2059-bde0-b65e1acc44de@starfivetech.com>
 <c716e535-7426-56da-ca6f-51c7d7d69bb3@linaro.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <c716e535-7426-56da-ca6f-51c7d7d69bb3@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_012904_975050_31DEE2F7 
X-CRM114-Status: UNSURE (   8.14  )
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

CgotLS0tLS0tLSDljp/lp4vkv6Hmga8gLS0tLS0tLS0K5Li76aKYOiBSZTogW1BBVENIIHY3IDQv
Nl0gZHQtYmluZGluZ3M6IG5ldDogQWRkIHN1cHBvcnQgU3RhckZpdmUgZHdtYWMKRnJvbTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgrmlLbku7bk
uro6IEd1byBTYW1pbiA8c2FtaW4uZ3VvQHN0YXJmaXZldGVjaC5jb20+LCBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnLCBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwrml6XmnJ86IDIwMjMv
My8xNgoKPiBPbiAxNi8wMy8yMDIzIDA5OjE1LCBHdW8gU2FtaW4gd3JvdGU6Cj4+Pj4+IGludGVy
cnVwdHM6ID8/Pwo+Pj4+Pgo+Pj4+Cj4+Pj4gSGkgS3J6eXN6dG9mLCAKPj4+Pgo+Pj4+IHNucHMs
ZHdtYWMueWFtbCBoYXMgZGVmaW5lZCB0aGUgcmVnL2ludGVycnVwdC9pbnRlcnJ1cHQtbmFtZXMg
bm9kZXMsCj4+Pj4gYW5kIHRoZSBKSDcxMTAgU29DIGlzIGFsc28gYXBwbGljYWJsZS4KPj4+PiBN
YXliZSBqdXN0IGFkZCByZWcvaW50ZXJydXB0L2ludGVycnVwdC1uYW1lcyB0byB0aGUgcmVxdWly
ZWQgPwo+Pj4KPj4+IFlvdSBuZWVkIHRvIGNvbnN0cmFpbiB0aGVtLgo+Pgo+Pgo+PiBJIHNlZS4g
SSB3aWxsIGFkZCByZWcgY29uc3RyYWludHMgaW4gdGhlIG5leHQgdmVyc2lvbiwgdGhhbmtzLgo+
Pgo+PiBJIGhhdmUgb25lIG1vcmUgcXVlc3Rpb24sIHRoZSBpbnRlcnJ1cHRzL2ludGVycnVwLW5h
bWVzIG9mIEpINzExMCBTb0MncyBnbWFjIGFyZSBleGFjdGx5IHRoZSBzYW1lIGFzIHNucHMsZHdt
YWMueWFtbCwKPj4gZG8gdGhlc2UgYWxzbyBuZWVkIHRvIGJlIGNvbnN0cmFpbmVkPwo+IAo+IFRo
ZSBpbnRlcnJ1cHRzIG9uIGNvbW1vbiBiaW5kaW5nIGFyZSB2YXJpYWJsZSwgc28geW91IG5lZWQg
dG8gY29uc3RyYWluCj4gdGhlbSAtIHlvdSBoYXZlIGZpeGVkIG51bWJlciBvZiB0aGVtLCByaWdo
dD8KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4gCgpZZXMsIEpINzExMCBmaXhlZCBp
cyAzIHBjcy4gVGhhbmtzLCBJIHdpbGwgY29uc3RyYWluIHRoZW0uCgpCZXN0IHJlZ2FyZHMsClNh
bWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
