Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4FFC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 19:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwWtIUnPfKT+EhOduUPl6cNkjNLyPUHtSRASUb4Z+RA=; b=ffYr+5y7fMexf5
	yTjxygWx7hp2E5e5QEeXrHF8gA1DLH7qOltJSsIUuMsQRGxubp/b9xRHLKc8tUh5ZO1RuYRD8/35i
	izGtMwxiaWyYAIEucrXdMSNmCReTR1t5c0YNSifT1+6p/jRMOws5/jhC/iI8iXvgde9CDTlq//PeM
	H19dEQrSH+s8t2xwHyB7hAI1OM4LGG20XnJaZ2OkJYawqIY2cswFmVHeq09yrO1OZLCMmNr2yfbk4
	STQGAz5NsPShTr4JwoPMDoiDY0I+BcSak2U78Vk5unTHRTozlc+iHzGLaSPONC1/4N7Uv4g35LUeR
	OVlZWo09x5V/YpQz638w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0p7m-00A9H0-D6; Thu, 01 Dec 2022 19:21:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0p5F-00A7hr-7j
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 19:18:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4ADD8620C4;
	Thu,  1 Dec 2022 19:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D94C433D6;
	Thu,  1 Dec 2022 19:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669922335;
	bh=hSbyl0ectETj26ZvTfkUVS3Ig7lwtSaBLWBZQNFnGEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIh5KC85iyhQHOcd1Y+TJD2FNxeFNz/xIsEmQYxsyo6u9YAuICqU90jjtn4vml5nJ
	 ElRBusQir3H6DtBSIZLG8+r6nVUAQTfRD7seZEvqAW/ejW/kfOZZEqikR7u2Wa0EnA
	 pg9aykowp5fJTN573QEZAAL/6EeQqIkfgFf9jnGSQohnT2V4hKgvawIrmJI64Q9or/
	 gFMd2xuOgtHUQZQ1R+nIhwj6WugMl9VNiCd1WbBYglfQCnQKoYqxebeG8AHlKXI9Jq
	 XE8WZRjGwqfnWCkaG4B0s75QRNVBH4ARbJLSM1wlB2gUGygu1hSPbdtko3aEeThEe9
	 CJV7JuYf8RaOg==
Date: Thu, 1 Dec 2022 19:18:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible for
 OpenC906
Message-ID: <Y4j+Gpptk3NAFBNV@spud>
References: <20221121041757.418645-1-uwu@icenowy.me>
 <20221121041757.418645-3-uwu@icenowy.me>
 <98005150-83a7-5439-0db1-d93d459c3809@linaro.org>
 <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me>
 <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org>
 <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me>
 <20221130181330.GA2544489-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130181330.GA2544489-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_111857_394047_EBD19006 
