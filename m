Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E135FC88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 06:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MwmNuR6j20IFE74yXpBO/JETX1bjCwiFRt+lXBr5GDM=; b=ogWwAKX3qctdJU
	tiRY9WpxT4sP28pRot6gCuFtiqk71aXCK9lGaE4k3kmNoM0ihLV4XJ5j+kNMyzd1YFbPMSahGHDnz
	N9tNak8nKt0zLVUs25SLNlALob61xsjqEh9AJwFkJXsXJ+vCLP3B5fb3y25Iwpouz1dFk7oUBEjzl
	MS0ST06aWXSvkuz9xAedbD9KgiR1C+2cKsYD0EWV3onseeVPVOs1Tn2ygmkUbsPUT9ByabEODVHHe
	FHab4izYHWlnOYjmxOv6SWkN2lPME/0s1+toKCGUpjK4fmJTSdkbf2NSCHe8ZRcHc7lzyJWJ9RdKs
	/AP/IaWkChQgt8hBxLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6MiJ-00000005LgV-3Sgs;
	Tue, 15 Sep 2026 06:32:19 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6MiH-00000005Lfm-1Lrc
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 06:32:18 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-8620ffc9ec7so227755b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 23:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789453936; cv=none;
        d=google.com; s=arc-20260327;
        b=gi0hNdAKAqKm2MRISge1+Ivc5EXgwYPUHepzwrSdQJ5NnhklGm34tC7tItdazYs3WQ
         M80ZHu8pgoh1gy6guH154+MJzEyzbRtMKQuyUgHAWmbsnaMp9kEyIDMxufYuKoDaW1vu
         SXiJpgYRJjZYu1UtodK5aEm78TdTI8vyZK8CZ0aOYcko/x/7ne19Vp0GMtm5RBdH0SIY
         0TTbkAoUroSeJu5mFQIhHhsmjnE7uW96PYGRcKNykNZcSlAF+1IqBiCHKN6hddnBiRXM
         X/XI4UIrhTypMkM1S8jnu+GHUedwkMA3sgnd9QvCBUB/zkF3eX0H4nJ/C5rhKawZhWMt
         7Bzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
        fh=94QEV2OBv+OtDVM3GCv+5xFnAv42831iYkyGlbYT1Cc=;
        b=rbccOISRsvwiVLKAfK32gWdoSMjJxbqlboNdjvAzaM3/4NrbMfv33lE94X7Te0QrN2
         AP/0RUt3IORbO1BkVUTHEjyyyDfgvAsUean3A7DBM6gTKe8YhiiV7Hv4YYPoUv//aYsj
         qsqMZcqcBC4NJ+es//2vDyG85WflkFzCBdk9OpdgiSVSgbWKsU704CMqmngBYJzEBGLF
         CJLGUXn8orGjxpL0Nb8UkjGVcWrboQ9myP3GSLs1xHqTas0hhxnfKdy2FCVgWyUJ7Qt0
         cAIaMtjtrJ176m+dKTScHyoOUSmp460XmoWY6XHiZhdMU9PHFtxMs7177rLYKQJ7NyLD
         xOTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789453936; x=1790058736; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
        b=dYraIJ9nhXqpSqPKwxcgtM6xgAud6CBfqG0z0hDNtSgDw6tA8YE1Vam4XBOoDY/lxw
         ZKbf8ZV0xzzW2cumebkL5i2eF3x3I92X5TaCQZiFJ7+Il+0+AIKemKcNFPDTjN+TFsVX
         YT0qmUHedYqujveidFS5XmAYJTL5rhbSjPCT6lipmvfSzvTrAANNGIvC+7290KFmnosv
         /xGvo2qfDl7HiGHYhMX1knr2cnPEv0JmlTmnagpIFypkocIovIFlH4sRxIZqIslN4ak1
         rCwY9jbw+n6NEJi4x2wVghDQDhuHJ1zJqBOEvy1oYd2nzGacp0RPMuixTMrgAWbQIfQS
         UuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789453936; x=1790058736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmDAMC6MFeucn2qpBg3Klhb1ZEFA9BC3craQuU4rvac=;
        b=hvGDBOFozvb6pt8t9UmDW1rCMcyK684xIpzDfq47Rms2+AHC2f9SI7Q7JeF6m24qfq
         jHnsNb0eL8kAG/g6ap276ioqmJPcKzfxFvKVWKnmsOeXsG6u/yZV9kuKH6xx+ZEf+9nz
         QYT7Q5BotfLT5GO9iaG0izBVdhaKffuhCOk01khuMt6rON5VBMa//RuyWW9l3LJo6OuS
         XUFHm+WUf41dEABxHtq4VsTPEtja8yFzicXmOyOvNgvLXq0imh8GI3HsBY/tSCeaOa5n
         xOGFpdn8Ny7Dz9snNAwvc0ok/gCYaBAxAHxoCEmn6d9reqLBlZDi4DCxV63WrUK7k0mX
         H5hQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwR6bfg9eui0eH2Z9K1YEfIh+2NMHKt3aM5z4xtxT2p1t/ToBP/YvTw5Odjox/6OAFQurUj/NCdrwpZA==@lists.infradead.org
