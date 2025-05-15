Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BCCC2D0CD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Od/jdq7mztRIprVui3eyRWiu7BvUKJOpy6Hna7VBkQc=; b=s8av5jxCcz8QPE
	F1Izyk4XWnD+e+gpwW/nllNYrZHoJObkWkd9YdFFjYOLrV9kn1gITxW8nuXMqDycjZdQV2G+BYpNm
	gozNkuyosXPbdkNn20uPSNkGBOjG4xbRvcgWJ9CLK3awbtZSlfcwk/JWTw5ALEuCofwd53ufdvE/6
	Z3ZhKNH1MR+WFCL6o/dPb+3ok8nqgY4PDugG/wqvcaXY0c6M183IDbaoNtuBM6kQ/ZC1H+NK024jj
	cPGHAsAiiKT667TJPbgU2BGdMd/sNkDlLEoIxWSeGI+CIso1uzAUsLTFdse3GSJb7ppUQFUogZ11U
	5n+HLI3K78APUwZp6MCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVRw-00000000FT0-04WJ;
	Thu, 15 May 2025 10:04:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUGg-000000002dD-1yAK
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 May 2025 08:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bdVLI+IKJQCwIaBP/4ipGt86DAIuj3sOKMK9lc4aqFc=; b=Id4cYpzRBxt9nxSKeRZUWThS6E
	ZRFOV3Qs4Xq+GuKus5S/qazyZqi6Ci9qVyA1r/G/B+5kVsQqgqeq6nCA6epPSabT8raQhT3jpz9Pi
	fiQ5tb7pKnBQX7WTZ3t33xLAMLTnSgugEfaNaWoWv8I2CqqW9OC9lO4Rfx4+Ij/VddBpWLucLAxre
	j3aCoVLxCYeJON8nd7voz7tgJ9bpnd53QcZZS1nObYR/M9QJt8Gd/ubmU7GgOlCQgP/FX8oEnxMjN
	Cx9xcE+YulT3r/kaEN/K+lumD/lYFZhCKYx+K/bo+2ve/PZvmGw2LAg5KjX9g8mhSMf9nTqdn/Pgq
	3pPrP1Pg==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFUGd-0000000HPdc-0yEu
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:48:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cee550af2so370205e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 01:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747298916; x=1747903716; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdVLI+IKJQCwIaBP/4ipGt86DAIuj3sOKMK9lc4aqFc=;
        b=l8IP7Ef5Zx88RGYlqCUyzPk8qEK2ufDSktwE4lq7AEJQzbFuot+bKWTzPLIWr/A1/A
         TlToezzmU8CYj4eEafk1B3iXYyP0KVYk+u8ZfbOIZoQmGljnewq9dIEN6jEzNdAFq8I9
         U+5CRR+Pw16t5UZlhK49XDz1HhPOstxOrUftlHLMsWJXww6eqRFcy56UgW58OD3t5hDW
         Uu3Zimcn6StrZaAdcp3uXyBWau+RPNH06vJOJ6VrzynWVHebL1BfIo+5SKB22iBqi4nl
         HnLrBfsl6EFqtQ5KCjOYUjaHkxRWYA9aZw1v4OtUHZuo5qpGJ+5wrcfOK1EgRdhSBSBC
         4lPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747298916; x=1747903716;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bdVLI+IKJQCwIaBP/4ipGt86DAIuj3sOKMK9lc4aqFc=;
        b=RFfHHoe7qFSq6ZuJ1R2F3/PEui3PcN1+ZP99s8tPgMkvryIyMD/V0A0y/dYxQV21GP
         YwFRYtX8OGS3mibnriVf0kAk7l5OWenKgTfCXR4OVBXz1xjIHKEQGwyqqLfUgk7U27xj
         qiLcdIJTLm6zPuE5I26X6CR3++tLo2Ex8XC7ByKOdQODzEmDuASqHOksJHDB6t9CXkmZ
         uorKBNZHxsYgJcprOyUKDz0+3cPpORPGKRhgcY9gZICQwb25bEiRzwwk25KbrxdN31uA
         QDGl5wgWBOohNSpSAwVL5bJXuyFKbOi1GeIg3AGFJY6RX67xATCdI9YndwzrHXqMX0ob
         QA1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEP28jU5vW8jlURM3NGnQO8vmz7tl5RVfioJwcng464jTJwH0W9cEZWadNo9+yuqUEII5r8aCAJCxRjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEfiw3irjLERo5eq0Z+rZxJs4R0LunwWJYIwBtZbY5Ar9cIBF9
	weAwXkHhMIBCXnXzQNDSBs7Y6qClUbQ0o4b3e6MaLpkKMXYA5eW48cOLyCu22TU=
