Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC233C47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 16:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pb6SbNHWUqOq/BSnoQ4MFhs+74CF8GXm1zUXbIHp8Qs=; b=YXYZsm2Coi0uQp
	6coZNSw06H5zg3oK3UTXBDmZu7b31FO19uBVSM1dTR23+Tg7q8W8M+PloXWYvUjbz0u8mRhaQQ0BX
	+P4zU2FOExyjh5LHLcQLJxzWsc/KCFMAp4szjMnIkfA++Wmut7b89+DZMU4um+HV8nnPifi0Hl0Wt
	SrlQC55Howfgb5WO64UZb0EliItBbdpAReAaQRRmn8f/FDsgnf43pCNJxM984bY3OgO75qOMMo9YR
	KXKq87+80CS+ftzh6CDPyzEFfCqcLsNkcMKwJpTrDpPGL32FxePTqR7NiD2J5594gfR5qg6ke4VQf
	op9736HcpM95G5ggVrGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPmhV-00CfSo-2Q;
	Tue, 16 Jan 2024 16:54:09 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPmhS-00CfRw-0L
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 16:54:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D3A724000F;
	Tue, 16 Jan 2024 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705424038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TDyxxPBWASolnrw6aGy7NIdq8Al0r2BJ6k5gaCOPFq4=;
	b=IqlFBjCPvjbP+0obF3YLWMwVTCrrKFs+4+Y+zMfcO5kgJ8f4UIXOwBmLYpDIH8lmcL74nv
	wM8MG1uCTl4p9Vnp1xVfi8ut+EBMtPnhcPKZ/IEtKt3lbVCoaJD0PoEdOF+70WE0NhqOFn
	iwUV7sSusENcH7+qULDhnq+YGIVrMCMCtVharXSW6erFGu7BbBtOMMr1pMcb7RZ1rzRxgu
	G+tDZsIPW4RpJSG02Rsp8dCfpItzSAJcwtOHTl0S0YYtXAudFip1C9KfQi0a4MNfYj+NmF
	Li0xVRIVUJHqt7zZ+V8illQ3RgVBJl4UbtznAUpsDtb2yi7rtODiqlKBN7oXhQ==
