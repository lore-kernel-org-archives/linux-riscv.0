Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219D5C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 13:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3dGqMsOPPCX+3a9KabZwaunO51v2CiDbKcDiVCrCGs=; b=VB9C206bmcvYkZ
	vNs5zszqKfQ6AiydLXqtnJF0ya/ex8M4fsNDE7dCzb2WWwNxW6yO4Ud5LGtWdzccnm2sTn9Bad3lT
	nkDP2Okwc0FUtaf1FAmWnTZvBZPOhLi1UF66t6JXxkLXjd91+GU2dYpf70MjYz9ukAEVJFaxtYZM7
	LCs+edR6a8W3Dv71R2VcV2M2auvcSz2i5M3W4NbQVx/BtQaMxY0FnR+nmYbFnj2qbEZpUTEr5JeCj
	upED+KgXX+V8BaVxPdgIq6KveDEv+0WUzagdRi7RXDjAQ8lHf01fPRINHD8D2DZK898fZw5+XrlYX
	wAjSX6+GtMmqPeJuAlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ima-0000000HDub-3215;
	Fri, 25 Apr 2025 13:07:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HSB-0000000H0Hs-2hcR
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 11:42:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43f106a3591so2062575e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745581366; x=1746186166; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyVQraiD8choursJseiRmBXZoIZWNTeRkqd4Ai9q43w=;
        b=J6sA7Q4S0t2HHLdcGEYNeji8K+gdUay8iV5JJjVK7iiw8GV3l6q77G+09uFVrVesjN
         88O462B3EYQCDYceqBnGJK+Ir6hfVaWbxLQlw8YJOXFyPC/OGGLf9c3BtdJLNW3+D0Ns
         ovWSQQWuzgVtrICH1mA6sLfrj9MLP1IHiOsLIJUEmV5KOt7CZ6oWUOi3M13YjE5aPa1b
         mvT4IZ4Ut7vX76oWDI8n3/W33d5UmfOloVP8SmTzm19wiISh+J0hMNAeMs5N/gkUcW5d
         fwxB7+TI1kmWkrymzr0n/HlvqB4qtDqjHeGKqOeFuJGkuDHZT0RlJ5aMNKpC2f+zFlzb
         0pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581366; x=1746186166;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RyVQraiD8choursJseiRmBXZoIZWNTeRkqd4Ai9q43w=;
        b=YZn9bBBGbPupHXPX7CmlUQ7JJDzrAIcxIBWD6QxGAb6AtO6oJGwe/4AVfSaM03eLpT
         koJmn3u3Sja05xaDdFf1IbSZ29W5TH2vw+zNUMvqdKMuPiCMP9jBnp5gDseLNaxK8wwX
         DzHkAmtxwQ19ZYGQfQlznNjDCdPYm9CrMVbC/v1ty7/EcolOv4RmXwrdB71BLjF7jS0z
         jbaxaOYYBjX5FvyACKvn62kVgyX/4NikdBr7a3uzmmzOiF3h9sHgmCek1CpnteijIUiw
         k3U/poWn6+Nh05wdCpMImihS1DN6GF5FHJqGRJTRO6kKbPDdMe7OB707L4HZk3xMr5iY
         GQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnYcflSOiwayRxU0ZFZJSYt2FhS3o71hyW8lci0m37WnzBpRXCD/pcySoHHe6MNxcQCWtMA/kZ987mbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzotpjd6T//RK8lMImmRaaXrXMVM6qresd3WyU6hlBkznwGahPx
	fgR5mGH6Xyf91sCuh0ct+eifPXRB74iCgTeXJ/s8FSxC2SfK5JvB4O9FGuntKj0=
X-Gm-Gg: ASbGncs2dBskPynKCmXS7R6A+H2rB/T1TSeafWMddVcNBLqEY97jrfJgcWpxEuPXNSm
	MfgL/hl6dfdi4PjNAf/l5tYKvTn9XKdIF6spn1SbRh6/6wi4w225ogI4IeLfqhJ4XKVzhAU7KCq
	jUEoAHGkiwtGFYCXJ/eMCWenVlzU5yUNaag5XZ4wXdRQjFJK84LvwX2dGI2mBBDuT+GsZKMcMPv
	33b3WmiJ+V70rnVBX4sNwnjIq/Xh3qF5kOMFPvtERmy0+SVDD4aAduG2j4TGY6jw29cGGRzjRtF
	aqxB8+3IJ0fnNjBiyXE9Kp/qa2vfRrJrsBzmmgzbpJjT1sDG
