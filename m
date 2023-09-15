Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227B1EEAA7E
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 01:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lU/hOa2JhZZCnCdhYOXxYjZGf1+xFcP2Or3gydgAMVk=; b=L+VGaiAnPVyZ3q
	4NNw4Vab3qL2iriS5/yNjpKXyI/l8plpncKmVw1p5uX9tn1fs8j+nuvUY5wDtm0Vdvj1f575KHCfh
	DaHzFLCed/pRBlsPx02Quck9/sAopHgIbWl/8146hVPaAFeFsuUnh4hAMF/aqX63h+dZfAkpy08w4
	FE+41f2CRJf62V+RaYlR/umjUz8mqBa5FCsnU04jW8gXozVpwuP4lfoOFJ6ws08P9K3rjYIMirHYI
	Bm506dZs1If2Z1wJkytKTF6r5ONQZU9wRUq+oXs9DuMWIKO7I4kn6VOLWuoys9RX991PxvUGPbDff
	AO/nJ4Nj4C89HzAVccjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgxJB-009XT5-1c;
	Fri, 15 Sep 2023 01:07:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgxJ8-009XSb-1y
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 01:07:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id BF3FCCE28C0;
	Fri, 15 Sep 2023 01:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D5BC433C7;
	Fri, 15 Sep 2023 01:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694740059;
	bh=2qssThBD41Ylgnh5IP3e9vNCGvCHCnS+bbAGYPLGYQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgdWViioCfGP6/WRmuTRIkX97grm99L4oGuroxy2Pbrc07prZUqoCnFXHR6A8ixpT
	 4N1nswvDo5bTzJWh362I62TLLtCRKp57o3E6Mb8ST8gCU3LnJm9vBQDhPcNqZeLn1W
	 OtiWKIG8xK8GWb5vCbpCcTTsrtP80ghof0pxE0yX869h0OdmW0BjJx8rtue0IHenbR
	 BlHZWlplX/Y/5aHaikqWlaf80SHiGEL7WTsGOCQ6Bqdv2RUsOrkmTZdPvBl2aYSVQx
	 8u8DEbnM1TMCYOl1z23yy+VmQaVXGaieaZphxHJBP4gAeU8wFn6cEJY5aBfIbErwNq
	 J2AEjR5jRQYzg==
Date: Fri, 15 Sep 2023 08:55:42 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org,
	PalmerDabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: boot time regressed a lot due to misaligned access probe
Message-ID: <ZQOrjszzxsO8YJag@xhacker>
References: <ZQD+0BWNU8wlnC9d@xhacker>
 <17d351c6-e6c3-43ce-a466-691778ba05c3@codethink.co.uk>
 <ZQHREHx4XCN70iUq@xhacker>
 <CALs-HssesyM7RJVaoHhPFk6SQP-J1pHF79rseYDZp=A++Cuy3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HssesyM7RJVaoHhPFk6SQP-J1pHF79rseYDZp=A++Cuy3g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_180743_002308_78694A3B 
