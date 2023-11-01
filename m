Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE56C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WR71oVwN0sul41BaiRCY0ycP9iOkdSDjmae1QKmk+88=; b=n2VJL7Ec02R9at
	b+lnq+KTw6/w2AWIT4LLHzsniWRV6ziYxTqa2D5GuRyXiq0CCufA63niQYe3WkWPlDYfX1r9MUavT
	IOkwkQmH1KsLSxKBxSwnZNAQ2xNOhFmhptMQqvtUgEweBvxGPZCOoYdYBrcRT4SsC+nBRHtFquGeq
	xQD+EB9X7i6tE189W7iSVfGlndGUXCbatPfQ36rXP80nultPY0ejwpI2d1LSrxMBXU2i9gMpx7KVN
	4SA0CKAHCch62qYDPw7YiIvTTZvD3GRaJRhnx/htcUzXailH63VWBX34j/rHu8N+yy6zFt+uJMiHg
	oXgP1W+ARuzp/1S4TiSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyBlo-007cGT-11;
	Wed, 01 Nov 2023 14:00:32 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyAcp-007WLn-2i
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 12:47:13 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7788db95652so470718785a.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 05:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698842822; x=1699447622; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1rvjvqySA8gfoAJ2h4xCVn6r+FVikEwY0ryqbt6qgE=;
        b=OV2JDZzr8O4gYJVd6m9GslCUL7ZoKSlPkB286gRfYDsfRiuLLfEx+NEKqtyOC0pyYM
         UXk9X0ZD7yVElX/A4/gaXKLdo2IrNGJ3aipkfhTzAcai6637tW3Q7aDYsZbr7pX4H7rH
         ePFyz7Rq6swOsfPTyYKrKVyNFbW9cIApcN4XhNTuDZu3THPOdcrcyibxy/igyX4yK1oP
         NQxoGpAriJwr1kWAoHDLbu/usEQNmY+sFYd2ssWRKX8I7QwjZGZt6k6hQMnAyC3449MW
         xTZR5Fg8f/vwJSu1Gm9EH6i4VynYvBfAZqUEoJGhxRg/803pjpj2uqVrkll/oRk9LmnQ
         rIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698842822; x=1699447622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1rvjvqySA8gfoAJ2h4xCVn6r+FVikEwY0ryqbt6qgE=;
        b=Jl+JVac6rCxvJuL7meYPoVAK35UMtSUH3PlgFmT5rJ2lzc4+JPc/FRh0Gp09KKLvaP
         5FYZH/BSMfRXkdlcJtsxkPhrIr/dt5M62CyI6SUHcunlFUhw+8BHExIeZpTqmJES/8uV
         fNr9MZ6YLODtfIm3ZKAoqhbfvpeHgeCH4dDEaOHa8RkT+Rt1zULh7ZxDsBE2vGg8VDBl
         teOZvy2YA7ye9vHw0DCAQyDy2ehWeT7FxU2u4/MWQsgOgOWQaKq0Py+jj585CHWLVLNk
         4leFa7feCOSCTpu1S1cXxky2NkIMOVJFpRsxUv2X3ZRwhmaCNUv7OVfazhxpoVaOjhFP
         fJKg==
X-Gm-Message-State: AOJu0YybNrz/7E1Ndaz2lxRRf9qREpZ6HtVjUAYFAGeSIsc480++mzL7
	zfdiQ+temuwXHtreWm0Wq2q5vps/sfx1tDVzzuFznA==
X-Google-Smtp-Source: AGHT+IEwNefwVjOpplfsdA5Dp0BgUdMFZ8Gr0x2pIdj0EOquTk7Lrcu3yjtemmSczlmcSeWnvG38gd5iU/oYIFP7LzQ=
X-Received: by 2002:ad4:5de9:0:b0:65d:31e:b810 with SMTP id
 jn9-20020ad45de9000000b0065d031eb810mr19758846qvb.34.1698842821613; Wed, 01
 Nov 2023 05:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-3-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-3-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 1 Nov 2023 12:46:25 +0000
Message-ID: <CA+EHjTycVAL11xCKQAfm-q4NGbgSH7yMswu+c1XaJdyhUh61zw@mail.gmail.com>
Subject: Re: [PATCH v13 02/35] KVM: Assert that mmu_invalidate_in_progress
 *never* goes negative
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
X-CRM114-CacheID: sfid-20231101_054711_881930_F575B0B1 
X-CRM114-Status: GOOD (  19.45  )
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

