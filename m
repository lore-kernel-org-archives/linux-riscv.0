Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50083C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOLsyd85h+IKJ7cMUCCaD8dXl6kRZvTRQi9jrlVlfj8=; b=hkDmIRF1XIURvp
	6Oz/3pJGZEzbI4zq7MG2N9/xooW5KAkP3uNohX9dTFdgcLgMsG3q2USSWx6dlaJ/5fGhy74telSqv
	5VUyyG4hPk4athlDVZXI0BNbKTsCF64c3UPUFhgd1o/bKHoZMiPNgfBMyUJD0hK37LI++YkhNbQHN
	idSPu1FYxcbdQ9TeNEnOMakWSiXYCqjH9Gs5zxLRvTRO18KW/+5iwBpC/jM3yp1cPZ9543RExm1M6
	GqZpFYCLofohClWomxPb/33o6moVt1sbT5jyffn+yNVsSVMHnUA2m1jIPSOWktH62/Pj+ui3nepSq
	n23lR4GkZ/IGw6LUrOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYH6-009b0k-2O;
	Thu, 02 Nov 2023 14:02:20 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYH2-009azM-2Z
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 14:02:19 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-66d13ac2796so5509756d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 07:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698933735; x=1699538535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U02Q7Uz9N3AbuVAnly2/lx/zX8zq9jlSHWgyTKq7w1o=;
        b=HVSJYBYfIh+7SSTc+rSrD4XMddd3lqsRCel/C/q5L7L8Msip36bsae6MgNpJvtrnvp
         l65qqlf85rVVRj2co7RtMzlQcfb+/o/iahvZu+FxzdtHvI5GaNPnpsC0n1mugk1/TC+o
         3oPwpztDap/W6QhB8Y/qATZWZWvJi5xUk/+hxARQzucgovch7sKctK7UqUlTEPFuFtwu
         gVOvxFO6iiqIGwaMyQ6Aj+LHOktjQig/qyfmgaZi+TDei20nhQqUHD929V2iKa+NKi19
         u054fDrEfhFz3Er7z/7bni2aqoOvzMPLwT6Vr+JxKsdscJ10cu7gq/P64t3hp7FqOlVG
         l0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698933735; x=1699538535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U02Q7Uz9N3AbuVAnly2/lx/zX8zq9jlSHWgyTKq7w1o=;
        b=RAYQxM/ArMy1bXdeEmthlfLKux2zSTveAWK4VB3yzS369LzsUifBXbkrL41aBRO5/k
         oMWZvhPP7aGtMjaBgNokUuluy7FPPMQ/JwYtJcgPBAoUrADkSU2VAGUoi4Io8OGtw418
         UZWzGxuU4t5Vw+X/iRUlxHA6H7nAqQtONS0X+FROZHn7P0HpHCbwB9xoDHB825gN82gP
         4P38CJ2wxli5ZoWoRBCdVVhDFGIZy/W+ibAOe339dmXs3k26SrSWE0OIxIHVxH0cHjN2
         D5G65Tix8V+Z1MdKyGwzHwX7aSs8e5G7iXMFwzQckWICevpwEBR7HpJBtjkdLW0Rn7dj
         67BA==
X-Gm-Message-State: AOJu0YxSs7ZpzN30BC4nzlZPw0GyVfAwptVpsDGjjMWGJBLmdhTh8hxq
	UI2Cmf+XRfE6++yfQDYexxAdzfVlhbg/qLPH5z677Q==
X-Google-Smtp-Source: AGHT+IFvNZeWhAvz2uQajFEXI2VcBpwz2QgnpWebvg+MWTN/rWHt/IyUj1LF075258r9rR5adzICFKMJ4AWj6dfus40=
X-Received: by 2002:ad4:5c47:0:b0:66d:62b7:53f4 with SMTP id
 a7-20020ad45c47000000b0066d62b753f4mr28124932qva.45.1698933735448; Thu, 02
 Nov 2023 07:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-13-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-13-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 14:01:39 +0000
Message-ID: <CA+EHjTyAU9XZ3OgqXjmAKh-BKsLrH_8QtnJihQxF4fhk8WPSYg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231102_070216_858129_702E21CF 
X-CRM114-Status: GOOD (  20.70  )
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