X-Gm-Message-State: AFuF++nKVvXT41LNFwO8SmD5p+lrR+a303TnEwV3vDM71FjzTw3dpTcg
	Sj6XU3ZeUCd0lAh5w14aB08kjFIpMjbK7R4YTJfn3YA1gC0ALygKQExpffAy+K4YFs7bDO/VoUv
	Z4EgviOSlHDFXqSo8DiQLXnt4qt7YNHg=
X-Gm-Gg: AYBFou27OA64EfqZBvhdKZnSq7X/J5A4tHuSgs1EqoWJED4whXQaFlkfqo4FxLd4Vmk
	QvVdVhzzLzRkVtfWG+7yufjCRdfzMOlIdz8AbzWLjlCJd7CzE2qb0j6hZya0yxITAL0KnLCGvqR
	Fo/fA2l1VK+Yht7TGqpdsdAKZ+enFGYPEvpGekLm8QofDLKK4GYNtB6nKftEfedXgD1Hiiz4V/F
	N4dQT68qPqog33zHmRpAobYNBg5AdWDxDM5SynFQgLCIfS3EgB3Wn0K92Zt439E23r9H6SqUxjv
	S4MZjV/aDraUL4dP7UMnP1v4YCIdPIHdsAc8HK++bWpsEq2w5RHqJ213htCFoh/U+nKyX/9NvpI
	6du5c1GkUyxptsEShSawW4S6ajomlmzeCdd5RjXZ5vaqz6lYDcSFqHPmT+wlH4bdWHiUO0PvvV6
	8/VR3SZRXzEXhzrutgWlK8pHAPjaHEWc4Y4ss58+VVwuCNeQbWSg==
X-Received: by 2002:a17:90b:390d:b0:396:d27b:86a4 with SMTP id
 98e67ed59e1d1-39dec02ca06mr8212249a91.2.1789453935885; Mon, 14 Sep 2026
 23:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org> <20260914-build-speedup-v2-18-39817ec5db23@kernel.org>
