Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3130BCCFA1A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 02:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ySwXe6i/KnmYrYyKzjdXkdtY1KjNkpZMa9JimUyc6TQ=; b=2cJ1wofAjqjhuy
	C1e12YGbndEAOS5MWIbqDwiIq1i1fJ++5fKHlnqZlRxxeCURUC7twLl5VRgiYirBHm0pkffz/EdZM
	6+k6YPYpNoU6bakNDvC8DvIelrRjdZ2H1WD4YqN9c2O6Z3kHrR8hS98W0jOIGYi81zY5nF/p7BXzK
	VcpHL5S9z4tkQ/r6Y9LmZx1Avc9IBQp8ahpXeffg4fCUvwd3ttGfJla1y/Pf9xSCxyDDCaY2iM/kM
	HatnOCXvMQ6YiG3uY60RN1D0uAWLDwuPkQUof0uep0DxNZtYXpddS8YFpaz0/Ufe4z3z4YKtuH9O8
	tPCEnc+untURGl4HMoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0SS-0000000813y-2iTC;
	Wed, 12 Nov 2025 02:19:40 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0SP-00000008131-3Fwp
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 02:19:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b72cbc24637so79610766b.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Nov 2025 18:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762913976; x=1763518776; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugAQKBkBrsHecB9x8Cs9RwnH0DI2WGTlcIm1Ae1jyr0=;
        b=LcHeJNty5dZ/fL99Oexa6FPYfDBY69HpYJtCOZfgGLcJ8mf2ss3wCrwm/l3ZH0rgYk
         EuHzaK8ch+IA1h+vSVv+3oYRy5rOfOQhoDlvtr9RD6lr9aXRRVwgg2gK8DJRzFwCNv1G
         TrkUBx2uszNfgVtQNskfq0KkdnuHGPEbfTuMepGVTjElk9M/uv6YTgH0Xvq30JzzJyUK
         uwDdXijp8VqeIx7EizMNQn3qFHWMEr6NYEBEXXyrvLmYr8zQeOje551932/Y+OMydFuV
         KX+2aEWwlHGwOPyt5udwzhzNCPr1/0dSEyL7AAmIiWmeJVbUu2h/s3vTZFWzHp+7H5CV
         PSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762913976; x=1763518776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ugAQKBkBrsHecB9x8Cs9RwnH0DI2WGTlcIm1Ae1jyr0=;
        b=m3YkHrCkT/2rJ111xfx95Il+X7/vhQTLVXpZ9cO9xcBhFC2eviZcGPQg/ul2MqNLgp
         9pFKiQ4Yv5P6H0QvX+z4/MAsC0zPIj9KBuYa56GbVGUVCDxjywQ0/my7SIkrGst2dbff
         jHnw5c8dULH2uUWRSGKw7FSvk+CMtDdTZkHfbT3nW5U3xrZY2x10Q/DMkJMMbiULUfiD
         w4Muq9bt0LRS752/ehx3bx0cbutQ8HP1adoPQ2dLZaFhmVsQNnRiYI7bhcIwYseMJDoV
         3KY5Oi44Qyp0Wfq+92lARe7fEG8B77SJbk6k724Rc0La58iyxombiVTlh7hJ/fIhPKaY
         IBXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP+klpkd9cmwC84GPf34vgWOPHJ7jyrm6Hbq7OvWbS4RYoyMqtIyCkmZhFKHEQWhmX/T0VEW2+GCxm4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHtdBOLZ+fF4WeJryRagzo0yA/gJszleWsifGQOkXYS6rMEcs1
	2oSEHrfQhxptoh+Ru3gUN8VBynCpGcIyzSzhgLJOhBhGMu7w6jKRvPpoRqU939LHjk39UOVBZZ/
	jKG4vD8+Pf1Bh22AEdWCmOwFnlHA841mH7uanwq2LJQ==
X-Gm-Gg: ASbGnctB2jMSZEDDtZGFOkdXmvPCP3J9aGZf6d5JyaWF/U9E4mjBptHoePCc1xEFbtc
	gapRQJjnOof33Ke5Q97wSLXW92GyWGbaX0dWmtYjUvTrLtyTasloeupl6zPjxysDF0TyZCD5SKq
	obMi8FxbRUlkZLICDeuqjo+orVMVX7vf7jXUrEZf80Zb6TLVTwLuCPHVCiqywdFMBuG8JlOBTiM
	UxJBl7GmeD2Sx0yAZKq6dAqSEOKS0j/dAM5tR/8j9Z/vusVfFUk+gwSuUFA84M=
