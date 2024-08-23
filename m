Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A86C531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 17:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lkG8Vu7zQxAqa6q29S49C5B0pH2tLzWQbJsrgaJEPhw=; b=J+Ur6D3R72erl4
	eJjmq8Lgao7rKUtBODWHyCcuzrkItlXR1xV6sWHaVPczGRwIidyMtsOf2WaK1J6f9W9Jrl2lQQXh9
	PD4VxWq0eRtmyj13reXGQnNVa4AJCG+BIl7bVx0E3ODiU/OgnW+7YyzzZXEjjkgOnkV0z7h3+mmjP
	2V5fH1aMK/1VsTuoSsYa1qHWaeHA9/Tgm+Gqv5hCixeGah8YTVRJ+rBH7o4dJ21CyQfqZqX0vM/wq
	pbTuRAtcU0MIkADYvZu0lAkwwQm7pzvfwkXAF0FZjD1AyINi1aSRjd+2Jh/ck12+aE+dLQBsKRucn
	ZJYAk8dX21KQ27zNiS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYN2-00000000CZ1-432S;
	Fri, 23 Aug 2024 17:46:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYMG-00000000CQT-0mw1;
	Fri, 23 Aug 2024 17:45:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A153A428B6;
	Fri, 23 Aug 2024 17:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86113C32786;
	Fri, 23 Aug 2024 17:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724435154;
	bh=mr01yUEvX26NmVp0jXUcMup0uPWebEfYc7j3GsM8fjs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=eHPWSEM9ZihA42Y4ZITQjghgyKSJcIG+f546BaW4ykszsvYxOtxHN3kY+roDFfypS
	 1Z9tclp0ated/Dhp/CvM2h9Ud1w3QZ0bHZ2CTxLSlxzllhTeLw5uPjmHTGHMKpkj4/
	 lmXTBuktRhntuUv0huFq2r3cauXx9sAoYuaR7MG4J2Gfb81ZobYpbyP1N+62I+hBEx
	 5mrnYORL607W41D7saiW13gfbqhH9lxljbJxnnkQOkizrXTjNhjEQPOsvWSUTv6MV/
	 MhbpPkybGZDDzm0hTA/q1WEp4NF7mpuV2RFgVBiP/sTbhrP6B7qssbGeadwmnRBufj
	 LJkiPqsE47CKQ==
Date: Fri, 23 Aug 2024 12:45:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v8 08/17] ACPI: pci_link: Clear the dependencies after
 probe
Message-ID: <20240823174552.GA375227@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsgtNbBLfP3SygYv@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_104556_377115_AEC743BE 
X-CRM114-Status: GOOD (  33.32  )
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

