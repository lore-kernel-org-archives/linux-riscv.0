Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48550C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 08:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7758HaUuFYQ28m1bIlJUUQSUjlVlBfJbqUjR6VcS1U=; b=TX8UHp4L8IDZt+
	u+LP/AXJERVu49waJg5jmR/1oYKKrSn+yFx26rpzpgA+nxUm+TIZTd+b+ozjfEJIJQqsDfs+wdjvf
	KP9a5xDwnvZwgV4yKTEhD4rORYrGV4oUsGhcWfhkL8cdPC4V4XExmggPljUBOPZAtP+SzYwZfm4dl
	c3XRGl3YstGqYg16Wq33eZl8iuo5AB/MPX3IrcRqX7lo49e6VSUU91sBTUOWEaCbzzLZZMa5A2dLz
	moKO3/3FhBb0omBNd0go9vOjXsKRNW6NaulR50c4MerB/esNEEzHS45Z+eyeLpN2ZL6vuDbhem6AC
	ah+zuDXBHT5c3FLgWvdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvZgM-00BlD9-1q;
	Wed, 25 Oct 2023 08:56:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvZgJ-00BlCk-3A
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 08:56:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2FCAC61507;
	Wed, 25 Oct 2023 08:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7016EC433C8;
	Wed, 25 Oct 2023 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698224162;
	bh=8Bq3Qbr/gkUku/+SWoEdJgAMfakCIxzCaI3vtlBxij0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uUljIP0nXjpIJwp0WDGa9ZfJn/zLuzz3k43zWJq4sGpb8ZuHWM7LAb8VPIJivr+MV
	 LFuMNqCL/2FMw72a12OQh1D1zoQ5PXSyE0Zz0yVxVXJllKkcyXMuXuNQVLvKcqDj3Q
	 PshpFP9LtcjXFQ0i2zLTznMLaCFqHtWUWlSVZw6xP6auTvTC4U8CuY5VWL8gt3xl1q
	 uVccUUx1xQmsx2izxdQdY1LZMkKy/l0dcJQUw92LTiZKx4or3GnnUq6pzRapDhCKbS
	 sZ7m+xYxOKQloKVkVQTXoprD1S1sdCzXVGnOcAG6EEOFa+/qHKAi+CLNy23Nc63Mz1
	 gse8XjPHTo1xA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v11 09/14] irqchip/riscv-imsic: Add support for PCI MSI
 irqdomain
In-Reply-To: <CAK9=C2UVgTd-a0671Lab_ZeOPWP3=wHY+pydKHqaR-Yg65YhrA@mail.gmail.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-10-apatel@ventanamicro.com>
 <8734y0rwtw.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2UVgTd-a0671Lab_ZeOPWP3=wHY+pydKHqaR-Yg65YhrA@mail.gmail.com>
