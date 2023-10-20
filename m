Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AA6CDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 09:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NW7/gJcq/i+IAfs86rDm9/Ng03NRomwv+l83qhA7On0=; b=y2Xp9c1w04Gjnj
	YrlQXnx8MTvJ3lo5F2i4kz+WFwOFXzqxsIidFKc0YzFdm8Ve/iAMwSrvWeTHT7s0HdoOvR3ri2Jhk
	ZQ0dqeQA63oiJqC/QpVPxqrfSiLj8rR/+BoOMRJeAIFzJebqyuF7NW9IdTIFtVXEMmZLptjQoO6XQ
	+pPfC/IBQMNhL/CpdNCNOj/ocitEmHI1yeOMLCd9atizmrI6NXSU25MIaGtbu109dUe9Ehd62Y7SM
	0ZzMymVGAmh9tQ8+WhpWMMop7cU8IvN7cDwRAy9DqdbaVr40tsS1HqJRNKqML0D6TmAYVV9vd9D2U
	njWEHCIAMP5zsk+YCTBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmEc-001iXJ-2M;
	Fri, 20 Oct 2023 09:56:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmEZ-001iVz-0O;
	Fri, 20 Oct 2023 09:56:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 25992CE35E5;
	Fri, 20 Oct 2023 09:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03568C433C8;
	Fri, 20 Oct 2023 09:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697795756;
	bh=Z8ZuvLU9qD1wAS9sgFRuBmjbVEM7Pn+nD5WWqHJs10M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AUJJlKphrqw/o7lmtSQ+IkqWYh8FwAzZh4+CvrE6unyvvs3EQGCT5g/YTWZTTcKpS
	 3tscwUlRHcVkD5AvTyY5/rX5LfoJ4dSlRuNzNO3PGkbwl6jQ4oCCI4BMm3kQftVhvH
	 VRPKVmf5M4QDnnJy06buHR/ZKq3ZUNAgwoIYH9TChGSW/5l9TW3xXkHO11u0EzEANG
	 whJs0N6uL5udv7BZ0zh3XaiaOAZdxqEhjlMtC3crlOzXstm4C74Nvh8ZHFR+MFI3RF
	 3aDRCXQCRFea8KycE+r5iHmcYlc1/TXKhp8QT+8YrKpLpIjoqIxrGcnmj1oGc6L3DW
	 lAnCrZgHvoqZQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Atish Patra
 <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 8/9] tty: Add SBI debug console support to HVC SBI
 driver
