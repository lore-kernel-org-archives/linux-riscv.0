Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A981C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 07:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4jodpEkf/wdxZZGwTlFs1ef/6Z2pM7alCb2sRRezlc=; b=K2oxNzQZAKa0ex
	77sPAgx3j5jWEo7sauFGRXwnyZytbnjJ5EhTRaiOawFAdL4pLoXcItM8Zh1ZyWgh+VOQJbXdh8Fqx
	ljx26e50E+D8HcrkIk64IiG8C/XeRWn2dIteFem8/olyjn4cpj7DHBCvkHFi80jVlgpxDqMp5F11Z
	HX5VW6v3lChrC8nJODThNKWMzBMCb3UWs1I4NgLnEPrLzFxzYojAQ6B84lZRfJa12iEuSepcOIEIa
	m2LeQG98q1E9rZQFJaNecwnCWqgjy94sPsg4JZXLeKKAe84TYwB7vCpZmxrq2ZfqJYtMpqLZyy4Aj
	kyvGwKgmGXoVP3MDEEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvB7-00D5ub-VZ; Fri, 17 Feb 2023 07:29:09 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvB2-00D5o7-V6
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 07:29:08 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5D5A624DE83;
	Fri, 17 Feb 2023 15:28:32 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Feb
 2023 15:28:32 +0800
Received: from [192.168.125.128] (183.27.98.67) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Feb
 2023 15:28:30 +0800
Message-ID: <267ab62d-d680-d505-4183-ccb8c654419e@starfivetech.com>
Date: Fri, 17 Feb 2023 15:29:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/3] drivers: watchdog: Add StarFive Watchdog driver
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
References: <20221219094233.179153-1-xingyu.wu@starfivetech.com>
 <20221219094233.179153-3-xingyu.wu@starfivetech.com>
 <20230201224619.GA3194283@roeck-us.net>
 <1f18bfdc-7a04-4914-d970-7ef1d4f99653@starfivetech.com>
 <bfc81429-1829-bec1-ac29-0559f6a01215@roeck-us.net>
 <c0b03600-13a9-b9e7-e4f3-701fd5b55c86@starfivetech.com>
In-Reply-To: <c0b03600-13a9-b9e7-e4f3-701fd5b55c86@starfivetech.com>
X-Originating-IP: [183.27.98.67]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_232905_327443_ED1A2F94 
X-CRM114-Status: UNSURE (   9.18  )
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

T24gMjAyMy8yLzE3IDEwOjMwLCBYaW5neXUgV3Ugd3JvdGU6Cj4gT24gMjAyMy8yLzE2IDIyOjU3
LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+PiBPbiAyLzE1LzIzIDIzOjExLCBYaW5neXUgV3Ugd3Jv
dGU6Cj4+PiBPbiAyMDIzLzIvMiA2OjQ2LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+Pj4+IE9uIE1v
biwgRGVjIDE5LCAyMDIyIGF0IDA1OjQyOjMyUE0gKzA4MDAsIFhpbmd5dSBXdSB3cm90ZToKPj4+
Pj4gQWRkIHdhdGNoZG9nIGRyaXZlciBmb3IgdGhlIFN0YXJGaXZlIEpINzExMCBTb0MuCj4+Pj4+
Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFhpbmd5dSBXdSA8eGluZ3l1Lnd1QHN0YXJmaXZldGVjaC5j
b20+Cj4+Pj4+ICsKPj4+Pj4gWy4uLl0KPj4+Pj4gKwo+Pj4+PiArc3RhdGljIGNvbnN0IHN0cnVj
dCB3YXRjaGRvZ19pbmZvIHN0YXJmaXZlX3dkdF9pZGVudCA9IHsKPj4+Pj4gK8KgwqDCoCAub3B0
aW9ucyA9IE9QVElPTlMsCj4+Pj4+ICvCoMKgwqAgLmZpcm13YXJlX3ZlcnNpb24gPSAwLAo+Pj4+
Cj4+Pj4gSXQgaXMgbm90IG5lY2Vzc2FyeSB0byBpbml0aWxpemUgYSBzdGF0aWMgdmFyaWFibGUg
d2l0aCAwLgo+Pj4+Cj4+Pj4+ICvCoMKgwqAgLmlkZW50aXR5ID0gIlN0YXJGaXZlIFdhdGNoZG9n
IiwKPj4+Pj4gK307Cj4+Pgo+Pj4gSGkgR3VlbnRlciwKPj4+Cj4+PiBJdCB3b3VsZCBiZSBhIGNv
bXBpbGF0aW9uIGVycm9yIGlmIGRyb3AgdGhlICcwJy4gSSBmb3VuZCB0aGF0IG90aGVyIGZpbGVz
Cj4+IAo+PiBOby4KPj4gCj4+PiBpbml0aWFsaXplIHRoaXMgc3RhdGljIHZhcmlhYmxlIGFzIHdl
bGwuCj4+Pgo+PiAKPj4gQWgsIHRoZSBvbGQgIm90aGVycyBkbyBpdCwgc28gZG8gSSIgYXJndW1l
bnQuCj4+IFNvcnJ5LCB0aGF0IGlzIG5vdCBhIHZhbGlkIGFyZ3VtZW50Lgo+PiAKPiAKPiBDYW4g
SSBhc3NpZ24g4oCYZmlybXdhcmVfdmVyc2lvbuKAmSB0byBhIG1hY3JvIGRlZmluaXRpb24gaW4g
dGhlIHByb2JlPwo+IAoKT3IgZHJvcCB0aGUgJ2Zpcm13YXJlX3ZlcnNpb24nID8KCkJlc3QgcmVn
YXJkcywKWGluZ3l1IFd1CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