Date: Tue, 16 Jan 2024 17:53:56 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, chao.wei@sophgo.com, unicorn_wang@outlook.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dlan@gentoo.org, inochiama@outlook.com
Subject: Re: [PATCH v6 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
Message-ID: <20240116165356eaa221fe@mail.local>
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
 <20240115160600.5444-4-qiujingbao.dlmu@gmail.com>
 <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
 <CAJRtX8QFLoWnJBkepZrbneHX8qZdde=aw+zbdErVC91B=u==MA@mail.gmail.com>
 <007e8c14-13eb-4917-b9da-8d47d6c965c7@linaro.org>
 <CAJRtX8ROH4R_s1=ML5ka340PAE0SWJKK24yVWHw5gCd+7d9pkA@mail.gmail.com>
 <dfcf74a9-db76-43fe-9261-20bf7a993bc3@linaro.org>
 <CAJRtX8Tkie+ykLv8L2EgBQcy9tVP5Yz-_J_eHE-9N9hjt+6gkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJRtX8Tkie+ykLv8L2EgBQcy9tVP5Yz-_J_eHE-9N9hjt+6gkg@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_085406_569407_9A6C0821 
X-CRM114-Status: GOOD (  36.91  )
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

T24gMTcvMDEvMjAyNCAwMDoyOToyOCswODAwLCBKaW5nYmFvIFFpdSB3cm90ZToKPiBPbiBXZWQs
IEphbiAxNywgMjAyNCBhdCAxMjowM+KAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPiA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiAxNi8wMS8yMDI0IDE2
OjUxLCBKaW5nYmFvIFFpdSB3cm90ZToKPiA+ID4+PiBDVjE4MDAgaXMgYSBSSVNDViBiYXNlZCBT
T0MgdGhhdCBpbmNsdWRlcyBhbiBSVEMgbW9kdWxlLiBUaGUgUlRDCj4gPiA+Pj4gbW9kdWxlIGhh
cyBhbiBPU0Mgb3NjaWxsYXRvcgo+ID4gPj4KPiA+ID4+Cj4gPiA+PiBJIGFtIG5vdCBnb2luZyB0
byByZWFkIHBhZ2VzIG9mIGRlc2NyaXB0aW9uLiBQbGVhc2Ugd3JpdGUgY29uY2lzZSByZXBsaWVz
Lgo+ID4gPgo+ID4gPiBUaGFua3MsIFdoYXQgSSBtZWFuIGlzIHRoYXQgdGhpcyBoYXJkd2FyZSBp
bmNsdWRlcyB0d28gZnVuY3Rpb25zLCBSVEMKPiA+ID4gYW5kIFBPUi4gSG93IHNob3VsZCBJIGRl
c2NyaWJlIHRoZWlyIHJlbGF0aW9uc2hpcD8KPiA+Cj4gPiBZb3VyIFBPUiBkb2VzIG5vdCBuZWVk
IHRvIHRha2UgYW55IHJlc291cmNlcywgc28gbm8gbmVlZCB0byBkZXNjcmliZSBhbnkKPiA+IHJl
bGF0aW9uc2hpcC4KPiA+Cj4gPiAuLi4KPiA+Cj4gPiA+Pj4gWW91ciBzdWdnZXN0aW9uIGlzLCBm
aXJzdGx5LCB0aGUgcG9yIHN1Ym1vZHVsZSBkb2VzIG5vdCBoYXZlIGFueQo+ID4gPj4+IHJlc291
cmNlcywgc28gaXQgc2hvdWxkIGJlIGRlbGV0ZWQuCj4gPiA+Pgo+ID4gPj4gU28gd2hlcmUgZGlk
IHlvdSBkZWxldGUgaXQ/IEkgc3RpbGwgc2VlIGl0IGluIHRoaXMgcGF0Y2guCj4gPiA+Cj4gPiA+
IFNob3VsZCBJIGNvbXBsZXRlbHkgZGVsZXRlIGhpbT8gSG93IGNhbiBhIHBvciBkcml2ZXIgb2J0
YWluIGRldmljZSBpbmZvcm1hdGlvbj8KPiA+Cj4gPiBEZWxldGUgY29tcGxldGVseS4KPiA+Cj4g
PiBEZXZpY2UgaW5mb3JtYXRpb24/IFdoYXQgaXMgdGhpcz8gV2UgYWxyZWFkeSBhZ3JlZWQgeW91
IGRvbid0IGhhdmUgYW55Cj4gPiByZXNvdXJjZXMgZm9yIFBPUi4KPiA+Cj4gPiAuLi4uCj4gPgo+
ID4gPj4gRGV2aWNlIGlzIG9ubHkgb25lIHRoaW5nLCBub3QgdHdvLgo+ID4gPj4KPiA+ID4+PiAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDUwMjUwMDAgMHgyMDAwPjsKPiA+ID4+PiAgICAg
ICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MTcgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4g
PiA+Pj4gICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8Jm9zYz47Cj4gPiA+Pj4gfTsKPiA+
ID4+PiBIb3dldmVyLCBpbiByZWFsaXR5LCB0aGUgUE9SIHN1Ym1vZHVsZSBkb2VzIG5vdCB1c2Ug
SVJRIGFuZCBDTEsuCj4gPiA+Pj4gUGxlYXNlIGRvIG5vdCBoZXNpdGF0ZSB0byB0ZWFjaC4gVGhh
bmtzLgo+ID4gPj4KPiA+ID4+IEkgZXhwZWN0IG9uZSBkZXZpY2Ugbm9kZS4gSG93IG1hbnkgZHJp
dmVycyB5b3UgaGF2ZSBkb2VzIG5vdCBtYXR0ZXI6IHlvdQo+ID4gPj4gY2FuIGluc3RhbnRpYXRl
IDEwMCBMaW51eCBkZXZpY2VzIGluIDEwMCBMaW51eCBkZXZpY2UgZHJpdmVycy4KPiA+ID4KPiA+
ID4gSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4uIEEgZGV2aWNlIG5vZGUgY29ycmVzcG9uZHMg
dG8gbXVsdGlwbGUgZHJpdmVycy4KPiA+ID4gU2hvdWxkIEkgY29tcGxldGVseSBkZWxldGUgdGhl
IFBPUiBkZXZpY2UgdHJlZSBub2RlIGFuZCBhZGQgaXQgd2hlbgo+ID4gPiBzdWJtaXR0aW5nIHRo
ZSBQT1IgZHJpdmVyPwo+ID4KPiA+ID8gSSB3cm90ZSBpdCBpbiBwcmV2aW91cyBtZXNzYWdlcyBh
bmQgdHdpY2UgaW4gdGhpcyB0aHJlYWQuIENvbXBsZXRlbHkKPiA+IGRlbGV0ZS4gWW91IGRvIG5v
dCBhZGQgaXQgYmFjayEgQmVjYXVzZSBpZiB5b3UgZXZlciBpbnRlbmRlZCB0byBhZGQgaXQKPiA+
IGJhY2ssIGl0IHNob3VsZCBiZSBhZGRlZCBzaW5jZSBiZWdpbm5pbmcuIEkgZG9uJ3QgdW5kZXJz
dGFuZCB3aGF0Cj4gPiBzdWJtaXR0aW5nIGxhdGVyIHdvdWxkIHNvbHZlLgo+ID4KPiA+ID4gSWYg
dGhhdCdzIHRoZSBjYXNlLCBob3cgY2FuIEkgZXhwbGFpbiB0aGF0IHRoZSBydGMgZGV2aWNlIHRy
ZWUgbm9kZQo+ID4gPiB1c2VzIHRoZSBzeXNjb24gdGFnPwo+ID4gPiBIb3cgY2FuIEkgZGVzY3Jp
YmUgYSBQT1IgZGV2aWNlIGluIERUUz8gUE9SIGlzIGEgc3VibW9kdWxlIG9mIFJUQywgYW5kCj4g
PiA+IGl0IGFsc28gaGFzIGNvcnJlc3BvbmRpbmcgZHJpdmVycy4KPiA+Cj4gPiBJIHNhaWQsIHRo
ZXJlIGlzIG5vIG5lZWQgZm9yIFBPUiBpbiBEVFMsIGJlY2F1c2UgeW91IGhhdmUgbm90aGluZyB0
aGVyZS4KPiA+IFdoeSBkbyB5b3UgaW5zaXN0IG9uIHB1dHRpbmcgaXQgb24gRFRTPwo+ID4KPiA+
ID4gSXQncyBqdXN0IHRoYXQgaGlzIHJlc291cmNlcyBhcmUgb25seSBzaGFyZWQgd2l0aCBSVEMn
cyBSZWcuCj4gPgo+ID4gV2hhdCByZXNvdXJjZXM/IFJlZz8gVGhhdCdzIG5vdCBhIHNlcGFyYXRl
IHJlc291cmNlLgo+IAo+IEknbSB2ZXJ5IHNvcnJ5IGFib3V0IHRoaXMuCj4gQnV0IEkgZm91bmQg
YSBiaW5kaW5nIGZpbGUgdGhhdCBvbmx5IGNvbnRhaW5zIFJlZyBhbmQgQ29tcGF0aWJsZS4KPiAK
PiBydGNAODA5MjAwMDAgewo+IGNvbXBhdGlibGUgPSAiY2lycnVzLGVwOTMwMS1ydGMiOwo+IHJl
ZyA9IDwweDgwOTIwMDAwIDB4MTAwPjsKPiB9Owo+IAo+IExpbms6IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ydGMvY2lycnVzLGVwOTMwMS1ydGMueWFtbAo+IAo+ID4KPiA+IFRv
IHN1bW1hcml6ZTogRHJvcCBQT1IgZnJvbSBEVFMgYW5kIG5ldmVyIGJyaW5nIGl0IGJhY2ssIHVu
bGVzcyB5b3UgY29tZQo+ID4gd2l0aCBzb21lIGRpZmZlcmVudCBhcmd1bWVudHMsIHdoaWNoIHlv
dSBkaWQgbm90IHNheSBhbHJlYWR5Lgo+ID4KPiAKPiBZb3UgYXJlIHJpZ2h0LCBpZiB0aGVyZSBp
cyBubyBwb3IgZGV2aWNlIHRyZWUgbm9kZSwgaG93IGNhbiB0aGUgcG9yCj4gZHJpdmVyIG9idGFp
biB0aGUgUmVnPwoKSSBndWVzcyB0aGUgcXVlc3Rpb24gaXMgd2h5IGRvbid0IHlvdSByZWdpc3Rl
ciBldmVyeXRoaW5nIGZyb20gdGhlIFJUQwpkcml2ZXI/CgoKLS0gCkFsZXhhbmRyZSBCZWxsb25p
LCBjby1vd25lciBhbmQgQ09PLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