In-Reply-To: <20231020072140.900967-9-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-9-apatel@ventanamicro.com>
Date: Fri, 20 Oct 2023 11:55:53 +0200
Message-ID: <87mswdbot2.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_025559_519030_4ACA915E 
X-CRM114-Status: GOOD (  16.04  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gRnJvbTogQXRp
c2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4KPiBSSVNDLVYgU0JJIHNwZWNpZmljYXRp
b24gc3VwcG9ydHMgYWR2YW5jZWQgZGVidWcgY29uc29sZQo+IHN1cHBvcnQgdmlhIFNCSSBEQkNO
IGV4dGVuc2lvbi4KPgo+IEV4dGVuZCB0aGUgSFZDIFNCSSBkcml2ZXIgdG8gc3VwcG9ydCBpdC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+
ICBkcml2ZXJzL3R0eS9odmMvS2NvbmZpZyAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy90dHkv
aHZjL2h2Y19yaXNjdl9zYmkuYyB8IDgyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvaHZjL0tjb25maWcgYi9kcml2ZXJzL3R0eS9odmMv
S2NvbmZpZwo+IGluZGV4IDRmOTI2NGQwMDVjMC4uNmUwNWM1YzdiY2ExIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdHR5L2h2Yy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy90dHkvaHZjL0tjb25maWcK
PiBAQCAtMTA4LDcgKzEwOCw3IEBAIGNvbmZpZyBIVkNfRENDX1NFUklBTElaRV9TTVAKPiAgCj4g
IGNvbmZpZyBIVkNfUklTQ1ZfU0JJCj4gIAlib29sICJSSVNDLVYgU0JJIGNvbnNvbGUgc3VwcG9y
dCIKPiAtCWRlcGVuZHMgb24gUklTQ1ZfU0JJX1YwMQo+ICsJZGVwZW5kcyBvbiBSSVNDVl9TQkkK
PiAgCXNlbGVjdCBIVkNfRFJJVkVSCj4gIAloZWxwCj4gIAkgIFRoaXMgZW5hYmxlcyBzdXBwb3J0
IGZvciBjb25zb2xlIG91dHB1dCB2aWEgUklTQy1WIFNCSSBjYWxscywgd2hpY2gKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy90dHkvaHZjL2h2Y19yaXNjdl9zYmkuYyBiL2RyaXZlcnMvdHR5L2h2Yy9o
dmNfcmlzY3Zfc2JpLmMKPiBpbmRleCAzMWY1M2ZhNzdlNGEuLjU2ZGExYTRiNWFjYSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jCj4gKysrIGIvZHJpdmVycy90
dHkvaHZjL2h2Y19yaXNjdl9zYmkuYwo+IEBAIC0zOSwyMSArMzksODkgQEAgc3RhdGljIGludCBo
dmNfc2JpX3R0eV9nZXQodWludDMyX3QgdnRlcm1ubywgY2hhciAqYnVmLCBpbnQgY291bnQpCj4g
IAlyZXR1cm4gaTsKPiAgfQo+ICAKPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBodl9vcHMgaHZjX3Ni
aV9vcHMgPSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaHZfb3BzIGh2Y19zYmlfdjAxX29wcyA9
IHsKPiAgCS5nZXRfY2hhcnMgPSBodmNfc2JpX3R0eV9nZXQsCj4gIAkucHV0X2NoYXJzID0gaHZj
X3NiaV90dHlfcHV0LAo+ICB9Owo+ICAKPiAtc3RhdGljIGludCBfX2luaXQgaHZjX3NiaV9pbml0
KHZvaWQpCj4gK3N0YXRpYyBpbnQgaHZjX3NiaV9kYmNuX3R0eV9wdXQodWludDMyX3QgdnRlcm1u
bywgY29uc3QgY2hhciAqYnVmLCBpbnQgY291bnQpCj4gIHsKPiAtCXJldHVybiBQVFJfRVJSX09S
X1pFUk8oaHZjX2FsbG9jKDAsIDAsICZodmNfc2JpX29wcywgMTYpKTsKPiArCXBoeXNfYWRkcl90
IHBhOwo+ICsJc3RydWN0IHNiaXJldCByZXQ7Cj4gKwo+ICsJaWYgKGlzX3ZtYWxsb2NfYWRkcihi
dWYpKSB7Cj4gKwkJcGEgPSBwYWdlX3RvX3BoeXModm1hbGxvY190b19wYWdlKGJ1ZikpICsgb2Zm
c2V0X2luX3BhZ2UoYnVmKTsKPiArCQlpZiAoUEFHRV9TSVpFIDwgKG9mZnNldF9pbl9wYWdlKGJ1
ZikgKyBjb3VudCkpCj4gKwkJCWNvdW50ID0gUEFHRV9TSVpFIC0gb2Zmc2V0X2luX3BhZ2UoYnVm
KTsKClRoYW5rcyBmb3IgZml4aW5nIHRoZSBjcm9zcy1wYWdlIGlzc3VlLiBOb3cgeW91J3JlIGN1
dHRpbmcgdGhlIGJ1ZmZlcgpvZmYuIFdoYXQgYWJvdXQgZG9pbmcgdHdvIFNCSSBjYWxscyBpbnN0
ZWFkPyAoRGl0byBvbiB0aGUgZ2V0IHNpZGUpCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
