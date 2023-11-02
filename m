Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B8AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlPnY5yHwD7NMsQOw1fXgXkvw+8MTcpyBsokv5nin1M=; b=qFXR9U95wXSUSE
	KCXlThktGkPMy+NyjcuqEJW3a1c43g8VLxsxzLZxmQNE2w4K/Nh0wRQDxU5kx+xYEqa02eKeOHc83
	ukOl46cYIz3GUY0rTMM/BhRrzNPbC0xtC92XfsgZ/FKIxfdoBikc9BXLWsKHT0ePAnh7Rd0rZS5fm
	oNxaO8O4nUQ0Mdk+9FaEEHFv/6GFRQGRCW3wnKeNeBeI+qb41IeDNfGy6bgz+nChn/lBIhqU2TdKi
	n9+KYv7SYG/1flRu8dbdI/EfR6LYJ8us7t9LLW5nyJlsWKsjzTtpfLD9S2X/0+NaXba7o6EhhVThz
	YERZtIIVD1lB/OYTpphw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYVo-009cXC-0Y;
	Thu, 02 Nov 2023 14:17:32 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyYVj-009cTs-0T
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 14:17:29 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7788fb06997so59794785a.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 07:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698934645; x=1699539445; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7O2KSplInLsDb19B+zn/jm8iaKKD/NZ+yWSezVEL04=;
        b=B3YG89oa23ANbK7wODU3HKwdLK3NTEEW4EYF/feV/GAGLQRMBYxkvzZsxFiWAbOAbb
         +3QxJIw5edPauK74hC8WsHcz1pGbODSQlZDCJOPuYwwJIrWFxF1L7X/x/IdFTNc5m8SZ
         P28Wl5v0wRNmBdn68Dq8BQ3o3ViW8GAGJvDzDRXMwXVJZpjWKldGLf6U11z8x1eZDG7t
         dQgz8yfGT8xenb3aBw+mHLwV1EovRwi4rE6udHFqhAD6u1s7BqJ5c5xykRYLeD/HvdZp
         O5+Gfv1JBFKCvGhSPmA6RRSuPmiHVQvq8AEri2sNttJp0Q9TXdrSmhdyGt3/jHXziMuz
         XrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698934645; x=1699539445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7O2KSplInLsDb19B+zn/jm8iaKKD/NZ+yWSezVEL04=;
        b=uYL5kdBhU5WLOlJe5PTTYpeSH6zZTIezt0qUI+vtu1n6RiPdVPQ0WQ03U2lj7y2GIB
         O1DoGDsPzetQOTQ2JWVZYJJr4QiM0iQRgVjTVo3UB2d23Xegmyox3yuHmYniBNYH9Fcg
         ncfl3G7MD/bLvqd4akXmTSpd5o+btp26m8zumpza88GCFBSSPPq5gePgHlW5PAU+Hxdo
         hKtCSyan/Ses5ia5FMRLMo1NSG7gJsaLfkXdwYrn/GHdY1xBWC4iQGJOugyCdPc1B222
         Ukadd63Y1DuvMVaOhLe/4SwCb/vbDtmMVD2plqexkHHtcXFGcKumnIbcJKgOe/QGXRXO
         MJ3A==
X-Gm-Message-State: AOJu0Yy9rT5KTH8DH3VsNhGzdE00YL41b5uzLJTGiaejIAeWqdLalfq5
	gHWChNn06+SJxCn55YHASInAE9sZ9IJNZOvqXD4yrA==
X-Google-Smtp-Source: AGHT+IGAosxm/0woyiCy5wtpQ5hw9PNiMnNT8Y+nXK7zRiDLlPKvw69895suNy2q5wz5DwPz9Dn0X+ha5Vtg4tVBUZc=
X-Received: by 2002:a05:6214:d88:b0:66d:3a0f:97a with SMTP id
 e8-20020a0562140d8800b0066d3a0f097amr20020837qve.6.1698934645120; Thu, 02 Nov
 2023 07:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-19-seanjc@google.com>
In-Reply-To: <20231027182217.3615211-19-seanjc@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 2 Nov 2023 14:16:49 +0000
Message-ID: <CA+EHjTwXdntKGMjb8Zj1M3iVVN5NX6iLwbzJjE72j_eVczTQYw@mail.gmail.com>
Subject: Re: [PATCH v13 18/35] KVM: x86: "Reset" vcpu->run->exit_reason early
 in KVM_RUN
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
X-CRM114-CacheID: sfid-20231102_071727_185832_B6C6DB52 
X-CRM114-Status: GOOD (  20.37  )
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

