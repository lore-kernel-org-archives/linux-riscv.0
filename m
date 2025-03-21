Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DCCC35FF3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 07:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DnWKS8LDEbwJ1yAxuKBi8KJcWYjzzApqTmJ6fk+Eo0=; b=GDqfF7DuTGAnTA
	Ox0J6L8sUkrpAJBL6mpa9puHOJ1lQqFn3QOPfDNScpUPZacu3uCOFx2LJa05y6u9jbsBt3HCl9NlL
	dcIpZdaeQyo4VhDcRMzEXJnn4kYxsLpTanaFMl2Nj6cuT1UgEydu61fNkXPPeuZXcct/MlUZO3whk
	m6zmXE6H7bTKCNr9jAJJZ71MLk+FfFVBujzHBVEuhrCk1l6YsRq1P18FDrcWU7OS2Q9jKXeXQeiW4
	KQYiSdWDh4Vth1Sgt4NayY7MD69ZDzZgmf/BUhTWEI/xKo1Egbjo7Be3/H6MKDgfvsqAt8S8ASRRR
	2KFJJZmH8cSmjYh4wDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWib-0000000E5XY-3fQa;
	Fri, 21 Mar 2025 07:23:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWiZ-0000000E5WD-1bzl
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 07:23:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4394944f161so1865325e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742541778; x=1743146578; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/25ortMfNWyDWu+kRgDZEazYd+Unr6LrL65OHsKgfr8=;
        b=Q1giE76I32YSJSwe11+Tb5CX5xfjqsjyq6mLcKxNHye1hR3EEpnjxlQJB6Fu0tP1Jz
         jldtvpJe/VKc0OXH2T8pcPxl/mwECcNdVM5l1iYnyNw5tnWFSoaW6lZ8we9Jg8cpobCo
         jy2RHGH8MdSHKo9lqC3w04bQ5vv9TlwSA2mbolOnpzFYIooBmYs/qKEzmEQi+hkT0h3n
         52RrUBSbXMqN9C0qhlhy7QFU9oZPTkAS7ot+5ymEWd+UqtwbEwjcHVplZ7T2eGu4GHC5
         uP+Bypoy2Xaac4rkerpZAFekjlm00waxh++ybgfPbXUOjO/qNIfkK1gQtGU3wKVd82il
         BPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742541778; x=1743146578;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/25ortMfNWyDWu+kRgDZEazYd+Unr6LrL65OHsKgfr8=;
        b=tbMBjVDfo9nLe3KtvZIqxzkCnJj5B1prRIvStf+loP3s8GkmOi8iKmYsh7imk0uSRg
         L4u6A0wPHfYLQL0JF7TRtaM9+17vOqWs6v+gNAaILYSgPJQDifi44q5O/WDS9aAnl+1g
         3HeCSGmq13h27rpQ3v3cwGaSyrAw9iJSAKeVQwczUizcnqkoCw+8Q6x0gGwZQWn3/pQ4
         vhBWN5YAAsT6qRlw4OwbSq5H5pbo+9IXsgLJYzQpUziCpUxJif3/npa5vAUdb7HkzHED
         GR3WoR7xlbz4uz54f29hLFNsCITrAcwgEei8CkOVKC+cEEzGNJVzLs+0Kr2DRWGvT2Cv
         Mw5A==
X-Forwarded-Encrypted: i=1; AJvYcCXrvmlk59ZA1A4j4c7uf6gqbBuUpFrCYDjIVU//vp+LOxv4D85l1AE8qMS+G2jSi3Fvco5NrASPcrxZdA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb8go/DDme8/dpkrikdSaZt2GAmDbip4ycxx2PjxobqF5ujtZB
	Cx6w/8yjjHtJM9guwpnjXmZPH3qW7D0f+Sy+Gr5c1wUYKGZBSMNeMkBvry8e4Ig=
