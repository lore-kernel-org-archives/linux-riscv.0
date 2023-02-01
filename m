Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD47EC38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 07:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WbrIxt7Jt5DAEdYRQ/kVG7L+AK692otLZ1Jpo42gwA=; b=LBlzQ7iMmZRI2f
	s/qwohUF1P+NcKZScUrSQZ8JX+Xj1lBAJc4TL4xHW4cphzYLgJmKyN6bgiHLwvohRSO6HTu1fjIH4
	yo8kCfTB0I4MSqcHdNBATGxNZ+EDbyMSimad1GmE1EQiHAl68wGxbvRordhKHgAIvDqrKhJWeUfr5
	Fr/I7oCpjIJ5xYuV7q4nttVOgicKyBFQrBnGzYgwgM4OGnVqSuwLJNTAtY/ZOOvMDQoSaR4rlCh75
	BxQC5dNxhy7Q3n677ncSK+7Fbsv6Fr0pCwieC1ABUh04JoW+ZsEp8CURq9tVNegNBMHZz4gCOzJgy
	wmKlMh6da/NKkJycuDPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7bP-00AbfT-Dw; Wed, 01 Feb 2023 07:32:19 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7bL-00AbdT-Ru
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 07:32:17 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 08C3124E22D;
	Wed,  1 Feb 2023 15:31:39 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 1 Feb
 2023 15:31:39 +0800
Received: from [192.168.125.110] (183.27.97.127) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 1 Feb
 2023 15:31:38 +0800
Message-ID: <eb255bf6-ed92-d9d8-931b-9eb4212c3780@starfivetech.com>
Date: Wed, 1 Feb 2023 15:31:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 6/7] riscv: dts: starfive: Add initial StarFive JH7110
 device tree
Content-Language: en-US
To: Icenowy Zheng <uwu@icenowy.me>, Conor Dooley <conor@kernel.org>
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
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <dda144a8397a175f3ce092485f08896c9a66d232.camel@icenowy.me>
X-Originating-IP: [183.27.97.127]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_233216_207599_A9C2A6F3 
X-CRM114-Status: UNSURE (   8.04  )
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

T24gVGh1LCAyOSBEZWMgMjAyMiAxMzoyNTowMCArMDgwMCwgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiDlnKggMjAyMi0xMi0yOOaYn+acn+S4ieeahCAyMjo0OCArMDAwMO+8jENvbm9yIERvb2xleeWG
memBk++8mgo+PiBIZXksCj4+IAo+PiBPbiBUdWUsIERlYyAyMCwgMjAyMiBhdCAwOToxMjo0NkFN
ICswODAwLCBIYWwgRmVuZyB3cm90ZToKWy4uLl0KPj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgVTc0XzE6IGNwdUAxIHsKPj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGNvbXBhdGlibGUgPSAic2lmaXZlLHU3NC1tYyIsICJyaXNjdiI7
Cj4+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWcg
PSA8MT47Cj4+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBkLWNhY2hlLWJsb2NrLXNpemUgPSA8NjQ+Owo+PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZC1jYWNoZS1zZXRzID0gPDY0PjsKPj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGQtY2FjaGUtc2l6ZSA9IDwz
Mjc2OD47Cj4+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBkLXRsYi1zZXRzID0gPDE+Owo+PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZC10bGItc2l6ZSA9IDw0MD47Cj4+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZpY2VfdHlwZSA9ICJjcHUiOwo+PiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaS1jYWNoZS1ibG9j
ay1zaXplID0gPDY0PjsKPj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGktY2FjaGUtc2V0cyA9IDw2ND47Cj4+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpLWNhY2hlLXNpemUgPSA8MzI3Njg+Owo+PiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaS10bGItc2V0cyA9
IDwxPjsKPj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGktdGxiLXNpemUgPSA8NDA+Owo+PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgbW11LXR5cGUgPSAicmlzY3Ysc3YzOSI7Cj4+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBuZXh0LWxldmVsLWNhY2hlID0gPCZj
Y2FjaGU+Owo+PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmlzY3YsaXNhID0gInJ2NjRpbWFmZGMiOwo+PiAKPj4gVGhhdCBhbHNvIGJlZ3MgdGhlIHF1
ZXN0aW9uOgo+PiBEbyB5b3VyIHU3NHMgc3VwcG9ydCBSVjY0R0JDLCBhcyB0aGUgKGN1cnJlbnQp
IFNpRml2ZSBkb2N1bWVudGF0aW9uCj4+IHN1Z2dlc3RzPwo+IAo+IEl0IHN1cHBvcnRzIFJWNjRH
Q1piYVpiYi4KPiAKPiBCIGlzIG5vdCBhIHdlbGwtZGVmaW5lZCB0aGluZyBieSBzcGVjaWZpY2F0
aW9ucywgc28gaXQgc2hvdWxkIGJlCj4gcHJldmVudGVkIGhlcmUuCgpUaGFuayB5b3UgZm9yIHlv
dXIga2luZGx5IHJlcGx5LgoKQmVzdCByZWdhcmRzLApIYWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
