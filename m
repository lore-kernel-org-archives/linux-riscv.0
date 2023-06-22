Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D13FEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 04:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eVMHpXmWXvUEqJqfvG0jCFL5PLLjxZRPxH3fBBNeog=; b=O5aqH7YG4Y0MSv
	P1CqWF70Aej0bzFK3yiItouWl8FIplUKQLQf+M/Usf+TY17bAcHn0XV66CwUUAXL5fTRBknhFDWI3
	0PDOGgRmbmx0dmu57DLUxcCPNcMGEoT0tIwNrX67/6wh1I1fxw5mBXi0JbMK3OuZU/cV+ie8WLgmK
	ceKEfLodopmsNOA8xkTm/98fZtRgNsuf11oDTCD2ArEkilOsYjxPwFZp/vb5cUjbutvSlbxc/q9xA
	kPIt7MKKYtldKm/oZXsc5YafMtEKIhlalOwQywRAhJ0fMQ4uriekOl38beFkAGuNf/sQDvycJ5IiB
	2u55x30l5tyRhGDQu79Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCCMc-00Gqep-24;
	Thu, 22 Jun 2023 04:56:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCCMZ-00Gqe9-34
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 04:56:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3763E616AA;
	Thu, 22 Jun 2023 04:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51232C433C8;
	Thu, 22 Jun 2023 04:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687409766;
	bh=g7D6HBzEigVjHztCXXrF3KEb3b7m425hu9GVu3l4Q2g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UBpFByEME8DHHgZfpMLxsOftIX/Geuj9XgTa40W7vsgj0Q1NItCXIdzDyyXC8LEMz
	 Dl0TF/XxzLn0/S5CQf0ezwE87ckKMEby4x45rr/snH2Yk4dHit9lHL4p8dLn3i/Ccw
	 /2BB8CZMUDKC/zJVxMM5M6n+67HximIqY1ufCtYxMgfoqsWVn+CbpMLsmnTS+NPogz
	 dd7gpY6jcCi3CSAwchyzoVvMgdf206spTgGOvjqygOV5TwvEvHRBtfwySmnPbOdgYa
	 ooJtBauPXcp5WVbqN4qT4qzKvwDgybR+WogGi4xNQtpm21WQv1aMqmzfDqn/Wuxy4d
	 8jdv+rbXkq+cw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, Bjorn Topel <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, david@redhat.com,
 osalvador@suse.de, virtualization@lists.linux-foundation.org,
 linux@rivosinc.com, alexghiti@rivosinc.com
Subject: Re: [PATCH 3/7] riscv: mm: Refactor create_linear_mapping_range()
 for hot add
In-Reply-To: <mhng-ec7e2bae-2eb8-45c5-b7e4-bc2a931760df@palmer-ri-x1c9a>
References: <mhng-ec7e2bae-2eb8-45c5-b7e4-bc2a931760df@palmer-ri-x1c9a>
Date: Thu, 22 Jun 2023 06:56:04 +0200
Message-ID: <87y1kcumcb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_215608_087705_37D2C943 
X-CRM114-Status: GOOD (  14.81  )
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

UGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3JpdGVzOgoKPiBPbiBGcmksIDEy
IE1heSAyMDIzIDA3OjU3OjMzIFBEVCAoLTA3MDApLCBiam9ybkBrZXJuZWwub3JnIHdyb3RlOgo+
PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+Cj4+IEFkZCBhIHBh
cmFtZXRlciB0byB0aGUgZGlyZWN0IG1hcCBzZXR1cCBmdW5jdGlvbiwgc28gaXQgY2FuIGJlIHVz
ZWQgaW4KPj4gYXJjaF9hZGRfbWVtb3J5KCkgbGF0ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJq
w7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L21t
L2luaXQuYyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
bW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4gaW5kZXggZTk3NGZmNmVmMDM2Li5h
ZWE4Y2NiM2Y0YWUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+ICsrKyBi
L2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+IEBAIC0xMjQ3LDE4ICsxMjQ3LDE5IEBAIGFzbWxpbmth
Z2Ugdm9pZCBfX2luaXQgc2V0dXBfdm0odWludHB0cl90IGR0Yl9wYSkKPj4gIAlwdF9vcHNfc2V0
X2ZpeG1hcCgpOwo+PiAgfQo+Pgo+PiAtc3RhdGljIHZvaWQgX19pbml0IGNyZWF0ZV9saW5lYXJf
bWFwcGluZ19yYW5nZShwaHlzX2FkZHJfdCBzdGFydCwKPj4gLQkJCQkJICAgICAgIHBoeXNfYWRk
cl90IGVuZCkKPj4gK3N0YXRpYyB2b2lkIF9fbWVtaW5pdCBjcmVhdGVfbGluZWFyX21hcHBpbmdf
cmFuZ2UocGh5c19hZGRyX3Qgc3RhcnQsIHBoeXNfYWRkcl90IGVuZCwKPj4gKwkJCQkJCSAgc3Ry
dWN0IG1ocF9wYXJhbXMgKnBhcmFtcykKPgo+IFNvcnJ5IGlmIEkgbWlzc2VkIGEgdjIsIGJ1dCBp
dCBsb29rcyBsaWtlIHRoaXMgZmFpbHMgdG8gYnVpbGQgdW5kZXIgCj4gQ09ORklHX01FTU9SWV9I
T1RQTFVHPW4gKGFzIHN0cnVjdCBtaHBfcGFyYW1zIGlzbid0IGRlZmluZWQpIC0tIHVubGVzcyBJ
IAo+IHNjcmV3ZWQgdXAgc29tZSBtZXJnZSBjb25mbGljdCwgYnV0IGRvZXNuJ3QgbG9vayBsaWtl
IGl0IGhlcmUuCj4KPiBJJ20gZ2V0dGluZwo+Cj4gICAgICAgQ0MgICAgICBhcmNoL3Jpc2N2L21t
L2luaXQubwo+ICAgICBhcmNoL3Jpc2N2L21tL2luaXQuYzoxMjUyOjU4OiB3YXJuaW5nOiDigJhz
dHJ1Y3QgbWhwX3BhcmFtc+KAmSBkZWNsYXJlZCBpbnNpZGUgcGFyYW1ldGVyIGxpc3Qgd2lsbCBu
b3QgYmUgdmlzaWJsZSBvdXRzaWRlIG9mIHRoaXMgZGVmaW5pdGlvbiBvciBkZWNsYXJhdGlvbgo+
ICAgICAgMTI1MiB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IG1ocF9wYXJhbXMgKnBhcmFtcykKPiAgICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
Cj4gICAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jOiBJbiBmdW5jdGlvbiDigJhjcmVhdGVfbGluZWFy
X21hcHBpbmdfcmFuZ2XigJk6Cj4gICAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jOjEyNjE6NDI6IGVy
cm9yOiBpbnZhbGlkIHVzZSBvZiB1bmRlZmluZWQgdHlwZSDigJhzdHJ1Y3QgbWhwX3BhcmFtc+KA
mQo+ICAgICAgMTI2MSB8ICAgICAgICAgICAgICAgICBwZ3Byb3QgPSAgcGFyYW1zID8gcGFyYW1z
LT5wZ3Byb3QgOiBwZ3Byb3RfZnJvbV92YSh2YSk7Cj4gICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+ICAgICBtYWtlWzNdOiAqKiogW3Njcmlw
dHMvTWFrZWZpbGUuYnVpbGQ6MjUyOiBhcmNoL3Jpc2N2L21tL2luaXQub10gRXJyb3IgMQo+ICAg
ICBtYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDk0OiBhcmNoL3Jpc2N2L21t
XSBFcnJvciAyCj4gICAgIG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0OTQ6
IGFyY2gvcmlzY3ZdIEVycm9yIDIKPiAgICAgbWFrZTogKioqIFtNYWtlZmlsZToyMDI2OiAuXSBF
cnJvciAyCj4KPiBwYXRjaHdvcmsgaXMgc2F5aW5nIHNvbWV0aGluZyBzaW1pbGFyCj4gPGh0dHBz
Oi8vZ2lzdC5naXRodWIuY29tL2Nvbm9yLXB3Ym90LzllZDlhNTY0ZTYzZDgyNGFlZDE3ODYwNTBl
ZTA2NTU4Pi4KCll1cCEgVGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dC4gVGhpcyBzZXJpZXMg
aGFzIGEgYnVuY2ggb2YgbW9yZQppc3N1ZXMsIHRoYXQgbmVlZCB0byBiZSByZXNvbHZlZCBpbiBh
IHYyLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