T24gRnJpLCBPY3QgMjcsIDIwMjMgYXQgNzoyM+KAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IEluaXRpYWxpemUgcnVuLT5leGl0X3JlYXNvbiB0
byBLVk1fRVhJVF9VTktOT1dOIGVhcmx5IGluIEtWTV9SVU4gdG8gcmVkdWNlCj4gdGhlIHByb2Jh
YmlsaXR5IG9mIGV4aXRpbmcgdG8gdXNlcnNwYWNlIHdpdGggYSBzdGFsZSBydW4tPmV4aXRfcmVh
c29uIHRoYXQKPiAqYXBwZWFycyogdG8gYmUgdmFsaWQuCj4KPiBUbyBzdXBwb3J0IGZkLWJhc2Vk
IGd1ZXN0IG1lbW9yeSAoZ3Vlc3QgbWVtb3J5IHdpdGhvdXQgYSBjb3JyZXNwb25kaW5nCj4gdXNl
cnNwYWNlIHZpcnR1YWwgYWRkcmVzcyksIEtWTSB3aWxsIGV4aXQgdG8gdXNlcnNwYWNlIGZvciB2
YXJpb3VzIG1lbW9yeQo+IHJlbGF0ZWQgZXJyb3JzLCB3aGljaCB1c2Vyc3BhY2UgKm1heSogYmUg
YWJsZSB0byByZXNvbHZlLCBpbnN0ZWFkIG9mIHVzaW5nCj4gZS5nLiBCVVNfTUNFRVJSX0FSLiAg
QW5kIGluIHRoZSBtb3JlIGRpc3RhbnQgZnV0dXJlLCBLVk0gd2lsbCBhbHNvIGxpa2VseQo+IHV0
aWxpemUgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eSB0byBsZXQgdXNlcnNwYWNlICJpbnRlcmNlcHQi
IGFuZCBoYW5kbGUKPiBtZW1vcnkgZmF1bHRzIHdoZW4gdGhlIHVzZXJzcGFjZSBtYXBwaW5nIGlz
IG1pc3NpbmcsIGkuZS4gd2hlbiBmYXN0IGd1cCgpCj4gZmFpbHMuCj4KPiBCZWNhdXNlIG1hbnkg
b2YgS1ZNJ3MgaW50ZXJuYWwgQVBJcyByZWxhdGVkIHRvIGd1ZXN0IG1lbW9yeSB1c2UgJzAnIHRv
Cj4gaW5kaWNhdGUgInN1Y2Nlc3MsIGNvbnRpbnVlIG9uIiBhbmQgbm90ICJleGl0IHRvIHVzZXJz
cGFjZSIsIHJlcG9ydGluZwo+IG1lbW9yeSBmYXVsdHMvZXJyb3JzIHRvIHVzZXJzcGFjZSB3aWxs
IHNldCBydW4tPmV4aXRfcmVhc29uIGFuZAo+IGNvcnJlc3BvbmRpbmcgZmllbGRzIGluIHRoZSBy
dW4gc3RydWN0dXJlIGZpZWxkcyBpbiBjb25qdW5jdGlvbiB3aXRoIGEKPiBhIG5vbi16ZXJvLCBu
ZWdhdGl2ZSByZXR1cm4gY29kZSwgZS5nLiAtRUZBVUxUIG9yIC1FSFdQT0lTT04uICBBbmQgYmVj
YXVzZQo+IEtWTSBhbHJlYWR5IHJldHVybnMgIC1FRkFVTFQgaW4gbWFueSBwYXRocywgdGhlcmUn
cyBhIHJlbGF0aXZlbHkgaGlnaAo+IHByb2JhYmlsaXR5IHRoYXQgS1ZNIGNvdWxkIHJldHVybiAt
RUZBVUxUIHdpdGhvdXQgc2V0dGluZyBydW4tPmV4aXRfcmVhc29uLAo+IGluIHdoaWNoIGNhc2Ug
cmVwb3J0aW5nIEtWTV9FWElUX1VOS05PV04gaXMgbXVjaCBiZXR0ZXIgdGhhbiByZXBvcnRpbmcK
PiB3aGF0ZXZlciBleGl0IHJlYXNvbiBoYXBwZW5lZCB0byBiZSBpbiB0aGUgcnVuIHN0cnVjdHVy
ZS4KPgo+IE5vdGUsIEtWTSBtdXN0IHdhaXQgdW50aWwgYWZ0ZXIgcnVuLT5pbW1lZGlhdGVfZXhp
dCBpcyBzZXJ2aWNlZCB0bwo+IHNhbml0aXplIHJ1bi0+ZXhpdF9yZWFzb24gYXMgS1ZNJ3MgQUJJ
IGlzIHRoYXQgcnVuLT5leGl0X3JlYXNvbiBpcwo+IHByZXNlcnZlZCBhY3Jvc3MgS1ZNX1JVTiB3
aGVuIHJ1bi0+aW1tZWRpYXRlX2V4aXQgaXMgdHJ1ZS4KPgo+IExpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDIzMDkwODIyMjkwNS4xMzIxMzA1LTEtYW1vb3J0aHlAZ29vZ2xlLmNv
bQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9aRkZid09YWjV1SSUyRmdkYWZA
Z29vZ2xlLmNvbQo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bn
b29nbGUuY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEZ1YWQgVGFiYmEgPHRhYmJhQGdvb2dsZS5j
b20+ClRlc3RlZC1ieTogRnVhZCBUYWJiYSA8dGFiYmFAZ29vZ2xlLmNvbT4KCkNoZWVycywKL2Z1
YWQKCj4gIGFyY2gveDg2L2t2bS94ODYuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9r
dm0veDg2LmMKPiBpbmRleCBlZTNjZDhjM2MwZWYuLmY0MWRiYjE0NjVhMCAxMDA2NDQKPiAtLS0g
YS9hcmNoL3g4Ni9rdm0veDg2LmMKPiArKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKPiBAQCAtMTA5
NjMsNiArMTA5NjMsNyBAQCBzdGF0aWMgaW50IHZjcHVfcnVuKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSkKPiAgewo+ICAgICAgICAgaW50IHI7Cj4KPiArICAgICAgIHZjcHUtPnJ1bi0+ZXhpdF9yZWFz
b24gPSBLVk1fRVhJVF9VTktOT1dOOwo+ICAgICAgICAgdmNwdS0+YXJjaC5sMXRmX2ZsdXNoX2wx
ZCA9IHRydWU7Cj4KPiAgICAgICAgIGZvciAoOzspIHsKPiAtLQo+IDIuNDIuMC44MjAuZzgzYTcy
MWExMzctZ29vZwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
