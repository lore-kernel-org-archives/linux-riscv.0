Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD55C3ABD8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 12:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02enRCsLEBVO2old4AHrBwqwqYJ1f7IL1lblOOk6MQI=; b=JUrikKouefDmDq
	da8+zfUhglyfUcVi7wej7XJcjaHu3zxEopGJFcitsAJ7y5eNHYvVdSXc9MwtFUqoO9u7V/8tDk4ZW
	n0eUkDxCk07USDaBdR/Ju0GftEkmFacv9edn/xWW39j4DvTDoiq4QJ1IgCpl+tA7zTrh1fc/IZv4Y
	O61CbLZUru0YdwuYRzuu0i45TTXMlmGmTYRAecHsVKaHmxMvk8gYu5LCbkF1bhu2XL3uvl2e6yYiM
	R/YAQ8ReI3ODyQBOp2s+lgKPPsdrukczO7AI1ip0CiziPGzn+2KjLpq4JGdG+GBrKNfSxUDq22OQ+
	aRxYGSOvNXGhecsrSsEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzuZ-00000009CSG-2gpW;
	Mon, 19 May 2025 12:48:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzlv-00000009B6R-2AGx
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 12:39:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so4354145e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 May 2025 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747658350; x=1748263150; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TID/8Or9YAzKWADzCmDKYmYbQ3PtBl4rxavpksxXcw=;
        b=OP4R7nwmi+UYkpxhJBs8miFstceZWFvGfXYKElJ9owRayZSMNEo6759bc4ij9+gSTn
         pZImZ4QO1TPmUWT7dIcqMFid1ogouIqcc2BNVG5oj1Fq2bKZu9FD7Y9uF7+8dP1WmbY0
         XKIMgAIYgHN227bp8X6WD3wrIzPm5+JIYrKkdxFy7/Dg3CIoP9kR4m9dhaM4x9n2+qyj
         TJyhu0XiC7qknLlwxba1zBXT+Z2/5Ye/ukh7tYom6KBbMsturJdntKzV1a52O+m4cDiR
         ycv4PhcnSFQcWjUpWmVjxfRrQyRYVzyY/E+smEACfxBuG7GmtQ6v8xwmcyVrBkf0y0kP
         dCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747658350; x=1748263150;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TID/8Or9YAzKWADzCmDKYmYbQ3PtBl4rxavpksxXcw=;
        b=etGGO2/zH2lKFYIunYm2cS1UnRpHaI3o46QinhDTo1wIqwkXLZZmiPlXwRKlfABQv/
         INEB+FGObETugRM/TwGWtsWdXRfmZ630X49Hy/2+D/GtY8ajc3lAIKJoT5lkIv6zipGZ
         WoaH3ynqWjdWIMgxPvuxU40Nnt2Qy6etCQSC941dMQPmkCBsTrgA2GQ+o0nShmBhIEPg
         xv6I39XW9fHQMtVRHVtrZUqCcQsvWeZnnYgVLDqiOKQe1MCdfw9CeBW+gGF2wj1BK+i3
         OksQrttVG+aXLDTJwhUyIiCgMsA6e/WYhpjEhipsacZdy/R+aAHm/BelVY9BK4F3HxQb
         hNaw==
X-Forwarded-Encrypted: i=1; AJvYcCVo+xUNOAr188d7zpmecnI+EU3/W282ipQyG5eW1TJCx3+Za4cQKkiQ6k6XeKvzE9friyx23GzB8rpMsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWyksdfQ5ekph0jljv3zSipWeSVz2r7j2O7LFqFh7NjgB5fxjx
	xG4ebFEmj4ktmOp88Fhe8LMv1Xiu5lV2n6rslKwVNXmGrpDLliucbEkSHhX4g5cLyws=
