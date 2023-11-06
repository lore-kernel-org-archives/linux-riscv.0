Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49390C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rYK++hzkrGO4ZZN5kPY0cr2cOVmD1RHYi2DWRKUWnVk=; b=wqZjEmTgxX+6/LoMnS/fBRyrKp
	ri6oWcLAB6YxxYjvuTp3ddD3zI81ex51eVYdtsikGy56rp5U7eQHFiKkQ8l6g6DmrCUYz94YFKqgU
	3D3Ey+6K28p4rfIoNqXp9Qbye7sHSJRrUH5bmgl7YFAI3m/eApOu1gvvzWD3GWVD2fHL+3UlH6yRT
	BePoJdsXQpiMGkWbE9uBMwFkpFm+fgGN3VnkbgOPFxM6MlIhv7kC1Iu3fHAFd8pIJXByAD5lokVsl
	v9sxBHKeWLItavN4rUXdUaUBjR1SbcRWVzCP2Mngv1hMffSyu5mU0NwAfsvuPBnw98RCfK/i6289k
	kasIbxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r01xU-00H2ez-0Y;
	Mon, 06 Nov 2023 15:56:12 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r01xQ-00H2c7-0f
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:56:10 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da04fb79246so5346039276.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 07:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699286165; x=1699890965; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2j2Mtk4lW9HEtWavGEnwteIJF5J/7dhiq9rSq3IBx+E=;
        b=pISNmvwHfjd4le8TCuwWDCQlo/slDwK10sfTICd/zWZbVVsxAdS+Q/j/2pmTQ5Vxsu
         Kiu7lHcTC7SLjZ+mD8pWiOCoNboH9xOrJJ3ZWvZV1+ad3AAniFY67auaWzNn6asdFzI5
         PnKTIKubnIa7lWYaY3ChC5ewFaxCd7fJf6hkoBmOviVmd10MKsas4MOTryVNgfjYFYaV
         xCO/9ReX32apA1E9W18QYI+UXpGgKQCEfNYwAmBjQ0HYCL3orYELmfAT4zwTZMjF8b2M
         zL+tj99w3RzZBokWIlXhN/HGdX3AaAfBwjbD809jlL7v/7bqyrTKDMqGOvp6/gD6F+uA
         se4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286165; x=1699890965;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2j2Mtk4lW9HEtWavGEnwteIJF5J/7dhiq9rSq3IBx+E=;
        b=uXeE4Fu7XC0QNz54vVJBy5RReQTWLKcz5L/bXPNhILpQ/p3yrgpuOLhBewy8gUdVTD
         2t9eWyLZ56EDTbuVSEkrZ3N+XS54S1Iq2QVxys7ObmV7LBpnf3gJTYfJNiDaPsG5IIzx
         ylBEupeHv3okh22hFEacF9SChqcRIsGLiojwwJBYzfKjz6GLcCNxFcSKFUXP5gouJOi0
         9J6HT8aGHcGy4pDkIsSPv8DmRGEaHS73XODb1pWd7LD2ahBJ4KVomE5k15lLAu4FFuYg
         3Ya1PHrGtccumdoZ1fBpEF1u5fxl+6x0KJuzncr2A3tuhKJYEY2LhTBfW/VXwXiQV953
         zKyA==
X-Gm-Message-State: AOJu0YzeT9B3Rs6asN/3dIf/R5MXsP2veFpnGuMxlGbCjBgkFA509OwC
	2SxZgGO94OdCOaSSVekXx8yxLN99fas=
X-Google-Smtp-Source: AGHT+IERk2b/M7d3G4J3vDGzrJ+T8jAsirv4bBIzvQT8OzuTMUe5AwPvC/SZu8YyGY6aMLoBT08jDOLmS/Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1083:b0:d9a:c3b8:4274 with SMTP id
 v3-20020a056902108300b00d9ac3b84274mr683795ybu.7.1699286165114; Mon, 06 Nov
 2023 07:56:05 -0800 (PST)
Date: Mon, 6 Nov 2023 07:56:03 -0800
In-Reply-To: <ZUjqJjz0Epf7ii8F@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-21-seanjc@google.com>
 <ZUeSaAKRemlSRQpO@yilunxu-OptiPlex-7050> <CABgObfb1Wf2ptitGhJPM6VcmkCG9haMoQj2BsttjeoV=9F0O9Q@mail.gmail.com>
 <ZUjqJjz0Epf7ii8F@yilunxu-OptiPlex-7050>
Message-ID: <ZUkMk6b6vZe2ANkK@google.com>
Subject: Re: [PATCH v13 20/35] KVM: x86/mmu: Handle page fault for private memory
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
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
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_075608_264106_A13632FC 
X-CRM114-Status: GOOD (  20.15  )
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