SGksCgpPbiBGcmksIE9jdCAyNywgMjAyMyBhdCA3OjIy4oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNv
biA8c2VhbmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gQWRkIGZsYWdzIHRvICJzdHJ1Y3Qga3Zt
X2dmbl9yYW5nZSIgdG8gbGV0IG5vdGlmaWVyIGV2ZW50cyB0YXJnZXQgb25seQo+IHNoYXJlZCBh
bmQgb25seSBwcml2YXRlIG1hcHBpbmdzLCBhbmQgd3JpdGUgdXAgdGhlIGV4aXN0aW5nIG1tdV9u
b3RpZmllcgo+IGV2ZW50cyB0byBiZSBzaGFyZWQtb25seSAocHJpdmF0ZSBtZW1vcnkgaXMgbmV2
ZXIgYXNzb2NpYXRlZCB3aXRoIGEKPiB1c2Vyc3BhY2UgdmlydHVhbCBhZGRyZXNzLCBpLmUuIGNh
bid0IGJlIHJlYWNoZWQgdmlhIG1tdV9ub3RpZmllcnMpLgo+Cj4gQWRkIHR3byBmbGFncyBzbyB0
aGF0IEtWTSBjYW4gaGFuZGxlIHRoZSB0aHJlZSBwb3NzaWJpbGl0aWVzIChzaGFyZWQsCj4gcHJp
dmF0ZSwgYW5kIHNoYXJlZCtwcml2YXRlKSB3aXRob3V0IG5lZWRpbmcgc29tZXRoaW5nIGxpa2Ug
YSB0cmktc3RhdGUKPiBlbnVtLgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
L1pKWDBoaytLcFFQMEtVeUJAZ29vZ2xlLmNvbQo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0
b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2t2bV9o
b3N0LmggfCAyICsrCj4gIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICB8IDcgKysrKysrKwo+ICAy
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+IGluZGV4IDk2YWE5
MzA1MzZiMS4uODljMWE5OTFhM2I4IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hv
c3QuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAo+IEBAIC0yNjMsNiArMjYzLDgg
QEAgc3RydWN0IGt2bV9nZm5fcmFuZ2Ugewo+ICAgICAgICAgZ2ZuX3Qgc3RhcnQ7Cj4gICAgICAg
ICBnZm5fdCBlbmQ7Cj4gICAgICAgICB1bmlvbiBrdm1fbW11X25vdGlmaWVyX2FyZyBhcmc7Cj4g
KyAgICAgICBib29sIG9ubHlfcHJpdmF0ZTsKPiArICAgICAgIGJvb2wgb25seV9zaGFyZWQ7CgpJ
ZiB0aGVzZSBmbGFncyBhcmVuJ3QgdXNlZCBpbiB0aGlzIHBhdGNoIHNlcmllcywgc2hvdWxkIHRo
aXMgcGF0Y2ggYmUKbW92ZWQgdG8gdGhlIG90aGVyIHNlcmllcz8KCkFsc28sIGlmIHNoYXJlZCtw
cml2YXRlIGlzIGEgcG9zc2liaWxpdHksIGRvZXNuJ3QgdGhlIHByZWZpeCAib25seV8iCmNvbmZ1
c2UgdGhpbmdzIGEgYml0PyBJLmUuLCB3aGF0IGlzIHNoYXJlZCtwcml2YXRlLCBpcyBpdCB3aGVu
IGJvdGgKYXJlIDAgb3Igd2hlbiBib3RoIGFyZSAxPyBJIGFzc3VtZSBpdCdzIHRoZSBmb3JtZXIg
KGJvdGggYXJlIDApLCBidXQKaXQgbWlnaHQgYmUgY2xlYXJlci4KCkNoZWVycywKL2Z1YWQKCj4g
ICAgICAgICBib29sIG1heV9ibG9jazsKPiAgfTsKPiAgYm9vbCBrdm1fdW5tYXBfZ2ZuX3Jhbmdl
KHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9nZm5fcmFuZ2UgKnJhbmdlKTsKPiBkaWZmIC0t
Z2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiBpbmRleCBj
YjkzNzY4MzNjMTguLjMwMmNjYjg3YjRjMSAxMDA2NDQKPiAtLS0gYS92aXJ0L2t2bS9rdm1fbWFp
bi5jCj4gKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwo+IEBAIC02MzUsNiArNjM1LDEzIEBAIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUga3ZtX21uX3JldF90IF9fa3ZtX2hhbmRsZV9odmFfcmFuZ2Uo
c3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAqIHRoZSBzZWNvbmQg
b3IgbGF0ZXIgaW52b2NhdGlvbiBvZiB0aGUgaGFuZGxlcikuCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICovCj4gICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3JhbmdlLmFyZyA9IHJhbmdl
LT5hcmc7Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICogSFZBLWJhc2VkIG5vdGlmaWNhdGlvbnMgYXJlbid0IHJlbGV2YW50IHRvIHBy
aXZhdGUKPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBtYXBwaW5ncyBhcyB0aGV5IGRvbid0
IGhhdmUgYSB1c2Vyc3BhY2UgbWFwcGluZy4KPiArICAgICAgICAgICAgICAgICAgICAgICAgKi8K
PiArICAgICAgICAgICAgICAgICAgICAgICBnZm5fcmFuZ2Uub25seV9wcml2YXRlID0gZmFsc2U7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3JhbmdlLm9ubHlfc2hhcmVkID0gdHJ1ZTsK
PiAgICAgICAgICAgICAgICAgICAgICAgICBnZm5fcmFuZ2UubWF5X2Jsb2NrID0gcmFuZ2UtPm1h
eV9ibG9jazsKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qCj4gLS0KPiAyLjQyLjAuODIw
Lmc4M2E3MjFhMTM3LWdvb2cKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