X-Gm-Gg: ASbGncu8l6cYuDHH56xXoJRjQV0Vg6Xc975SJ28PMQfh8ARfPlwgARq2nvi7UerKE0G
	5j5GJnH/8TL3PcGwv8d2wm7adpQHqj4Iuz84lDohyGMoF1xqXeXBdV1O8O1XDFmOsWS7uJL8LKg
	17mHG/ynXA70dWiwQGxR2pkHoNWkzPPKPd//bhAquxGgd720BDLWzc3bGbWU6eNS+lpWgWmgWmx
	OX8KHicla0lNOvf/qfgK7+rb6bwgHApuO2a7pIiNBHgdePmvvCQUC51g6/yldwFhLGEdjnKHGdu
	6aDjO1NEieT2W9aiCQlDhXFb4pWRcy+Cpe32Gy+CmjJU05zhZGPiY0vH4Ao=
X-Google-Smtp-Source: AGHT+IFfWi9oi0Jcra9sXbpqrxyg3hOkHnBuCeesfYKMaPVxn3iQR7mctJDpcqzl/F4hYBE/NRWxrg==
X-Received: by 2002:a05:600d:108:10b0:43b:c0fa:f9bf with SMTP id 5b1f17b1804b1-442fd7165b7mr23100365e9.3.1747658349729;
        Mon, 19 May 2025 05:39:09 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:29b7:4911:a29c:2135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd583f20sm136362615e9.28.2025.05.19.05.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 05:39:09 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 19 May 2025 14:39:08 +0200
Message-Id: <DA056HQ5G6S6.2B1OITOT8LLWS@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v15 05/27] riscv: usercfi state for task and
 save/restore of CSR_SSP on trap entry/exit
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov"
 <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>, "Eric Biederman"
 <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann Horn"
 <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
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
To: "Deepak Gupta" <debug@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
 <20250502-v5_user_cfi_series-v15-5-914966471885@rivosinc.com>
 <D9OZVNOGLU4T.2XOUPX27HN0W8@ventanamicro.com>
 <122fc6cd-2e21-4fca-979d-bcf558107b81@ghiti.fr>
 <D9WLRSAB63M5.3DZD4ND3WVZ6F@ventanamicro.com>
 <aCdbASlCyqhid82c@debug.ba.rivosinc.com>
In-Reply-To: <aCdbASlCyqhid82c@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_053911_555184_3BA8F075 
X-CRM114-Status: GOOD (  20.13  )
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

