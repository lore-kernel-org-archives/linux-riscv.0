Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0D0C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zowmChg1QdUX/pbyxHOrANy5elDbiFrGHb/upITD3K8=; b=q2JT6yOjAzXfyW4fYvR2bFu2yh
	oM1eBclYSGTi6eHhVLjZLP10uBsIfB/lfb0NOdwnZrJUiWKl3YLIM4IKvwwniYyyT7bI0k2csMJeo
	w8XonD3EraSeGZ7F1IJFUsfchGpBTZ8zGJ1klcOfNwTy2qCXODch7+rPfg/PCJY1l+Qg3komrj2IJ
	UDGvubZmrzR5ZJlMGdHhRVSlKfWL47OWKjWcvKMXjGuuhGf30E+2AoMKLvTtNgFj38uqWUzJRLIUl
	kYTPgI+SzuANi6v8vRzClk43o3asPJzh6PI1QMcgGMsb/sJIc9FrXT5EyM2hnw4i4LX6SwX25Qka9
	nw9YwVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qya3v-009ob1-1o;
	Thu, 02 Nov 2023 15:56:51 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qya3s-009oYs-0O
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 15:56:49 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da1aa98ec19so1349586276.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698940605; x=1699545405; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYwIeNUmcSQVXWofeU45UHS4WNGoW8dkX+AiEs9OLu8=;
        b=LBWX4AgV789mWcvQcmbeJCE8i9G58j9nBks9/VsNAS+m46T5K+gNsaQjWjbvjWQo/1
         w/g3DAMFhHsdD14EFT9GJQfNEerHsAZJvI37OTpDfkWkYqSRBbmD23cQ3Jri6s24AqVY
         phyu6Yh2GgibIcDwfXYKHgnP0D1DHBhuE1GqK/YfdGnzhdE+Ma7RpitkzoRhr2p6fztd
         Ntuwv2XTazi8FJO8xcX7y7tZZNizZFY3glfhD/sPy/fnOXJ4C7kaquUXeWNvaZX2H/6u
         Fqdw8tXsYmNUausHRRBCRDgIK+6AP9ut1A1NRzOyyHMpD0klMB1HsvGIseXntcmE44hg
         560g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698940605; x=1699545405;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sYwIeNUmcSQVXWofeU45UHS4WNGoW8dkX+AiEs9OLu8=;
        b=aRWI1egP2bitxb7VWzQzgKOlW9PsomvXdCgN/ONHa2IowO31KTUolWyw9UZG0GjLS+
         UX9c26He8vetT184R2nH3j+z2/AMyzRZT4ZdLcvF2MDOmgLWV6IYfDQ7135v0OTyMLgI
         6lKtX9DO1U9ejM99Lcmhs1Ela1ZndwY+f9dR1KvVIdtTnI0FRJ8ATdIsXXw4Kds0E3lv
         otLhVh4KG5Tf9VqrPKt+9bcHBR/0KE2dZMo8YuYMLQI1GCWht7OmJgLHKkTv3F71bggT
         unQIDEzHJGs52rQpqmc2Cbhc09fWym9xhNILe/1Ty8WrG2vb9TTALGhEtjNIukbyUJE2
         jbPQ==
X-Gm-Message-State: AOJu0YyvIjGKIYGgUVHQaaTcgyZOukOV0q5U0/sI4/apq7x+oOEnZiEI
	yjcHzm7teOqkG4QTfLvXdW5af1s+Py0=
X-Google-Smtp-Source: AGHT+IGZwkk8ZQOm5+11CB83zMzVhzLYncHDWYhyGGxNXJ5R5wT9b6yT+r/XAOkVnZeNHiaSF1GNxI0NkwA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:aae7:0:b0:da0:5a30:6887 with SMTP id
 t94-20020a25aae7000000b00da05a306887mr349504ybi.4.1698940604877; Thu, 02 Nov
 2023 08:56:44 -0700 (PDT)
