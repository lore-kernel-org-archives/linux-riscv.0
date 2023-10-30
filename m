Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819ABC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 18:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEfwcdBC9APBNswAYdPkladA+DtxDJq+uy5uJY9o4X8=; b=h37sIaG4kQC4i+
	lPrpCn0IOybewCXK0e0GMff3xV+HB0DXmMl1LDT1O1Sg9+jBtxT0hvh8xVwp2prRCIvQJxJktQgDH
	MYfFGi/TdJl+QxTWPPz2nmgDnyE/cSmGjnmmuzChzC+647Bg/fXzVRvkSTQTjORf0p/wTdBJOIb9K
	ekSTr3vvFKtKP1dt2GH8fLFyJFXxKAJz+xCHkPdpSjyLfgLb2OP/F/ZlcfUtEm6x9d74kKuNWigEH
	7Ac2lKdqUcnpOv1ULZcEolUYcd5BKeWbSKP4GH5pbH/ORxSNzZ5ZHcfKtZ+OaQcz4LgpvjWLhEPon
	gDoi5TZWdfRWIEPZ72nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxWtY-003qRQ-2x;
	Mon, 30 Oct 2023 18:21:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxWtV-003qOM-2d
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 18:21:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40806e40fccso31935015e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 11:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698690100; x=1699294900; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/9ggluaJ++InohprDPxvdU7Uw478trPLaD3bhLrtl4=;
        b=k0l1rQl5z+Fnt3S/x7jp6aMglchGuYyeBUJ2rfXIXlu4/+bZaO3puPfvmHeF2G0vTB
         f4Pjs32kcsYYXyCRbtNvzFdNv/YY0Mdpn+6gWxrjZ1ww5yHBTkxmtXfaFlmeW1yYU51p
         ncrJgwlsCviftwiLc94b1QO9gAHqviX6Ea2vnBm5d2u3VNcfhPiwK4zxZthGi7PPJrVF
         EWUZRD5tv58Cegjr0lMeQ5vwPcCZN5wXWoAyCebaQgYsaEZZYN4xIFsRSjBhqt0D36lx
         kQSzLuXoxhLB4GI3lUJMMtRoNcwPmR/7We4xXSdBy/f/h2RinSVyLTVEgpQCIh3sJAjb
         S/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698690100; x=1699294900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/9ggluaJ++InohprDPxvdU7Uw478trPLaD3bhLrtl4=;
        b=lsk5bsx3lanBS4L4q9LPDaDdqqsw/kDt3Ydkbj3jsaYknxOSx4y5iww+GCXKI3nfVo
         1m+k/NYLg4aQNVRMl1ITC0q4Y0c6VBfPwcqg4umXW4Yx5P64eYS6jcAyk48ExbWW2Hox
         JZIifm/sZy6NstI16mFfKoxLp76/KYVsD8hdMGJDsa1LmJabxQoY5Nxzk2i/z8/tM0SC
         9ZfBsnrf46UGd84ZMA+MstmNxbctqbFpJ8aRiq9+cSvqB9MBvHsZkQt1w6RnfZtKb+6p
         uMYbGMOSJg0Fm3gkeYf4g450bu7HRf84DG1uP/m0z4LsNuzER4MZl91BsCp8pTJRIm93
         8g7g==
X-Gm-Message-State: AOJu0YyNOPWhDj0+yZebgcSWeOxL9lGjj4UNaEzC7U0pTSBVLucoqDju
	+K8qNlsiM2LLOo+kxWwkroimvQKjPs5MJ6ELKxpL6g==
X-Google-Smtp-Source: AGHT+IEmwHEAyRl4O1ADBUXlJ8Ir1QajxdHcmQhP1+JwZ6AL7EQf1l2WpAn/vfiQDkHuuhxFizw+5mWU1UT2yp1CF+k=
X-Received: by 2002:a05:600c:524a:b0:408:4160:1528 with SMTP id
 fc10-20020a05600c524a00b0040841601528mr8760818wmb.30.1698690100370; Mon, 30
 Oct 2023 11:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-4-seanjc@google.com>
 <ZT_fnAcDAvuPCwws@google.com> <CABgObfYM4nyb1K3xJVGvV+eQmZoLPAmz2-=1CG8++pCwvVW7Qg@mail.gmail.com>