X-Google-Smtp-Source: AGHT+IE+yEBTlwHkenGiGwu5UyXnAf6gT3RkSyNE+10D+a3qX/UN5XaT1J5EAZetmYd9Vh7p3GgyT6IZWxgqCbtm2x0=
X-Received: by 2002:a17:907:3daa:b0:b72:52c2:b8ca with SMTP id
 a640c23a62f3a-b7331aec193mr102047266b.59.1762913975653; Tue, 11 Nov 2025
 18:19:35 -0800 (PST)
MIME-Version: 1.0
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com>
 <20251023-v5_user_cfi_series-v22-25-1935270f7636@rivosinc.com>
 <CANXhq0oEpCow0G+KsJ6ZPuwsxmAFVqoKGEzygiwSmxFsmntiWg@mail.gmail.com> <aRN-0Z9MNeJ9IZf2@debug.ba.rivosinc.com>
In-Reply-To: <aRN-0Z9MNeJ9IZf2@debug.ba.rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 12 Nov 2025 10:19:23 +0800
X-Gm-Features: AWmQ_bmKovRTmE80-MSruF1BPvDQmZ8Z-ahD6_kAC3IOhiFoglBht7EGrzIY3bI
Message-ID: <CANXhq0ryrNUoBvACX9hh-=FVOe+L6_6beXrZQn2e1P6eWgcUiA@mail.gmail.com>
Subject: Re: [PATCH v22 25/28] riscv: create a config for shadow stack and
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
X-CRM114-CacheID: sfid-20251111_181937_859008_E85CE0E2 
X-CRM114-Status: GOOD (  29.01  )
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