Date: Thu, 2 Nov 2023 08:56:43 -0700
In-Reply-To: <64e3764e36ba7a00d94cc7db1dea1ef06b620aaf.camel@intel.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com> <64e3764e36ba7a00d94cc7db1dea1ef06b620aaf.camel@intel.com>
Message-ID: <ZUPGu6jroYv3KFPv@google.com>
Subject: Re: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, 
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, "mic@digikod.net" <mic@digikod.net>, 
	"liam.merwick@oracle.com" <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "david@redhat.com" <david@redhat.com>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "amoorthy@google.com" <amoorthy@google.com>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "tabba@google.com" <tabba@google.com>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, 
	"chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, 
	Vishal Annapurve <vannapurve@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, 
	"willy@infradead.org" <willy@infradead.org>, "dmatlack@google.com" <dmatlack@google.com>, 
	"anup@brainfault.org" <anup@brainfault.org>, 
	"yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>, Yilun Xu <yilun.xu@intel.com>, 
	"qperret@google.com" <qperret@google.com>, "brauner@kernel.org" <brauner@kernel.org>, 
	"isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "jarkko@kernel.org" <jarkko@kernel.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, Wei W Wang <wei.w.wang@intel.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_085648_158054_CAD40C30 
X-CRM114-Status: GOOD (  28.20  )
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

