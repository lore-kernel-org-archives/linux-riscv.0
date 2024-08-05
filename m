Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CD9C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 23:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uLZadLWXKsje59Gdg70oXfFFltftcn7RkZz4YmBXCpc=; b=QABIMKBoLV72KiRr45A0Pa2coP
	H61AvVvGhgW8dFuVv9GEv6l6+2ddZBHkszii7K4ifc5WOXdT/3jYWVIbCwba29RNRVLBxvLTDR+1h
	6HRzpk8lhqj3DQlw1LAwvZtWEcFUPPU3mcNY9vWu8D8LYuWaAD1MvyBQAIBvGqujx63wBA2bFz90x
	IKLguv612ulYAfL0Yyaf6mshsctafdcD6XaZ+3J4D8uXzOh7d7dmb/qtST7ILKISi9kXnjm/SldyM
	Szv8IZ3O3a3/iPJ19vVGlNgV+W29KdkNdcxpLC5zTBg22M4z5Jd8YHt1K6cSk+j04yQVymPYtGrWl
	6k4CrERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb736-0000000HXSs-1pp8;
	Mon, 05 Aug 2024 23:23:32 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb72Y-0000000HXGy-1E4w
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 23:23:00 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc5651e888so2607985ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 16:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722900176; x=1723504976; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqhT0BfYtdHqe5JEJY1dxcglZN0X6+UEhtDWxpbx9R0=;
        b=o7dEg/pPwKafDLzD1eiG7YI9CYxpFruJ9KyJTUvmr3fPLH+nB8TFEjzvdpQK5ueVnr
         JQfDX+atAb6WFb75r65eSxJruX7T3vtDjtvk5RCmYtl4XDs3lhruVw5Yom2j4TioLscg
         JZz60w0dHTJzi25vL0Ob7miPVD30+uLp5edIvZ1CFnjaMWDOHpDC1o6zg5Z2oLdX/fl7
         Lh38K0UJHWwkTF+OppA107+08wlTkBhG4vY8DcbJ8P59KYPBzT+8pDaKyc3gR0fT3JQk
         nZApDAaHwOncKOoeUrGNFWQunG8LQbUFBMJJRz7Lddp/bSiXEvsTm0PYzTLeUHkLfO60
         HsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722900176; x=1723504976;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZqhT0BfYtdHqe5JEJY1dxcglZN0X6+UEhtDWxpbx9R0=;
        b=qR+TYiU/qT3q+H/aBVIKkZVCtmnky2Jvk4TMjUmN/vupGQ8DCYnlmwqutkBqvU6/p3
         7C0pH25me/vrrqhB7wKsyu3S67XcmRK5WMN2XfdVAqGapMAhR9glB3q8GvGiujbF3lmU
         hyP/3PFuDRUVxft3pr9HoM/PkJbxjkwLD9mj89kigKGAvvH4Ow7hS7YdVNGCkkRLXvxL
         qeWeJts8yaCTThmF/i+tW4p7ZsrhNruVcGzyOb7s4WsHgx7y3B5z1lsOdu/Av9qPEqVr
         6FttV7gO4J4E4MCEOVGB0ryHAc7thMqI2oGNjY4TB4DWpSHKAHI7mg0bDCasJ13cSOpK
         Zsvw==
X-Forwarded-Encrypted: i=1; AJvYcCVz1HEFnlTHbjB8H2XvM7gTMMrk7Z7cJ0VuL8FxSDr4QI7/5Ajzaptm5xQKlxr2HMHb7Hqlik0hQItuu9vnIxXUKpqsY6L9fxA34tElacw7
X-Gm-Message-State: AOJu0Yy+ZOWBk2lKbHZH1FUycCOoMB06p5WoMIeEiltXBWPG+YyS1K4W
	r/UFmFPNw9ebOLr/rO10WgI7YiC17oqFopN+9rDxV9iJqIJfZZD4hp72nMruqJ+KrTVWNJDNLNe
	d+g==
