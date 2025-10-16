Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FC7CCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 08:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=soL/g3A+P0+elGWmDi1Vb9j4mtoRl16m1kBnB1njigs=; b=RHCPrBPHw1Hqwr
	UryPlrGYYTdFE2eqvHR0EDhZSywQaWbwlELnJuzlriCsBmPlMWOuaPSbCliqqA79661s/Jd5xjwoh
	u7G3cb+NfWLCnRH2N7TO8mUo2XzcgFyfd+ghnIhEFAGgKeIPpHQFDOEjwHKPvWn5yKvHXQoyDdSGW
	rlf5/ibIqeBbu31TDVxltjsV9SQafjgcMZvufziwqkecYRwYJBd7ySP7FAvUIDWAlPnjkR2q/em06
	MAlxDsPcEFhKRPNBSxl/myp/y5TPpH90Y+fXXlbm7+RZfWtS531PcYaNvHMcvkqnH6igFRbUMT1hk
	NaaFBxxdw1quSN0kBQYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JNC-00000003wf2-1WpT;
	Thu, 16 Oct 2025 08:30:10 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9JN5-00000003wbz-1fdT
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 08:30:08 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so681484a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760603400; x=1761208200; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dZ3zNJcojA/sJlGgESgs39Z0uRLTeXYPBFHIy0pECs=;
        b=A1DpEHjIIoHNai+OHP+5EFLKvpnavRKfqyE7yBBhpwJhIzZBevObL+X7ffi0JF3u8+
         uf8sP/5OSN+o1B4oy8lqBlqxo4uNCyh2nPVks4f2HZQG7iJmgAgd8TiO5m/QUhnKCQKY
         ukei9CXJulNu42+FYsUXAQw+ioaUNWoPFA+BJIvOsMs0B8JbcD4ggW+6LH0yYMlxxc1L
         hyw1X1VW48eQUS5q7xDQfGbroEdOi8OIeh4fdDAkbGFwizjZsN/APhhGxe9VcmGJAxQQ
         54JxGR7rlDECkdJ8Nb0IEPlvQ7Nhp+Yw3+aEDGikPKlbVmyvp6HCMqqCvMdITDnEN1es
         iPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760603400; x=1761208200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dZ3zNJcojA/sJlGgESgs39Z0uRLTeXYPBFHIy0pECs=;
        b=gQ11M/FpG/19dDxRKr7GJ2CX1FnsB58d3qpwVOQZ6dQs/rU3f1Q163aEoPTOITdJcK
         3KWqAvcsddUs2Yze3jIyQZUcJWMZlVhmNKr8ybrU5W5pgkBE5CgXFbO2aSDcTbB7xlnJ
         1EyW10CRk/wp3kJ1AhFcyDAJ0QZR8nq7woB1yLTAx7N1k56zMk9YMRPuom7yvRhNSMYN
         prIJJikEVYHP+j7oQZmreTfTfLDjVzeuJiRdKhiYI4bEXS/2jlaVdvm+aWqmYb/RsZXI
         ITE+7O/mDV5Dy5U2kEjE5zWoye4mle3o2Q2wTNj2v5a8Czr8b/Hg2ONzaDkZvBH3gdr4
         vOig==
X-Forwarded-Encrypted: i=1; AJvYcCVUeEAKW0H2go++aH9CTKGlWRQc1bQ/T7XdCqFAzh85UkJ5npl5NlPI027MCjofXLI3PaSB6ePWQ+3m3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYciRRDK/Ttft3a0vQo3EL7AV9Hvv0avJlsgKnZrUk3LRFGE6S
	422SYAeHql2k1c4nWjueXE9qhJegHlSa82oZ1etiI5FaK035xaZlaqNY07SZSW06HHPAc1G8cdD
	N71WKx7R2X8YWSXOWMMl96SIDtCppJcbIiqU6ogvE4Q==
X-Gm-Gg: ASbGncuPHHcxVOtLfckjSkJi1BWonZsb6rtYgoEeGtab1kFMc3+INSqzTIEqRyhge76
	40yhPKwOm2EzzksAGMmDFCrE+SvdJ4ltfeKfDy6+22wOprHDii9lV7V5hg8fXVLz/gCeRdvyFTC
	mYVO9jmk6u5gF1iCrnNjYT1++TD31Xpf5ZGWWiVCFrYb6hhVIdi6th6X2xAke6ZCVYG4pq8Bi86
	ny9liFl/qlngK7OQmnu80pMHwFLlRcP1bHgHuPfHTHKP1lPsru3RajHB1vD6LCEsbC7sdwxtQ==
