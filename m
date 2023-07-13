Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD73C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfAO7q4dKqBgwWU5qVuXFZu3rOXVM9zDUZLvSKMo0iM=; b=f3nA5v+HIcG79l
	kBAj0mGHvq3YKMTYBUVSKXt9Hl3vBvHa51k8tbbUsTFx7PIc+QM15OcAOCmSAeBQUxrdPpkQoI15v
	fZGlJn+6tdnOci8KIH4+Th3UHFdNWEemWKJVga0Sl3w2oz6VWyAdi1B4CGaOHXWDg1j1RGbQUyZGb
	i58a7dtNU/QtvUQXFQ6iC5yRxvQdq2MGhEc1t4fXzkIxOBKyQY869UTEQJC+QpEPgKGjbyLOx++Qe
	hSNrmKfl+Sk7OxxIlxCmXxb2tbHYIlBlKXWWcwxgllGujaZvSgVQ9VjT0ipARqdlhjl/V4xszIDMI
	rHDULkEkDiO3FjvNdkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK1Ln-0049kF-12;
	Thu, 13 Jul 2023 18:47:39 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK1Lj-0049j9-2Z
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 18:47:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b52875b8d9so28295ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689274054; x=1689878854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCMwVIQzOUutbhN/GsjN6pM+paFnW3LWSf+I9hKYPpQ=;
        b=3lxVvYBLFqoAJ02OKTEDfVZUUK0wkW5kJ6VSqGoJM7b4lBnNFpCFUCFtiPuM7u9nOX
         VSzLx40KDeP0giCms38tanWNG5c8xfii4A4aZi/1HhYtk68VovRyTHE2Tw9kgrwbUWYk
         lgrmNm/UXJYJ3QUrwEpWVqgYQQt7CWi61h13oFp4tb/Z9qxx4ZK/T0ji1ZZoxOI2eUmA
         40KTd3OKOpoIH89wLfbNxh4/jZ8GdPRsy6Oxi+4m+Sv9jvQBFc4+hHiNNXGDKsBRO5ya
         acMC0ar3TRzt2JiLwJDPfGeVijikeplK1YGsCdeFNniK+KiZ+wOosH+qnrRf1sTm/NZ0
         fP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689274054; x=1689878854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCMwVIQzOUutbhN/GsjN6pM+paFnW3LWSf+I9hKYPpQ=;
        b=lrGIm0cAbhS2VqhqeKRGdgDj7JHM9FFzSpevHL07fKFtiQ0EBbhvKqbNPopjFPPWmM
         KYc6bqCojIUkyTp7ENjXyy0S/bExwtBiN4lq5Wd0LH8k9iFwRmBGNyYrCmVQ5rdz2bYk
         Oukn0VR2x3k9xkX6uCWYhAnVaOyUzCatJflIe9HeaTyQQN2c9Vlpct84QcpgeeYfQ6+H
         O+dEnmuyn0GXnJJZ9BSVhICAeAUenO/MIYAcrjQoc0QACLkuPKrCSm8EOFcyXrZq0CXw
         XW/eNnGl2V7ZkD1hZnvbH5xc/mptU85Oo0ztm1J+sf/DzrdWp5swWuzRSW4vH8ibSHrr
         e/BA==
X-Gm-Message-State: ABy/qLaCVuR/YUpB/ekVIzAMzpm5MEfKhvdRss2CaixtyTqBuJLDRgxl
	LB4ckFatI/xE7Dqc4Xh4cX1A1BLvkYk1eqbnAHt2kg==
X-Google-Smtp-Source: APBJJlFBmm7dpauUp37YeMKq373RcC3tN66u8ZQjiY1ufKfbpQJ/qTz6oxjhnsAqBc5kb4Tn8fRf3T+9JjhqDu8XLg4=
X-Received: by 2002:a17:902:bb0f:b0:1b8:9044:91d3 with SMTP id
 im15-20020a170902bb0f00b001b8904491d3mr552902plb.18.1689274053909; Thu, 13
 Jul 2023 11:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230621175002.2832640-1-rananta@google.com> <20230621175002.2832640-8-rananta@google.com>
 <1fe280a7-0f10-e124-00aa-b137df722c33@redhat.com> <CAJHc60xQtjvVsWRE=w-pAioNJW6uh-qKuZz2wp6bkT=X4oCm5A@mail.gmail.com>
 <60ba5bb4-6fad-0e51-2cd5-845610e6631d@redhat.com>
