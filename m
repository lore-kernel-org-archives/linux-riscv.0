Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C59C83F12
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 09:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AgYJZ63P+MX22ptd7HEK3L+7F3ZEa4+8fMAwf1rY+9E=; b=E0UrWCw01CRmHc
	WnHmR29z7+ZRK6n/DPfD07szXPajf77c7jM0yMYiiYHb5sWr8gVC7WTIpT/gTC19QT0L/xq/02qhq
	R+abzeKVHXXai9pQkwyq0bZxm0OohTqJ9t8xkn/Doqtyepd49bn/eqgfLS1JTWzX502HRrJSOd5DG
	t0bmlyOLADnOpNfjX59euzv9y9GUFAKhlGhxm4PB7xkMKab6J0Wip1ASzcYNolasWEjGeKmvLeSsn
	ssuyrg4O6sXXQ25kKVLOk+CURfWqKxqJsRHQyU4K774e2S9nSLyLKAVnycuJtLTRpH0/0cUI4uD0u
	9q3znDOuaiZYJhLTU/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qavF1-00BAKt-0B;
	Tue, 29 Aug 2023 09:42:31 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qavEw-00BAHq-22
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 09:42:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0CC2124E250;
	Tue, 29 Aug 2023 17:41:23 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Aug
 2023 17:41:23 +0800
Received: from [192.168.120.76] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Aug
 2023 17:41:21 +0800
Message-ID: <503bbb09-2886-9dbb-808a-65422bab712c@starfivetech.com>
Date: Tue, 29 Aug 2023 17:41:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC v4 4/4] riscv: dts: starfive: jh7100: Add PWM node and pins
 configuration
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>
References: <20230825081328.204442-1-william.qiu@starfivetech.com>
 <20230825081328.204442-5-william.qiu@starfivetech.com>
 <CAJM55Z-Ab1DAQyQC9TRFFBidus6wCRns9RQjx-iyYyNK1e-e6A@mail.gmail.com>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <CAJM55Z-Ab1DAQyQC9TRFFBidus6wCRns9RQjx-iyYyNK1e-e6A@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_024226_975213_4366E501 
X-CRM114-Status: GOOD (  10.10  )
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

