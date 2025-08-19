Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCF5CA0EF8
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 04:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oaS9ccdepk9WS/PSFO1ZPvhcnQxAiGfPJJ4FiKiJHjo=; b=3JfMe5uaM8uPtX
	n4RQDDy04twywnadrUzVom373H/LXK08IQQOskm86snzV8KCfUmTxKE98kC9XS5u27DKkuwOMBi71
	+wXHzYwDLykCF1vIXNVTEEjvuqGSgxwL6F25Nbjh8AoqkeXKeKyluMANFKgWzdc3KBjobHp4uetTA
	GrEbtcd9FvbnYtujdBn44jnbPMygw2LPK5HqBxVWkjVBzJkxM5d53CzEycVZgrjDPHK1xFVZqoevC
	rZyO+lPaladw9y/pIofguGH6BSB5k3g2ob2rEcV+wM16Q0D0NTQhKKF8nTCrmmAwsOThr+VbHTpoN
	zJIT4g48eFXdLiCIYX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDlL-00000009MVi-2KmN;
	Tue, 19 Aug 2025 04:15:55 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDjA-00000009MJc-18tm
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 04:13:41 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D078020231;
	Tue, 19 Aug 2025 06:13:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSk0OFjhhhF4; Tue, 19 Aug 2025 06:13:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755576817; bh=DhIsH4a4nwX9+RwiotdBhF0SwVQjZJAUqYd/yZv69vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JsD7IzuZeXU2/yFlG8pvtEdg+GtGdWqUU7nxLoo7TjykKicbf4mp6zk/KXK75jnTC
	 nO+8sglKM2rGWBWpT9ZO0H4p1mqYacMreelmx7fHdYEPn1xTHuBDQXD2znGXYd1utI
	 yyxh+SwtjDbRZHeyZAUCtRUghd8WbUdAEfUuzow9qpN1b8NeH/nQP66x9LwhSTk7jf
	 8ogvZnxdnhWn8gt1bXkthvdzkdQjeMs/rhPzRWWwJgWrlRpKr2J0eUk3VrahJIRNGo
	 /XT5I7XnKGzNFYSGRy6R3GfIqxmJZtCUOi6GUZ+UNgB3M6M54n2ET/Xa081Td3mAcy
	 kboUcTnk31PeQ==
Date: Tue, 19 Aug 2025 04:13:27 +0000
From: Yao Zi <ziyao@disroot.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Subject: Re: [PATCH v2 2/2] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
Message-ID: <aKP553e1S5RCYNhU@pie>
References: <20250818143600.894385-1-apatel@ventanamicro.com>
 <20250818143600.894385-3-apatel@ventanamicro.com>
 <aKPu2g1MOZBBzQbV@pie>
 <CAK9=C2XmDGOz9_euC4vtchOxr+8f+m+9zZYVewCc2s7GZhd4Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XmDGOz9_euC4vtchOxr+8f+m+9zZYVewCc2s7GZhd4Pw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_211340_446490_6BF197F1 
X-CRM114-Status: GOOD (  31.60  )
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

