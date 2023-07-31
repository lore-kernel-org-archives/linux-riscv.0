Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B37EC00528
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgdoUyO0WwVBcbZbieF8rKsG0DYlitzw2GXcZDmwnBY=; b=U+Q1SSyJeVm4/X
	s/Tcvq1ZGctqN89JIVE5zu0Non231adX+CtU3znZ0vyS8gSAsS1IjBikUJFDxX+5RZX21029WiPtA
	91pZGqwoEbQCweKV4wplQ1F4TKuH2YmzOJofJHcEu/6VTBzQqtZzsn+YoaoGvtCk1lff5ZZuV6aUy
	adfT0tfkcq3/hrMWSXEQ8gMr6pjMCkN14LyvWAodNrGGLaQ6sePhDovRRqU2fQ10lw/3ik1NAfvTx
	Oe3NgqP8JydEu7rUnZNXTM5zcTfSbM6ow6uzBKRz62qr5MyqP/aQPEEFWQlq9vkxPzmGZSp9N256E
	r78Uv/u35zqg/udiSClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTFK-00Fqt3-1N;
	Mon, 31 Jul 2023 13:47:38 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTFG-00FqoW-0b
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 13:47:36 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-63d170a649eso30573246d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690811247; x=1691416047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysw1GJ5iZ7+m9LB1vMcTeerNVDEGAKXkHz9rft3ciOM=;
        b=u9OhuV2WeoVUb538U+P/2QFmsHVbKcdA/KLYVytDxihcyMcOvBA0XVLiSr5cHMTN7D
         ikj7mVuN1iyhE73lkkm8FfLEjE5ponkqPZ1y3+LCm2IQAtu7oocrn6C54yzZ80W11Wvd
         rTxv00vYMpAR9z70F7m74ztY1F98dotGILfOawWW2zQkC0L0yO2AbJIKpEccIjfjgMtN
         rNOX3yDynA64SAgdgBRMMmYQcMR8X+2qNSp+2Yj5dtqRRJG2EoqS4Y/SRDVJ6nLIVtfR
         4bdQAAHnMSoPJgm+FGVRTm8lI3EITt2Y96aOx0NZdkMIARTZMJb3A2kQXkT2avpiLvYZ
         6BKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690811247; x=1691416047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysw1GJ5iZ7+m9LB1vMcTeerNVDEGAKXkHz9rft3ciOM=;
        b=lXKdAMvDzG9UiDIZVS6II6dhztKV2NEYzL2ZlChd6DbJopiXO7vgyTdt/06mgPu5px
         rQ/87d6dS0qEF+Ur7LH+fnqj8n+0H2OHfu1FfbtuPXMRkc71lfInruIfdxXFMj533b7/
         SqBQpi+KteiVxKVSP+bSWkd97WsXSR9lfdxUzGImpNTkyvMBoVaEI05LPZ5ECycgQwB+
         U1V3vduP6k4LUyX0agXLmQRE9bXvVBvTfAXUT2GmnKDtXO+qMjB/mk0PYFEccApoIFpM
         Gc/nM6Xssbzldc/606z32/ramML6mOQCJ0jW6D0uY704FY1yRW/IQPMnmVFCbykyB5Su
         GWxA==
X-Gm-Message-State: ABy/qLbc9Tr+5/djjqu5/UnK/Esars1vuUyqq4HMc8OkgAzU/88MjiMa
	rBS6fWnikvuwkeYBCsUftCPas5rpsOn2q9KriwsrSA==
X-Google-Smtp-Source: APBJJlF7tr3MB9wkYayUG07mtX0571x6EwPIiCT72OesCKkjWW/DHZdN3DzN9958IW7gK2WOAN/2LmnIZ4GFimGLnSQ=
X-Received: by 2002:ad4:5884:0:b0:632:2e63:d34b with SMTP id
 dz4-20020ad45884000000b006322e63d34bmr9450921qvb.14.1690811246768; Mon, 31
 Jul 2023 06:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <CA+EHjTzP2fypgkJbRpSPrKaWytW7v8ANEifofMnQCkdvYaX6Eg@mail.gmail.com> <ZMKlo+Fe8n/eLQ82@google.com>
In-Reply-To: <ZMKlo+Fe8n/eLQ82@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 31 Jul 2023 14:46:50 +0100
Message-ID: <CA+EHjTzySXapdQbv8ocueboBR4LnM9WGV4bLOAfipB1saQ6OjQ@mail.gmail.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Peng <chao.p.peng@linux.intel.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_064734_247605_006F35EF 
X-CRM114-Status: GOOD (  36.10  )
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