T24gTW9uLCBOb3YgMDYsIDIwMjMsIFh1IFlpbHVuIHdyb3RlOgo+IE9uIFN1biwgTm92IDA1LCAy
MDIzIGF0IDA1OjE5OjM2UE0gKzAxMDAsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gPiBPbiBTdW4s
IE5vdiA1LCAyMDIzIGF0IDI6MDTigK9QTSBYdSBZaWx1biA8eWlsdW4ueHVAbGludXguaW50ZWwu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gPiArc3RhdGljIHZvaWQga3ZtX21tdV9wcmVwYXJlX21l
bW9yeV9mYXVsdF9leGl0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fcGFnZV9mYXVsdCAq
ZmF1bHQpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICBrdm1fcHJlcGFyZV9tZW1vcnlfZmF1bHRf
ZXhpdCh2Y3B1LCBmYXVsdC0+Z2ZuIDw8IFBBR0VfU0hJRlQsCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9TSVpFLCBmYXVsdC0+d3JpdGUsIGZhdWx0LT5l
eGVjLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZhdWx0LT5p
c19wcml2YXRlKTsKPiA+ID4gPiArfQo+ID4gPiA+ICsKPiA+ID4gPiArc3RhdGljIGludCBrdm1f
ZmF1bHRpbl9wZm5fcHJpdmF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9wYWdlX2ZhdWx0ICpmYXVsdCkK
PiA+ID4gPiArewo+ID4gPiA+ICsgICAgIGludCBtYXhfb3JkZXIsIHI7Cj4gPiA+ID4gKwo+ID4g
PiA+ICsgICAgIGlmICgha3ZtX3Nsb3RfY2FuX2JlX3ByaXZhdGUoZmF1bHQtPnNsb3QpKSB7Cj4g
PiA+ID4gKyAgICAgICAgICAgICBrdm1fbW11X3ByZXBhcmVfbWVtb3J5X2ZhdWx0X2V4aXQodmNw
dSwgZmF1bHQpOwo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gPiA+ID4g
KyAgICAgfQo+ID4gPiA+ICsKPiA+ID4gPiArICAgICByID0ga3ZtX2dtZW1fZ2V0X3Bmbih2Y3B1
LT5rdm0sIGZhdWx0LT5zbG90LCBmYXVsdC0+Z2ZuLCAmZmF1bHQtPnBmbiwKPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAmbWF4X29yZGVyKTsKPiA+ID4gPiArICAgICBpZiAocikg
ewo+ID4gPiA+ICsgICAgICAgICAgICAga3ZtX21tdV9wcmVwYXJlX21lbW9yeV9mYXVsdF9leGl0
KHZjcHUsIGZhdWx0KTsKPiA+ID4gPiArICAgICAgICAgICAgIHJldHVybiByOwo+ID4gPgo+ID4g
PiBXaHkgcmVwb3J0IEtWTV9FWElUX01FTU9SWV9GQVVMVCBoZXJlPyBldmVuIHdpdGggYSByZXQg
IT0gLUVGQVVMVD8KPiA+IAo+ID4gVGhlIGNhc2VzIGFyZSBFRkFVTFQsIEVIV1BPSVNPTiAod2hp
Y2ggY2FuIHJlcG9ydAo+ID4gS1ZNX0VYSVRfTUVNT1JZX0ZBVUxUKSBhbmQgRU5PTUVNLiBJIHRo
aW5rIGl0J3MgZmluZQo+ID4gdGhhdCBldmVuIC1FTk9NRU0gY2FuIHJldHVybiBLVk1fRVhJVF9N
RU1PUllfRkFVTFQsCj4gPiBhbmQgaXQgZG9lc24ndCB2aW9sYXRlIHRoZSBkb2N1bWVudGF0aW9u
LiAgVGhlIGRvY3MgdGVsbCB5b3UgIndoYXQKPiA+IGNhbiB5b3UgZG8gaWYgZXJyb3IgaWYgRUZB
VUxUIG9yIEVIV1BPSVNPTj8iOyB0aGV5IGRvbid0Cj4gPiBleGNsdWRlIHRoYXQgb3RoZXIgZXJy
bm9zIHJlc3VsdCBpbiBLVk1fRVhJVF9NRU1PUllfRkFVTFQsCj4gPiBpdCdzIGp1c3QgdGhhdCB5
b3UncmUgbm90IHN1cHBvc2VkIHRvIGxvb2sgYXQgaXQKPiAKPiBUaGFua3MsIGl0J3MgT0sgZm9y
IEVOT01FTSArIEtWTV9FWElUX01FTU9SWV9GQVVMVC4KPiAKPiBBbm90aGVyIGNvbmNlcm4gaXMs
IG5vdyAzIHBsYWNlcyB0byByZXBvcnQgRUZBVUxUICsgS1ZNX0VYSVRfTUVNT1JZX0ZBVUxUOgo+
IAo+ICAgaWYgKCFrdm1fc2xvdF9jYW5fYmVfcHJpdmF0ZShmYXVsdC0+c2xvdCkpIHsKPiAJa3Zt
X21tdV9wcmVwYXJlX21lbW9yeV9mYXVsdF9leGl0KHZjcHUsIGZhdWx0KTsKPiAJcmV0dXJuIC1F
RkFVTFQ7Cj4gICB9Cj4gCj4gICBmaWxlID0ga3ZtX2dtZW1fZ2V0X2ZpbGUoc2xvdCk7Cj4gICBp
ZiAoIWZpbGUpCj4gCXJldHVybiAtRUZBVUxUOwo+IAo+ICAgaWYgKGZhdWx0LT5pc19wcml2YXRl
ICE9IGt2bV9tZW1faXNfcHJpdmF0ZSh2Y3B1LT5rdm0sIGZhdWx0LT5nZm4pKSB7Cj4gCWt2bV9t
bXVfcHJlcGFyZV9tZW1vcnlfZmF1bHRfZXhpdCh2Y3B1LCBmYXVsdCk7Cj4gCXJldHVybiAtRUZB
VUxUOwo+ICAgfQo+IAo+IFRoZXkgYXJlIGRpZmZlcmVudCBjYXNlcywgYW5kIHNlZW1zIHVzZXJz
cGFjZSBzaG91bGQgaGFuZGxlIHRoZW0KPiBkaWZmZXJlbnRseSwgYnV0IG5vdCBlbm91Z2ggaW5m
b3JtYXRpb24gdG8gZGlzdGluZ3Vpc2ggdGhlbS4KCkZvciB0aGUgZmlyc3QsIHRoZSBtZW1vcnlf
ZmF1bHQgZXhpdCB3aWxsIGluZm9ybSB1c2Vyc3BhY2UgdGhhdCB0aGUgZ3Vlc3Qgd2FudHMKdG8g
bWFwIG1lbW9yeSBhcyBwcml2YXRlLCBhbmQgdXNlcnNwYWNlIHdpbGwgc2VlIHRoYXQgdGhlIG1l
bXNsb3QgaXNuJ3QgY29uZmlndXJlZAp0byBzdXBwb3J0IHByaXZhdGUgbWFwcGluZ3MuICBVc2Vy
c3BhY2UgbWF5IG5vdCBldmVuIG5lZWQgdG8gcXVlcnkgbWVtc2xvdHMsIGUuZy4KaWYgdGhlIGdm
biBpbiBxdWVzdGlvbiBoYXMgYmVlbiBlbnVtZXJhdGVkIHRvIHRoZSBndWVzdCBhcyBzb21ldGhp
bmcgdGhhdCBjYW4gb25seQpiZSBtYXBwZWQgc2hhcmVkLgoKRm9yIHRoZSBzZWNvbmQgKG5vIHZh
bGlkIGd1ZXN0X21lbWZkIGZpbGUpLCB1c2Vyc3BhY2UgcHV0IHRoZSBsYXN0IHJlZmVyZW5jZSB0
bwp0aGUgZ3Vlc3RfbWVtZmQgZmlsZSB3aXRob3V0IGluZm9ybWluZyB0aGUgZ3Vlc3Qgb3IgY3Jl
YXRpbmcgYSBtZW1zbG90LiAgVGhhdCdzCmZpcm1seSBhIHVzZXJzcGFjZSBidWcuCgpGb3IgdGhl
IHRoaXJkIGFuZCBsYXN0LCB1c2Vyc3BhY2Ugd2lsbCBzZWUgdGhhdCB0aGUgZ3Vlc3QgaXMgcmVx
dWVzdGluZyBhIHByaXZhdGUKbWFwcGluZyBidXQgdGhlIGdmbiBpcyBjb25maWd1cmVkIGZvciBz
aGFyZWQgbWFwcGluZ3MuCgpJbiBhbGwgY2FzZXMsIHVzZXJzcGFjZSBoYXMgdGhlIG5lY2Vzc2Fy
eSBpbmZvcm1hdGlvbiB0byByZXNvbHZlIHRoZSBpc3N1ZSwgd2hlcmUKInJlc29sdmluZyB0aGUg
aXNzdWUiIG1heSBtZWFuIHRlcm1pbmF0aW5nIHRoZSBndWVzdC4gIElmIHVzZXJzcGFjZSBpc24n
dCB0cmFja2luZwptZW1zbG90cyBvciB0aGUgcHJpdmF0ZSBhdHRyaWJ1dGUsIHRoZW4gdXNlcnNw
YWNlIGhhcyBmYXIgYmlnZ2VyIHByb2JsZW1zLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
