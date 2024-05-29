Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C18C27C43
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 22:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4LEI2jJq7sulmpGzUlwc/Nse08E1MSK0fhy41Cem+eg=; b=urSjhiQaFvLS7VhMWUb1u60a9S
	gv7EQv8iJ8usg5GNPbm8jAjqfTjmI2032823S37akkdp9zj/PJuc8zUtMF4ia50+HTH72Uexte11I
	lXY4f4+odwnkTHsy5XJNP45t0LWQ1OvRxub0h68fOihZR58NKLFVI/SgCRIZbJUXxnviB6IVYVgnf
	iALLPbE/wQKO0TYY99c1V9CQR3l2LiN9RLsV2vvWk7JuK26SVq1DfN97z7e35DzIdcb0kTUdlf61+
	re89rVHfajYjqyiwoS72gc/wF9PM69ZK4waPGHqTco2kBQe8SqQMJOYnxHUmiQ/LqQyySAWAm7SLn
	N+cptgyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRL5-00000005eeJ-1RXa;
	Wed, 29 May 2024 22:00:07 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRL0-00000005eXe-175m
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 22:00:04 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6fb22ecd976so146539b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 14:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717019997; x=1717624797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VygQSYtgJkxGCNbSiB1TmlrjiVcPo9FASZn5iwrGyKo=;
        b=xz0CloWczXBXwBeY48kyQRYvseQyAWJm6mSZ2Za+YO7FNln4/wecYkJ8H6xdnABga8
         kvWQiyJ+KCvLfxczL2PN+1hVqViEvhmSRkyh09vFW1AhLO25MmZFs/5nleM+TcWLgCSB
         1+suc32bKyS9Ae1i536dxDG4/HQvpxlDhCQjnVQ/DwBEAbfaZceFP+kbOoSp1zGOSwAL
         g6SBKKlk8KBrX24fip4a+jB7anJBvy+uq2U+3V9UlzijNQQko0gLfqx7yEJh5nh8m8bA
         snhttmF+68N2HR1S91tvzcPH6qp3kyH4yBMbHGH+CSZOjK8wn1RpAz5J+du04FtoIY95
         et7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717019997; x=1717624797;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VygQSYtgJkxGCNbSiB1TmlrjiVcPo9FASZn5iwrGyKo=;
        b=ZzMq1gTLhiKwsg5R9bWmZOqj7eknoRt23BUjgHJ3TWAWpmObPHWaKh3FlVSFJd5jzW
         wQD2oedTCjhrjRTd741O9bGpfbHscbKe0YJPnzxzufIAbb10joT/lmQbWPXakEbB19uf
         w+qecfvP9EzQtQJny76xcFsbAka97OoqMA0AkgDMJ+qwxTdLPs70H+iPZYd90s1B61og
         1vj+/Q7oc0FNaj10il4ZQ3uRdhefTpkOwNLktsmUTolgShGbkQBdVepjHa8q8MMtIVkb
         hDKRt7ugz+dRak9bIna2KJFG3ESGM0on3RIqIiiwHY+eNxZg11Bo/ca5jxHo7kvgOFQL
         9XAg==
X-Forwarded-Encrypted: i=1; AJvYcCUvIezh4j0T+PV3JGjGYHJhH2JOW2CJ/y/PXspMAZrSRpKL6aJ/e6p69+2U6UOBKG06woRb5khAqeilAFtt3PvS6mfd0KkLKZvExXV+O5O7
X-Gm-Message-State: AOJu0YyVLzJo40kwz1AI0bN/vBBPzX8d7HHzj3rezQuOnvHOqh66dKf5
	eEsIT9SsxxnS5AN/XDDPyIylzX0f/UgN0+d/GZtxQFAHxOyHAn1Ez+Xy/5cCzyNoCOpvxpw/fvD
	0/w==
X-Google-Smtp-Source: AGHT+IErfD3/6U7Yg0vFWmN+JznLDOE9vgR2lO1JhTGk52Ll6iOJE5uAx2O1dqENYjCcQTLMPcB8oRdC9wY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8607:b0:702:1e25:a47c with SMTP id
 d2e1a72fcca58-70231a8676amr343b3a.1.1717019996755; Wed, 29 May 2024 14:59:56
 -0700 (PDT)
