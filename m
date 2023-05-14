Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D66C7EE22
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 22:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Amxt3ZaioLM+cgO0H6+ZovgLFX/6dHmCWCTJ2v/AD2o=; b=M8lTsvyAqxcglV
	AA0S2WcGKm2oOVREusSR+gZxy+hkdpDERdUwE/3l7oEvaIdDhSY1daU5kPJG7p8wo5q4ZvCzZFkzZ
	x4bSlb0PShxAmFE4E3G4UmSgNW1IJbX2zSMIo5AAej9lhCQF5AXgqobvYYqqEae6UjxFOqe2Hk6Pq
	ySPiUIssybqRLuMSNLY7hPQjdab67TezNzVRmpwUz00Apl66TnbWhEzfnznBh0mJarALa/09Ten41
	XNBtm9gG8YLBvhnRQSrYeMaFxbMVadp7tiuwJf+FZI5sU8XJybhJnNdtOblWzsQGniC8d+4fxfNjE
	vUBWUKolGXiIqJ+oHzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyKDp-000O5Z-21;
	Sun, 14 May 2023 22:29:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyKDm-000O4R-2n
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 22:29:44 +0000
Received: from ip5b412278.dynamic.kabel-deutschland.de ([91.65.34.120] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pyKDi-000301-3F; Mon, 15 May 2023 00:29:38 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: 'Christoph Muellner' <christoph.muellner@vrull.eu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Aaron Durbin <adurbin@rivosinc.com>, Randy Dunlap <rdunlap@infradead.org>,
 Atish Patra <atishp@atishpatra.org>
Cc: David Laight <David.Laight@aculab.com>
Subject: Re: [RFC PATCH v2] riscv: Add Zawrs support for spinlocks
Date: Mon, 15 May 2023 00:29:30 +0200
Message-ID: <2679603.mvXUDI8C0e@diego>
In-Reply-To: <f04bd42eb93b4c4dbece34236a7b994b@AcuMS.aculab.com>
References:  <20220623152948.1607295-1-christoph.muellner@vrull.eu>
 <f04bd42eb93b4c4dbece34236a7b994b@AcuMS.aculab.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_152942_927061_E64D0AD3 
X-CRM114-Status: GOOD (  25.32  )
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

SGkgRGF2aWQsCgpBbSBGcmVpdGFnLCAyNC4gSnVuaSAyMDIyLCAxMDo1Mjo0MCBDRVNUIHNjaHJp
ZWIgRGF2aWQgTGFpZ2h0Ogo+IEZyb206IENocmlzdG9waCBNdWVsbG5lcgo+ID4gU2VudDogMjMg
SnVuZSAyMDIyIDE2OjMwCj4gPiAKPiA+IEZyb206IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0
b3BoLm11ZWxsbmVyQHZydWxsLmV1Pgo+ID4gCj4gPiBUaGUgY3VycmVudCBSSVNDLVYgY29kZSB1
c2VzIHRoZSBnZW5lcmljIHRpY2tldCBsb2NrIGltcGxlbWVudGF0aW9uLAo+ID4gdGhhdCBjYWxs
cyB0aGUgbWFjcm9zIHNtcF9jb25kX2xvYWRfcmVsYXhlZCgpIGFuZCBzbXBfY29uZF9sb2FkX2Fj
cXVpcmUoKS4KPiA+IEN1cnJlbnRseSwgUklTQy1WIHVzZXMgdGhlIGdlbmVyaWMgaW1wbGVtZW50
YXRpb24gb2YgdGhlc2UgbWFjcm9zLgo+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgUklTQy1W
IHNwZWNpZmljIGltcGxlbWVudGF0aW9uLCBvZiB0aGVzZQo+ID4gbWFjcm9zLCB0aGF0IHBlZWxz
IG9mZiB0aGUgZmlyc3QgbG9vcCBpdGVyYXRpb24gYW5kIG1vZGlmaWVzIHRoZSB3YWl0aW5nCj4g
PiBsb29wIHN1Y2gsIHRoYXQgaXQgaXMgcG9zc2libGUgdG8gdXNlIHRoZSBXUlMuU1RPIGluc3Ry
dWN0aW9uIG9mIHRoZSBaYXdycwo+ID4gSVNBIGV4dGVuc2lvbiB0byBzdGFsbCB0aGUgQ1BVLgo+
ID4gCj4gPiBUaGUgcmVzdWx0aW5nIGltcGxlbWVudGF0aW9uIG9mIHNtcF9jb25kX2xvYWRfKigp
IHdpbGwgb25seSB3b3JrIGZvcgo+ID4gMzItYml0IG9yIDY0LWJpdCB0eXBlcyBmb3IgUlY2NCBh
bmQgMzItYml0IHR5cGVzIGZvciBSVjMyLgo+ID4gVGhpcyBpcyBjYXVzZWQgYnkgdGhlIHJlc3Ry
aWN0aW9ucyBvZiB0aGUgTFIgaW5zdHJ1Y3Rpb24gKFJJU0MtViBvbmx5Cj4gPiBoYXMgTFIuVyBh
bmQgTFIuRCkuIENvbXBpbGVyIGFzc2VydGlvbnMgZ3VhcmQgdGhpcyBuZXcgcmVzdHJpY3Rpb24u
Cj4gPiAKPiA+IFRoaXMgcGF0Y2ggdXNlcyB0aGUgZXhpc3RpbmcgUklTQy1WIElTQSBleHRlbnNp
b24gZnJhbWV3b3JrCj4gPiB0byBkZXRlY3QgdGhlIHByZXNlbnRzIG9mIFphd3JzIGF0IHJ1bi10
aW1lLgo+ID4gSWYgYXZhaWxhYmxlIGEgTk9QIGluc3RydWN0aW9uIHdpbGwgYmUgcmVwbGFjZWQg
YnkgV1JTLk5UTyBvciBXUlMuU1RPLgo+ID4gCj4gPiBUaGUgd2hvbGUgbWVjaGFuaXNtIGlzIGdh
dGVkIGJ5IEtjb25maWcgc2V0dGluZywgd2hpY2ggZGVmYXVsdHMgdG8gWS4KPiA+IAo+ID4gVGhl
IFphd3JzIHNwZWNpZmljYXRpb24gY2FuIGJlIGZvdW5kIGhlcmU6Cj4gPiBodHRwczovL2dpdGh1
Yi5jb20vcmlzY3YvcmlzY3YtemF3cnMvYmxvYi9tYWluL3phd3JzLmFkb2MKPiA+IAo+ID4gTm90
ZSwgdGhhdCB0aGUgWmF3cnMgZXh0ZW5zaW9uIGlzIG5vdCBmcm96ZW4gb3IgcmF0aWZpZWQgeWV0
Lgo+ID4gVGhlcmVmb3JlIHRoaXMgcGF0Y2ggaXMgYW4gUkZDIGFuZCBub3QgaW50ZW5kZWQgdG8g
Z2V0IG1lcmdlZC4KPiA+IAo+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+ICogQWRkaW5nICJkZXBl
bmRzIG9uICFYSVBfS0VSTkVMIiB0byBSSVNDVl9JU0FfWkFXUlMKPiA+ICogRml4aW5nIHR5cGUg
Y2hlY2tpbmcgY29kZSBpbiBfX3NtcF9sb2FkX3Jlc2VydmVkKgo+ID4gKiBBZGp1c3RtZW50cyBh
Y2NvcmRpbmcgdG8gdGhlIHNwZWNpZmljYXRpb24gY2hhbmdlCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1PgoKSSdt
IG9ubHkgYWRkcmVzc2luZyB0aGUgcG9pbnQgaGVyZSB3ZXJlIEkgZG9uJ3QgYWdyZWUgd2l0aCB5
b3UgOi0pCkV2ZXJ5dGhpbmcgZWxzZSB3aWxsIGJlIGluIHRoZSBuZXh0IHZlcnNpb24uCgpbLi4u
XQoKPiA+ICsKPiA+ICsjZGVmaW5lIF9fX3NtcF9sb2FkX3Jlc2VydmVkTihwZngsIHB0cikJCQkJ
CVwKPiA+ICsoewkJCQkJCQkJCVwKPiA+ICsJdHlwZW9mKCpwdHIpIF9fX3AxOwkJCQkJCVwKPiA+
ICsJX19hc21fXyBfX3ZvbGF0aWxlX18gKCJsci4iIHBmeCAiCSVbcF0sICVbY11cbiIJCVwKPiA+
ICsJCQkgICAgICA6IFtwXSI9JnIiIChfX19wMSksIFtjXSIrQSIoKnB0cikpOwlcCj4gPiArCV9f
X3AxOwkJCQkJCQkJXAo+ID4gK30pCj4gCj4gSXNuJ3QgdGhhdCBtaXNzaW5nIHRoZSBtZW1vcnkg
cmVmZXJlbmNlPwo+IEl0IGVpdGhlciBuZWVkcyBhIGV4dHJhIG1lbW9yeSBwYXJhbWV0ZXIgZm9y
ICdwdHInIG9yCj4gYSBmdWxsL3BhcnRpYWwgbWVtb3J5IGNsb2JiZXIuCgpTaG91bGRuJ3QgdGhl
ICIrQSIgZm9yICpwdHIgc2hvdWxkIHRha2UgY2FyZSBvZiB0aGF0PwoKRnJvbSB0aGUgZ2NjIGRv
Y3MgWzBdOgoJ4oCYK+KAmSAgTWVhbnMgdGhhdCB0aGlzIG9wZXJhbmQgaXMgYm90aCByZWFkIGFu
ZCB3cml0dGVuIGJ5IHRoZSBpbnN0cnVjdGlvbi4KCgpIZWlrbwoKWzBdIGh0dHBzOi8vZ2NjLmdu
dS5vcmcvb25saW5lZG9jcy9nY2MvTW9kaWZpZXJzLmh0bWwjaW5kZXgtXzAwMmItaW4tY29uc3Ry
YWludAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
