Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F7BC282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dC1x+ta2lPZA3te3af2yf/8F9BxcLAMxI/KFi4AP3OI=; b=iprHcAEGLvyzR3
	+YLsbPiK7UwvT00rHL43Gu36vWJiR0a2voFTBznAj3OsULEsYkgUn1qSw6O0xh/CGNz4MsLugJvUw
	EqPSVw11sGEhszqvyMMFjaCxjx9hnKNAFg52zThIb5O7GahXD8ITlfE7jzd39UJNMwj6xTa8uylJs
	/9GZspWB7JrMB1C9XWLX4waHR9WKIsqFmXDm+yIh1pUbKIzPqv3v2qSEfQrt0tIZl74CndJJ52uYH
	5ZOOUBp1NASOEwtlb8ZHOJ43E2BBqqbQ1Xhhv+kjflVIBITk3VdSRZVgbsRUGgokxahTP+MUmlxvf
	wO6JymZ7uPhg2XPhGq3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lR-0000000DXZ6-1iCF;
	Fri, 14 Mar 2025 08:51:33 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0VD-0000000DUyF-2xDM
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 08:34:49 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-85ae131983eso162972339f.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 01:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741941287; x=1742546087; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bm74IWNiiddtjCmKDIAkneaMK7FpbJuBZ2ZaX1ZQ1kw=;
        b=hNRBtzvDIxaOzy8JQYXW2bPE0YWL7+gNlaJWEXr/3FQ5azmR/iBeM0eOfEXu33RW/q
         j8ESY0KwGCo5KeHyMdVu9NxG6brIfQO5gZNcsJRL8Sj9cHx/d2CTbDmuJFeSVr6Au244
         cvmIzS/TGviYQJyovvODByXc/84o3A8t1zzzrUPKsIbYZTndS14IJAAwoqylXDluM2xD
         d0xYCbXB7NcT9C99OFsCmpK/2V9M1kymX34SM6GsIGjhvoeLfEhv4LCsAKlqDpCH1EAI
         oAJSR/gQzMPuOosQGXWMWvCdgoLVBBJpUaSk1ZgxuLUBpuxU1fnO2GhOA2vlQ3aFj1/z
         gXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741941287; x=1742546087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bm74IWNiiddtjCmKDIAkneaMK7FpbJuBZ2ZaX1ZQ1kw=;
        b=P2KnKL8gg8V7a1Fd3nzT2bZXE7k872bYx8bsqqyx3A93zqHKHpT94gf/2S7B4LM8S5
         VNx/+8QMNpezdCgePqOVLnlX2GGaexfT3bcXWpzr84c9aGOrFi9+PLtqnAT3gwf+7wL/
         7q8NBv+NwEpWMi7zj5oYKXfphjwGmnnR1t3AIyL7yN1T/Lbt+eUMJ9troWrwvbIbgttv
         Dzo8cwNAG4cgexh9/6N7T2933Ktg4l14ZuGWdscWdKnqgb2dcUBQSO4+LtSPUNlibaS9
         /5AYfAZ6fjnEP1nOpFQE+3kubGa9Uygbi5x1yzeR59XOEvmIA80vuZaYKq4tNkL4/G/C
         X47Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWXnknMyxiCzyclfaruSH/2nA/G+N5jKOy21C+dSPD7HFE/HrZXjyWXCz0UBEyMgAjLO+4M4Y22kwz0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd+a1b8P+Tpzp2NShlilZDitQXNLLu5Hm4oGtADiv8Fk2/VXyh
	PyUGx0Ba8Fxfa2VKNXjxj/wwVW53RYtDG76rS/PgLM5XKYhypOKrNaGrtk88zDZSM1RObSVc9BF
	WBUcjZ2ozZGV9cxQH2rLN1N7pjWpsTyuoU0bELg==