Date: Wed, 29 May 2024 14:59:55 -0700
In-Reply-To: <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
Message-ID: <ZlelW93_T6P-ZuSZ@google.com>
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
X-CRM114-CacheID: sfid-20240529_150002_330890_7CB3B78F 
X-CRM114-Status: GOOD (  18.58  )
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
MjQgYXQgMTI6MDXigK9QTSBKYW1lcyBIb3VnaHRvbiA8anRob3VnaHRvbkBnb29nbGUuY29tPiB3
cm90ZToKPiA+Cj4gPiBTZWNvbmRhcnkgTU1VcyBhcmUgY3VycmVudGx5IGNvbnN1bHRlZCBmb3Ig
YWNjZXNzL2FnZSBpbmZvcm1hdGlvbiBhdAo+ID4gZXZpY3Rpb24gdGltZSwgYnV0IGJlZm9yZSB0
aGVuLCB3ZSBkb24ndCBnZXQgYWNjdXJhdGUgYWdlIGluZm9ybWF0aW9uLgo+ID4gVGhhdCBpcywg
cGFnZXMgdGhhdCBhcmUgbW9zdGx5IGFjY2Vzc2VkIHRocm91Z2ggYSBzZWNvbmRhcnkgTU1VIChs
aWtlCj4gPiBndWVzdCBtZW1vcnksIHVzZWQgYnkgS1ZNKSB3aWxsIGFsd2F5cyBqdXN0IHByb2Nl
ZWQgZG93biB0byB0aGUgb2xkZXN0Cj4gPiBnZW5lcmF0aW9uLCBhbmQgdGhlbiBhdCBldmljdGlv
biB0aW1lLCBpZiBLVk0gcmVwb3J0cyB0aGUgcGFnZSB0byBiZQo+ID4geW91bmcsIHRoZSBwYWdl
IHdpbGwgYmUgYWN0aXZhdGVkL3Byb21vdGVkIGJhY2sgdG8gdGhlIHlvdW5nZXN0Cj4gPiBnZW5l
cmF0aW9uLgo+IAo+IENvcnJlY3QsIGFuZCBhcyBJIGV4cGxhaW5lZCBvZmZsaW5lLCB0aGlzIGlz
IHRoZSBvbmx5IHJlYXNvbmFibGUKPiBiZWhhdmlvciBpZiB3ZSBjYW4ndCBsb2NrbGVzc2x5IHdh
bGsgc2Vjb25kYXJ5IE1NVXMuCj4gCj4gSnVzdCBmb3IgdGhlIHJlY29yZCwgdGhlIChjcnVkZSkg
YW5hbG9neSBJIHVzZWQgd2FzOgo+IEltYWdpbmUgYSBsYXJnZSByb29tIHdpdGggbWFueSBiaWxs
cyAoJDEsICQ1LCAkMTAsIC4uLikgb24gdGhlIGZsb29yLAo+IGJ1dCB5b3UgYXJlIG9ubHkgYWxs
b3dlZCB0byBwaWNrIHVwIDEwIG9mIHRoZW0gKGFuZCBwdXQgdGhlbSBpbiB5b3VyCj4gcG9ja2V0
KS4gQSBzbWFydCBtb3ZlIHdvdWxkIGJlIHRvIHN1cnZleSB0aGUgcm9vbSAqZmlyc3QgYW5kIHRo
ZW4qCj4gcGljayB1cCB0aGUgbGFyZ2VzdCBvbmVzLiBCdXQgaWYgeW91IGFyZSBjYXJyeWluZyBh
IDUwMCBsYnMgYmFja3BhY2ssCj4geW91IHdvdWxkIGp1c3Qgd2FudCB0byBwaWNrIHVwIHdoaWNo
ZXZlciB0aGF0J3MgaW4gZnJvbnQgb2YgeW91IHJhdGhlcgo+IHRoYW4gd2FsayB0aGUgZW50aXJl
IHJvb20uCj4gCj4gTUdMUlUgc2hvdWxkIG9ubHkgc2NhbiAob3IgbG9va2Fyb3VuZCkgc2Vjb25k
YXJ5IE1NVXMgaWYgaXQgY2FuIGJlCj4gZG9uZSBsb2NrbGVzcy4gT3RoZXJ3aXNlLCBpdCBzaG91
bGQganVzdCBmYWxsIGJhY2sgdG8gdGhlIGV4aXN0aW5nCj4gYXBwcm9hY2gsIHdoaWNoIGV4aXN0
ZWQgaW4gcHJldmlvdXMgdmVyc2lvbnMgYnV0IGlzIHJlbW92ZWQgaW4gdGhpcwo+IHZlcnNpb24u
CgpJSVVDLCBieSAiZXhpc3RpbmcgYXBwcm9hY2giIHlvdSBtZWFuIGNvbXBsZXRlbHkgaWdub3Jl
IHNlY29uZGFyeSBNTVVzIHRoYXQgZG9uJ3QKaW1wbGVtZW50IGEgbG9ja2xlc3Mgd2Fsaz8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
