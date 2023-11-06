Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A841C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPxV/YDnYGPXQHP6Q61VzWCf6F9yJCKPfPeoj9qUR+4=; b=C5o0aRUU8RnA8U
	P9dK5oiPOdzFqO8yB9oHTajapA97R9dMW1L+FOhb+nC3wmONZinxLps/mMnyeFwD+v0fAJLtXcMY8
	3LbljTByrccmXHbNEbyQX2c3IYRvr9+bbNqRsWkHmic8XYiyV2nZTwux4uNlqqBIWBO53+/BgOITs
	KpdaB7wY6kxYzUOu7QOMxUoIhNoEJbK0SuLZvxAJ2PCDCLs08wyu6oxkHxPE9SsvorbIMfYfD1PUs
	Ne4S4LSzPkp65mjHmT1fVzd5Er6/aqkKbezG+0f1iCdJAH51neYeZ1f57l7jxhsXnyIKP+lRz6LB8
	rkq2pxQFX4fwV9qnIU4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzxOa-00GJjB-1p;
	Mon, 06 Nov 2023 11:03:52 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzxOX-00GJg8-1R
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 11:03:51 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-66d17bdabe1so31130426d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 03:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699268628; x=1699873428; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ8TONDIpPhmTy6Gjm0dgeV6egeVVxfnh06xkrQleLY=;
        b=OH3pajKBv7Kc/dJtAQJSuwCR8d1xbDzUfjqF02+E3g45I9h2KlukiXSBa7tX90eZuX
         kq4mZTPFgqNpFQGjHQZg0+ptnYviFG4DpvjNPSoJKS7ZCxNrZLohWu6QGHzGYTfDlKTg
         PTBlkb5Pbw6deMESnCGpWleja2NcXLPfbsOlX9e1/GPf25qoe0OCfqaLOt68fWlrvmvC
         IzEfITsPuiA4y8aZF2x69MdnVjezKdUyM/XAnWMexQPh+X73bQccXbGHYzjnjO2Ftsuj
         Zf0Upa4g37D3ZGhI6/wIKk/XUy28tWuCb/9QZdFlCs8rLjIucs/u10WU/KEKZy+y4itI
         oxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268628; x=1699873428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQ8TONDIpPhmTy6Gjm0dgeV6egeVVxfnh06xkrQleLY=;
        b=hBH4csBYYHfQLoN15tdjgh6qMygeXPRh6vsi9893ELRkHUES+hmYw6hRVblI2szjmA
         Ryb6noXQFSBD1n4t7+LIZw3l7sZW9U0/xWrNjZ7tlrMeogVYP9WEVg8Z6AZjryv2uDaa
         0RdyJjiRtTkKm8R6DbQ4QcraHfcYGjKrgEG4fJAA6kyhBUck/E22fjbNFJBPJ5cs0x0j
         UeSr/MgYgO+urei0fSSHfWQZhRsymE9rsT6ApyPummeL3H5J88yZuzki4t1YAIcKNk8Z
         oT8eSLWnz/eGtkJ2gXcHny9G7nuW3vHJfdks8WYMawYoFbu8MfFjxRb5zTLFtK+ULv3A
         bP2w==
X-Gm-Message-State: AOJu0YzVUhCUUD24iV8MlwIioza7dpoNr9qyChv+64MtWDDcUh+UDE14
	TgwWFBlTIYz3AnhPJxNuyDvJcBt7uQvaLsS4QcNrMw==
X-Google-Smtp-Source: AGHT+IHHh4fCnCxDMnJOn7/R0pkHJKwXr6C+d2r8s0u73YKLv4MHtUig5I9yHuaqDmXCQ/Y0QVlMeO42z9uduKCvqDI=
X-Received: by 2002:a0c:f1ca:0:b0:66d:28a5:d153 with SMTP id
 u10-20020a0cf1ca000000b0066d28a5d153mr26974988qvl.47.1699268628158; Mon, 06
 Nov 2023 03:03:48 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-24-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-24-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 11:03:12 +0000
Message-ID: <CA+EHjTw1RGEKD6Zv_QEtzTLLA4STTQrS4WYCY-HUdScAKXfBGg@mail.gmail.com>
Subject: Re: [PATCH 23/34] KVM: selftests: Convert lib's mem regions to KVM_SET_USER_MEMORY_REGION2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
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
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_030349_491499_A391DF4C 
X-CRM114-Status: GOOD (  16.32  )
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

