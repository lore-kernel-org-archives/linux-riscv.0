Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23FCC25B7E
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 22:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t4aNwr9pJmQQ1QlM9i6W7K6imXYLXQRGmhDkj3ZXK7o=; b=a3O5vsJsmmgt0S9DL7b7RofMqk
	A+uA0kqsMXu6vgH04UYE8C9bS9U8Jirr9WHHv7EUwZ4UHsieSldXCPUd/XMbOCYy+wsFRNMTOYPrE
	0CmYy/orykCw7m+G9f6osGpypuGX2TSdHwQQyKGF0IXcB5mKHLQPYjFcWuIQuv4Q+Y78XeY33Z5kU
	/joDEeuugQ0Y+2VVWjg8CcWA28RR0ifTIGrIEBPjdjS+ks2ZazxzBHcd8FufT+I8lIMiUyP9DSjU3
	rSNrG+O+ZT0Xon4e7TNo1JPHd7scKWaeobd++PckcuacnxM1ReheJi6x9RdqMn/qylUL4EhfJ/Wvx
	uI10dBrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCSFQ-00000005lkv-35x6;
	Wed, 29 May 2024 22:58:20 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCSFM-00000005lem-01H1
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 22:58:17 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-627f20cff42so3832537b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 15:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717023484; x=1717628284; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXQ4aAmXpFR+Rnn+LVSp/P9w+zocv3IAjl6jcVlXHAQ=;
        b=X55ojBrsRsz7qlX450m3rkuGFgaMOJjsY//QOFxltNZR8hM4CP92Bz94zoTZiKkUsk
         I5uT/Ppeh01kLIeXe0QHT+uhrGnZ5rqq8nslSTm/vad/hQ0VJel7S+d4bfE9iubJm4RV
         2+fD3Qa3AZzSmlxKpc8Eu5Uc3MmkSF0TbhydP4PzDODqE/w2cfmBzHc6Tp1IkWRwe/I2
         gTgvt1d4mxWoEqQGWX7N4xRxN2WTEAHZPOw4IPclDVntk2ih/atCKOYfFj8PxgO210Vw
         JN8qh7bqM1u/dt3rHjxVgFS7W4zxPD9EVFteADgyrXRWyGEO02nOYPOQ2djtWX/hCiof
         RSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717023484; x=1717628284;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lXQ4aAmXpFR+Rnn+LVSp/P9w+zocv3IAjl6jcVlXHAQ=;
        b=gfs17MHEibpD+qkUzCWMb/6AM+8XZFrgFyueZCZ9U0H/ELPOSzSsUJ9xoqHvhI5uOp
         Cioe7+jzaEvWrKhdaNZijlTrfrW2Lco5e4++KQehenobWRGk2jO3SwJvxJEDBdc20jJ8
         3naCvwA4V+/jMlPWfg7OT98rSfdslQ5Y9l3Dz56Z9BR/BIDPy/ltBcMmOH6u1BZY351A
         u7uOaUjVjDg0K9P24N7JdbO+HlvYPh4Ss/4ohAJsEKjsWTqrt5jbn16mDsGFtUBOusa8
         wElwwy2eJFnXBEEFjdfvemTVp8W6vDzln3elmDnHlWzwOxXXYZ/bCGFHHswPUrOumZv9
         hagA==
X-Forwarded-Encrypted: i=1; AJvYcCWVhASjrb4fdAcPRwaJkuqQkaciqHnjVzuKHCqWFZ4PAbcx53BBSeP5Irop+3JdYhlHkSu+FTnwgd0tUek3zXeu+mAEoo0V3YqWCtS4YSEs
X-Gm-Message-State: AOJu0YxWNf5rx9Ti/BMXzTPpPBWcg67SZ9kJU/IQOioo5l6ufqMG7d/p
	daHQzuX2OhrLIJt2LDh5jsCQHTG4V8xIEWQ2nlo/NtWOtVnSPLVA7PijZBC+RBhfLgLKGM1B6Xb
	8aw==
X-Google-Smtp-Source: AGHT+IEcoxWAWGQljmQC1ObvPASoASZSWeSUzQr2Szq7dgxCnuAYyloQCwOCyj3B7twEp9K1BnNOHbqA4OU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1007:b0:dfa:5838:b919 with SMTP id
 3f1490d57ef6-dfa5a68828dmr142777276.10.1717023484293; Wed, 29 May 2024
 15:58:04 -0700 (PDT)
Date: Wed, 29 May 2024 15:58:02 -0700
In-Reply-To: <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
Message-ID: <Zley-u_dOlZ-S-a6@google.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhao <yuzhao@google.com>
Cc: James Houghton <jthoughton@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Bibo Mao <maobibo@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_155816_055574_0CD60D91 
X-CRM114-Status: GOOD (  28.61  )
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

