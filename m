Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BA0D79764
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 08:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfDC8KmJcNb1SMGJpR72JEcnOVkHuZm7pVPhDn5l35U=; b=296qqXBYr/KQ7w
	lMqUKWZivXgCohB1OZW9fZWewaN17cLLH6oKY0z5As+8Qg2cgsFGx9/K2yAfZNWi2//lL6MlWCHuI
	kPobvzEOTq1UtLgjbeWstEOWL9awEEGSJuo0CxbMQ3ZrGDvJgsR72baVDwXMf2iFNSz6rc1X1vQz+
	CqTL279kZ/7z/Jm7/757X6zO7hJIR+wEzL108V4BE9Fec8ywCWeb0xu3NkPuMdUQdrPCerPEbdPcr
	YkYsl4lAyAWCWCAdvtjw1TSnsrhRS7hjyNin6pxwnq6is+bE5z+plqCR95Liqv+Q8cduVm1IWx8Eq
	t87XjrqKQGOM1LJ7X/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm6fO-00000002R1n-1aIq;
	Sat, 31 Jan 2026 08:49:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm6fL-00000002R1R-0UqA
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 08:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14D7E405F0
	for <linux-riscv@lists.infradead.org>; Sat, 31 Jan 2026 08:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89C9C2BCB1
	for <linux-riscv@lists.infradead.org>; Sat, 31 Jan 2026 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769849352;
	bh=dGpLK5EUCc7kxrIuKT+VIjH3dXIChnaZ7t34gz+6Iws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cPJMDi4KTOdp9mLdW89C0sAkKpBSvgv2Je/9qpAjg7VswkbD2HnopxOqP7jsSHu7V
	 n5v8ZjVuK2Ac4+jwBe1ALh0quh2HgUJqUcyZ2Dtn5ezFXuDmqIIX72fP3Ggnh7Rnpn
	 85Zp2Ntr5v4tQgJN5uLi09U9CyIoOJtBVYIUlsIZvtdKDQG2xZVkG7UlM/bS6Nc2nV
	 B63sd++L/Qep9CTy9MP0QrALBNjWtNzY1L3AfXGDAmcteEw3MCbnu1X4EmwQDp2lGC
	 bOVFYTlM5cRP7tTzgBKiDNpDJ9pJUb2KL1P0nRXwL7cMTtboVY58vmCB0lTJ62T7i4
	 Nk35roDsR6DpQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b883c8dfb00so684635666b.1
        for <linux-riscv@lists.infradead.org>; Sat, 31 Jan 2026 00:49:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYYxyeVatpaKLW8tEu1iY0I+sfxpwTQ6k3VZyCi8A2DQxfZ4PtT/s5xxoqjJxLC3PIZLIGDuMKNfQ7+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwrJ0NP+mxdlPg9U0HKR3LmC+qDja7y1m+4S/HpMRbFmq4T86E
	/orTgYNcrxkTBSzzTNhbkfVbuCYXn7dZ1r5YQhl1Hr7/39ChUcBp+MM/HKmV59uKjXClNU10J9P
	tTP1uEVeK33PxLqoXq3R4p313nG0+K7w=
X-Received: by 2002:a17:907:3e1a:b0:b87:7485:b4a8 with SMTP id
 a640c23a62f3a-b8dff23aab3mr312380166b.0.1769849351173; Sat, 31 Jan 2026
 00:49:11 -0800 (PST)
MIME-Version: 1.0
References: <20260131060600.169748-1-liushuyu@aosc.io>
In-Reply-To: <20260131060600.169748-1-liushuyu@aosc.io>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 31 Jan 2026 16:48:58 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7g4StjP5fnHVVEyR_xFx9=fg6S9UuHWnPpMV_k=ZVGGw@mail.gmail.com>
X-Gm-Features: AZwV_QgPxFoSfCmMU-FyVI71xlpOxVZW5UWuDu6-xVqczdI4YRz8mS_EVp-09Zw
Message-ID: <CAAhV-H7g4StjP5fnHVVEyR_xFx9=fg6S9UuHWnPpMV_k=ZVGGw@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] KVM: Add KVM_GET_REG_LIST ioctl for LoongArch
To: Zixing Liu <liushuyu@aosc.io>
Cc: WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Kexy Biscuit <kexybiscuit@aosc.io>, Mingcong Bai <jeffbai@aosc.io>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_004915_201059_B43D53C1 
X-CRM114-Status: GOOD (  26.15  )
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

