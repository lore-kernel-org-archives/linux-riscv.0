Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09858C76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 01:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swvR4vOfKVxflXT8bMIL3aME2gnvFDF6v4BCFn+gaLs=; b=xKBhG8f6X/J1bQ
	tIb9+xcgx3+VuLnf77C5wZDgC16kSptfedUu4wGF+EbOf3rqqaA3Em1ntzTT9KWIc8w5h4UcztpFs
	+07Whsz2KA7KGs2n2dauCu7KIAionU1/9AN+lZL7jL+yzm93FCuFccr/oPQEgWWZale2lv1w/zQT/
	fKFf9POF2DIwPEgrAI3+dIhhzxRXelzX49x1PohnL48Hc2J5Gs7I8oLuSN+Z4SEF+LmyXFL4hSlqd
	v35LoKBzRxW1EaqFMEbPwUreR8EX6EVu9F5sqJjkXwOOPGZqTt6hIrQ7duiZ9tlUqwpwhuK+mcNk7
	x8EgMzbk2VtQ2aXkCm/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjs9A-0037VY-1j;
	Wed, 05 Apr 2023 01:41:12 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjs96-0037UK-1n
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 01:41:10 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A5D6724DBFD;
	Wed,  5 Apr 2023 09:40:27 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 5 Apr
 2023 09:40:27 +0800
Received: from [172.16.16.231] (183.27.98.171) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 5 Apr
 2023 09:40:26 +0800
Message-ID: <39a2c174-c7f5-cb0f-5430-87b859a2ea5c@starfivetech.com>
Date: Wed, 5 Apr 2023 09:40:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 21/22] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
To: Shengyu Qu <wiagn233@outlook.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20230401111934.130844-1-hal.feng@starfivetech.com>
 <20230401111934.130844-22-hal.feng@starfivetech.com>
 <TY3P286MB26110E2983EB074270B7610898939@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <TY3P286MB26110E2983EB074270B7610898939@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-Originating-IP: [183.27.98.171]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_184108_918834_FB9088AA 
X-CRM114-Status: UNSURE (   7.33  )
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

T24gV2VkLCA1IEFwciAyMDIzIDAyOjM4OjI1ICswODAwLCBTaGVuZ3l1IFF1IHdyb3RlOgo+IEhp
IEhhbCwKPiAKPj4gK8KgwqDCoCBhbGlhc2VzIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGkyYzAgPSAm
aTJjMDsKPj4gK8KgwqDCoMKgwqDCoMKgIGkyYzIgPSAmaTJjMjsKPj4gK8KgwqDCoMKgwqDCoMKg
IGkyYzUgPSAmaTJjNTsKPj4gK8KgwqDCoMKgwqDCoMKgIGkyYzYgPSAmaTJjNjsKPj4gK8KgwqDC
oMKgwqDCoMKgIHNlcmlhbDAgPSAmdWFydDA7Cj4+ICvCoMKgwqAgfTsKPj4gKwo+PiArwqDCoMKg
IGNob3NlbiB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzdGRvdXQtcGF0aCA9ICJzZXJpYWwwOjExNTIw
MG44IjsKPj4gK8KgwqDCoCB9Owo+PiArCj4+ICvCoMKgwqAgY3B1cyB7Cj4+ICvCoMKgwqDCoMKg
wqDCoCB0aW1lYmFzZS1mcmVxdWVuY3kgPSA8NDAwMDAwMD47Cj4gCj4gSXMgbXRpbWUgZnJlcXVl
bmN5IG9uIEpINzExMCBjb3VsZCBiZSBtb2RpZmllZD/CoCBJZiBub3QsIEkgdGhpbmsgaXQncyBi
ZXR0ZXIKPiAKPiB0byBwdXQgaXQgaW50byBqaDcxMTAuZHRzaS4KClRoaXMgZnJlcXVlbmN5IGlz
IGZyb20gKG9zYyAvIDYpLiBUaGlzIGlzIGJhc2VkIG9uIHRoZSBmcmVxdWVuY3kKb2YgdGhlIGNy
eXN0YWwgb3NjaWxsYXRvciBvbiB0aGUgYm9hcmQuIFNvIHdlIHNldCBpdCBoZXJlLgoKQmVzdCBy
ZWdhcmRzLApIYWwKCj4gCj4+ICvCoMKgwqAgfTsKPj4gKwo+PiArwqDCoMKgIG1lbW9yeUA0MDAw
MDAwMCB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+PiArwqDC
oMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDQwMDAwMDAwIDB4MSAweDA+Owo+PiArwqDCoMKgIH07
Cj4+ICsKPj4gK8KgwqDCoCBncGlvLXJlc3RhcnQgewo+PiArwqDCoMKgwqDCoMKgwqAgY29tcGF0
aWJsZSA9ICJncGlvLXJlc3RhcnQiOwo+PiArwqDCoMKgwqDCoMKgwqAgZ3Bpb3MgPSA8JnN5c2dw
aW8gMzUgR1BJT19BQ1RJVkVfSElHSD47Cj4+ICvCoMKgwqDCoMKgwqDCoCBwcmlvcml0eSA9IDwy
MjQ+Owo+PiArwqDCoMKgIH07Cj4+ICt9Owo+PiArCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IFNo
ZW5neXUKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
