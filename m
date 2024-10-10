Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13CECF11E2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfO62fsQ01Nt5NnX7KQFjMeLpUH37/NHvl0U9N8hM/U=; b=bcvBCIoQHf3FIV
	TeT7QqeilqPBndDv03LP+T21Fz0HRn6L/DtfrfihPFV/lqu8qrz2EjqjhWdzazXr+pYG7uAJknhdO
	g5x6rBnhGZUi+15WCe+BeJ/yRW9vMyPL2AtRBUSODc/W6i/HRwctsEtxz/LDRgJ+ZF+GmfqTciYdN
	2Vb1Wd+HFdLsCQWR2KroH/sJIIsHs0EdD1mv3cPM5uY6XLbH6JTyQXBTeXr5rODxmXS9EjDyDiR8y
	EiaSRGMVwFCNagJzCWs7I6W9fphRD9L7Zz4hFwam8FCcb14e3z1JPRcBtgkxZlv54mQmt5h0noUoH
	qiVJ4m31Ci2P8xBLODWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sysWQ-0000000ClWc-2S6j;
	Thu, 10 Oct 2024 12:44:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sysIV-0000000Ci5m-2PK8
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Oct 2024 12:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7xvMbYMm9wWbmsflgMl5yPpAedwshWLdYVA6SaZwnPw=; b=nVdE5cOBZT2a2ks1zDVqsxbGKN
	jv0ojTfFeT9ErLKujFC3Jfxrzz1mR+ptHxSaYq+wWt8UqURac2Owzy8U0bq5AA3xSJGJwTl4AuRvX
	JYi5waixE1nKf9NV5uLIA70tpfQu6iDc0f1LAq+hoN+clSLMhFgpRjv+pmHD8I+XzrVxPlUtuMvj+
	twrqJGRQaWfcAZcgCXkbAyNQwt8QTHttMK3vAZT+IUn4rSQ4eJ6X12VwRs+LVAX76aQhQ1glhz+dG
	xukVd49Qb8LCsv85U3VJG4OTIJTJjQ2UhuexegzaIq2Vos3aBFKNmSatdGUMyYh1IbuihsK29oz+R
	7hQiSABQ==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sysIS-00000005NmA-2zUW
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 12:29:38 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-37d325beee2so482968f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 05:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728563371; x=1729168171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xvMbYMm9wWbmsflgMl5yPpAedwshWLdYVA6SaZwnPw=;
        b=si0J+IVPXU3l/rmQ/Y/3RpDzeL8njmejmRd+PqSP2Gcu4XarUeVsrPit+yUZ2p02w/
         IrcJr8nHljJlsrgcZAHBeIQM7F7VzWXcXETl1cvBXpMzxS+yX3DQhO7YC4OXPPdT0Mkj
         lRWTu4Bfuu6HmfB2jWs9c1cytxFUkL2LpG6T1V/lubeccHIaz5bvwPrrOc5lCH6o52FY
         IoOJktR4R5EIxac5KIC6HWJM8NSVT5NaLew4lW4MKchcfGgZ75cRruaa5D3Vc1Cf2zZB
         qixi1yVewL5S+p8ro+3mRcqii9+WyoVSLwEkHW04vDY8h/wtxoi0BpzrNpXyXxOYTpxw
         l4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728563371; x=1729168171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xvMbYMm9wWbmsflgMl5yPpAedwshWLdYVA6SaZwnPw=;
        b=DPODYgd5ivf/dMM0wG2d/7kDwvpiKQ/dgr8FaSGbdm42fU1n7Ok/LnhmqTDoj744AJ
         rdcRmzNLIBsVfbINF6b7cMN+DZtoXz46ARAiDITuOJkiWKbVYn3OubVEdrKqqPZCMp1i
         0e5eJ8y7xA0Cjh6OEK2mucFFsogP1fY8h5zCfXAtVHw/b/e39HCco8vpShYFp4Rm9HtS
         iA7q3e4gdmVdZ/eBvawRsu1XmqDnhkmERKsGAYLzfKAD7QYnrXC6CdbLFxFubbsyc6Lj
         PvKOg1f/pa2N6IKu6hkKbMCqoiimrpk99QVyendop9TYBbk94sub1L8LdJwZRwaWNFE7
         oa7A==
