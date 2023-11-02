Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD9EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UIAKUOfaJ1JD7hWvHoS4yTSb3SPHaYEh3UbhQnAt4bA=; b=TwKwmPrSA17CoJpf+aHD86p4LI
	YNVgVwQUxoQ8qtqcVVTWcdHfyWKPLJYlZ/nAO0RDo+ZJL+hEKiPgk9+fLbpzpwxu1EkGvl87QE8SY
	z9AcV8xiHmiFE5sGGvw9H1oFVE18CRQ3QYzvfod+SraO5K7iHHhSzJWzZzXWe3jtYfpN3kOkxQo/G
	wBPmuh1hJ7krYL8F+J3Tk5bIvsKXqJQggw5yJiFLHHAE34CFeSh7Z2ShWVWVQZM2S6I1ZlIhA7j+B
	6vUOd62YN/SKeDUSTo+YxdMVjihnmy98uiPk3gxPZ69MZJcxzFTkz8mJ3Ea1l0r5+7rQhJKSM5qRA
	v1E6I/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYtC-009fRR-1g;
	Thu, 02 Nov 2023 14:41:42 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYt9-009fPJ-14
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 14:41:40 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5b02ed0f886so15048087b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698936092; x=1699540892; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhBeRDHIuw2MhHJCiZzpmIP+VopsidfcOzvL++iqJMc=;
        b=jHDLGgEyradEzctPSItz/0aLd8njbLRToFgJmy8T2NDoDKVLV3JrhUlAQpmM9A0jMV
         A3evLxYNyfbBI+mRFA0Ame2lwY7J5UnjRm56w7kfhxyuhyYSEGdj6FyCo0Nw0C5aPlIZ
         FRVnmrco3yCb7Gj0UQ9hKKu5v5+znAFhjGlLyN8HsM4OqsVUDP0mNEOjOM48xkID6MNV
         9qkRxAkoYfqTG7AU1/tyM+A81Ada7IQ/1eg+FrJJIHsPoDIFkWL7hDOZ4INUlWjX4s7a
         VIcOJzTLC3gDAKPr//LZLPKeUgCTjE5Y7HYNObxSVNykn738/UCel/8DBDe7DsDJyXXr
         +odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698936092; x=1699540892;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xhBeRDHIuw2MhHJCiZzpmIP+VopsidfcOzvL++iqJMc=;
        b=np5t3RUjknLdoi7k7wUPRebcrxzc3UNYkfbbGaOp1wAk/fdG2Ly/NmNfYItwRJuf/K
         V4m6uSwQG1HTwN5iVxPnHrOa6Xe540htPAo9ai4zReincX4W2dENLP/U3jGfI9xEj8Q8
         DF3GFqRb7ZkaXSStoAjDyHzXfhgI2ZQwgAQ1psg5aSsz9slktMZbI0V1gATwzf+wMfSN
         QbJJ8KG3b6ZIpL64wQq/JgBqqIaVPIyJcK7JDDeraFy1WsWuxVVWubSt8HITxleuATHR
         uOHl6xHYeC3JJ2mCewUP9gf+ID+aEK6jaORlTBnGRldlfFlN9pVZKoi+7VFwte/Teh4S
         uz7A==
X-Gm-Message-State: AOJu0YwG9wijjyFT8Lkf6ETvCu0MGQ2ux05nAqZQdz7AyYkeMpaO17Bs
	u6vc6yVn02Z/oEiQSBu0ay1f1XvSYkk=
X-Google-Smtp-Source: AGHT+IGookYXrYm1A+ma3WZO34BPnkwMLXQzWy+6HX4P/l5wwOteWAD0NK2vYdNE8zwnCUE9EMm+eRT161A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2fce:0:b0:d9a:f3dc:7d19 with SMTP id
 v197-20020a252fce000000b00d9af3dc7d19mr331431ybv.11.1698936092597; Thu, 02
 Nov 2023 07:41:32 -0700 (PDT)
Date: Thu, 2 Nov 2023 07:41:30 -0700
In-Reply-To: <CA+EHjTyAU9XZ3OgqXjmAKh-BKsLrH_8QtnJihQxF4fhk8WPSYg@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-13-seanjc@google.com>
 <CA+EHjTyAU9XZ3OgqXjmAKh-BKsLrH_8QtnJihQxF4fhk8WPSYg@mail.gmail.com>
Message-ID: <ZUO1Giju0GkUdF0o@google.com>
Subject: Re: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_074139_369599_41298B61 
X-CRM114-Status: GOOD (  24.90  )
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