SGksIFppeGluZywKCk9uIFNhdCwgSmFuIDMxLCAyMDI2IGF0IDI6MDfigK9QTSBaaXhpbmcgTGl1
IDxsaXVzaHV5dUBhb3NjLmlvPiB3cm90ZToKPgo+IFRoaXMgaW9jdGwgY2FuIGJlIHVzZWQgYnkg
dGhlIHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMgdG8gZGV0ZXJtaW5lIHdoaWNoCj4gKHNwZWNpYWwp
IHJlZ2lzdGVycyBhcmUgZ2V0L3NldC1hYmxlIGluIGEgbWVhbmluZ2Z1bCB3YXkuCj4KPiBUaGlz
IGNhbiBiZSB2ZXJ5IHVzZWZ1bCBmb3IgY3Jvc3MtcGxhdGZvcm0gVk1NcyBzbyB0aGF0IHRoZXkg
ZG8gbm90IGhhdmUKPiB0byBoYXJkY29kZSByZWdpc3RlciBpbmRpY2VzIGZvciBlYWNoIHN1cHBv
cnRlZCBhcmNoaXRlY3R1cmVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWml4aW5nIExpdSA8bGl1c2h1
eXVAYW9zYy5pbz4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0IHwgIDIg
Ky0KPiAgYXJjaC9sb29uZ2FyY2gva3ZtL3ZjcHUuYyAgICAgIHwgODUgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDg2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2Fw
aS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPiBpbmRleCAwMWEzYWJlZjhh
YmIuLmY0NmRkOGJlMjgyZiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2Fw
aS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPiBAQCAtMzYwMyw3
ICszNjAzLDcgQEAgVkNQVSBtYXRjaGluZyB1bmRlcmx5aW5nIGhvc3QuCj4gIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+Cj4gIDpDYXBhYmlsaXR5OiBiYXNpYwo+IC06QXJjaGl0ZWN0dXJlczogYXJt
NjQsIG1pcHMsIHJpc2N2LCB4ODYgKGlmIEtWTV9DQVBfT05FX1JFRykKPiArOkFyY2hpdGVjdHVy
ZXM6IGFybTY0LCBsb29uZ2FyY2gsIG1pcHMsIHJpc2N2LCB4ODYgKGlmIEtWTV9DQVBfT05FX1JF
RykKPiAgOlR5cGU6IHZjcHUgaW9jdGwKPiAgOlBhcmFtZXRlcnM6IHN0cnVjdCBrdm1fcmVnX2xp
c3QgKGluL291dCkKPiAgOlJldHVybnM6IDAgb24gc3VjY2VzczsgLTEgb24gZXJyb3IKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gva3ZtL3ZjcHUuYyBiL2FyY2gvbG9vbmdhcmNoL2t2bS92
Y3B1LmMKPiBpbmRleCA2NTZiOTU0YzExMzQuLmVkMTE0MzhmNDU0NCAxMDA2NDQKPiAtLS0gYS9h
cmNoL2xvb25nYXJjaC9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9sb29uZ2FyY2gva3ZtL3ZjcHUu
Ywo+IEBAIC0xMTg2LDYgKzExODYsNzMgQEAgc3RhdGljIGludCBrdm1fbG9vbmdhcmNoX3ZjcHVf
c2V0X2F0dHIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAg
fQo+Cj4gK3N0YXRpYyBpbnQga3ZtX2xvb25nYXJjaF93YWxrX2NzcnMoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1NjQgX191c2VyICp1aW5kaWNlcykKPiArewo+ICsgICAgICAgdW5zaWduZWQgaW50
IGksIGNvdW50Owo+ICsKPiArICAgICAgIGZvciAoaSA9IDAsIGNvdW50ID0gMDsgaSA8IENTUl9N
QVhfTlVNUzsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgIGlmICghKGdldF9nY3NyX2ZsYWcoaSkg
JiAoU1dfR0NTUiB8IEhXX0dDU1IpKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPiArICAgICAgICAgICAgICAgY29uc3QgdTY0IHJlZyA9IEtWTV9JT0NfQ1NSSUQoaSk7Cj4g
KyAgICAgICAgICAgICAgIGlmICh1aW5kaWNlcyAmJiBwdXRfdXNlcihyZWcsIHVpbmRpY2VzKysp
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ICsgICAgICAgICAg
ICAgICBjb3VudCsrOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBjb3VudDsKPiAr
fQo+ICsKPiArc3RhdGljIHVuc2lnbmVkIGxvbmcga3ZtX2xvb25nYXJjaF9udW1fbGJ0X3JlZ3Mo
dm9pZCkKPiArewo+ICsgICAgICAgLyogKzEgZm9yIHRoZSBMQlRfRlRPUCBmbGFnIChpbnNpZGUg
YXJjaC5mcHUpICovCj4gKyAgICAgICByZXR1cm4gc2l6ZW9mKHN0cnVjdCBsb29uZ2FyY2hfbGJ0
KSAvIHNpemVvZih1bnNpZ25lZCBsb25nKSArIDE7Cj4gK30KVGhpcyBmdW5jdGlvbiBoYXMgb25s
eSBvbmUgbGluZSwgSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8gZW1iZWQgaXQgaW50bwp0aGUgY2Fs
bGVyLgoKSHVhY2FpCgo+ICsKPiArc3RhdGljIHVuc2lnbmVkIGxvbmcga3ZtX2xvb25nYXJjaF9u
dW1fcmVncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiArICAgICAgIC8qICsxIGZvciB0
aGUgS1ZNX1JFR19MT09OR0FSQ0hfQ09VTlRFUiByZWdpc3RlciAqLwo+ICsgICAgICAgdW5zaWdu
ZWQgbG9uZyByZXMgPQo+ICsgICAgICAgICAgICAgICBrdm1fbG9vbmdhcmNoX3dhbGtfY3Nycyh2
Y3B1LCBOVUxMKSArIEtWTV9NQVhfQ1BVQ0ZHX1JFR1MgKyAxOwo+ICsKPiArICAgICAgIGlmIChr
dm1fZ3Vlc3RfaGFzX2xidCgmdmNwdS0+YXJjaCkpCj4gKyAgICAgICAgICAgICAgIHJlcyArPSBr
dm1fbG9vbmdhcmNoX251bV9sYnRfcmVncygpOwo+ICsKPiArICAgICAgIHJldHVybiByZXM7Cj4g
K30KPiArCj4gK3N0YXRpYyBpbnQga3ZtX2xvb25nYXJjaF9jb3B5X3JlZ19pbmRpY2VzKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1NjQgX191c2VyICp1aW5kaWNlcykKPiArewo+ICsgICAgICAgdTY0IHJlZzsKPiArICAg
ICAgIHVuc2lnbmVkIGludCBpOwo+ICsKPiArICAgICAgIGkgPSBrdm1fbG9vbmdhcmNoX3dhbGtf
Y3Nycyh2Y3B1LCB1aW5kaWNlcyk7Cj4gKyAgICAgICBpZiAoaSA8IDApCj4gKyAgICAgICAgICAg
ICAgIHJldHVybiBpOwo+ICsgICAgICAgdWluZGljZXMgKz0gaTsKPiArCj4gKyAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgS1ZNX01BWF9DUFVDRkdfUkVHUzsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAg
IHJlZyA9IEtWTV9JT0NfQ1BVQ0ZHKGkpOwo+ICsgICAgICAgICAgICAgICBpZiAocHV0X3VzZXIo
cmVnLCB1aW5kaWNlcysrKSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVGQVVM
VDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZWcgPSBLVk1fUkVHX0xPT05HQVJDSF9DT1VO
VEVSOwo+ICsgICAgICAgaWYgKHB1dF91c2VyKHJlZywgdWluZGljZXMrKykpCj4gKyAgICAgICAg
ICAgICAgIHJldHVybiAtRUZBVUxUOwo+ICsKPiArICAgICAgIGlmICgha3ZtX2d1ZXN0X2hhc19s
YnQoJnZjcHUtPmFyY2gpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICAg
ICBmb3IgKGkgPSAxOyBpIDw9IGt2bV9sb29uZ2FyY2hfbnVtX2xidF9yZWdzKCk7IGkrKykgewo+
ICsgICAgICAgICAgICAgICByZWcgPSAoS1ZNX1JFR19MT09OR0FSQ0hfTEJUIHwgS1ZNX1JFR19T
SVpFX1U2NCB8IGkpOwo+ICsgICAgICAgICAgICAgICBpZiAocHV0X3VzZXIocmVnLCB1aW5kaWNl
cysrKSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsKPiArICAgICAg
IH0KPiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgbG9uZyBrdm1fYXJjaF92Y3B1
X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgaW9jdGwsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ICB7Cj4gQEAgLTEyNTEsNiArMTMx
OCwyNCBAQCBsb25nIGt2bV9hcmNoX3ZjcHVfaW9jdGwoc3RydWN0IGZpbGUgKmZpbHAsCj4gICAg
ICAgICAgICAgICAgIHIgPSBrdm1fbG9vbmdhcmNoX3ZjcHVfc2V0X2F0dHIodmNwdSwgJmF0dHIp
Owo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIH0KPiArICAgICAgIGNhc2UgS1ZN
X0dFVF9SRUdfTElTVDogewo+ICsgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3JlZ19saXN0IF9f
dXNlciAqdXNlcl9saXN0ID0gYXJncDsKPiArICAgICAgICAgICAgICAgc3RydWN0IGt2bV9yZWdf
bGlzdCByZWdfbGlzdDsKPiArICAgICAgICAgICAgICAgdW5zaWduZWQgbjsKPiArCj4gKyAgICAg
ICAgICAgICAgIHIgPSAtRUZBVUxUOwo+ICsgICAgICAgICAgICAgICBpZiAoY29weV9mcm9tX3Vz
ZXIoJnJlZ19saXN0LCB1c2VyX2xpc3QsIHNpemVvZihyZWdfbGlzdCkpKQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgICAgICAgICBuID0gcmVnX2xpc3QubjsKPiAr
ICAgICAgICAgICAgICAgcmVnX2xpc3QubiA9IGt2bV9sb29uZ2FyY2hfbnVtX3JlZ3ModmNwdSk7
Cj4gKyAgICAgICAgICAgICAgIGlmIChjb3B5X3RvX3VzZXIodXNlcl9saXN0LCAmcmVnX2xpc3Qs
IHNpemVvZihyZWdfbGlzdCkpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsg
ICAgICAgICAgICAgICByID0gLUUyQklHOwo+ICsgICAgICAgICAgICAgICBpZiAobiA8IHJlZ19s
aXN0Lm4pCj4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAg
IHIgPSBrdm1fbG9vbmdhcmNoX2NvcHlfcmVnX2luZGljZXModmNwdSwgdXNlcl9saXN0LT5yZWcp
Owo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIH0KPiAgICAgICAgIGRlZmF1bHQ6
Cj4gICAgICAgICAgICAgICAgIHIgPSAtRU5PSU9DVExDTUQ7Cj4gICAgICAgICAgICAgICAgIGJy
ZWFrOwo+IC0tCj4gMi41Mi4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
