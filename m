Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4A6EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dEshUNt9rmZ9N46nsanBZOmL/9ldP/v1Zlh2eelopBM=; b=XdEiyROBEOKHWH
	DVAL3bBw6EKKh70C9y4e6gjYUZsfy6pVeMdwQLzYjudRUzHB8aNvYJ6/p3DfbpiNt8lP0SlKUfwP3
	gkaXE6S46lJwQv6Hb4CPbjCNN9fo0vFE/5ldaQDYaWZCyxiLgtXMZ3XvN/V4Zszq/2XavR+RsrmPO
	zFwgdEodmj5sJT/sL9vC9Qx1f+Rr3ZFhJgmIUyibwEKG58hl/ZZ8Me0J+TLBUwz+zdmSwVS+dQSDf
	loncKz6L633IPUUFiinl2+0GfrRdEm0FiWp9sp5+qIn+kS7CBZx9oodty4PSjTz9ssQUj/voNmrej
	rec9xjfLJxjusmtwb4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC0zp-00F8GT-0T;
	Wed, 21 Jun 2023 16:47:53 +0000
Received: from tulikuusama2.dnainternet.net ([83.102.40.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC0zl-00F8EI-2C
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 16:47:52 +0000
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id D61551AB42;
	Wed, 21 Jun 2023 19:47:42 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from tulikuusama2.dnainternet.net ([83.102.40.151])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id ZzNQi-nukK-g; Wed, 21 Jun 2023 19:47:42 +0300 (EEST)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net [83.102.40.55])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 6FEF21A212;
	Wed, 21 Jun 2023 19:47:42 +0300 (EEST)
Received: from basile.localnet (87-92-194-88.rev.dnainternet.fi [87.92.194.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by luumupuu2.dnainternet.net (Postfix) with ESMTPS id C5F6C79;
	Wed, 21 Jun 2023 19:47:37 +0300 (EEST)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 Andy Chiu <andy.chiu@sifive.com>
Cc: =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
Date: Wed, 21 Jun 2023 19:47:37 +0300
Message-ID: <12784326.9UPPK3MAeB@basile.remlab.net>
Organization: Remlab
In-Reply-To: <878rccoprt.fsf@all.your.base.are.belong.to.us>
References: <mhng-6bb8dac2-33c3-410f-82ce-36554e497e9c@palmer-ri-x1c9>
 <878rccoprt.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_094750_053450_50AB427D 
X-CRM114-Status: GOOD (  33.79  )
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

TGUga2Vza2l2aWlra29uYSAyMS4ga2Vzw6RrdXV0YSAyMDIzLCAxNy4yNi4xNCBFRVNUIEJqw7Zy
biBUw7ZwZWwgYSDDqWNyaXQgOgo+IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29t
PiB3cml0ZXM6Cj4gPiBPbiBNb24sIDE5IEp1biAyMDIzIDEyOjAxOjIwIFBEVCAoLTA3MDApLCBi
am9ybkBrZXJuZWwub3JnIHdyb3RlOgo+ID4+IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3Np
bmMuY29tPiB3cml0ZXM6Cj4gPj4gCj4gPj4gWy4uLl0KPiA+PiAKPiA+Pj4+PiArCQlyaXNjdl92
X3ZzdGF0ZV9vZmYocmVncyk7Cj4gPj4+Pj4gKwo+ID4+Pj4gCj4gPj4+PiBOb3Qgb2ZmLCByaWdo
dD8gSXNuJ3QgaXQgX19yaXNjdl92X3ZzdGF0ZV9jbGVhbigpIHRoYXQgeW91J2QgbGlrZSB0bwo+
ID4+Pj4gY2FsbD8gU29tZXRoaW5nIGxpa2U6Cj4gPj4+PiAKPiA+Pj4+IHN0YXRpYyB2b2lkIHZz
dGF0ZV9kaXNjYXJkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4+Pj4gewo+ID4+Pj4gCj4gPj4+
PiAgICAgICAgaWYgKChyZWdzLT5zdGF0dXMgJiBTUl9WUykgPT0gU1JfVlNfRElSVFkpCj4gPj4+
PiAgICAgICAgCj4gPj4+PiAgICAgICAgICAgICAgICBfX3Jpc2N2X3ZfdnN0YXRlX2NsZWFuKHJl
Z3MpOwo+ID4+Pj4gCj4gPj4+PiB9Cj4gPj4+PiAKPiA+Pj4+IENvbXBsZW1lbnRlZCBieSBhICFW
IGNvbmZpZyB2YXJpYW50Lgo+ID4+PiAKPiA+Pj4gSSB0aGluayBpdCdzIGp1c3QgYSBxdWVzdGlv
biBvZiB3aGF0IHdlJ3JlIHRyeWluZyB0byBkbyBoZXJlOiBjbGVhbgo+ID4+PiBhdm9pZHMgdGhl
IGtlcm5lbCBWIHN0YXRlIHNhdmUsIGJ1dCB1bmxlc3MgdGhlIGtlcm5lbCBkZWNpZGVzIHRvIHVz
ZSBWCj4gPj4+IGR1cmluZyB0aGUgc3lzY2FsbCB0aGUgcmVnaXN0ZXIgY29udGVudHMgd2lsbCBz
dGlsbCBiZSB1c2FibGUgYnkKPiA+Pj4gdXNlcnNwYWNlLiAgTWF5YmUgdGhhdCdzIGZpbmUgYW5k
IHdlIGNhbiBqdXN0IHJlbHkgb24gdGhlIElTQSBzcGVjLAo+ID4+PiB0aG91Z2g/ICBJIHNlbnQg
YW5vdGhlciBwYXRjaCB0byBqdXN0IGRvY3VtZW50IGl0IGluIExpbnV4LCBldmVuIGlmIGl0J3MK
PiA+Pj4gaW4gdGhlIElTQSBzcGVjIGl0IHNlZW1zIHdvcnRoIGhhdmluZyBpbiB0aGUga2VybmVs
IGFzIHdlbGwuCj4gPj4+IAo+ID4+PiBUaGF0IHNhaWQsIEkgdGhpbmsgdGhlIHJpZ2h0IHRoaW5n
IHRvIGRvIGhlcmUgbWlnaHQgYmUgdG8gemVybyB0aGUgVgo+ID4+PiByZWdpc3RlciBzdGF0ZSBh
bmQgc2V0IGl0IHRvIGluaXRpYWw6IHRoYXQgd2F5IHdlIGNhbiBwcmV2ZW50IHVzZXJzcGFjZQo+
ID4+PiBmcm9tIGFjY2lkZW50YWxseSByZWx5aW5nIG9uIHRoZSBzdGF0ZSBzYXZlLCBidXQgd2Ug
Y2FuIGFsc28gYXZvaWQgdGhlCj4gPj4+IHRyYXAgdGhhdCB3b3VsZCBjb21lIGZyb20gdHVybmlu
ZyBpdCBvZmYuICBUaGF0IGxldHMgdXMgZ2l2ZSB0aGUKPiA+Pj4gaGFyZHdhcmUgYSBuaWNlIGNs
ZWFuIGluZGljYXRpb24gd2hlbiB0aGUgViBzdGF0ZSBpc24ndCBpbiB1c2UsIHdoaWNoCj4gPj4+
IHdpbGwgaG9wZWZ1bGx5IGhlbHAgdXMgYXZvaWQgdGhlIHNhdmUvcmVzdG9yZSBwZXJmb3JtYW5j
ZSBpc3N1ZXMgdGhhdAo+ID4+PiBvdGhlciBwb3J0cyBoYXZlIGhpdC4KPiA+PiAKPiA+PiBGV0lX
LCBJIHRoaW5rIHRoYXQncyBhIG11Y2ggYmV0dGVyIGlkZWEgdGhhbiB0dXJuaW5nIFYgb2ZmLiBJ
IGFsc28gbGlrZQo+ID4+IHRoYXQgaXQnbGwgcHJldmVudGluZyB1c2VybGFuZCB0byByZWx5IG9u
IHByZS1lY2FsbCBzdGF0ZS4KPiA+IAo+ID4gT0ssIGFueW9uZSBlbHNlIG9wcG9zZWQ/Cj4gPiAK
PiA+IFdlJ3JlIGtpbmQgb2YgaW4gdGhlIHdlZWRzIG9uIHBlcmZvcm1hbmNlLCBJIHRoaW5rIHdl
J2QgbmVlZCBIVyB0byBrbm93Cj4gPiBmb3Igc3VyZSBpZiBlaXRoZXIgaXMgYW4gaXNzdWUuICBT
ZWVtcyBiZXN0IHRvIGp1c3QgcGxheSBpdCBzYWZlIFdSVCB0aGUKPiA+IHVBQkkgZm9yIG5vdywg
d2UgY2FuIGFsd2F5cyBkZWFsIHdpdGggYW55IHBlcmZvcm1hbmNlIGlzc3VlcyBpZiB0aGUKPiA+
IGV4aXN0Lgo+IAo+IEhlcmUncyB0aGUgcGF0Y2ggeW91IG1lbnRpb25lZCBhdCB0aGUgUFcgc3lu
Y2h1cDsgSSd2ZSBrZXB0IHRoZSBTdWJqZWN0Cj4gYW5kIHN1Y2ggaWYgeW91IHdhbid0IHRvIGFw
cGx5IGl0LiBMTUsgaWYgeW91J2QgbGlrZSBhIHByb3BlciBvbmUuCj4gCj4gLS0KPiAKPiBTdWJq
ZWN0OiBbUEFUQ0hdIHJpc2N2OiBEaXNjYXJkIHZlY3RvciBzdGF0ZSBvbiBzeXNjYWxscwo+IE1J
TUUtVmVyc2lvbjogMS4wCj4gQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04
Cj4gQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+IAo+IFRoZSBSSVNDLVYgdmVjdG9y
IHNwZWNpZmljYXRpb24gc3RhdGVzOgo+ICAgRXhlY3V0aW5nIGEgc3lzdGVtIGNhbGwgY2F1c2Vz
IGFsbCBjYWxsZXItc2F2ZWQgdmVjdG9yIHJlZ2lzdGVycwo+ICAgKHYwLXYzMSwgdmwsIHZ0eXBl
KSBhbmQgdnN0YXJ0IHRvIGJlY29tZSB1bnNwZWNpZmllZC4KPiAKPiBUaGUgdmVjdG9yIHN0YXR1
cyBpcyBzZXQgdG8gSW5pdGlhbCwgYW5kIHRoZSB2ZWN0b3Igc3RhdGUgaXMKPiBleHBsaWNpdGx5
IHplcm9lZC4gVGhhdCB3YXkgd2UgY2FuIHByZXZlbnQgdXNlcnNwYWNlIGZyb20gYWNjaWRlbnRh
bGx5Cj4gcmVseWluZyBvbiB0aGUgc3RhdGVkIHNhdmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IC0tLQo+IGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdmVjdG9yLmggfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHMuYyAgICAgICB8ICAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rv
ci5oCj4gYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIGluZGV4IDA0YzBiMDdiZjZj
ZC4uYjMwMjBkMDY0ZjQyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVj
dG9yLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gQEAgLTE2Myw2
ICsxNjMsMjkgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fc3dpdGNoX3RvX3ZlY3RvcihzdHJ1Y3QK
PiB0YXNrX3N0cnVjdCAqcHJldiwgdm9pZCByaXNjdl92X3ZzdGF0ZV9jdHJsX2luaXQoc3RydWN0
IHRhc2tfc3RydWN0ICp0c2spOwo+ICBib29sIHJpc2N2X3ZfdnN0YXRlX2N0cmxfdXNlcl9hbGxv
d2VkKHZvaWQpOwo+IAo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl92c3RhdGVfZGlzY2Fy
ZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsJdW5zaWduZWQgbG9uZyB2bDsKPiArCj4g
KwlpZiAoIXJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHJlZ3MpKQo+ICsJCXJldHVybjsKPiArCj4gKwly
aXNjdl92X3ZzdGF0ZV9vbihyZWdzKTsKPiArCj4gKwlyaXNjdl92X2VuYWJsZSgpOwo+ICsJYXNt
IHZvbGF0aWxlICgKPiArCQkiLm9wdGlvbiBwdXNoXG5cdCIKPiArCQkiLm9wdGlvbiBhcmNoLCAr
dlxuXHQiCj4gKwkJInZzZXR2bGkJJTAsIHgwLCBlOCwgbTgsIHRhLCBtYVxuXHQiCj4gKwkJInZt
di52LmkJdjAsIDBcblx0Igo+ICsJCSJ2bXYudi5pCXY4LCAwXG5cdCIKPiArCQkidm12LnYuaQl2
MTYsIDBcblx0Igo+ICsJCSJ2bXYudi5pCXYyNCwgMFxuXHQiCj4gKwkJIi5vcHRpb24gcG9wXG5c
dCIKPiArCQk6ICI9JnIiICh2bCkgOiA6ICJtZW1vcnkiKTsKPiArCXJpc2N2X3ZfZGlzYWJsZSgp
OwoKU2hvdWxkbid0IHRoaXMgYWxzbyBzZXQgYHZpbGxgIHRvIDEgdXNpbmcgYHZzZXR2bGA/CgpJ
biBmYWN0LCBhIGZhc3RlciBhbHRlcm5hdGl2ZSBtYXkgeWV0IGJlIHRvICpvbmx5KiBzZXQgYW4g
aW52YWxpZCB2ZWN0b3IgCmNvbmZpZ3VyYXRpb24uIEl0J3MgcmF0aGVyIHVubGlrZWx5IHRoYXQg
dXNlci1zcGFjZSBjb2RlIHdvdWxkIHNldCBhIHZhbGlkIApjb25maWd1cmF0aW9uIGFuZCB1c2Ug
dmVjdG9ycyB3aXRob3V0IGxvYWRpbmcgdGhlbSBmaXJzdC4gSWYgaXQgZXZlciBkb2VzLCB0aGVu
IAppdCdzIHNvIGJyb2tlbiB0aGF0IHRoZSBrZXJuZWwgcHJvYmFibHkgZG9lc24ndCBuZWVkIHRv
IGNhcmUuCgotLSAK6Zu357Gz4oCn5b635bC8LeW6k+WwlOiSmQpodHRwOi8vd3d3LnJlbWxhYi5u
ZXQvCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