CgpPbiAyMDIzLzgvMjkgMTc6MzgsIEVtaWwgUmVubmVyIEJlcnRoaW5nIHdyb3RlOgo+IE9uIEZy
aSwgMjUgQXVnIDIwMjMgYXQgMTA6MTYsIFdpbGxpYW0gUWl1IDx3aWxsaWFtLnFpdUBzdGFyZml2
ZXRlY2guY29tPiB3cm90ZToKPj4gQWRkIFN0YXJGaXZlIEpINzEwMCBQV00gY29udHJvbGxlciBu
b2RlIGFuZCBhZGQgUFdNIHBpbnMgY29uZmlndXJhdGlvbgo+PiBvbiBWaXNpb25GaXZlIDIgYm9h
cmQuCj4gCj4gSGkgV2lsbGlhbSwKPiAKPiBUaGlzIGlzIHRoZSBWaXNpb25GaXZlIFYxIGJvYXJk
IHJpZ2h0Pwo+IAo+IC9FbWlsCj4gCkhpIEVtaWwsCgpZZXPvvIwgaXQncyBWaXNpb25GaXZlIFYx
LCBJIHdyb3RlIGl0IHdyb25nLgoKQi5SLgpXaWxsaWFtCj4+IFNpZ25lZC1vZmYtYnk6IFdpbGxp
YW0gUWl1IDx3aWxsaWFtLnFpdUBzdGFyZml2ZXRlY2guY29tPgo+PiAtLS0KPj4gIC4uLi9ib290
L2R0cy9zdGFyZml2ZS9qaDcxMDAtY29tbW9uLmR0c2kgICAgICB8IDI0ICsrKysrKysrKysrKysr
KysrKysKPj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTAwLmR0c2kgICAgICB8
ICA5ICsrKysrKysKPj4gIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMDAtY29tbW9uLmR0
c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEwMC1jb21tb24uZHRzaQo+PiBp
bmRleCBiOTNjZTM1MWE5MGYuLjc0Njg2N2I4ODJiMCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMDAtY29tbW9uLmR0c2kKPj4gKysrIGIvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMDAtY29tbW9uLmR0c2kKPj4gQEAgLTg0LDYgKzg0LDI0
IEBAIEdQT19JMkMyX1BBRF9TREFfT0VOLAo+PiAgICAgICAgICAgICAgICAgfTsKPj4gICAgICAg
ICB9Owo+Pgo+PiArICAgICAgIHB3bV9waW5zOiBwd20tMCB7Cj4+ICsgICAgICAgICAgICAgICBw
d20tcGlucyB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHBpbm11eCA9IDxHUElPTVVYKDcs
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHUE9fUFdNX1BBRF9PVVRfQklU
MCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdQT19QV01fUEFEX09FX05f
QklUMCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdQSV9OT05FKT4sCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHUElPTVVYKDUsCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBHUE9fUFdNX1BBRF9PVVRfQklUMSwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdQT19QV01fUEFEX09FX05fQklUMSwKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdQSV9OT05FKT47Cj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGJpYXMtZGlzYWJsZTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZHJp
dmUtc3RyZW5ndGggPSA8MzU+Owo+PiArICAgICAgICAgICAgICAgICAgICAgICBpbnB1dC1kaXNh
YmxlOwo+PiArICAgICAgICAgICAgICAgICAgICAgICBpbnB1dC1zY2htaXR0LWRpc2FibGU7Cj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIHNsZXctcmF0ZSA9IDwwPjsKPj4gKyAgICAgICAgICAg
ICAgIH07Cj4+ICsgICAgICAgfTsKPj4gKwo+PiAgICAgICAgIHVhcnQzX3BpbnM6IHVhcnQzLTAg
ewo+PiAgICAgICAgICAgICAgICAgcngtcGlucyB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAg
IHBpbm11eCA9IDxHUElPTVVYKDEzLCBHUE9fTE9XLCBHUE9fRElTQUJMRSwKPj4gQEAgLTE1NCw2
ICsxNzIsMTIgQEAgJm9zY19hdWQgewo+PiAgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwyNzAw
MDAwMD47Cj4+ICB9Owo+Pgo+PiArJnB0YyB7Cj4+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsKPj4gKyAgICAgICBwaW5jdHJsLTAgPSA8JnB3bV9waW5zPjsKPj4gKyAgICAgICBz
dGF0dXMgPSAib2theSI7Cj4+ICt9Owo+PiArCj4+ICAmdWFydDMgewo+PiAgICAgICAgIHBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+ICAgICAgICAgcGluY3RybC0wID0gPCZ1YXJ0M19waW5z
PjsKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTAwLmR0
c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEwMC5kdHNpCj4+IGluZGV4IDQy
MTg2MjFlYTNiOS4uN2Y1YmIxOWU2MzZlIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3N0YXJmaXZlL2poNzEwMC5kdHNpCj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3Rh
cmZpdmUvamg3MTAwLmR0c2kKPj4gQEAgLTI0OCw1ICsyNDgsMTQgQEAgd2F0Y2hkb2dAMTI0ODAw
MDAgewo+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JnJzdGdlbiBKSDcxMDBf
UlNUTl9XRFRJTUVSX0FQQj4sCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwm
cnN0Z2VuIEpINzEwMF9SU1ROX1dEVD47Cj4+ICAgICAgICAgICAgICAgICB9Owo+PiArCj4+ICsg
ICAgICAgICAgICAgICBwdGM6IHB3bUAxMjQ5MDAwMCB7Cj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAic3RhcmZpdmUsamg3MTAwLXB3bSI7Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDAgMHgxMjQ5MDAwMCAweDAgMHgxMDAwMD47Cj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xrZ2VuIEpINzEwMF9DTEtfUFdNX0FQQj47Cj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJlc2V0cyA9IDwmcnN0Z2VuIEpINzEwMF9SU1ROX1BX
TV9BUEI+Owo+PiArICAgICAgICAgICAgICAgICAgICAgICAjcHdtLWNlbGxzID0gPDM+Owo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiArICAgICAgICAg
ICAgICAgfTsKPj4gICAgICAgICB9Owo+PiAgfTsKPj4gLS0KPj4gMi4zNC4xCj4+Cj4+Cj4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
