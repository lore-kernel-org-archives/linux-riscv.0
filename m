Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0133C47DD9
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2024 14:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDv7f0K70N3wZHlmpcH10T3d6SAJsMCWgTjl3Y31UF8=; b=bvUe1tvh8C/zYS
	T3S/vVPgXIxL2WwRAJf/O8wsvWJln/Esv17866KChttpk/x5tqv8YElH7YM0jVfsZqEPbdwEHV8Kt
	dyhIw0CXR3Ss+heX74AnXJzHp5vqYnH3Bk1d4hIsj10VKufg5q0A1QnwkxvWTmURHYLenq2yFnw9w
	zAoqbjrHEMOx7LfECQawDjzKTn8ekPObkiViyAPOt5f+RQa1RK3szL56rSQf2AxVmOgztR7ltp4av
	dL+YsqyXLPHuBMRomQh00ZWq7MGt6nNx20it/yjjFRA+Y3W/LSfZ/IHd7f0Re+D8WecsWkO35qJgY
	EHQeb8yALkU0P10Nf5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roOzm-0000000Ckzh-1m8v;
	Sun, 24 Mar 2024 14:38:46 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roOzj-0000000Ckyz-23Gz
	for linux-riscv@lists.infradead.org;
	Sun, 24 Mar 2024 14:38:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1711291118;
	bh=IbsCl9l2o8yFRzxnTIHD21nvFORmc81BmARxaSCYcRc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Zgfs6kJu7XcbbtN5sfNCkJmpgBquCo0qpHVWDb0ye12q1YA2pIun9RU/ncnRIrm2m
	 ZQCq4XQbP7vMZSbG3oyJ3blii5OrRtC/jpxV83y96CJ4eMOCbQA96dM+ZhxattXuxs
	 uNdiWM2T1ep3SipujgMP1W2b5bXHOM3wo9GsfsMg=
