Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B3BE9A02C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Feb 2026 21:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8Jnf+DjhqF4og5xmdlbbX27cCi+CCY6wNo7TSuopGI=; b=CeHyER5cAMjpIm
	cRN1aGYw+L1wGbaEf74sg4Cf9QuySmDk+YJzN/1udWKx0Py6Ffr8OTE0Oz8CR0IkEMpf8QoCM8J8q
	ICmO1N54pEk/f8mpbKMmaYsdc+SED92WWChYGiCpl1QngMW+5FS753M2E7FnOL1cLonr4XPNmOnR3
	sk3u7J1UszWKOnPu2D0CzxAXITLGeZUEmOl48IhEISy/D/UvUjj6mTGuNB8nVFeBhF/zaq/p6dX6a
	M518YrlhehQlD5kgpTGeqKXO0//lbF3VxlNQVwZHp6mqCTuELbJ1OWAuUpC6duUNpU2pCFC9E5VK4
	E98vHrDwnwf7qBHTdDLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsowA-0000000AR7A-2QTO;
	Wed, 18 Feb 2026 21:18:22 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsow7-0000000AR5I-3YMN
	for linux-riscv@lists.infradead.org;
	Wed, 18 Feb 2026 21:18:21 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-948a2d37896so188000241.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Feb 2026 13:18:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771449498; cv=none;
        d=google.com; s=arc-20240605;
        b=SmKiG2PAsdu4nOt9liaAylBHD37e4kJJ6wMMGFdhrw6d2VgQF43OUPWUEIBJfVrIye
         4fUtTC530YJHw/1FPvIaquo1K7qpGEqe6pk9H5IzvWk5rHIPuMQSz0XiF1OcB6MC1Z1H
         3LMoumuR2JwoHIXG0uQLgafCNqpTEsSTqnFm3CTsJldNR9WCCEdrLrewLDznbtVZ8zBO
         qc/Y1eezPgA3xQM+qBmyVXjMDI2L++GaI2e9EfXsKzck/PY4NDB0833dPmKEM76brzr4
         lcRsXslF+Jfnwb0xymnQ3RGvWUnuIx6ceTn4r09dk4llGiUH+TSUPZatoWAgigJ+8bIX
         0HUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bRlThRjj5FGBFKrZjR9u+oYoIGMr3781os1xSOsBbRo=;
        fh=00D6ZbQ6CUU45tnRbBZ6a/WIPtjwFMNLb8TP4FZ9g24=;
        b=fWArDFSo6GK6794m82Gkljw1BaWX9v37aIYTnVW5ZkAtvNCKVXBifBUwb+a7YW1mm+
         vfQiURU+PDQ7Cmh+E0cbvrMFFWMrvNRhpxXl+D9JwRCsXfqdzh6LlHP/6valGLkazYMA
         DcG9ZFRq+jYZFa9DKihUXgHfLj2eXBFI3ykvm9bXKz0m2LtAgHUrDefTlRDickWlMOPx
         BulFKXLw9u3LGDrmVQFBhh1OJh1lB5w9bW034og55Tf6A4ooKIHdP3CU+zUB0c2SP1T1
         E+fHP+pFnb0NESsk+1h/tqEvbEGAZKC2PjSlg7VfhQxTlvQCCnn/ldSdsBW18e8zLYzu
         MSmw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771449498; x=1772054298; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRlThRjj5FGBFKrZjR9u+oYoIGMr3781os1xSOsBbRo=;
        b=WERPIGLQdtPso091LX8r2Vuc0JBV7ZQo2cl2lvFOyKUZJQ2yl4XkWFe1FPMadG5pL0
         hDuAD2yurPsY00N+urI6smL4ft83n883m76gAybj6NtiJZ4eeCd8rp9RotWjDIaAL5bo
         uyrzogAe1VF2kSEArO0qGsa7M5b5SZWQf3tmfNWhtDhj5Z/0EXGV3LTdFcGszof6+hS/
         KR5Unj42X8cb7wMeyxjbvHcdRHfzfzWIEzhilNO6Kpx5LiaPiRMZkzgCVheZPRfDdtFl
         MidoQZ+w/PteaU205xYOKX6ep02tLjCRIWAzaIRQ2ETehqLSXPCdgi71vk1/Vo3ohPRJ
         S/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771449498; x=1772054298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bRlThRjj5FGBFKrZjR9u+oYoIGMr3781os1xSOsBbRo=;
        b=bSPIqa2TzXHq8ZtsNia8BA2nO/omdeT8mE3xDFTzz2wBMuvwySSVNZiOghjcOGSW+l
         sVGEsZpPermij/HoKjnxy80xjm8jnIg9pETeZ1gyl8EIvz734AERjbyUbmu9MJY6Lzro
         xKl9M3VPaCBoiTZqexTA4/4aziPduGadR10BgsXuLpTKtkDBqhTgjGjW5dMH8OxbWMgX
         lXUS9jWr6H6DI/EsQI5Qlms5A+6aGXOkCZp2uHZQhgCMqGd/LG0ZqP6rWgG3vuSu+5Jb
         wesJVA0V15dgxp810kWodqXZjsywwvyZfuaK/b+5FpWcS0w7drh0k0NvbgirqtyYGkcT
         k4VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnoc+8oUJAkWhFdUfmx8mZmLVmArhlwc43qOkGx/P9fs5TiUJknM69psCGkLwvUEnk9k5PftZishdCLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YytJYjBiYo1w3i5YGG2SvvEmRll7OLG34B1xjJXXzbKc4ibdfEL
	FgRSvn9uyZEsbZG2jtCY7GYtrULcRd6Yg6OPQCRTtOCif6A6f/CKd8KbpYxsOs6/en/upduad+1
	Odv6v2YpEcv/j1ny74whW5Nfb2KpKLjfJpNUzU4aA