X-CRM114-Status: GOOD (  27.15  )
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
Cc: devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBOb3YgMzAsIDIwMjIgYXQgMTI6MTM6MzBQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVHVlLCBOb3YgMjIsIDIwMjIgYXQgMDM6NDE6MjdQTSArMDgwMCwgSWNlbm93eSBa
aGVuZyB3cm90ZToKPiA+IAo+ID4gCj4gPiDkuo4gMjAyMuW5tDEx5pyIMjLml6UgR01UKzA4OjAw
IOS4i+WNiDM6MzU6NDgsIEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4g5YaZ5YiwOgo+ID4gPk9uIDIyLzExLzIwMjIgMDg6MTgsIEljZW5vd3kgWmhl
bmcgd3JvdGU6Cj4gPiA+PiDlnKggMjAyMi0xMS0yMeaYn+acn+S4gOeahCAxMTowNiArMDEwMO+8
jEtyenlzenRvZiBLb3psb3dza2nlhpnpgZPvvJoKPiA+ID4+PiBPbiAyMS8xMS8yMDIyIDA1OjE3
LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4gPj4+PiBULUhlYWQgT3BlbkM5MDYgaXMgYSBvcGVu
LXNvdXJjZS1saWNlbnNlZCBmaXhlZC1jb25maWd1cmF0aW9uIG9mCj4gPiA+Pj4+IEM5MDYsCj4g
PiA+Pj4+IHdoaWNoIGlzIG5vdyBwdWJsaWMgYW5kIGFibGUgdG8gYmUgaW50ZWdyYXRlZC4KPiA+
ID4+Pj4KPiA+ID4+Pj4gQWRkIGEgY29tcGF0aWJsZSBmb3IgdGhlIENMSU5UIHNoaXBwZWQgYXMg
cGFydCBvZiBPcGVuQzkwNiwgd2hpY2gKPiA+ID4+Pj4gc2hvdWxkCj4gPiA+Pj4+IGp1c3QgYmUg
b3JkaW5hcnkgQzl4eCBDTElOVC4KPiA+ID4+Pj4KPiA+ID4+Pj4gU2lnbmVkLW9mZi1ieTogSWNl
bm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiA+Pj4+IC0tLQo+ID4gPj4+PiDCoERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbCB8IDEg
Kwo+ID4gPj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gPj4+Pgo+ID4g
Pj4+PiBkaWZmIC0tZ2l0Cj4gPiA+Pj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gPiA+Pj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gPiA+Pj4+IGluZGV4IGFh
ZGE2OTU3MjE2Yy4uODY3MDNlOTk1ZTMxIDEwMDY0NAo+ID4gPj4+PiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiA+ID4+Pj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGlu
dC55YW1sCj4gPiA+Pj4+IEBAIC0zNSw2ICszNSw3IEBAIHByb3BlcnRpZXM6Cj4gPiA+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHNpZml2ZSxjbGludDAKPiA+ID4+Pj4gwqDCoMKg
wqDCoMKgIC0gaXRlbXM6Cj4gPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToKPiA+
ID4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gdGhlYWQsb3BlbmM5MDYtY2xpbnQK
PiA+ID4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGFsbHdpbm5lcixzdW4yMGkt
ZDEtY2xpbnQKPiA+ID4+Pgo+ID4gPj4+IEFkZCBlbnRyaWVzIHNvcnRlZCBhbHBoYWJldGljYWxs
eS4gVGhpcyBzaG91bGQgYmUgc3F1YXNoZWQgd2l0aAo+ID4gPj4+IHByZXZpb3VzCj4gPiA+Pj4g
cGF0Y2guCj4gPiA+PiAKPiA+ID4+IEkgbWFrZSBpdCBhIHNlcGVyYXRlZCBwYXRjaCBiZWNhdXNl
IEkgdGhpbmsgaXQncyBhIHF1ZXN0aW9uYWJsZQo+ID4gPj4gYXBwcm9hY2guCj4gPiA+PiAKPiA+
ID4+IElmIHlvdSB0aGluayBpdCdzIG9rYXksIEkgd2lsbCBqdXN0IHNxdWFzaCBpdCBhbmQgcHV0
IGl0IGFzIHRoZSBzZWNvbmQKPiA+ID4+IHBhdGNoIGluIHRoZSBuZXh0IGl0ZXJhdGlvbiwgd2l0
aCBhZGRpbmcgb3BlbmM5MDYtcGxpYyBhcyB0aGUgZmlyc3QKPiA+ID4+IG9uZS4KPiA+ID4KPiA+
ID5XaGF0IGlzIGEgcXVlc3Rpb25hYmxlIGFwcHJvYWNoPyBXaHkgY29tbWl0IG1zZyBpcyBub3Qg
c2F5aW5nIHRoaXM/Cj4gPiAKPiA+IEFoIEkgbWVudGlvbmVkIGl0IGluIHRoZSBjb3ZlciBsZXR0
ZXIuIFRoZSBwcm9ibGVtIGlzIGp1c3QgSSBkb3VidCB3aGV0aGVyCj4gPiBiaW5kaW5nIHN0cmlu
Z3MgZm9yIHNpbmdsZSBTb0NzIGFyZSBuZWNlc3NhcnkuCj4gCj4gVGhleSBhcmUuCj4gCj4gVW5s
ZXNzIGFsbCB0aGUgcXVpcmtzL2J1Z3MvZmVhdHVyZXMgYXJlIHNvbWVob3cgZ3VhcmFudGVlZCB0
byBiZSBleGFjdGx5IAo+IHRoZSBzYW1lIGFzIG90aGVyIFNvQ3Mgc2hhcmluZyB0aGUgc2FtZSBj
b21wYXRpYmxlIHN0cmluZywgb3IgdGhlcmUgaXMgCj4gYW5vdGhlciBtZWNoYW5pc20gdG8gaWRl
bnRpZnkgdGhlIGV4YWN0IHZlcnNpb24gKGUuZy4gYSB2ZXJzaW9uIAo+IHJlZ2lzdGVyKS4KCklj
ZW5vd3ksCgpIYXZpbmcgdGhvdWdodCBhYm91dCB0aGlzIGEgbGl0dGxlIC0gYXJlIHdlIG5vdCAq
bW9yZSogbGlrZWx5IHRvIHNlZQpidWcvcXVpcmsgZGlzcGFyaXR5IGJldHdlZW4gaW1wbGVtZW50
YXRpb25zIG9mIHRoZSBPcGVuQzkwNiBzdHVmZiBieQp0aGUgdmVyeSBuYXR1cmUgb2YgYmVpbmcg
YW4gb3Blbi1zb3VyY2UgSVA/CgpUaGFua3MsCkNvbm9yLgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