T24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgMjoyMuKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTm92IDExLCAyMDI1IGF0IDAxOjU4OjM3UE0g
KzA4MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPk9uIEZyaSwgT2N0IDI0LCAyMDI1IGF0IDEyOjUx4oCv
QU0gRGVlcGFrIEd1cHRhIHZpYSBCNCBSZWxheQo+ID48ZGV2bnVsbCtkZWJ1Zy5yaXZvc2luYy5j
b21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBGcm9tOiBEZWVwYWsgR3VwdGEgPGRlYnVn
QHJpdm9zaW5jLmNvbT4KPiA+Pgo+ID4+IFRoaXMgcGF0Y2ggY3JlYXRlcyBhIGNvbmZpZyBmb3Ig
c2hhZG93IHN0YWNrIHN1cHBvcnQgYW5kIGxhbmRpbmcgcGFkIGluc3RyCj4gPj4gc3VwcG9ydC4g
U2hhZG93IHN0YWNrIHN1cHBvcnQgYW5kIGxhbmRpbmcgaW5zdHIgc3VwcG9ydCBjYW4gYmUgZW5h
YmxlZCBieQo+ID4+IHNlbGVjdGluZyBgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJYC4gU2VsZWN0aW5n
IGBDT05GSUdfUklTQ1ZfVVNFUl9DRklgIHdpcmVzCj4gPj4gdXAgcGF0aCB0byBlbnVtZXJhdGUg
Q1BVIHN1cHBvcnQgYW5kIGlmIGNwdSBzdXBwb3J0IGV4aXN0cywga2VybmVsIHdpbGwKPiA+PiBz
dXBwb3J0IGNwdSBhc3Npc3RlZCB1c2VyIG1vZGUgY2ZpLgo+ID4+Cj4gPj4gSWYgQ09ORklHX1JJ
U0NWX1VTRVJfQ0ZJIGlzIHNlbGVjdGVkLCBzZWxlY3QgYEFSQ0hfVVNFU19ISUdIX1ZNQV9GTEFH
U2AsCj4gPj4gYEFSQ0hfSEFTX1VTRVJfU0hBRE9XX1NUQUNLYCBhbmQgRFlOQU1JQ19TSUdGUkFN
RSBmb3IgcmlzY3YuCj4gPj4KPiA+PiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZp
dmUuY29tPgo+ID4+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMu
Y29tPgo+ID4+IC0tLQo+ID4+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICB8
IDIyICsrKysrKysrKysrKysrKysrKysrKysKPiA+PiAgYXJjaC9yaXNjdi9jb25maWdzL2hhcmRl
bmluZy5jb25maWcgfCAgNCArKysrCj4gPj4gIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9u
cygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlz
Y3YvS2NvbmZpZwo+ID4+IGluZGV4IDBjNjAzOGRjNWRmZC4uNGY5ZjkzNThlNmUzIDEwMDY0NAo+
ID4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+ID4+IEBAIC0xMTQ2LDYgKzExNDYsMjggQEAgY29uZmlnIFJBTkRPTUlaRV9CQVNFCj4gPj4K
PiA+PiAgICAgICAgICAgIElmIHVuc3VyZSwgc2F5IE4uCj4gPj4KPiA+PiArY29uZmlnIFJJU0NW
X1VTRVJfQ0ZJCj4gPj4gKyAgICAgICBkZWZfYm9vbCB5Cj4gPj4gKyAgICAgICBib29sICJyaXNj
diB1c2Vyc3BhY2UgY29udHJvbCBmbG93IGludGVncml0eSIKPiA+PiArICAgICAgIGRlcGVuZHMg
b24gNjRCSVQgJiYgJChjYy1vcHRpb24sLW1hYmk9bHA2NCAtbWFyY2g9cnY2NGltYV96aWNmaXNz
KSAmJiBcCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICQoY2Mtb3B0aW9uLC1mY2Yt
cHJvdGVjdGlvbj1mdWxsKQo+ID4KPiA+SGkgRGVlcGFrLAo+ID5JIG5vdGljZWQgdGhhdCB5b3Ug
YWRkZWQgYSAkKGNjLW9wdGlvbiwtZmNmLXByb3RlY3Rpb249ZnVsbCkgY2hlY2sgaW4KPiA+dGhp
cyB2ZXJzaW9uLiBJIHRoaW5rIHRoaXMgY2hlY2sgd2lsbCBmYWlsIGJ5IGEgY2MxIHdhcm5pbmcg
d2hlbiB1c2luZwo+ID5hIG5ld2VyIHRvb2xjaGFpbiwgYmVjYXVzZSAtZmNmLXByb3RlY3Rpb24g
Y2Fubm90IGJlIHVzZWQgYWxvbmUsIGl0Cj4gPm11c3QgYmUgc3BlY2lmaWVkIHRvZ2V0aGVyIHdp
dGggdGhlIGFwcHJvcHJpYXRlIC1tYXJjaCBvcHRpb24uCj4gPkZvciBleGFtcGxlOgo+ID4gIDEu
IC1mY2YtcHJvdGVjdGlvbj1icmFuY2ggcmVxdWlyZXMgLW1hcmNoPS4uLl96aWNmaWxwCj4gPiAg
Mi4gLWZjZi1wcm90ZWN0aW9uPXJldHVybiByZXF1aXJlcyAtbWFyY2g9Li4uX3ppY2Zpc3MKPiA+
ICAzLiAtZmNmLXByb3RlY3Rpb249ZnVsbCByZXF1aXJlcyAtbWFyY2g9Li4uX3ppY2ZpbHBfemlj
Zmlzcwo+Cj4gdG9vbGNoYWluIHRoYXQgSSBoYXZlIGZyb20gSnVuZSBkb2Vzbid0IHJlcXVpcmUg
LW1hcmNoPS4uLl96aWNmaWxwX3ppY2Zpc3MKPiBmb3IgLWZjZi1wcm90ZWN0aW9uPWZ1bGwuIElm
IHRoYXQgaGFzIGNoYW5nZWQsIEkgdGhpbmsgdGhpcyB3aWxsIG5lZWQgYQo+IHJldmlzaW9uLgoK
WWVzLCB0aGF04oCZcyB3aGF0IEnigJl2ZSBsZWFybmVkIGZyb20gdGhlIHRvb2xjaGFpbiBndXlz
IHNvIGZhciwgcGVyaGFwcwp3ZSBjYW4gZG91YmxlIGNoZWNrIHdpdGggdGhlbS4gSWYgaXQgaXMg
cmlnaHQsIEkgZ3Vlc3Mgd2UgbWlnaHQgbWVyZ2UKdGhlbSBpbnRvIG9uZSBjaGVjayBhcyBmb2xs
b3dzOgokKGNjLW9wdGlvbiwtbWFiaT1scDY0IC1tYXJjaD1ydjY0aW1hX3ppY2ZpbHBfemljZmlz
cyAtZmNmLXByb3RlY3Rpb249ZnVsbCkKb3IKJChjYy1vcHRpb24sLW1hYmk9bHA2NCAtbWFyY2g9
cnY2NGltYV96aWNmaXNzIC1mY2YtcHJvdGVjdGlvbj1yZXR1cm4pCgo+Cj4gPgo+ID4KPiA+PiAr
ICAgICAgIGRlcGVuZHMgb24gUklTQ1ZfQUxURVJOQVRJVkUKPiA+PiArICAgICAgIHNlbGVjdCBS
SVNDVl9TQkkKPiA+PiArICAgICAgIHNlbGVjdCBBUkNIX0hBU19VU0VSX1NIQURPV19TVEFDSwo+
ID4+ICsgICAgICAgc2VsZWN0IEFSQ0hfVVNFU19ISUdIX1ZNQV9GTEFHUwo+ID4+ICsgICAgICAg
c2VsZWN0IERZTkFNSUNfU0lHRlJBTUUKPiA+PiArICAgICAgIGhlbHAKPiA+PiArICAgICAgICAg
UHJvdmlkZXMgQ1BVIGFzc2lzdGVkIGNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgdG8gdXNlcnNwYWNl
IHRhc2tzLgo+ID4+ICsgICAgICAgICBDb250cm9sIGZsb3cgaW50ZWdyaXR5IGlzIHByb3ZpZGVk
IGJ5IGltcGxlbWVudGluZyBzaGFkb3cgc3RhY2sgZm9yCj4gPj4gKyAgICAgICAgIGJhY2t3YXJk
IGVkZ2UgYW5kIGluZGlyZWN0IGJyYW5jaCB0cmFja2luZyBmb3IgZm9yd2FyZCBlZGdlIGluIHBy
b2dyYW0uCj4gPj4gKyAgICAgICAgIFNoYWRvdyBzdGFjayBwcm90ZWN0aW9uIGlzIGEgaGFyZHdh
cmUgZmVhdHVyZSB0aGF0IGRldGVjdHMgZnVuY3Rpb24KPiA+PiArICAgICAgICAgcmV0dXJuIGFk
ZHJlc3MgY29ycnVwdGlvbi4gVGhpcyBoZWxwcyBtaXRpZ2F0ZSBST1AgYXR0YWNrcy4KPiA+PiAr
ICAgICAgICAgSW5kaXJlY3QgYnJhbmNoIHRyYWNraW5nIGVuZm9yY2VzIHRoYXQgYWxsIGluZGly
ZWN0IGJyYW5jaGVzIG11c3QgbGFuZAo+ID4+ICsgICAgICAgICBvbiBhIGxhbmRpbmcgcGFkIGlu
c3RydWN0aW9uIGVsc2UgQ1BVIHdpbGwgZmF1bHQuIFRoaXMgbWl0aWdhdGVzIGFnYWluc3QKPiA+
PiArICAgICAgICAgSk9QIC8gQ09QIGF0dGFja3MuIEFwcGxpY2F0aW9ucyBtdXN0IGJlIGVuYWJs
ZWQgdG8gdXNlIGl0LCBhbmQgb2xkIHVzZXItCj4gPj4gKyAgICAgICAgIHNwYWNlIGRvZXMgbm90
IGdldCBwcm90ZWN0aW9uICJmb3IgZnJlZSIuCj4gPj4gKyAgICAgICAgIGRlZmF1bHQgeS4KPiA+
PiArCj4gPj4gIGVuZG1lbnUgIyAiS2VybmVsIGZlYXR1cmVzIgo+ID4+Cj4gPj4gIG1lbnUgIkJv
b3Qgb3B0aW9ucyIKPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9jb25maWdzL2hhcmRlbmlu
Zy5jb25maWcgYi9hcmNoL3Jpc2N2L2NvbmZpZ3MvaGFyZGVuaW5nLmNvbmZpZwo+ID4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wODlmNGNlZTgyZjQKPiA+
PiAtLS0gL2Rldi9udWxsCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL2hhcmRlbmluZy5j
b25maWcKPiA+PiBAQCAtMCwwICsxLDQgQEAKPiA+PiArIyBSSVNDViBzcGVjaWZpYyBrZXJuZWwg
aGFyZGVuaW5nIG9wdGlvbnMKPiA+PiArCj4gPj4gKyMgRW5hYmxlIGNvbnRyb2wgZmxvdyBpbnRl
Z3JpdHkgc3VwcG9ydCBmb3IgdXNlcm1vZGUuCj4gPj4gK0NPTkZJR19SSVNDVl9VU0VSX0NGST15
Cj4gPj4KPiA+PiAtLQo+ID4+IDIuNDMuMAo+ID4+Cj4gPj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