X-Gm-Gg: ASbGncuSJNP8McoQGTZ5xTCYCOpVzcZqXRbZ0RdUzXQEJhCTfW+j278TxAtEzJyJI9i
	0JItiil/XBVqVku/io2ZKDlEVXeaDmnrFwgvtedKblT5UXCG7qNygV35wqyUzGp4Yl6ySV/qNrA
	jM+kUJQvXQXvWW0OQApPSh07X0jP+DL+cZsTC2/b8192U+D2RVzaJ8NtkOgRsVIFnexzWUV+U/X
	83muK4BrK1uE8ri+feZDeZjhA0Rc+79JbTAbRMaNDHcLt9oDtlf8NSGIEBJW2JqmTXCYE0FnPKN
	SRz5hcDKd0GSC4N9X7c+uqZz94xA8xk/Ye6YsUbK8K19Ar3LYTIlcyGLPULYDrqnbiovbe09aQR
	40olK
X-Google-Smtp-Source: AGHT+IFU7wrxqVXUGlM5v1RoJxyo0mt50QhSrJ/ZcnqbElE1lD78gF7+vCkNQEgx0IT1Onq7RRwDeQ==
X-Received: by 2002:a05:600c:1c1c:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-43d50a3b5ccmr5385925e9.3.1742541777651;
        Fri, 21 Mar 2025 00:22:57 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f43cbasm68963045e9.9.2025.03.21.00.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:22:57 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 21 Mar 2025 08:22:56 +0100
Message-Id: <D8LRI8WGXGVD.3B0VB9PCQ9I2R@ventanamicro.com>
Subject: Re: [PATCH v12 19/28] riscv/ptrace: riscv cfi status and state via
 ptrace and in core files
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Conor Dooley" <conor@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Eric Biederman" <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann
 Horn" <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-19-e51202b53138@rivosinc.com>
 <D8LG1TTBMPWX.3MKAEM8X1WYAX@ventanamicro.com>
 <CAKC1njQ8P2mNiiev-NDyTJPjJ6AAVqrtHMcwt_sc5A7Z+3-Jrg@mail.gmail.com>
In-Reply-To: <CAKC1njQ8P2mNiiev-NDyTJPjJ6AAVqrtHMcwt_sc5A7Z+3-Jrg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_002259_423246_4854BD67 
X-CRM114-Status: GOOD (  15.65  )
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

