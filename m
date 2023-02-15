Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BE6C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 11:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pw1IxSJEHLmRloTBrym8eko6TwGVBqXh9RlcOe6O6vY=; b=G09A4sKSXzTTOp
	yrh9b34mWKVDm7uPI3xyGJbNvkI/DpJ4xSMpkTZhkgMNHDF8oiNffvo/I8uMwo8muDpr5OOMAHzgn
	ZFKxIMLXHTJTokLJt4wes4MNF6NH3hKbovWgQXMt80zqV9D3IbelOspBB99fu9hHuCkiI4vCZm0Zf
	pewDAC/m5UWWLbyMKO5GUy6qhLasKgdRjJ7xxyIj8YzViD+Ns0hC6yvbbdUFNC+K05KCpZQMZVuis
	MTIw4SxXpEhSAykzYE+6VvTGscYREes7PpobsEIHgWvNUswz7zoZqlQCgx9+B1k/Tv2WRB9Hnb/hB
	oezqlZPvZRd/GAtLB6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGKA-005f7x-HM; Wed, 15 Feb 2023 11:51:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGJz-005f4p-0a; Wed, 15 Feb 2023 11:51:36 +0000
Received: from [192.168.1.90] (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 319A86602181;
	Wed, 15 Feb 2023 11:51:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676461890;
	bh=QSCp6bo6FjxCSjfy/l3o4z89Z1La9kTv6gN3Uu+EpL4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A4rqdwtauXFIbQbOGHfLvjjQ6dlZiEqLF0CG/sWghsauCpAP2mXYKVMwkBAi8uEqZ
	 WyAnVKG1j4VGABIVUzHJKddu8kq1OX83D1bLDMHtGsHI0oTkwtBXfMA4Hpi9kWPQHQ
	 SEL0utAZxVaMKf2Rn3/aUwiy2nTVGox5FI2O/ZIxZdnaanRmdNZIk8hG7PXJMdadHn
	 7p01MjXuIbSf0cggW1k1sHvKuqRRXNk2UdSqWWaS2ECm5wmKJXU5+bWLLesiDLkBTy
	 0Qf3noLv63LboE1TWJ1VuVVP0d2wQjP+LjbDiK6j9PO8YUdgtvqbiop5Cg/d3aw3Ar
	 FDekpJ+BswxCw==
Message-ID: <68708ef5-9a7f-b7e5-a7a0-e08f6d5ae3a3@collabora.com>
Date: Wed, 15 Feb 2023 13:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 08/12] net: stmmac: Add glue layer for StarFive JH7100 SoC
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
 <Y+e+N/aiqCctIp6e@lunn.ch>
 <d1769dac-9e80-2f0d-6a5c-386ef70e1547@collabora.com>
 <CAJM55Z8Uq2ZU3KvJZKDLZUJDLEyvHjCRJKcYn5CAOR0c2rhT7Q@mail.gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAJM55Z8Uq2ZU3KvJZKDLZUJDLEyvHjCRJKcYn5CAOR0c2rhT7Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_035135_291313_A8909C95 
