Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DCFED7B87
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1h566rBuak6djAAk75hXniffftwN5UkTVEBGta94V6k=; b=RMgaP2vY8QveXs
	SW9KUyYx++DOzTAuJc28dVUpZz+q6CaqI1E3WDsUjzQUC0uha1zx/cPhqwX+wYjm9MazHZ5k68L7o
	10tiHVoB0SK3daiskWEf7GPnBA7I0q9w6rlpTlP25XFe5aTIK9/twmJPJswvo4TDv6Ia1mBxzsy4C
	5jzEhWjl9J3+lS5Gt2ER0mZnpcIjf2WsgieyFKWirRZkmPcx8zPotFbsy89tK9eKg9p9ihRheuVpx
	bTE1TOdIheNB5hy6ijoFqBKHuBL9kaSD8mZeqh6nCSo4EvvEmyyo0+gdASp2N+wbJpqSl4wLZuWBK
	NMk6T/KUSn89qCVFJh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYuf-0000000GxD9-137g;
	Tue, 14 Apr 2026 08:14:25 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYuc-0000000GxBn-0DfS
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 08:14:24 +0000
X-QQ-mid: esmtpgz11t1776154412t2aeae6dd
X-QQ-Originating-IP: t5qvFoqOO49dshmNhNcUn+LEJies/jN4pY7I/s4bMd4=
Received: from = ( [183.48.244.18])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 16:13:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8640859911972310649
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Mime-Version: 1.0
Date: Tue, 14 Apr 2026 16:13:29 +0800
Message-Id: <DHSQ6VG82QYX.1EVAYV9JTBCL7@linux.dev>
Cc: "Ulf Hansson" <ulf.hansson@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Adrian Hunter" <adrian.hunter@intel.com>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.dev>, "Michael
 Opdenacker" <michael.opdenacker@rootcommit.com>, "Javier Martinez Canillas"
 <javierm@redhat.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Anand Moon"
 <linux.amoon@gmail.com>, "Trevor Gamblin" <tgamblin@baylibre.com>, "Vincent
 Legoll" <legoll@online.fr>