In-Reply-To: <60ba5bb4-6fad-0e51-2cd5-845610e6631d@redhat.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Thu, 13 Jul 2023 11:47:19 -0700
Message-ID: <CAJHc60y6AaAUVy=V6GHTpVhHGO3Bjn1vpTnYpdFiFLjS-vR-uA@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 07/11] KVM: arm64: Define kvm_tlb_flush_vmid_range()
To: Gavin Shan <gshan@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_114735_834848_A966B0E2 
X-CRM114-Status: GOOD (  20.23  )
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

SGkgR2F2aW4sCgpPbiBXZWQsIEp1bCA1LCAyMDIzIGF0IDU6MDTigK9QTSBHYXZpbiBTaGFuIDxn
c2hhbkByZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIDcvNi8yMyAwNDoyOCwgUmFnaGF2ZW5kcmEg
UmFvIEFuYW50YSB3cm90ZToKPiA+IE9uIFR1ZSwgSnVsIDQsIDIwMjMgYXQgNTozMeKAr1BNIEdh
dmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+IE9uIDYvMjIvMjMgMDM6NDks
IFJhZ2hhdmVuZHJhIFJhbyBBbmFudGEgd3JvdGU6Cj4gPj4+IEltcGxlbWVudCB0aGUgaGVscGVy
IGt2bV90bGJfZmx1c2hfdm1pZF9yYW5nZSgpIHRoYXQgYWN0cwo+ID4+PiBhcyBhIHdyYXBwZXIg
Zm9yIHJhbmdlLWJhc2VkIFRMQiBpbnZhbGlkYXRpb25zLiBGb3IgdGhlCj4gPj4+IGdpdmVuIFZN
SUQsIHVzZSB0aGUgcmFuZ2UtYmFzZWQgVExCSSBpbnN0cnVjdGlvbnMgdG8gZG8KPiA+Pj4gdGhl
IGpvYiBvciBmYWxsYmFjayB0byBpbnZhbGlkYXRpbmcgYWxsIHRoZSBUTEIgZW50cmllcy4KPiA+
Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUmFnaGF2ZW5kcmEgUmFvIEFuYW50YSA8cmFuYW50YUBn
b29nbGUuY29tPgo+ID4+PiAtLS0KPiA+Pj4gICAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rdm1f
cGd0YWJsZS5oIHwgMTAgKysrKysrKysrKwo+ID4+PiAgICBhcmNoL2FybTY0L2t2bS9oeXAvcGd0
YWJsZS5jICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+ID4+PiAgICAyIGZpbGVz
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKPiA+Pj4KPiA+Pgo+ID4+IEl0IG1heSBiZSByZWFz
b25hYmxlIHRvIGZvbGQgdGhpcyB0byBQQVRDSFswOC8xMV0gc2luY2Uga3ZtX3RsYl9mbHVzaF92
bWlkX3JhbmdlKCkgaXMKPiA+PiBvbmx5IGNhbGxlZCBieSBBUk02NCdzIGt2bV9hcmNoX2ZsdXNo
X3JlbW90ZV90bGJzX3JhbmdlKCksIHdoaWNoIGlzIGFkZGVkIGJ5IFBBVENIWzA4LzExXS4KPiA+
PiBJbiBlaXRoZXIgd2F5LCB0aGUgY2hhbmdlcyBsb29rIGdvb2QgdG8gbWU6Cj4gPj4KPiA+IEFo
LCB0aGUgcGF0Y2hlcyAxMCBhbmQgMTEgYWxzbyBjYWxsIGt2bV90bGJfZmx1c2hfdm1pZF9yYW5n
ZSgpLCBzbwo+ID4gcHJvYmFibHkgaXQncyBiZXR0ZXIgdG8ga2VlcCB0aGUgZGVmaW5pdGlvbiBp
c29sYXRlZD8KPiA+Cj4KPiBUaGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uIEl0J3MgZmluZSB0
byBoYXZlIHR3byBzZXBhcmF0ZSBwYXRjaGVzIGluIHRoaXMKPiBjYXNlLiBJIHN0aWxsIG5lZWQg
dG8gc3BlbmQgc29tZSB0aW1lIHRvIGxvb2sgYXQgUEFUQ0hbMTEvMTFdIHdob3NlIHN1YmplY3QK
PiBpbmNsdWRlcyB0eXBvIChpbnRydWN0aW9ucyAtPiBpbnN0cnVjdGlvbnMpCj4KSSdtIHBsYW5u
aW5nIHRvIHNlbmQgdjYgc29vbiwgYnV0IEknbSBoYXBweSB0byB3YWl0IGlmIHlvdSBoYXZlIGFu
eQpvdGhlciBjb21tZW50cyBvbiB2NSBwYXRjaC0xMS4KQXBwcmVjaWF0ZSB5b3VyIGhlbHAgd2l0
aCB0aGUgcmV2aWV3cy4KClRoYW5rIHlvdS4KUmFnaGF2ZW5kcmEKPiBUaGFua3MsCj4gR2F2aW4K
Pgo+ID4+IFJldmlld2VkLWJ5OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgo+ID4+Cj4g
Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2bV9wZ3RhYmxlLmggYi9h
cmNoL2FybTY0L2luY2x1ZGUvYXNtL2t2bV9wZ3RhYmxlLmgKPiA+Pj4gaW5kZXggNGNkNjc2MmJk
YTgwNS4uMWIxMjI5NWE4MzU5NSAxMDA2NDQKPiA+Pj4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRl
L2FzbS9rdm1fcGd0YWJsZS5oCj4gPj4+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20va3Zt
X3BndGFibGUuaAo+ID4+PiBAQCAtNjgyLDQgKzY4MiwxNCBAQCBlbnVtIGt2bV9wZ3RhYmxlX3By
b3Qga3ZtX3BndGFibGVfc3RhZ2UyX3B0ZV9wcm90KGt2bV9wdGVfdCBwdGUpOwo+ID4+PiAgICAg
KiAgICAga3ZtX3BndGFibGVfcHJvdCBmb3JtYXQuCj4gPj4+ICAgICAqLwo+ID4+PiAgICBlbnVt
IGt2bV9wZ3RhYmxlX3Byb3Qga3ZtX3BndGFibGVfaHlwX3B0ZV9wcm90KGt2bV9wdGVfdCBwdGUp
Owo+ID4+PiArCj4gPj4+ICsvKioKPiA+Pj4gKyAqIGt2bV90bGJfZmx1c2hfdm1pZF9yYW5nZSgp
IC0gSW52YWxpZGF0ZS9mbHVzaCBhIHJhbmdlIG9mIFRMQiBlbnRyaWVzCj4gPj4+ICsgKgo+ID4+
PiArICogQG1tdTogICAgIFN0YWdlLTIgS1ZNIE1NVSBzdHJ1Y3QKPiA+Pj4gKyAqIEBhZGRyOiAg
ICBUaGUgYmFzZSBJbnRlcm1lZGlhdGUgcGh5c2ljYWwgYWRkcmVzcyBmcm9tIHdoaWNoIHRvIGlu
dmFsaWRhdGUKPiA+Pj4gKyAqIEBzaXplOiAgICBTaXplIG9mIHRoZSByYW5nZSBmcm9tIHRoZSBi
YXNlIHRvIGludmFsaWRhdGUKPiA+Pj4gKyAqLwo+ID4+PiArdm9pZCBrdm1fdGxiX2ZsdXNoX3Zt
aWRfcmFuZ2Uoc3RydWN0IGt2bV9zMl9tbXUgKm1tdSwKPiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGh5c19hZGRyX3QgYWRkciwgc2l6ZV90IHNpemUpOwo+ID4+PiAgICAjZW5k
aWYgICAgICAvKiBfX0FSTTY0X0tWTV9QR1RBQkxFX0hfXyAqLwo+ID4+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9rdm0vaHlwL3BndGFibGUuYyBiL2FyY2gvYXJtNjQva3ZtL2h5cC9wZ3RhYmxl
LmMKPiA+Pj4gaW5kZXggM2Q2MWJkM2U1OTFkMi4uZGY4YWMxNGQ5ZDNkNCAxMDA2NDQKPiA+Pj4g
LS0tIGEvYXJjaC9hcm02NC9rdm0vaHlwL3BndGFibGUuYwo+ID4+PiArKysgYi9hcmNoL2FybTY0
L2t2bS9oeXAvcGd0YWJsZS5jCj4gPj4+IEBAIC02MzEsNiArNjMxLDI2IEBAIHN0YXRpYyBib29s
IHN0YWdlMl9oYXNfZndiKHN0cnVjdCBrdm1fcGd0YWJsZSAqcGd0KQo+ID4+PiAgICAgICAgcmV0
dXJuICEocGd0LT5mbGFncyAmIEtWTV9QR1RBQkxFX1MyX05PRldCKTsKPiA+Pj4gICAgfQo+ID4+
Pgo+ID4+PiArdm9pZCBrdm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2Uoc3RydWN0IGt2bV9zMl9tbXUg
Km1tdSwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGh5c19hZGRyX3QgYWRk
ciwgc2l6ZV90IHNpemUpCj4gPj4+ICt7Cj4gPj4+ICsgICAgIHVuc2lnbmVkIGxvbmcgcGFnZXMs
IGludmFsX3BhZ2VzOwo+ID4+PiArCj4gPj4+ICsgICAgIGlmICghc3lzdGVtX3N1cHBvcnRzX3Rs
Yl9yYW5nZSgpKSB7Cj4gPj4+ICsgICAgICAgICAgICAga3ZtX2NhbGxfaHlwKF9fa3ZtX3RsYl9m
bHVzaF92bWlkLCBtbXUpOwo+ID4+PiArICAgICAgICAgICAgIHJldHVybjsKPiA+Pj4gKyAgICAg
fQo+ID4+PiArCj4gPj4+ICsgICAgIHBhZ2VzID0gc2l6ZSA+PiBQQUdFX1NISUZUOwo+ID4+PiAr
ICAgICB3aGlsZSAocGFnZXMgPiAwKSB7Cj4gPj4+ICsgICAgICAgICAgICAgaW52YWxfcGFnZXMg
PSBtaW4ocGFnZXMsIE1BWF9UTEJJX1JBTkdFX1BBR0VTKTsKPiA+Pj4gKyAgICAgICAgICAgICBr
dm1fY2FsbF9oeXAoX19rdm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2UsIG1tdSwgYWRkciwgaW52YWxf
cGFnZXMpOwo+ID4+PiArCj4gPj4+ICsgICAgICAgICAgICAgYWRkciArPSBpbnZhbF9wYWdlcyA8
PCBQQUdFX1NISUZUOwo+ID4+PiArICAgICAgICAgICAgIHBhZ2VzIC09IGludmFsX3BhZ2VzOwo+
ID4+PiArICAgICB9Cj4gPj4+ICt9Cj4gPj4+ICsKPiA+Pj4gICAgI2RlZmluZSBLVk1fUzJfTUVN
QVRUUihwZ3QsIGF0dHIpIFBBR0VfUzJfTUVNQVRUUihhdHRyLCBzdGFnZTJfaGFzX2Z3YihwZ3Qp
KQo+ID4+Pgo+ID4+PiAgICBzdGF0aWMgaW50IHN0YWdlMl9zZXRfcHJvdF9hdHRyKHN0cnVjdCBr
dm1fcGd0YWJsZSAqcGd0LCBlbnVtIGt2bV9wZ3RhYmxlX3Byb3QgcHJvdCwKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