X-Forwarded-Encrypted: i=1; AJvYcCUl3QvAPKA1iQS+EDzVNxJrWcumCLs5DEOubeVu7+IvmAsvas7PHj7JffxsyBSf9qmFAEul9g2S3i6oBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzI4XJaNCOmwHKoRXVayDhNv9v/yjCBedbjRov7W+sjwFLK3K6
	ap+e6C9gWZNgSWFbGN+Sk+Z/ZynpaeMSnCjurSyZqEKW6XEWxuPw/afgQn7UfctGXIBvKdqzlhS
	DqY78abs3aS/ks9y/OTesv30Drp+OxMR1xdPY
X-Google-Smtp-Source: AGHT+IFiEOCz+4oYVsNQrtIRYCVjfwTQ+GKkrbG7vHFiSh58inIZVKcmGsdJT2LV421GZQdW2+IWPpPAN1a2dPbCsIs=
X-Received: by 2002:adf:facd:0:b0:37d:39c8:ecca with SMTP id
 ffacd0b85a97d-37d3ab23165mr3640257f8f.55.1728563370779; Thu, 10 Oct 2024
 05:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3> <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
 <ZwewMw8jBh6OU-L_@J2N7QTR9R3>
In-Reply-To: <ZwewMw8jBh6OU-L_@J2N7QTR9R3>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Oct 2024 14:29:18 +0200
Message-ID: <CAH5fLgi_Dg_a+-+KfKgzoo0z8vF5h7JT9DrFccx9C80qitsg7Q@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Mark Rutland <mark.rutland@arm.com>
Cc: Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_132936_841540_5758BC97 
X-CRM114-Status: GOOD (  41.76  )
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

