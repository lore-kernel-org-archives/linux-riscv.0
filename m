Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0FCC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 16:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pO681EchmWqceO9siIDuhcDhMgg2mWFGJD/ulTYFu1U=; b=hoBew7rF8TBzOG9jQ/4K9yi6ah
	S75k73btDcJZaIXk7AIpn0tGaJdPmrdlBOpkFORxzbo9sZgEnp08jYAbe+oF6fwJ8eQde5nH4OpgA
	t9tBJvZF5yMe0eLpfnhk14oto5RXP4EyxOEfGOOzgPtVTNGlXVJfpDMBC+zo9khcxhnBtP6uty/df
	E4fVWuXQvPlGE4xgsbHnca8nMtbJz157nHooWKA6vHMzcHvpqFJkoIIV3B0JwIT/mBpjJiYuRqqrr
	9D5twlaDBmzCh2GsVlDW55gycUu3Bu/1zFgYOPgr+jhnBcZ1GbFhpGe8IEYrMVfwOh+qR2sTWLLpF
	Xkz51Nbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyECN-007oqO-05;
	Wed, 01 Nov 2023 16:36:07 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyECK-007opI-0M
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 16:36:05 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d9cb4de3bf0so7625699276.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 09:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698856562; x=1699461362; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azJu2Dh8gujl5qnxyYwo1n6krfiG0RwudOI1y5vnuB4=;
        b=kAmi5cL5ocLX6QpPeOk8QKdHNa1ZiB7fL0c5znE2ehneGPBzk/qs43hVTIWt0OyW4f
         ipaeYiGSisfF7G1f+Jft3sRmcsx1bjL/1/nfW/bcKwnhWHkGIgGTOcT6Mw+t+DLVLTu5
         MLrlDjQHNMwHCO2Q0HOPhYJiy1T/Qj2t4y/IjGUI4vbpjKhMAYnc0X6e/cls2pLsE3em
         nL0HLFf7LnilNiPW9CSP2nJp/RUOTQXyHz1NE4DFr9/XXNKPVpTlJNJBy0L9JKtJhBdt
         WluWf4Oh0EdWGo+JmlohZMiKhv653lQ16b0ACNPlpfYG856iVlVEDYMQ1CY75o/RM9UV
         h6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698856562; x=1699461362;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=azJu2Dh8gujl5qnxyYwo1n6krfiG0RwudOI1y5vnuB4=;
        b=QCX//ie2+ynbSRNQhXn2cyhcgietXCXoKSVbRorc74QNJ/IEdR93l1RC/l9zEJjo4w
         TPqDM/aYbp7e6LNWXdiqi4it6iy9y6NHzRHSp0ON8YMUAgQKv56GEb5ARyGmrbCrYKEZ
         okIDbXKRgp9g8HSFASxRTOSPamQy11dyI7eWeo253QVsUuWMQlkWRsK+tMEegZhNJZ2q
         wBUkuYnfAJot6PdI1ZsJPg82vuBOG/s79tbPbLLpkJFE8NF0f2M9TMd30jHj3le17S8T
         CyfyYzB0s7uVCwdDVFkK+EJmj38tyq6Hw5kEui54Jq3LcrSEa3rje3qHmU9Iua7yvIRI
         nUBQ==
X-Gm-Message-State: AOJu0Ywb36PSzCO/gbQeeooJ/ZfpFjADn6sF1c9Hw0yf7jYFtg0lCuXb
	9kLFY8zJNqum6/a1plqDSOqBn+W52xk=
X-Google-Smtp-Source: AGHT+IFqCABorYKmfCmJZy/oBSeOXTtnBU+krovHVjWnvhFIdm8AwbTMBJoMdfZ9FR5pLbycY5bTrtHt4Z4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:770f:0:b0:da0:73c2:db78 with SMTP id
 s15-20020a25770f000000b00da073c2db78mr326876ybc.9.1698856562473; Wed, 01 Nov
 2023 09:36:02 -0700 (PDT)
Date: Wed, 1 Nov 2023 09:36:00 -0700
In-Reply-To: <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com> <ZUEML6oJXDCFJ9fg@google.com>
 <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com> <ZUJVfCkIYYFp5VwG@google.com>
 <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
Message-ID: <ZUJ-cJfofk2d_I0B@google.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Marc Zyngier <maz@kernel.org>, 
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
	linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
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
X-CRM114-CacheID: sfid-20231101_093604_172913_1F4451B3 
X-CRM114-Status: GOOD (  29.75  )
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

