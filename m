Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B29C25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 23:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mh9a6Gy1LJvSyhHsj3U2waXdI3HDxMjHStD+O3rBsM0=; b=WAuOHrl9QzbC9So9Tvq2xjLSXf
	XjmnYtWtrIJb3zJf74HzrT+v2C6/sXVpIxo+00rcZ9GhiP6I7RMJFtu03PmF7Dr6tTloQXOVeX/mW
	vKS0Dcp8SBIf/42CipkWgOB1SYbXWVDG/+1P2Y1YQLhEzMUxaDUIsJilqBcRyU8ODkheP5BD4m/87
	iT7G8kfyRXxopqjJcine3uvSiDomoSm6yI5TfjkAs9ZD1OejgTTva0cKtxXuoylTp5nDg/v+3NvGq
	xMv1xcah4lkyUBZSb+0jy3Vu7eI1XbdYHfORo/q8hMvwc5t02ik25zAx1PScpGTVIeA7jFppAMKiH
	Pis/8IRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEdiC-00000004BWv-44GG;
	Tue, 04 Jun 2024 23:37:04 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEdi9-00000004BV2-3PWB
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 23:37:03 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-62a08436241so104350657b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717544218; x=1718149018; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6cRhpzsCNepMdsrfgI93QBKDGHo0p9E5+86VMMwQfk=;
        b=kbO4jETYEKM+LngctUDVQKwmt6urPbPlHOkghB9AWAA6jJ8umcio6hJFY3AjstbRDG
         uIHLwLs0AfD+TddLmwo73/Mdink52/Xgd66ZsjkBdkiMPBgZQKb+4lxVpr455rNfwLkj
         06bGOJxk8ExtqHXBrbufv3PfH4JEM3XjReEQ0Ga053KyuYxmoO4EuIlRcwGQQJWiDE3n
         3q8H6poGb9oreGuSsyle/t2O5/s/fzPvX1drZxoV+Ydff/fB050s6+G4stYQ83bChffV
         qvS11QpwC4HOwIA0nbH7RaetJ48BYmEkv+S1qwcvOj1MlIr4P4alXLyNzREfjWOl3tL0
         fXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717544218; x=1718149018;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p6cRhpzsCNepMdsrfgI93QBKDGHo0p9E5+86VMMwQfk=;
        b=HRZ3MepjiFkTT7H2VOjRfim/WL97C0T3cjl7VUKVPwyQ1f5sn08pAr7KCNlnn3ea72
         v83ZSS46Q843nzzEmN4RnoBemY8NS0YCNHfe5hyYRaRGgRzY9MIG/NaRx/OyI7g22GGf
         4f85SNaJXMa+lTORPxNaLfFazW5lMAC2XungFCPIXgu9UM6qJxneIoy0Vtyh/2dM+kny
         3FeeW2KsD65yx7qyj75KlkosMOHd4+Er5yIBDF+xmaP4a7foOGM0BBX5xfYiLUjnxWAW
         UZ89+xvx5UR5L7qQKwD8+PtGtxWNFhxMGAOZVHO+h3wHU+O/7IBH1aFvhP3vcdYFETfZ
         AVyw==
X-Forwarded-Encrypted: i=1; AJvYcCXE/o1YbWt405GwgywtWznDZArdTT4Hy4U6OpgwGhpUSWKlgEsQNI7vp/G/ouMz/ciksy8CK3wFodB3b3Z5Xceh9GMd2EvK7A+VdO+aEa6v
X-Gm-Message-State: AOJu0YxIAh/UJHKDAUkzBbdiOAVsKrtDCaY68DbUQthtd5rQUFfXa3m1
	A47lttdPCFEu80eX6g6MSXJstvOiuBH2+IQ85SJqnWZaXW0A6KtCJkSUzs+kXQ3IEvp9N1lPht5
	aWg==
X-Google-Smtp-Source: AGHT+IGvDf74cxgWq1gEKNpKx7itTcK7riRR46b0a169PbO8HQdl4CdVTPFkPhLbD8V/0e9PxPNrLdgSGrY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1142:b0:df7:9ac4:f1b2 with SMTP id
 3f1490d57ef6-dfacac478ebmr240926276.5.1717544218030; Tue, 04 Jun 2024
 16:36:58 -0700 (PDT)
Date: Tue, 4 Jun 2024 16:36:56 -0700
In-Reply-To: <Zl-cjHVKaQ0iQE5d@linux.dev>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-7-jthoughton@google.com> <Zlog5Yk_Pjq0jQhC@linux.dev>
 <Zloicw4IU8_-V5Ns@linux.dev> <CADrL8HV4SZ9BEQg1j3ojG-v5umL_d3sa4e1k2vMQCMmBEgeFpQ@mail.gmail.com>
 <Zl-cjHVKaQ0iQE5d@linux.dev>
Message-ID: <Zl-lGLv5PbEUYspD@google.com>
Subject: Re: [PATCH v4 6/7] KVM: arm64: Relax locking for kvm_test_age_gfn and kvm_age_gfn
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ankit Agrawal <ankita@nvidia.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Bibo Mao <maobibo@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Morse <james.morse@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_163702_049872_1A034754 
X-CRM114-Status: GOOD (  22.37  )
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