T24gRnJpLCBBdWcgMjMsIDIwMjQgYXQgMTI6MDM6MjVQTSArMDUzMCwgU3VuaWwgViBMIHdyb3Rl
Ogo+IE9uIFRodSwgQXVnIDIyLCAyMDI0IGF0IDA0OjQ0OjE1UE0gLTA1MDAsIEJqb3JuIEhlbGdh
YXMgd3JvdGU6Cj4gPiBPbiBNb24sIEF1ZyAxMiwgMjAyNCBhdCAwNjoyOToyMEFNICswNTMwLCBT
dW5pbCBWIEwgd3JvdGU6Cj4gPiA+IFJJU0MtViBwbGF0Zm9ybXMgbmVlZCB0byB1c2UgZGVwZW5k
ZW5jaWVzIGJldHdlZW4gUENJIGhvc3QgYnJpZGdlLCBMaW5rCj4gPiA+IGRldmljZXMgYW5kIHRo
ZSBpbnRlcnJ1cHQgY29udHJvbGxlcnMgdG8gZW5zdXJlIHByb2JlIG9yZGVyLiBUaGUKPiA+ID4g
ZGVwZW5kZW5jeSBpcyBsaWtlIGJlbG93Lgo+ID4gPiAKPiA+ID4gSW50ZXJydXB0IGNvbnRyb2xs
ZXIgPC0tIExpbmsgRGV2aWNlIDwtLSBQQ0kgSG9zdCBicmlkZ2UuCj4gPiA+IAo+ID4gPiBJZiB0
aGVyZSBpcyBubyBkZXBlbmRlbmN5IGJldHdlZW4gTGluayBkZXZpY2UgYW5kIFBDSSBIb3N0IEJy
aWRnZSwKPiA+ID4gdGhlbiBQQ0kgZGV2aWNlcyBtYXkgYmUgcHJvYmVkIHByaW9yIHRvIExpbmsg
ZGV2aWNlcy4gIElmIGEgUENJCj4gPiA+IGRldmljZSBpcyBwcm9iZWQgYmVmb3JlIGl0cyBMaW5r
IGRldmljZSwgd2Ugd29uJ3QgYmUgYWJsZSB0byBmaW5kCj4gPiA+IGl0cyBJTlR4IG1hcHBpbmcu
Cj4gPiAKPiA+IFRoaXMgc2VlbXMgdG8gZXhwbGFpbiB3aHkgd2Ugd2FudCB0aGVzZSBkZXBlbmRl
bmNpZXMsIHdoaWNoIGlzIHVzZWZ1bCwKPiA+IGJ1dCAqdGhpcyogcGF0Y2ggb25seSByZW1vdmVz
IHRoZSBkZXBlbmRlbmNpZXMuCj4gPiAKPiA+IE1heWJlIHRoaXMgZGVzY3JpcHRpb24gc2hvdWxk
IGJlIGluIHRoZSBwYXRjaCB0aGF0ICphZGRzKiB0aGUKPiA+IGRlcGVuZGVuY2llcywgZS5nLiwg
IkFDUEk6IFJJU0MtVjogSW1wbGVtZW50IGZ1bmN0aW9uIHRvIGFkZCBpbXBsaWNpdAo+ID4gZGVw
ZW5kZW5jaWVzIj8KPiA+Cj4gT2theS4gTGV0IG1lIG1vdmUgdGhpcyB0byB0aGUgcGF0Y2ggeW91
IHN1Z2dlc3RlZC4KCkdpdmVuIG15IGZvcmdldGZ1bG5lc3MgYW5kIHlvdXIgcG9pbnRpbmcgb3V0
IHRoYXQgdGhpcyAqZG9lcyogYWRkIHRoZQpkZXBlbmRlbmNpZXMgKGJ5IHZpcnR1ZSBvZiBhZGRp
bmcgUE5QMEMwRiB0byB0aGUgYWNwaV9ob25vcl9kZXBfaWRzW10KbGlzdCksIGl0IGRvZXMgbWFr
ZSBzZW5zZSBoZXJlLgoKPiA+ID4gU28sIGFkZCB0aGUgbGluayBkZXZpY2UncyBISUQgdG8gZGVw
ZW5kZW5jeSBob25vciBsaXN0IGFuZCBjbGVhciB0aGUKPiA+ID4gZGVwZW5kZW5jeSBhZnRlciBw
cm9iZSBpcyBkb25lIHNvIHRoYXQgdGhlIGRlcGVuZGVudCBkZXZpY2VzIGFyZQo+ID4gPiB1bmJs
b2NrZWQgdG8gcHJvYmUuCgpNYXliZSBleHBhbmRpbmcgdGhpcyB0byAiQWRkIHRoZSBsaW5rIGRl
dmljZXMgSElEIChQTlAwQzBGKSB0byB0aGUKYWNwaV9ob25vcl9kZXBfaWRzW10gZGVwZW5kZW5j
eSBsaXN0IiB3b3VsZCBoZWxwIGNvbm5lY3QgdGhpcyBhbGwKdG9nZXRoZXI/Cgo+ID4gVGhpcyBz
dGlsbCBjbGFpbXMgdGhpcyBwYXRjaCBhZGRzIEhJRCwgd2hpY2ggSSBkb24ndCB0aGluayBpdCBk
b2VzLgo+ID4KPiBQbGVhc2Ugc2VlIGJlbG93Lgo+ICAKPiA+ID4gU2lnbmVkLW9mZi1ieTogU3Vu
aWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+IFRlc3RlZC1ieTogQmrDg8K2
cm4gVMODwrZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJz
L2FjcGkvcGNpX2xpbmsuYyB8IDIgKysKPiA+ID4gIGRyaXZlcnMvYWNwaS9zY2FuLmMgICAgIHwg
MSArCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9wY2lfbGluay5jIGIvZHJpdmVycy9hY3BpL3BjaV9s
aW5rLmMKPiA+ID4gaW5kZXggYWExMDM4YjhhZWM0Li5iNzI3ZGI5NjhmMzMgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2RyaXZlcnMvYWNwaS9wY2lfbGluay5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvYWNwaS9w
Y2lfbGluay5jCj4gPiA+IEBAIC03NDgsNiArNzQ4LDggQEAgc3RhdGljIGludCBhY3BpX3BjaV9s
aW5rX2FkZChzdHJ1Y3QgYWNwaV9kZXZpY2UgKmRldmljZSwKPiA+ID4gIAlpZiAocmVzdWx0KQo+
ID4gPiAgCQlrZnJlZShsaW5rKTsKPiA+ID4gIAo+ID4gPiArCWFjcGlfZGV2X2NsZWFyX2RlcGVu
ZGVuY2llcyhkZXZpY2UpOwo+ID4gPiArCj4gPiA+ICAJcmV0dXJuIHJlc3VsdCA8IDAgPyByZXN1
bHQgOiAxOwo+ID4gPiAgfQo+ID4gPiAgCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkv
c2Nhbi5jIGIvZHJpdmVycy9hY3BpL3NjYW4uYwo+ID4gPiBpbmRleCAyOGEyMjFmOTU2ZDcuLjc1
MzUzOWExZjI2YiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9hY3BpL3NjYW4uYwo+ID4gPiAr
KysgYi9kcml2ZXJzL2FjcGkvc2Nhbi5jCj4gPiA+IEBAIC04NjMsNiArODYzLDcgQEAgc3RhdGlj
IGNvbnN0IGNoYXIgKiBjb25zdCBhY3BpX2hvbm9yX2RlcF9pZHNbXSA9IHsKPiA+ID4gIAkiSU5U
QzEwQ0YiLCAvKiBJVlNDIChNVEwpIGRyaXZlciBtdXN0IGJlIGxvYWRlZCB0byBhbGxvdyBpMmMg
YWNjZXNzIHRvIGNhbWVyYSBzZW5zb3JzICovCj4gPiA+ICAJIlJTQ1YwMDAxIiwgLyogUklTQy1W
IFBMSUMgKi8KPiA+ID4gIAkiUlNDVjAwMDIiLCAvKiBSSVNDLVYgQVBMSUMgKi8KPiA+ID4gKwki
UE5QMEMwRiIsICAvKiBQQ0kgTGluayBEZXZpY2UgKi8KPgo+IFRoaXMgaXMgdGhlIGNoYW5nZSB3
aGljaCBJIG1lYW50IGFkZGluZyBISUQgdG8gdGhlIGhvbm9yIGxpc3QuIERvIHlvdQo+IHJlY29t
bWVuZCB0byBtYWtlIHRoaXMgY2hhbmdlIHNlcGFyYXRlIHBhdGNoIHNvIHRoYXQgaXQgZG9lc24n
dCBjb25mdXNlCj4gd2l0aCBhZGRpbmcgYSBuZXcgSElEIHRvIHRoZSBwcm9iZSBtYXRjaCB0YWJs
ZT8KCk9oLCByaWdodCwgc29ycnkuICBJIHJlbWVtYmVyIHdvcmtpbmcgdGhpcyBvdXQgaW4gdGhl
IHBhc3QsIGJ1dCBJIGhhZApmb3Jnb3R0ZW4uCgpJIHRoaW5rIGl0IG1ha2VzIHNlbnNlIGluIHRo
aXMgcGF0Y2ggYmVjYXVzZSB0aGUgYWRkIGFuZCByZW1vdmFsIGFyZQptYXRjaGVkIHdoZW4gdGhl
eSdyZSBpbiB0aGUgc2FtZSBwYXRjaC4KClNvcnJ5IGZvciB0aGUgbm9pc2UhCgpCam9ybgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