T24gRnJpLCBPY3QgMjcsIDIwMjMgYXQgNzoyMuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE1vdmUgdGhlIGFzc2VydGlvbiBvbiB0aGUgaW4t
cHJvZ3Jlc3MgaW52YWxpZGF0aW9uIGNvdW50IGZyb20gdGhlIHByaW1hcnkKPiBNTVUncyBub3Rp
ZmllciBwYXRoIHRvIEtWTSdzIGNvbW1vbiBub3RpZmljYXRpb24gcGF0aCwgaS5lLiBhc3NlcnQg
dGhhdAo+IHRoZSBjb3VudCBkb2Vzbid0IGdvIG5lZ2F0aXZlIGV2ZW4gd2hlbiB0aGUgaW52YWxp
ZGF0aW9uIGlzIGNvbWluZyBmcm9tCj4gS1ZNIGl0c2VsZi4KPgo+IE9wcG9ydHVuaXN0aWNhbGx5
IGNvbnZlcnQgdGhlIGFzc2VydGlvbiB0byBhIEtWTV9CVUdfT04oKSwgaS5lLiBraWxsIG9ubHkK
PiB0aGUgYWZmZWN0ZWQgVk0sIG5vdCB0aGUgZW50aXJlIGtlcm5lbC4gIEEgY29ycnVwdGVkIGNv
dW50IGlzIGZhdGFsIHRvIHRoZQo+IFZNLCBlLmcuIHRoZSBub24temVybyAobmVnYXRpdmUpIGNv
dW50IHdpbGwgY2F1c2UgbW11X2ludmFsaWRhdGVfcmV0cnkoKQo+IHRvIGJsb2NrIGFueSBhbmQg
YWxsIGF0dGVtcHRzIHRvIGluc3RhbGwgbmV3IG1hcHBpbmdzLiAgQnV0IGl0J3MgZmFyIGZyb20K
PiBndWFyYW50ZWVkIHRoYXQgYW4gZW5kKCkgd2l0aG91dCBhIHN0YXJ0KCkgaXMgZmF0YWwgb3Ig
ZXZlbiBwcm9ibGVtYXRpYyB0bwo+IGFueXRoaW5nIG90aGVyIHRoYW4gdGhlIHRhcmdldCBWTSwg
ZS5nLiB0aGUgdW5kZXJseWluZyBidWcgY291bGQgc2ltcGx5IGJlCj4gYSBkdXBsaWNhdGUgY2Fs
bCB0byBlbmQoKS4gIEFuZCBpdCdzIG11Y2ggbW9yZSBsaWtlbHkgdGhhdCBhIG1pc3NlZAo+IGlu
dmFsaWRhdGlvbiwgaS5lLiBhIHBvdGVudGlhbCB1c2UtYWZ0ZXItZnJlZSwgd291bGQgbWFuaWZl
c3QgYXMgbm8KPiBub3RpZmljYXRpb24gd2hhdHNvZXZlciwgbm90IGFuIGVuZCgpIHdpdGhvdXQg
YSBzdGFydCgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vhbmpj
QGdvb2dsZS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogRnVhZCBUYWJiYSA8dGFiYmFAZ29vZ2xl
LmNvbT4KVGVzdGVkLWJ5OiBGdWFkIFRhYmJhIDx0YWJiYUBnb29nbGUuY29tPgoKQ2hlZXJzLAov
ZnVhZAoKPiAgdmlydC9rdm0va3ZtX21haW4uYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9r
dm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21haW4uYwo+IGluZGV4IDA1MjQ5MzM4NTZkNC4uNWE5
N2U2YzdkOWMyIDEwMDY0NAo+IC0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiArKysgYi92aXJ0
L2t2bS9rdm1fbWFpbi5jCj4gQEAgLTgzMyw2ICs4MzMsNyBAQCB2b2lkIGt2bV9tbXVfaW52YWxp
ZGF0ZV9lbmQoc3RydWN0IGt2bSAqa3ZtLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICAgICAgICAg
ICogaW4gY29uanVuY3Rpb24gd2l0aCB0aGUgc21wX3JtYiBpbiBtbXVfaW52YWxpZGF0ZV9yZXRy
eSgpLgo+ICAgICAgICAgICovCj4gICAgICAgICBrdm0tPm1tdV9pbnZhbGlkYXRlX2luX3Byb2dy
ZXNzLS07Cj4gKyAgICAgICBLVk1fQlVHX09OKGt2bS0+bW11X2ludmFsaWRhdGVfaW5fcHJvZ3Jl
c3MgPCAwLCBrdm0pOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQga3ZtX21tdV9ub3RpZmllcl9pbnZh
bGlkYXRlX3JhbmdlX2VuZChzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwKPiBAQCAtODYzLDggKzg2
NCw2IEBAIHN0YXRpYyB2b2lkIGt2bV9tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9lbmQo
c3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4gICAgICAgICAgKi8KPiAgICAgICAgIGlmICh3YWtl
KQo+ICAgICAgICAgICAgICAgICByY3V3YWl0X3dha2VfdXAoJmt2bS0+bW5fbWVtc2xvdHNfdXBk
YXRlX3JjdXdhaXQpOwo+IC0KPiAtICAgICAgIEJVR19PTihrdm0tPm1tdV9pbnZhbGlkYXRlX2lu
X3Byb2dyZXNzIDwgMCk7Cj4gIH0KPgo+ICBzdGF0aWMgaW50IGt2bV9tbXVfbm90aWZpZXJfY2xl
YXJfZmx1c2hfeW91bmcoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sCj4gLS0KPiAyLjQyLjAuODIw
Lmc4M2E3MjFhMTM3LWdvb2cKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
