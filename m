Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22CACD8CA4
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yL6IfcbDW9x7Ne7wRD9DZhlFLb79bByv8CP9Yey//Uk=; b=X/qJPYbptgENbh
	+qcDCZ50UyQAT91A2BJV3iHcUIip21psG7RLeZi7pPtB3eKnDBEfcHyBG5WuI/DOKm9IFweHN++b5
	AUmUDQWTGhh6W7idLzj7fJHF2GXH8kEuVunSvfm0+LhFXaP2g6MnV8Wu3u63QjNL7XwaZ38KuBpqT
	E4zRKy3H9f8bupw+HotX9XD4ZN4+bE5+R+kbSHWwtGbvZmbqjeku+9oqD87XZYjO0Ak8YuZYMrJZy
	k7IZhYfreifCkAp92Gk1RbV6xWbNtrU9UJz2WlHjjnp5xCfKt39OHYgFF2zcYNuhl4Hcn9GKPwBqv
	c7ZlVTNfAdtJUiJDmwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsc2-00000005BlQ-02zd;
	Tue, 09 Jun 2026 09:19:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsbz-00000005Bkj-2zDl;
	Tue, 09 Jun 2026 09:19:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0112840360;
	Tue,  9 Jun 2026 09:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95D71F00893;
	Tue,  9 Jun 2026 09:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780996746;
	bh=UnLSIOIPLrsgN1aJrq7sJm6YQFhZ+kBm+237OZTgZtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rf6WZ+J3P0F0wrd3ax1kk+wZcQgOIGh2lEH9DewE60K5vxhRKqNjVP5Fpb99QNYXB
	 iUWsONWJl7offoG7ybI8rLcdvEs4vqsw9d1ZxqF0LWd+dFvt9oaD99wwlVAEfHwbDe
	 +16ZDuTt2wUPOM1Bkg4Rq4EOdC+k69aJF/8QkKCwy5M1fsdyYEvZ6Kq+lE+x+bG3N1
	 9Wanm4yCdexYV9h7qjUzYjbQfIlh5gECJlpwbeIvMoggylNYxHdX/xRqBgftfbO3+a
	 zIOh6QowHakk3+HzJgIcX0IeA0Z0HjDtz/26TTyaZSVKUECFhkCGOg4KuvtfzikztN
	 0xv3dSD9sOu3w==
Date: Tue, 9 Jun 2026 11:19:00 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sunil V L <sunilvl@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/6] ACPI: RISC-V: Fix riscv_acpi_irq_get_dep() loop
 termination
Message-ID: <aifahCtdj8GpHN/v@lpieralisi>
References: <20260603-gic-v5-acpi-iwb-probe-deferral-v2-0-23ffa16b6ebb@kernel.org>
 <20260603-gic-v5-acpi-iwb-probe-deferral-v2-1-23ffa16b6ebb@kernel.org>
 <CAB19ukFFwm3ehzkBFr+oXRjA7VK_4_=XHFSuqdEpbVqUz8Do4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB19ukFFwm3ehzkBFr+oXRjA7VK_4_=XHFSuqdEpbVqUz8Do4Q@mail.gmail.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, loongarch@lists.linux.dev, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMDgsIDIwMjYgYXQgMDk6NTQ6MjhQTSArMDUzMCwgU3VuaWwgViBMIHdyb3Rl