X-Google-Smtp-Source: AGHT+IHSwXKm2b0KR1kACN9BXrADFLHJi8d2f8OL0xZ1T0iAnfUkAWtBlFVbUnZ2xOUkCinbSJhTAg==
X-Received: by 2002:a05:600c:1d01:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-440a66c250dmr6293955e9.9.1745581365815;
        Fri, 25 Apr 2025 04:42:45 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:84a3:2b0a:bdb8:ce08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e4698csm2104230f8f.62.2025.04.25.04.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:42:45 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 25 Apr 2025 13:42:44 +0200
Message-Id: <D9FOY8JACYTH.1FU7ZTEHFC5NI@ventanamicro.com>
Subject: Re: [PATCH v12 12/28] riscv: Implements arch agnostic shadow stack
 prctls
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
 <20250314-v5_user_cfi_series-v12-12-e51202b53138@rivosinc.com>
 <D92V2NPNZYV0.136MJ2HOK48HE@ventanamicro.com>
 <aAnBmexbL4XmVxQk@debug.ba.rivosinc.com>
 <D9EWR3RQK0FD.3GF55KNS53YSR@ventanamicro.com>
 <aAp_87-Xr6gn_hD7@debug.ba.rivosinc.com>
In-Reply-To: <aAp_87-Xr6gn_hD7@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_044247_690227_612EEC85 
X-CRM114-Status: GOOD (  20.76  )
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