X-Google-Smtp-Source: AGHT+IGyB7jwp1R/sb2SSrLIrlHDUB3Rfhzku7rZfdn97lwiX7fw79YoDZXn2zqSu6ScM4J5e0VHXW4a+hMbV7/+6J0=
X-Received: by 2002:a05:6402:35d2:b0:63b:dff7:8956 with SMTP id
 4fb4d7f45d1cf-63bdff78c26mr7390999a12.7.1760603400109; Thu, 16 Oct 2025
 01:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com> <20251015-v5_user_cfi_series-v21-25-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-25-6a07856e90e7@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 16 Oct 2025 16:29:48 +0800
X-Gm-Features: AS18NWC3gX9SfykK7BeQoaaUJU9Tso-y_BcITA4tZMgogw7A7IijvQhu4Ma2nRQ
Message-ID: <CANXhq0qHT=nnwG3SX3s_D3G2QqKGmQBbdzFwiQ5MMkimxCHJHQ@mail.gmail.com>
Subject: Re: [PATCH v21 25/28] riscv: create a config for shadow stack and
 landing pad instr support
To: Deepak Gupta <debug@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251016_013003_510531_711CA5CE 
X-CRM114-Status: GOOD (  21.20  )
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

T24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgMjoxNOKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggY3JlYXRlcyBhIGNvbmZpZyBmb3Igc2hh
ZG93IHN0YWNrIHN1cHBvcnQgYW5kIGxhbmRpbmcgcGFkIGluc3RyCj4gc3VwcG9ydC4gU2hhZG93
IHN0YWNrIHN1cHBvcnQgYW5kIGxhbmRpbmcgaW5zdHIgc3VwcG9ydCBjYW4gYmUgZW5hYmxlZCBi
eQo+IHNlbGVjdGluZyBgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJYC4gU2VsZWN0aW5nIGBDT05GSUdf
UklTQ1ZfVVNFUl9DRklgIHdpcmVzCj4gdXAgcGF0aCB0byBlbnVtZXJhdGUgQ1BVIHN1cHBvcnQg
YW5kIGlmIGNwdSBzdXBwb3J0IGV4aXN0cywga2VybmVsIHdpbGwKPiBzdXBwb3J0IGNwdSBhc3Np
c3RlZCB1c2VyIG1vZGUgY2ZpLgo+Cj4gSWYgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJIGlzIHNlbGVj
dGVkLCBzZWxlY3QgYEFSQ0hfVVNFU19ISUdIX1ZNQV9GTEFHU2AsCj4gYEFSQ0hfSEFTX1VTRVJf
U0hBRE9XX1NUQUNLYCBhbmQgRFlOQU1JQ19TSUdGUkFNRSBmb3IgcmlzY3YuCj4KPiBSZXZpZXdl
ZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERlZXBh
ayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcg
ICAgICAgICAgICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2
L2NvbmZpZ3MvaGFyZGVuaW5nLmNvbmZpZyB8ICA0ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
NSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJj
aC9yaXNjdi9LY29uZmlnCj4gaW5kZXggMGM2MDM4ZGM1ZGZkLi5hZWQwMzNlMmI1MjYgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4g
QEAgLTExNDYsNiArMTE0NiwyNyBAQCBjb25maWcgUkFORE9NSVpFX0JBU0UKPgo+ICAgICAgICAg
ICAgSWYgdW5zdXJlLCBzYXkgTi4KPgo+ICtjb25maWcgUklTQ1ZfVVNFUl9DRkkKPiArICAgICAg
IGRlZl9ib29sIHkKPiArICAgICAgIGJvb2wgInJpc2N2IHVzZXJzcGFjZSBjb250cm9sIGZsb3cg
aW50ZWdyaXR5Igo+ICsgICAgICAgZGVwZW5kcyBvbiA2NEJJVCAmJiAkKGNjLW9wdGlvbiwtbWFi
aT1scDY0IC1tYXJjaD1ydjY0aW1hX3ppY2Zpc3MpCj4gKyAgICAgICBkZXBlbmRzIG9uIFJJU0NW
X0FMVEVSTkFUSVZFCj4gKyAgICAgICBzZWxlY3QgUklTQ1ZfU0JJCj4gKyAgICAgICBzZWxlY3Qg
QVJDSF9IQVNfVVNFUl9TSEFET1dfU1RBQ0sKPiArICAgICAgIHNlbGVjdCBBUkNIX1VTRVNfSElH
SF9WTUFfRkxBR1MKPiArICAgICAgIHNlbGVjdCBEWU5BTUlDX1NJR0ZSQU1FCj4gKyAgICAgICBo
ZWxwCj4gKyAgICAgICAgIFByb3ZpZGVzIENQVSBhc3Npc3RlZCBjb250cm9sIGZsb3cgaW50ZWdy
aXR5IHRvIHVzZXJzcGFjZSB0YXNrcy4KPiArICAgICAgICAgQ29udHJvbCBmbG93IGludGVncml0
eSBpcyBwcm92aWRlZCBieSBpbXBsZW1lbnRpbmcgc2hhZG93IHN0YWNrIGZvcgo+ICsgICAgICAg
ICBiYWNrd2FyZCBlZGdlIGFuZCBpbmRpcmVjdCBicmFuY2ggdHJhY2tpbmcgZm9yIGZvcndhcmQg
ZWRnZSBpbiBwcm9ncmFtLgo+ICsgICAgICAgICBTaGFkb3cgc3RhY2sgcHJvdGVjdGlvbiBpcyBh
IGhhcmR3YXJlIGZlYXR1cmUgdGhhdCBkZXRlY3RzIGZ1bmN0aW9uCj4gKyAgICAgICAgIHJldHVy
biBhZGRyZXNzIGNvcnJ1cHRpb24uIFRoaXMgaGVscHMgbWl0aWdhdGUgUk9QIGF0dGFja3MuCj4g
KyAgICAgICAgIEluZGlyZWN0IGJyYW5jaCB0cmFja2luZyBlbmZvcmNlcyB0aGF0IGFsbCBpbmRp
cmVjdCBicmFuY2hlcyBtdXN0IGxhbmQKPiArICAgICAgICAgb24gYSBsYW5kaW5nIHBhZCBpbnN0
cnVjdGlvbiBlbHNlIENQVSB3aWxsIGZhdWx0LiBUaGlzIG1pdGlnYXRlcyBhZ2FpbnN0Cj4gKyAg
ICAgICAgIEpPUCAvIENPUCBhdHRhY2tzLiBBcHBsaWNhdGlvbnMgbXVzdCBiZSBlbmFibGVkIHRv
IHVzZSBpdCwgYW5kIG9sZCB1c2VyLQo+ICsgICAgICAgICBzcGFjZSBkb2VzIG5vdCBnZXQgcHJv
dGVjdGlvbiAiZm9yIGZyZWUiLgo+ICsgICAgICAgICBkZWZhdWx0IG4uCgpNYXliZSBpdCBpcyBk
ZWZhdWx0ICd5JyBpbnN0ZWFkIG9mICduJwoKPiArCj4gIGVuZG1lbnUgIyAiS2VybmVsIGZlYXR1
cmVzIgo+Cj4gIG1lbnUgIkJvb3Qgb3B0aW9ucyIKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9j
b25maWdzL2hhcmRlbmluZy5jb25maWcgYi9hcmNoL3Jpc2N2L2NvbmZpZ3MvaGFyZGVuaW5nLmNv
bmZpZwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wODlmNGNl
ZTgyZjQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL2hhcmRlbmlu
Zy5jb25maWcKPiBAQCAtMCwwICsxLDQgQEAKPiArIyBSSVNDViBzcGVjaWZpYyBrZXJuZWwgaGFy
ZGVuaW5nIG9wdGlvbnMKPiArCj4gKyMgRW5hYmxlIGNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgc3Vw
cG9ydCBmb3IgdXNlcm1vZGUuCj4gK0NPTkZJR19SSVNDVl9VU0VSX0NGST15Cj4KPiAtLQo+IDIu
NDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
