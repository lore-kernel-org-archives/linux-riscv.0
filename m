Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A9FC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 22:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hwHtpBHlDuOt2PrRS4vtkbd+us1d5JGq29uIgghQZo=; b=CE3p+f5XJS6xxb
	sw4IIx53EiS89Wgwemm3UAXxqNXs5ER6gyQ6DtQwczmJKSrrAiynfjQRommvFeJodbNC0mU2u0gWy
	/ilyZhEAcKE/M7YZihT/7cLXKX4+nMknzE6OUvkR/meRN5oAdfwtFZItjkiOlaQdS+ZloUXqzjjJK
	hRw8jl1/45akcULPB/x4/QRqXXp0zEUDxURTfkUZb938wULM26Hri9lOPzdp/fK7hZheG5ShPu9Jx
	+EdVr/UGk7nWd9jAlCpxFJgbd4t+pj8AWxQt7wrmh7s0o1rWK++YvcIiH08vnxGKjtNlFPTc0Tl5/
	RQwbj3TAfrwYFNnyjRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRgb-00000005iOD-2z7q;
	Wed, 29 May 2024 22:22:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRgX-00000005iH0-0ay8
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 22:22:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-41fef5dda72so8035e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 15:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717021323; x=1717626123; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXNFpCWaiUyGAgeRu6GIx1Hrfse/W7At5lQK/blkjT8=;
        b=cRvMFa6Ob4BebpMgNCAMC+9xUaXbZUkon754zNHqBPuYMmh2SvuukLpCSltoDYRsVw
         eq1EPevoE7EOZeikR4kbT3CGATkLeHeASzK+eKVKDI+7xBKWKaIOaNRMONazYAhAa1HR
         txQrhIbUVCPvZTqlH5xjBKI6EdkIw3KuqNf43+4yJkf6hk9BVZpYlzdWKG6vAkbYZoL2
         +Gr/dO69DMtuhsY56N5P9U9b7kZbmxmsvyFDY3TndXWUXvwTbo8f0bzUAPv5iegYt/Y1
         /+y88eSxUj64YkMlCZKWtZnbYlUQ1OnlgmYgPOrs31e4Dv6MQm/2ugeluGdg94aE6EW7
         aY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717021323; x=1717626123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXNFpCWaiUyGAgeRu6GIx1Hrfse/W7At5lQK/blkjT8=;
        b=dfeqMx6fwDr476uat5f0gzQZrwtSb3qXUypzKMu1lx5xbJlInQAyAGi7bIxmVAOAAQ
         KhdFDJ4DGlcSybkcejj8aY0iTcbZG0geDo+AUbMt+Td0TnuSw+sQY0zt6UbX2hjEGGRo
         onevr7INeObXbxopxK7LoD+dsJJ7EJQpJLm6M0HjeU4nL3e49nF+nR6fpcu/LzR1J9Vg
         WVgGsespuCdbexZQC2ZYyx3xcKiH5eY0DWMHhmkdpq+WxaOVG1IZ4YxT4l6Q6MvAR683
         DFDaENdgYGD/NTCpyDQRT0IGyKWoYdwfHTK7rcSUnRqhNgsXoc2DyvHdEUmIj3wTti0n
         zxTg==
X-Forwarded-Encrypted: i=1; AJvYcCWObsDeIElA0WuZx0a6xs4lS37lYJsCopDyHzuoL9CJhkKpcN4IviNr0NvvsJ3yCJwZDYH0zeWukl9OOZYiT8HAUZuCCR3RJJGrsZ6QRflg
X-Gm-Message-State: AOJu0YxfwGhXPUkJtV/HyzxIQQkHCkAdRsEkhuFY/NkN7hGcLiyLY4RC
	3egqdOXXZoMRLA+UTcENe2pr0dJSfWz+k5O/pEgoCR/to3ihTyM6TnxO1f5tz4TAX/o154acL4D
	jSJY2Rz0j+Hw6GTxzJ+wug3cQ+EdnAYLJnkW4