SGkgU2VhbiwKCk9uIFRodSwgSnVsIDI3LCAyMDIzIGF0IDY6MTPigK9QTSBTZWFuIENocmlzdG9w
aGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAyNywgMjAy
MywgRnVhZCBUYWJiYSB3cm90ZToKPiA+IEhpIFNlYW4sCj4gPgo+ID4gPHNuaXA+Cj4gPiAuLi4K
PiA+Cj4gPiA+IEBAIC01MTM0LDYgKzUxNjcsMTYgQEAgc3RhdGljIGxvbmcga3ZtX3ZtX2lvY3Rs
KHN0cnVjdCBmaWxlICpmaWxwLAo+ID4gPiAgICAgICAgIGNhc2UgS1ZNX0dFVF9TVEFUU19GRDoK
PiA+ID4gICAgICAgICAgICAgICAgIHIgPSBrdm1fdm1faW9jdGxfZ2V0X3N0YXRzX2ZkKGt2bSk7
Cj4gPiA+ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gKyAgICAgICBjYXNlIEtWTV9DUkVB
VEVfR1VFU1RfTUVNRkQ6IHsKPiA+ID4gKyAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fY3JlYXRl
X2d1ZXN0X21lbWZkIGd1ZXN0X21lbWZkOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICBy
ID0gLUVGQVVMVDsKPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChjb3B5X2Zyb21fdXNlcigmZ3Vl
c3RfbWVtZmQsIGFyZ3AsIHNpemVvZihndWVzdF9tZW1mZCkpKQo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIG91dDsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAgciA9IGt2
bV9nbWVtX2NyZWF0ZShrdm0sICZndWVzdF9tZW1mZCk7Cj4gPiA+ICsgICAgICAgICAgICAgICBi
cmVhazsKPiA+ID4gKyAgICAgICB9Cj4gPgo+ID4gSSdtIHRoaW5raW5nIGxpbmUgb2Ygc2lnaHQg
aGVyZSwgYnkgaGF2aW5nIHRoaXMgYXMgYSB2bSBpb2N0bCAocmF0aGVyCj4gPiB0aGFuIGEgc3lz
dGVtIGlvY2wpLCB3b3VsZCBpdCBjb21wbGljYXRlIG1ha2luZyBpdCBwb3NzaWJsZSBpbiB0aGUK
PiA+IGZ1dHVyZSB0byBzaGFyZS9kb25hdGUgbWVtb3J5IGJldHdlZW4gVk1zPwo+Cj4gTWF5YmUs
IGJ1dCBJIGhvcGUgbm90Pwo+Cj4gVGhlcmUgd291bGQgc3RpbGwgYmUgYSBwcmltYXJ5IG93bmVy
IG9mIHRoZSBtZW1vcnksIGkuZS4gdGhlIG1lbW9yeSB3b3VsZCBzdGlsbAo+IG5lZWQgdG8gYmUg
YWxsb2NhdGVkIGluIHRoZSBjb250ZXh0IG9mIGEgc3BlY2lmaWMgVk0uICBBbmQgdGhlIHByaW1h
cnkgb3duZXIgc2hvdWxkCj4gYmUgYWJsZSB0byByZXN0cmljdCBwcml2aWxlZ2VzLCBlLmcuIGFs
bG93IGEgZGlmZmVyZW50IFZNIHRvIHJlYWQgYnV0IG5vdCB3cml0ZQo+IG1lbW9yeS4KPgo+IE15
IGN1cnJlbnQgdGhpbmtpbmcgaXMgdG8gKGEpIHRpZSB0aGUgbGlmZXRpbWUgb2YgdGhlIGJhY2tp
bmcgcGFnZXMgdG8gdGhlIGlub2RlLAo+IGkuZS4gYWxsb3cgYWxsb2NhdGlvbnMgdG8gb3V0bGl2
ZSB0aGUgb3JpZ2luYWwgVk0sIGFuZCAoYikgY3JlYXRlIGEgbmV3IGZpbGUgZWFjaAo+IHRpbWUg
bWVtb3J5IGlzIHNoYXJlZC9kb25hdGVkIHdpdGggYSBkaWZmZXJlbnQgVk0gKG9yIG90aGVyIGVu
dGl0eSBpbiB0aGUga2VybmVsKS4KPgo+IFRoYXQgc2hvdWxkIG1ha2UgaXQgZmFpcmx5IHN0cmFp
Z2h0Zm9yd2FyZCB0byBwcm92aWRlIGRpZmZlcmVudCBwZXJtaXNzaW9ucywgZS5nLgo+IHRyYWNr
IHRoZW0gcGVyLWZpbGUsIGFuZCBJIHRoaW5rIHNob3VsZCBhbHNvIGF2b2lkIHRoZSBuZWVkIHRv
IGNoYW5nZSB0aGUgbWVtc2xvdAo+IGJpbmRpbmcgbG9naWMgc2luY2UgZWFjaCBWTSB3b3VsZCBo
YXZlIGl0J3Mgb3duIHZpZXcvYmluZGluZ3MuCj4KPiBDb3B5K3Bhc3RpbmcgYSByZWxldmFudCBz
bmlwcGV0IGZyb20gYSBsZW5ndGhpZXIgcmVzcG9uc2UgaW4gYSBkaWZmZXJlbnQgdGhyZWFkWypd
Ogo+Cj4gICBDb25jZXB0dWFsbHksIEkgdGhpbmsgS1ZNIHNob3VsZCB0byBiaW5kIHRvIHRoZSBm
aWxlLiAgVGhlIGlub2RlIGlzIGVmZmVjdGl2ZWx5Cj4gICB0aGUgcmF3IHVuZGVybHlpbmcgcGh5
c2ljYWwgc3RvcmFnZSwgd2hpbGUgdGhlIGZpbGUgaXMgdGhlIFZNJ3MgdmlldyBvZiB0aGF0Cj4g
ICBzdG9yYWdlLgoKSSdtIG5vdCBhd2FyZSBvZiBhbnkgaW1wbGVtZW50YXRpb24gb2Ygc2hhcmlu
ZyBtZW1vcnkgYmV0d2VlbiBWTXMgaW4KS1ZNIGJlZm9yZSAoYWZhaWssIHNpbmNlIHRoZXJlIHdh
cyBubyBuZWVkIGZvciBvbmUpLiBUaGUgZm9sbG93aW5nIGlzCm1lIHRoaW5raW5nIG91dCBsb3Vk
LCByYXRoZXIgdGhhbiBhbnkgc3Ryb25nIG9waW5pb25zIG9uIG15IHBhcnQuCgpJZiBhbiBhbGxv
Y2F0aW9uIGNhbiBvdXRsaXZlIHRoZSBvcmlnaW5hbCBWTSwgdGhlbiB3aHkgYXNzb2NpYXRlIGl0
CndpdGggdGhhdCAob3IgYSkgVk0gdG8gYmVnaW4gd2l0aD8gV291bGRuJ3QgaXQgYmUgbW9yZSBm
bGV4aWJsZSBpZiBpdAp3ZXJlIGEgc3lzdGVtLWxldmVsIGNvbnN0cnVjdCwgd2hpY2ggaXMgZWZm
ZWN0aXZlbHkgd2hhdCBpdCB3YXMgaW4KcHJldmlvdXMgaXRlcmF0aW9ucyBvZiB0aGlzPyBUaGlz
IGRvZXNuJ3QgcnVsZSBvdXQgYmluZGluZyB0byB0aGUKZmlsZSwgYW5kIGtlZXBpbmcgdGhlIGlu
b2RlIGFzIHRoZSB1bmRlcmx5aW5nIHBoeXNpY2FsIHN0b3JhZ2UuCgpUaGUgYmluZGluZyBvZiBh
IFZNIHRvIGEgZ3Vlc3RtZW0gb2JqZWN0IGNvdWxkIGhhcHBlbiBpbXBsaWNpdGx5IHdpdGgKS1ZN
X1NFVF9VU0VSX01FTU9SWV9SRUdJT04yLCBvciB3ZSBjb3VsZCBoYXZlIGEgbmV3IGlvY3RsIHNw
ZWNpZmljYWxseQpmb3IgaGFuZGxpbmcgYmluZGluZy4KCkNoZWVycywKL2Z1YWQKCgo+ICAgUHJh
Y3RpY2FsbHksIEkgdGhpbmsgdGhhdCBnaXZlcyB1cyBhIGNsZWFuLCBpbnR1aXRpdmUgd2F5IHRv
IGhhbmRsZSBpbnRyYS1ob3N0Cj4gICBtaWdyYXRpb24uICBSYXRoZXIgdGhhbiB0cmFuc2ZlciBv
d25lcnNoaXAgb2YgdGhlIGZpbGUsIGluc3RhbnRpYXRlIGEgbmV3IGZpbGUKPiAgIGZvciB0aGUg
dGFyZ2V0IFZNLCB1c2luZyB0aGUgZ21lbSBpbm9kZSBmcm9tIHRoZSBzb3VyY2UgVk0sIGkuZS4g
Y3JlYXRlIGEgaGFyZAo+ICAgbGluay4gIFRoYXQnZCBwcm9iYWJseSByZXF1aXJlIG5ldyB1QVBJ
LCBidXQgSSBkb24ndCB0aGluayB0aGF0IHdpbGwgYmUgaHVnZWx5Cj4gICBwcm9ibGVtYXRpYy4g
IEtWTSB3b3VsZCBuZWVkIHRvIGVuc3VyZSB0aGUgbmV3IFZNJ3MgZ3Vlc3RfbWVtZmQgY2FuJ3Qg
YmUgbWFwcGVkCj4gICB1bnRpbCBLVk1fQ0FQX1ZNX01PVkVfRU5DX0NPTlRFWFRfRlJPTSAod2hp
Y2ggd291bGQgYWxzbyBuZWVkIHRvIHZlcmlmeSB0aGUKPiAgIG1lbXNsb3RzL2JpbmRpbmdzIGFy
ZSBpZGVudGljYWwpLCBidXQgdGhhdCBzaG91bGQgYmUgZWFzeSBlbm91Z2ggdG8gZW5mb3JjZS4K
Pgo+ICAgVGhhdCB3YXksIGEgVk0sIGl0cyBtZW1zbG90cywgYW5kIGl0cyBTUFRFcyBhcmUgdGll
ZCB0byB0aGUgZmlsZSwgd2hpbGUgYWxsb3dpbmcKPiAgIHRoZSBtZW1vcnkgYW5kIHRoZSAqY29u
dGVudHMqIG9mIG1lbW9yeSB0byBvdXRsaXZlIHRoZSBWTSwgaS5lLiBiZSBlZmZlY3RpdmVseQo+
ICAgdHJhbnNmZXJlZCB0byB0aGUgbmV3IHRhcmdldCBWTS4gIEFuZCB3ZSdsbCBtYWludGFpbiB0
aGUgaW52YXJpYW50IHRoYXQgZWFjaAo+ICAgZ3Vlc3RfbWVtZmQgaXMgYm91bmQgMToxIHdpdGgg
YSBzaW5nbGUgVk0uCj4KPiAgIEFzIGFib3ZlLCB0aGF0IHNob3VsZCBhbHNvIGhlbHAgdXMgZHJh
dyB0aGUgbGluZSBiZXR3ZWVuIG1hcHBpbmcgbWVtb3J5IGludG8gYQo+ICAgVk0gKGZpbGUpLCBh
bmQgZnJlZWluZy9yZWNsYWltaW5nIHRoZSBtZW1vcnkgKGlub2RlKS4KPgo+ICAgVGhlcmUgd2ls
bCBiZSBleHRyYSBjb21wbGV4aXR5L292ZXJoZWFkIGFzIHdlJ2xsIGhhdmUgdG8gcGxheSBuaWNl
IHdpdGggdGhlCj4gICBwb3NzaWJpbGl0eSBvZiBtdWx0aXBsZSBmaWxlcyBwZXIgaW5vZGUsIGUu
Zy4gdG8gemFwIG1hcHBpbmdzIGFjcm9zcyBhbGwgZmlsZXMKPiAgIHdoZW4gcHVuY2hpbmcgYSBo
b2xlLCBidXQgdGhlIGV4dHJhIGNvbXBsZXhpdHkgaXMgcXVpdGUgc21hbGwsIGUuZy4gd2UgY2Fu
IHVzZQo+ICAgYWRkcmVzc19zcGFjZS5wcml2YXRlX2xpc3QgdG8ga2VlcCB0cmFjayBvZiB0aGUg
Z3Vlc3RfbWVtZmQgaW5zdGFuY2VzIGFzc29jaWF0ZWQKPiAgIHdpdGggdGhlIGlub2RlLgo+Cj4g
ICBTZXR0aW5nIGFzaWRlIFREWCBhbmQgU05QIGZvciB0aGUgbW9tZW50LCBhcyBpdCdzIG5vdCBj
bGVhciBob3cgdGhleSdsbCBzdXBwb3J0Cj4gICBtZW1vcnkgdGhhdCBpcyAicHJpdmF0ZSIgYnV0
IHNoYXJlZCBiZXR3ZWVuIG11bHRpcGxlIFZNcywgSSB0aGluayBwZXItVk0gZmlsZXMKPiAgIHdv
dWxkIHdvcmsgd2VsbCBmb3Igc2hhcmluZyBnbWVtIGJldHdlZW4gdHdvIFZNcy4gIEUuZy4gd291
bGQgYWxsb3cgYSBnaXZlIHBhZ2UKPiAgIHRvIGJlIGJvdW5kIHRvIGEgZGlmZmVyZW50IGdmbiBm
b3IgZWFjaCBWTSwgd291bGQgYWxsb3cgaGF2aW5nIGRpZmZlcmVudCBwZXJtaXNzaW9ucwo+ICAg
Zm9yIGVhY2ggZmlsZSAoZS5nLiB0byBhbGxvdyBmYWxsb2NhdGUoKSBvbmx5IGZyb20gdGhlIG9y
aWdpbmFsIG93bmVyKS4KPgo+IFsqXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWkxHaUVm
SlpUeWw3TThtU0Bnb29nbGUuY29tCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