X-Gm-Gg: ASbGncv3jSNHUvG6moqd8/c6peMf1hfBzBrt0fnF81ERLQOCgmzdvp7dF3oCcMBSnyZ
	8Z2I0YoImH+GJJDzDzqX3PkhIY0j44LdLntUOXdn5TBp/Em7JKYFGkAWtWBgpkOZs9i2nfbSGSh
	DHAEl29nH9QSrWOaiC1E8TPvXEsX3UR4lx/oBTUm8MttqV1PgSTn40sfjPuMUdMSVGluIShI284
	0dRi6j/rNwUToEHFlHtGvZxnDPTgsIfCM0gt8bSlQzoXxX+BIdJo6yXHUpZoEufjf5KkjyKm+VQ
	hfrX7l7pN/RX6nN/WrCrNTIlHLVm2wRhht2am/hEBZCbp2FXonOGbXDRI4n40+nDbA0ca/YRU4G
	8TgYLiBalGJg=
X-Google-Smtp-Source: AGHT+IFl5ofT8H2ymocVMBID7uffI6yQBoHWwntFgE3AOdsNMnKtMdzBwHwHlEbKzThnIcYnf09dKg==
X-Received: by 2002:a5d:4311:0:b0:3a3:55b4:1abb with SMTP id ffacd0b85a97d-3a355b41b8emr294033f8f.12.1747298916300;
        Thu, 15 May 2025 01:48:36 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf2bsm21822557f8f.80.2025.05.15.01.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:48:35 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 15 May 2025 10:48:35 +0200
Message-Id: <D9WLRSAB63M5.3DZD4ND3WVZ6F@ventanamicro.com>
Subject: Re: [PATCH v15 05/27] riscv: usercfi state for task and
 save/restore of CSR_SSP on trap entry/exit
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>,
 <rust-for-linux@vger.kernel.org>, "Zong Li" <zong.li@sifive.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Alexandre Ghiti" <alex@ghiti.fr>, "Deepak Gupta" <debug@rivosinc.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
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
 Horn" <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
 <20250502-v5_user_cfi_series-v15-5-914966471885@rivosinc.com>
 <D9OZVNOGLU4T.2XOUPX27HN0W8@ventanamicro.com>
 <122fc6cd-2e21-4fca-979d-bcf558107b81@ghiti.fr>
In-Reply-To: <122fc6cd-2e21-4fca-979d-bcf558107b81@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_094839_505277_73BB9EDB 
X-CRM114-Status: GOOD (  12.61  )
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