X-Google-Smtp-Source: AGHT+IFnC2s9xgJUYrQamoHpNNjMdfjnR6jKC7U3Po3pJ/hHYZ7yn8m2xqR/ZVZ53CGLeUu13/uKbBw5g2Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:dacd:b0:1fb:325d:2b62 with SMTP id
 d9443c01a7336-1ff57464ba5mr9382545ad.10.1722900176428; Mon, 05 Aug 2024
 16:22:56 -0700 (PDT)
Date: Mon, 5 Aug 2024 16:22:54 -0700
In-Reply-To: <345d89c1-4f31-6b49-2cd4-a0696210fa7c@loongson.cn>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-65-seanjc@google.com>
 <a039b758-d4e3-3798-806f-25bceb2f33a5@loongson.cn> <Zq00OYowF5kc9QFE@google.com>
 <345d89c1-4f31-6b49-2cd4-a0696210fa7c@loongson.cn>
Message-ID: <ZrFezgVbCI3DRQH3@google.com>
Subject: Re: [PATCH v12 64/84] KVM: LoongArch: Mark "struct page" pfns dirty
 only in "slow" page fault path
From: Sean Christopherson <seanjc@google.com>
To: maobibo <maobibo@loongson.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_162258_436955_21A8B6EB 
X-CRM114-Status: GOOD (  31.03  )
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