MjAyNS0wNC0yNFQxMToxNjoxOS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgQXByIDI0LCAyMDI1IGF0IDAzOjM2OjU0UE0gKzAyMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4yMDI1LTA0LTIzVDIxOjQ0OjA5LTA3OjAwLCBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+PiBPbiBUaHUsIEFwciAxMCwgMjAyNSBhdCAxMTo0NTo1
OEFNICswMjAwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+Pj4yMDI1LTAzLTE0VDE0OjM5OjMx
LTA3OjAwLCBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+Pj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VzZXJjZmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdXNlcmNmaS5oCj4+Pj4+IEBAIC0xNCw3ICsxNSw4IEBAIHN0cnVjdCBrZXJuZWxfY2xv
bmVfYXJnczsKPj4+Pj4gIHN0cnVjdCBjZmlfc3RhdHVzIHsKPj4+Pj4gIAl1bnNpZ25lZCBsb25n
IHViY2ZpX2VuIDogMTsgLyogRW5hYmxlIGZvciBiYWNrd2FyZCBjZmkuICovCj4+Pj4+IC0JdW5z
aWduZWQgbG9uZyByc3ZkIDogKChzaXplb2YodW5zaWduZWQgbG9uZykgKiA4KSAtIDEpOwo+Pj4+
PiArCXVuc2lnbmVkIGxvbmcgdWJjZmlfbG9ja2VkIDogMTsKPj4+Pj4gKwl1bnNpZ25lZCBsb25n
IHJzdmQgOiAoKHNpemVvZih1bnNpZ25lZCBsb25nKSAqIDgpIC0gMik7Cj4+Pj4KPj4+PlRoZSBy
c3ZkIGZpZWxkIHNob3VsZG4ndCBiZSBuZWNlc3NhcnkgYXMgdGhlIGNvbnRhaW5lciBmb3IgdGhl
IGJpdGZpZWxkCj4+Pj5pcyAndW5zaWduZWQgbG9uZycgc2l6ZWQuCj4+Pj4KPj4+PldoeSBkb24n
dCB3ZSB1c2UgYm9vbHMgaGVyZSwgdGhvdWdoPwo+Pj4+SXQgbWlnaHQgcHJvZHVjZSBhIGJldHRl
ciBiaW5hcnkgYW5kIHdlJ3JlIG5vdCBodXJ0aW5nIGZvciBzdHJ1Y3Qgc2l6ZS4KPj4+Cj4+PiBJ
ZiB5b3UgcmVtZW1iZXIgb25lIG9mIHRoZSBwcmV2aW91cyBwYXRjaCBkaXNjdXNzaW9uLCB0aGlz
IGdvZXMgaW50bwo+Pj4gYHRocmVhZF9pbmZvYCBEb24ndCB3YW50IHRvIGJsb2F0IGl0LiBFdmVu
IGlmIHdlIGVuZCBzaG92aW5nIGludG8gdGFza19zdHJ1Y3QsCj4+PiBkb24ndCB3YW50IHRvIGJs
b2F0IHRoYXQgZWl0aGVyLiBJIGNhbiBqdXN0IGNvbnZlcnQgaXQgaW50byBiaXRtYXNrIGlmCj4+
PiBiaXRmaWVsZHMgYXJlIGFuIGV5ZXNvcmUgaGVyZS4KPj4KPj4gICJ1bnNpZ25lZCBsb25nIHJz
dmQgOiAoKHNpemVvZih1bnNpZ25lZCBsb25nKSAqIDgpIC0gMik7Igo+Pgo+PmlzIGFuIGV5ZXNv
cmUgdGhhdCBkZWZpbmVzIGV4YWN0bHkgdGhlIHNhbWUgYXMgdGhlIHR3byBsaW5lcyBhbG9uZQo+
Pgo+PiAgdW5zaWduZWQgbG9uZyB1YmNmaV9lbiA6IDE7Cj4+ICB1bnNpZ25lZCBsb25nIHViY2Zp
X2xvY2tlZCA6IDE7Cj4+Cj4+VGhhdCBvbmUgc2hvdWxkIGJlIHJlbW92ZWQuCj4+Cj4+SWYgd2Ug
aGF2ZSBvbmx5IDQgYml0cyBpbiA0LzggYnl0ZXMsIHRoZW4gYml0ZmllbGRzIGRvIGdlbmVyYXRl
IHdvcnNlCj4+Y29kZSB0aGFuIDQgYm9vbHMgYW5kIGEgMC80IGJ5dGUgaG9sZS4gIFRoZSBzdHJ1
Y3Qgc2l6ZSBzdGF5cyB0aGUgc2FtZS4KPj4KPj5JIGRvbid0IGNhcmUgbXVjaCBhYm91dCB0aGUg
c3dpdGNoIHRvIGJvb2xzLCB0aG91Z2gsIGJlY2F1c2UgdGhpcyBjb2RlCj4+aXMgbm90IGNhbGxl
ZCBvZnRlbi4KPgo+IEknbGwgcmVtb3ZlIHRoZSBiaXRmaWVsZHMsIGhhdmUgc2luZ2xlIGB1bnNp
Z25lZCBsb25nIGNmaV9jb250cm9sX3N0YXRlYAo+IEFuZCBkbyBgI2RlZmluZSBSSVNDVl9VQkNG
SV9FTiAxYCBhbmQgc28gb24uCgpJIG1pZ2h0IGhhdmUgc2VlbWVkIHRvbyBtdWNoIGFnYWluc3Qg
dGhlIGJpdGZpZWRzLCBzb3JyeS4gIEkgYW0gYWdhaW5zdAp0aGUgcnN2ZCBmaWVsZHMsIGJlY2F1
c2UgaXQgaXMgYSBwb2ludGxlc3MgY29nbml0aXZlIG92ZXJoZWFkIGFuZCBldmVuCnRoaXMgc2Vy
aWVzIGFscmVhZHkgaGFkIGEgYnVnIGluIHRoZW0uCgojZGVmaW5lcyBzaG91bGQgZ2VuZXJhdGUg
dGhlIHNhbWUgY29kZSBhcyBiaXRmaWVsZHMgKHdvcnNlIHRoYW4gYm9vbHMpLApzbyB0aGUgc291
cmNlIGNvZGUgaXMgcmVhbGx5IGEgbWF0dGVyIG9mIHBlcnNvbmFsIHByZWZlcmVuY2UuCihJIGRv
IHByZWZlciBiaXRmaWVsZHMuKQoKPj4+Pj4gQEAgLTI2MiwzICsyOTIsODMgQEAgdm9pZCBzaHN0
a19yZWxlYXNlKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKQo+Pj4+PiAraW50IGFyY2hfbG9ja19z
aGFkb3dfc3RhY2tfc3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaywKPj4+Pj4gKwkJCQkg
IHVuc2lnbmVkIGxvbmcgYXJnKQo+Pj4+PiArewo+Pj4+PiArCS8qIElmIHNodHN0ayBub3Qgc3Vw
cG9ydGVkIG9yIG5vdCBlbmFibGVkIG9uIHRhc2ssIG5vdGhpbmcgdG8gbG9jayBoZXJlICovCj4+
Pj4+ICsJaWYgKCFjcHVfc3VwcG9ydHNfc2hhZG93X3N0YWNrKCkgfHwKPj4+Pj4gKwkgICAgIWlz
X3Noc3RrX2VuYWJsZWQodGFzaykgfHwgYXJnICE9IDApCj4+Pj4+ICsJCXJldHVybiAtRUlOVkFM
Owo+Pj4+Cj4+Pj5UaGUgdGFzayBtaWdodCB3YW50IHRvIHByZXZlbnQgc2hhZG93IHN0YWNrIGZy
b20gYmVpbmcgZW5hYmxlZD8KPj4+Cj4+PiBCdXQgV2h5IHdvdWxkIGl0IHdhbnQgdG8gZG8gdGhh
dD8gVGFzayBjYW4gc2ltcGx5IG5vdCBpc3N1ZSB0aGUgcHJjdGwuIFRoZXJlCj4+PiBhcmUgZ2xp
YmMgdHVuYWJsZXMgYXMgd2VsbCB1c2luZyB3aGljaCBpdCBjYW4gYmUgZGlzYWJsZWQuCj4+Cj4+
VGhlIHRhc2sgbWlnaHQgZG8gaXQgYXMgc29tZSBsYXN0IHJlc29ydCB0byBwcmV2ZW50IGEgYnVn
Z3kgY29kZSBmcm9tCj4+ZW5hYmxpbmcgc2hhZG93IHN0YWNrcyB0aGF0IHdvdWxkIGp1c3QgY3Jh
c2guICBPciB3aGF0ZXZlciBjb21wbGljYXRlZAo+PnJlYXNvbiB1c2Vyc3BhY2UgY2FuIHRoaW5r
IG9mLgo+Pgo+Pkl0J3MgbW9yZSB0aGUgb3RoZXIgd2F5IGFyb3VuZC4gIEkgd29uZGVyIHdoeSB3
ZSdyZSByZW1vdmluZyB0aGlzIG9wdGlvbgo+PndoZW4gd2UgZG9uJ3QgcmVhbGx5IGNhcmUgd2hh
dCB1c2Vyc3BhY2UgZG9lcyB0byBpdHNlbGYuCj4+SSB0aGluayBpdCdzIGNvbXBsaWNhdGluZyB0
aGUga2VybmVsIHdpdGhvdXQgYW4gb2J2aW91cyBnYWluLgo+Cj4gSXQganVzdCBmZWVscyB3aWVy
ZC4gVGhlcmUgaXNuJ3QgYW55dGhpbmcgbGlrZSB0aGlzIGZvciBvdGhlciBmZWF0dXJlcyBsaXQt
dXAKPiB2aWEgZW52Y2ZnLiBEb2VzIGh3cHJvYmUgYWxsb3cgdGhpcyBvbiBwZXItdGFzayBiYXNp
cz8gSSdsbCBsb29rIGludG8gaXQuCgpJIHRoaW5rIFBNTSBkb2Vzbid0IGFsbG93IHRvIGxvY2sg
YW5kIHRoZSByZXN0IGRvbid0IHNlZW0gY29uZmlndXJhYmxlCmZyb20gdXNlcnNwYWNlLgoKSXQn
cyBub3QgdGhhdCBpbXBvcnRhbnQgYW5kIHdlIGhvcGVmdWxseSB3b24ndCBiZSBicmVha2luZyBh
bnkgdXNlcnNwYWNlCmlmIHdlIGRlY2lkZWQgdG8gYWxsb3cgaXQgbGF0ZXIsIHNvIEknbSBmaW5l
IHdpdGggdGhpcyB2ZXJzaW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
