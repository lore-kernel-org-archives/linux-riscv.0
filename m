Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A252C6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 08:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ZTh0n4ypPiihRdxoeSiFTY95EWOOD053783QdHtF3Y=; b=Zc2toZVwZF6gXI
	avrGb4HMU2OF2LFN68BXXWWbqJDgyYNSnbfCb6DVW7j1yABgvKswcaaQKJINmnWNLKVBE7tXPt/3Q
	kLqTKvfcyH5yOfXbWfCYa9uvvOCVk57aeIHqv8ma2ZFCySUFiAleCD2sftla0bTnRi4U5RNunUtun
	ZJ+lhAc20NZ5o2DxQ2/2Re5eKptSL+lIO4gOOszfKscwhDEV8pI7u2kRbV/ojE767yRzozDoDGP51
	dtq7WPkzM2ndVxuHx9OV551p9/IJ4hey5AJq+t64sLrEPU0TOnaG/V0SKpmPG8woNVtW8W8en94UE
	WSzFVUCNWoJw4YKDI4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1petOr-00F58j-1Y;
	Wed, 22 Mar 2023 08:00:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1petOo-00F57x-2z;
	Wed, 22 Mar 2023 08:00:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF74961F8B;
	Wed, 22 Mar 2023 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5A8C433EF;
	Wed, 22 Mar 2023 08:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679472045;
	bh=OPBzJ3ESn40XjiD47ERlPzCtyE6tmr23jVFGgtzDlzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cFB92XFWfMe9jdN3oEbs9KjCEF4JTb3tuoL2wgVN9oNmOgIhGQZgmXf7cJAVgeLkp
	 S6J4XAY5Mf9A7zY2t0Up/hIxNjuBrUe4RVrEvzhaS371c+HGRAGdGAzS77CL2aNHGj
	 +mZK2Ylyv8vxjN/vVJRIgzCO69Iv1kj8HeVekHu+i+/xkGRv4f0LBH8LQGDkOJOkjl
	 NsDueagEQtTiPPkY0PDYCA5E6Aq53PE/RbUJAWU6eWP21wuyAfyZe43ignONksLl2D
	 S89RGNUNLmv8scPcERlG60sGMpN5siKy/i1CVyHgrmuvqB262vbmSROkxqyOTn47TG
	 nGr/vuhhwaxgA==
Message-ID: <c3d32c0c-43e0-ee62-d372-27cb09feb82e@kernel.org>
Date: Wed, 22 Mar 2023 10:00:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 5/5] dts: usb: add StarFive JH7110 USB dts
 configuration.
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>, Rob Herring <robh@kernel.org>,
 Pawel Laszczak <pawell@cadence.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Pawel Laszczak <pawell@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-6-minda.chen@starfivetech.com>
 <20230320153419.GB1713196-robh@kernel.org>
 <2311a888-8861-ade6-d46f-caff4fc3ec73@starfivetech.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <2311a888-8861-ade6-d46f-caff4fc3ec73@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_010047_065497_6048FD12 
X-CRM114-Status: GOOD (  27.31  )
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

