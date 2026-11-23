Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C9606A321
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eJRLMebb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K/y9pfHw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k4vi4FYk+kVij9VoB8Wo5tpZwQj+/8j8s+4f2tNxlyU=; b=eJRLMebb/s94yAcH8V1RZLUtEg
	QTO+tHKYQHDoWZ6VgrVz4FPyp/FWr1vPLKRN0OP+uLiAfBcckWJCoVQJfqK0QpVlYbakaFX0TBKmT
	R1HNHWX2MDwkI040hUR6knldjJobDZOwrGUrem6pKYISBF60/zO/NJUVQ8gOLHuAMVEUy9eHiOcmZ
	Vzk7kcwENK1rtE6Qg+X6LgB5XTHsh5sl19NY4ySLjqzWqpkb8WVDAgVHFIzwODqNYKmgqiIDMLnZJ
	BBYVyrYFCFZDwBBLe2UakxBqpJyEsxF6v9j4KMAbymOtiDJkt6g9WDT5ZTT0xFT3tfUf2/uBFsAg5
	m1RDznAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS19-000000036KA-2gOl;
	Mon, 23 Nov 2026 11:15:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS18-000000036K3-2Dti
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 11:15:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02D3B62036
	for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 11:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6911F000CF
	for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 11:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432525;
	bh=m3FH9Inv0u/v073kkt2usO8SlhkKeOQiuSBxAimhluw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=K/y9pfHw73GAzlQmjcS8+MU0hJ8thxYc/h57qMiaqMrJ+OooIQ7e6zCy5J1ExTCOw
	 Gg25ykrF33YovsTmHj1GbKy7l8KOXILBz5cnbjfGkrhJMgiGpNvmmgKINppoUFYRRz
	 ZIX3zb38lJxxOn+WxaH1WcqayE3K+LNgAqctj4DthFl/N27KMZcLwZqwiVchho0hEX
	 wYVrn9zlhW0Cri0FY6YxxuAk/DTdcHmuJbDWfRdSLBhikl7PMfhjjQyELOX0VoeWhU
	 I2skRoq2HGc6n149rtUDlYooV7hTQ9H0YYar+/eW5Z7VBI+ofZMEoYMYMiZet+MGrS
	 6sQ7+1a9Lw/GQ==
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1682341f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 03:15:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGiEuMGX/1WQ9/VZY7NCG2FqFZxve8yq5mjPtmxNlP3KtDmDCvX4DF2eB8xuC9x4y61855AJ5Mxa1iQIQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+sGySonxBOGp3kA1Noa88pXmTvSCc5BvrgNcZVYccrf2HBmlfp
	QGw8qJs3dBZcifywl22TWPo4+UJ6S99NTNutnvUq05k07GbGYff3fwlCrPsV5YaPSnoZeI7m4l8
	xwxXAgCAp7S6Ubqh9E55uMg3zdhHX/bk=
X-Received: by 2002:a05:6000:4381:b0:4a6:5a2a:f5a3 with SMTP id
 ffacd0b85a97d-4abaa9773abmr21927640f8f.3.1795432522530; Mon, 23 Nov 2026
 03:15:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120012712.1957564-1-guoren@kernel.org> <awPgjwuswbjeDftg@thelio>