Received: from [IPv6:240e:358:11fe:a000:dc73:854d:832e:8] (unknown [IPv6:240e:358:11fe:a000:dc73:854d:832e:8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 06DBA6737D;
	Sun, 24 Mar 2024 10:38:26 -0400 (EDT)
Message-ID: <0c3c6f3cae125fd51105264308aff5d9968a65e2.camel@xry111.site>
Subject: Re: [PATCH v8 4/4] riscv: dts: thead: Enable LicheePi 4A eMMC and
 microSD
From: Xi Ruoyao <xry111@xry111.site>
To: Drew Fustini <drew@pdp7.com>, Maxim Kiselev <bigunclemax@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, dfustini@baylibre.com, guoren@kernel.org, 
 jkridner@beagleboard.org, jszhang@kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, open list
 <linux-kernel@vger.kernel.org>,  linux-riscv@lists.infradead.org, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 robertcnelson@beagleboard.org, Rob Herring <robh+dt@kernel.org>, 
 wefu@redhat.com
Date: Sun, 24 Mar 2024 22:38:21 +0800
In-Reply-To: <Zf+A7KEYL/tZb9/N@x1>
References: <CALHCpMhc1F5Ue7U_gsDXREHUZRVQJNYRCJxYxoNqbN=-39jf7A@mail.gmail.com>
	 <Zf+A7KEYL/tZb9/N@x1>
User-Agent: Evolution 3.52.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_073843_572226_EA9FD625 
X-CRM114-Status: GOOD (  28.51  )
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

T24gU2F0LCAyMDI0LTAzLTIzIGF0IDE4OjI1IC0wNzAwLCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4g
T24gV2VkLCBNYXIgMjAsIDIwMjQgYXQgMDM6Mjg6MTlQTSArMDMwMCwgTWF4aW0gS2lzZWxldiB3
cm90ZToKPiA+IEhpIFhpLCBEcmV3Cj4gPiAKPiA+IEkgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtIHdp
dGggU0Qgb24gbXkgTGljaGVlUGkgNEEuCj4gPiAKPiA+IEFmdGVyIHNvbWUgaW52ZXN0aWdhdGlv
bnMgSSBmb3VuZCBob3cgdG8gZml4IHRoaXMgdHVuaW5nIGVycm9yLgo+ID4gSGVyZSBpcyB0aGUg
cGF0Y2ggdGhhdCBpbmNyZWFzZXMgdHVuaW5nIGxvb3AgY291bnQgZnJvbQo+ID4gNDAoTUFYX1RV
TklOR19MT09QIGF0IHNkaGNpLmMpIHRvIDEyOC4KPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbW1jL2hvc3Qvc2RoY2ktb2YtZHdjbXNoYy5jCj4gPiBiL2RyaXZlcnMvbW1jL2hvc3Qvc2Ro
Y2ktb2YtZHdjbXNoYy5jCj4gPiBpbmRleCA4ZDZjZmI2NDgwOTYuLmRhOGY1ODIwZmI2OSAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtZHdjbXNoYy5jCj4gPiArKysg
Yi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWR3Y21zaGMuYwo+ID4gQEAgLTcwNiw2ICs3MDYs
NyBAQCBzdGF0aWMgaW50IHRoMTUyMF9leGVjdXRlX3R1bmluZyhzdHJ1Y3QKPiA+IHNkaGNpX2hv
c3QKPiA+ICpob3N0LCB1MzIgb3Bjb2RlKQo+ID4gCj4gPiDCoMKgwqDCoMKgwqDCoCAvKiBwZXJm
b3JtIHR1bmluZyAqLwo+ID4gwqDCoMKgwqDCoMKgwqAgc2RoY2lfc3RhcnRfdHVuaW5nKGhvc3Qp
Owo+ID4gK8KgwqDCoMKgwqDCoCBob3N0LT50dW5pbmdfbG9vcF9jb3VudCA9IDEyODoKPiA+IMKg
wqDCoMKgwqDCoMKgIGhvc3QtPnR1bmluZ19lcnIgPSBfX3NkaGNpX2V4ZWN1dGVfdHVuaW5nKGhv
c3QsIG9wY29kZSk7Cj4gPiDCoMKgwqDCoMKgwqDCoCBpZiAoaG9zdC0+dHVuaW5nX2Vycikgewo+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGRpc2FibGUgYXV0by10dW5pbmcg
dXBvbiB0dW5pbmcgZXJyb3IgKi8KPiA+IAo+ID4gQWZ0ZXIgdGhhdCBjaGFuZ2UgdHVuaW5nIHdv
cmtzIGZpbmUuIFRoZSBzYW1lIHZhbHVlIG9mIGxvb3AgY291bnQgaXMKPiA+IHVzZWQgaW4gUmV2
eU9TIEJTUAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3Jldnlvcy90aGVhZC1rZXJuZWwvYmxvYi9j
NmQ0ZTVkZjE4YTE3OTAzZDAxMmZmZDg5ZTY3ZDBlZTVjZTZjZjJkL2RyaXZlcnMvbW1jL2hvc3Qv
c2RoY2ktb2YtZHdjbXNoYy5jI0wxODUKPiA+IAo+ID4gSG9uZXN0bHksIGl0IGxvb2tzIGEgbGl0
dGxlIGJpdCBzdHJhbmdlIGZvciBtZS4KPiA+IAo+ID4gSXQgc2VlbXMgdGhhdCB0aGUgdHVuaW5n
IGFsZ29yaXRobSByZXF1aXJlcyB0byBtb3ZlIHRocm91Z2gKPiA+IGFsbCB0aGUgdGFwcyBvZiBk
ZWxheSBsaW5lKDEyOCB0YXBzPykgZXZlbiBpZiB3ZSB1c2UgVEhSRVNIT0xEX01PREUKPiA+IGlu
c3RlbmQgTEFSR0VTVF9XSU5fTU9ERSAoSSBtZWFuIGJpdCAyIGluIEFUX0NUUkxfUigweDU0MCkK
PiA+IHJlZ2lzdGVyKS4KPiA+IAo+ID4gWGksIGNvdWxkIHlvdSBhbHNvIHRlc3QgbXkgZml4IG9u
IHlvdXIgYm9hcmQ/CgpJdCB3b3JrcyBmb3IgbWUgYXMgd2VsbC4gIEknbSBub3cgZ2V0dGluZzoK
ClsgICAgMC44NTQzNTddIG1tYzE6IG5ldyB1bHRyYSBoaWdoIHNwZWVkIFNEUjEwNCBTRFhDIGNh
cmQgYXQgYWRkcmVzcyBhYWFhClsgICAgMC44NjIyNjddIG1tY2JsazE6IG1tYzE6YWFhYSBTUjI1
NiAyMzggR2lCClsgICAgMC44NzY2MjNdICBtbWNibGsxOiBwMQoKVGVzdGVkLWJ5OiBYaSBSdW95
YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4KClRoYW5rcyBhIGxvdCEKCj4gVGhhbmtzIGZvciBmaWd1
cmluZyB0aGlzIG91dCEKPiAKPiBXaGVuIEkgd2FzIHVwc3RyZWFtaW5nIHN1cHBvcnQsIEkgbm90
aWNlZCBfX3NkaGNpX2V4ZWN1dGVfdHVuaW5nKCkgaW4KPiBULUhlYWQncyB2ZXJzaW9uIG9mIHNk
aGNpLW9mLWR3Y21zaGMuYyBzZWVtZWQgdG8gZHVwbGljYXRlIHdoYXQgYWxyZWFkeQo+IGV4aXN0
ZWQgaW4gZHJpdmVycy9tbWMvaG9zdC9zZGhjaS5jLiBJIGhhZCB0aG91Z2h0IFQtSGVhZCBjb3Bp
ZWQgaXQKPiBiZWNhdXNlIGl0IHdhcyBhIHN0YXRpYyBmdW5jdGlvbi4KPiAKPiA5Y2M4MTFhMzQy
YmUgKCJtbWM6IHNkaGNpOiBhZGQgX19zZGhjaV9leGVjdXRlX3R1bmluZygpIHRvIGhlYWRlciIp
Cj4gYWxsb3dlZCBtZSB0byByZW1vdmUgX19zZGhjaV9leGVjdXRlX3R1bmluZygpIGZyb20gc2Ro
Y2ktb2YtZHdjbXNoYy4KPiBIb3dldmVyLCBJIG92ZXJsb29rZWQgdGhpcyByZXN1bHRlZCBpbiBj
aGFuZ2luZyB0aGUgdHVuaW5nIGxvb3AgZnJvbQo+IDEyOCBiYWNrIHRvIHRoZSB1cHN0cmVhbSBk
ZWZhdWx0IG9mIDQwLgo+IAo+IEJlZm9yZSB0aGlzIGNoYW5nZSwgdGhlIG1pY3JvU0QgZGlkIHdv
cmsgZm9yIG1lIG9uIHRoZSBscGk0IGJ1dCBJIHdvdWxkCj4gc2VlIHRoZSBmb2xsb3dpbmc6Cj4g
Cj4gW8KgwqDCoCA0LjE4MjQ4M10gbW1jMTogVHVuaW5nIGZhaWxlZCwgZmFsbGluZyBiYWNrIHRv
IGZpeGVkIHNhbXBsaW5nCj4gY2xvY2sKPiBbwqDCoMKgIDQuMTg5MDIyXSBzZGhjaS1kd2Ntc2hj
IGZmZTcwOTAwMDAubW1jOiB0dW5pbmcgZmFpbGVkOiAtMTEKPiBbwqDCoMKgIDQuMTk0NzM0XSBt
bWMxOiB0dW5pbmcgZXhlY3V0aW9uIGZhaWxlZDogLTUKPiBbwqDCoMKgIDQuMjg3ODk5XSBtbWMx
OiBuZXcgaGlnaCBzcGVlZCBTREhDIGNhcmQgYXQgYWRkcmVzcyBhYWFhCj4gW8KgwqDCoCA0LjI5
OTc2M10gbW1jYmxrMTogbW1jMTphYWFhIFNEMzJHIDI5LjcgR2lCCj4gW8KgwqDCoCA0LjMxNjk2
M13CoCBtbWNibGsxOiBwMSBwMgo+IAo+IHJvb3RAbHBpNGFtYWluOn4jIGNhdCAvc3lzL2tlcm5l
bC9kZWJ1Zy9tbWMxL2lvcwo+IGNsb2NrOgkJNTAwMDAwMDAgSHoKPiBhY3R1YWwgY2xvY2s6CTQ5
NTAwMDAwIEh6Cj4gdmRkOgkJMjEgKDMuMyB+IDMuNCBWKQo+IGJ1cyBtb2RlOgkyIChwdXNoLXB1
bGwpCj4gY2hpcCBzZWxlY3Q6CTAgKGRvbid0IGNhcmUpCj4gcG93ZXIgbW9kZToJMiAob24pCj4g
YnVzIHdpZHRoOgkyICg0IGJpdHMpCj4gdGltaW5nIHNwZWM6CTIgKHNkIGhpZ2gtc3BlZWQpCj4g
c2lnbmFsIHZvbHRhZ2U6CTAgKDMuMzAgVikKPiBkcml2ZXIgdHlwZToJMCAoZHJpdmVyIHR5cGUg
QikKPiAKPiBXaXRoIHRoZSBjaGFuZ2UgdG8gMTI4LCBJIG5vIGxvbmdlciBzZWUgdGhlIHR1bmlu
ZyBmYWlsdXJlIGFuZCB0aGUKPiBtaWNyb1NEIGNvbnRpbnVlcyB0byB3b3JrIG9rYXk6Cj4gCj4g
W8KgwqDCoCA0LjMwNzA0MF0gbW1jMTogbmV3IHVsdHJhIGhpZ2ggc3BlZWQgU0RSMTA0IFNESEMg
Y2FyZCBhdCBhZGRyZXNzCj4gYWFhYQo+IFvCoMKgwqAgNC4zMjA0NjJdIG1tY2JsazE6IG1tYzE6
YWFhYSBTRDMyRyAyOS43IEdpQgo+IFvCoMKgwqAgNC4zMzg2NDZdwqAgbW1jYmxrMTogcDEgcDIK
PiAKPiByb290QGxwaTRhbWFpbjovc3lzL2tlcm5lbC9kZWJ1Zy9tbWMxIyBjYXQgaW9zCj4gY2xv
Y2s6CQkxOTgwMDAwMDAgSHoKPiBhY3R1YWwgY2xvY2s6CTE5ODAwMDAwMCBIego+IHZkZDoJCTIx
ICgzLjMgfiAzLjQgVikKPiBidXMgbW9kZToJMiAocHVzaC1wdWxsKQo+IGNoaXAgc2VsZWN0Ogkw
IChkb24ndCBjYXJlKQo+IHBvd2VyIG1vZGU6CTIgKG9uKQo+IGJ1cyB3aWR0aDoJMiAoNCBiaXRz
KQo+IHRpbWluZyBzcGVjOgk2IChzZCB1aHMgU0RSMTA0KQo+IHNpZ25hbCB2b2x0YWdlOgkxICgx
LjgwIFYpCj4gZHJpdmVyIHR5cGU6CTAgKGRyaXZlciB0eXBlIEIpCj4gCj4gVGhpcyBoYXMgdGhl
IGJlbmVmaXQgb2YgdGhlIGNhcmQgbm93IHdvcmtzIGF0IDE5OCBNSHogaW4gU0RSMTA0IG1vZGUK
PiBpbnN0ZWFkIG9mIDUwIE1IeiB3aGVuIHR1bmluZyBmYWlsZWQuCj4gCj4gVGVzdGVkLWJ5OiBE
cmV3IEZ1c3RpbmkgPGRyZXdAcGRwNy5jb20+CgotLSAKWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTEx
LnNpdGU+ClNjaG9vbCBvZiBBZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFu
IFVuaXZlcnNpdHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
