Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487DACCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 05:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8DskuCDjQ6Iop+ggMfi5STN0G3k1bdcOOdxYcbiyg0=; b=u1PAyLhwzvKaLx
	/ghJbMJp1P8oaKGU39DvcZ9Q5A4bV/9jXAe5YgtNidNv6Xv2klw1uQuausl+SAifw736WfjerO/SE
	/27z1VE3G6/imrF+ET+S2jaWudCkMdTPvX2ndqI6NBYU3HsGvudDjEv3OMSXDqkbOZGqLaVP/peJX
	UagqF2iXOQZcAcWft/XBgJSc6TYvOEl8hh9WIGrR/R/i8P62u+nGUktn8oZkjrMSO+I3z69+j8bRE
	qCDXYeCVbWVxB+7woH1HD8eEWMB4rCwOJ/p/sH7wJFJBM73cdd6b143HJkdtEa+Fw6Oj3Td7YRdGY
	MimQooScbGr0kbO7Kzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIhP6-00000006aMC-14QY;
	Tue, 11 Nov 2025 05:58:56 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIhP3-00000006aLo-3Qa5
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 05:58:55 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b729a941e35so492550266b.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Nov 2025 21:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762840731; x=1763445531; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IN4rRfnCOfr9RMuoqowEQ8Wlb2hMDvz+fZbNk629L0=;
        b=Tn014VB682W5Xo3ql74r0rFgR2xY349i1TLhF/X86hQdQ+zEDQKolUxLfng/c6vF0p
         sau2AiL9s5TS6xdZhq41Dcjc6XZzqE+zshxy6VQZVcKX6EHmBNqSCaLJ5G4yoFSa87hy
         7C4qIDPULIyEtcC1anUiFT7ZJWP7WmnSpMc6gB6z+dSggRu86ylGEPt8kYPwwBLZthy+
         TSG7lAcF7c5DCt5eAb4nh6iI5dZquwogux+f0W/T++FMNH231rulq2n/619CxwcEiF38
         UNdm/R2bkF4lBPuKqIsjIBsE1C4nCXfemIRGEw/sSkKh5CjTksfJEpt32BnnLCluRGDq
         UCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762840731; x=1763445531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4IN4rRfnCOfr9RMuoqowEQ8Wlb2hMDvz+fZbNk629L0=;
        b=dhXryi/pjc8a4XcdHlz4mNc7wBngkm3OOehqHIh2MNQ8jKvo0yq+zfVpr2oIyOU1vs
         KEHE3bNRUpBlLX49k/DOCTodg12ay3iS2WkxxQfTDrEAD9+ygITSKPSsSY+4za0kf6QC
         0L88fKjnHcFqZjFKG2S9rSkkNoUySalTUJ9oj9u0sY3S8KO1Oj2HXjNYaTv1ZU875Erp
         1DZkBN79vrJhQS6C8N7jqme+9OxpbtaFT3Gh5emq8bRHHR4mziIRjkqawUTBJDYcIWSD
         +x5yXditBOyPCHvJzz9ZYTR/dUvIYIlB1pHWTxD0/Lw4OZ2egKOaPm49F3u0utthGaPZ
         mh6w==
X-Forwarded-Encrypted: i=1; AJvYcCXV4CJjRmxvF33u2Vkom68uKuDFMogI9WMrnGZgpPK/0FBmv+RKY9VQ0QgsnWKfM2kRB/3gdti6PUTWRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYDt5V1/DsLkUDDBfW+Ro95u1uzDYgtM5cJxQBaun8LzaKFVtZ
	8OyaYyq16lXC00Cz1+H6K5edO3dOJLfXdQNDChQbn8C/1tgBJMATFat78muAOyupIir1ItDAA49
	A7C+leT8xWxrhOUbtkq+pP0j5/K5H4T4xeOcyykNT2g==
X-Gm-Gg: ASbGnctLl25Bn5VSBoPwRaApp4McDzdbUN7IvIuuJavcuJNFnUAbZCpZY1SkmmA0m8R
	BaacQbIO9YACZGDfCG8kVlL23HRuyyui0/2b41L4GeBD7ndaOQyfLPG6asbsigWaeZsE+4na7Ua
	dqdtUS48JI9SbZOVA7ZE1lBXKfh3ozniZLjAF8wgaQgKLcUvJyaH8H6gMCUk1yKeth7Hjr1vQcL
	bojMx0XxtUm61qXoqAhsrnGKcspVzBkTs92tBRZ5uSSJb8WZkt9zvKl5++OIVHEuueYkOMx3Q==
X-Google-Smtp-Source: AGHT+IHHZP/aE/tVJZyLz+gOc0YU9Sc0i9PZJYzJ42dLOfI9Sr7WDBO2F0DsSawtvDJdjI2jksVRQSbzge+KnP9adhY=
X-Received: by 2002:a17:907:1c21:b0:b70:a9fd:1170 with SMTP id
 a640c23a62f3a-b72e05725a4mr966508366b.65.1762840728609; Mon, 10 Nov 2025
 21:58:48 -0800 (PST)