SGkgTWluZGEsCgpPbiAyMS8wMy8yMDIzIDE0OjM1LCBNaW5kYSBDaGVuIHdyb3RlOgo+IAo+IAo+
IE9uIDIwMjMvMy8yMCAyMzozNCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+IE9uIFdlZCwgTWFyIDE1
LCAyMDIzIGF0IDA2OjQ0OjExUE0gKzA4MDAsIE1pbmRhIENoZW4gd3JvdGU6Cj4+PiBVU0IgR2x1
ZSBsYXllciBhbmQgQ2FkZW5jZSBVU0Igc3Vibm9kZSBjb25maWd1cmF0aW9uLAo+Pj4gYWxzbyBp
bmNsdWRlcyBVU0IgYW5kIFBDSWUgcGh5IGR0cyBjb25maWd1cmF0aW9uLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IE1pbmRhIENoZW4gPG1pbmRhLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbT4KPj4+IC0t
LQo+Pj4gIC4uLi9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLmR0c2kgICAgICAgICB8ICA3
ICsrKwo+Pj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLmR0c2kgICAgICB8
IDU0ICsrKysrKysrKysrKysrKysrKysKPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlv
bnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9q
aDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0
YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaQo+Pj4gaW5kZXggYTEzMmRl
YmI5YjUzLi5jNjQ0NzZhZWJjMWEgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaQo+Pj4gKysrIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLmR0
c2kKPj4+IEBAIC0yMzYsMyArMjM2LDEwIEBACj4+PiAgCXBpbmN0cmwtMCA9IDwmdWFydDBfcGlu
cz47Cj4+PiAgCXN0YXR1cyA9ICJva2F5IjsKPj4+ICB9Owo+Pj4gKwo+Pj4gKyZ1c2IwIHsKPj4+
ICsJc3RhdHVzID0gIm9rYXkiOwo+Pj4gKwl1c2JkcmRfY2RuczM6IHVzYkAwIHsKPj4+ICsJCWRy
X21vZGUgPSAicGVyaXBoZXJhbCI7Cj4+PiArCX07Cj4+PiArfTsKPj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5kdHNpIGIvYXJjaC9yaXNjdi9ib290
L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaQo+Pj4gaW5kZXggZjcwYTRlZDQ3ZWI0Li4xNzcyMmZk
MWJlNjIgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEx
MC5kdHNpCj4+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5kdHNp
Cj4+PiBAQCAtMzYyLDYgKzM2Miw2MCBAQAo+Pj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+
PiAgCQl9Owo+Pj4gIAo+Pj4gKwkJdXNiMDogdXNiQDEwMTAwMDAwIHsKPj4+ICsJCQljb21wYXRp
YmxlID0gInN0YXJmaXZlLGpoNzExMC11c2IiOwo+Pj4gKwkJCWNsb2NrcyA9IDwmc3RnY3JnIEpI
NzExMF9TVEdDTEtfVVNCMF9MUE0+LAo+Pj4gKwkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR0NMS19V
U0IwX1NUQj4sCj4+PiArCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBfQVBCPiwKPj4+
ICsJCQkJIDwmc3RnY3JnIEpINzExMF9TVEdDTEtfVVNCMF9BWEk+LAo+Pj4gKwkJCQkgPCZzdGdj
cmcgSkg3MTEwX1NUR0NMS19VU0IwX1VUTUlfQVBCPjsKPj4+ICsJCQljbG9jay1uYW1lcyA9ICJs
cG0iLCAic3RiIiwgImFwYiIsICJheGkiLCAidXRtaV9hcGIiOwo+Pj4gKwkJCXJlc2V0cyA9IDwm
c3RnY3JnIEpINzExMF9TVEdSU1RfVVNCMF9QV1JVUD4sCj4+PiArCQkJCSA8JnN0Z2NyZyBKSDcx
MTBfU1RHUlNUX1VTQjBfQVBCPiwKPj4+ICsJCQkJIDwmc3RnY3JnIEpINzExMF9TVEdSU1RfVVNC
MF9BWEk+LAo+Pj4gKwkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR1JTVF9VU0IwX1VUTUlfQVBCPjsK
Pj4+ICsJCQlzdGFyZml2ZSxzdGctc3lzY29uID0gPCZzdGdfc3lzY29uIDB4NCAweGM0IDB4MTQ4
IDB4MWY0PjsKPj4+ICsJCQlzdGFyZml2ZSxzeXMtc3lzY29uID0gPCZzeXNfc3lzY29uIDB4MTg+
Owo+Pj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+PiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47Cj4+PiArCQkJI3NpemUtY2VsbHMgPSA8MT47Cj4+PiArCQkJcmFuZ2VzID0gPDB4MCAweDAg
MHgxMDEwMDAwMCAweDEwMDAwMD47Cj4+PiArCj4+PiArCQkJdXNiZHJkX2NkbnMzOiB1c2JAMCB7
Cj4+PiArCQkJCWNvbXBhdGlibGUgPSAiY2Rucyx1c2IzIjsKPj4KPj4gVGhpcyBwYXR0ZXJuIG9m
IFVTQiB3cmFwcGVyIGFuZCB0aGVuIGEgImdlbmVyaWMiIElQIG5vZGUgaXMgZGlzY291cmFnZWQg
Cj4+IGlmIGl0IGlzIGp1c3QgY2xvY2tzLCByZXNldHMsIHBvd2VyLWRvbWFpbnMsIGV0Yy4gSU9X
LCB1bmxlc3MgdGhlcmUncyBhbiAKPj4gYWN0dWFsIHdyYXBwZXIgaC93IGJsb2NrIHdpdGggaXRz
IG93biByZWdpc3RlcnMsIHRoZW4gZG9uJ3QgZG8gdGhpcyAKPj4gc3BsaXQuIE1lcmdlIGl0IGFs
bCBpbnRvIGEgc2luZ2xlIG5vZGUuCj4+Cj4gSSBhbSBhZnJhaWQgaXQgaXMgZGlmZmljdWx0IHRv
IG1lcmdlIGluIG9uZSBzaW5nbGUgbm9kZS4gCj4gCj4gMS5JZiBjYWRlbmNlMyB1c2IgZGV2aWNl
IGlzIHN0aWxsIHRoZSBzdWIgZGV2aWNlLiBBbGwgdGhlIGR0cyBzZXR0aW5nIGFyZSBpbgo+IFN0
YXJGaXZlIG5vZGUuIFRoaXMgY2FuIG5vdCB3b3JrLgo+IFN0YXJGaXZlIGRyaXZlciBjb2RlIFVz
aW5nIHBsYXRmb3JtX2RldmljZV9hZGQgZ2VuZXJhdGUgY2FkZW5jMyB1c2IgcGxhdGZvcm0gZGV2
aWNlLiAKPiBFdmVuIElPIG1lbW9yeSBzcGFjZSBzZXR0aW5nIGNhbiBiZSBwYXNzZWQgdG8gY2Fk
ZW5jZTMgVVNCLCBQSFkgc2V0dGluZyBjYW4gbm90IGJlIHBhc3NlZC4KPiBGb3IgdGhlIFBIWSBk
cml2ZXIgdXNpbmcgZHRzIG5vdy4gQnV0IGluIHRoaXMgY2FzZSwgQ2FkZW5jZTMgVVNCIG5vIGR0
cyBjb25maWd1cmUuCj4gCj4gMi4gSnVzdCBvbmUgVVNCIENhZGVuY2UgcGxhdGZvcm0gZGV2aWNl
Lgo+IE1heWJlIHRoaXMgY2FuIHdvcmsuIEJ1dCBDYWRlbmNlIFVTQiBkcml2ZXIgY29kZSBjZG5z
My1wbGF0LmMgcmVxdWlyZWQgdG8gY2hhbmdlZC4KPiAKPiBIaSBQZXRlciBQYXdlbCBhbmQgUm9n
ZXIKPiAgICBUaGVyZSBpcyBhICJwbGF0Zm9ybV9zdXNwZW5kIiBmdW5jdGlvbiBwb2ludGVyIGlu
ICJzdHJ1Y3QgY2RuczNfcGxhdGZvcm1fZGF0YSLvvIwKPiAgICBBZGQgInBsYXRmb3JtX2luaXQi
IGFuZCAicGxhdGZvcm1fZXhpdCIgZm9yIG91ciBKSDcxMTAgcGxhdGZvcm0uIE1heWJlIGl0IGNh
biB3b3JrLgo+ICAgIElzIGl0IE9LPyAgIAoKT25jZSB5b3UgbW92ZSBhbGwgdGhlIHN5c2NvbiBy
ZWdpc3RlciBtb2RpZmljYXRpb25zIGZyb20geW91ciB3cmFwcGVyIGRyaXZlcgp0byB5b3VyIFBI
WSBkcml2ZXIsIG9ubHkgY2xvY2sgYW5kIHJlc2V0IGNvbnRyb2wgYXJlIGxlZnQgaW4geW91ciB3
cmFwcGVyIGRyaXZlci4KVGhpcyBpcyBnZW5lcmljIGVub3VnaCB0byBiZSBkb25lIGluIHRoZSBj
ZG5zMyx1c2IgZHJpdmVyIGl0c2VsZiBzbyB5b3UgZG9uJ3QgbmVlZCBhCndyYXBwZXIgbm9kZS4K
ClBhd2VsLCBkbyB5b3UgYWdyZWU/CiAKPj4+ICsJCQkJcmVnID0gPDB4MCAweDEwMDAwPiwKPj4+
ICsJCQkJICAgICAgPDB4MTAwMDAgMHgxMDAwMD4sCj4+PiArCQkJCSAgICAgIDwweDIwMDAwIDB4
MTAwMDA+Owo+Pj4gKwkJCQlyZWctbmFtZXMgPSAib3RnIiwgInhoY2kiLCAiZGV2IjsKPj4+ICsJ
CQkJaW50ZXJydXB0cyA9IDwxMDA+LCA8MTA4PiwgPDExMD47Cj4+PiArCQkJCWludGVycnVwdC1u
YW1lcyA9ICJob3N0IiwgInBlcmlwaGVyYWwiLCAib3RnIjsKPj4+ICsJCQkJcGh5cyA9IDwmdXNi
cGh5MD47Cj4+PiArCQkJCXBoeS1uYW1lcyA9ICJjZG5zMyx1c2IyLXBoeSI7Cj4+Cj4+IE5vIG5l
ZWQgZm9yICotbmFtZXMgd2hlbiB0aGVyZSBpcyBvbmx5IDEgZW50cnkuIE5hbWVzIGFyZSBsb2Nh
bCB0byB0aGUgCj4+IGRldmljZSBhbmQgb25seSB0byBkaXN0aW5ndWlzaCBlbnRyaWVzLCBzbyAn
dXNiMicgd291bGQgYmUgc3VmZmljaWVudCAKPj4gaGVyZS4KPj4KPiBUaGUgUEhZIG5hbWUgJ2Nk
bnMzLHVzYjItcGh5JyAgaXMgZGVmaW5lZCBpbiBjYWRlbmNlMyB1c2IgZHJpdmVyIGNvZGUuCj4g
Q2FkZW5jZSBVU0IzIGRyaXZlciBjb2RlIHVzaW5nIHRoaXMgbmFtZSB0byBnZXQgUEhZIGluc3Rh
bmNlLgo+IEFuZCBhbGwgdGhlIFBIWSBvcHMgdXNlZCBpbiBDYWRlbmNlMyBVU0Igc3ViIGRldmlj
ZS4gCj4+PiArCQkJCW1heGltdW0tc3BlZWQgPSAic3VwZXItc3BlZWQiOwo+Pj4gKwkJCX07Cj4+
PiArCQl9Owo+Pj4gKwo+Pj4gKwkJdXNicGh5MDogcGh5QDEwMjAwMDAwIHsKPj4+ICsJCQljb21w
YXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC11c2ItcGh5IjsKPj4+ICsJCQlyZWcgPSA8MHgwIDB4
MTAyMDAwMDAgMHgwIDB4MTAwMDA+Owo+Pj4gKwkJCWNsb2NrcyA9IDwmc3lzY3JnIEpINzExMF9T
WVNDTEtfVVNCXzEyNU0+LAo+Pj4gKwkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR0NMS19VU0IwX0FQ
UF8xMjU+Owo+Pj4gKwkJCWNsb2NrLW5hbWVzID0gIjEyNW0iLCAiYXBwXzEyNSI7Cj4+PiArCQkJ
I3BoeS1jZWxscyA9IDwwPjsKPj4+ICsJCX07Cj4+PiArCj4+PiArCQlwY2llcGh5MDogcGh5QDEw
MjEwMDAwIHsKPj4+ICsJCQljb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC1wY2llLXBoeSI7
Cj4+PiArCQkJcmVnID0gPDB4MCAweDEwMjEwMDAwIDB4MCAweDEwMDAwPjsKPj4+ICsJCQkjcGh5
LWNlbGxzID0gPDA+Owo+Pj4gKwkJfTsKPj4+ICsKPj4+ICsJCXBjaWVwaHkxOiBwaHlAMTAyMjAw
MDAgewo+Pj4gKwkJCWNvbXBhdGlibGUgPSAic3RhcmZpdmUsamg3MTEwLXBjaWUtcGh5IjsKPj4+
ICsJCQlyZWcgPSA8MHgwIDB4MTAyMjAwMDAgMHgwIDB4MTAwMDA+Owo+Pj4gKwkJCSNwaHktY2Vs
bHMgPSA8MD47Cj4+PiArCQl9Owo+Pj4gKwo+Pj4gIAkJc3RnY3JnOiBjbG9jay1jb250cm9sbGVy
QDEwMjMwMDAwIHsKPj4+ICAJCQljb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC1zdGdjcmci
Owo+Pj4gIAkJCXJlZyA9IDwweDAgMHgxMDIzMDAwMCAweDAgMHgxMDAwMD47Cj4+PiAtLSAKPj4+
IDIuMTcuMQo+Pj4KCmNoZWVycywKLXJvZ2VyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