MjAyNS0wNS0xNVQwOToyODoyNSswMjowMCwgQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZy
PjoKPiBPbiAwNi8wNS8yMDI1IDEyOjEwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+IDIwMjUt
MDUtMDJUMTY6MzA6MzYtMDc6MDAsIERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoK
Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvZW50cnkuUwo+Pj4gQEAgLTkxLDYgKzkxLDMyIEBACj4+PiArLm1hY3JvIHJlc3RvcmVf
dXNlcnNzcCB0bXAKPj4+ICsJQUxURVJOQVRJVkUoIm5vcHMoMikiLAo+Pj4gKwkJX19zdHJpbmdp
ZnkoCQkJCVwKPj4+ICsJCVJFR19MIFx0bXAsIFRBU0tfVElfVVNFUl9TU1AodHApOwlcCj4+PiAr
CQljc3J3IENTUl9TU1AsIFx0bXApLAo+Pj4gKwkJMCwKPj4+ICsJCVJJU0NWX0lTQV9FWFRfWklD
RklTUywKPj4+ICsJCUNPTkZJR19SSVNDVl9VU0VSX0NGSSkKPj4+ICsuZW5kbQo+PiBEbyB3ZSBu
ZWVkIHRvIGVtaXQgdGhlIG5vcHMgd2hlbiBDT05GSUdfUklTQ1ZfVVNFUl9DRkkgaXNuJ3Qgc2Vs
ZWN0ZWQ/Cj4+Cj4+IChXaHkgbm90IHB1dCAjaWZkZWYgQ09ORklHX1JJU0NWX1VTRVJfQ0ZJIGFy
b3VuZCB0aGUgQUxURVJOQVRJVkVTPykKPgo+IFRoZSBhbHRlcm5hdGl2ZXMgYXJlIHVzZWQgdG8g
Y3JlYXRlIGEgZ2VuZXJpYyBrZXJuZWwgdGhhdCBjb250YWlucyB0aGUgCj4gY29kZSBmb3IgYSBs
YXJnZSBudW1iZXIgb2YgZXh0ZW5zaW9ucyBhbmQgb25seSBlbmFibGUgaXQgYXQgcnVudGltZSAK
PiBkZXBlbmRpbmcgb24gdGhlIHBsYXRmb3JtIGNhcGFiaWxpdGllcy4gVGhpcyB3YXkgZGlzdHJv
cyBjYW4gc2hpcCBhIAo+IHNpbmdsZSBrZXJuZWwgdGhhdCB3b3JrcyBvbiBhbGwgcGxhdGZvcm1z
LgoKWXVwLCBhbmQgaWYgYSBrZXJuZWwgaXMgY29tcGlsZWQgd2l0aG91dCBDT05GSUdfUklTQ1Zf
VVNFUl9DRkksIHRoZSBub3BzCndpbGwgb25seSBlbmxhcmdlIHRoZSBiaW5hcnkgYW5kIHBvdGVu
dGlhbGx5IHNsb3cgZG93biBleGVjdXRpb24uCkluIG90aGVyIHdvcmRzLCB3aHkgd2UgZG9uJ3Qg
ZG8gc29tZXRoaW5nIGxpa2UgdGhpcwoKICghQ09ORklHX1JJU0NWX1VTRVJfQ0ZJID8gIiIgOgog
ICAoUklTQ1ZfSVNBX0VYVF9aSUNGSVNTID8gX19zdHJpbmdpZnkoLi4uKSA6ICJub3BzKHgpIikp
CgppbnN0ZWFkIG9mIHRoZSBjdXJyZW50CgogKENPTkZJR19SSVNDVl9VU0VSX0NGSSAmJgogICAg
UklTQ1ZfSVNBX0VYVF9aSUNGSVNTID8gX19zdHJpbmdpZnkoLi4uKSA6ICJub3BzKHgpIikKCkl0
IGNvdWxkIGJlIGEgbmV3IHByZXByb2Nlc3NvciBtYWNybyBpbiBjYXNlIHdlIHdhbnRlZCB0byBt
YWtlIGl0IG5pY2UsCmJ1dCBpdCdzIHByb2JhYmx5IG5vdCBhIGNvbW1vbiBjYXNlLCBzbyBhbiBp
ZmRlZiBjb3VsZCB3b3JrIGFzIHdlbGwuCgpEbyB3ZSBqdXN0IGdlbmVyYWxseSBub3QgY2FyZSBh
Ym91dCBzdWNoIG1pbm9yIG9wdGltaXphdGlvbnM/CgooSWYgd2Ugd2FudGVkIHRvIGdvIGFuIGV4
dHJhIG1pbGUsIHdlIGNvdWxkIGFsc28ga2VlcCB0aGUgbm9wcyB3aGVuIGJvdGgKIENPTkZJR19S
SVNDVl9VU0VSX0NGSSBhbmQgUklTQ1ZfSVNBX0VYVF9aSUNGSVNTIGFyZSBwcmVzZW50LCBidXQK
IGNvbW1hbmQgbGluZSByaXNjdl9ub3VzZXJjZmkgZGlzYWJsZWQgYmFja3dhcmQgY2ZpLikKClRo
YW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