T24gV2VkLCBOb3YgMDEsIDIwMjMsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gV2VkLCBOb3Yg
MSwgMjAyMyBhdCAyOjQx4oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5j
b20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgTm92IDAxLCAyMDIzLCBYaWFveWFvIExpIHdyb3Rl
Ogo+ID4gPiBPbiAxMC8zMS8yMDIzIDEwOjE2IFBNLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3Rl
Ogo+ID4gPiA+IE9uIFR1ZSwgT2N0IDMxLCAyMDIzLCBYaWFveWFvIExpIHdyb3RlOgo+ID4gPiA+
ID4gT24gMTAvMjgvMjAyMyAyOjIxIEFNLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+ID4g
PiBCdXQgaXQncyBkaWZmZXJlbnQgdGhhbiBNQURWX0hVR0VQQUdFLCBpbiBhIHdheS4gUGVyIG15
IHVuZGVyc3RhbmRpbmcsIHRoZQo+ID4gPiBmYWlsdXJlIG9mIE1BRFZfSFVHRVBBR0UgaXMgbm90
IGZhdGFsLCB1c2VyIHNwYWNlIGNhbiBpZ25vcmUgaXQgYW5kCj4gPiA+IGNvbnRpbnVlLgo+ID4g
Pgo+ID4gPiBIb3dldmVyLCB0aGUgZmFpbHVyZSBvZiBLVk1fR1VFU1RfTUVNRkRfQUxMT1dfSFVH
RVBBR0UgaXMgZmF0YWwsIHdoaWNoIGxlYWRzCj4gPiA+IHRvIGZhaWx1cmUgb2YgZ3Vlc3QgbWVt
ZmQgY3JlYXRpb24uCj4gPgo+ID4gRmFpbGluZyBLVk1fQ1JFQVRFX0dVRVNUX01FTUZEIGlzbid0
IHRydWx5IGZhdGFsLCBpdCBqdXN0IHJlcXVpcmVzIGRpZmZlcmVudAo+ID4gYWN0aW9uIGZyb20g
dXNlcnNwYWNlLCBpLmUuIGluc3RlYWQgb2YgaWdub3JpbmcgdGhlIGVycm9yLCB1c2Vyc3BhY2Ug
Y291bGQgcmVkbwo+ID4gS1ZNX0NSRUFURV9HVUVTVF9NRU1GRCB3aXRoIEtWTV9HVUVTVF9NRU1G
RF9BTExPV19IVUdFUEFHRT0wLgo+ID4KPiA+IFdlIGNvdWxkIG1ha2UgdGhlIGJlaGF2aW9yIG1v
cmUgbGlrZSBNQURWX0hVR0VQQUdFLCBlLmcuIHRoZW9yZXRpY2FsbHkgd2UgY291bGQKPiA+IGV4
dGVuZCBmYWR2aXNlKCkgd2l0aCBGQURWX0hVR0VQQUdFLCBvciBhZGQgYSBndWVzdF9tZW1mZCBr
bm9iL2lvY3RsKCkgdG8gbGV0Cj4gPiB1c2Vyc3BhY2UgcHJvdmlkZSBhZHZpY2UvaGludHMgYWZ0
ZXIgY3JlYXRpbmcgYSBndWVzdF9tZW1mZC4gIEJ1dCBJIHN1c3BlY3QgdGhhdAo+ID4gZ3Vlc3Rf
bWVtZmQgd291bGQgYmUgdGhlIG9ubHkgdXNlciBvZiBGQURWX0hVR0VQQUdFLCBhbmQgSU1PIGEg
cG9zdC1jcmVhdGlvbiBoaW50Cj4gPiBpcyBhY3R1YWxseSBsZXNzIGRlc2lyYWJsZS4KPiA+Cj4g
PiBLVk1fR1VFU1RfTUVNRkRfQUxMT1dfSFVHRVBBR0Ugd2lsbCBmYWlsIG9ubHkgaWYgdXNlcnNw
YWNlIGRpZG4ndCBwcm92aWRlIGEKPiA+IGNvbXBhdGlibGUgc2l6ZSBvciB0aGUga2VybmVsIGRv
ZXNuJ3Qgc3VwcG9ydCBUSFAuICBBbiBpbmNvbXBhdGlibGUgc2l6ZSBpcyBsaWtlbHkKPiA+IGEg
dXNlcnNwYWNlIGJ1ZywgYW5kIGZvciBtb3N0IHNldHVwcyB0aGF0IHdhbnQgdG8gdXRpbGl6ZSBn
dWVzdF9tZW1mZCwgbGFjayBvZiBUSFAKPiA+IHN1cHBvcnQgaXMgbGlrZWx5IGEgY29uZmlndXJh
dGlvbiBidWcuICBJLmUuIG1hbnkvbW9zdCB1c2VzICp3YW50KiBmYWlsdXJlcyBkdWUgdG8KPiA+
IEtWTV9HVUVTVF9NRU1GRF9BTExPV19IVUdFUEFHRSB0byBiZSBmYXRhbC4KPiA+Cj4gPiA+IEZv
ciBjdXJyZW50IGltcGxlbWVudGF0aW9uLCBJIHRoaW5rIG1heWJlIEtWTV9HVUVTVF9NRU1GRF9E
RVNJUkVfSFVHRVBBR0UKPiA+ID4gZml0cyBiZXR0ZXIgdGhhbiBLVk1fR1VFU1RfTUVNRkRfQUxM
T1dfSFVHRVBBR0U/IG9yIG1heWJlICpQUkVGRVIqPwo+ID4KPiA+IFdoeT8gIFZlcmJzIGxpa2Ug
InByZWZlciIgYW5kICJkZXNpcmUiIGFyZW4ndCBhIGdvb2QgZml0IElNTyBiZWNhdXNlIHRoZXkg
c3VnZ2VzdAo+ID4gdGhlIGZsYWcgaXMgYSBoaW50LCBhbmQgaGludHMgYXJlIHVzdWFsbHkgYmVz
dCBlZmZvcnQgb25seSwgaS5lLiBhcmUgaWdub3JlZCBpZgo+ID4gdGhlcmUgaXMgYSBmdW5kYW1l
bnRhbCBpbmNvbXBhdGliaWxpdHkuCj4gPgo+ID4gIkFsbG93IiBpc24ndCBwZXJmZWN0LCBlLmcu
IEkgd291bGQgbXVjaCBwcmVmZXIgYSBzdHJhaWdodCBLVk1fR1VFU1RfTUVNRkRfVVNFX0hVR0VQ
QUdFUwo+ID4gb3IgS1ZNX0dVRVNUX01FTUZEX0hVR0VQQUdFUyBmbGFnLCBidXQgSSB3YW50ZWQg
dGhlIG5hbWUgdG8gY29udmV5IHRoYXQgS1ZNIGRvZXNuJ3QKPiA+ICh5ZXQpIGd1YXJhbnRlZSBo
dWdlcGFnZXMuICBJLmUuIEtWTV9HVUVTVF9NRU1GRF9BTExPV19IVUdFUEFHRSBpcyBzdHJvbmdl
ciB0aGFuCj4gPiBhIGhpbnQsIGJ1dCB3ZWFrZXIgdGhhbiBhIHJlcXVpcmVtZW50LiAgQW5kIGlm
L3doZW4gS1ZNIHN1cHBvcnRzIGEgZGVkaWNhdGVkIG1lbW9yeQo+ID4gcG9vbCBvZiBzb21lIGtp
bmQsIHRoZW4gd2UgY2FuIGFkZCBLVk1fR1VFU1RfTUVNRkRfUkVRVUlSRV9IVUdFUEFHRS4KPiAK
PiBJIHRoaW5rIHRoYXQgdGhlIGN1cnJlbnQgcGF0Y2ggaXMgZmluZSwgYnV0IEkgd2lsbCBhZGp1
c3QgaXQgdG8gYWx3YXlzCj4gYWxsb3cgdGhlIGZsYWcsIGFuZCB0byBtYWtlIHRoZSBzaXplIGNo
ZWNrIGV2ZW4gaWYgIUNPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRS4KPiBJZiBodWdlcGFnZXMg
YXJlIG5vdCBndWFyYW50ZWVkLCBhbmQgKHRoZW9yZXRpY2FsbHkpIHlvdSBjb3VsZCBoYXZlIG5v
Cj4gaHVnZXBhZ2UgYXQgYWxsIGluIHRoZSByZXN1bHQsIGl0J3Mgb2theSB0byBnZXQgdGhpcyBy
ZXN1bHQgZXZlbiBpZiBUSFAgaXMgbm90Cj4gYXZhaWxhYmxlIGluIHRoZSBrZXJuZWwuCgpDYW4g
eW91IHBvc3QgYSBmaXh1cCBwYXRjaD8gIEl0J3Mgbm90IGNsZWFyIHRvIG1lIGV4YWN0bHkgd2hh
dCBiZWhhdmlvciB5b3UgaW50ZW5kCnRvIGVuZCB1cCB3aXRoLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
