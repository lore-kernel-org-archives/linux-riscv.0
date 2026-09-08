Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EDBC79FA1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 21:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DIr/HOwC9L/ofWBXFyf46EP7U1oggQ12OCTawXv5bGE=; b=sagdK1uQ2Ot7FM
	gXoU8iJDkrQzVeYC9w1ZlSJ9MooaX3N0pKlje9qCO/nl3G8Sq1oTXEksTXQLnbP7i7lFvqMutZr/g
	UKFsr5289xjMBtdVkq+JzEb02ZRQ3x1+AgNctHPQw8kJ5a6yHH8wDLXoyXGdJ/nYnknRylb4R3S6Q
	OWioN8gu5X+jaUmrqzjXTBLfdNXMtcFhOTd6sJefYbdghy5g1r/bhnFttDPaAmlYP0HbO0VsUqxuy
	PzldXMvn3TvZno8EimJlIfnIKeoTddNPGHpIuIBTbClwt1ig+a82krnWI6c6k9Tshkz22J9nhAvTH
	cTl7l/HLX4YBejbKVlWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4386-0000000AIMi-14rd;
	Tue, 08 Sep 2026 21:13:22 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4383-0000000AILI-12Wu
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 21:13:20 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1ab16a9adso193619a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2026 14:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901998; cv=none;
        d=google.com; s=arc-20260327;
        b=noK2hwlKbNLG0hPa/doebwPM5MGuNXzoM+9VyL2KP06A8LP6PAfh7z+CjQwIgykoYs
         v7u9FGO+oeGN9j+T2dB0fFaCRrovJ0+gDDzDKJEdbBXFho6vWVQA+iYUI06tE/aKApyc
         5ymfaYgdetVqXHLkWYouvHNRnhrs8AKuDvaEzSDaBjPn0+BilRlSoC5s5p5hTbFF8V9t
         MZR6EqERcuDzdpn18vOX/EBoXn3nT+yEetivQoJ1ma+McxfSk6eWy9hI5UxP54y8uYjn
         yYNSFhFkl0YRJ5mTIJFUC4mVCs2NiZt0pELkb6zEm4gq61NWzVaS69VxPJ4/McfvLg91
         4Rzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        fh=3PP3zcwR+XSTc3Uc/K4WlG4eXLBpVx5GYccH/GBZN1M=;
        b=DKrXiFIrsWGnXiwPam8pqsyO5JgcKyYlj3IIbiueZ/0JuJ8uRfxNz8yrdnqbs4fHPE
         Pl1DWmwfpQ69CB0cHiM6US7m+EDZN6tkS7wRrLmgFYCpAPzmqX1IJbPehoxJTKMT58G4
         sJg9Fw3L6+U339h/qN/YhHI9ywux8z8Ox29Mz4Ls2CkOLPph9XNFASvxuz8sa5TrdN8k
         eh1hM7quxg2e1g0fsMcDLa2yLMzv+/O+XYttLdF3Uf+eFkd0NsN8Kezys1Im69Wg25bC
         Vm84Vq9GaxDKeyvj+tLeDihJD3ynZNuaRXXKkvP17OTUFMBihretipa0hY31XG6tXPLl
         U7UQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788901998; x=1789506798; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        b=GxDkHkmN2xAThD++7ptXcVmFgw/pzqUhM8RqaOuv+FocHh/0RyxvN4oQXePuga24gz
         Nvtxy97h4L+9GNpX4LRUfg90mBvxO+oC2btwHlhY/cRk2/ObghfRX2tmLK5N+urv03rc
         QVZFKyoqjluEDVNHBCbN8anyfmbUFzdvKUqD3S0VkxAw2bWz241ZJh/NK/+yfZ6okw5y
         4libNt8rLwTB5hOF+f0uqXMltqMZrYX90bJ1dAn10tPEsSVzRKB4jeP/eY/yWdfTcn4u
         xyjvVutrJJmLv59uVtnZDST4J8VpfVQylZlXcqHFMOc/2kQkUNZQesxw+dTkd1GjwuSw
         0jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901998; x=1789506798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        b=T/P6smYVMT5hHt/6zPjma7JuIVU5SSj7CTKNBua/DgtoeKLR+Wuj+z63UQILdbXTCs
         56MpEskbimrH4LC4VOmN9jSfRPY6T21XqnNsDxzSdIvPkoWnmP05oW4/iWctm/vdLyA/
         8lJTyjvcJ29XJqGi8G0VlRZan0NjZuhKFqdyQmtgMOMH3Wqnkpd80aQ+XjkuawTBJJYy
         C8mbJ73Wv4pGx/74euPh3VmKij1uL/fywIgfqXKCf7u/qnEi0frAaaqSklP0q895Z9Ji
         acp2BM08LXdu1iyBVIUly91Eu/jjbpIqplK3pVJ3+fMI3WeIDqv+ji9+xBtnLb/NQusN
         PbZg==