In-Reply-To: <CABgObfYM4nyb1K3xJVGvV+eQmZoLPAmz2-=1CG8++pCwvVW7Qg@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 30 Oct 2023 11:21:12 -0700
Message-ID: <CALzav=djOS8T7AmUa3A7QmP1f0xAm2W-KRDmOov_H8ps77A2qA@mail.gmail.com>
Subject: Re: [PATCH v13 03/35] KVM: Use gfn instead of hva for mmu_notifier_retry
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
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
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_112145_852533_859BB1AA 
X-CRM114-Status: GOOD (  17.72  )
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

T24gTW9uLCBPY3QgMzAsIDIwMjMgYXQgMTA6MDHigK9BTSBQYW9sbyBCb256aW5pIDxwYm9uemlu
aUByZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgT2N0IDMwLCAyMDIzIGF0IDU6NTPigK9Q
TSBEYXZpZCBNYXRsYWNrIDxkbWF0bGFja0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiAy
MDIzLTEwLTI3IDExOjIxIEFNLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+ID4gPiBGcm9t
OiBDaGFvIFBlbmcgPGNoYW8ucC5wZW5nQGxpbnV4LmludGVsLmNvbT4KPiA+ID4KPiA+ID4gQ3Vy
cmVudGx5IGluIG1tdV9ub3RpZmllciBpbnZhbGlkYXRlIHBhdGgsIGh2YSByYW5nZSBpcyByZWNv
cmRlZCBhbmQKPiA+ID4gdGhlbiBjaGVja2VkIGFnYWluc3QgYnkgbW11X25vdGlmaWVyX3JldHJ5
X2h2YSgpIGluIHRoZSBwYWdlIGZhdWx0Cj4gPiA+IGhhbmRsaW5nIHBhdGguIEhvd2V2ZXIsIGZv
ciB0aGUgdG8gYmUgaW50cm9kdWNlZCBwcml2YXRlIG1lbW9yeSwgYSBwYWdlCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXgo+ID4KPiA+IElzIHRo
ZXJlIGEgbWlzc2luZyB3b3JkIGhlcmU/Cj4KPiBObyBidXQgdGhlcmUgY291bGQgYmUgbWlzc2lu
ZyBoeXBoZW5zICgiZm9yIHRoZSB0by1iZS1pbnRyb2R1Y2VkCj4gcHJpdmF0ZSBtZW1vcnkiKTsg
cG9zc2libHkgYSAic29vbiIgY291bGQgaGVscCBwYXJzaW5nIGFuZCB0aGF0IGlzCj4gd2hhdCB5
b3Ugd2VyZSB0YWxraW5nIGFib3V0PwoKQWggdGhhdCBleHBsYWlucyBpdCA6KQoKPgo+ID4gPiAg
ICAgICBpZiAobGlrZWx5KGt2bS0+bW11X2ludmFsaWRhdGVfaW5fcHJvZ3Jlc3MgPT0gMSkpIHsK
PiA+ID4gKyAgICAgICAgICAgICBrdm0tPm1tdV9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0ID0gSU5W
QUxJRF9HUEE7Cj4gPiA+ICsgICAgICAgICAgICAga3ZtLT5tbXVfaW52YWxpZGF0ZV9yYW5nZV9l
bmQgPSBJTlZBTElEX0dQQTsKPiA+Cj4gPiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgaW5jb3JyZWN0
LCBidXQgSSB3YXMgYSBsaXR0bGUgc3VwcmlzZWQgdG8gc2VlIHRoaXMKPiA+IGhlcmUgcmF0aGVy
IHRoYW4gaW4gZW5kKCkgd2hlbiBtbXVfaW52YWxpZGF0ZV9pbl9wcm9ncmVzcyBkZWNyZW1lbnRz
IHRvCj4gPiAwLgo+Cj4gSSB0aGluayB0aGF0IHdvdWxkIGJlIGluY29ycmVjdCBvbiB0aGUgdmVy
eSBmaXJzdCBzdGFydD8KCkdvb2QgcG9pbnQuIEtWTSBjb3VsZCBpbml0aWFsaXplIHN0YXJ0L2Vu
ZCBiZWZvcmUgcmVnaXN0ZXJpbmcKbm90aWZpZXJzLCBidXQgdGhhdCdzIGV4dHJhIGNvZGUuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
