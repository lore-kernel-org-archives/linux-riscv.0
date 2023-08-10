Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2466FC001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 22:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0osLrYR9+GpHZxkjUmXarAkXWaGRv3HI2r808QLQJQQ=; b=cDEk0riKvEo/d/
	1X57+mbHnovrlv/w0RoUhsJDiQ8cRJBp5Cb4S9QALkBAnZDAvEA85EvnAigjflG+fKZqOjOQXAY/d
	o75wMYZxl5jAtAGVmeJmmmTRxZo/vmHiN4Ms9WTD42zlgkXJ7fT0m9R9f84OTbaVqsD0OlOqg0x9j
	M0phlGSxqwHkLhibcqVyMMgY18kdRZGTeWL44K7utDpGmxB8wh04iuMc/nPk2rKF5cJhPBX4ugPy5
	oV92hagStslLdb7hwwXi3TcRKVtZTNJOrlhM5IyvDZ9hUvuf+HNPYbPY9/frx19oP0jveF8ValHWU
	4yC4E1APGw1vPvDwk0Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUEEV-008qNi-0N;
	Thu, 10 Aug 2023 22:34:19 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUEEQ-008qKm-35
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 22:34:17 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4036bd4fff1so57571cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 15:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691706851; x=1692311651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iczog4wlh1DjFLdMSzEvmMOPilWHUZVQiRjWpcVknB4=;
        b=epAa0LKnKl5u66Y9RbFdhV8Lv5Y/bmCosxzVw0hc7/eKhboiaA24S7kWFOsvT3d/6v
         R5IFwTcqvp9Hl6i35RRRje6JKgkiqfcZXUhHwrDZqwjImCaIXKPw6fnTz3qawFl9qWaN
         y1BRsMkYdM/Vkm71K//EAIh0oMZ2T+tki5MWNLYHdhoMwDETGGk0C72DSKPpcNtdVI/n
         6LbzVP/Y6nqhT0KZCcZ0oV8L7F4BxrgoCsvYOMX2D/8fZYXweyhURULxqXDrb/hulRuS
         zA+fdeTbAiZsAJP20VaE+kk7PO04ERwsCiYM4LqdhVp0INromfUBIr5ctl+cNBTnxFca
         OXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691706851; x=1692311651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iczog4wlh1DjFLdMSzEvmMOPilWHUZVQiRjWpcVknB4=;
        b=JJ2Ejhy98fkYcPIoHffcMiVNJuBUVdw0H8ICHQyTPqAeuAhSDGD2ss06L+5jwCp+hj
         r477LdY2MixNGExIaxMpUNo+9caj29RVHdz1A7snZiGdna26QUPIUSc22+lWc5v9GEyH
         2L1wezIRzhF9Fb43EgQYcnxC2yycz2JCCHv8y1i+aZ7XQ38B1Q9icqPy+PLR2Uft8mVh
         tSev1bvFe57VYF0UfrAatH5W3rJgYZJptu3OrmmQnfSHPB2oQtTrS/gSbhHd2DMI/sCu
         oczR90E/Pzb/n2qTQrwWyrzaXEjKX4WbfJjbx56bspQrEKiHu6pP3Yn4cF4t3YXkJMVP
         Evpg==
X-Gm-Message-State: AOJu0Yxqv8YMnYcmJs+AiLE0hpQjaVtkHfMuHBpL+Ei0avzfXSI/1BrR
	SOw/LevleFX2adt5Ex29diNvmltocXNeCNJRz1PXLw==
X-Google-Smtp-Source: AGHT+IHAtNxlpUZmQoXEcDxVa2yk3p3K+PVD72RQhW5Mh60EHaBNEWbQ+TxSW7uZIaokAfbLajpQhvWaiqGPsEZ9Nws=
X-Received: by 2002:ac8:7d55:0:b0:3ef:3361:75d5 with SMTP id
 h21-20020ac87d55000000b003ef336175d5mr45398qtb.11.1691706851560; Thu, 10 Aug
 2023 15:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com> <20230808231330.3855936-3-rananta@google.com>
 <c33b0518-6e64-7acf-efa8-f404fce1ccac@redhat.com> <CAJHc60yCJANBQOizaoSPhEJH9e8a9C6n68x4qdVkOhVZiiWqkw@mail.gmail.com>
 <30e45ef3-309a-63de-e085-be1645c1be79@redhat.com> <CAJHc60x=bhXS3PahuRPwRVdqN4LeX-PBdjdEeCEomhf2YAJ1mw@mail.gmail.com>
 <ZNVfsxdYKu9Nt+j+@google.com>
In-Reply-To: <ZNVfsxdYKu9Nt+j+@google.com>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Thu, 10 Aug 2023 15:34:00 -0700
Message-ID: <CAJHc60w0By2Q+PCsfwReGXsN5zf5k1ww3Ov4m9Eb-pFH-UKBDg@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
To: Sean Christopherson <seanjc@google.com>
Cc: Shaoqin Huang <shahuang@redhat.com>, Gavin Shan <gshan@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_153415_017167_71C99CD6 
X-CRM114-Status: GOOD (  29.95  )
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

