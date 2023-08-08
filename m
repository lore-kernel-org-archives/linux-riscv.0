Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799D3C001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 21:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8U0ysafd3EKS0ZNm4Daaaa/07AK/CmUHRVUm/x/c+vk=; b=39XkWchirGR7tIOHVY5hfSp2au
	3qPHjvMtME1UTXCORnVGyxjg+zHLfraWt85Gl1CDqK9aLOsUYjiu0MpGcII6TTS46bKZwB0LPvNDX
	+FbF1fG5qIHTG1X5hJkPQ4O+CXaKAwqDvoRZxe3wQxoMp7wlfC/OukIX5WinjdRGaqt6ApEIRdGDk
	5JWOzPZcCcK7itYF0y8q6MI73GG19IICvkvP5NRIYRF8RKLjCgoKDckYNuz3R+NLW6pd5p+2im4+s
	0Gkwv6Xez0X2yBGRlQH59O6eGuE5DSCAsTcukz3w3WvnJ3AdM3xa3J35qFL4/4gAVRbGFX6g8K696
	pQ4bTG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTU1K-003UMe-0D;
	Tue, 08 Aug 2023 21:13:38 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTU1F-003UKM-0f
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 21:13:35 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-56463e0340cso6299734a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 14:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691529208; x=1692134008;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2U8op5NWCZxGer1aWuXuZ1d6J73Ge5+Hk7EgkvJJLAs=;
        b=EiApR7LgfgrJOIT4RH8vwTp7YvtN3WX8F65amcCZ5tUQpyv/ZsbnzElbxtLH3YiRAr
         Xco5OB//pxBTUJ1Hz9I9wbK8VFMOtBI25Tou7znxlR4xLwF5hwG16hAzm3VNuOm7qNVv
         RXaphvZexnvsjJwdUedz4miwZlrHjyPKGJ4tg41nXpc1Cr1tDeUR45j+cXRmHY2zeNeJ
         aD2FSNHH9s2X0AH/332mpiw5dSfBYPcqgRab/m5d5fFkQb+ZWPzwvwukMvExFid52TaS
         W3qOIOCRBt/UK+p15DAoWro/GC9Q6ni0EalNj49A0OSEsHwDkeyMMKxa0prAwizF/XXF
         JV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691529208; x=1692134008;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2U8op5NWCZxGer1aWuXuZ1d6J73Ge5+Hk7EgkvJJLAs=;
        b=MulMvl00QmSxSyx3wKKPi967wBI+zH+ezLN6yZ1s1djNaLUd9FP6KwIGZlLO9XRhSp
         Z0Fv3jdLzTPPlwHdPArYleyPeyS9R/hKyOVQdjmCQocMYovIG6plnWEaoZ5vrdrEEzy0
         hxIbT0GEeIyxBqtbOtAD4drd5GFuDP277mjc7JeQCZerWN1s3zjKL+bxs+tViSC5tZhG
         B3C6CtTKUwLWHe/4O1kKV4AlV8WTrYPtyfYUOs8wIuj3N7rlFX2j4Nki7AzHJFoGzdSG
         NNGA8Gi5Yv6ODigJqD2dWZ8Uf+9NFz4Xu32vstmQ3evunZ6aFT9g1Ln3ykAkv5X4R4RN
         WHfQ==
X-Gm-Message-State: AOJu0YwJg8aRAmrjia0rzjU6j+OInShfkZwX5H0VgmDgaIEDmYLVzzid
	pZ2VxgxFzMvZNI7e6KnXErKOfjwHbqY=
X-Google-Smtp-Source: AGHT+IF3VhVvM3seA6Kd3G1yrwf0aF3MmO0cqr5SVZX1MHXlsabrjEav/SHlO1qK0PHGPVCVUrfGthX1EsA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:b242:0:b0:563:e937:5e87 with SMTP id
 t2-20020a63b242000000b00563e9375e87mr12735pgo.5.1691529208021; Tue, 08 Aug
 2023 14:13:28 -0700 (PDT)