X-Gm-Gg: ASbGncuwuAPgiMWTcHDKDULWxWtrAxrA5JRd4ohTTfFSxFuRuT6iNWB2ZTbs6g/o1qr
	BH7dAF/4tlMrg8l5q/ORLL4BekmrWduYEylNBmt3YKNf2C5yRBskR/noTVuMoijetWN13gYdeQM
	xJR8/dN8AYJg4ROi2uZm12ORSU5nc=
X-Google-Smtp-Source: AGHT+IFRA5Az3Um9tJHHRXJFx+3mnIqGojBtFl6JREsVb2G4EXt33cQMlFoJn1d6ltMZlRWKhpPmG6wKGqrSmlkGBr0=
X-Received: by 2002:a05:6602:3f08:b0:85b:5869:b5b with SMTP id
 ca18e2360f4ac-85dc48334c9mr187830339f.6.1741941286887; Fri, 14 Mar 2025
 01:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com> <20250310-v5_user_cfi_series-v11-25-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-25-86b36cbfb910@rivosinc.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 14 Mar 2025 16:34:36 +0800
X-Gm-Features: AQ5f1JpXeE6tU44day2kKwZlk-ke3YkF8t6JJiPonVbxjr2JHrkve7GNBaApiH4
Message-ID: <CANXhq0qTYAuc_2A+51-BxEKKT67t3-d_nj3-R2O=+khHNOR+AQ@mail.gmail.com>
Subject: Re: [PATCH v11 25/27] riscv: Documentation for landing pad / indirect
 branch tracking
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
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_013447_743097_59FFC08D 
X-CRM114-Status: GOOD (  32.11  )
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