X-Gm-Gg: AZuq6aKrLZ7cAJH2gF3Kypk0hmdniF0bRMRL7akl4tuWlveDOygSwsgg/D3NngBQ0YH
	/5l72W821unhGp+7YA5pj4NDWgZcSmrYu3N700oCRh7CDvrfkeHRsthmkYqnD12KZvhg8h0NCo2
	1L2+Wpwv1IE1NlJUJHJZx/drQBHFWqLrCiHs9P/te5JfAPci8EQMJqZldbBG+KcdPgA5hW+6fdS
	2o3zqDUWrXYnG47qtwoIQhuMTXsp2q5w35R6MIAqDIllvRzk6Va9bV63UQFAQJlkdP2hxk+0MDP
	bXKdIeQ=
X-Received: by 2002:a05:6102:32cd:b0:5db:efcb:72 with SMTP id
 ada2fe7eead31-5fe2ad39b83mr6208741137.6.1771449497123; Wed, 18 Feb 2026
 13:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com> <aBPhs39MJz-rt_Ob@google.com>
 <CALzav=eqv0Fh9pzaBgjZ-fehwFbD4YscoLQz0=o0TKQT_zLTwQ@mail.gmail.com>
 <aRZ9SQ_G2lsmXtur@google.com> <CALzav=fN4FpZsfzwbdLeNSj4nx4OpRkwHvKiZNVgP8S-zsUvJA@mail.gmail.com>
 <aZYpv6O15YMlGkzT@google.com>
In-Reply-To: <aZYpv6O15YMlGkzT@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 18 Feb 2026 13:17:48 -0800
X-Gm-Features: AaiRm50oQAsne8PMukHk2_Ehws0mlHrvXf3-klwm2DNfi8keZfRuu7miCV2uiLE
Message-ID: <CALzav=cc9y2sp66QRwv=DCpb1j8fNjLWbsiqDVK9UE4e2kthzQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] KVM: selftests: Convert to kernel-style types
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Eric Auger <eric.auger@redhat.com>, 
	James Houghton <jthoughton@google.com>, Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_131819_895545_66134618 