T24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgMzoyMOKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDEwLCAyMDIzLCBSYWdoYXZl
bmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgNToyNuKA
r0FNIFNoYW9xaW4gSHVhbmcgPHNoYWh1YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPiBPbiA4
LzEwLzIzIDAwOjM4LCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+ID4gPiA+Pj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hv
c3QuaAo+ID4gPiA+Pj4gaW5kZXggZTNmOTY4YjM4YWU5Ny4uYWRlNWQ0NTAwYzJjZSAxMDA2NDQK
PiA+ID4gPj4+IC0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+ID4gPiA+Pj4gKysrIGIv
aW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gPiA+ID4+PiBAQCAtMTQ4NCw2ICsxNDg0LDggQEAg
c3RhdGljIGlubGluZSBpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoc3RydWN0IGt2bSAq
a3ZtKQo+ID4gPiA+Pj4gICAgewo+ID4gPiA+Pj4gICAgICAgIHJldHVybiAtRU5PVFNVUFA7Cj4g
PiA+ID4+PiAgICB9Cj4gPiA+ID4+PiArI2Vsc2UKPiA+ID4gPj4+ICtpbnQga3ZtX2FyY2hfZmx1
c2hfcmVtb3RlX3RsYnMoc3RydWN0IGt2bSAqa3ZtKTsKPiA+ID4gPj4+ICAgICNlbmRpZgo+ID4g
PiA+Pj4KPiA+ID4gPj4+ICAgICNpZmRlZiBfX0tWTV9IQVZFX0FSQ0hfTk9OQ09IRVJFTlRfRE1B
Cj4gPiA+ID4+Cj4gPiA+ID4+IElzIHRoZSBkZWNsYXJhdGlvbiBpbmNvbnNpc3RlbnQgdG8gdGhh
dCBpbiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oPwo+ID4gPiA+PiBJbiBvcmRlciB0
byBrZWVwIHRoZW0gY29uc2lzdGVudCwgSSBndWVzcyB3ZSBuZWVkIG1vdmUga3ZtX2FyY2hfZmx1
c2hfcmVtb3RlX3RsYnMoKQo+ID4gPiA+PiBmcm9tIHg4NidzIGhlYWRlciBmaWxlIHRvIGFyY2gv
eDg2L2t2bS9tbXUvbW11LmMgYW5kICdpbmxpbmUnIG5lZWRzIHRvIGJlIGRyb3BwZWQuCj4gPiA+
ID4+Cj4gPiA+ID4gVW5zdXJlIG9mIHRoZSBvcmlnaW5hbCBpbnRlbnRpb25zLCBJIGRpZG4ndCB3
YW50IHRvIGRpc3R1cmIgYW55Cj4gPiA+ID4gZXhpc3RpbmcgYXJyYW5nZW1lbnRzLiBJZiBtb3Jl
IHBlb3BsZSBhZ3JlZSB0byB0aGlzIHJlZmFjdG9yaW5nLCBJJ20KPiA+ID4gPiBoYXBweSB0byBt
b3ZlLgo+ID4gPgo+ID4gPiBUaGlzIGlzIGFtYXppbmcgdG8gbWUuIFRoaXMgY2hhbmdlIGNhbiBi
ZSBjb21waWxlZCB3aXRob3V0IGFueSBlcnJvcgo+ID4gPiBldmVuIGlmIHRoZSBkZWNsYXJhdGlv
biBpbmNvbnNpc3RlbnQgYmV0d2VlbiB0aGUga3ZtX2hvc3QuaCBhbmQgeDg2J3MKPiA+ID4gaGVh
ZGVyIGZpbGUuCj4gPiA+Cj4gPiA+IEknbSBjdXJpb3VzIHdoaWNoIG9wdGlvbiBtYWtlIGl0IHBv
c3NpYmxlPwo+ID4gPgo+ID4gQWZ0ZXIgZG9pbmcgc29tZSBleHBlcmltZW50cywgSSB0aGluayBp
dCB3b3JrcyBiZWNhdXNlIG9mIHRoZSBvcmRlciBpbgo+ID4gd2hpY2ggdGhlIGlubGluZS1kZWZp
bml0aW9uIGFuZCB0aGUgZGVjbGFyYXRpb24gYXJlIGxhaWQgb3V0LiBJZiB0aGUKPiA+ICdpbmxp
bmUnIHBhcnQgb2YgdGhlIGZ1bmN0aW9uIGNvbWVzIGZpcnN0IGFuZCB0aGVuIHRoZSBkZWNsYXJh
dGlvbiwgd2UKPiA+IGRvbid0IHNlZSBhbnkgZXJyb3IuIEhvd2V2ZXIgaWYgdGhlIHBvc2l0aW9u
cyB3ZXJlIHJldmVyc2VkLCB3ZSB3b3VsZAo+ID4gc2VlIGFuIGVycm9yLiAoSSdtIG5vdCBzdXJl
IHdoYXQgdGhlIHRlY2huaWNhbCByZWFzb24gZm9yIHRoaXMgaXMpLgo+ID4KPiA+IEp1c3QgdG8g
YmUgc2FmZSwgSSBjYW4gbW92ZSB0aGUgZGVmaW5pdGlvbiB0byBhcmNoL3g4Ni9rdm0vbW11L21t
dS5jCj4gPiBhcyBhIG5vbi1pbmxpbmUgZnVuY3Rpb24uCj4KPiBObyBuZWVkLCBhc20va3ZtX2hv
c3QuaCBfbXVzdF8gYmUgaW5jbHVkZWQgYmVmb3JlIHRoZSBkZWNsYXJhdGlvbiwgb3RoZXJ3aXNl
IHRoZQo+IGRlY2xhcmF0aW9uIHdvdWxkbid0IGJlIG1hZGUgYmVjYXVzZSBfX0tWTV9IQVZFX0FS
Q0hfRkxVU0hfUkVNT1RFX1RMQlMgd291bGRuJ3QKPiBiZSBkZWZpbmVkLiAgSS5lLiB3ZSB3b24n
dCBydW4gaW50byBpc3N1ZXMgd2hlcmUgdGhlIG5vbi1zdGF0aWMgZGVjbGFyYXRpb24gY29tZXMK
PiBiZWZvcmUgdGhlIHN0YXRpYyBpbmxpbmUgZGVmaW5pdGlvbi4KPgo+IEM5OSBleHBsaWNpdGx5
IGNvdmVycyB0aGlzIGNhc2U6Cj4KPiAgIDYuMi4yIExpbmthZ2VzIG9mIGlkZW50aWZpZXJzCj4K
PiAgIC4uLgo+Cj4gICBJZiB0aGUgZGVjbGFyYXRpb24gb2YgYSBmaWxlIHNjb3BlIGlkZW50aWZp
ZXIgZm9yIGFuIG9iamVjdCBvciBhIGZ1bmN0aW9uIGNvbnRhaW5zIHRoZSBzdG9yYWdlLQo+ICAg
Y2xhc3Mgc3BlY2lmaWVyIHN0YXRpYywgdGhlIGlkZW50aWZpZXIgaGFzIGludGVybmFsIGxpbmth
Z2UuCj4KPiAgIEZvciBhbiBpZGVudGlmaWVyIGRlY2xhcmVkIHdpdGggdGhlIHN0b3JhZ2UtY2xh
c3Mgc3BlY2lmaWVyIGV4dGVybiBpbiBhIHNjb3BlIGluIHdoaWNoIGEKPiAgIHByaW9yIGRlY2xh
cmF0aW9uIG9mIHRoYXQgaWRlbnRpZmllciBpcyB2aXNpYmxlIGlmIHRoZSBwcmlvciBkZWNsYXJh
dGlvbiBzcGVjaWZpZXMgaW50ZXJuYWwgb3IKPiAgIGV4dGVybmFsIGxpbmthZ2UsIHRoZSBsaW5r
YWdlIG9mIHRoZSBpZGVudGlmaWVyIGF0IHRoZSBsYXRlciBkZWNsYXJhdGlvbiBpcyB0aGUgc2Ft
ZSBhcyB0aGUKPiAgIGxpbmthZ2Ugc3BlY2lmaWVkIGF0IHRoZSBwcmlvciBkZWNsYXJhdGlvbi4g
SWYgbm8gcHJpb3IgZGVjbGFyYXRpb24gaXMgdmlzaWJsZSwgb3IgaWYgdGhlIHByaW9yCj4gICBk
ZWNsYXJhdGlvbiBzcGVjaWZpZXMgbm8gbGlua2FnZSwgdGhlbiB0aGUgaWRlbnRpZmllciBoYXMg
ZXh0ZXJuYWwgbGlua2FnZS4KPgo+IEluIHNob3J0LCBiZWNhdXNlIHRoZSAic3RhdGljIGlubGlu
ZSIgZGVjbGFyZWQgaW50ZXJuYWwgbGlua2FnZSBmaXJzdCwgaXQgd2lucy4KVGhhbmtzIGZvciBz
aGFyaW5nIHRoaXMhIEkgY2FuIGtlZXAgdGhlICdzdGF0aWMgaW5saW5lJyBkZWZpbml0aW9uIGFz
CmlzIHRoZW4uIEhvd2V2ZXIsIHNpbmNlIGEgbGF0ZXIgcGF0Y2ggKHBhdGNoLTA1LzE0KSBkZWZp
bmVzCmt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKCkgaW4gYXJjaC94ODYva3ZtL21t
dS9tbXUuYywgZG8geW91CnRoaW5rIHdlIGNhbiBtb3ZlIHRoaXMgZGVmaW5pdGlvbiB0byB0aGUg
LmMgZmlsZSBhcyB3ZWxsIGZvcgpjb25zaXN0ZW5jeT8KClRoYW5rIHlvdS4KUmFnaGF2ZW5kcmEK
CgpSYWdoYXZlbmRyYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
