Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A75C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EX1ec9ntI+NXjvDuPNfWP6fa/gq9rMBxfya5C43eUk=; b=Gy+q0tlqU1d83A
	v7K8JQtGP3EpX9ORNenkHYqis2DZjVApIxBPsW3eJc5oV+AriVXPE6ilnLPVD0Ajp25JqeLXcVrFh
	7V9pT1cvn3KMr3vCpzABBcQhhHf5GkNsVpRgbduVnrkADw9WIFFqcihmfyztnqXsfwhl8YGe0T7hB
	FPvEsbaDaMOh6RHEOeBAzoPbU1dj90tmvgV/NInvfLQmBu6pLUXNuBo3Nnb1Vor8Ir8xO8UgYuxls
	mXSOjIZhFI/KKApvddojEN4fpGJ6mcSIsw68W32YbtO1hfiB8PV64DVS99m41PWVhWUR2rLg2PoX8
	tKcNVhou9LJak0HI2/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyZ8p-009hMJ-1o;
	Thu, 02 Nov 2023 14:57:51 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyZ8m-009hLD-0k
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 14:57:50 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-777719639adso59161985a.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 07:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698937067; x=1699541867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oO6y6W0Hx2JX7rhY2F9inSHXy5EHTr89TCOrnU0rbjw=;
        b=A8BcrZHjL6zbI5P4gq58XLE7nlJwndZoyfWLy5cpvvra+vvkIR1mRIyqqoO8VqOwmN
         JM+tz6621ri9SJtgy9Rao0swalyUwFeekK3YD+EwospLLH2nqya6uM5H3YkaTVIhoaN0
         g5Y6PHgjvgv18jagBmXvbE3eSL09H+BtG2KL6CpIT7CMtI4zWmWG73t+XQbiz759NLLC
         fcnNMQvsLNxwBYYKKNlLB2PZbMteppjIV6O7eLvpeq/QhcdaOpWmO6qj3t9V2EnBXHrP
         tjsaeyAFmF8O91TFyQJiE2MI4Bj0oQA3bXQdeEhUNf/J5x2pirDnp+YtvPMJwKcPh42J
         uqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698937067; x=1699541867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oO6y6W0Hx2JX7rhY2F9inSHXy5EHTr89TCOrnU0rbjw=;
        b=xUikRmeQoVHN/7/nmCo8OOaxg7Bg4Jd8TLqeqPDmrYLnd9aSCUzQkYGtKpllil6hfj
         VarUHaxopoD+nJYmZ+pKniCcW5f6X2lmN37jqqcnhbPXQo7IWz8qnTJ/rLLOSAkMO1KE
         KbJEM6689l8gYArvw0DX7XfijwUPpEtRitdtPJo6mFhxDxD5/r7a4PJ9kyu4Q5AcjgYJ
         0DkaU0Vp+qI+0Y2VETaDkzwMX/j9fvekHq8+wkTnlCpvZb6koHbhG0c7tHygSn8LfGOy
         j8yXobt1/uPxr0zUQerz6prESjhCmXdf+gbhTguLr9z2MzvnLWTM3K2OA7itSPLxfczi
         I2XQ==
X-Gm-Message-State: AOJu0Yy+XQM8XCIYc6MSuZ0zSV09Jrdt7c3Arz0GEcHqh4o+MWP6dbwW
	wSP5Ayttgb5eD1KlRQ08S4vIbwA4KYUDTxsy7OEosA==
X-Google-Smtp-Source: AGHT+IHH5fWOUl6XWE3cRbRkmtci3EQG11sJ5sTElOUO4i3o8jogptvsMwjY2tQIjVOiF2P5A518xtVBqTDVb2uPT1o=
X-Received: by 2002:a05:6214:252d:b0:66d:1b2f:3f64 with SMTP id
 gg13-20020a056214252d00b0066d1b2f3f64mr24532994qvb.31.1698937066885; Thu, 02
 Nov 2023 07:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-13-seanjc@google.com>
 <CA+EHjTyAU9XZ3OgqXjmAKh-BKsLrH_8QtnJihQxF4fhk8WPSYg@mail.gmail.com> <ZUO1Giju0GkUdF0o@google.com>
