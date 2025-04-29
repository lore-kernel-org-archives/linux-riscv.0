Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA61FC369CB
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 07:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDa8AaZvvuMzjAUZV1gXYeR2NLGPBYKh1A07dJSMCFM=; b=iyo7xBHgcpkU+n
	WBRTJGBWnUwJ5U5OtxYIjSUlXzA1V0D0xXv7SHHjmJz4WeAWPt45uDt1GGilk3AciVMQEybGgWa4M
	9TR6pizXEE5YvBh5AIkAiJOUUcQfHCLXtkdKWqm8gom7EMO1ldR41FXfmYj0XHxJ6sBDhWsr4F0q8
	PKVcfJKaXNRsm36NUkpV8txf9y2430LiSpAsZnlwFDObh9aVZ0BKq0VvO7FAhL+AKWoU3SrGaqIFZ
	z9iO3TBCx/a4aL66OeTkRI6rkSGWy529+BBV2ReeaBqfn7zALSeGBP7AzdhaitUZvr+I106bLNj+R
	nArfln7w45cBBOuIs2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fY6-00000008mij-1Sdv;
	Tue, 29 Apr 2025 07:38:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fRU-00000008lQf-2G4W
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 07:31:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7FCAA4BB7E;
	Tue, 29 Apr 2025 07:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB11C4CEED;
	Tue, 29 Apr 2025 07:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745911907;
	bh=+Ra7eiVnRMvz3bu+XMGnkDoV2DxZqls35juBwjq/aqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rRNfnjM/15pgy34+JQ9Iy5PoTHpdSnt1B8gg00nnFI2G6Pt0QmlbQkA6sSEGqZnpS
	 L/unUBvrGxe2ei5UGlPGM+o73p4QqpNX5FVyn4vXFoDQdsZ4tGwA/7HNqb12FA3xy0
	 4fbKxx5SoShdjBvZLpyOMnnBKM/LbUqhs9XM3GFPlZudq/FeUYPYP/WdOkPrwjAy5o
	 HCO6YEgFQkFTOOLdKNxm1bu5hdS708ZPGj1uWuP67T7ZWB6LjT87f/spEpuKTVrHTn
	 D/kj0rJRE6Y9LKxp0cdczQPFS1bLG4ELao+23UFfo9RudyXpBb/H/wANZwWMReATS/
	 +PVWFxi5pLPrw==
Message-ID: <8e131fce-12b6-4a5f-8601-c15a0e4290fe@kernel.org>
Date: Tue, 29 Apr 2025 09:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250424062017.652969-1-uwu@icenowy.me>
 <20250424062017.652969-2-uwu@icenowy.me>
 <20250428-smiling-azure-sunfish-7c1c25@kuoka>
 <34c92033f4bbf289c6048a85f0f6ba04435e7bf8.camel@icenowy.me>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <34c92033f4bbf289c6048a85f0f6ba04435e7bf8.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_003148_745668_516B8AA8 
X-CRM114-Status: UNSURE (   8.26  )
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

T24gMjgvMDQvMjAyNSAxMDo0MCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiDlnKggMjAyNS0wNC0y
OOaYn+acn+S4gOeahCAwOToyMCArMDIwMO+8jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoK
Pj4gT24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMDI6MjA6MTVQTSBHTVQsIEljZW5vd3kgWmhlbmcg
d3JvdGU6Cj4+PiBUaGUgSkg3MTEwIFNvQyBjb3VsZCBzdXBwb3J0IGludGVybmFsIEdQSSBzaWdu
YWxzIHRvIGJlIHJvdXRlZCB0bwo+Pj4gbm90Cj4+PiBleHRlcm5hbCBHUElPIGJ1dCBpbnRlcm5h
bCBsb3cvaGlnaCBsZXZlbHMuCj4+Pgo+Pj4gQWRkIHR3byBtYWNyb3MsIFBBRF9JTlRFUk5BTF9M
T1cgYW5kIFBBRF9JTlRFUk5BTF9ISUdILCBhcyB0d28KPj4+IHZpcnR1YWwKPj4+ICJwYWRzIiB0
byByZXByZXNlbnQgaW50ZXJuYWwgR1BJIHNvdXJjZXMgd2l0aCBmaXhlZCBsb3cvaGlnaAo+Pj4g
bGV2ZWxzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5
Lm1lPgo+Pj4gLS0tCj4+PiDCoGluY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdGFyZml2ZSxq
aDcxMTAtcGluY3RybC5oIHwgNCArKysrCj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3N0
YXJmaXZlLGpoNzExMC1waW5jdHJsLmgKPj4+IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJs
L3N0YXJmaXZlLGpoNzExMC1waW5jdHJsLmgKPj4+IGluZGV4IDM4NjVmMDEzOTYzOTUuLjNjY2E4
NzRiMmJlZjcgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0cmwvc3Rh
cmZpdmUsamg3MTEwLXBpbmN0cmwuaAo+Pj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5j
dHJsL3N0YXJmaXZlLGpoNzExMC1waW5jdHJsLmgKPj4+IEBAIC0xMjYsNiArMTI2LDEwIEBACj4+
PiDCoCNkZWZpbmXCoMKgwqDCoMKgwqDCoMKgUEFEX0dNQUMwX1RYRU7CoMKgwqDCoMKgwqDCoMKg
wqDCoDE4Cj4+PiDCoCNkZWZpbmXCoMKgwqDCoMKgwqDCoMKgUEFEX0dNQUMwX1RYQ8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAxOQo+Pj4gwqAKPj4+ICsvKiB2aXJ0dWFsIHBpbnMgZm9yIGZvcmNpbmcg
R1BJICovCj4+PiArI2RlZmluZSBQQURfSU5URVJOQUxfTE9XwqDCoMKgwqDCoMKgwqAyNTQKPj4+
ICsjZGVmaW5lIFBBRF9JTlRFUk5BTF9ISUdIwqDCoMKgwqDCoMKgMjU1Cj4+Cj4+IFdoeSB0aGlz
IGNhbm5vdCBiZSAyMCBhbmQgMjE/IFRoZXNlIGFyZSBub3QgdmFsdWVzIGZvciByZWdpc3RlcnMs
IGJ1dAo+PiBhYnN0cmFjdCBudW1iZXJzLgo+IAo+IFRoZSBudW1iZXIgbXVzdCBub3QgY29sbGlk
ZSB3aXRoIFNZUyBHUElPIHBhZHMgdG9vLgoKVGhlcmUgYXJlIG5vIFNZUyBHUElPIHBhZHMgaGVy
ZS4gRG8geW91IHVuZGVyc3RhbmQgdGhhdCB0aGlzIGlzIG5vdAp2YWx1ZSBmb3IgcmVnaXN0ZXJz
PwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