Subject: Re: [PATCH v8 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <f58ec12c-3957-4d44-b823-6a1ae1a1dd94@kernel.org>
 <CABdCQ=NhTkGJUh_fKnZoQMzdpyO-UbV5zrSfiNVUC7bkSBifTA@mail.gmail.com>
In-Reply-To: <CABdCQ=NhTkGJUh_fKnZoQMzdpyO-UbV5zrSfiNVUC7bkSBifTA@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ml2CtnvVxCrQJxGAfPQHvPdstOAa3GYTKp6lVRD+aEk1r3+JqCzFFeMo
	bWPtg195NqBKg0ut99zsNZLNrZ/fGkH1QD5z1x5aPLd/pUzDLtVK+Xtu6WVaPxL180GHDVq
	8inA1UPBznhbiLY3Av64KcLnjk/93uqagCcX4oEu25n29e4UuhXH0AnlmDnBp32kXkA2yqn
	a6XHSF0C0Sa+ZE8la4fiar93/D1Lp4GUCvzjLbCKr42RQvx69ENuVev39Y7qoAmUWo6mpPw
	rGhFZPGAhaM/DrjfceTY4+y1lBBjhJZt1qrb/pSGrKai2neS10khA3h4ERgiBNpumhIMu8R
	lN2d4YBezle8MLWV2Onl6MLgugVMgvA4PX0YDLLQseby6hI1KvBByrO5pY4UthWA3ttF40f
	biOsEjG3GaksHSOAHzCL0Lymt1e9C21J0aIX+68LEYV48cNulqiQa0epdA/N/gbeGw2XHJ/
	wGOo/4DX7odjImSDwim9hed+jOe2hLotN0vHb4UUpwhJ6wNAR/hY1fGp/pttcHjJFWbZOY1
	dJogC6Q66Q3EGlvSaeJ48mwSgU5N/Smf30qiYcHGymjyDRihkP2gSNhn3kZztUgRh7wOZDv
	RIY2jkv1e+FS2ISrHFoXUEnGTpqPQ2nuxQSPLVTISfNBXlMjmZPi9ge8j9nrpGYz0khkoF9
	OCkVDdmrIwKlzkpe9uDUOUvcx4tqgb3G7jHskK+/nZSYkpXGUXgrrlgOIcCvDMvuRzaDQZk
	CeMuoK1DjOdFc3TKfwcTx7W+kbII+Z1SZm0c+lDRdOJ+cgsSGvOQSTlXZH/qx1h/S0HL9il
	NCko3hUO6fvia06026rJCPP/zUZ69icN+81idy5P0Mbt29gJp5GCqBuD/yT9mHOljC7IzbY
	eYCTj5TrhHk0C1f3eTzEOCQm8rO8p0SIINnJYMutF8x2dVX5JlQaNuZRcKBJDrS+lptg4h6
	2ubCAXmCo+iPJmFI3IjcHqV/phT90T4MiSInUcUP+d9iua0Nza2OHWqr/zvxUzUV8b2RIQM
	5mcfAbUluGoKixtZkGHAbaEPUi28nj5IGrCd0YxNqJubTvHc6DlnnypdwZKUB2PKDkikgBs
	7kzJ0yq2Nf7
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_011422_948577_F4FA316D 
X-CRM114-Status: GOOD (  16.85  )
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

T24gVHVlIEFwciAxNCwgMjAyNiBhdCAzOjEyIFBNIENTVCwgSWtlciBQZWRyb3NhIHdyb3RlOgo+
IEVsIGx1biwgMTMgYWJyIDIwMjYgYSBsYXMgMTA6MDcsIEtyenlzenRvZiBLb3psb3dza2kKPiAo
PGtyemtAa2VybmVsLm9yZz4pIGVzY3JpYmnDszoKPj4KPj4gT24gMTMvMDQvMjAyNiAxMDowMiwg
SWtlciBQZWRyb3NhIHdyb3RlOgo+PiA+IFRoaXMgc2VyaWVzIGVuYWJsZXMgY29tcGxldGUgU0Qg
Y2FyZCBzdXBwb3J0IGZvciB0aGUgU3BhY2VtaXQgSzEtYmFzZWQKPj4gPiBPcmFuZ2VQaSBSVjIg
Ym9hcmQsIGluY2x1ZGluZyBVSFMgKFVsdHJhIEhpZ2ggU3BlZWQpIG1vZGVzIGZvcgo+PiA+IGhp
Z2gtcGVyZm9ybWFuY2UgU0QgY2FyZCBvcGVyYXRpb24uCj4+ID4KPj4gPiBCYWNrZ3JvdW5kCj4+
ID4KPj4gPiBUaGUgU3BhY2VtaXQgSzEgU29DIGluY2x1ZGVzIGFuIFNESENJIGNvbnRyb2xsZXIg
Y2FwYWJsZSBvZiBzdXBwb3J0aW5nCj4+ID4gU0QgY2FyZHMgdXAgdG8gVUhTLUkgc3BlZWRzIChT
RFIxMDQgYXQgMjA4TUh6KS4gSG93ZXZlciwgbWFpbmxpbmUKPj4gPiBjdXJyZW50bHkgbGFja3Mg
YmFzaWMgU0QgY29udHJvbGxlciBjb25maWd1cmF0aW9uLCBTREhDSSBkcml2ZXIKPj4gPiBlbmhh
bmNlbWVudHMgZm9yIHZvbHRhZ2Ugc3dpdGNoaW5nIGFuZCB0dW5pbmcsIGFuZCBwb3dlciBtYW5h
Z2VtZW50Cj4+ID4gaW5mcmFzdHJ1Y3R1cmUuCj4+ID4KPj4gPiBJbXBsZW1lbnRhdGlvbgo+PiA+
Cj4+ID4gVGhlIHNlcmllcyBlbmFibGVzIFNEIGNhcmQgc3VwcG9ydCB0aHJvdWdoIGNvb3JkaW5h
dGVkIGxheWVyczoKPj4gPgo+PiA+IC0gSGFyZHdhcmUgaW5mcmFzdHJ1Y3R1cmUgKHBhdGNoZXMg
MS0yKTogRGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHZvbHRhZ2UKPj4gPiBzd2l0Y2hpbmcgaGFy
ZHdhcmUgYW5kIGVzc2VudGlhbCBjbG9jayBpbmZyYXN0cnVjdHVyZS4KPj4gPiAtIFNESENJIGRy
aXZlciBlbmhhbmNlbWVudHMgKHBhdGNoZXMgMy03KTogUmVndWxhdG9yIGZyYW1ld29yawo+PiA+
IGludGVncmF0aW9uLCBwaW5jdHJsIHN0YXRlIHN3aXRjaGluZyBmb3Igdm9sdGFnZSBkb21haW5z
LCBBSUIgcmVnaXN0ZXIKPj4gPiBwcm9ncmFtbWluZywgYW5kIGNvbXByZWhlbnNpdmUgU0RSIHR1
bmluZyBzdXBwb3J0IGZvciByZWxpYWJsZSBVSFMKPj4gPiBvcGVyYXRpb24uCj4+ID4gLSBTb0Mg
YW5kIGJvYXJkIGludGVncmF0aW9uIChwYXRjaGVzIDgtMTApOiBDb21wbGV0ZSBLMSBTb0MgY29u
dHJvbGxlcgo+PiA+IGRlZmluaXRpb25zLCBQTUlDIHBvd2VyIGluZnJhc3RydWN0dXJlLCBhbmQg
T3JhbmdlUGkgUlYyIGJvYXJkIGVuYWJsZW1lbnQKPj4gPiB3aXRoIGZ1bGwgVUhTIHN1cHBvcnQu
Cj4+ID4KPj4gPiBUaGlzIHRyYW5zZm9ybXMgdGhlIE9yYW5nZVBpIFJWMiBmcm9tIGhhdmluZyBu
byBTRCBjYXJkIHN1cHBvcnQgdG8gZnVsbAo+PiA+IFVIUy1JIGNhcGFiaWxpdHksIGVuYWJsaW5n
IGhpZ2gtcGVyZm9ybWFuY2Ugc3RvcmFnZSB1cCB0byAyMDhNSHouCj4+ID4KPj4gPiBUZXN0ZWQt
Ynk6IE1pY2hhZWwgT3BkZW5hY2tlciA8bWljaGFlbC5vcGRlbmFja2VyQHJvb3Rjb21taXQuY29t
Pgo+PiA+IFNpZ25lZC1vZmYtYnk6IElrZXIgUGVkcm9zYSA8aWtlcnBlZHJvc2FtQGdtYWlsLmNv
bT4KPj4gPiAtLS0KPj4gPiBDaGFuZ2VzIGluIHY4Ogo+PiA+IC0gUmVzZW5kaW5nIHRoZSBzZXJp
ZXMgYXMgdjguIFRoZSB2NyBzdWJtaXNzaW9uIGZhaWxlZCBkdWUgdG8gYW4gU01UUAo+PiA+ICAg
ZXJyb3IgZHVyaW5nIHRyYW5zaXQsIHdoaWNoIHJlc3VsdGVkIGluIGEgYnJva2VuIHRocmVhZCBv
biB0aGUgbWFpbGluZwo+PiA+ICAgbGlzdC4KPj4KPj4gSG0/IEV2ZXJ5dGhpbmcgaXMgaGVyZToK
Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNDEzLW9yYW5nZXBpLXNkLWNhcmQt
dWhzLXY3LTEtMTY2NTBmNDljMDIyQGdtYWlsLmNvbS8KPj4KPj4gWW91IGNhbiBzZW5kIGluZGl2
aWR1YWwgcGF0Y2hlcyB0byBmaXggdXAgdGhyZWFkaW5nLCB1c2UgLS1pbi1yZXBseS10by4KPgo+
IE15IGFwb2xvZ2llcyBmb3IgdGhlIG5vaXNlIGFuZCB0aGUgcmFwaWQgcmVzZW5kLgo+Cj4gVGhl
IHJlYXNvbiBmb3Igdjggd2FzIHRoYXQgdGhlIHY3IGNvdmVyIGxldHRlciAoMC85KSBmYWlsZWQg
dG8gcmVhY2gKPiB0aGUgbWFpbGluZyBsaXN0IGR1ZSB0byBhbiBTTVRQIGVycm9yIG9uIG15IGVu
ZC4gVGhpcyBsZWZ0IHRoZSB2Nwo+IHRocmVhZCAiaGVhZGxlc3MiIGluIHRoZSBhcmNoaXZlcyB3
aXRob3V0IHRoZSBjaGFuZ2Vsb2cgb3IgdGhlIGZ1bGwKPiBjb250ZXh0IG9mIHRoZSBzZXJpZXMu
IEkgd2FzIGF0dGVtcHRpbmcgdG8gZml4IHRoZSB0aHJlYWRpbmcKPiBpbW1lZGlhdGVseSBzbyB0
aGF0IHJldmlld2VycyB3b3VsZCBoYXZlIGEgY29tcGxldGUgc2V0IG9mIHBhdGNoZXMgdG8KPiBs
b29rIGF0LCBidXQgSSByZWFsaXplIG5vdyB0aGF0IHJlc2VuZGluZyB0aGUgZW50aXJlIHNlcmll
cyBvbiB0aGUKPiBzYW1lIGRheSB3YXMgcHJlbWF0dXJlLgpTbyB0aGF0J3Mgd2h5IEtyenlzenRv
ZiBzYWlkIHlvdSBzaG91bGQgc2VuZCBpbmRpdmlkdWFsIHBhdGNoIHdpdGggLS1pbi1yZXBseS10
by4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBUcm95CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