T24gVHVlLCBKdW4gMDQsIDIwMjQsIE9saXZlciBVcHRvbiB3cm90ZToKPiBPbiBUdWUsIEp1biAw
NCwgMjAyNCBhdCAwMzoyMDoyMFBNIC0wNzAwLCBKYW1lcyBIb3VnaHRvbiB3cm90ZToKPiA+IE9u
IEZyaSwgTWF5IDMxLCAyMDI0IGF0IDEyOjE44oCvUE0gT2xpdmVyIFVwdG9uIDxvbGl2ZXIudXB0
b25AbGludXguZGV2PiB3cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBNYXkgMzEsIDIwMjQgYXQg
MTI6MTE6MzNQTSAtMDcwMCwgT2xpdmVyIFVwdG9uIHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgTWF5
IDI5LCAyMDI0IGF0IDA2OjA1OjA5UE0gKzAwMDAsIEphbWVzIEhvdWdodG9uIHdyb3RlOgo+ID4g
PiBPaCwgYW5kIHRoZSBXQVJOX09OKCkgaW4ga3ZtX3BndGFibGVfc3RhZ2UyX3Rlc3RfY2xlYXJf
eW91bmcoKSBpcyBib2d1cwo+ID4gPiBub3cuIE1heWJlIGRlbW90ZSBpdCB0bzoKPiA+ID4KPiA+
ID4gICByID0ga3ZtX3BndGFibGVfd2FsayguLi4pOwo+ID4gPiAgIFdBUk5fT05fT05DRShyICYm
IHIgIT0gLUVBR0FJTik7Cj4gPiAKPiA+IE9oLCBpbmRlZWQsIHRoYW5rIHlvdS4gSnVzdCB0byBt
YWtlIHN1cmUgLS0gZG9lcyBpdCBtYWtlIHNlbnNlIHRvCj4gPiByZXRyeSB0aGUgY21weGNoZyBp
ZiBpdCBmYWlscz8gRm9yIGV4YW1wbGUsIHRoZSB3YXkgSSBoYXZlIGl0IG5vdyBmb3IKPiA+IHg4
NlsxXSwgd2UgcmV0cnkgdGhlIGNtcHhjaGcgaWYgdGhlIHNwdGUgaXMgc3RpbGwgYSBsZWFmLCBv
dGhlcndpc2Ugd2UKPiA+IG1vdmUgb24gdG8gdGhlIG5leHQgb25lIGhhdmluZyBkb25lIG5vdGhp
bmcuIERvZXMgc29tZXRoaW5nIGxpa2UgdGhhdAo+ID4gbWFrZSBzZW5zZSBmb3IgYXJtNjQ/Cj4g
Cj4gQXQgbGVhc3QgZm9yIGFybTY0IEkgZG8gbm90IHNlZSBhIG5lZWQgZm9yIHJldHJ5LiBUaGUg
b25seSBwb3NzaWJsZQo+IHJhY2VzIGFyZToKPiAKPiAgLSBBIHN0YWdlLTIgZmF1bHQgaGFuZGxl
ciBlc3RhYmxpc2hpbmcgLyBhZGp1c3RpbmcgdGhlIG1hcHBpbmcgZm9yIHRoZQo+ICAgIEdGTi4g
SWYgdGhlIGd1ZXN0IGlzIGRpcmVjdGx5IGFjY2Vzc2luZyB0aGUgR0ZOIGluIHF1ZXN0aW9uLCB3
aGF0J3MKPiAgICB0aGUgcG9pbnQgb2Ygd2lwaW5nIG91dCBBRj8KPiAKPiAgICBFdmVuIHdoZW4g
cmV0dXJuaW5nIC1FQUdBSU4gd2UndmUgYWxyZWFkeSBwcmltZWQgc3RhZ2UyX2FnZV9kYXRhOjp5
b3VuZywKPiAgICBzbyB3ZSByZXBvcnQgdGhlIGNvcnJlY3Qgc3RhdGUgYmFjayB0byB0aGUgcHJp
bWFyeSBNTVUuCj4gCj4gIC0gQW5vdGhlciBrdm1fYWdlX2dmbigpIHRyeWluZyB0byBhZ2UgdGhl
IHNhbWUgR0ZOLiBJIGhhdmVuJ3QgZXZlbgo+ICAgIGxvb2tlZCB0byBzZWUgaWYgdGhpcyBpcyBw
b3NzaWJsZSBmcm9tIHRoZSBwcmltYXJ5IE1NVSBQT1YsIGJ1dCBpbgo+ICAgIHRoZW9yeSBvbmUg
b2YgdGhlIGNhbGxzIHdpbGwgd2luIHRoZSByYWNlIGFuZCBjbGVhciBBRi4KPiAKPiBHaXZlbiBZ
dSdzIGNvbmNlcm5zIGFib3V0IG1ha2luZyBwZW5kaW5nIHdyaXRlcnMgd2FpdCwgd2Ugc2hvdWxk
IHRha2UKPiBldmVyeSBvcHBvcnR1bml0eSB0byBiYWlsIG9uIHRoZSB3YWxrLgoKKzEuICBUaGUg
eDg2IHBhdGggdGhhdCByZXRyaWVzIGlzLCBmb3IgYWxsIGludGVudHMgYW5kIHB1cnBvc2VzLCBs
aW1pdGVkIHRvIEludGVsCkNQVXMgdGhhdCBkb24ndCBzdXBwb3J0IEVQVCBBL0QgYml0cywgaS5l
LiB0byBwcmUtSFNXIENQVXMuICBJIHdvdWxkbid0IG1ha2UgYW55CmRlY2lzaW9ucyBiYXNlZCBv
biB0aGF0IGNvZGUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