MjAyNS0wNS0xNlQwODozNDoyNS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgTWF5IDE1LCAyMDI1IGF0IDEwOjQ4OjM1QU0gKzAyMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4yMDI1LTA1LTE1VDA5OjI4OjI1KzAyOjAwLCBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhAZ2hpdGkuZnI+Ogo+Pj4gT24gMDYvMDUvMjAyNSAxMjoxMCwgUmFkaW0gS3LEjW3D
ocWZIHdyb3RlOgo+Pj4+IDIwMjUtMDUtMDJUMTY6MzA6MzYtMDc6MDAsIERlZXBhayBHdXB0YSA8
ZGVidWdAcml2b3NpbmMuY29tPjoKPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4+Pj4+IEBAIC05MSw2ICs5MSwz
MiBAQAo+Pj4+PiArLm1hY3JvIHJlc3RvcmVfdXNlcnNzcCB0bXAKPj4+Pj4gKwlBTFRFUk5BVElW
RSgibm9wcygyKSIsCj4+Pj4+ICsJCV9fc3RyaW5naWZ5KAkJCQlcCj4+Pj4+ICsJCVJFR19MIFx0
bXAsIFRBU0tfVElfVVNFUl9TU1AodHApOwlcCj4+Pj4+ICsJCWNzcncgQ1NSX1NTUCwgXHRtcCks
Cj4+Pj4+ICsJCTAsCj4+Pj4+ICsJCVJJU0NWX0lTQV9FWFRfWklDRklTUywKPj4+Pj4gKwkJQ09O
RklHX1JJU0NWX1VTRVJfQ0ZJKQo+Pj4+PiArLmVuZG0KPj4+PiBEbyB3ZSBuZWVkIHRvIGVtaXQg
dGhlIG5vcHMgd2hlbiBDT05GSUdfUklTQ1ZfVVNFUl9DRkkgaXNuJ3Qgc2VsZWN0ZWQ/Cj4+Pj4K
Pj4+PiAoV2h5IG5vdCBwdXQgI2lmZGVmIENPTkZJR19SSVNDVl9VU0VSX0NGSSBhcm91bmQgdGhl
IEFMVEVSTkFUSVZFUz8pCj4+Pgo+Pj4gVGhlIGFsdGVybmF0aXZlcyBhcmUgdXNlZCB0byBjcmVh
dGUgYSBnZW5lcmljIGtlcm5lbCB0aGF0IGNvbnRhaW5zIHRoZQo+Pj4gY29kZSBmb3IgYSBsYXJn
ZSBudW1iZXIgb2YgZXh0ZW5zaW9ucyBhbmQgb25seSBlbmFibGUgaXQgYXQgcnVudGltZQo+Pj4g
ZGVwZW5kaW5nIG9uIHRoZSBwbGF0Zm9ybSBjYXBhYmlsaXRpZXMuIFRoaXMgd2F5IGRpc3Ryb3Mg
Y2FuIHNoaXAgYQo+Pj4gc2luZ2xlIGtlcm5lbCB0aGF0IHdvcmtzIG9uIGFsbCBwbGF0Zm9ybXMu
Cj4+Cj4+WXVwLCBhbmQgaWYgYSBrZXJuZWwgaXMgY29tcGlsZWQgd2l0aG91dCBDT05GSUdfUklT
Q1ZfVVNFUl9DRkksIHRoZSBub3BzCj4+d2lsbCBvbmx5IGVubGFyZ2UgdGhlIGJpbmFyeSBhbmQg
cG90ZW50aWFsbHkgc2xvdyBkb3duIGV4ZWN1dGlvbi4KPj5JbiBvdGhlciB3b3Jkcywgd2h5IHdl
IGRvbid0IGRvIHNvbWV0aGluZyBsaWtlIHRoaXMKPj4KPj4gKCFDT05GSUdfUklTQ1ZfVVNFUl9D
RkkgPyAiIiA6Cj4+ICAgKFJJU0NWX0lTQV9FWFRfWklDRklTUyA/IF9fc3RyaW5naWZ5KC4uLikg
OiAibm9wcyh4KSIpKQo+Pgo+Pmluc3RlYWQgb2YgdGhlIGN1cnJlbnQKPj4KPj4gKENPTkZJR19S
SVNDVl9VU0VSX0NGSSAmJgo+PiAgICBSSVNDVl9JU0FfRVhUX1pJQ0ZJU1MgPyBfX3N0cmluZ2lm
eSguLi4pIDogIm5vcHMoeCkiKQo+Pgo+Pkl0IGNvdWxkIGJlIGEgbmV3IHByZXByb2Nlc3NvciBt
YWNybyBpbiBjYXNlIHdlIHdhbnRlZCB0byBtYWtlIGl0IG5pY2UsCj4+YnV0IGl0J3MgcHJvYmFi
bHkgbm90IGEgY29tbW9uIGNhc2UsIHNvIGFuIGlmZGVmIGNvdWxkIHdvcmsgYXMgd2VsbC4KPj4K
Pj5EbyB3ZSBqdXN0IGdlbmVyYWxseSBub3QgY2FyZSBhYm91dCBzdWNoIG1pbm9yIG9wdGltaXph
dGlvbnM/Cj4KPiBPbiBpdHMgb3duIGp1c3QgZm9yIHRoaXMgc2VyaWVzLCBJIGFtIG5vdCBzdXJl
IGlmIEkgd291bGQgY2FsbCBpdCBldmVuIGEKPiBtaW5vciBvcHRpbWl6YXRpb24uCgpUaGlzIHBh
dGNoIHVzZXMgaWZkZWYgaW4gdGhyZWFkX2luZm8sIGJ1dCBub3QgaGVyZS4KCkJvdGggcGxhY2Vz
IG1pbmltaXplIHRoZSBydW50aW1lIGltcGFjdCBvbiBrZXJuZWxzIHRoYXQgZG9uJ3QgaGF2ZQpD
T05GSUdfUklTQ1ZfVVNFUl9DRkksIHNvIEkgd291bGQgbGlrZSB0byB1bmRlcnN0YW5kIHRoZSBy
ZWFzb25pbmcKYmVoaW5kIHRoZSBkZWNpc2lvbiB0byBpbmNsdWRlIG9uZSBhbmQgbm90IHRoZSBv
dGhlci4KCj4gQnV0IHN1cmUsIGl0IG1heSAob3IgbWF5IG5vdCkgaGF2ZSBub3RpY2VhYmxlIGVm
ZmVjdCBpZiBzb21lb25lIHdlcmUKPiB0byBnbyBhcm91bmQgYW5kIG11Y2sgd2l0aCBBTFRFUk5B
VElWRVMgbWFjcm8gYW5kIGVtaXQgYG9sZF9jYCBvbmx5Cj4gaWYgY29uZmlnIHdlcmUgc2VsZWN0
ZWQuIFRoYXQgc2hvdWxkIGJlIGEgcGF0Y2ggc2V0IG9uIGl0cyBvd24gd2l0aAo+IGRhdGEgcHJv
dmlkaW5nIGJlbmVmaXRzIGZyb20gaXQuCgpUaGUgZGlmZmVyZW5jZSBpcyBzbWFsbCBhbmQgZWFj
aCBidWlsZCBhbmQgaW1wbGVtZW50YXRpb24gY2FuIGJlaGF2ZQpkaWZmZXJlbnRseSwgc28gY29k
ZSBhbmFseXNpcyBzZWVtcyB0aGUgbW9zdCBhcHByb3ByaWF0ZSB0b29sIGhlcmUuCldlIG11c3Qg
c3RpbGwgZG8gYSBsb3Qgb2Ygc3ViamVjdGl2ZSBndWVzc3dvcmssIGJlY2F1c2UgaXQgaXMgaGFy
ZCB0bwpwcmVkaWN0IHRoZSBmdXR1cmUgZGV2ZWxvcG1lbnQuCgpXZSBzaG91bGQgYmUgbW92aW5n
IG9uIHRoZSBwYXJldG8gZnJvbnQgYW5kIHRoZXJlIGFyZSAzIHJvdWdobHkKb3B0aW1pemF0aW9u
IHBhcmFtZXRlcnMgaW4gdGhpcyBjYXNlOiB0aGUgQyBjb2RlLCB0aGUgYmluYXJ5IGNvZGUsIGFu
ZAp0aGUgd29yayBkb25lIGJ5IHRoZSBwcm9ncmFtbWVyLgpUaGUgY3VycmVudCBwYXRjaCBpcyBm
b3Jnb2luZyB0aGUgYmluYXJ5IHF1YWxpdHkgKG5vcHMgYXJlIHN0cmljdGx5CndvcnNlKS4KVGhl
IGlmZGVmIGFuZCB0aGUgbWFjcm8gc29sdXRpb25zIHByZWZlciBiaW5hcnkgcXVhbGl0eSwgYW5k
IHRoZW4gZGlmZmVyCmlmIHRoZXkgY29uc2lkZXIgd29yayBtaW5pbWl6YXRpb24gKGlmZGVmKSBv
ciBuaWNlIEMgKG1hY3JvKS4KCkRvZXMgdGhlIGN1cnJlbnQgcGF0Y2ggcmVwcmVzZW50IHRoZSBp
ZGVhbCBjb21wcm9taXNlPwooSSBjYW4ganVzdCByZWNhbGlicmF0ZSBteSB2YWx1ZXMgZm9yIGZ1
dHVyZSByZXZpZXdzLi4uKQoKVGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