In-Reply-To: <20260914-build-speedup-v2-18-39817ec5db23@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Sep 2026 07:32:02 +0100
X-Gm-Features: AcwNN1XuX4yn0GdoJd77RsJx70W4snllWWAl7hBlEl0V9VQzhH3zC86aEhQjx38
Message-ID: <CANiq72naY0=iBaxfbWQaPv_06X4SjFSix4NybDQdht33+Tcs0g@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] kbuild: rust: optionally parallelise rustc front end
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
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_233217_359047_500BEB5E 
X-CRM114-Status: GOOD (  25.18  )
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMTA6MjTigK9BTSBMb3JlbnpvIFN0b2FrZXMgKEFSTSkg
PGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IFJ1c3QgY3JhdGVzIGFyZSBjb21waWxlZCBpbiBh
IHNlcmlhbCBjaGFpbiBvbiB0aGUgY3JpdGljYWwgcGF0aCAtIGNvcmUsCj4gYmluZGluZ3MsIGtl
cm5lbCBjcmF0ZXMgYW5kIHRoZW4gdGhlIGRyaXZlcnMgLSBlYWNoIGEgcnVzdGMgaW52b2NhdGlv
bi4KClRoaXMgY29uZnVzZWQgdGhlIExXTiBhcnRpY2xlLi4uIDopCgpUaGVyZSBpcyBhIGNyaXRp
Y2FsIHBhdGggaW4gdGhlIGdyYXBoLCBpbmRlZWQsIGFuZCBkb2luZyBpdCBpbgpgcHJlcGFyZWAg
aXMgcGFpbmZ1bCwgYnV0IHRvIGNsYXJpZnk6IGVhY2ggY3JhdGUgaXMgYWxyZWFkeSBidWlsdCBp
bgpwYXJhbGxlbCB3aXRoIG90aGVycyB3aGVyZSBwb3NzaWJsZSwgYW5kIHRoZSBmYWN0IHRoYXQg
ZWFjaCBjcmF0ZSBpcwpidWlsdCBieSBvbmUgYHJ1c3RjYCBpcyB1bnJlbGF0ZWQsIHBsdXMgdGhl
IGZsYWcgdGhpcyBwYXRjaCBwcm9wb3NlcwppcyBhbHNvIHVucmVsYXRlZCB0byB0aGF0LgoKSSBn
dWVzcyB0aGUgTExNIHdhcyB0cnlpbmcgdG8gYWRkIGNvbnRleHQgdG8gdGhlIG51bWJlcnMgYmVs
b3csIGJ1dCBpdApsb29rcyBsaWtlIGl0IHdpbGwgZWFzaWx5IGNvbmZ1c2UgcmVhZGVycy4KCj4g
RWFjaCB0aW1lIGEgY2hhbmdlIGlzIG1hZGUgdG8gYW55IG9mIHRoZSBiaW5kaW5ncywgaXQgdHJp
Z2dlcnMgYSByZWJ1aWxkLgoKVGhpcyBzZWVtcyBvZGRseSBmb2N1c2VkIChpLmUuIG5vdCBzdXJl
IHdoeSBgYmluZGluZ3NgIGlzIG1lbnRpb25lZCBpbgpwYXJ0aWN1bGFyKS4gSXQgaXMgYWxzbyBh
dCBsZWFzdCBpbmRlcGVuZGVudCBvZiB0aGlzIHBhdGNoLCBpLmUuIGl0CndpbGwgcmVtYWluIHRy
dWUgcmVnYXJkbGVzcyBvZiB0aGUgcGF0Y2guCgo+IHJ1c3RjIGhhcyBhIHBhcmFsbGVsIGZyb250
IGVuZCwgZW5hYmxlZCB3aXRoIC1adGhyZWFkcywgYXZhaWxhYmxlIHNpbmNlCj4gcnVzdCAxLjg0
IFswXSBhbmQgdGhlcmVmb3JlIG9uIGV2ZXJ5IHJ1c3RjIHRoZSBrZXJuZWwgc3VwcG9ydHMuCj4K
PiBJdCBpcyBub3QgeWV0IHN0YWJsZSBhbmQgaXRzIG91dHB1dCBpcyBub3QgcmVwcm9kdWNpYmxl
LCBzbyBpdCBjYW5ub3QgYmUKPiB1c2VkIGJ5IGRlZmF1bHQgLSBzdGFiaWxpc2F0aW9uIGlzIGJl
aW5nIHdvcmtlZCBvbiBbMV0uCgpOb3Qgc3VyZSB3aGF0IGl0IG1lYW5zIGJ5ICJieSBkZWZhdWx0
Ii4gSW4gYW55IGNhc2UsIHRoZSBtYWluIGlzc3VlCndpdGggdGhlIGZsYWcgaXMgdGhhdCBpdCBo
YXMgaGFkIGlzc3VlcyByZWNlbnRseSwgbm90IHNvIG11Y2ggdGhlIGZhY3QKdGhhdCBpdCBpcyB1
bnN0YWJsZS4KCj4gQWRkIG9wdGlvbmFsIGJ1aWxkIHBhcmFtZXRlciBLQlVJTERfUlVTVF9USFJF
QURTLCB3aGljaCB3aGVuIHNldCBwYXNzZXMKPiB0aGF0IG1hbnkgdGhyZWFkcyB0byBydXN0Yy4K
Pgo+IE9ic2VydmVkIGJ1aWxkIHRpbWUgY2hhbmdlcyB3aXRoIEtCVUlMRF9SVVNUX1RIUkVBRFM9
OCAocnVzdGMgMS45OCwgY2xhbmcpOgoKSSBhc3N1bWUgdGhlIGltcHJvdmVtZW50cyBhcmUgbW9z
dCBub3RhYmxlIGR1ZSB0byB0aGUgd29yayBiZWluZyBvbgpgcHJlcGFyZWAsIGkuZS4gdGhlcmUg
aXMgbm8gb3RoZXIgd29yayBhdmFpbGFibGUuIFdoZW4gdGhhdCBpcwpyZWxheGVkLCB0aGlzIHNo
b3VsZCBiZSB3YXkgbGVzcyBuZWVkZWQuIFRob3VnaCBpdCB3aWxsIGJlIHN0aWxsIHZlcnkKbmlj
ZSB0byBoYXZlIGZvciBmdWxsIFJ1c3QgcmVidWlsZHMsIGxpa2Ugd2hlbiBjaGFuZ2luZyB0aGUg
Y29tcGlsZXIKdmVyc2lvbnMgb2Z0ZW4sIGR1ZSB0byBgY29yZWAgbWFpbmx5IChlLmcuIEkgaGF2
ZSB0byBkbyB0aGF0IG9mdGVuLCBzbwpJIHdvdWxkIGxpa2UgaXQgOikuCgpJbiBhbnkgY2FzZSwg
SSBhbSBub3Qgc3VyZSBhYm91dCBhZGRpbmcgYSBLYnVpbGQgdmFyaWFibGUgYWxyZWFkeSBmb3IK
dGhpcyBhdCB0aGUgbW9tZW50LCBlc3BlY2lhbGx5IHdpdGggdGhhdCBuYW1lLCBpLmUuIGl0IGlz
IG5vdCByZWFsbHkKInRocmVhZHMiIGJ1dCAiZnJvbnRlbmQgam9icyIgYW5kIHRoZSBmbGFnIHdp
bGwgbm90IGJlIGNhbGxlZCB0aGF0IGluCnRoZSBmdXR1cmUgYW55d2F5LgoKQW5kIGlmIHNvbWVv
bmUgd2FudHMgdG8gcmlzayB0aGVpciBrZXJuZWwgYnVpbGRzLCB0aGVuIHRoZXkgY2FuCmFscmVh
ZHkgcGFzcyB0aGUgZmxhZyB0b2RheS4uLgoKKFdlIHByb2JhYmx5IGFsc28gd2FudCB0byBrbm93
IHdoYXQgdGhlIGZsYWcgd2lsbCBmaW5hbGx5IGRvIGJlZm9yZQpjb21taXR0aW5nIHRvIHBhcnRp
Y3VsYXIgbmFtZXMsIGUuZy4gd2hldGhlciBpdCBhZmZlY3RzCmNvZGVnZW4vcmVwcm9kdWNpYmls
aXR5IGluIGFueSB3YXkuIEJ1dCBwZXJoYXBzIEtidWlsZCBkb2Vzbid0IG1pbmQKaGF2aW5nIG5l
dyB2YXJpYWJsZXMgdGhhdCBtYXkgYmUgcmVwbGFjZWQgc29vbi4pCgpUaGFua3MhCgpDaGVlcnMs
Ck1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