Ogo+IEhpIExvcmVuem8sCj4gCj4gT24gV2VkLCBKdW4gMywgMjAyNiBhdCAxOjUx4oCvUE0gTG9y
ZW56byBQaWVyYWxpc2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSW4g
cmlzY3ZfYWNwaV9hZGRfaXJxX2RlcCgpIHRoZSBtYWluIGxvb3AgY29uZGl0aW9uIHdvdWxkIGN1
cnJlbnRseSBzdG9wCj4gPiB0aGUgbG9vcCBpZiBhbiBpbnRlcnJ1cHQgZGVzY3JpcHRvciBjb250
YWlucyBhbiBpbnRlcnJ1cHQgZm9yIHdoaWNoIHRoZQo+ID4gcmVzcGVjdGl2ZSBHU0kgaGFuZGxl
IGlzIE5VTEwsIHdoaWNoIGlzIG5vdCBjb3JyZWN0IGJlY2F1c2Ugc3Vic2VxdWVudAo+ID4gaW50
ZXJydXB0cyBpbiB0aGUgaW50ZXJydXB0IGRlc2NyaXB0b3IgbWlnaHQgc3RpbGwgaGF2ZSBhIEdT
SSBkZXBlbmRlbmN5Cj4gPiB0aGF0IG11c3Qgbm90IGJlIHNraXBwZWQuCj4gPgo+ID4gUmV3b3Jr
IHJpc2N2X2FjcGlfYWRkX2lycV9kZXAoKSBhbmQgdGhlIHJpc2N2X2FjcGlfaXJxX2dldF9kZXAo
KSBjYWxsIGNoYWluCj4gPiB0byBmaXggaXQgLSBieSBub3QgZm9yY2luZyB0aGUgbG9vcCB0byBz
dG9wIGluIG9yZGVyIHRvIGd1YXJhbnRlZQo+ID4gZGVwZW5kZW5jeSBkZXRlY3Rpb24gZm9yIGFs
bCB0aGUgaW50ZXJydXB0IGVudHJpZXMgaW4gdGhlIENSUyBkZXNjcmlwdG9yLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IExvcmVuem8gUGllcmFsaXNpIDxscGllcmFsaXNpQGtlcm5lbC5vcmc+Cj4g
PiBDYzogIlJhZmFlbCBKLiBXeXNvY2tpIiA8cmFmYWVsQGtlcm5lbC5vcmc+Cj4gPiBDYzogU3Vu
aWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2Fj
cGkvcmlzY3YvaXJxLmMgfCAxMCArKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9h
Y3BpL3Jpc2N2L2lycS5jIGIvZHJpdmVycy9hY3BpL3Jpc2N2L2lycS5jCj4gPiBpbmRleCA5Yjg4
ZDA5OTNlODguLmNkODNjMzAzNWNmNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvYWNwaS9yaXNj
di9pcnEuYwo+ID4gKysrIGIvZHJpdmVycy9hY3BpL3Jpc2N2L2lycS5jCj4gPiBAQCAtMjk5LDYg
KzI5OSw3IEBAIHN0YXRpYyBhY3BpX3N0YXR1cyByaXNjdl9hY3BpX2lycV9nZXRfcGFyZW50KHN0
cnVjdCBhY3BpX3Jlc291cmNlICphcmVzLCB2b2lkICpjCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gQUVfT0s7Cj4gPgo+ID4gICAgICAgICAgICAgICAgIGN0eC0+aGFuZGxlID0g
cmlzY3ZfYWNwaV9nZXRfZ3NpX2hhbmRsZShlaXJxLT5pbnRlcnJ1cHRzW2N0eC0+aW5kZXhdKTsK
PiA+ICsgICAgICAgICAgICAgICBjdHgtPnJjID0gMDsKPiA+ICAgICAgICAgICAgICAgICByZXR1
cm4gQUVfQ1RSTF9URVJNSU5BVEU7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiBAQCAtMzE0LDEwICsz
MTUsOCBAQCBzdGF0aWMgaW50IHJpc2N2X2FjcGlfaXJxX2dldF9kZXAoYWNwaV9oYW5kbGUgaGFu
ZGxlLCB1bnNpZ25lZCBpbnQgaW5kZXgsIGFjcGlfaAo+ID4KPiA+ICAgICAgICAgYWNwaV93YWxr
X3Jlc291cmNlcyhoYW5kbGUsIE1FVEhPRF9OQU1FX19DUlMsIHJpc2N2X2FjcGlfaXJxX2dldF9w
YXJlbnQsICZjdHgpOwo+ID4gICAgICAgICAqZ3NpX2hhbmRsZSA9IGN0eC5oYW5kbGU7Cj4gPiAt
ICAgICAgIGlmICgqZ3NpX2hhbmRsZSkKPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gMTsKPiA+
Cj4gPiAtICAgICAgIHJldHVybiAwOwo+ID4gKyAgICAgICByZXR1cm4gY3R4LnJjOwo+ID4gIH0K
PiA+Cj4gPiAgc3RhdGljIHUzMiByaXNjdl9hY3BpX2FkZF9wcnRfZGVwKGFjcGlfaGFuZGxlIGhh
bmRsZSkKPiA+IEBAIC0zODEsOCArMzgwLDExIEBAIHN0YXRpYyB1MzIgcmlzY3ZfYWNwaV9hZGRf
aXJxX2RlcChhY3BpX2hhbmRsZSBoYW5kbGUpCj4gPiAgICAgICAgIGludCBpOwo+ID4KPiA+ICAg
ICAgICAgZm9yIChpID0gMDsKPiA+IC0gICAgICAgICAgICByaXNjdl9hY3BpX2lycV9nZXRfZGVw
KGhhbmRsZSwgaSwgJmdzaV9oYW5kbGUpOwo+ID4gKyAgICAgICAgICAgICFyaXNjdl9hY3BpX2ly
cV9nZXRfZGVwKGhhbmRsZSwgaSwgJmdzaV9oYW5kbGUpOwo+ID4gICAgICAgICAgICAgIGkrKykg
ewo+ID4gKyAgICAgICAgICAgICAgIGlmICghZ3NpX2hhbmRsZSkKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlOwo+ID4gKwo+ID4gICAgICAgICAgICAgICAgIGRlcF9kZXZpY2Vz
LmNvdW50ID0gMTsKPiA+ICAgICAgICAgICAgICAgICBkZXBfZGV2aWNlcy5oYW5kbGVzID0ga3ph
bGxvY19vYmpzKCpkZXBfZGV2aWNlcy5oYW5kbGVzLCAxKTsKPiA+ICAgICAgICAgICAgICAgICBp
ZiAoIWRlcF9kZXZpY2VzLmhhbmRsZXMpIHsKPiA+Cj4gRG8gdGhlc2UgZml4ZXMgbmVlZCB0aGUg
Rml4ZXMgdGFnPwoKSSBjYW4gYWRkIGEgRml4ZXM6IHRhZyBidXQgSSB3YW50ZWQgZmlyc3Qgc29t
ZSBoZWxwIHRlc3RpbmcgdGhlbSwgaXQKaXMgY29kZSBwZXJ1c2FsIHRoYXQgZ290IG1lIHRoZXJl
LgoKPiBPdGhlcndpc2UsIExHVE0uCj4gUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEBv
c3MucXVhbGNvbW0uY29tPgoKVGhhbmtzLApMb3JlbnpvCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