In-Reply-To: <awPgjwuswbjeDftg@thelio>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 23 Nov 2026 19:15:07 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ+cOYfQX=JsK6T6Aij79FU9RGuyxAAouyL958z8ABqng@mail.gmail.com>
X-Gm-Features: Aa3M54qkVWzvIW1E3JY7I_38vKo1jeuZ7f-WFYjpRl8FFdSV5EvMxwly24Z7rYs
Message-ID: <CAJF2gTQ+cOYfQX=JsK6T6Aij79FU9RGuyxAAouyL958z8ABqng@mail.gmail.com>
Subject: Re: [PATCH V6] riscv: errata: Add ERRATA WRITE_ONCE fixup
To: Drew Fustini <fustini@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, arnd@arndb.de, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Leonardo Bras <leobras@redhat.com>, Inochi Amaoto <inochiama@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, 
	Yao Zi <me@ziyao.cc>, Chen Wang <unicorn_wang@outlook.com>, 
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Paul Walmsley <pjw@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMjMsIDIwMjYgYXQgMjo0M+KAr1BNIERyZXcgRnVzdGluaSA8ZnVzdGluaUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDE5LCAyMDI2IGF0IDA4OjI3OjEyUE0g
LTA1MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4gRnJvbTogIkdVTyBSZW4gKFh1YW5U
aWUpIiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPgo+ID4gVGhlIGVhcmx5IHZlcnNpb24gb2YgWHVh
blRpZSBDOTEwIGNvcmUgaGFzIGEgc3RvcmUgbWVyZ2UgYnVmZmVyCj4gPiBkZWxheSBwcm9ibGVt
LiBUaGUgc3RvcmUgbWVyZ2UgYnVmZmVyIGNvdWxkIGltcHJvdmUgdGhlIHN0b3JlIHF1ZXVlCj4g
PiBwZXJmb3JtYW5jZSBieSBtZXJnaW5nIG11bHRpLXN0b3JlIHJlcXVlc3RzLCBidXQgd2hlbiB0
aGVyZSBhcmUgbm90Cj4gPiBjb250aW51ZWQgc3RvcmUgcmVxdWVzdHMsIHRoZSBwcmlvciBzaW5n
bGUgc3RvcmUgcmVxdWVzdCB3b3VsZCBiZQo+ID4gd2FpdGluZyBpbiB0aGUgc3RvcmUgcXVldWUg
Zm9yIGEgbG9uZyB0aW1lLiBUaGF0IHdvdWxkIGNhdXNlCj4gPiBzaWduaWZpY2FudCBwcm9ibGVt
cyBmb3IgY29tbXVuaWNhdGlvbiBiZXR3ZWVuIG11bHRpLWNvcmVzLiBUaGlzCj4gPiBwcm9ibGVt
IHdhcyBmb3VuZCBvbiBzZzIwNDIgcGxhdGZvcm0gd2l0aCB0aGUgcXNwaW5sb2NrIGxvY2sgdG9y
dHVyZQo+ID4gdGVzdC4KPiA+Cj4gPiBTbyBhcHBlbmRpbmcgYSBmZW5jZSB3Lm8gY291bGQgaW1t
ZWRpYXRlbHkgZmx1c2ggdGhlIHN0b3JlIG1lcmdlCj4gPiBidWZmZXIgYW5kIGxldCBvdGhlciBj
b3JlcyBzZWUgdGhlIHdyaXRlIHJlc3VsdC4KPiA+Cj4gPiBUaGlzIHdpbGwgYXBwbHkgdGhlIFdS
SVRFX09OQ0UgZXJyYXRhIHRvIGhhbmRsZSB0aGUgbm9uLXN0YW5kYXJkCj4gPiBiZWhhdmlvciB2
aWEgYXBwZW5kaW5nIGEgZmVuY2Ugdy5vIGluc3RydWN0aW9uIGZvciBXUklURV9PTkNFKCkuCj4g
Pgo+ID4gVGhpcyBwcm9ibGVtIGlzIG9ubHkgb2JzZXJ2ZWQgb24gdGhlIHNnMjA0MiBoYXJkd2Fy
ZSBwbGF0Zm9ybSBieQo+ID4gcnVubmluZyB0aGUgbG9ja190b3J0dXJlIHRlc3QgcHJvZ3JhbSBm
b3IgaGFsZiBhbiBob3VyLiBUaGUgcHJvYmxlbQo+ID4gd2FzIG5vdCBmb3VuZCBpbiB0aGUgdXNl
ciBzcGFjZSBhcHBsaWNhdGlvbiwgYmVjYXVzZSBpbnRlcnJ1cHQgY2FuCj4gPiBicmVhayB0aGUg
bGl2ZWxvY2suCj4gPgo+ID4gQWNrZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
Cj4gPiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29t
Pgo+ID4gUmV2aWV3ZWQtYnk6IExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4KPiA+
IFJldmlld2VkLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgo+ID4gVGVz
dGVkLWJ5OiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4gPiBUZXN0ZWQtYnk6IFlhbyBa
aSA8bWVAeml5YW8uY2M+Cj4gPiBDYzogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5j
b20+Cj4gPiBDYzogWGlhb2d1YW5nIFhpbmcgPHhpYW9ndWFuZy54aW5nQHNvcGhnby5jb20+Cj4g
PiBDYzogUGF1bCBXYWxtc2xleSA8cGp3QGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBH
VU8gUmVuIChYdWFuVGllKSA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gWy4uXQo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIGIvYXJjaC9yaXNjdi9lcnJhdGEv
dGhlYWQvZXJyYXRhLmMKPiA+IGluZGV4IDZmMWM2ODNmMGVjMC4uNjQ2ODM4ODJkNTBiIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKPiA+ICsrKyBiL2Fy
Y2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCj4gPiBAQCAtMTY4LDYgKzE2OCwyMyBAQCBz
dGF0aWMgYm9vbCBlcnJhdGFfcHJvYmVfZ2hvc3R3cml0ZSh1bnNpZ25lZCBpbnQgc3RhZ2UsCj4g
PiAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBib29sIGVycmF0YV9w
cm9iZV93cml0ZV9vbmNlKHVuc2lnbmVkIGludCBzdGFnZSwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyY2hfaWQsIHVuc2lnbmVkIGxvbmcgaW1w
aWQpCj4gPiArewo+ID4gKyAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19FUlJBVEFfVEhFQURf
V1JJVEVfT05DRSkpCj4gPiArICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICsKPiA+ICsg
ICAgIC8qIHRhcmdldC1jOXh4IGNvcmVzIHJlcG9ydCBhcmNoX2lkIGFuZCBpbXBpZCBhcyAwICov
Cj4gPiArICAgICBpZiAoYXJjaF9pZCAhPSAwIHx8IGltcGlkICE9IDApCj4gPiArICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPgo+IERvZXNuJ3QgdGhpcyBtYXRjaCBtb3JlIFNvQ3MgdGhhbiBq
dXN0IHRoZSBTRzIwNDIgYW5kIFRIMTUyMCBsaWtlIHRoZQo+IGNvbW1pdCBtZXNzYWdlIG1lbnRp
b25zPwpUaGUgaXNzdWUgaGFzIG9ubHkgYmVlbiBvYnNlcnZlZCBvbiBTRzIwNDIsIHRob3VnaCBU
SDE1MjAgaXMKdGhlb3JldGljYWxseSBhZmZlY3RlZCBhcyB3ZWxsLiBUbyB0aGUgYmVzdCBvZiBt
eSBrbm93bGVkZ2UsIGl0IGhhcwpub3QgYmVlbiBvYnNlcnZlZCBvbiBhbnkgb3RoZXIgY2hpcHMu
Cgo+Cj4gWy4uXQo+Cj4gPiArI2lmIGRlZmluZWQoQ09ORklHX0VSUkFUQV9USEVBRF9XUklURV9P
TkNFKSAmJiAhZGVmaW5lZChOT19BTFRFUk5BVElWRSkKPiA+ICsKPiA+ICsjZGVmaW5lIHdyaXRl
X29uY2VfZmVuY2UoKSAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICtkbyB7ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIGFz
bSB2b2xhdGlsZShBTFRFUk5BVElWRSggICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAg
ICAgICAgICAgIm5vcCIsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsg
ICAgICAgICAgICAgImZlbmNlIHcsIG8iLCAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPgo+
IEkgdHJpZWQgdGhpcyBvbiB2Ny40LXJjMyBpbiBxZW11IHdpdGggLWNwdSB0aGVhZC1jOTA2IHdo
aWNoIG1hdGNoZXMgdGhpcwo+IGVycmF0YSwgYW5kIEkgZGlzY292ZXJlZCBib290IGZhaWxzIHdo
ZW4gQ09ORklHX0RFQlVHX1ZJUlRVQUw9eS4KPgo+ICAga2VybmVsIEJVRyBhdCBtbS92bWFsbG9j
LmM6ODc5IQo+ICAgZXBjIDogdm1hbGxvY190b19wYWdlKzB4MjEyLzB4MjYwCj4gICAgcmEgOiBw
YXRjaF9pbnNuX3dyaXRlKzB4MWEyLzB4NDE0Cj4gICBbLi4uXQo+ICAgWzxmZmZmZmZmZjgwMjZi
YTFhPl0gdm1hbGxvY190b19wYWdlKzB4MjEyLzB4MjYwCj4gICBbPGZmZmZmZmZmODAwMGZhNzY+
XSBwYXRjaF9pbnNuX3dyaXRlKzB4MWEyLzB4NDE0Cj4gICBbPGZmZmZmZmZmODAwMGZjZjY+XSBw
YXRjaF90ZXh0X25vc3luYysweGUvMHgyMgo+ICAgWzxmZmZmZmZmZjgwMDFiODg2Pl0gdGhlYWRf
ZXJyYXRhX3BhdGNoX2Z1bmMrMHhhYy8weDE0NAo+ICAgWzxmZmZmZmZmZjgwMDA5NTQ4Pl0gX2Fw
cGx5X2FsdGVybmF0aXZlcysweDc2LzB4OTYKPiAgIFs8ZmZmZmZmZmY4MGUwMzhhND5dIGFwcGx5
X2Jvb3RfYWx0ZXJuYXRpdmVzKzB4NDgvMHg1NAo+ICAgWzxmZmZmZmZmZjgwZTA0ZDRhPl0gc2V0
dXBfYXJjaCsweDkyLzB4ZTgKPgo+IFRoZSB2ZHNvIGdldHJhbmRvbSBjb2RlIHVzZXMgV1JJVEVf
T05DRSgpLCBzbyBpdCBub3cgaGFzIGVudHJpZXMgaW4KPiAuYWx0ZXJuYXRpdmUuIHBhdGNoX21h
cCgpIGVuZHMgdXAgY2FsbGluZyB2bWFsbG9jX3RvX3BhZ2UoKSBvbiBhbgo+IGFkZHJlc3MgaW4g
dGhlIHZkc28gYW5kIHRyaWdnZXJzIFZJUlRVQUxfQlVHX09OKCkuCk9oLCB0aHggRHJldyBmb3Ig
Y2F0Y2hpbmcgaXQuIEkgd291bGQgZGlzYWJsZSBpdCBpbiBWRFNPIGNvZGUuCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9yd29uY2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcndvbmNlLmgKaW5kZXggMDgxNzkzZDRkNzcyLi41MzA1YjhiZjgyYmQgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcndvbmNlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9yd29uY2UuaApAQCAtOCw3ICs4LDcgQEAKICNpbmNsdWRlIDxhc20vdmVuZG9yaWRfbGlz
dC5oPgogI2luY2x1ZGUgPGFzbS9lcnJhdGFfbGlzdF92ZW5kb3JzLmg+CgotI2lmIGRlZmluZWQo
Q09ORklHX0VSUkFUQV9USEVBRF9XUklURV9PTkNFKSAmJiAhZGVmaW5lZChOT19BTFRFUk5BVElW
RSkKKyNpZiBkZWZpbmVkKENPTkZJR19FUlJBVEFfVEhFQURfV1JJVEVfT05DRSkgJiYKIWRlZmlu
ZWQoTk9fQUxURVJOQVRJVkUpICYmICFkZWZpbmVkKEJVSUxEX1ZEU08pCgogI2RlZmluZSB3cml0
ZV9vbmNlX2ZlbmNlKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIGRvIHsKCi0tCkJl
c3QgUmVnYXJkcwoKCgogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