T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMTE6NDTigK9QTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBBZGRpbmcgZG9jdW1lbnRhdGlvbiBvbiBsYW5kaW5nIHBh
ZCBha2EgaW5kaXJlY3QgYnJhbmNoIHRyYWNraW5nIG9uIHJpc2N2Cj4gYW5kIGtlcm5lbCBpbnRl
cmZhY2VzIGV4cG9zZWQgc28gdGhhdCB1c2VyIHRhc2tzIGNhbiBlbmFibGUgaXQuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2luZGV4LnJzdCAgIHwgICAxICsKPiAgRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L3ppY2ZpbHAucnN0IHwgMTE1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2luZGV4LnJzdAo+IGluZGV4IGVlY2YzNDdjZTg0OS4uYmU3MjM3YjY5Njgy
IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9pbmRleC5yc3QKPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaW5kZXgucnN0Cj4gQEAgLTE0LDYgKzE0LDcgQEAg
UklTQy1WIGFyY2hpdGVjdHVyZQo+ICAgICAgdWFiaQo+ICAgICAgdmVjdG9yCj4gICAgICBjbW9k
eAo+ICsgICAgemljZmlscAo+Cj4gICAgICBmZWF0dXJlcwo+Cj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vYXJjaC9yaXNjdi96aWNmaWxwLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNj
di96aWNmaWxwLnJzdAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAw
Li5hMTg4ZDc4ZmNkZTYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L3ppY2ZpbHAucnN0Cj4gQEAgLTAsMCArMSwxMTUgQEAKPiArLi4gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAKPiArCj4gKzpBdXRob3I6IERlZXBhayBHdXB0YSA8ZGVidWdA
cml2b3NpbmMuY29tPgo+ICs6RGF0ZTogICAxMiBKYW51YXJ5IDIwMjQKPiArCj4gKz09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiArVHJhY2tpbmcg
aW5kaXJlY3QgY29udHJvbCB0cmFuc2ZlcnMgb24gUklTQy1WIExpbnV4Cj4gKz09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiArCj4gK1RoaXMgZG9j
dW1lbnQgYnJpZWZseSBkZXNjcmliZXMgdGhlIGludGVyZmFjZSBwcm92aWRlZCB0byB1c2Vyc3Bh
Y2UgYnkgTGludXgKPiArdG8gZW5hYmxlIGluZGlyZWN0IGJyYW5jaCB0cmFja2luZyBmb3IgdXNl
ciBtb2RlIGFwcGxpY2F0aW9ucyBvbiBSSVNWLVYKPiArCj4gKzEuIEZlYXR1cmUgT3ZlcnZpZXcK
PiArLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK01lbW9yeSBjb3JydXB0aW9uIGlzc3VlcyB1
c3VhbGx5IHJlc3VsdCBpbiB0byBjcmFzaGVzLCBob3dldmVyIHdoZW4gaW4gaGFuZHMgb2YKPiAr
YW4gYWR2ZXJzYXJ5IGFuZCBpZiB1c2VkIGNyZWF0aXZlbHkgY2FuIHJlc3VsdCBpbnRvIHZhcmll
dHkgc2VjdXJpdHkgaXNzdWVzLgo+ICsKPiArT25lIG9mIHRob3NlIHNlY3VyaXR5IGlzc3VlcyBj
YW4gYmUgY29kZSByZS11c2UgYXR0YWNrcyBvbiBwcm9ncmFtIHdoZXJlIGFkdmVyc2FyeQo+ICtj
YW4gdXNlIGNvcnJ1cHQgZnVuY3Rpb24gcG9pbnRlcnMgYW5kIGNoYWluIHRoZW0gdG9nZXRoZXIg
dG8gcGVyZm9ybSBqdW1wIG9yaWVudGVkCj4gK3Byb2dyYW1taW5nIChKT1ApIG9yIGNhbGwgb3Jp
ZW50ZWQgcHJvZ3JhbW1pbmcgKENPUCkgYW5kIHRodXMgY29tcHJvbWlzaW5nIGNvbnRyb2wKPiAr
ZmxvdyBpbnRlZ3JpdHkgKENGSSkgb2YgdGhlIHByb2dyYW0uCj4gKwo+ICtGdW5jdGlvbiBwb2lu
dGVycyBsaXZlIGluIHJlYWQtd3JpdGUgbWVtb3J5IGFuZCB0aHVzIGFyZSBzdXNjZXB0aWJsZSB0
byBjb3JydXB0aW9uCj4gK2FuZCBhbGxvd3MgYW4gYWR2ZXJzYXJ5IHRvIHJlYWNoIGFueSBwcm9n
cmFtIGNvdW50ZXIgKFBDKSBpbiBhZGRyZXNzIHNwYWNlLiBPbgo+ICtSSVNDLVYgemljZmlscCBl
eHRlbnNpb24gZW5mb3JjZXMgYSByZXN0cmljdGlvbiBvbiBzdWNoIGluZGlyZWN0IGNvbnRyb2wK
PiArdHJhbnNmZXJzOgo+ICsKPiArLSBpbmRpcmVjdCBjb250cm9sIHRyYW5zZmVycyBtdXN0IGxh
bmQgb24gYSBsYW5kaW5nIHBhZCBpbnN0cnVjdGlvbiBgYGxwYWRgYC4KPiArICBUaGVyZSBhcmUg
dHdvIGV4Y2VwdGlvbiB0byB0aGlzIHJ1bGU6Cj4gKwo+ICsgIC0gcnMxID0geDEgb3IgcnMxID0g
eDUsIGkuZS4gYSByZXR1cm4gZnJvbSBhIGZ1bmN0aW9uIGFuZCByZXR1cm5zIGFyZQo+ICsgICAg
cHJvdGVjdGVkIHVzaW5nIHNoYWRvdyBzdGFjayAoc2VlIHppY2Zpc3MucnN0KQo+ICsKPiArICAt
IHJzMSA9IHg3LiBPbiBSSVNDLVYgY29tcGlsZXIgdXN1YWxseSBkb2VzIGJlbG93IHRvIHJlYWNo
IGZ1bmN0aW9uCj4gKyAgICB3aGljaCBpcyBiZXlvbmQgdGhlIG9mZnNldCBwb3NzaWJsZSBKLXR5
cGUgaW5zdHJ1Y3Rpb246Ogo+ICsKPiArICAgICAgYXVpcGMgeDcsIDxpbW0+Cj4gKyAgICAgIGph
bHIgKHg3KQo+ICsKPiArICAgICAgIFN1Y2ggZm9ybSBvZiBpbmRpcmVjdCBjb250cm9sIHRyYW5z
ZmVyIGFyZSBzdGlsbCBpbW11dGFibGUgYW5kIGRvbid0IHJlbHkKPiArICAgIG9uIG1lbW9yeSBh
bmQgdGh1cyByczE9eDcgaXMgZXhlbXB0ZWQgZnJvbSB0cmFja2luZyBhbmQgY29uc2lkZXJlZCBz
b2Z0d2FyZQo+ICsgICAgZ3VhcmRlZCBqdW1wcy4KPiArCj4gK2BgbHBhZGBgIGluc3RydWN0aW9u
IGlzIHBzZXVkbyBvZiBgYGF1aXBjIHJkLCA8aW1tXzIwYml0PmBgIHdpdGggYGByZD14MGBgIGFu
ZAo+ICtpcyBhIEhJTlQgbm9wLiBgYGxwYWRgYCBpbnN0cnVjdGlvbiBtdXN0IGJlIGFsaWduZWQg
b24gNCBieXRlIGJvdW5kYXJ5IGFuZAo+ICtjb21wYXJlcyAyMCBiaXQgaW1tZWRpYXRlIHdpdGh4
Ny4gSWYgYGBpbW1fMjBiaXRgYCA9PSAwLCBDUFUgZG9uJ3QgcGVyZm9ybSBhbnkKPiArY29tcGFy
aXNpb24gd2l0aCBgYHg3YGAuIElmIGBgaW1tXzIwYml0YGAgIT0gMCwgdGhlbiBgYGltbV8yMGJp
dGBgIG11c3QgbWF0Y2gKPiArYGB4N2BgIGVsc2UgQ1BVIHdpbGwgcmFpc2UgYGBzb2Z0d2FyZSBj
aGVjayBleGNlcHRpb25gYCAoYGBjYXVzZT0xOGBgKSB3aXRoCj4gK2BgKnR2YWwgPSAyYGAuCj4g
Kwo+ICtDb21waWxlciBjYW4gZ2VuZXJhdGUgYSBoYXNoIG92ZXIgZnVuY3Rpb24gc2lnbmF0dXJl
cyBhbmQgc2V0dXAgdGhlbSAodHJ1bmNhdGVkCj4gK3RvIDIwYml0KSBpbiB4NyBhdCBjYWxsc2l0
ZXMgYW5kIGZ1bmN0aW9uIHByb2xvZ3VlcyBjYW4gaGF2ZSBgYGxwYWRgYCB3aXRoIHNhbWUKPiAr
ZnVuY3Rpb24gaGFzaC4gVGhpcyBmdXJ0aGVyIHJlZHVjZXMgbnVtYmVyIG9mIHByb2dyYW0gY291
bnRlcnMgYSBjYWxsIHNpdGUgY2FuCj4gK3JlYWNoLgo+ICsKPiArMi4gRUxGIGFuZCBwc0FCSQo+
ICstLS0tLS0tLS0tLS0tLS0tLQo+ICsKPiArVG9vbGNoYWluIHNldHMgdXAgOmM6bWFjcm86YEdO
VV9QUk9QRVJUWV9SSVNDVl9GRUFUVVJFXzFfRkNGSWAgZm9yIHByb3BlcnR5Cj4gKzpjOm1hY3Jv
OmBHTlVfUFJPUEVSVFlfUklTQ1ZfRkVBVFVSRV8xX0FORGAgaW4gbm90ZXMgc2VjdGlvbiBvZiB0
aGUgb2JqZWN0IGZpbGUuCj4gKwo+ICszLiBMaW51eCBlbmFibGluZwo+ICstLS0tLS0tLS0tLS0t
LS0tLS0KPiArCj4gK1VzZXIgc3BhY2UgcHJvZ3JhbXMgY2FuIGhhdmUgbXVsdGlwbGUgc2hhcmVk
IG9iamVjdHMgbG9hZGVkIGluIGl0cyBhZGRyZXNzIHNwYWNlCj4gK2FuZCBpdCdzIGEgZGlmZmlj
dWx0IHRhc2sgdG8gbWFrZSBzdXJlIGFsbCB0aGUgZGVwZW5kZW5jaWVzIGhhdmUgYmVlbiBjb21w
aWxlZAo+ICt3aXRoIHN1cHBvcnQgb2YgaW5kaXJlY3QgYnJhbmNoLiBUaHVzIGl0J3MgbGVmdCB0
byBkeW5hbWljIGxvYWRlciB0byBlbmFibGUKPiAraW5kaXJlY3QgYnJhbmNoIHRyYWNraW5nIGZv
ciB0aGUgcHJvZ3JhbS4KPiArCj4gKzQuIHByY3RsKCkgZW5hYmxpbmcKPiArLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiArCj4gKzpjOm1hY3JvOmBQUl9TRVRfSU5ESVJfQlJfTFBfU1RBVFVTYCAvIDpj
Om1hY3JvOmBQUl9HRVRfSU5ESVJfQlJfTFBfU1RBVFVTYCAvCj4gKzpjOm1hY3JvOmBQUl9MT0NL
X0lORElSX0JSX0xQX1NUQVRVU2AgYXJlIHRocmVlIHByY3RscyBhZGRlZCB0byBtYW5hZ2UgaW5k
aXJlY3QKPiArYnJhbmNoIHRyYWNraW5nLiBwcmN0bHMgYXJlIGFyY2ggYWdub3N0aWMgYW5kIHJl
dHVybnMgLUVJTlZBTCBvbiBvdGhlciBhcmNoZXMuCj4gKwo+ICsqIHByY3RsKFBSX1NFVF9JTkRJ
Ul9CUl9MUF9TVEFUVVMsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ICsKPiArSWYgYXJnMSBpcyA6Yzpt
YWNybzpgUFJfSU5ESVJfQlJfTFBfRU5BQkxFYCBhbmQgaWYgQ1BVIHN1cHBvcnRzIGBgemljZmls
cGBgCj4gK3RoZW4ga2VybmVsIHdpbGwgZW5hYmxlZCBpbmRpcmVjdCBicmFuY2ggdHJhY2tpbmcg
Zm9yIHRoZSB0YXNrLiBEeW5hbWljIGxvYWRlcgo+ICtjYW4gaXNzdWUgdGhpcyA6YzptYWNybzpg
cHJjdGxgIG9uY2UgaXQgaGFzIGRldGVybWluZWQgdGhhdCBhbGwgdGhlIG9iamVjdHMKPiArbG9h
ZGVkIGluIGFkZHJlc3Mgc3BhY2Ugc3VwcG9ydCBpbmRpcmVjdCBicmFuY2ggdHJhY2tpbmcuIEFk
ZGl0aW9uYWxseSBpZiB0aGVyZQo+ICtpcyBhIGBkbG9wZW5gIHRvIGFuIG9iamVjdCB3aGljaCB3
YXNuJ3QgY29tcGlsZWQgd2l0aCBgYHppY2ZpbHBgYCwgZHluYW1pYwo+ICtsb2FkZXIgY2FuIGlz
c3VlIHRoaXMgcHJjdGwgd2l0aCBhcmcxIHNldCB0byAwIChpLmUuCj4gKzpjOm1hY3JvOmBQUl9J
TkRJUl9CUl9MUF9FTkFCTEVgIGJlaW5nIGNsZWFyKQo+ICsKPiArKiBwcmN0bChQUl9HRVRfSU5E
SVJfQlJfTFBfU1RBVFVTLCB1bnNpZ25lZCBsb25nIGFyZykKPiArCj4gK1JldHVybnMgY3VycmVu
dCBzdGF0dXMgb2YgaW5kaXJlY3QgYnJhbmNoIHRyYWNraW5nLiBJZiBlbmFibGVkIGl0J2xsIHJl
dHVybgo+ICs6YzptYWNybzpgUFJfSU5ESVJfQlJfTFBfRU5BQkxFYAo+ICsKPiArKiBwcmN0bChQ
Ul9MT0NLX0lORElSX0JSX0xQX1NUQVRVUywgdW5zaWduZWQgbG9uZyBhcmcpCj4gKwo+ICtMb2Nr
cyBjdXJyZW50IHN0YXR1cyBvZiBpbmRpcmVjdCBicmFuY2ggdHJhY2tpbmcgb24gdGhlIHRhc2su
IFVzZXIgc3BhY2UgbWF5Cj4gK3dhbnQgdG8gcnVuIHdpdGggc3RyaWN0IHNlY3VyaXR5IHBvc3R1
cmUgYW5kIHdvdWxkbid0IHdhbnQgbG9hZGluZyBvZiBvYmplY3RzCj4gK3dpdGhvdXQgYGB6aWNm
aWxwYGAgc3VwcG9ydCBpbiBpdCBhbmQgdGh1cyB3b3VsZCB3YW50IHRvIGRpc2FsbG93IGRpc2Fi
bGluZyBvZgo+ICtpbmRpcmVjdCBicmFuY2ggdHJhY2tpbmcuIEluIHRoYXQgY2FzZSB1c2VyIHNw
YWNlIGNhbiB1c2UgdGhpcyBwcmN0bCB0byBsb2NrCj4gK2N1cnJlbnQgc2V0dGluZ3MuCj4gKwo+
ICs1LiB2aW9sYXRpb25zIHJlbGF0ZWQgdG8gaW5kaXJlY3QgYnJhbmNoIHRyYWNraW5nCj4gKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gKwo+ICtQ
ZXJ0YWluaW5nIHRvIGluZGlyZWN0IGJyYW5jaCB0cmFja2luZywgQ1BVIHJhaXNlcyBzb2Z0d2Fy
ZSBjaGVjayBleGNlcHRpb24gaW4KPiArZm9sbG93aW5nIGNvbmRpdGlvbnM6Cj4gKwo+ICstIG1p
c3NpbmcgYGBscGFkYGAgYWZ0ZXIgaW5kaXJlY3QgY2FsbCAvIGptcAo+ICstIGBgbHBhZGBgIG5v
dCBvbiA0IGJ5dGUgYm91bmRhcnkKPiArLSBgYGltbV8yMGJpdGBgIGVtYmVkZGVkIGluIGBgbHBh
ZGBgIGluc3RydWN0aW9uIGRvZXNuJ3QgbWF0Y2ggd2l0aCBgYHg3YGAKPiArCj4gK0luIGFsbCAz
IGNhc2VzLCBgYCp0dmFsID0gMmBgIGlzIGNhcHR1cmVkIGFuZCBzb2Z0d2FyZSBjaGVjayBleGNl
cHRpb24gaXMKPiArcmFpc2VkIChgYGNhdXNlPTE4YGApCj4gKwo+ICtMaW51eCBrZXJuZWwgd2ls
bCB0cmVhdCB0aGlzIGFzIDpjOm1hY3JvOmBTSUdTRVZgYCB3aXRoIGNvZGUgPQo+ICs6YzptYWNy
bzpgU0VHVl9DUEVSUmAgYW5kIGZvbGxvdyBub3JtYWwgY291cnNlIG9mIHNpZ25hbCBkZWxpdmVy
eS4KPgoKTEdUTS4KClJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4g
LS0KPiAyLjM0LjEKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