T24gU2F0LCBBdWcgMDMsIDIwMjQsIG1hb2JpYm8gd3JvdGU6Cj4gT24gMjAyNC84LzMg5LiK5Y2I
MzozMiwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiA+IE9uIEZyaSwgQXVnIDAyLCAyMDI0
LCBtYW9iaWJvIHdyb3RlOgo+ID4gPiBPbiAyMDI0LzcvMjcg5LiK5Y2INzo1MiwgU2VhbiBDaHJp
c3RvcGhlcnNvbiB3cm90ZToKPiA+ID4gPiBNYXJrIHBhZ2VzL2ZvbGlvcyBkaXJ0eSBvbmx5IHRo
ZSBzbG93IHBhZ2UgZmF1bHQgcGF0aCwgaS5lLiBvbmx5IHdoZW4KPiA+ID4gPiBtbXVfbG9jayBp
cyBoZWxkIGFuZCB0aGUgb3BlcmF0aW9uIGlzIG1tdV9ub3RpZmllci1wcm90ZWN0ZWQsIGFzIG1h
cmtpbmcgYQo+ID4gPiA+IHBhZ2UvZm9saW8gZGlydHkgYWZ0ZXIgaXQgaGFzIGJlZW4gd3JpdHRl
biBiYWNrIGNhbiBtYWtlIHNvbWUgZmlsZXN5c3RlbXMKPiA+ID4gPiB1bmhhcHB5IChiYWNraW5n
IEtWTSBndWVzdHMgd2lsbCBzdWNoIGZpbGVzeXN0ZW0gZmlsZXMgaXMgdW5jb21tb24sIGFuZAo+
ID4gPiA+IHRoZSByYWNlIGlzIG1pbnVzY3VsZSwgaGVuY2UgdGhlIGxhY2sgb2YgY29tcGxhaW50
cykuCj4gPiA+ID4gCj4gPiA+ID4gU2VlIHRoZSBsaW5rIGJlbG93IGZvciBkZXRhaWxzLgo+ID4g
PiA+IAo+ID4gPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jb3Zlci4xNjgz
MDQ0MTYyLmdpdC5sc3RvYWtlc0BnbWFpbC5jb20KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTZWFu
IENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAg
ICBhcmNoL2xvb25nYXJjaC9rdm0vbW11LmMgfCAxOCArKysrKysrKysrLS0tLS0tLS0KPiA+ID4g
PiAgICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+
ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gva3ZtL21tdS5jIGIvYXJj
aC9sb29uZ2FyY2gva3ZtL21tdS5jCj4gPiA+ID4gaW5kZXggMjYzNGE5ZThkODJjLi4zNjRkZDM1
ZTA1NTcgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9sb29uZ2FyY2gva3ZtL21tdS5jCj4gPiA+
ID4gKysrIGIvYXJjaC9sb29uZ2FyY2gva3ZtL21tdS5jCj4gPiA+ID4gQEAgLTYwOCwxMyArNjA4
LDEzIEBAIHN0YXRpYyBpbnQga3ZtX21hcF9wYWdlX2Zhc3Qoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1bnNpZ25lZCBsb25nIGdwYSwgYm9vbCB3cml0Cj4gPiA+ID4gICAgCQlpZiAoa3ZtX3B0ZV95
b3VuZyhjaGFuZ2VkKSkKPiA+ID4gPiAgICAJCQlrdm1fc2V0X3Bmbl9hY2Nlc3NlZChwZm4pOwo+
ID4gPiA+IC0JCWlmIChrdm1fcHRlX2RpcnR5KGNoYW5nZWQpKSB7Cj4gPiA+ID4gLQkJCW1hcmtf
cGFnZV9kaXJ0eShrdm0sIGdmbik7Cj4gPiA+ID4gLQkJCWt2bV9zZXRfcGZuX2RpcnR5KHBmbik7
Cj4gPiA+ID4gLQkJfQo+ID4gPiA+ICAgIAkJaWYgKHBhZ2UpCj4gPiA+ID4gICAgCQkJcHV0X3Bh
Z2UocGFnZSk7Cj4gPiA+ID4gICAgCX0KPiA+ID4gPiArCj4gPiA+ID4gKwlpZiAoa3ZtX3B0ZV9k
aXJ0eShjaGFuZ2VkKSkKPiA+ID4gPiArCQltYXJrX3BhZ2VfZGlydHkoa3ZtLCBnZm4pOwo+ID4g
PiA+ICsKPiA+ID4gPiAgICAJcmV0dXJuIHJldDsKPiA+ID4gPiAgICBvdXQ6Cj4gPiA+ID4gICAg
CXNwaW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiA+ID4gPiBAQCAtOTE1LDEyICs5MTUsMTQg
QEAgc3RhdGljIGludCBrdm1fbWFwX3BhZ2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25l
ZCBsb25nIGdwYSwgYm9vbCB3cml0ZSkKPiA+ID4gPiAgICAJZWxzZQo+ID4gPiA+ICAgIAkJKytr
dm0tPnN0YXQucGFnZXM7Cj4gPiA+ID4gICAgCWt2bV9zZXRfcHRlKHB0ZXAsIG5ld19wdGUpOwo+
ID4gPiA+IC0Jc3Bpbl91bmxvY2soJmt2bS0+bW11X2xvY2spOwo+ID4gPiA+IC0JaWYgKHByb3Rf
Yml0cyAmIF9QQUdFX0RJUlRZKSB7Cj4gPiA+ID4gLQkJbWFya19wYWdlX2RpcnR5X2luX3Nsb3Qo
a3ZtLCBtZW1zbG90LCBnZm4pOwo+ID4gPiA+ICsJaWYgKHdyaXRlYWJsZSkKPiA+ID4gSXMgaXQg
YmV0dGVyIHRvIHVzZSB3cml0ZSBvciAocHJvdF9iaXRzICYgX1BBR0VfRElSVFkpIGhlcmU/ICB3
cml0YWJsZSBpcwo+ID4gPiBwdGUgcGVybWlzc2lvbiBmcm9tIGZ1bmN0aW9uIGh2YV90b19wZm5f
c2xvdygpLCB3cml0ZSBpcyBmYXVsdCBhY3Rpb24uCj4gPiAKPiA+IE1hcmtpbmcgZm9saW9zIGRp
cnR5IGluIHRoZSBzbG93L2Z1bGwgcGF0aCBiYXNpY2FsbHkgbmVjZXNzaXRhdGVzIG1hcmtpbmcg
dGhlCj4gPiBmb2xpbyBkaXJ0eSBpZiBLVk0gY3JlYXRlcyBhIHdyaXRhYmxlIFNQVEUsIGFzIEtW
TSB3b24ndCBtYXJrIHRoZSBmb2xpbyBkaXJ0eQo+ID4gaWYvd2hlbiBfUEFHRV9ESVJUWSBpcyBz
ZXQuCj4gPiAKPiA+IFByYWN0aWNhbGx5IHNwZWFraW5nLCBJJ20gOTkuOSUgY2VydGFpbiBpdCBk
b2Vzbid0IG1hdHRlci4gIFRoZSBmb2xpbyBpcyBtYXJrZWQKPiA+IGRpcnR5IGJ5IGNvcmUgTU0g
d2hlbiB0aGUgZm9saW8gaXMgbWFkZSB3cml0YWJsZSwgYW5kIGNsZWFuaW5nIHRoZSBmb2xpbyB0
cmlnZ2Vycwo+ID4gYW4gbW11X25vdGlmaWVyIGludmFsaWRhdGlvbi4gIEkuZS4gaWYgdGhlIHBh
Z2UgaXMgbWFwcGVkIHdyaXRhYmxlIGluIEtWTSdzCj4geWVzLCBpdCBpcy4gVGhhbmtzIGZvciB0
aGUgZXhwbGFuYXRpb24uIGt2bV9zZXRfcGZuX2RpcnR5KCkgY2FuIGJlIHB1dCBvbmx5Cj4gaW4g
c2xvdyBwYWdlIGZhdWx0IHBhdGguIEkgb25seSBjb25jZXJuIHdpdGggZmF1bHQgdHlwZSwgcmVh
ZCBmYXVsdCB0eXBlIGNhbgo+IHNldCBwdGUgZW50cnkgd3JpdGFibGUgaG93ZXZlciBub3QgX1BB
R0VfRElSVFkgYXQgc3RhZ2UtMiBtbXUgdGFibGUuCj4gCj4gPiBzdGFnZS0yIFBURXMsIHRoZW4g
aXRzIGZvbGlvIGhhcyBhbHJlYWR5IGJlZW4gbWFya2VkIGRpcnR5Lgo+IENvbnNpZGVyaW5nIG9u
ZSBjb25kaXRpb24gYWx0aG91Z2ggSSBkbyBub3Qga25vdyB3aGV0aGVyIGl0IGV4aXN0cyBhY3R1
YWxseS4KPiB1c2VyIG1vZGUgVk1NIHdyaXRlcyB0aGUgZm9saW8gd2l0aCBodmEgYWRkcmVzcyBm
aXJzdGx5LCB0aGVuIFZDUFUgdGhyZWFkCj4gKnJlYWRzKiB0aGUgZm9saW8uIFdpdGggcHJpbWFy
eSBtbXUgdGFibGUsIHB0ZSBlbnRyeSBpcyB3cml0YWJsZSBhbmQKPiBfUEFHRV9ESVJUWSBpcyBz
ZXQsIHdpdGggc2Vjb25kYXJ5IG1tdSB0YWJsZShzdGF0ZS0yIFBURSB0YWJsZSksIGl0IGlzCj4g
cHRlX25vbmUgc2luY2UgdGhlIGZpbGlvIGlzIGFjY2Vzc2VkIGF0IGZpcnN0IHRpbWUsIHNvIHRo
ZXJlIHdpbGwgYmUgc2xvdwo+IHBhZ2UgZmF1bHQgcGF0aCBmb3Igc3RhZ2UtMiBtbXUgcGFnZSB0
YWJsZSBmaWxsaW5nLgo+IAo+IFNpbmNlIGl0IGlzIHJlYWQgZmF1bHQsIHN0YWdlLTIgUFRFIHdp
bGwgYmUgY3JlYXRlZCB3aXRoIF9QQUdFX1dSSVRFKGNvbWluZwo+IGZyb20gZnVuY3Rpb24gaHZh
X3RvX3Bmbl9zbG93KCkpLCBob3dldmVyIF9QQUdFX0RJUlRZIGlzIG5vdCBzZXQuIERvIHdlIG5l
ZWQKPiBjYWxsIGt2bV9zZXRfcGZuX2RpcnR5KCkgYXQgdGhpcyBzaXR1YXRpb24/CgpJZiBLVk0g
ZG9lc24ndCBtYXJrIHRoZSBmb2xpbyBkaXJ0eSB3aGVuIHRoZSBzdGFnZS0yIF9QQUdFX0RJUlRZ
IGZsYWcgaXMgc2V0LAppLmUuIGFzIHByb3Bvc2VkIGluIHRoaXMgc2VyaWVzLCB0aGVuIHllcywg
S1ZNIG5lZWRzIHRvIGNhbGwga3ZtX3NldF9wZm5fZGlydHkoKQpldmVuIHRob3VnaCB0aGUgVk0g
aGFzbid0ICh5ZXQpIHdyaXR0ZW4gdG8gdGhlIG1lbW9yeS4gIEluIHByYWN0aWNlLCBLVk0gY2Fs
bGluZwprdm1fc2V0X3Bmbl9kaXJ0eSgpIGlzIHJlZHVuZGFudCB0aGUgbWFqb3JpdHkgb2YgdGhl
IHRpbWUsIGFzIHRoZSBzdGFnZS0xIFBURQp3aWxsIGhhdmUgX1BBR0VfRElSVFkgc2V0LCBhbmQg
dGhhdCB3aWxsIGdldCBwcm9wYWdhdGVkIHRvIHRoZSBmb2xpbyB3aGVuIHRoZQpwcmltYXJ5IE1N
VSBkb2VzIGFueXRoaW5nIHJlbGV2YW50IHdpdGggdGhlIFBURS4gIEFuZCBmb3IgZmlsZSBzeXN0
ZW1zIHRoYXQgY2FyZQphYm91dCB3cml0ZWJhY2ssIG9kZHMgYXJlIHZlcnkgZ29vZCB0aGF0IHRo
ZSBmb2xpbyB3YXMgbWFya2VkIGRpcnR5IGV2ZW4gZWFybGllciwKd2hlbiBNTSBpbnZva2VkIHZt
X29wZXJhdGlvbnNfc3RydWN0LnBhZ2VfbWt3cml0ZSgpLgoKVGhlIHJlYXNvbiBJIGFtIHB1c2hp
bmcgdG8gaGF2ZSBhbGwgYXJjaGl0ZWN0dXJlcyBtYXJrIHBhZ2VzL2ZvbGlvcyBkaXJ0eSBpbiB0
aGUKc2xvdyBwYWdlIGZhdWx0IHBhdGggaXMgdGhhdCBhIGZhbHNlIHBvc2l0aXZlIChtYXJraW5n
IGEgZm9saW8gZGlydHkgd2l0aG91dCB0aGUKZm9saW8gZXZlciBiZWluZyB3cml0dGVuIGluIF9h
bnlfIGNvbnRleHQgc2luY2UgdGhlIGxhc3QgcHRlX21rY2xlYW4oKSkgaXMgcmFyZSwKYW5kIGF0
IHdvcnN0IHJlc3VsdHMgYW4gdW5uZWNlc3Nhcnkgd3JpdGViYWNrLiAgT24gdGhlIG90aGVyIGhh
bmQsIG1hcmtpbmcgZm9saW9zCmRpcnR5IGluIGZhc3QgcGFnZSBmYXVsdCBoYW5kbGVycyAob3Ig
YW55d2hlcmUgZWxzZSB0aGF0IGlzbid0IHByb3RlY3RlZCBieQptbXVfbm90aWZpZXJzKSBpcyB0
ZWNobmljYWxseSB1bnNhZmUuCgpJbiBvdGhlciB3b3JkcywgdGhlIGludGVudCBpcyB0byBzYWNy
aWZpY2UgYWNjdXJhY3kgdG8gaW1wcm92ZSBzdGFiaWxpdHkvcm9idXN0bmVzcywKYmVjYXVzZSB0
aGUgdmFzdCBtYWpvcml0eSBvZiB0aW1lIHRoZSBsb3NzIGluIGFjY3VyYWN5IGhhcyBubyBlZmZl
Y3QsIGFuZCB0aGUgd29yc3QKY2FzZSBzY2VuYXJpbyBpcyB0aGF0IHRoZSBrZXJuZWwgZG9lcyBJ
L08gdGhhdCB3YXNuJ3QgbmVjZXNzYXJ5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