X-CRM114-Status: GOOD (  20.57  )
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

T24gV2VkLCBGZWIgMTgsIDIwMjYgYXQgMTowNuKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgRGVjIDAzLCAyMDI1LCBEYXZpZCBN
YXRsYWNrIHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMTMsIDIwMjUgYXQgNDo1MuKAr1BNIFNlYW4g
Q2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4gTXkgc2xvd25l
c3MgaXMgbGFyZ2VseSBiZWNhdXNlIEknbSBub3Qgc3VyZSBob3cgdG8gbGFuZC9hcHByb2FjaCB0
aGlzLiAgSSdtIDEwMCUKPiA+ID4gaW4gZmF2b3Igb2YgdGhlIHJlbmFtZXMsIGl0J3MgdGhlIHRp
bWluZyBhbmQgY29vcmRpbmF0aW9uIEknbSB1bnN1cmUgb2YuCj4gPiA+Cj4gPiA+IEluIGhpbmRz
aWdodCwgaXQgcHJvYmFibHkgd291bGQgaGF2ZSBiZXN0IHRvIHNxdWVlemUgaXQgaW50byA2LjE4
LCBzbyBhdCBsZWFzdAo+ID4gPiB0aGUgbW9zdCByZWNlbnQgTFRTIHdvdWxkbid0IGdlbmVyYXRl
IGNvbmZsaWN0cyBhbGwgb3ZlciB0aGUgcGxhY2UuICBUaGUgbmV4dAo+ID4gPiBiZXN0IG9wdGlv
biB3b3VsZCBwcm9iYWJseSBiZSB0byBzcGluIGEgbmV3IHZlcnNpb24sIGJyaWJlIFBhb2xvIHRv
IGFwcGx5IGl0IGF0Cj4gPiA+IHRoZSBlbmQgb2YgdGhlIG5leHQgbWVyZ2Ugd2luZG93LCBhbmQg
dGFnIHRoZSB3aG9sZSB0aGluZyBmb3Igc3RhYmxlQCAobWF5YmUKPiA+ID4gbGltaXRlZCB0byA2
LjE4Kz8pIHRvIG1pbmltaXplIGRvd25zdHJlYW0gcGFpbi4KPiA+Cj4gPiBXaXRoIExQQyBjb21p
bmcgdXAgSSB3b24ndCBoYXZlIGN5Y2xlcyB0byBwb3N0IGEgbmV3IHZlcnNpb24gYmVmb3JlCj4g
PiB0aGUgNi4xOSBtZXJnZSB3aW5kb3cgY2xvc2VzLgo+ID4KPiA+IEknbSB0ZW1wdGVkIHRvIHNh
eSBsZXQncyBqdXN0IHdhaXQgZm9yIHRoZSBuZXh0IExUUyByZWxlYXNlIGFuZCBtZXJnZQo+ID4g
aXQgaW4gdGhlbi4gVGhpcyBpcyBsb3cgcHJpb3JpdCwgc28gSSdtIGZpbmUgd2l0aCB3YWl0aW5n
Lgo+Cj4gSSByYW4gdGhpcyBieSBQYW9sbyBpbiBsYXN0IHdlZWsncyBQVUNLLCBhbmQgaGUncyBp
biBmYXZvciBvZiB0aGUgcmVuYW1lcyAob3IgYXQKPiBsZWFzdCwgaXMgYS1vayB3aXRoIHVzIGRv
aW5nIGl0KS4gIElmIHlvdSBjYW4gcHJlcCBhIG5ldyB2ZXJzaW9uIGluIHRoZSBuZXh0IHdlZWsK
PiBvciBzbywgd2UgY2FuIGdldCBpdCBhcHBsaWVkIGZvciA3LjEgc2hvcnRseSBhZnRlciB0aGUg
bWVyZ2Ugd2luZG93IGNsb3Nlcy4KCldpbGwgZG8uIEknbGwgdHJ5IHRvIGhhdmUgaXQgb3V0IGJ5
IG5leHQgd2Vlay4gVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
