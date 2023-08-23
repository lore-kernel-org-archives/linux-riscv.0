Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97BDEE49A0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EkZoUSocIBpGsIA8N+mwBsOkxPFYZ/asN1TGPAHkoE=; b=LFjFQ2LlEVXLlEl7OAULBUptnv
	dJRzHD7IHMlNvtYt6TQOdpqUfWxIlfUnRoSPd6nZ2TSSjKtsqAhtmYUUL8T6YuNcMwDBdG5m1Sw4X
	s/1xKlxv+ddKRH6NSrnXGaV4pEJ3Cqfd+aND2McPqr2Ybhc5QuUH5nABnS67d0fDqc6ITHRiIh0Na
	Hx4ioz6aFx+qkXlw80ow9L2bpRG312uX0MMIYgpVLhW/bgHh2VQeXRpJrFxVf2sxWxFy0KGE8FSsu
	kuARFd9g9M0OydKRxPP8ojTBn0MYp6NnotUDevFKx7suQtEEBUgEe0pYC9Uy0aLmZ10onjAFsRImE
	s6H+i8Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYmMn-000TZM-2j;
	Wed, 23 Aug 2023 11:49:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYmMj-000TYP-33;
	Wed, 23 Aug 2023 11:49:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6885F1042;
	Wed, 23 Aug 2023 04:50:11 -0700 (PDT)