MIME-Version: 1.0
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com> <20251023-v5_user_cfi_series-v22-25-1935270f7636@rivosinc.com>
In-Reply-To: <20251023-v5_user_cfi_series-v22-25-1935270f7636@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 11 Nov 2025 13:58:37 +0800
X-Gm-Features: AWmQ_bmwbidNFRD3Ln7UsJWJk61pCiG6pfhUPXDjXSV4C1IEKiwyDYyiO7oQK-g
Message-ID: <CANXhq0oEpCow0G+KsJ6ZPuwsxmAFVqoKGEzygiwSmxFsmntiWg@mail.gmail.com>
Subject: Re: [PATCH v22 25/28] riscv: create a config for shadow stack and
 landing pad instr support
To: debug@rivosinc.com
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_215853_911367_4500A69F 
X-CRM114-Status: GOOD (  23.04  )
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

T24gRnJpLCBPY3QgMjQsIDIwMjUgYXQgMTI6NTHigK9BTSBEZWVwYWsgR3VwdGEgdmlhIEI0IFJl
bGF5CjxkZXZudWxsK2RlYnVnLnJpdm9zaW5jLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZy
b206IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+Cj4gVGhpcyBwYXRjaCBjcmVh
dGVzIGEgY29uZmlnIGZvciBzaGFkb3cgc3RhY2sgc3VwcG9ydCBhbmQgbGFuZGluZyBwYWQgaW5z
dHIKPiBzdXBwb3J0LiBTaGFkb3cgc3RhY2sgc3VwcG9ydCBhbmQgbGFuZGluZyBpbnN0ciBzdXBw
b3J0IGNhbiBiZSBlbmFibGVkIGJ5Cj4gc2VsZWN0aW5nIGBDT05GSUdfUklTQ1ZfVVNFUl9DRklg
LiBTZWxlY3RpbmcgYENPTkZJR19SSVNDVl9VU0VSX0NGSWAgd2lyZXMKPiB1cCBwYXRoIHRvIGVu
dW1lcmF0ZSBDUFUgc3VwcG9ydCBhbmQgaWYgY3B1IHN1cHBvcnQgZXhpc3RzLCBrZXJuZWwgd2ls
bAo+IHN1cHBvcnQgY3B1IGFzc2lzdGVkIHVzZXIgbW9kZSBjZmkuCj4KPiBJZiBDT05GSUdfUklT
Q1ZfVVNFUl9DRkkgaXMgc2VsZWN0ZWQsIHNlbGVjdCBgQVJDSF9VU0VTX0hJR0hfVk1BX0ZMQUdT
YCwKPiBgQVJDSF9IQVNfVVNFUl9TSEFET1dfU1RBQ0tgIGFuZCBEWU5BTUlDX1NJR0ZSQU1FIGZv
ciByaXNjdi4KPgo+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+Cj4gLS0tCj4g
IGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgMjIgKysrKysrKysrKysrKysr
KysrKysrKwo+ICBhcmNoL3Jpc2N2L2NvbmZpZ3MvaGFyZGVuaW5nLmNvbmZpZyB8ICA0ICsrKysK
PiAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggMGM2MDM4ZGM1ZGZk
Li40ZjlmOTM1OGU2ZTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIv
YXJjaC9yaXNjdi9LY29uZmlnCj4gQEAgLTExNDYsNiArMTE0NiwyOCBAQCBjb25maWcgUkFORE9N
SVpFX0JBU0UKPgo+ICAgICAgICAgICAgSWYgdW5zdXJlLCBzYXkgTi4KPgo+ICtjb25maWcgUklT
Q1ZfVVNFUl9DRkkKPiArICAgICAgIGRlZl9ib29sIHkKPiArICAgICAgIGJvb2wgInJpc2N2IHVz
ZXJzcGFjZSBjb250cm9sIGZsb3cgaW50ZWdyaXR5Igo+ICsgICAgICAgZGVwZW5kcyBvbiA2NEJJ
VCAmJiAkKGNjLW9wdGlvbiwtbWFiaT1scDY0IC1tYXJjaD1ydjY0aW1hX3ppY2Zpc3MpICYmIFwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgJChjYy1vcHRpb24sLWZjZi1wcm90ZWN0aW9u
PWZ1bGwpCgpIaSBEZWVwYWssCkkgbm90aWNlZCB0aGF0IHlvdSBhZGRlZCBhICQoY2Mtb3B0aW9u
LC1mY2YtcHJvdGVjdGlvbj1mdWxsKSBjaGVjayBpbgp0aGlzIHZlcnNpb24uIEkgdGhpbmsgdGhp
cyBjaGVjayB3aWxsIGZhaWwgYnkgYSBjYzEgd2FybmluZyB3aGVuIHVzaW5nCmEgbmV3ZXIgdG9v
bGNoYWluLCBiZWNhdXNlIC1mY2YtcHJvdGVjdGlvbiBjYW5ub3QgYmUgdXNlZCBhbG9uZSwgaXQK
bXVzdCBiZSBzcGVjaWZpZWQgdG9nZXRoZXIgd2l0aCB0aGUgYXBwcm9wcmlhdGUgLW1hcmNoIG9w
dGlvbi4KRm9yIGV4YW1wbGU6CiAgMS4gLWZjZi1wcm90ZWN0aW9uPWJyYW5jaCByZXF1aXJlcyAt
bWFyY2g9Li4uX3ppY2ZpbHAKICAyLiAtZmNmLXByb3RlY3Rpb249cmV0dXJuIHJlcXVpcmVzIC1t
YXJjaD0uLi5femljZmlzcwogIDMuIC1mY2YtcHJvdGVjdGlvbj1mdWxsIHJlcXVpcmVzIC1tYXJj
aD0uLi5femljZmlscF96aWNmaXNzCgoKPiArICAgICAgIGRlcGVuZHMgb24gUklTQ1ZfQUxURVJO
QVRJVkUKPiArICAgICAgIHNlbGVjdCBSSVNDVl9TQkkKPiArICAgICAgIHNlbGVjdCBBUkNIX0hB
U19VU0VSX1NIQURPV19TVEFDSwo+ICsgICAgICAgc2VsZWN0IEFSQ0hfVVNFU19ISUdIX1ZNQV9G
TEFHUwo+ICsgICAgICAgc2VsZWN0IERZTkFNSUNfU0lHRlJBTUUKPiArICAgICAgIGhlbHAKPiAr
ICAgICAgICAgUHJvdmlkZXMgQ1BVIGFzc2lzdGVkIGNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgdG8g
dXNlcnNwYWNlIHRhc2tzLgo+ICsgICAgICAgICBDb250cm9sIGZsb3cgaW50ZWdyaXR5IGlzIHBy
b3ZpZGVkIGJ5IGltcGxlbWVudGluZyBzaGFkb3cgc3RhY2sgZm9yCj4gKyAgICAgICAgIGJhY2t3
YXJkIGVkZ2UgYW5kIGluZGlyZWN0IGJyYW5jaCB0cmFja2luZyBmb3IgZm9yd2FyZCBlZGdlIGlu
IHByb2dyYW0uCj4gKyAgICAgICAgIFNoYWRvdyBzdGFjayBwcm90ZWN0aW9uIGlzIGEgaGFyZHdh
cmUgZmVhdHVyZSB0aGF0IGRldGVjdHMgZnVuY3Rpb24KPiArICAgICAgICAgcmV0dXJuIGFkZHJl
c3MgY29ycnVwdGlvbi4gVGhpcyBoZWxwcyBtaXRpZ2F0ZSBST1AgYXR0YWNrcy4KPiArICAgICAg
ICAgSW5kaXJlY3QgYnJhbmNoIHRyYWNraW5nIGVuZm9yY2VzIHRoYXQgYWxsIGluZGlyZWN0IGJy
YW5jaGVzIG11c3QgbGFuZAo+ICsgICAgICAgICBvbiBhIGxhbmRpbmcgcGFkIGluc3RydWN0aW9u
IGVsc2UgQ1BVIHdpbGwgZmF1bHQuIFRoaXMgbWl0aWdhdGVzIGFnYWluc3QKPiArICAgICAgICAg
Sk9QIC8gQ09QIGF0dGFja3MuIEFwcGxpY2F0aW9ucyBtdXN0IGJlIGVuYWJsZWQgdG8gdXNlIGl0
LCBhbmQgb2xkIHVzZXItCj4gKyAgICAgICAgIHNwYWNlIGRvZXMgbm90IGdldCBwcm90ZWN0aW9u
ICJmb3IgZnJlZSIuCj4gKyAgICAgICAgIGRlZmF1bHQgeS4KPiArCj4gIGVuZG1lbnUgIyAiS2Vy
bmVsIGZlYXR1cmVzIgo+Cj4gIG1lbnUgIkJvb3Qgb3B0aW9ucyIKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9jb25maWdzL2hhcmRlbmluZy5jb25maWcgYi9hcmNoL3Jpc2N2L2NvbmZpZ3MvaGFy
ZGVuaW5nLmNvbmZpZwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAw
Li4wODlmNGNlZTgyZjQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdz
L2hhcmRlbmluZy5jb25maWcKPiBAQCAtMCwwICsxLDQgQEAKPiArIyBSSVNDViBzcGVjaWZpYyBr
ZXJuZWwgaGFyZGVuaW5nIG9wdGlvbnMKPiArCj4gKyMgRW5hYmxlIGNvbnRyb2wgZmxvdyBpbnRl
Z3JpdHkgc3VwcG9ydCBmb3IgdXNlcm1vZGUuCj4gK0NPTkZJR19SSVNDVl9VU0VSX0NGST15Cj4K
PiAtLQo+IDIuNDMuMAo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