T24gVGh1LCBPY3QgMTAsIDIwMjQgYXQgMTI6NDXigK9QTSBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0
bGFuZEBhcm0uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDA5LCAyMDI0IGF0IDEwOjE1OjM1
UE0gKzAyMDAsIEFsaWNlIFJ5aGwgd3JvdGU6Cj4gPiBPbiBXZWQsIE9jdCA5LCAyMDI0IGF0IDc6
NDPigK9QTSBNYXJrIFJ1dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPiA+ID4K
PiA+ID4gSGkgQWxpY2UsCj4gPiA+Cj4gPiA+IE9uIFR1ZSwgT2N0IDA4LCAyMDI0IGF0IDA1OjM3
OjE2UE0gKzAwMDAsIEFsaWNlIFJ5aGwgd3JvdGU6Cj4gPiA+ID4gVGhlIEtDRkkgc2FuaXRpemVy
IHN0b3JlcyB0aGUgQ0ZJIHRhZyBvZiBhIGZ1bmN0aW9uIGp1c3QgYmVmb3JlIGl0cwo+ID4gPiA+
IG1hY2hpbmUgY29kZS4gSG93ZXZlciwgdGhlIHBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeSBmbGFn
IGNhbiBiZSB1c2VkIHRvCj4gPiA+ID4gaW50cm9kdWNlIGFkZGl0aW9uYWwgbm9wIGluc3RydWN0
aW9ucyBiZWZvcmUgdGhlIG1hY2hpbmUgY29kZSwgdGFraW5nIHVwCj4gPiA+ID4gdGhlIHNwYWNl
IHRoYXQgbm9ybWFsbHkgaG9sZHMgdGhlIENGSSB0YWcuCj4gPiA+Cj4gPiA+IFRvIGNsYXJpZnks
IHdoZW4geW91IHNheSAiYmVmb3JlIHRoZSBtYWNoaW5lIGNvZGUiLCBkbyB5b3UgbWVhbiB3aGVu
Cj4gPiA+IE5PUHMgYXJlIHBsYWNlZCBiZWZvcmUgdGhlIGZ1bmN0aW9uIGVudHJ5IHBvaW50PyBl
LmcuIGlmIHdlIGNvbXBpbGVkCj4gPiA+IHdpdGggLWZwYXRjaGFibGUtZnVuY3Rpb24tZW50cnk9
TSxOIHdoZXJlIE4gPiAwPyBJJ2xsIHJlZmVyIHRobyB0aGlzIGFzCj4gPiA+ICJwcmUtZnVuY3Rp
b24gTk9QcyIgYmVsb3cuCj4gPiA+Cj4gPiA+IFRoZXJlJ3MgYW4gZXhpc3RpbmcgaW5jb21wYXRp
YmlsaXR5IGJldHdlZW4gQ0ZJIGFuZCBwcmUtZnVuY3Rpb24gTk9Qcwo+ID4gPiBmb3IgQyBjb2Rl
LCBiZWNhdXNlIHdlIG92ZXJyaWRlIC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5IG9uIGEKPiA+
ID4gcGVyLWZ1bmN0aW9uIGJhc2lzIChlLmcuIGZvciBub2luc3RyIGFuZCBub3RyYWNlKSwgYW5k
IHdlIGRvbid0Cj4gPiA+IGN1cnJlbnRseSBoYXZlIGEgbWVjaGFuaXNtIHRvIGVuc3VyZSB0aGUg
Q0ZJIHRhZyBpcyBpbiB0aGUgc2FtZSBwbGFjZQo+ID4gPiByZWdhcmRsZXNzLiBUaGlzIGlzIHdo
eSBhcm02NCBoYXMgQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfQ0FMTF9PUFMKPiA+ID4gZGVw
ZW5kIG9uICFDRkkuCj4gPiA+Cj4gPiA+IEZvciBDIGNvZGUgYXQgbGVhc3QsIGp1c3QgdXNpbmcg
cmVndWxhciAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT1NIG9yCj4gPiA+IC1mcGF0Y2hhYmxl
LWZ1bmN0aW9uLWVudHJ5PU0sMCBzaG91bGRuJ3QgY2hhbmdlIHRoZSBsb2NhdGlvbiBvZiB0aGUg
Q0ZJCj4gPiA+IHRhZyByZWxhdGl2ZSB0byB0aGUgZnVuY3Rpb24gZW50cnlwb2ludCwgYW5kIHNv
IHNob3VsZCBoYXZlIG5vIGFkdmVyc2UKPiA+ID4gZWZmZWN0IG9uIENGSS4KPiA+ID4KPiA+ID4g
SXMgUnVzdCBhbnkgZGlmZmVyZW50IGhlcmU/Cj4gPgo+ID4gQWgsIG5vIGl0IHNob3VsZG4ndCBi
ZS4gU2FtaSBjYW4geW91IGNvbmZpcm0/Cj4gPgo+ID4gPiA+IEluIHRoaXMgY2FzZSwgYSBiYWNr
d2FyZHMgb2Zmc2V0IGlzIGFwcGxpZWQgdG8gdGhlIENGSSB0YWcgdG8gbW92ZQo+ID4gPiA+IHRo
ZW0gb3V0IG9mIHRoZSB3YXkgb2YgdGhlIG5vcCBpbnN0cnVjdGlvbnMuIFRvIGVuc3VyZSB0aGF0
IEMgYW5kIFJ1c3QKPiA+ID4gPiBhZ3JlZSBvbiB0aGUgb2Zmc2V0IHVzZWQgYnkgQ0ZJIHRhZ3Ms
IHBhc3MgdGhlCj4gPiA+ID4gLVpwYXRjaGFibGUtZnVuY3Rpb24tZW50cnkgdG8gcnVzdGMgd2hl
bmV2ZXIgaXQgaXMgcGFzc2VkIHRvIHRoZSBDCj4gPiA+ID4gY29tcGlsZXIuCj4gPiA+Cj4gPiA+
IEFzIGFib3ZlLCBJIHN1c3BlY3QgdGhpcyBpc24ndCBuZWNlc3NhcnkgdG8gbWFrZSBDRkkgd29y
aywgZm9yIGFueSBjYXNlCj4gPiA+IHRoYXQgd29ya3Mgd2l0aCBDIHRvZGF5LCBkdWUgdG8gLWZw
YXRjaGFibGUtZnVudGlvbi1lbnRyeSBiZWluZwo+ID4gPiBvdmVycmlkZGVuIG9uIGEgcGVyLWZ1
bmN0aW9uIGJhc2lzLiBBcmUgeW91IHNlZWluZyBhIHByb2JsZW0gaW4KPiA+ID4gcHJhY3RpY2Us
IG9yIHdhcyB0aGlzIGZvdW5kIGJ5IGluc3BlY3Rpb24/Cj4gPiA+Cj4gPiA+IEhvd2V2ZXIgSUlV
QyB0aGlzIHdpbGwgYWxsb3cgcnVzdCB0byBiZSB0cmFjZWQgdmlhIGZ0cmFjZSAoYXNzdW1pbmcg
cnVzdAo+ID4gPiByZWNvcmRzIHRoZSBpbnN0cnVtZW50ZWQgbG9jYXRpb25zIGFzIGdjYyBhbmQg
Y2xhbmcgZG8pOyBpcyB0aGF0IHRoZQo+ID4gPiBjYXNlPyBBc3N1bWluZyBzbywgaXMgdGhlcmUg
YW55IEFCSSBkaWZmZXJlbmNlIHRoYXQgbWlnaHQgYml0ZSB1cz8gT24KPiA+ID4gYXJtNjQgd2Ug
cmVxdWlyZSB0aGF0IGFueXRoaW5nIG1hcmtlZCBpbnN0cnVtZW50ZWQgd2l0aAo+ID4gPiBwYXRj
aGFibGUtZnVuY3Rpb24tZW50cnkgc3RyaWN0bHkgZm9sbG93cyB0aGUgQUFQQ1M2NCBjYWxsaW5n
IGNvbnZlbnRpb24KPiA+ID4gYW5kIG91ciBmdHJhY2UgdHJhbXBvbGluZXMgc2F2ZS9yZXN0b3Jl
IHRoZSBtaW5pbWFsIHNldCBvZiBuZWNlc3NhcnkKPiA+ID4gcmVnaXN0ZXJzLCBhbmQgSSBkb24n
dCBrbm93IGhvdyBydXN0IHdoZXRoZXIgcnVzdCB3aWxsIGJlaGF2ZSB0aGUgc2FtZQo+ID4gPiBv
ciBlLmcuIHVzZSBzcGVjaWFsaXplZCBjYWxsaW5nIGNvbnZlbnRpb25zIGludGVybmFsbHkuCj4g
Pgo+ID4gV2VsbCwgSSB3YXMgdG9sZCB0aGF0IGl0J3MgYSBwcm9ibGVtIGFuZCB3YXMgYWJsZSB0
byB0cmlnZ2VyIGEgZmFpbHVyZQo+ID4gb24geDg2LiBJIGRpZG4ndCBtYW5hZ2UgdG8gdHJpZ2dl
ciBvbmUgb24gYXJtNjQsIGJ1dCBJIHdhc24ndCBzdXJlCj4gPiB3aGV0aGVyIHRoYXQgd2FzIG1l
IGRvaW5nIHNvbWV0aGluZyB3cm9uZywgb3Igd2hldGhlciB0aGUgcHJvYmxlbSBvbmx5Cj4gPiBl
eGlzdHMgb24geDg2LiBXZSBhbHJlYWR5IGhhdmUgdGhlIGZsYWcgb24geDg2IGZvciBGSU5FSUJU
LAo+Cj4gSSBiZWxpZXZlIHRoYXQgaHRlIHByb2JsZW0gb25seSBleGlzdHMgb24geDg2LCBiZWNh
YXVzZSB0aGV5IHVzZQo+IHBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeSBmb3IgdGhlaXIgRklORUlC
VCBwYXRjaGluZyAoYW5kIHVzZSAtbWZlbnRyeQo+IGZvciBmdHJhY2UpLCB3aGVyZWFzIGV2ZXJ5
b25lIGVsc2UgdXNlcyBwYXRjaGFibGUtZnVuY3Rpb24tZW50cnkgZm9yCj4gZnRyYWNlLgo+Cj4g
PiBidXQgSSB0aG91Z2h0IG9uIHRoZSBvZmYgY2hhbmNlIHRoYXQgaXQncyBub3QgYSBwcm9ibGVt
IGluIHByYWN0aWNlIG9uCj4gPiBhcm0sIGl0IHN0aWxsIGRvZXNuJ3QgaHVydCB0byBhZGQgdGhl
IGZsYWcuCj4KPiBJdCB3b24ndCBhZHZlcnNlbHkgYWZmZWN0IENGSSwgYnV0IGl0IHdpbGwgb3Bl
biB1cCBydXN0IGNvZGUgZm9yIGZ0cmFjZSwKPiBzbyBJJ20gbm90IHN1cmUgdGhhdCAiaXQgZG9l
c24ndCBodXJ0Ii4KPgo+IEFGQUlDVCBhdCB0aGUgbW9tZW50IHRoaXMgaXNuJ3QgbmVjZXNzYXJ5
IGZvciBDRkksIHNvIGNhbiB3ZSBkcm9wIHRoaXMKPiBwYXRjaCBmb3Igbm93PwoKSSdtIG9rYXkg
d2l0aCBkcm9wcGluZyB0aGlzIHBhdGNoIGZvciBub3cuCgpBbGljZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