MjAyNS0wMy0yMFQxNjowOToxMi0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgTWFyIDIwLCAyMDI1IGF0IDM6MjTigK9QTSBSYWRpbSBLcsSNbcOhxZkg
PHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+IDIwMjUtMDMtMTRUMTQ6Mzk6Mzgt
MDc6MDAsIERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPj4gPiBFeHBvc2UgYSBu
ZXcgcmVnaXN0ZXIgdHlwZSBOVF9SSVNDVl9VU0VSX0NGSSBmb3IgcmlzYy12IGNmaSBzdGF0dXMg
YW5kCj4+ID4gc3RhdGUuIEludGVudGlvbmFsbHkgYm90aCBsYW5kaW5nIHBhZCBhbmQgc2hhZG93
IHN0YWNrIHN0YXR1cyBhbmQgc3RhdGUKPj4gPiBhcmUgcm9sbGVkIGludG8gY2ZpIHN0YXRlLiBD
cmVhdGluZyB0d28gZGlmZmVyZW50IE5UX1JJU0NWX1VTRVJfWFhYIHdvdWxkCj4+ID4gbm90IGJl
IHVzZWZ1bCBhbmQgd2FzdGFnZSBvZiBhIG5vdGUgdHlwZS4gRW5hYmxpbmcgb3IgZGlzYWJsaW5n
IG9mIGZlYXR1cmUKPj4gPiBpcyBub3QgYWxsb3dlZCB2aWEgcHRyYWNlIHNldCBpbnRlcmZhY2Uu
IEhvd2V2ZXIgc2V0dGluZyBgZWxwYCBzdGF0ZSBvcgo+PiA+IHNldHRpbmcgc2hhZG93IHN0YWNr
IHBvaW50ZXIgYXJlIGFsbG93ZWQgdmlhIHB0cmFjZSBzZXQgaW50ZXJmYWNlLiBJdCBpcwo+PiA+
IGV4cGVjdGVkIGBnZGJgIG1pZ2h0IGhhdmUgdXNlIHRvIGZpeHVwIGBlbHBgIHN0YXRlIG9yIGBz
aGFkb3cgc3RhY2tgCj4+ID4gcG9pbnRlci4KPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6IERlZXBh
ayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+PiA+IC0tLQo+PiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20vcHRyYWNlLmgKPj4gPiBpbmRleCA2NTllYTNhZjU2ODAuLmU2NTcxZmJhOGE4YSAx
MDA2NDQKPj4gPiBAQCAtMTMxLDYgKzEzMSwyNCBAQCBzdHJ1Y3QgX19zY19yaXNjdl9jZmlfc3Rh
dGUgewo+PiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgc3NfcHRyOyAgIC8qIHNoYWRvdyBzdGFjayBw
b2ludGVyICovCj4+ID4gIH07Cj4+ID4KPj4gPiArc3RydWN0IF9fY2ZpX3N0YXR1cyB7Cj4+ID4g
KyAgICAgLyogaW5kaXJlY3QgYnJhbmNoIHRyYWNraW5nIHN0YXRlICovCj4+ID4gKyAgICAgX191
NjQgbHBfZW4gOiAxOwo+PiA+ICsgICAgIF9fdTY0IGxwX2xvY2sgOiAxOwo+PiA+ICsgICAgIF9f
dTY0IGVscF9zdGF0ZSA6IDE7Cj4+ID4gKwo+PiA+ICsgICAgIC8qIHNoYWRvdyBzdGFjayBzdGF0
dXMgKi8KPj4gPiArICAgICBfX3U2NCBzaHN0a19lbiA6IDE7Cj4+ID4gKyAgICAgX191NjQgc2hz
dGtfbG9jayA6IDE7Cj4+Cj4+IEkgcmVtZW1iZXIgdGhlcmUgd2FzIGRlZXAgaGF0cmVkIHRvd2Fy
ZHMgYml0ZmllbGRzIGluIHRoZSBMaW51eAo+PiBjb21tdW5pdHksIGhhdmUgdGhpbmdzIGNoYW5n
ZXM/Cj4KPiBobW0uIEkgZGlkbid0IGtub3cgYWJvdXQgdGhlIHN0cm9uZyBoYXRyZWQuCgpUaGVy
ZSBpcyBhIGdvb2QgcmVhc29uIGZvciBpdC4gOikKClRoZSBDIHN0YW5kYXJkIGxlZnQgaW1wb3J0
YW50IGJlaGF2aW9yIGFzIGltcGxlbWVudGF0aW9uLXNwZWNpZmljIChieQptaXN0YWtlLCBJIGhv
cGUpLiAgSSBkbyBsaWtlIGJpdGZpZWxkcywgYnV0IHlvdSBoYXZlIHRvIGJlIGV4dHJhIGNhcmVm
dWwKd2hlbiB3b3JraW5nIHdpdGggdGhlbS4KCj4gQWx0aG91Z2ggSSBjYW4gc2VlIGxvdHMgb2Yg
ZXhhbXBsZXMgb2YgdGhpcyBwYXR0ZXJuIGluIGV4aXN0aW5nIGtlcm5lbCBjb2RlLgo+IE5vIHN0
cm9uZyBmZWVsaW5ncyBvbiBteSBzaWRlLCBJIGNhbiBjaGFuZ2UgdGhpcyBhbmQgaGF2ZSBpdCBz
aW5nbGUgNjRiaXQgZmllbGQKPiBhbmQgYWNjZXNzZWQgdmlhIGJpdG1hc2tzLgoKVGhpcyBpcyB1
YXBpIGFuZCBiaXRmaWVsZHMgZG8gbm90IHNwZWNpZnkgdGhlIGludGVybmFsIHJlcHJlc2VudGF0
aW9uLgpBIHByb2dyYW0gY29tcGlsZWQgYXQgYSBkaWZmZXJlbnQgdGltZSBjYW4gc2VlIGNvbXBs
ZXRlbHkgZGlmZmVyZW50Cm9yZGVyIG9mIHRoZSBiaXRmaWVsZHMsIHNvIHRoZSB1YXBpIHdvdWxk
IGJyZWFrLgoKV2UgY2Fubm90IHVzZSBiaXRmaWVsZHMgaGVyZS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