T24gVGh1LCBOb3YgMDIsIDIwMjMsIEZ1YWQgVGFiYmEgd3JvdGU6Cj4gSGksCj4gCj4gT24gRnJp
LCBPY3QgMjcsIDIwMjMgYXQgNzoyMuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bn
b29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBBZGQgZmxhZ3MgdG8gInN0cnVjdCBrdm1fZ2ZuX3Jh
bmdlIiB0byBsZXQgbm90aWZpZXIgZXZlbnRzIHRhcmdldCBvbmx5Cj4gPiBzaGFyZWQgYW5kIG9u
bHkgcHJpdmF0ZSBtYXBwaW5ncywgYW5kIHdyaXRlIHVwIHRoZSBleGlzdGluZyBtbXVfbm90aWZp
ZXIKPiA+IGV2ZW50cyB0byBiZSBzaGFyZWQtb25seSAocHJpdmF0ZSBtZW1vcnkgaXMgbmV2ZXIg
YXNzb2NpYXRlZCB3aXRoIGEKPiA+IHVzZXJzcGFjZSB2aXJ0dWFsIGFkZHJlc3MsIGkuZS4gY2Fu
J3QgYmUgcmVhY2hlZCB2aWEgbW11X25vdGlmaWVycykuCj4gPgo+ID4gQWRkIHR3byBmbGFncyBz
byB0aGF0IEtWTSBjYW4gaGFuZGxlIHRoZSB0aHJlZSBwb3NzaWJpbGl0aWVzIChzaGFyZWQsCj4g
PiBwcml2YXRlLCBhbmQgc2hhcmVkK3ByaXZhdGUpIHdpdGhvdXQgbmVlZGluZyBzb21ldGhpbmcg
bGlrZSBhIHRyaS1zdGF0ZQo+ID4gZW51bS4KPiA+Cj4gPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvWkpYMGhrK0twUVAwS1V5QkBnb29nbGUuY29tCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIGlu
Y2x1ZGUvbGludXgva3ZtX2hvc3QuaCB8IDIgKysKPiA+ICB2aXJ0L2t2bS9rdm1fbWFpbi5jICAg
ICAgfCA3ICsrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4
L2t2bV9ob3N0LmgKPiA+IGluZGV4IDk2YWE5MzA1MzZiMS4uODljMWE5OTFhM2I4IDEwMDY0NAo+
ID4gLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4
L2t2bV9ob3N0LmgKPiA+IEBAIC0yNjMsNiArMjYzLDggQEAgc3RydWN0IGt2bV9nZm5fcmFuZ2Ug
ewo+ID4gICAgICAgICBnZm5fdCBzdGFydDsKPiA+ICAgICAgICAgZ2ZuX3QgZW5kOwo+ID4gICAg
ICAgICB1bmlvbiBrdm1fbW11X25vdGlmaWVyX2FyZyBhcmc7Cj4gPiArICAgICAgIGJvb2wgb25s
eV9wcml2YXRlOwo+ID4gKyAgICAgICBib29sIG9ubHlfc2hhcmVkOwo+IAo+IElmIHRoZXNlIGZs
YWdzIGFyZW4ndCB1c2VkIGluIHRoaXMgcGF0Y2ggc2VyaWVzLCBzaG91bGQgdGhpcyBwYXRjaCBi
ZQo+IG1vdmVkIHRvIHRoZSBvdGhlciBzZXJpZXM/CgpJZiAqYm90aCogVERYIGFuZCBTTlAgbmVl
ZCB0aGlzIHBhdGNoLCB0aGVuIEkgdGhpbmsgaXQncyBwcm9iYWJseSB3b3J0aCBhcHBseWluZwpp
dCBub3cgdG8gbWFrZSB0aGVpciBsaXZlcyBlYXNpZXIuICBCdXQgaWYgb25seSBvbmUgbmVlZHMg
dGhlIHN1cHBvcnQsIHRoZW4gSQpjb21wbGV0ZWx5IGFncmVlIHRoaXMgc2hvdWxkIGJlIHB1bnRl
ZCB0byB3aGljaGV2ZXIgc2VyaWVzIG5lZWRzIGl0ICh0aGlzIGFsc28KY2FtZSB1cCBpbiB2MTEs
IGJ1dCB3ZSBkaWRuJ3QgZm9yY2UgdGhlIGlzc3VlKS4KCk1pa2UsIElzYWt1PwoKPiBBbHNvLCBp
ZiBzaGFyZWQrcHJpdmF0ZSBpcyBhIHBvc3NpYmlsaXR5LCBkb2Vzbid0IHRoZSBwcmVmaXggIm9u
bHlfIgo+IGNvbmZ1c2UgdGhpbmdzIGEgYml0PyBJLmUuLCB3aGF0IGlzIHNoYXJlZCtwcml2YXRl
LCBpcyBpdCB3aGVuIGJvdGgKPiBhcmUgMCBvciB3aGVuIGJvdGggYXJlIDE/IEkgYXNzdW1lIGl0
J3MgdGhlIGZvcm1lciAoYm90aCBhcmUgMCksIGJ1dAo+IGl0IG1pZ2h0IGJlIGNsZWFyZXIuCgpI
ZWgsIEkgd2FzIGhvcGluZyB0aGF0ICJvbmx5X3ByaXZhdGUgJiYgb25seV9zaGFyZWQiIHdvdWxk
IGJlIG9idmlvdXNseSBub25zZW5zaWNhbC4KClRoZSBvbmx5IGFsdGVybmF0aXZlIEkgY2FuIHRo
aW5rIHdvdWxkIGJlIHRvIGFkZCBhbiBlbnVtLCBlLmcuCgoJZW51bSB7CgkJUFJPQ0VTU19QUklW
QVRFX0FORF9TSEFSRUQsCgkJUFJPQ0VTU19PTkxZX1BSSVZBVEUsCgkJUFJPQ0VTU19PTkxZX1NI
QVJFRCwKCX07CgpiZWNhdXNlIGV2ZXJ5IG90aGVyIHdheSBvZiBleHByZXNzaW5nIHRoZSBmbGFn
cyBlaXRoZXIgcmVzdWx0cyBpbiBtb3JlIGNvbmZ1c2lvbgpvciBhbiB1bnNhZmUgZGVmYXVsdC4g
IEkuZS4gSSB3YW50IHphcHBpbmcgb25seSBwcml2YXRlIG9yIG9ubHkgc2hhcmVkIHRvIHJlcXVp
cmUKdGhlIGNhbGxlciB0byBleHBsaWNpdGx5IHNldCBhIG5vbi16ZXJvIHZhbHVlLCB3aGljaCBp
cyBob3cgSSBlbmRlZCB1cCB3aXRoCiJvbmx5X3twcml2YXRlLHNoYXJlZH0iIGFzIG9wcG9zZWQg
dG8gInByb2Nlc3Nfe3ByaXZhdGUsc2hhcmVkfSIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
