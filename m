Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AFFC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzEEtz2Yih0PT8q1eI572r63wiuF83PuVcexNVCDgq4=; b=U9DX8IRifLH9Qd
	mofIQHOi84l4JtO5FF0fDx0m+QHbfLwAxfU/iInXlUJo8hWbS/8dql1EAWyWxiGblL41TM++YJIfR
	aMOferwhALTLsTdaBKxvKG+8I4/UaJLgL46HNMAfE4ZiXTpdCcTWsSBgppxRAlAflQFbpfAqacJEk
	vmbYVhJTAX7tqCugjJMsj8R295AT4lMIeqvUxj+HzH1Y4lRNG+ELXDAiBvmKagTNHEkr3sJD1sl1W
	DEa81edY6yyZvnt1T5fxQyhVnWYFdrUN+Jbbhm7zZXUsGLzmuB7avRpXmBSCtGyBtfoLr+B4XW7UJ
	4XJMC48t+b210mJe/3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7vo-00Ai7P-G2; Wed, 01 Feb 2023 07:53:24 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7vk-00Ai5x-Cf
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 07:53:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2562C24E22E;
	Wed,  1 Feb 2023 15:53:07 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 1 Feb
 2023 15:53:07 +0800
Received: from [192.168.125.110] (183.27.97.127) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 1 Feb
 2023 15:53:05 +0800
Message-ID: <abe67217-ce94-c410-5a51-3ad3a6570045@starfivetech.com>
Date: Wed, 1 Feb 2023 15:53:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Icenowy Zheng <uwu@icenowy.me>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks
	<ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-kernel@vger.kernel.org>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-7-hal.feng@starfivetech.com> <Y6zHy9oL4xzl+6Rd@spud>
 <dda144a8397a175f3ce092485f08896c9a66d232.camel@icenowy.me>
 <51F38449-56BA-4260-B46F-0996FD29E169@kernel.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <51F38449-56BA-4260-B46F-0996FD29E169@kernel.org>
X-Originating-IP: [183.27.97.127]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_235320_741192_96F0E1EE 
X-CRM114-Status: UNSURE (   8.76  )
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

T24gVGh1LCAyOSBEZWMgMjAyMiAwOTowMjoxNSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+
IEhleSBJY2Vub3d5LCBIYWwKPiAKPiBPbiAyOSBEZWNlbWJlciAyMDIyIDA1OjI1OjAwIEdNVCwg
SWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+IHdyb3RlOgo+PuWcqCAyMDIyLTEyLTI45pif
5pyf5LiJ55qEIDIyOjQ4ICswMDAw77yMQ29ub3IgRG9vbGV55YaZ6YGT77yaCj4+PiBIZXksCj4+
PiAKPj4+IE9uIFR1ZSwgRGVjIDIwLCAyMDIyIGF0IDA5OjEyOjQ2QU0gKzA4MDAsIEhhbCBGZW5n
IHdyb3RlOgpbLi4uXQo+Pj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgVTc0XzE6
IGNwdUAxIHsKPj4+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBjb21wYXRpYmxlID0gInNpZml2ZSx1NzQtbWMiLCAicmlzY3YiOwo+Pj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwxPjsKPj4+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkLWNhY2hlLWJs
b2NrLXNpemUgPSA8NjQ+Owo+Pj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGQtY2FjaGUtc2V0cyA9IDw2ND47Cj4+PiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZC1jYWNoZS1zaXplID0gPDMyNzY4PjsKPj4+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkLXRsYi1z
ZXRzID0gPDE+Owo+Pj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGQtdGxiLXNpemUgPSA8NDA+Owo+Pj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldmljZV90eXBlID0gImNwdSI7Cj4+PiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaS1jYWNoZS1ibG9jay1zaXpl
ID0gPDY0PjsKPj4+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpLWNhY2hlLXNldHMgPSA8NjQ+Owo+Pj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGktY2FjaGUtc2l6ZSA9IDwzMjc2OD47Cj4+PiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaS10bGItc2V0cyA9IDwx
PjsKPj4+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
LXRsYi1zaXplID0gPDQwPjsKPj4+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBtbXUtdHlwZSA9ICJyaXNjdixzdjM5IjsKPj4+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBuZXh0LWxldmVsLWNhY2hlID0gPCZj
Y2FjaGU+Owo+Pj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJpc2N2LGlzYSA9ICJydjY0aW1hZmRjIjsKPj4+IAo+Pj4gVGhhdCBhbHNvIGJlZ3MgdGhl
IHF1ZXN0aW9uOgo+Pj4gRG8geW91ciB1NzRzIHN1cHBvcnQgUlY2NEdCQywgYXMgdGhlIChjdXJy
ZW50KSBTaUZpdmUgZG9jdW1lbnRhdGlvbgo+Pj4gc3VnZ2VzdHM/Cj4+Cj4+SXQgc3VwcG9ydHMg
UlY2NEdDWmJhWmJiLgo+IAo+IFN3ZWV0LCB0aGFua3MuCj4gCj4+QiBpcyBub3QgYSB3ZWxsLWRl
ZmluZWQgdGhpbmcgYnkgc3BlY2lmaWNhdGlvbnMsIHNvIGl0IHNob3VsZCBiZQo+PnByZXZlbnRl
ZCBoZXJlLgo+IAo+IFlhaCwgZG9uJ3Qgd29ycnkgLSBteSBuZXh0IHF1ZXN0aW9uIHdhcyBnb2lu
ZyB0byBiZSB3aGljaCBiaXRzIHdlcmUgc3VwcG9ydGVkIDopCj4gCj4gSGFsLCBjYW4geW91IHVw
ZGF0ZSB0aGUgaXNhIHN0cmluZyBpbiB0aGUgbmV4dCB2ZXJzaW9uIHBsZWFzZT8KClRoZSBjdXJy
ZW50IGlzYSBkZXNjcmlwdGlvbiBpcyBjb3JyZWN0LiBQbGVhc2Ugc2VlIG15IHJlcGx5IFsxXS4K
VGhhbmsgeW91LgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jNTA3ZTBiMi01Y2Ez
LWNmZmUtNTVkMi04NzNlZDhjMjRlM2RAc3RhcmZpdmV0ZWNoLmNvbS8KCkJlc3QgcmVnYXJkcywK
SGFsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