T24gU3VuLCBOb3YgNSwgMjAyMyBhdCA0OjMz4oCvUE0gUGFvbG8gQm9uemluaSA8cGJvbnppbmlA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNA
Z29vZ2xlLmNvbT4KPgo+IFVzZSBLVk1fU0VUX1VTRVJfTUVNT1JZX1JFR0lPTjIgdGhyb3VnaG91
dCBLVk0ncyBzZWxmdGVzdHMgbGlicmFyeSBzbyB0aGF0Cj4gc3VwcG9ydCBmb3IgZ3Vlc3QgcHJp
dmF0ZSBtZW1vcnkgY2FuIGJlIGFkZGVkIHdpdGhvdXQgbmVlZGluZyBhbiBlbnRpcmVseQo+IHNl
cGFyYXRlIHNldCBvZiBoZWxwZXJzLgo+Cj4gTm90ZSwgdGhpcyBvYnZpb3VzbHkgbWFrZXMgc2Vs
ZnRlc3RzIGJhY2t3YXJkcy1pbmNvbXBhdGlibGUgd2l0aCBvbGRlciBLVk0KPiB2ZXJzaW9ucyBm
cm9tIHRoaXMgcG9pbnQgZm9yd2FyZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3Bo
ZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+IE1lc3NhZ2UtSWQ6IDwyMDIzMTAyNzE4MjIxNy4z
NjE1MjExLTI2LXNlYW5qY0Bnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBhb2xvIEJvbnpp
bmkgPHBib256aW5pQHJlZGhhdC5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogRnVhZCBUYWJiYSA8
dGFiYmFAZ29vZ2xlLmNvbT4KVGVzdGVkLWJ5OiBGdWFkIFRhYmJhIDx0YWJiYUBnb29nbGUuY29t
PgoKQ2hlZXJzLAovZnVhZAoKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbF9i
YXNlLmggICAgIHwgIDIgKy0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9rdm1f
dXRpbC5jICAgIHwgMTkgKysrKysrKysrKy0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaCBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaAo+IGluZGV4IDk2N2VhYWVh
Y2Q3NS4uOWYxNDQ4NDFjMmVlIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaAo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsX2Jhc2UuaAo+IEBAIC00NCw3ICs0NCw3IEBAIHR5cGVk
ZWYgdWludDY0X3Qgdm1fcGFkZHJfdDsgLyogVmlydHVhbCBNYWNoaW5lIChHdWVzdCkgcGh5c2lj
YWwgYWRkcmVzcyAqLwo+ICB0eXBlZGVmIHVpbnQ2NF90IHZtX3ZhZGRyX3Q7IC8qIFZpcnR1YWwg
TWFjaGluZSAoR3Vlc3QpIHZpcnR1YWwgYWRkcmVzcyAqLwo+Cj4gIHN0cnVjdCB1c2Vyc3BhY2Vf
bWVtX3JlZ2lvbiB7Cj4gLSAgICAgICBzdHJ1Y3Qga3ZtX3VzZXJzcGFjZV9tZW1vcnlfcmVnaW9u
IHJlZ2lvbjsKPiArICAgICAgIHN0cnVjdCBrdm1fdXNlcnNwYWNlX21lbW9yeV9yZWdpb24yIHJl
Z2lvbjsKPiAgICAgICAgIHN0cnVjdCBzcGFyc2ViaXQgKnVudXNlZF9waHlfcGFnZXM7Cj4gICAg
ICAgICBpbnQgZmQ7Cj4gICAgICAgICBvZmZfdCBvZmZzZXQ7Cj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIva3ZtX3V0aWwuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9saWIva3ZtX3V0aWwuYwo+IGluZGV4IGYwOTI5NWQ1NmMyMy4uMzY3NmIzN2Jl
YTM4IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIva3ZtX3V0
aWwuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIva3ZtX3V0aWwuYwo+
IEBAIC00NTMsOCArNDUzLDkgQEAgdm9pZCBrdm1fdm1fcmVzdGFydChzdHJ1Y3Qga3ZtX3ZtICp2
bXApCj4gICAgICAgICAgICAgICAgIHZtX2NyZWF0ZV9pcnFjaGlwKHZtcCk7Cj4KPiAgICAgICAg
IGhhc2hfZm9yX2VhY2godm1wLT5yZWdpb25zLnNsb3RfaGFzaCwgY3RyLCByZWdpb24sIHNsb3Rf
bm9kZSkgewo+IC0gICAgICAgICAgICAgICBpbnQgcmV0ID0gaW9jdGwodm1wLT5mZCwgS1ZNX1NF
VF9VU0VSX01FTU9SWV9SRUdJT04sICZyZWdpb24tPnJlZ2lvbik7Cj4gLSAgICAgICAgICAgICAg
IFRFU1RfQVNTRVJUKHJldCA9PSAwLCAiS1ZNX1NFVF9VU0VSX01FTU9SWV9SRUdJT04gSU9DVEwg
ZmFpbGVkLFxuIgo+ICsgICAgICAgICAgICAgICBpbnQgcmV0ID0gaW9jdGwodm1wLT5mZCwgS1ZN
X1NFVF9VU0VSX01FTU9SWV9SRUdJT04yLCAmcmVnaW9uLT5yZWdpb24pOwo+ICsKPiArICAgICAg
ICAgICAgICAgVEVTVF9BU1NFUlQocmV0ID09IDAsICJLVk1fU0VUX1VTRVJfTUVNT1JZX1JFR0lP
TjIgSU9DVEwgZmFpbGVkLFxuIgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiICByYzog
JWkgZXJybm86ICVpXG4iCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICIgIHNsb3Q6ICV1
IGZsYWdzOiAweCV4XG4iCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICIgIGd1ZXN0X3Bo
eXNfYWRkcjogMHglbGx4IHNpemU6IDB4JWxseCIsCj4gQEAgLTY1Nyw3ICs2NTgsNyBAQCBzdGF0
aWMgdm9pZCBfX3ZtX21lbV9yZWdpb25fZGVsZXRlKHN0cnVjdCBrdm1fdm0gKnZtLAo+ICAgICAg
ICAgfQo+Cj4gICAgICAgICByZWdpb24tPnJlZ2lvbi5tZW1vcnlfc2l6ZSA9IDA7Cj4gLSAgICAg
ICB2bV9pb2N0bCh2bSwgS1ZNX1NFVF9VU0VSX01FTU9SWV9SRUdJT04sICZyZWdpb24tPnJlZ2lv
bik7Cj4gKyAgICAgICB2bV9pb2N0bCh2bSwgS1ZNX1NFVF9VU0VSX01FTU9SWV9SRUdJT04yLCAm
cmVnaW9uLT5yZWdpb24pOwo+Cj4gICAgICAgICBzcGFyc2ViaXRfZnJlZSgmcmVnaW9uLT51bnVz
ZWRfcGh5X3BhZ2VzKTsKPiAgICAgICAgIHJldCA9IG11bm1hcChyZWdpb24tPm1tYXBfc3RhcnQs
IHJlZ2lvbi0+bW1hcF9zaXplKTsKPiBAQCAtMTAxNCw4ICsxMDE1LDggQEAgdm9pZCB2bV91c2Vy
c3BhY2VfbWVtX3JlZ2lvbl9hZGQoc3RydWN0IGt2bV92bSAqdm0sCj4gICAgICAgICByZWdpb24t
PnJlZ2lvbi5ndWVzdF9waHlzX2FkZHIgPSBndWVzdF9wYWRkcjsKPiAgICAgICAgIHJlZ2lvbi0+
cmVnaW9uLm1lbW9yeV9zaXplID0gbnBhZ2VzICogdm0tPnBhZ2Vfc2l6ZTsKPiAgICAgICAgIHJl
Z2lvbi0+cmVnaW9uLnVzZXJzcGFjZV9hZGRyID0gKHVpbnRwdHJfdCkgcmVnaW9uLT5ob3N0X21l
bTsKPiAtICAgICAgIHJldCA9IF9fdm1faW9jdGwodm0sIEtWTV9TRVRfVVNFUl9NRU1PUllfUkVH
SU9OLCAmcmVnaW9uLT5yZWdpb24pOwo+IC0gICAgICAgVEVTVF9BU1NFUlQocmV0ID09IDAsICJL
Vk1fU0VUX1VTRVJfTUVNT1JZX1JFR0lPTiBJT0NUTCBmYWlsZWQsXG4iCj4gKyAgICAgICByZXQg
PSBfX3ZtX2lvY3RsKHZtLCBLVk1fU0VUX1VTRVJfTUVNT1JZX1JFR0lPTjIsICZyZWdpb24tPnJl
Z2lvbik7Cj4gKyAgICAgICBURVNUX0FTU0VSVChyZXQgPT0gMCwgIktWTV9TRVRfVVNFUl9NRU1P
UllfUkVHSU9OMiBJT0NUTCBmYWlsZWQsXG4iCj4gICAgICAgICAgICAgICAgICIgIHJjOiAlaSBl
cnJubzogJWlcbiIKPiAgICAgICAgICAgICAgICAgIiAgc2xvdDogJXUgZmxhZ3M6IDB4JXhcbiIK
PiAgICAgICAgICAgICAgICAgIiAgZ3Vlc3RfcGh5c19hZGRyOiAweCVseCBzaXplOiAweCVseCIs
Cj4gQEAgLTEwOTcsOSArMTA5OCw5IEBAIHZvaWQgdm1fbWVtX3JlZ2lvbl9zZXRfZmxhZ3Moc3Ry
dWN0IGt2bV92bSAqdm0sIHVpbnQzMl90IHNsb3QsIHVpbnQzMl90IGZsYWdzKQo+Cj4gICAgICAg
ICByZWdpb24tPnJlZ2lvbi5mbGFncyA9IGZsYWdzOwo+Cj4gLSAgICAgICByZXQgPSBfX3ZtX2lv
Y3RsKHZtLCBLVk1fU0VUX1VTRVJfTUVNT1JZX1JFR0lPTiwgJnJlZ2lvbi0+cmVnaW9uKTsKPiAr
ICAgICAgIHJldCA9IF9fdm1faW9jdGwodm0sIEtWTV9TRVRfVVNFUl9NRU1PUllfUkVHSU9OMiwg
JnJlZ2lvbi0+cmVnaW9uKTsKPgo+IC0gICAgICAgVEVTVF9BU1NFUlQocmV0ID09IDAsICJLVk1f
U0VUX1VTRVJfTUVNT1JZX1JFR0lPTiBJT0NUTCBmYWlsZWQsXG4iCj4gKyAgICAgICBURVNUX0FT
U0VSVChyZXQgPT0gMCwgIktWTV9TRVRfVVNFUl9NRU1PUllfUkVHSU9OMiBJT0NUTCBmYWlsZWQs
XG4iCj4gICAgICAgICAgICAgICAgICIgIHJjOiAlaSBlcnJubzogJWkgc2xvdDogJXUgZmxhZ3M6
IDB4JXgiLAo+ICAgICAgICAgICAgICAgICByZXQsIGVycm5vLCBzbG90LCBmbGFncyk7Cj4gIH0K
PiBAQCAtMTEyNyw5ICsxMTI4LDkgQEAgdm9pZCB2bV9tZW1fcmVnaW9uX21vdmUoc3RydWN0IGt2
bV92bSAqdm0sIHVpbnQzMl90IHNsb3QsIHVpbnQ2NF90IG5ld19ncGEpCj4KPiAgICAgICAgIHJl
Z2lvbi0+cmVnaW9uLmd1ZXN0X3BoeXNfYWRkciA9IG5ld19ncGE7Cj4KPiAtICAgICAgIHJldCA9
IF9fdm1faW9jdGwodm0sIEtWTV9TRVRfVVNFUl9NRU1PUllfUkVHSU9OLCAmcmVnaW9uLT5yZWdp
b24pOwo+ICsgICAgICAgcmV0ID0gX192bV9pb2N0bCh2bSwgS1ZNX1NFVF9VU0VSX01FTU9SWV9S
RUdJT04yLCAmcmVnaW9uLT5yZWdpb24pOwo+Cj4gLSAgICAgICBURVNUX0FTU0VSVCghcmV0LCAi
S1ZNX1NFVF9VU0VSX01FTU9SWV9SRUdJT04gZmFpbGVkXG4iCj4gKyAgICAgICBURVNUX0FTU0VS
VCghcmV0LCAiS1ZNX1NFVF9VU0VSX01FTU9SWV9SRUdJT04yIGZhaWxlZFxuIgo+ICAgICAgICAg
ICAgICAgICAgICAgInJldDogJWkgZXJybm86ICVpIHNsb3Q6ICV1IG5ld19ncGE6IDB4JWx4IiwK
PiAgICAgICAgICAgICAgICAgICAgIHJldCwgZXJybm8sIHNsb3QsIG5ld19ncGEpOwo+ICB9Cj4g
LS0KPiAyLjM5LjEKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