X-Forwarded-Encrypted: i=1; AKwUvBzZ4Vb+yfU7bIos5SyOqzruYM4/x16zUzv6RwvzpMiCs28PKXpqvzH9Qz9Oe87yIHytYNXNhD2hyH5V4w==@lists.infradead.org
X-Gm-Message-State: AFuF++mQjTuyOu0Bk49dKEvFujVq+womdWUqSq63eayVu0d39YWDcCcQ
	KTW7YVqs6fy89cMSAu4Vspn6l0ItuorJR4bozTzPKGl/sV7LeEvKBvpPu6yG9QViByrYtPnkHK7
	m4Mh5ozDRafyUlzAnJSP4QJhNLhUyDog=
X-Gm-Gg: AYBFou0f3zzboyGa620FdU1e6fyQAW+8aJiS+OOiuRgHEOyNZ0XRoX2Le3xsJApKvef
	BmQoUWVmxnGVJlQGWPzKJQj+KNEOHBuCNf4zCoYCOzG2rDsRRck9ZjI5ZPtXHaYIfWcGtO30c1W
	EoY+1dmeYQmTBTlfOw3T8V9DhonoI9cBEe9DlZP6kl9gDEMwIgkdHIBUxFPofynTa3VL2NZ39OJ
	W/vWeBFHKUcLu/MHxtA8dOI6rtpl6b3d3cf+hUTf4xKhBpFAZZFAFcLKdRP3DyFVHRQM6cadcKS
	JmyiZx60YF7n8TS0BoUFaXsfgXk/weWAdrr5JCmJuQOA48V7tAUt2nISZ+Z2SxThbNhV9agpxYC
	vp7crU++jALV15g1namKW19+Xmx4cc4hnQnV1SX8Q7ccvWQ1PmVAuIDQBqTCogK2iUODmG/CJaE
	lbiW9Db5foeA4TbuF16WQLGhpmyIHs4u88lnCZKtunYItOSHq/Xk4=
X-Received: by 2002:a17:90b:3882:b0:396:a47f:d38f with SMTP id
 98e67ed59e1d1-39b268ce386mr30178901a91.3.1788901997757; Tue, 08 Sep 2026
 14:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 23:13:04 +0200
X-Gm-Features: AcwNN1U58TdOwuasMFef5tH_3N3xyJMe8mAu14nPZtzZCuWKC0n_7MgG3XQZVuw
Message-ID: <CANiq72m5C5tNKUWTYYerBt81KtqRLgr-S4c5XLUN1uY5n7mqiQ@mail.gmail.com>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_141319_290469_E969C681 
X-CRM114-Status: GOOD (  12.43  )
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

T24gVHVlLCBTZXAgOCwgMjAyNiBhdCAxMDo1OeKAr1BNIExvcmVuem8gU3RvYWtlcyAoQVJNKSA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gQSBmdXR1cmUgLWovLS1qb2JzIG9wdGlvbiBpcyBw
bGFubmVkIGZvcgo+IHJ1c3RjOihydXN0LWxhbmcvY29tcGlsZXItdGVhbSMxMDA1KSwgc28gY2hl
Y2sgdG8gc2VlIGlmIHRoaXMgYXZhaWxhYmxlIGFuZAo+IGlmIHNvIHVzZSBpdC4KClRoaXMgaXMg
YWxyZWFkeSBpbXBsZW1lbnRlZCBpbiBuaWdodGx5IGFzIGZhciBhcyBJIGNhbiB0ZWxsLiBJZiBp
dAp3ZXJlbid0LCB3ZSBzaG91bGRuJ3QgYWRkIGl0LCBldmVuIGlmIHBsYW5uZWQuCgooQnkgdGhl
IHdheSwgY291bGQgeW91IHBsZWFzZSBhZGQgTGluayB0YWdzIGZvciB0aG9zZSBVUkxzPykKCj4g
K2NvbmZpZyBSVVNUQ19IQVNfSk9CUwo+ICsgICAgICAgZGVmX2Jvb2wgJChydXN0Yy1vcHRpb24s
LWo4KQo+ICsKPiArY29uZmlnIFJVU1RDX0hBU19aVEhSRUFEUwo+ICsgICAgICAgZGVmX2Jvb2wg
JChydXN0Yy1vcHRpb24sLVp0aHJlYWRzPTgpCgpXZSBjYW4gc2ltcGxpZnkgdXNpbmcgYFJVU1RD
X1ZFUlNJT05gIGZvciB0aGVzZSBsaWtlIHdlIGRvIGVsc2V3aGVyZS4KCkNoZWVycywKTWlndWVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