T24gV2VkLCBNYXkgMjksIDIwMjQsIFl1IFpoYW8gd3JvdGU6Cj4gT24gV2VkLCBNYXkgMjksIDIw
MjQgYXQgMzo1OeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3
cm90ZToKPiA+Cj4gPiBPbiBXZWQsIE1heSAyOSwgMjAyNCwgWXUgWmhhbyB3cm90ZToKPiA+ID4g
T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMTI6MDXigK9QTSBKYW1lcyBIb3VnaHRvbiA8anRob3Vn
aHRvbkBnb29nbGUuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFNlY29uZGFyeSBNTVVzIGFy
ZSBjdXJyZW50bHkgY29uc3VsdGVkIGZvciBhY2Nlc3MvYWdlIGluZm9ybWF0aW9uIGF0Cj4gPiA+
ID4gZXZpY3Rpb24gdGltZSwgYnV0IGJlZm9yZSB0aGVuLCB3ZSBkb24ndCBnZXQgYWNjdXJhdGUg
YWdlIGluZm9ybWF0aW9uLgo+ID4gPiA+IFRoYXQgaXMsIHBhZ2VzIHRoYXQgYXJlIG1vc3RseSBh
Y2Nlc3NlZCB0aHJvdWdoIGEgc2Vjb25kYXJ5IE1NVSAobGlrZQo+ID4gPiA+IGd1ZXN0IG1lbW9y
eSwgdXNlZCBieSBLVk0pIHdpbGwgYWx3YXlzIGp1c3QgcHJvY2VlZCBkb3duIHRvIHRoZSBvbGRl
c3QKPiA+ID4gPiBnZW5lcmF0aW9uLCBhbmQgdGhlbiBhdCBldmljdGlvbiB0aW1lLCBpZiBLVk0g
cmVwb3J0cyB0aGUgcGFnZSB0byBiZQo+ID4gPiA+IHlvdW5nLCB0aGUgcGFnZSB3aWxsIGJlIGFj
dGl2YXRlZC9wcm9tb3RlZCBiYWNrIHRvIHRoZSB5b3VuZ2VzdAo+ID4gPiA+IGdlbmVyYXRpb24u
Cj4gPiA+Cj4gPiA+IENvcnJlY3QsIGFuZCBhcyBJIGV4cGxhaW5lZCBvZmZsaW5lLCB0aGlzIGlz
IHRoZSBvbmx5IHJlYXNvbmFibGUKPiA+ID4gYmVoYXZpb3IgaWYgd2UgY2FuJ3QgbG9ja2xlc3Ns
eSB3YWxrIHNlY29uZGFyeSBNTVVzLgo+ID4gPgo+ID4gPiBKdXN0IGZvciB0aGUgcmVjb3JkLCB0
aGUgKGNydWRlKSBhbmFsb2d5IEkgdXNlZCB3YXM6Cj4gPiA+IEltYWdpbmUgYSBsYXJnZSByb29t
IHdpdGggbWFueSBiaWxscyAoJDEsICQ1LCAkMTAsIC4uLikgb24gdGhlIGZsb29yLAo+ID4gPiBi
dXQgeW91IGFyZSBvbmx5IGFsbG93ZWQgdG8gcGljayB1cCAxMCBvZiB0aGVtIChhbmQgcHV0IHRo
ZW0gaW4geW91cgo+ID4gPiBwb2NrZXQpLiBBIHNtYXJ0IG1vdmUgd291bGQgYmUgdG8gc3VydmV5
IHRoZSByb29tICpmaXJzdCBhbmQgdGhlbioKPiA+ID4gcGljayB1cCB0aGUgbGFyZ2VzdCBvbmVz
LiBCdXQgaWYgeW91IGFyZSBjYXJyeWluZyBhIDUwMCBsYnMgYmFja3BhY2ssCj4gPiA+IHlvdSB3
b3VsZCBqdXN0IHdhbnQgdG8gcGljayB1cCB3aGljaGV2ZXIgdGhhdCdzIGluIGZyb250IG9mIHlv
dSByYXRoZXIKPiA+ID4gdGhhbiB3YWxrIHRoZSBlbnRpcmUgcm9vbS4KPiA+ID4KPiA+ID4gTUdM
UlUgc2hvdWxkIG9ubHkgc2NhbiAob3IgbG9va2Fyb3VuZCkgc2Vjb25kYXJ5IE1NVXMgaWYgaXQg
Y2FuIGJlCj4gPiA+IGRvbmUgbG9ja2xlc3MuIE90aGVyd2lzZSwgaXQgc2hvdWxkIGp1c3QgZmFs
bCBiYWNrIHRvIHRoZSBleGlzdGluZwo+ID4gPiBhcHByb2FjaCwgd2hpY2ggZXhpc3RlZCBpbiBw
cmV2aW91cyB2ZXJzaW9ucyBidXQgaXMgcmVtb3ZlZCBpbiB0aGlzCj4gPiA+IHZlcnNpb24uCj4g
Pgo+ID4gSUlVQywgYnkgImV4aXN0aW5nIGFwcHJvYWNoIiB5b3UgbWVhbiBjb21wbGV0ZWx5IGln
bm9yZSBzZWNvbmRhcnkgTU1VcyB0aGF0Cj4gPiBkb24ndCBpbXBsZW1lbnQgYSBsb2NrbGVzcyB3
YWxrPwo+IAo+IE5vLCB0aGUgZXhpc3RpbmcgYXBwcm9hY2ggb25seSBjaGVja3Mgc2Vjb25kYXJ5
IE1NVXMgZm9yIExSVSBmb2xpb3MsCj4gaS5lLiwgdGhvc2UgYXQgdGhlIGVuZCBvZiB0aGUgTFJV
IGxpc3QuIEl0IG1pZ2h0IG5vdCBmaW5kIHRoZSBiZXN0Cj4gY2FuZGlkYXRlcyAodGhlIGNvbGRl
c3Qgb25lcykgb24gdGhlIGVudGlyZSBsaXN0LCBidXQgaXQgZG9lc24ndCBwYXkKPiBhcyBtdWNo
IGZvciB0aGUgbG9ja2luZy4gTUdMUlUgY2FuICpvcHRpb25hbGx5KiBzY2FuIE1NVXMgKHNlY29u
ZGFyeQo+IGluY2x1ZGVkKSB0byBmaW5kIHRoZSBiZXN0IGNhbmRpZGF0ZXMsIGJ1dCBpdCBjYW4g
b25seSBiZSBhIHdpbiBpZiB0aGUKPiBzY2FubmluZyBpbmN1cnMgYSByZWxhdGl2ZWx5IGxvdyBv
dmVyaGVhZCwgZS5nLiwgZG9uZSBsb2NrbGVzc2x5IGZvcgo+IHRoZSBzZWNvbmRhcnkgTU1VLiBJ
T1csIHRoaXMgaXMgYSBiYWxhbmNlIGJldHdlZW4gdGhlIGNvc3Qgb2YKPiByZWNsYWltaW5nIG5v
dC1zby1jb2xkICh3YXJtKSBmb2xpb3MgYW5kIHRoYXQgb2YgZmluZGluZyB0aGUgY29sZGVzdAo+
IGZvbGlvcy4KCkdvdGNoYS4KCkkgdGVuZCB0byBhZ3JlZSB3aXRoIFl1LCBkcml2aW5nIHRoZSBi
ZWhhdmlvciB2aWEgYSBLY29uZmlnIG1heSBnZW5lcmF0ZSBzaW1wbGVyCl9jb2RlXywgYnV0IEkg
dGhpbmsgaXQgaW5jcmVhc2VzIHRoZSBvdmVyYWxsIHN5c3RlbSBjb21wbGV4aXR5LiAgRS5nLiBk
aXN0cm9zCndpbGwgbGlrZWx5IGVuYWJsZSB0aGUgS2NvbmZpZywgYW5kIGluIG15IGV4cGVyaWVu
Y2UgcGVvcGxlIHVzaW5nIEtWTSB3aXRoIGEKZGlzdHJvIGtlcm5lbCB1c3VhbGx5IGFyZW4ndCBr
ZXJuZWwgZXhwZXJ0cywgaS5lLiBsaWtlbHkgd29uJ3Qga25vdyB0aGF0IHRoZXJlJ3MKZXZlbiBh
IGRlY2lzaW9uIHRvIGJlIG1hZGUsIGxldCBhbG9uZSBiZSBhYmxlIHRvIG1ha2UgYW4gaW5mb3Jt
ZWQgZGVjaXNpb24uCgpIYXZpbmcgYW4gbW11X25vdGlmaWVyIGhvb2sgdGhhdCBpcyBjb25kaXRp
b25hbGx5IGltcGxlbWVudGVkIGRvZXNuJ3Qgc2VlbSBvdmVybHkKY29tcGxleCwgZS5nLiBldmVu
IGlmIHRoZXJlJ3MgYSBydW50aW1lIGFzcGVjdCBhdCBwbGF5LCBpdCdkIGJlIGVhc3kgZW5vdWdo
IGZvcgpLVk0gdG8gbnVsbGlmeSBpdHMgbW11X25vdGlmaWVyIGhvb2sgZHVyaW5nIGluaXRpYWxp
emF0aW9uLiAgVGhlIGhhcmRlc3QgcGFydCBpcwpsaWtlbHkgZ29pbmcgdG8gYmUgZmlndXJpbmcg
b3V0IHRoZSB0aHJlc2hvbGQgZm9yIGhvdyBtdWNoIG92ZXJoZWFkIGlzIHRvbyBtdWNoLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