X-CRM114-Status: GOOD (  17.94  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi8xNS8yMyAxMzoyMCwgRW1pbCBSZW5uZXIgQmVydGhpbmcgd3JvdGU6Cj4gT24gV2VkLCAx
NSBGZWIgMjAyMyBhdCAwMTowOSwgQ3Jpc3RpYW4gQ2lvY2FsdGVhCj4gPGNyaXN0aWFuLmNpb2Nh
bHRlYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPj4KPj4gT24gMi8xMS8yMyAxODoxMSwgQW5kcmV3
IEx1bm4gd3JvdGU6Cj4+Pj4gKwo+Pj4+ICsjZGVmaW5lIEpINzEwMF9TWVNNQUlOX1JFR0lTVEVS
MjggMHg3MAo+Pj4+ICsvKiBUaGUgdmFsdWUgYmVsb3cgaXMgbm90IGEgdHlwbywganVzdCByZWFs
bHkgYmFkIG5hbWluZyBieSBTdGFyRml2ZSDCr1xfKOODhClfL8KvICovCj4+Pj4gKyNkZWZpbmUg
Skg3MTAwX1NZU01BSU5fUkVHSVNURVI0OSAweGM4Cj4+Pgo+Pj4gU2VlbXMgbGlrZSB0aGUgY29t
bWVudCBzaG91bGQgYmUgb25lIGxpbmUgZWFybGllcj8KPiAKPiBXZWxsIHllcywgdGhlIHZlcnkg
Z2VuZXJpYyByZWdpc3RlciBuYW1lcyBhcmUgYWxzbyBiYWQsIGJ1dCB0aGlzCj4gY29tbWVudCBy
ZWZlcnMgdG8gdGhlIGZhY3QgdGhhdCBpdCBraW5kIG9mIG1ha2VzIHNlbnNlIHRoYXQgcmVnaXN0
ZXIKPiAyOCBoYXMgdGhlIG9mZnNldAo+ICAgIDI4ICogNCBieXRlcyBwci4gcmVnaXN0ZXIgPSAw
eDcwCj4gLi5idXQgdGhlbiByZWdpc3RlciA0OSBpcyBvZGRseSBvdXQgb2YgcGxhY2UgYXQgb2Zm
c2V0IDB4YzggaW5zdGVhZCBvZgo+ICAgIDQ5ICogNCBieXRlcyBwci4gcmVnaXN0ZXIgPSAweGM0
Cj4gCj4+PiBUaGVyZSBpcyB2YWx1ZSBpbiBiYXNpbmcgdGhlIG5hbWVzIG9uIHRoZSBkYXRhc2hl
ZXQsIGJ1dCB5b3UgY291bGQKPj4+IGFwcGVuZCBzb21ldGhpbmcgbWVhbmluZ2Z1bCBvbiB0aGUg
ZW5kOgo+Pj4KPj4+ICNkZWZpbmUgSkg3MTAwX1NZU01BSU5fUkVHSVNURVI0OV9ETFlDSEFJTiAw
eGM4Cj4+Cj4+IFVuZm9ydHVuYXRlbHkgdGhlIEpINzEwMCBkYXRhc2hlZXQgSSBoYXZlIGFjY2Vz
cyB0byBkb2Vzbid0IHByb3ZpZGUgYW55Cj4+IGluZm9ybWF0aW9uIHJlZ2FyZGluZyB0aGUgU1lT
Q1RSTC1NQUlOU1lTIHJlbGF0ZWQgcmVnaXN0ZXJzLiBNYXliZSBFbWlsCj4+IGNvdWxkIHByb3Zp
ZGUgc29tZSBkZXRhaWxzIGhlcmU/Cj4gCj4gVGhpcyBpcyByZXZlcnNlIGVuZ2luZWVyZWQgZnJv
bSB0aGUgYXV0byBnZW5lcmF0ZWQgaGVhZGVycyBpbiB0aGVpciB1LWJvb3Q6Cj4gaHR0cHM6Ly9n
aXRodWIuY29tL3N0YXJmaXZlLXRlY2gvdS1ib290L2Jsb2IvSkg3MTAwX1Zpc2lvbkZpdmVfZGV2
ZWwvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hcmNoLWpoNzEwMC9zeXNjb25fc3lzbWFpbl9jdHJs
X21hY3JvLmgKPiAKPiBDaHJpc3RpYW4sIEknbSBoYXBweSB0aGF0IHlvdSdyZSB3b3JraW5nIG9u
IHRoaXMsIGJ1dCBtZXNzIGxpa2UgdGhpcwo+IGFuZCB3YWl0aW5nIGZvciB0aGUgbm9uLWNvaGVy
ZW50IGRtYSB0byBiZSBzb3J0ZWQgaXMgd2h5IEkgZGlkbid0IHNlbmQKPiBpdCB1cHN0cmVhbSB5
ZXQuCgpUaGFuayB5b3UgZm9yIGNsYXJpZnlpbmcgdGhpcyBhbmQgZm9yIGFsbCB0aGUgd29yayB5
b3UgaGF2ZSBkb25lIHNvIGZhciwgCkVtaWwhIElmIHlvdSBkb24ndCBtaW5kLCBJIHdvdWxkIGJl
IGdsYWQgdG8gY29udGludWUgaGVscGluZyB3aXRoIHRoaXMgCm1haW5saW5pbmcgZWZmb3J0LgoK
Pj4+PiArICAgIGlmICghb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJzdGFyZml2ZSxndHhjbGst
ZGx5Y2hhaW4iLCAmZ3R4Y2xrX2RseWNoYWluKSkgewo+Pj4+ICsgICAgICAgICAgICByZXQgPSBy
ZWdtYXBfd3JpdGUoc3lzbWFpbiwgSkg3MTAwX1NZU01BSU5fUkVHSVNURVI0OSwgZ3R4Y2xrX2Rs
eWNoYWluKTsKPj4+PiArICAgICAgICAgICAgaWYgKHJldCkKPj4+PiArICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImVycm9yIHNlbGVjdGluZyBndHhj
bGsgZGVsYXkgY2hhaW5cbiIpOwo+Pj4+ICsgICAgfQo+Pj4KPj4+IFlvdSBzaG91bGQgcHJvYmFi
bHkgZG9jdW1lbnQgdGhhdCBpZiBzdGFyZml2ZSxndHhjbGstZGx5Y2hhaW4gaXMgbm90Cj4+PiBm
b3VuZCBpbiB0aGUgRFQgYmxvYiwgdGhlIHZhbHVlIGZvciB0aGUgZGVsYXkgY2hhaW4gaXMgdW5k
ZWZpbmVkLiAgSXQKPj4+IHdvdWxkIGFjdHVhbGx5IGJlIGJldHRlciB0byBkZWZpbmUgaXQsIHNl
dCBpdCB0byAwIGZvciBleGFtcGxlLiBUaGF0Cj4+PiB3YXksIHlvdSBrbm93IHlvdSBkb24ndCBo
YXZlIGFueSBkZXBlbmRlbmN5IG9uIHRoZSBib290bG9hZGVyIGZvcgo+Pj4gZXhhbXBsZS4KPj4K
Pj4gU3VyZSwgSSB3aWxsIHNldCBpdCB0byAwLgo+Pgo+Pj4KPj4+ICAgICAgICBBbmRyZXcKPj4K
Pj4gVGhhbmtzIGZvciByZXZpZXdpbmcsCj4+IENyaXN0aWFuCj4+Cj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