X-Google-Smtp-Source: AGHT+IFqO7VFkypiYSn9vKfdPJnK37iD9z235VYJwF+JX9IAWq7RbNTOv7CYeuUojcdBQo9JI7fHcGh5LBFn8OI6V7U=
X-Received: by 2002:a05:600c:2146:b0:41b:8715:1158 with SMTP id
 5b1f17b1804b1-4212761becfmr670735e9.6.1717021322997; Wed, 29 May 2024
 15:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com>
In-Reply-To: <ZlelW93_T6P-ZuSZ@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 29 May 2024 16:21:24 -0600
Message-ID: <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: Sean Christopherson <seanjc@google.com>
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
X-CRM114-CacheID: sfid-20240529_152217_224047_7B23E746 
X-CRM114-Status: GOOD (  23.82  )
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

T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMzo1OeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDI5LCAyMDI0LCBZdSBaaGFv
IHdyb3RlOgo+ID4gT24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMTI6MDXigK9QTSBKYW1lcyBIb3Vn
aHRvbiA8anRob3VnaHRvbkBnb29nbGUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gU2Vjb25kYXJ5
IE1NVXMgYXJlIGN1cnJlbnRseSBjb25zdWx0ZWQgZm9yIGFjY2Vzcy9hZ2UgaW5mb3JtYXRpb24g
YXQKPiA+ID4gZXZpY3Rpb24gdGltZSwgYnV0IGJlZm9yZSB0aGVuLCB3ZSBkb24ndCBnZXQgYWNj
dXJhdGUgYWdlIGluZm9ybWF0aW9uLgo+ID4gPiBUaGF0IGlzLCBwYWdlcyB0aGF0IGFyZSBtb3N0
bHkgYWNjZXNzZWQgdGhyb3VnaCBhIHNlY29uZGFyeSBNTVUgKGxpa2UKPiA+ID4gZ3Vlc3QgbWVt
b3J5LCB1c2VkIGJ5IEtWTSkgd2lsbCBhbHdheXMganVzdCBwcm9jZWVkIGRvd24gdG8gdGhlIG9s
ZGVzdAo+ID4gPiBnZW5lcmF0aW9uLCBhbmQgdGhlbiBhdCBldmljdGlvbiB0aW1lLCBpZiBLVk0g
cmVwb3J0cyB0aGUgcGFnZSB0byBiZQo+ID4gPiB5b3VuZywgdGhlIHBhZ2Ugd2lsbCBiZSBhY3Rp
dmF0ZWQvcHJvbW90ZWQgYmFjayB0byB0aGUgeW91bmdlc3QKPiA+ID4gZ2VuZXJhdGlvbi4KPiA+
Cj4gPiBDb3JyZWN0LCBhbmQgYXMgSSBleHBsYWluZWQgb2ZmbGluZSwgdGhpcyBpcyB0aGUgb25s
eSByZWFzb25hYmxlCj4gPiBiZWhhdmlvciBpZiB3ZSBjYW4ndCBsb2NrbGVzc2x5IHdhbGsgc2Vj
b25kYXJ5IE1NVXMuCj4gPgo+ID4gSnVzdCBmb3IgdGhlIHJlY29yZCwgdGhlIChjcnVkZSkgYW5h
bG9neSBJIHVzZWQgd2FzOgo+ID4gSW1hZ2luZSBhIGxhcmdlIHJvb20gd2l0aCBtYW55IGJpbGxz
ICgkMSwgJDUsICQxMCwgLi4uKSBvbiB0aGUgZmxvb3IsCj4gPiBidXQgeW91IGFyZSBvbmx5IGFs
bG93ZWQgdG8gcGljayB1cCAxMCBvZiB0aGVtIChhbmQgcHV0IHRoZW0gaW4geW91cgo+ID4gcG9j
a2V0KS4gQSBzbWFydCBtb3ZlIHdvdWxkIGJlIHRvIHN1cnZleSB0aGUgcm9vbSAqZmlyc3QgYW5k
IHRoZW4qCj4gPiBwaWNrIHVwIHRoZSBsYXJnZXN0IG9uZXMuIEJ1dCBpZiB5b3UgYXJlIGNhcnJ5
aW5nIGEgNTAwIGxicyBiYWNrcGFjaywKPiA+IHlvdSB3b3VsZCBqdXN0IHdhbnQgdG8gcGljayB1
cCB3aGljaGV2ZXIgdGhhdCdzIGluIGZyb250IG9mIHlvdSByYXRoZXIKPiA+IHRoYW4gd2FsayB0
aGUgZW50aXJlIHJvb20uCj4gPgo+ID4gTUdMUlUgc2hvdWxkIG9ubHkgc2NhbiAob3IgbG9va2Fy
b3VuZCkgc2Vjb25kYXJ5IE1NVXMgaWYgaXQgY2FuIGJlCj4gPiBkb25lIGxvY2tsZXNzLiBPdGhl
cndpc2UsIGl0IHNob3VsZCBqdXN0IGZhbGwgYmFjayB0byB0aGUgZXhpc3RpbmcKPiA+IGFwcHJv
YWNoLCB3aGljaCBleGlzdGVkIGluIHByZXZpb3VzIHZlcnNpb25zIGJ1dCBpcyByZW1vdmVkIGlu
IHRoaXMKPiA+IHZlcnNpb24uCj4KPiBJSVVDLCBieSAiZXhpc3RpbmcgYXBwcm9hY2giIHlvdSBt
ZWFuIGNvbXBsZXRlbHkgaWdub3JlIHNlY29uZGFyeSBNTVVzIHRoYXQgZG9uJ3QKPiBpbXBsZW1l
bnQgYSBsb2NrbGVzcyB3YWxrPwoKTm8sIHRoZSBleGlzdGluZyBhcHByb2FjaCBvbmx5IGNoZWNr
cyBzZWNvbmRhcnkgTU1VcyBmb3IgTFJVIGZvbGlvcywKaS5lLiwgdGhvc2UgYXQgdGhlIGVuZCBv
ZiB0aGUgTFJVIGxpc3QuIEl0IG1pZ2h0IG5vdCBmaW5kIHRoZSBiZXN0CmNhbmRpZGF0ZXMgKHRo
ZSBjb2xkZXN0IG9uZXMpIG9uIHRoZSBlbnRpcmUgbGlzdCwgYnV0IGl0IGRvZXNuJ3QgcGF5CmFz
IG11Y2ggZm9yIHRoZSBsb2NraW5nLiBNR0xSVSBjYW4gKm9wdGlvbmFsbHkqIHNjYW4gTU1VcyAo
c2Vjb25kYXJ5CmluY2x1ZGVkKSB0byBmaW5kIHRoZSBiZXN0IGNhbmRpZGF0ZXMsIGJ1dCBpdCBj
YW4gb25seSBiZSBhIHdpbiBpZiB0aGUKc2Nhbm5pbmcgaW5jdXJzIGEgcmVsYXRpdmVseSBsb3cg
b3ZlcmhlYWQsIGUuZy4sIGRvbmUgbG9ja2xlc3NseSBmb3IKdGhlIHNlY29uZGFyeSBNTVUuIElP
VywgdGhpcyBpcyBhIGJhbGFuY2UgYmV0d2VlbiB0aGUgY29zdCBvZgpyZWNsYWltaW5nIG5vdC1z
by1jb2xkICh3YXJtKSBmb2xpb3MgYW5kIHRoYXQgb2YgZmluZGluZyB0aGUgY29sZGVzdApmb2xp
b3MuCgpTY2FubmluZyBob3N0IE1NVXMgaXMgbGlrZWx5IHRvIGJlIGEgd2luIGJlY2F1c2UgMSkg
dGhlcmUgaXMgdXN1YWxseQphY2Nlc3MgbG9jYWxpdHkgMikgdGhlcmUgaXMgbm8gY29hcnNlZCBs
b2NraW5nLiBJZiBuZWl0aGVyIGhvbGRzLApzY2FubmluZyBzZWNvbmRhcnkgTU1VcyB3b3VsZCBs
aWtlbHkgYmUgYSBsb3NzLiBBbmQgMSkgaXMgZ2VuZXJhbGx5CndlYWtlciBmb3Igc2Vjb25kYXJ5
IE1NVXMsIHNpbmNlIGl0J3MgYWJvdXQgKGd1ZXN0KSBwaHlzaWNhbCBhZGRyZXNzCnNwYWNlLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