X-CRM114-Status: GOOD (  34.19  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgMTI6NTA6NTRQTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCA4OjIz4oCvQU0gSmlzaGVuZyBaaGFuZyA8anN6
aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCAx
MTo0NjoyOEFNICswMTAwLCBCZW4gRG9va3Mgd3JvdGU6Cj4gPiA+IE9uIDEzLzA5LzIwMjMgMDE6
MTQsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiA+ID4gSGkgYWxsLAo+ID4gPiA+Cj4gPiA+ID4g
UHJvYmluZyBvbmUgY3B1IGZvciBtaXNhbGlnbmVkIGFjY2VzcyBjb3N0IGFib3V0IDAuMDZzLCBz
byBpdCB3aWxsIGNvc3QKPiA+ID4gPiBhYm91dCAzLjhzIG9uIHBsYXRmb3JtcyB3aXRoIDY0IENQ
VXMsIGZvciBleGFtcGxlLCBtaWxrdiBwaW9uZWVyIHdoaWNoCj4gPiA+ID4gaXMgcG93ZXJlZCBi
eSBzZzIwNDIuCj4gPiA+ID4KPiA+ID4gPiBJJ20gbm90IHN1cmUgdGhlIHJlYXNvbiBvZiBwcm9i
aW5nIG1pc2FsaWduZWQgYWNjZXNzIGZvciBhbGwgQ1BVcy4gSWYKPiA+ID4gPiB0aGUgSFcgZG9l
c24ndCBiZWhhdmUgYXMgU01QIGZyb20gbWlzYWxsaWduZWQgYWNjZXNzIHNpZGUsIHRoZW4gdW5s
ZXNzCj4gPiA+ID4gdXNlcnNwYWNlIHByb2Nlc3NlcyBmb3JjZSBjcHUgYWZmaW5pdHksIHRoZXkg
YWx3YXlzIHN1ZmZlciBmcm9tIHRoaXMKPiA+ID4gPiBub24tU01QIHBhaW4uCj4gPiA+ID4KPiA+
ID4gPiBTbywgY2FuIHdlIG9ubHkgcHJvYmUgdGhlIGJvb3QgY3B1Pwo+IAo+IEhpIEppc2hlbmcs
Cj4gVGhhbmtzIGZvciBpZGVudGlmeWluZyB0aGlzIHJlZ3Jlc3Npb24uIEknZCBwcmVmZXIgdG8g
a2VlcCB0aGUgcHJvYmluZwo+IG9uIGVhY2ggY3B1LCBhcyBJIGRvbid0IHRoaW5rIGl0J3Mgc2Fm
ZSB0byBhc3N1bWUgYmVoYXZpb3IgaXMgdGhlIHNhbWUKPiBhY3Jvc3MgYWxsIGNvcmVzLiBCdXQg
dGhlcmUncyBubyByZWFzb24gdGhpcyBuZWVkcyB0byBiZSBkb25lCj4gc2VyaWFsbHksIHdlIHNo
b3VsZCBiZSBhYmxlIHRvIGRvIHRoZSBjaGVja2luZyBpbiBwYXJhbGxlbCBvbiBlYWNoCj4gY3B1
LiBJIGRvbid0IGhhdmUgYSBwaHlzaWNhbCA2NC1jb3JlIHN5c3RlbSwgYnV0IEkgZXhwZXJpbWVu
dGVkIHdpdGgKPiBxZW11IGEgYml0Ogo+IAo+IFdpdGggbWlzYWxpZ25lZCBwcm9iaW5nCj4gWyAg
ICAwLjU1ODkzMF0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BVcyAuLi4KPiBbICAgIDcu
NjM1NTgwXSBzbXA6IEJyb3VnaHQgdXAgMSBub2RlLCA2NCBDUFVzCj4gCj4gV2l0aCBubyBtaXNh
bGlnbmVkIHByb2JpbmcKPiBbICAgIDAuNDczMDEyXSBzbXA6IEJyaW5naW5nIHVwIHNlY29uZGFy
eSBDUFVzIC4uLgo+IFsgICAgNS40Mzg0NTBdIHNtcDogQnJvdWdodCB1cCAxIG5vZGUsIDY0IENQ
VXMKPiAKPiBXaXRoIGNoYW5nZSBiZWxvdzoKPiBbICAgIDAuNjE1Njg0XSBzbXA6IEJyaW5naW5n
IHVwIHNlY29uZGFyeSBDUFVzIC4uLgo+IFsgICAgNS40ODkwNDVdIHNtcDogQnJvdWdodCB1cCAx
IG5vZGUsIDY0IENQVXMKPiAKPiBJIGFsc28gY29tbWVudGVkIG91dCB0aGUgcHJfaW5mbygpIGlu
IG15IHRlc3RpbmcsIG1vc3RseSB0byBrZWVwIHRoZQo+IFVBUlQgb3V0IG9mIHRoZSB3YXkuIFdl
IHNob3VsZCBzdHJpdmUgdG8gaW1wcm92ZSB0aGUgc21wIGNvcmUgYnJpbmd1cAo+IHRpbWUgaW4g
Z2VuZXJhbCwgYnV0IGhvcGVmdWxseSB3aXRoIHRoaXMgdGhlIG1pc2FsaWduZWQgcHJvYmluZyB3
b24ndAo+IGJlIG1ha2luZyBpdCB3b3JzZS4gSWYgdGhpcyB3b3JrcyBmb3IgeW91IEkgY2FuIGNs
ZWFuIGl0IHVwIGFuZCBzdWJtaXQKPiBhIHBhdGNoIChzb3JyeSBnbWFpbCBtYW5nbGVzIHRoZSBk
aWZmKToKClRoZSBwYXRjaCBpbXByb3ZlZCB0aGUgYm9vdCB0aW1lIGEgbG90ISBUaGFua3MKCkZl
ZWwgZnJlZSB0byBhZGQ6ClRlc3RlZC1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwu
b3JnPgo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiBpbmRleCAxYjhkYTRlNDBhNGQuLjdkY2UzMGI3Yzg2
OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiBAQCAtMjIzLDggKzIyMywxOCBAQCBpbnQgX19jcHVf
dXAodW5zaWduZWQgaW50IGNwdSwgc3RydWN0IHRhc2tfc3RydWN0ICp0aWRsZSkKPiAgICAgICAg
IHJldHVybiByZXQ7Cj4gIH0KPiAKPiArc3RhdGljIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
c19jcHUodm9pZCAqdW51c2VkKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21w
X3Byb2Nlc3Nvcl9pZCgpOwo+ICsKPiArICAgICAgIC8qIFNvbWVvbmUgaGFzIHRvIHN0YXkgYmVo
aW5kIGFuZCB0ZW5kIHRoZSBqaWZmaWVzLiAqLwo+ICsgICAgICAgaWYgKGNwdSAhPSAwKQo+ICsg
ICAgICAgICAgICAgICBjaGVja191bmFsaWduZWRfYWNjZXNzKGNwdSk7Cj4gK30KPiArCj4gIHZv
aWQgX19pbml0IHNtcF9jcHVzX2RvbmUodW5zaWduZWQgaW50IG1heF9jcHVzKQo+ICB7Cj4gKyAg
ICAgICBvbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2NwdSwgTlVMTCwgMCk7Cj4g
IH0KPiAKPiAgLyoKPiBAQCAtMjQ2LDcgKzI1Niw2IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZv
aWQgc21wX2NhbGxpbih2b2lkKQo+IAo+ICAgICAgICAgbnVtYV9hZGRfY3B1KGN1cnJfY3B1aWQp
Owo+ICAgICAgICAgc2V0X2NwdV9vbmxpbmUoY3Vycl9jcHVpZCwgMSk7Cj4gLSAgICAgICBjaGVj
a191bmFsaWduZWRfYWNjZXNzKGN1cnJfY3B1aWQpOwo+IAo+ICAgICAgICAgaWYgKGhhc192ZWN0
b3IoKSkgewo+ICAgICAgICAgICAgICAgICBpZiAocmlzY3Zfdl9zZXR1cF92c2l6ZSgpKQo+IAo+
IC1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