Date: Wed, 25 Oct 2023 10:55:59 +0200
Message-ID: <87jzrbf5cw.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_015604_124741_1B657EC3 
X-CRM114-Status: GOOD (  21.44  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gT24gVHVlLCBP
Y3QgMjQsIDIwMjMgYXQgNjozOeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Pgo+PiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JpdGVz
Ogo+Pgo+PiA+IFRoZSBMaW51eCBQQ0kgZnJhbWV3b3JrIHJlcXVpcmVzIGl0J3Mgb3duIGRlZGlj
YXRlZCBNU0kgaXJxZG9tYWluIHNvCj4+ID4gbGV0IHVzIGNyZWF0ZSBQQ0kgTVNJIGlycWRvbWFp
biBhcyBjaGlsZCBvZiB0aGUgSU1TSUMgYmFzZSBpcnFkb21haW4uCj4+ID4KPj4gPiBTaWduZWQt
b2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPj4gPiAtLS0KPj4g
PiAgZHJpdmVycy9pcnFjaGlwL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrCj4+
ID4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYyB8IDUxICsrKysr
KysrKysrKysrKysrKysrKysKPj4gPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1z
dGF0ZS5oICAgIHwgIDEgKwo+PiA+ICAzIGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKykK
Pj4gPgo+PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvS2NvbmZpZyBiL2RyaXZlcnMv
aXJxY2hpcC9LY29uZmlnCj4+ID4gaW5kZXggYmRkODA3MTYxMTRkLi5jMWQ2OWI0MThkZmIgMTAw
NjQ0Cj4+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL0tjb25maWcKPj4gPiArKysgYi9kcml2ZXJz
L2lycWNoaXAvS2NvbmZpZwo+PiA+IEBAIC01NTIsNiArNTUyLDEzIEBAIGNvbmZpZyBSSVNDVl9J
TVNJQwo+PiA+ICAgICAgIHNlbGVjdCBJUlFfRE9NQUlOX0hJRVJBUkNIWQo+PiA+ICAgICAgIHNl
bGVjdCBHRU5FUklDX01TSV9JUlEKPj4gPgo+PiA+ICtjb25maWcgUklTQ1ZfSU1TSUNfUENJCj4+
ID4gKyAgICAgYm9vbAo+PiA+ICsgICAgIGRlcGVuZHMgb24gUklTQ1ZfSU1TSUMKPj4gPiArICAg
ICBkZXBlbmRzIG9uIFBDSQo+PiA+ICsgICAgIGRlcGVuZHMgb24gUENJX01TSQo+PiA+ICsgICAg
IGRlZmF1bHQgUklTQ1ZfSU1TSUMKPj4gPiArCj4+ID4gIGNvbmZpZyBFWFlOT1NfSVJRX0NPTUJJ
TkVSCj4+ID4gICAgICAgYm9vbCAiU2Ftc3VuZyBFeHlub3MgSVJRIGNvbWJpbmVyIHN1cHBvcnQi
IGlmIENPTVBJTEVfVEVTVAo+PiA+ICAgICAgIGRlcGVuZHMgb24gKEFSQ0hfRVhZTk9TICYmIEFS
TSkgfHwgQ09NUElMRV9URVNUCj4+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtaW1zaWMtcGxhdGZvcm0uYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMt
cGxhdGZvcm0uYwo+PiA+IGluZGV4IDIzZDI4NmNiMDE3ZS4uY2RiNjU5NDAxMTk5IDEwMDY0NAo+
PiA+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYwo+PiA+
ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYwo+PiA+IEBA
IC0xMyw2ICsxMyw3IEBACj4+ID4gICNpbmNsdWRlIDxsaW51eC9pcnFkb21haW4uaD4KPj4gPiAg
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+PiA+ICAjaW5jbHVkZSA8bGludXgvbXNpLmg+Cj4+
ID4gKyNpbmNsdWRlIDxsaW51eC9wY2kuaD4KPj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgo+PiA+ICAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KPj4gPiAgI2luY2x1
ZGUgPGxpbnV4L3NtcC5oPgo+PiA+IEBAIC0yMTUsNiArMjE2LDQyIEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaXJxX2RvbWFpbl9vcHMgaW1zaWNfYmFzZV9kb21haW5fb3BzID0gewo+PiA+ICAjZW5k
aWYKPj4gPiAgfTsKPj4gPgo+PiA+ICsjaWZkZWYgQ09ORklHX1JJU0NWX0lNU0lDX1BDSQo+PiA+
ICsKPj4gPiArc3RhdGljIHZvaWQgaW1zaWNfcGNpX21hc2tfaXJxKHN0cnVjdCBpcnFfZGF0YSAq
ZCkKPj4gPiArewo+PiA+ICsgICAgIHBjaV9tc2lfbWFza19pcnEoZCk7Cj4+ID4gKyAgICAgaXJx
X2NoaXBfbWFza19wYXJlbnQoZCk7Cj4+Cj4+IEkndmUgYXNrZWQgdGhpcyBiZWZvcmUsIGJ1dCBJ
IHN0aWxsIGRvbid0IGdldCB3aHkgeW91IG5lZWQgdG8gcHJvcGFnYXRlCj4+IHRvIHRoZSBwYXJl
bnQ/IFdoeSBpc24ndCBtYXNraW5nIG9uIFBDSSBlbm91Z2g/Cj4+Cj4KPiBXZSBhcmUgdXNpbmcg
aGllcmFyY2hpY2FsIElSUSBkb21haW5zIHdoZXJlIElNU0lDLUJBU0UgaXMKPiB0aGUgcm9vdCBk
b21haW4gd2hlcmVhcyBJTVNJQy1QTEFUIGRvbWFpbiAoTVNJIGlycSBkb21haW4KPiBmb3IgcGxh
dGZvcm0gZGV2aWNlcykgYW5kIElNU0lDLVBDSSBkb21haW4gKE1TSSBpcnEgZG9tYWluCj4gZm9y
IFBDSSBkZXZpY2VzKS4gRm9yIGhpZXJhcmNoaWNhbCBJUlEgZG9tYWlucywgaWYgaXJxIGRvbWFp
biBYCj4gZG9lcyBub3QgaW1wbGVtZW50IGlycV9tYXNrL3VubWFzayB0aGVuIHRoZSBwYXJlbnQg
aXJxCj4gZG9tYWluIGlycV9tYXNrL3VubWFzayBpcyBjYWxsZWQgd2l0aCBwYXJlbnQgaXJxIGRl
c2NyaXB0b3IuCj4KPiBOb3cgZm9yIElNU0lDLVBDSSBkb21haW4sIHRoZSBQQ0kgZnJhbWV3b3Jr
IGV4cGVjdHMgdGhlCj4gcGNpX21zaV9tYXNrL3VubWFza19pcnEoKSBmdW5jdGlvbnMgdG8gYmUg
Y2FsbGVkIGJ1dCBpZgo+IHdlIGRpcmVjdGx5IHBvaW50IHBjaV9tc2lfbWFzay91bm1hc2tfaXJx
KCkgaW4gdGhlIElNU0lDLVBDSQo+IGlycWNoaXAgdGhlbiBJTVNJQy1CQVNFIChwYXJlbnQgZG9t
YWluKSBpcnFfbWFzay91bWFzawo+IHdvbid0IGJlIGNhbGxlZCBoZW5jZSB0aGUgSVJRIHdvbid0
IGJlIG1hc2tlZC91bm1hc2suCj4gRHVlIHRvIHRoaXMsIHdlIGNhbGwgYm90aCBwY2lfbXNpX21h
c2svdW5tYXNrX2lycSgpIGFuZAo+IGlycV9jaGlwX21hc2svdW5tYXNrX3BhcmVudCgpIGZvciBJ
TVNJQy1QQ0kgZG9tYWluLgoKT2suIEkgd29udCBkaWcgbW9yZSBpbnRvIGl0IGZvciBub3chIElm
IHRoZSBpbnRlcnJ1cHQgaXMgZGlzYWJsZWQgYXQKUENJLCBpdCBzZWVtcyBhIGJpdCBvdmVya2ls
bCB0byAqYWxzbyogbWFzayBpdCBhdCB0aGUgSU1TSUMgbGV2ZWwuLi4KCgpCasO2cm4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