T24gVGh1LCBOb3YgMDIsIDIwMjMsIEthaSBIdWFuZyB3cm90ZToKPiBPbiBXZWQsIDIwMjMtMTEt
MDEgYXQgMTA6MzYgLTA3MDAsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gPiBPbiBXZWQs
IE5vdiAwMSwgMjAyMywgS2FpIEh1YW5nIHdyb3RlOgo+ID4gPiAKPiA+ID4gPiArNy4zNCBLVk1f
Q0FQX01FTU9SWV9GQVVMVF9JTkZPCj4gPiA+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ID4gPiA+ICsKPiA+ID4gPiArOkFyY2hpdGVjdHVyZXM6IHg4Ngo+ID4gPiA+ICs6UmV0
dXJuczogSW5mb3JtYXRpb25hbCBvbmx5LCAtRUlOVkFMIG9uIGRpcmVjdCBLVk1fRU5BQkxFX0NB
UC4KPiA+ID4gPiArCj4gPiA+ID4gK1RoZSBwcmVzZW5jZSBvZiB0aGlzIGNhcGFiaWxpdHkgaW5k
aWNhdGVzIHRoYXQgS1ZNX1JVTiB3aWxsIGZpbGwKPiA+ID4gPiAra3ZtX3J1bi5tZW1vcnlfZmF1
bHQgaWYgS1ZNIGNhbm5vdCByZXNvbHZlIGEgZ3Vlc3QgcGFnZSBmYXVsdCBWTS1FeGl0LCBlLmcu
IGlmCj4gPiA+ID4gK3RoZXJlIGlzIGEgdmFsaWQgbWVtc2xvdCBidXQgbm8gYmFja2luZyBWTUEg
Zm9yIHRoZSBjb3JyZXNwb25kaW5nIGhvc3QgdmlydHVhbAo+ID4gPiA+ICthZGRyZXNzLgo+ID4g
PiA+ICsKPiA+ID4gPiArVGhlIGluZm9ybWF0aW9uIGluIGt2bV9ydW4ubWVtb3J5X2ZhdWx0IGlz
IHZhbGlkIGlmIGFuZCBvbmx5IGlmIEtWTV9SVU4gcmV0dXJucwo+ID4gPiA+ICthbiBlcnJvciB3
aXRoIGVycm5vPUVGQVVMVCBvciBlcnJubz1FSFdQT0lTT04gKmFuZCoga3ZtX3J1bi5leGl0X3Jl
YXNvbiBpcyBzZXQKPiA+ID4gPiArdG8gS1ZNX0VYSVRfTUVNT1JZX0ZBVUxULgo+ID4gPiAKPiA+
ID4gSUlVQyByZXR1cm5pbmcgLUVGQVVMVCBvciB3aGF0ZXZlciAtZXJybm8gaXMgc29ydCBvZiBL
Vk0gaW50ZXJuYWwKPiA+ID4gaW1wbGVtZW50YXRpb24uCj4gPiAKPiA+IFRoZSBlcnJubyB0aGF0
IGlzIHJldHVybmVkIHRvIHVzZXJzcGFjZSBpcyBBQkkuICBJbiBLVk0sIGl0J3MgYSBfdmVyeV8g
cG9vcmx5Cj4gPiBkZWZpbmVkIEFCSSBmb3IgdGhlIHZhc3QgbWFqb3JpdHkgb2YgaW9jdGxzKCks
IGJ1dCBpdCdzIHN0aWxsIHRlY2huaWNhbGx5IEFCSS4KPiA+IEtWTSBnZXRzIGF3YXkgd2l0aCBi
ZWluZyBjYXZhbGllciB3aXRoIGVycm5vIGJlY2F1c2UgdGhlIHZhc3QgbWFqb3JpdHkgb2YgZXJy
b3JzCj4gPiBhcmUgY29uc2lkZXJlZCBmYXRhbCBieSB1c2VyZXNwYWNlLCBpLmUuIGluIG1vc3Qg
Y2FzZXMsIHVzZXJzcGFjZSBzaW1wbHkgZG9lc24ndAo+ID4gY2FyZSBhYm91dCB0aGUgZXhhY3Qg
ZXJybm8uCj4gPiAKPiA+IEEgZ29vZCBleGFtcGxlIGlzIEtWTV9SVU4gd2l0aCAtRUlOVFI7IGlm
IEtWTSB3ZXJlIHRvIHJldHVybiBzb21ldGhpbmcgb3RoZXIgdGhhbgo+ID4gLUVJTlRSIG9uIGEg
cGVuZGluZyBzaWduYWwgb3IgdmNwdS0+cnVuLT5pbW1lZGlhdGVfZXhpdCwgdXNlcnNwYWNlIHdv
dWxkIGZhbGwgb3Zlci4KPiA+IAo+ID4gPiBJcyBpdCBiZXR0ZXIgdG8gcmVsYXggdGhlIHZhbGlk
aXR5IG9mIGt2bV9ydW4ubWVtb3J5X2ZhdWx0IHdoZW4KPiA+ID4gS1ZNX1JVTiByZXR1cm5zIGFu
eSAtZXJybm8/Cj4gPiAKPiA+IE5vdCB1bmxlc3MgdGhlcmUncyBhIG5lZWQgdG8gZG8gc28sIGFu
ZCBpZiB0aGVyZSBpcyB0aGVuIHdlIGNhbiB1cGRhdGUgdGhlCj4gPiBkb2N1bWVudGF0aW9uIGFj
Y29yZGluZ2x5LiAgSWYgS1ZNJ3MgQUJJIGlzIHRoYXQga3ZtX3J1bi5tZW1vcnlfZmF1bHQgaXMg
dmFsaWQKPiA+IGZvciBhbnkgZXJybm8sIHRoZW4gS1ZNIHdvdWxkIG5lZWQgdG8gcHVyZ2Uga3Zt
X3J1bi5leGl0X3JlYXNvbiBzdXBlciBlYXJseSBpbgo+ID4gS1ZNX1JVTiwgZS5nLiB0byBwcmV2
ZW50IGFuIC1FSU5UUiByZXR1cm4gZHVlIHRvIGltbWVkaWF0ZV9leGl0IGZyb20gYmVpbmcKPiA+
IG1pc2ludGVycHJldGVkIGFzIEtWTV9FWElUX01FTU9SWV9GQVVMVC4gIEFuZCBwdXJnaW5nIGV4
aXRfcmVhc29uIHN1cGVyIGVhcmx5IGlzCj4gPiBzdWJ0bHkgdHJpY2t5IGJlY2F1c2UgS1ZNJ3Mg
KGFnYWluLCBwb29ybHkgZG9jdW1lbnRlZCkgQUJJIGlzIHRoYXQgKnNvbWUqIGV4aXQKPiA+IHJl
YXNvbnMgYXJlIHByZXNlcnZlZCBhY3Jvc3MgS1ZNX1JVTiB3aXRoIHZjcHUtPnJ1bi0+aW1tZWRp
YXRlX2V4aXQgKG9yIHdpdGggYQo+ID4gcGVuZGluZyBzaWduYWwpLgo+ID4gCj4gPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvWkZGYndPWFo1dUklMkZnZGFmQGdvb2dsZS5jb20KPiA+IAo+
ID4gCj4gCj4gQWdyZWVkIHdpdGggbm90IHRvIHJlbGF4IHRvIGFueSBlcnJuby4gIEhvd2V2ZXIg
dXNpbmcgLUVGQVVMVCBhcyBwYXJ0IG9mIEFCSQo+IGRlZmluaXRpb24gc2VlbXMgYSBsaXR0bGUg
Yml0IGRhbmdlcm91cywgZS5nLiwgc29tZW9uZSBjb3VsZCBhY2NpZGVudGFsbHkgb3IKPiBtaXN0
YWtlbmx5IHJldHVybiAtRUZBVUxUIGluIEtWTV9SVU4gYXQgZWFybHkgdGltZSBhbmQvb3IgaW4g
YSBjb21wbGV0ZWx5Cj4gZGlmZmVyZW50IGNvZGUgcGF0aCwgZXRjLiDCoC1FSU5UUiBoYXMgd2Vs
bCBkZWZpbmVkIG1lYW5pbmcsIGJ1dCAtRUZBVUxUICh3aGljaAo+IGlzICJCYWQgYWRkcmVzcyIp
IHNlZW1zIGRvZXNuJ3QgYnV0IEkgYW0gbm90IHN1cmUgZWl0aGVyLiA6LSkKCktWTSBoYXMgcmV0
dXJuZWQgLUVGQVVMVCBzaW5jZSBmb3JldmVyLCBpLmUuIGl0J3MgZWZmZWN0aXZlbHkgYWxyZWFk
eSBwYXJ0IG9mIHRoZQpBQkkuICBJIGRvdWJ0IHRoZXJlJ3MgYSB1c2Vyc3BhY2UgdGhhdCByZWxp
ZXMgcHJlY2lzZWx5IG9uIC1FRkFVTFQsIGJ1dCB1c2Vyc3BhY2UKZGVmaW5pdGVseSB3aWxsIGJl
IGNvbmZ1c2VkIGlmIEtWTSByZXR1cm5zICcwJyB3aGVyZSBLVk0gdXNlZCB0byByZXR1cm4gLUVG
QVVMVC4KQW5kIHNvIGlmIHdlIHdhbnQgdG8gcmV0dXJuICcwJywgaXQgbmVlZHMgdG8gYmUgb3B0
LWluLCB3aGljaCBtZWFucyBmb3JjaW5nCnVzZXJzcGFjZSB0byBlbmFibGUgYSBjYXBhYmlsaXR5
ICphbmQqIHJlcXVpcmVzIGNvZGUgaW4gS1ZNIHRvIGNvbmRpdGlvbmFsbHkgcmV0dXJuCicwJyBp
bnN0ZWFkIG9mIC1FRkFVTFQvLUVIV1BPSVNPTi4KCj4gT25lIGV4YW1wbGUgaXMsIGZvciBiYWNr
aW5nIFZNQSB3aXRoIFZNX0lPIHwgVk1fUEZOTUFQLCBodmFfdG9fcGZuKCkgcmV0dXJucwo+IEtW
TV9QRk5fRVJSX0ZBVUxUIHdoZW4gdGhlIGtlcm5lbCBjYW5ub3QgZ2V0IGEgdmFsaWQgUEZOIChl
LmcuIHdoZW4gU0dYIHZlcGMKPiBmYXVsdCBoYW5kbGVyIGZhaWxlZCB0byBhbGxvY2F0ZSBFUEMp
IGFuZCBrdm1faGFuZGxlX2Vycm9yX3BmbigpIHdpbGwganVzdAo+IHJldHVybiAtRUZBVUxULiAg
SWYga3ZtX3J1bi5leGl0X3JlYXNvbiBpc24ndCBwdXJnZWQgZWFybHkgdGhlbiBpcyBpdCBwb3Nz
aWJsZQo+IHRvIGhhdmUgc29tZSBpc3N1ZSBoZXJlPwoKV2VsbCwgeWVhaCwgYnV0IHRoYXQncyBl
eGFjdGx5IHdoeSB0aGlzIHNlcmllcyBoYXMgYSBwYXRjaCB0byByZXNldCBleGl0X3JlYXNvbi4K
VGhlIHNvbHV0aW9uIHRvICJpZiBLVk0gaXMgYnVnZ3kgdGhlbiBiYWQgdGhpbmdzIGhhcHBlbiIg
aXMgdG8gbm90IGhhdmUgS1ZNIGJ1Z3MgOi0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