Date: Tue, 8 Aug 2023 14:13:26 -0700
In-Reply-To: <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
Mime-Version: 1.0
References: <20230718234512.1690985-13-seanjc@google.com> <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZNKv9ul2I7A4V7IF@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: pbonzini@redhat.com, maz@kernel.org, oliver.upton@linux.dev, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	willy@infradead.org, akpm@linux-foundation.org, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chao.p.peng@linux.intel.com, tabba@google.com, jarkko@kernel.org, 
	yu.c.zhang@linux.intel.com, vannapurve@google.com, mail@maciej.szmigiero.name, 
	vbabka@suse.cz, david@redhat.com, qperret@google.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_141333_248230_A9B8FE80 
X-CRM114-Status: GOOD (  29.58  )
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

T24gTW9uLCBBdWcgMDcsIDIwMjMsIEFja2VybGV5IFRuZyB3cm90ZToKPiBJ4oCZZCBsaWtlIHRv
IHByb3Bvc2UgYW4gYWx0ZXJuYXRpdmUgdG8gdGhlIHJlZmNvdW50aW5nIGFwcHJvYWNoIGJldHdl
ZW4KPiB0aGUgZ21lbSBmaWxlIGFuZCBhc3NvY2lhdGVkIGt2bSwgd2hlcmUgd2UgdGhpbmsgb2Yg
S1ZN4oCZcyBtZW1zbG90cyBhcwo+IHVzZXJzIG9mIHRoZSBnbWVtIGZpbGUuCj4gCj4gSW5zdGVh
ZCBvZiBoYXZpbmcgdGhlIGdtZW0gZmlsZSBwaW4gdGhlIFZNIChpLmUuIHRha2UgYSByZWZjb3Vu
dCBvbgo+IGt2bSksIHdlIGNvdWxkIGxldCBtZW1zbG90IHRha2UgYSByZWZjb3VudCBvbiB0aGUg
Z21lbSBmaWxlIHdoZW4gdGhlCj4gbWVtc2xvdHMgYXJlIGNvbmZpZ3VyZWQuCj4gCj4gSGVyZeKA
mXMgYSBQT0MgcGF0Y2ggdGhhdCBmbGlwcyB0aGUgcmVmY291bnRpbmcgKGFuZCBtb2RpZmllZCBz
ZWxmdGVzdHMgaW4KPiB0aGUgbmV4dCBjb21taXQpOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9nb29n
bGVwcm9ka2VybmVsL2xpbnV4LWNjL2NvbW1pdC83ZjQ4N2IwMjliODliOWYzZTliMDk0YTcyMWJj
MDc3MmYzYzhjNzk3Cj4gCj4gT25lIHNpZGUgZWZmZWN0IG9mIGhhdmluZyB0aGUgZ21lbSBmaWxl
IHBpbiB0aGUgVk0gaXMgdGhhdCBub3cgdGhlIGdtZW0KPiBmaWxlIGJlY29tZXMgc29ydCBvZiBh
IGZhbHNlIGhhbmRsZSBvbiB0aGUgVk06Cj4gCj4gKyBDbG9zaW5nIHRoZSBmaWxlIGRlc3Ryb3lz
IHRoZSBmaWxlIHBvaW50ZXJzIGluIHRoZSBWTSBhbmQgaW52YWxpZGF0ZXMKPiAgIHRoZSBwb2lu
dGVycwoKWWVhaCwgdGhpcyBpcyBsZXNzIHRoYW4gaWRlYWwuICBCdXQsIGl0J3MgYWxzbyBob3cg
dGhpbmdzIG9wZXJhdGUgdG9kYXkuICBLVk0KZG9lc24ndCBob2xkIHJlZmVyZW5jZXMgdG8gVk1B
cyBvciBmaWxlcywgZS5nLiBpZiB1c2Vyc3BhY2UgbXVubWFwKClzIG1lbW9yeSwKYW55IGFuZCBh
bGwgU1BURXMgcG9pbnRpbmcgYXQgdGhlIG1lbW9yeSBhcmUgemFwcGVkLiAgVGhlIG9ubHkgZGlm
ZmVyZW5jZSB3aXRoCmdtZW0gaXMgdGhhdCBLVk0gbmVlZHMgdG8gZXhwbGljaXRseSBpbnZhbGlk
YXRlIGZpbGUgcG9pbnRlcnMsIGluc3RlYWQgb2YgdGhhdApoYXBwZW5pbmcgYmVoaW5kIHRoZSBz
Y2VuZXMgKG5vIG1vcmUgVk1BcyB0byBmaW5kKS4gIEFnYWluLCBJIGFncmVlIHRoZSByZXN1bHRp
bmcKY29kZSBpcyBtb3JlIGNvbXBsZXggdGhhbiBJIHdvdWxkIHByZWZlciwgYnV0IGZyb20gYSB1
c2Vyc3BhY2UgcGVyc3BlY3RpdmUgSQpkb24ndCBzZWUgdGhpcyBhcyBwcm9ibGVtYXRpYy4KCj4g
KyBLZWVwaW5nIHRoZSBmaWxlIG9wZW4ga2VlcHMgdGhlIFZNIGFyb3VuZCBpbiB0aGUga2VybmVs
IGV2ZW4gdGhvdWdoCj4gICB0aGUgVk0gZmQgbWF5IGFscmVhZHkgYmUgY2xvc2VkLgoKVGhhdCBp
cyBwZXJmZWN0bHkgb2suICBUaGVyZSBpcyBwbGVudHkgb2YgcHJpb3IgYXJ0LCBhcyB3ZWxsIGFz
IHBsZW50eSBvZiB3YXlzCmZvciB1c2Vyc3BhY2UgdG8gc2hvb3QgaXRzZWxmIGluIHRoZSBmb290
LiAgRS5nLiBvcGVuIGEgc3RhdHMgZmQgZm9yIGEgdkNQVSBhbmQKdGhlIFZNIGFuZCBhbGwgaXRz
IHZDUFVzIHdpbGwgYmUga2VwdCBhbGl2ZS4gIEFuZCBjb25jZXB0dWFsbHkgaXQncyBzb3VuZCwK
YW55dGhpbmcgY3JlYXRlZCBpbiB0aGUgc2NvcGUgb2YgYSBWTSBfc2hvdWxkXyBwaW4gdGhlIFZN
LgoKPiBJIGZlZWwgdGhhdCBtZW1zbG90cyBmb3JtIGEgbmF0dXJhbCB3YXkgb2YgbWFuYWdpbmcg
dXNhZ2Ugb2YgdGhlIGdtZW0KPiBmaWxlLiBXaGVuIGEgbWVtc2xvdCBpcyBjcmVhdGVkLCBpdCBp
cyB1c2luZyB0aGUgZmlsZTsgaGVuY2Ugd2UgdGFrZSBhCj4gcmVmY291bnQgb24gdGhlIGdtZW0g
ZmlsZSwgYW5kIGFzIG1lbXNsb3RzIGFyZSByZW1vdmVkLCB3ZSBkcm9wCj4gcmVmY291bnRzIG9u
IHRoZSBnbWVtIGZpbGUuCgpZZXMgYW5kIG5vLiAgSXQncyBkZWZpbml0ZWx5IG1vcmUgbmF0dXJh
bCAqaWYqIHRoZSBnb2FsIGlzIHRvIGFsbG93IGd1ZXN0X21lbWZkCm1lbW9yeSB0byBleGlzdCB3
aXRob3V0IGJlaW5nIGF0dGFjaGVkIHRvIGEgVk0uICBCdXQgSSdtIG5vdCBhdCBhbGwgY29udmlu
Y2VkCnRoYXQgd2Ugd2FudCB0byBhbGxvdyB0aGF0LCBvciB0aGF0IGl0IGhhcyBkZXNpcmFibGUg
cHJvcGVydGllcy4gIFdpdGggVERYIGFuZApTTlAgaW4gcGFydGljdWFybHksIEknbSBwcmV0dHkg
c3VyZSB0aGF0IGFsbG93aW5nIG1lbW9yeSB0byBvdXRsaXZlIHRoZSBWTSBpcwp2ZXJ5IHVuZGVy
aXNhYmxlIChtb3JlIGJlbG93KS4KCj4gVGhlIEtWTSBwb2ludGVyIGlzIHNoYXJlZCBhbW9uZyBh
bGwgdGhlIGJpbmRpbmdzIGluIGdtZW3igJlzIHhhcnJheSwgYW5kIHdlIGNhbgo+IGVuZm9yY2Ug
dGhhdCBhIGdtZW0gZmlsZSBpcyB1c2VkIG9ubHkgd2l0aCBvbmUgVk06Cj4gCj4gKyBXaGVuIGJp
bmRpbmcgYSBtZW1zbG90IHRvIHRoZSBmaWxlLCBpZiBhIGt2bSBwb2ludGVyIGV4aXN0cywgaXQg
bXVzdAo+ICAgYmUgdGhlIHNhbWUga3ZtIGFzIHRoZSBvbmUgaW4gdGhpcyBiaW5kaW5nCj4gKyBX
aGVuIHRoZSBiaW5kaW5nIHRvIHRoZSBsYXN0IG1lbXNsb3QgaXMgcmVtb3ZlZCBmcm9tIGEgZmls
ZSwgTlVMTCB0aGUKPiAgIGt2bSBwb2ludGVyLgoKTnVsbGlmeWluZyB0aGUgS1ZNIHBvaW50ZXIg
aXNuJ3Qgc3VmZmljaWVudCwgYmVjYXVzZSB3aXRob3V0IGFkZGl0aW9uYWwgYWN0aW9ucwp1c2Vy
c3BhY2UgY291bGQgZXh0cmFjdCBkYXRhIGZyb20gYSBWTSBieSBkZWxldGluZyBpdHMgbWVtc2xv
dHMgYW5kIHRoZW4gYmluZGluZwp0aGUgZ3Vlc3RfbWVtZmQgdG8gYW4gYXR0YWNrZXIgY29udHJv
bGxlZCBWTS4gIE9yIG1vcmUgbGlrZWx5IHdpdGggVERYIGFuZCBTTlAsCmluZHVjZSBiYWRuZXNz
IGJ5IGNvZXJjaW5nIEtWTSBpbnRvIG1hcHBpbmcgbWVtb3J5IGludG8gYSBndWVzdCB3aXRoIHRo
ZSB3cm9uZwpBU0lEL0hLSUQuCgpJIGNhbiB0aGluayBvZiB0aHJlZSB3YXlzIHRvIGhhbmRsZSB0
aGF0OgoKICAoYSkgcHJldmVudCBhIGRpZmZlcmVudCBWTSBmcm9tICpldmVyKiBiaW5kaW5nIHRv
IHRoZSBnbWVtIGluc3RhbmNlCiAgKGIpIGZyZWUvemVybyBwaHlzaWNhbCBwYWdlcyB3aGVuIHVu
YmluZGluZwogIChjKSBmcmVlL3plcm8gd2hlbiBiaW5kaW5nIHRvIGEgZGlmZmVyZW50IFZNCgpP
cHRpb24gKGEpIGlzIGVhc3ksIGJ1dCB0aGF0IHByZXR0eSBtdWNoIGRlZmVhdHMgdGhlIHB1cnBv
c2Ugb2YgZGVjb3B1bGluZwpndWVzdF9tZW1mZCBmcm9tIGEgVk0uCgpPcHRpb24gKGIpIGlzbid0
IGhhcmQgdG8gaW1wbGVtZW50LCBidXQgaXQgc2NyZXdzIHVwIHRoZSBsaWZlY3ljbGUgb2YgdGhl
IG1lbW9yeSwKZS5nLiB3b3VsZCByZXF1aXJlIG1lbW9yeSB3aGVuIGEgbWVtc2xvdCBpcyBkZWxl
dGVkLiAgVGhhdCBpc24ndCBuZWNlc3NhcmlseSBhCmRlYWwtYnJlYWtlciwgYnV0IGl0IHJ1bnMg
Y291bnRlciB0byBob3cgS1ZNIG1lbWxvdHMgY3VycmVudGx5IG9wZXJhdGUuICBNZW1zbG90cwph
cmUgYmFzaWNhbGx5IGp1c3Qgd2VpcmQgcGFnZSB0YWJsZXMsIGUuZy4gZGVsZXRpbmcgYSBtZW1z
bG90IGRvZXNuJ3QgaGF2ZSBhbnkKaW1wYWN0IG9uIHRoZSB1bmRlcmx5aW5nIGRhdGEgaW4gbWVt
b3J5LiAgVERYIHRocm93cyBhIHdyZW5jaCBpbiB0aGlzIGFzIHJlbW92aW5nCmEgcGFnZSBmcm9t
IHRoZSBTZWN1cmUgRVBUIGlzIGVmZmVjdGl2ZWx5IGRlc3RydWN0aXZlIHRvIHRoZSBkYXRhIChj
YW4ndCBiZSBtYXBwZWQKYmFjayBpbiB0byB0aGUgVk0gd2l0aG91dCB6ZXJvaW5nIHRoZSBkYXRh
KSwgYnV0IElNTyB0aGF0J3MgYW4gb2RkaXR5IHdpdGggVERYIGFuZApub3QgbmVjZXNzYXJpbHkg
c29tZXRoaW5nIHdlIHdhbnQgdG8gY2Fycnkgb3ZlciB0byBvdGhlciBWTSB0eXBlcy4KClRoZXJl
IHdvdWxkIGFsc28gYmUgcGVyZm9ybWFuY2UgaW1wbGljYXRpb25zIChwcm9iYWJseSBhIG5vbi1p
c3N1ZSBpbiBwcmFjdGljZSksCmFuZCB3ZWlyZG5lc3MgaWYvd2hlbiB3ZSBnZXQgdG8gc2hhcmlu
ZywgbGlua2luZyBhbmQvb3IgbW1hcCgpaW5nIGdtZW0uICBFLmcuIHdoYXQKc2hvdWxkIGhhcHBl
biBpZiB0aGUgbGFzdCBtZW1zbG90IChiaW5kaW5nKSBpcyBkZWxldGVkLCBidXQgdGhlcmUgb3V0
c3RhbmRpbmcgdXNlcnNwYWNlCm1hcHBpbmdzPwoKT3B0aW9uIChjKSBpcyBiZXR0ZXIgZnJvbSBh
IGxpZmVjeWNsZSBwZXJzcGVjdGl2ZSwgYnV0IGl0IGFkZHMgaXRzIG93biBmbGF2b3Igb2YKY29t
cGxleGl0eSwgZS5nLiB0aGUgcGVyZm9ybWFudCB3YXkgdG8gcmVjbGFpbSBURFggbWVtb3J5IHJl
cXVpcmVzIHRoZSBURE1SCihlZmZlY3RpdmVseSB0aGUgVk0gcG9pbnRlciksIGFuZCBzbyBhIGRl
ZmVycmVkIHJlbGNhaW0gZG9lc24ndCByZWFsbHkgd29yayBmb3IKVERYLiAgQW5kIEknbSBwcmV0
dHkgc3VyZSBpdCAqY2FuJ3QqIHdvcmsgZm9yIFNOUCwgYmVjYXVzZSBSTVAgZW50cmllcyBtdXN0
IG5vdApvdXRsaXZlIHRoZSBWTTsgS1ZNIGNhbid0IHJldXNlIGFuIEFTSUQgaWYgdGhlcmUgYXJl
IHBhZ2VzIGFzc2lnbmVkIHRvIHRoYXQgQVNJRAppbiB0aGUgUk1QLCBpLmUuIHVudGlsIGFsbCBt
ZW1vcnkgYmVsb25naW5nIHRvIHRoZSBWTSBoYXMgYmVlbiBmdWxseSBmcmVlZC4KCj4gQ291bGQg
YmluZGluZyBnbWVtIGZpbGVzIG5vdCBvbiBjcmVhdGlvbiwgYnV0IGF0IG1lbXNsb3QgY29uZmln
dXJhdGlvbgo+IHRpbWUgYmUgc3VmZmljaWVudCBhbmQgc2ltcGxlcj8KCkFmdGVyIHdvcmtpbmcg
dGhyb3VnaCB0aGUgZmxvd3MsIEkgdGhpbmsgYmluZGluZyBvbi1kZW1hbmQgd291bGQgc2ltcGxp
ZnkgdGhlCnJlZmNvdW50aW5nIChzdGF0aW5nIHRoZSBvYnZpb3VzKSwgYnV0IGNvbXBsaWNhdGUg
dGhlIGxpZmVjeWNsZSBvZiB0aGUgbWVtb3J5IGFzCndlbGwgYXMgdGhlIGNvbnRyYWN0IGJldHdl
ZW4gS1ZNIGFuZCB1c2Vyc3BhY2UsIGFuZCB3b3VsZCBicmVhayB0aGUgc2VwYXJhdGlvbiBvZgpj
b25jZXJucyBiZXR3ZWVuIHRoZSBpbm9kZSAocGh5c2ljYWwgbWVtb3J5IC8gZGF0YSkgYW5kIGZp
bGUgKFZNJ3MgdmlldyAvIG1hcHBpbmdzKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