Received: from [10.57.34.103] (unknown [10.57.34.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD2403F64C;
	Wed, 23 Aug 2023 04:49:26 -0700 (PDT)
Message-ID: <0fdf4f0b-64e4-9831-36b8-a00d4cbd131a@arm.com>
Date: Wed, 23 Aug 2023 12:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
To: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCo0YPQsdC40L0=?=
 <privatesub2@gmail.com>
References: <20230814133238.741950-1-privatesub2@gmail.com>
 <20230814133238.741950-2-privatesub2@gmail.com>
 <20230822104854.1fa5f1aa@donnerap.manchester.arm.com>
 <CAF4idNneb1=40mQC=593Tmy8_OUAGiL4ROjK2XyL2BA35vM_WA@mail.gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAF4idNneb1=40mQC=593Tmy8_OUAGiL4ROjK2XyL2BA35vM_WA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_044938_102302_A24410D7 
X-CRM114-Status: GOOD (  21.42  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMy8wOC8yMDIzIDA3OjU3LCDQkNC70LXQutGB0LDQvdC00YAg0KjRg9Cx0LjQvSB3
cm90ZToKPiBIaSBBbmRyZSwKPiAKPiDQstGCLCAyMiDQsNCy0LMuIDIwMjPigK/Qsy4g0LIgMTI6
NDksIEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBhcm0uY29tPjoKPj4KPj4gT24gTW9u
LCAxNCBBdWcgMjAyMyAxNjozMjoxNiArMDMwMAo+PiBBbGVrc2FuZHIgU2h1YmluIDxwcml2YXRl
c3ViMkBnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBIaSBBbGVrc2FuZHIsCj4+Cj4+PiBBbGx3aW5u
ZXIncyBEMSwgVDExMy1TMyBhbmQgUjMyOSBTb0NzIGhhdmUgYSBuZXcgcHdtCj4+PiBjb250cm9s
bGVyIHdpdGNoIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBwcmV2aW91cyBwd20tc3VuNGkuCj4+Pgo+
Pj4gVGhlIEQxIGFuZCBUMTEzIGFyZSBpZGVudGljYWwgaW4gdGVybXMgb2YgcGVyaXBoZXJhbHMs
Cj4+PiB0aGV5IGRpZmZlciBvbmx5IGluIHRoZSBhcmNoaXRlY3R1cmUgb2YgdGhlIENQVSBjb3Jl
LCBhbmQKPj4+IGV2ZW4gc2hhcmUgdGhlIG1ham9yaXR5IG9mIHRoZWlyIERULiBCZWNhdXNlIG9m
IHRoYXQsCj4+PiB1c2luZyB0aGUgc2FtZSBjb21wYXRpYmxlIG1ha2VzIHNlbnNlLgo+Pj4gVGhl
IFIzMjkgaXMgYSBkaWZmZXJlbnQgU29DIHRob3VnaCwgYW5kIHNob3VsZCBoYXZlCj4+PiBhIGRp
ZmZlcmVudCBjb21wYXRpYmxlIHN0cmluZyBhZGRlZCwgZXNwZWNpYWxseSBhcyB0aGVyZQo+Pj4g
aXMgYSBkaWZmZXJlbmNlIGluIHRoZSBudW1iZXIgb2YgY2hhbm5lbHMuCj4+Pgo+Pj4gRDEgYW5k
IFQxMTNzIFNvQ3MgaGF2ZSBvbmUgUFdNIGNvbnRyb2xsZXIgd2l0aCA4IGNoYW5uZWxzLgo+Pj4g
UjMyOSBTb0MgaGFzIHR3byBQV00gY29udHJvbGxlcnMgaW4gYm90aCBwb3dlciBkb21haW5zLCBv
bmUgb2YKPj4+IHRoZW0gaGFzIDkgY2hhbm5lbHMgKENQVVggb25lKSBhbmQgdGhlIG90aGVyIGhh
cyA2IChDUFVTIG9uZSkuCj4+Pgo+Pj4gQWRkIGEgZGV2aWNlIHRyZWUgYmluZGluZyBmb3IgdGhl
bS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2FuZHIgU2h1YmluIDxwcml2YXRlc3ViMkBn
bWFpbC5jb20+Cj4+PiAtLS0KPj4+ICAgLi4uL2JpbmRpbmdzL3B3bS9hbGx3aW5uZXIsc3VuMjBp
LXB3bS55YW1sICAgIHwgODUgKysrKysrKysrKysrKysrKysrKwo+Pj4gICAxIGZpbGUgY2hhbmdl
ZCwgODUgaW5zZXJ0aW9ucygrKQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9hbGx3aW5uZXIsc3VuMjBpLXB3bS55YW1sCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vYWxs
d2lubmVyLHN1bjIwaS1wd20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9wd20vYWxsd2lubmVyLHN1bjIwaS1wd20ueWFtbAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uOTUxMmQ0YmVkMzIyCj4+PiAtLS0gL2Rldi9udWxsCj4+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL2FsbHdpbm5lcixz
dW4yMGktcHdtLnlhbWwKPj4+IEBAIC0wLDAgKzEsODUgQEAKPj4+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPj4+ICslWUFNTCAxLjIK
Pj4+ICstLS0KPj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3B3bS9hbGx3
aW5uZXIsc3VuMjBpLXB3bS55YW1sIwo+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4gKwo+Pj4gK3RpdGxlOiBBbGx3aW5uZXIgRDEs
IFQxMTMtUzMgYW5kIFIzMjkgUFdNCj4+PiArCj4+PiArbWFpbnRhaW5lcnM6Cj4+PiArICAtIEFs
ZWtzYW5kciBTaHViaW4gPHByaXZhdGVzdWIyQGdtYWlsLmNvbT4KPj4+ICsKPj4+ICtwcm9wZXJ0
aWVzOgo+Pj4gKyAgY29tcGF0aWJsZToKPj4+ICsgICAgb25lT2Y6Cj4+PiArICAgICAgLSBjb25z
dDogYWxsd2lubmVyLHN1bjIwaS1kMS1wd20KPj4+ICsgICAgICAtIGl0ZW1zOgo+Pj4gKyAgICAg
ICAgICAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuMjBpLXIzMjktcHdtCj4+PiArICAgICAgICAgIC0g
Y29uc3Q6IGFsbHdpbm5lcixzdW4yMGktZDEtcHdtCj4+PiArCj4+PiArICByZWc6Cj4+PiArICAg
IG1heEl0ZW1zOiAxCj4+PiArCj4+PiArICAiI3B3bS1jZWxscyI6Cj4+PiArICAgIGNvbnN0OiAz
Cj4+PiArCj4+PiArICBjbG9ja3M6Cj4+PiArICAgIGl0ZW1zOgo+Pj4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IDI0IE1IeiBvc2NpbGxhdG9yCj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogQnVzIENs
b2NrCj4+Cj4+IFRoZSBtYW51YWwgdGVsbHMgbWUgdGhhdCB0aGUgbmV3IFBXTXMgY2FuIGFsc28g
dXNlIEFQQjAgYXMgdGhlCj4+IGlucHV0IGNsb2NrLCB3aGljaCAoZmluYWxseSEpIGFsbG93cyBQ
V00gZnJlcXVlbmNpZXMgYWJvdmUgMjQgTUh6Lgo+PiBTbyB3ZSBzaG91bGQgaGF2ZSBhbiBleHBs
aWNpdCByZWZlcmVuY2UgdG8gdGhhdCBjbG9jayAtIGV2ZW4gaWYgdGhlIGJ1cwo+PiBjbG9jayBo
YXBwZW5zIHRvIGJlIGdhdGVkIHZlcnNpb24gb2YgQVBCMC4KPiAKPiBTaG91bGQgSSBjaGFuZ2Ug
aXQgdG8gc29tZXRoaW5nIGxpa2UgdGhpczoKPiAgICAgIHB3bTogcHdtQDIwMDBjMDAgewo+ICAg
ICAgICBjb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW4yMGktZDEtcHdtIjsKPiAgICAgICAgcmVn
ID0gPDB4MDIwMDBjMDAgMHg0MDA+Owo+ICAgICAgICBjbG9ja3MgPSA8JmNjdSBDTEtfQlVTX1BX
TT4sIDwmZGN4bz4sIDwmY2N1IENMS19BUEIwPjsKPiAgICAgICAgY2xvY2stbmFtZXMgPSAiYnVz
IiwgImhvc2MiLCAiYXBiMCI7Cj4gICAgICAgIHJlc2V0cyA9IDwmY2N1IFJTVF9CVVNfUFdNPjsK
PiAgICAgICAgI3B3bS1jZWxscyA9IDwweDM+Owo+ICAgICAgfTsKClllcywgdGhhdCBpcyB3aGF0
IEkgaGFkIGluIG1pbmQhCkl0IHNob3VsZG4ndCBiZSB0b28gaGFyZCB0byBhZGQgc3VwcG9ydCBm
b3IgdGhpcyBpbiB0aGUgZHJpdmVyIGFzIHdlbGwuCgpUaGFua3MhCkFuZHJlCgo+IAo+Pgo+PiBD
aGVlcnMsCj4+IEFuZHJlCj4+Cj4+PiArCj4+PiArICBjbG9jay1uYW1lczoKPj4+ICsgICAgaXRl
bXM6Cj4+PiArICAgICAgLSBjb25zdDogaG9zYwo+Pj4gKyAgICAgIC0gY29uc3Q6IGJ1cwo+Pj4g
Kwo+Pj4gKyAgcmVzZXRzOgo+Pj4gKyAgICBtYXhJdGVtczogMQo+Pj4gKwo+Pj4gKyAgYWxsd2lu
bmVyLHB3bS1jaGFubmVsczoKPj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvdWludDMyCj4+PiArICAgIGRlc2NyaXB0aW9uOiBUaGUgbnVtYmVyIG9mIFBXTSBj
aGFubmVscyBjb25maWd1cmVkIGZvciB0aGlzIGluc3RhbmNlCj4+PiArICAgIGVudW06IFs2LCA5
XQo+Pj4gKwo+Pj4gK2FsbE9mOgo+Pj4gKyAgLSAkcmVmOiBwd20ueWFtbCMKPj4+ICsKPj4+ICsg
IC0gaWY6Cj4+PiArICAgICAgcHJvcGVydGllczoKPj4+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4+
PiArICAgICAgICAgIGNvbnRhaW5zOgo+Pj4gKyAgICAgICAgICAgIGNvbnN0OiBhbGx3aW5uZXIs
c3VuMjBpLXIzMjktcHdtCj4+PiArCj4+PiArICAgIHRoZW46Cj4+PiArICAgICAgcmVxdWlyZWQ6
Cj4+PiArICAgICAgICAtIGFsbHdpbm5lcixwd20tY2hhbm5lbHMKPj4+ICsKPj4+ICsgICAgZWxz
ZToKPj4+ICsgICAgICBwcm9wZXJ0aWVzOgo+Pj4gKyAgICAgICAgYWxsd2lubmVyLHB3bS1jaGFu
bmVsczogZmFsc2UKPj4+ICsKPj4+ICt1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4+PiAr
Cj4+PiArcmVxdWlyZWQ6Cj4+PiArICAtIGNvbXBhdGlibGUKPj4+ICsgIC0gcmVnCj4+PiArICAt
ICIjcHdtLWNlbGxzIgo+Pj4gKyAgLSBjbG9ja3MKPj4+ICsgIC0gY2xvY2stbmFtZXMKPj4+ICsg
IC0gcmVzZXRzCj4+PiArCj4+PiArZXhhbXBsZXM6Cj4+PiArICAtIHwKPj4+ICsgICAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3N1bjIwaS1kMS1jY3UuaD4KPj4+ICsgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL3Jlc2V0L3N1bjIwaS1kMS1jY3UuaD4KPj4+ICsKPj4+ICsgICAgcHdtOiBw
d21AMjAwMGMwMCB7Cj4+PiArICAgICAgY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuMjBpLWQx
LXB3bSI7Cj4+PiArICAgICAgcmVnID0gPDB4MDIwMDBjMDAgMHg0MDA+Owo+Pj4gKyAgICAgIGNs
b2NrcyA9IDwmZGN4bz4sIDwmY2N1IENMS19CVVNfUFdNPjsKPj4+ICsgICAgICBjbG9jay1uYW1l
cyA9ICJob3NjIiwgImJ1cyI7Cj4+PiArICAgICAgcmVzZXRzID0gPCZjY3UgUlNUX0JVU19QV00+
Owo+Pj4gKyAgICAgICNwd20tY2VsbHMgPSA8MHgzPjsKPj4+ICsgICAgfTsKPj4+ICsKPj4+ICsu
Li4KPj4KPiAKPiBDaGVlcnMsCj4gQWxla3NhbmRyCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