T24gVHVlLCBBdWcgMTksIDIwMjUgYXQgMDk6MDA6MDNBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUdWUsIEF1ZyAxOSwgMjAyNSBhdCA4OjU24oCvQU0gWWFvIFppIDx6aXlhb0BkaXNy
b290Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBBdWcgMTgsIDIwMjUgYXQgMDg6MDY6MDBQ
TSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gSW4gUklTQy1WLCB0aGVyZSBpcyBubyBD
U1IgcmVhZC93cml0ZSBpbnN0cnVjdGlvbiB3aGljaCB0YWtlcyBDU1IKPiA+ID4gbnVtYmVyIHZp
YSByZWdpc3RlciBzbyBhZGQgY29tbW9uIGNzcl9yZWFkX251bSgpIGFuZCBjc3Jfd3JpdGVfbnVt
KCkKPiA+ID4gZnVuY3Rpb25zIHdoaWNoIGFsbG93IGFjY2Vzc2luZyBjZXJ0YWluIENTUnMgYnkg
cGFzc2luZyBDU1IgbnVtYmVyCj4gPiA+IGFzIHBhcmFtZXRlci4gVGhlc2UgY29tbW9uIGZ1bmN0
aW9ucyB3aWxsIGJlIGZpcnN0IHVzZWQgYnkgdGhlCj4gPiA+IEFDUEkgQ1BQQyBkcml2ZXIgYW5k
IFJJU0MtViBQTVUgZHJpdmVyLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVs
IDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8
c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY3NyLmggfCAgIDMgKwo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUg
ICB8ICAgMSArCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jc3IuYyAgICAgIHwgMTY1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICBkcml2ZXJzL2FjcGkvcmlzY3Yv
Y3BwYy5jICAgIHwgIDE3ICsrLS0KPiA+ID4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXUuYyAgICAg
fCAgNTQgKystLS0tLS0tLS0tCj4gPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDE4NCBpbnNlcnRpb25z
KCspLCA1NiBkZWxldGlvbnMoLSkKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2
L2tlcm5lbC9jc3IuYwo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiA+ID4gaW5kZXggNmZl
ZDQyZTM3NzA1Li4xNTQwNjI2YjM1NDAgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY3NyLmgKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+
ID4gPiBAQCAtNTc1LDYgKzU3NSw5IEBACj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA6ICJtZW1vcnkiKTsgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiAgfSkKPiA+ID4KPiA+
ID4gK2V4dGVybiB1bnNpZ25lZCBsb25nIGNzcl9yZWFkX251bSh1bnNpZ25lZCBsb25nIGNzcl9u
dW0sIGludCAqb3V0X2Vycik7Cj4gPiA+ICtleHRlcm4gdm9pZCBjc3Jfd3JpdGVfbnVtKHVuc2ln
bmVkIGxvbmcgY3NyX251bSwgdW5zaWduZWQgbG9uZyB2YWwsIGludCAqb3V0X2Vycik7Cj4gPgo+
ID4gSSB0aGluayBpdCdzIG1vcmUgY29uc2lzdGVudCB0byBkaXJlY3RseSByZXR1cm4gdGhlIGVy
cm9yIGNvZGUsIGFuZCBmb3IKPiA+IGNzcl9yZWFkX251bSwgd2UgY291bGQgcGFzcyBvdXQgdGhl
IHJlYWQgdmFsdWUgYnkgYSBwb2ludGVyLiBlLmcuCj4gPgo+ID4gICAgICAgICBpbnQgY3NyX3Jl
YWRfbnVtKHVuc2lnbmVkIGxvbmcgY3NyX251bSwgdW5zaWduZWQgbG9uZyAqdmFsKTsKPiA+ICAg
ICAgICAgaW50IGNzcl93cml0ZV9udW0odW5zaWduZWQgbG9uZyBjc3JfbnVtLCB1bnNpZ25lZCBs
b25nIHZhbCk7Cj4gPgo+ID4gVGhpcyBhbGxvd3MgdGhlIGNhbGxlciB0byBlbGltaW5hdGUgYSB2
YXJpYWJsZSBmb3IgdGVtcG9yYXJpbHkgc3RvcmluZwo+ID4gdGhlIGVycm9yIGNvZGUgaWYgdGhl
eSB1c2UgaXQganVzdCBhZnRlciB0aGUgaW52b2thdGlvbiwgYW5kIGZpdHMgdGhlCj4gPiBjb21t
b24gY29udmVudGlvbiBvZiBMaW51eCBiZXR0ZXIuCj4gCj4gRHJldyBoYWQgc2ltaWxhciBjb21t
ZW50cyBzbyBzZWUgbXkgcmVzcG9uc2UgaW4gdGhlIHByZXZpb3VzCj4gcGF0Y2ggcmV2aXNpb24u
IChSZWZlciwgaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMva2VybmVsL21zZzU4MDgxMTMu
aHRtbCkKClRoYW5rcyBmb3IgdGhlIHJlZmVyZW5jZS4KCj4gSSBoYWQgY29uc2lkZXJlZCB0aGlz
IGJ1dCB0aGUgcHJvYmxlbSB3aXRoIHRoaXMgYXBwcm9hY2ggaXMgdGhhdAo+IGluZGl2aWR1YWwg
c3dpdGNoIGNhc2VzIGluIGNzcl9yZWFkX251bSgpIGJlY29tZSByb3VnaGx5IDQKPiBpbnN0cnVj
dGlvbnMgYmVjYXVzZSB2YWx1ZSByZWFkIGZyb20gQ1NSIGhhcyB0byB3cml0dGVuIHRvIGEgbWVt
b3J5Cj4gbG9jYXRpb24uCgpZb3UgY291bGQgcmV0dXJuIGEgc3RydWN0dXJlIHNtYWxsZXIgdGhh
biBvciBlcXVhbCB0byAyICogWExFTiBmcm9tCmNzcl9yZWFkX251bSgpLCBhY2NvcmRpbmcgdG8g
dGhlIEFCSSBpdCBjb3VsZCBiZSBwYXNzZWQgaW4gYTAgYW5kIGExIGFuZAp0aHVzIHNob3VsZCBy
ZXF1aXJlIG5vIG1lbW9yeSBvcGVyYXRpb24uCgpMZXQncyBhc3N1bWUgd2UgaGF2ZQoKCXN0cnVj
dCBfX2Nzcl9yZWFkX3JldCB7CgkJbG9uZyBlcnJvcjsKCQl1bnNpZ25lZCBsb25nIHZhbHVlOwoJ
fTsKCglzdHJ1Y3QgX19jc3JfcmVhZF9yZXQgX19jc3JfcmVhZF9udW0odW5zaWduZWQgbG9uZyBj
c3JfbnVtKTsKClRoZW4gYSB3cmFwcGVyIGxpa2UKCgkvKiBwaWVjZSBvZiB1bnRlc3RlZCBjb2Rl
ICovCglzdGF0aWMgaW5saW5lIGludCBjc3JfcmVhZF9udW0odW5zaWduZWQgbG9uZyBjc3JfbnVt
LAoJCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgKnZhbCkKCXsKCQlzdHJ1Y3QgX19jc3JfcmVhZF9y
ZXQgcmV0ID0gX19jc3JfcmVhZF9udW0oY3NyX251bSk7CgkJKnZhbCA9IHJldC52YWx1ZTsKCQly
ZXR1cm4gcmV0LmVycm9yOwoJfQoKY291bGQgcHJvdmlkZSBhbiBpbnRlcmZhY2UgdGhhdCBJJ3Zl
IHRhbGtlZCBhYm91dCBlYXJsaWVyLCBhbmQgaXQKZm9sbG93cyB0aGUga2VybmVsJ3MgY29udmVu
dGlvbi4KCj4gVGhlIGN1cnJlbnQgYXBwcm9hY2ggcmVzdWx0cyBpbiBqdXN0IDIgaW5zdHJ1Y3Rp
b25zIGZvciBlYWNoCj4gc3dpdGNoLWNhc2UuIEFkZGl0aW9uYWxseSwgdGhlIGN1cnJlbnQgcHJv
dG90eXBlcyBvZiBjc3JfcmVhZF9udW0oKQo+IGFuZCBjc3Jfd3JpdGVfbnVtKCkgYXJlIGNsb3Nl
ciB0byBjc3JfcmVhZCgpIGFuZCBjc3Jfd3JpdGUoKQo+IHJlc3BlY3RpdmVseS4KCkJ1dCBjc3Jf
cmVhZCgpIGFuZCBjc3Jfd3JpdGUoKSBuZXZlciBkaXJlY3RseSByYWlzZSBlcnJvcnMgdGhhdCBp
cwpleHBlY3RlZCB0byBiZSBoYW5kbGVkIGJ5IHRoZSBjYWxsZXIuIEkgZG9uJ3QgdGhpbmsgaXQn
cyBhIGZhaXIKY29tcGFyaXNvbi4KCj4gUmVnYXJkcywKPiBBbnVwCgpCZXN0IHJlZ2FyZHMsCllh
byBaaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