In-Reply-To: <ZUO1Giju0GkUdF0o@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 14:57:10 +0000
Message-ID: <CA+EHjTwpVSyUC8oiii3EYU8pqEJ0D0NXA1EZt76wjfPBpk2rFA@mail.gmail.com>
Subject: Re: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
To: Sean Christopherson <seanjc@google.com>
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
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_075748_273372_FABABA05 
X-CRM114-Status: GOOD (  30.71  )
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

T24gVGh1LCBOb3YgMiwgMjAyMyBhdCAyOjQx4oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMDIsIDIwMjMsIEZ1YWQgVGFi
YmEgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiBGcmksIE9jdCAyNywgMjAyMyBhdCA3OjIy4oCv
UE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBBZGQgZmxhZ3MgdG8gInN0cnVjdCBrdm1fZ2ZuX3JhbmdlIiB0byBsZXQgbm90aWZpZXIg
ZXZlbnRzIHRhcmdldCBvbmx5Cj4gPiA+IHNoYXJlZCBhbmQgb25seSBwcml2YXRlIG1hcHBpbmdz
LCBhbmQgd3JpdGUgdXAgdGhlIGV4aXN0aW5nIG1tdV9ub3RpZmllcgo+ID4gPiBldmVudHMgdG8g
YmUgc2hhcmVkLW9ubHkgKHByaXZhdGUgbWVtb3J5IGlzIG5ldmVyIGFzc29jaWF0ZWQgd2l0aCBh
Cj4gPiA+IHVzZXJzcGFjZSB2aXJ0dWFsIGFkZHJlc3MsIGkuZS4gY2FuJ3QgYmUgcmVhY2hlZCB2
aWEgbW11X25vdGlmaWVycykuCj4gPiA+Cj4gPiA+IEFkZCB0d28gZmxhZ3Mgc28gdGhhdCBLVk0g
Y2FuIGhhbmRsZSB0aGUgdGhyZWUgcG9zc2liaWxpdGllcyAoc2hhcmVkLAo+ID4gPiBwcml2YXRl
LCBhbmQgc2hhcmVkK3ByaXZhdGUpIHdpdGhvdXQgbmVlZGluZyBzb21ldGhpbmcgbGlrZSBhIHRy
aS1zdGF0ZQo+ID4gPiBlbnVtLgo+ID4gPgo+ID4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvWkpYMGhrK0twUVAwS1V5QkBnb29nbGUuY29tCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+ID4gPiAtLS0KPiA+ID4g
IGluY2x1ZGUvbGludXgva3ZtX2hvc3QuaCB8IDIgKysKPiA+ID4gIHZpcnQva3ZtL2t2bV9tYWlu
LmMgICAgICB8IDcgKysrKysrKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2lu
Y2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+ID4gPiBpbmRleCA5NmFhOTMwNTM2YjEuLjg5YzFhOTkx
YTNiOCAxMDA2NDQKPiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gPiA+ICsr
KyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+ID4gPiBAQCAtMjYzLDYgKzI2Myw4IEBAIHN0
cnVjdCBrdm1fZ2ZuX3JhbmdlIHsKPiA+ID4gICAgICAgICBnZm5fdCBzdGFydDsKPiA+ID4gICAg
ICAgICBnZm5fdCBlbmQ7Cj4gPiA+ICAgICAgICAgdW5pb24ga3ZtX21tdV9ub3RpZmllcl9hcmcg
YXJnOwo+ID4gPiArICAgICAgIGJvb2wgb25seV9wcml2YXRlOwo+ID4gPiArICAgICAgIGJvb2wg
b25seV9zaGFyZWQ7Cj4gPgo+ID4gSWYgdGhlc2UgZmxhZ3MgYXJlbid0IHVzZWQgaW4gdGhpcyBw
YXRjaCBzZXJpZXMsIHNob3VsZCB0aGlzIHBhdGNoIGJlCj4gPiBtb3ZlZCB0byB0aGUgb3RoZXIg
c2VyaWVzPwo+Cj4gSWYgKmJvdGgqIFREWCBhbmQgU05QIG5lZWQgdGhpcyBwYXRjaCwgdGhlbiBJ
IHRoaW5rIGl0J3MgcHJvYmFibHkgd29ydGggYXBwbHlpbmcKPiBpdCBub3cgdG8gbWFrZSB0aGVp
ciBsaXZlcyBlYXNpZXIuICBCdXQgaWYgb25seSBvbmUgbmVlZHMgdGhlIHN1cHBvcnQsIHRoZW4g
SQo+IGNvbXBsZXRlbHkgYWdyZWUgdGhpcyBzaG91bGQgYmUgcHVudGVkIHRvIHdoaWNoZXZlciBz
ZXJpZXMgbmVlZHMgaXQgKHRoaXMgYWxzbwo+IGNhbWUgdXAgaW4gdjExLCBidXQgd2UgZGlkbid0
IGZvcmNlIHRoZSBpc3N1ZSkuCj4KPiBNaWtlLCBJc2FrdT8KPgo+ID4gQWxzbywgaWYgc2hhcmVk
K3ByaXZhdGUgaXMgYSBwb3NzaWJpbGl0eSwgZG9lc24ndCB0aGUgcHJlZml4ICJvbmx5XyIKPiA+
IGNvbmZ1c2UgdGhpbmdzIGEgYml0PyBJLmUuLCB3aGF0IGlzIHNoYXJlZCtwcml2YXRlLCBpcyBp
dCB3aGVuIGJvdGgKPiA+IGFyZSAwIG9yIHdoZW4gYm90aCBhcmUgMT8gSSBhc3N1bWUgaXQncyB0
aGUgZm9ybWVyIChib3RoIGFyZSAwKSwgYnV0Cj4gPiBpdCBtaWdodCBiZSBjbGVhcmVyLgo+Cj4g
SGVoLCBJIHdhcyBob3BpbmcgdGhhdCAib25seV9wcml2YXRlICYmIG9ubHlfc2hhcmVkIiB3b3Vs
ZCBiZSBvYnZpb3VzbHkgbm9uc2Vuc2ljYWwuCj4KPiBUaGUgb25seSBhbHRlcm5hdGl2ZSBJIGNh
biB0aGluayB3b3VsZCBiZSB0byBhZGQgYW4gZW51bSwgZS5nLgo+Cj4gICAgICAgICBlbnVtIHsK
PiAgICAgICAgICAgICAgICAgUFJPQ0VTU19QUklWQVRFX0FORF9TSEFSRUQsCj4gICAgICAgICAg
ICAgICAgIFBST0NFU1NfT05MWV9QUklWQVRFLAo+ICAgICAgICAgICAgICAgICBQUk9DRVNTX09O
TFlfU0hBUkVELAo+ICAgICAgICAgfTsKPgo+IGJlY2F1c2UgZXZlcnkgb3RoZXIgd2F5IG9mIGV4
cHJlc3NpbmcgdGhlIGZsYWdzIGVpdGhlciByZXN1bHRzIGluIG1vcmUgY29uZnVzaW9uCj4gb3Ig
YW4gdW5zYWZlIGRlZmF1bHQuICBJLmUuIEkgd2FudCB6YXBwaW5nIG9ubHkgcHJpdmF0ZSBvciBv
bmx5IHNoYXJlZCB0byByZXF1aXJlCj4gdGhlIGNhbGxlciB0byBleHBsaWNpdGx5IHNldCBhIG5v
bi16ZXJvIHZhbHVlLCB3aGljaCBpcyBob3cgSSBlbmRlZCB1cCB3aXRoCj4gIm9ubHlfe3ByaXZh
dGUsc2hhcmVkfSIgYXMgb3Bwb3NlZCB0byAicHJvY2Vzc197cHJpdmF0ZSxzaGFyZWR9Ii4KCkkg
ZG9uJ3QgaGF2ZSBhIHN0cm9uZyBvcGluaW9uIGFib3V0IHRoaXMuIEhhdmluZyBhbiBlbnVtIGxv
b2tzIGdvb2QgdG8gbWUuCgpDaGVlcnMsCi9mdWFkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
