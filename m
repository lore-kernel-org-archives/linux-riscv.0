Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBB6C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQA7+OccXOnAdsTrI7/3teIGnt5RgzvbuJZvrZ5rPes=; b=kZM6SigPVhjYPl
	hGUSqjZkN2Yqph6EHj+Y1dtUiaiRQqFMXeyrZWBZCM2PMWUsphsR+yj7+nVaj/nKJMG4FXoBHYiaz
	3Po9n+I5p9jQ57nEJ/9UVKvmMcn+oFjC/98CShrnyybZMxYyCFaV8U6wBABulDAuCBcDtuulrS5fp
	ulP4MZBy2G6kO2coqrb1bjE5TmLK5l5NO9RkvFy8v9cGqUcw21jxvA/k2EuWxeBJxmSCE5KMXupkO
	9EZR0LQ7z4FZc+1NuQALHVn64i3pENjJNp6jJ/gNF8/QPhWtSzLFCComrM+ionIsb2rfhSs4cAqbq
	QmPNPRFOxMvD4qKREsbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IfG-0000000HCsI-0RVk;
	Fri, 25 Apr 2025 13:00:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HDV-0000000Gxks-3vEI
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 11:27:39 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-391324ef4a0so103792f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 04:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745580456; x=1746185256; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tdcxdU/uqiM5JHIE0ih8RzkRpPBvVsrQ+sQtZ+utPU=;
        b=nkx0gPSUohBByMUx1DYh+ku+6ySTSApQOT7SqmgNilKkKt1/HoMtL4TYRki6JKGgpE
         Ci3FNWWI0D6PwgWqivi0YPQsb6m1D8DHe7JNtH8cnV3s7xjYPqy/M5e3kJXOlRJXlHuO
         QY45dX5CnH56t0cKFjy7J6MeLhg4rGZeEhx1ONEJVKwkLbFKTUUBitOu+k9AMsAR20ra
         JU6O6opQffKoDayFO/gmVv1b1rJGfJBjRl7jO2A7JcZqEPV50XQFcPFW2L42yXHFVszQ
         79DYtnPFSLUsigrtJIPexktXVFkvArzQuRdF0ebJ1KzYkCWyP+WxpDpZyXPjVu2BPptm
         ES2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745580456; x=1746185256;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9tdcxdU/uqiM5JHIE0ih8RzkRpPBvVsrQ+sQtZ+utPU=;
        b=d3IJWKsb/J/tA/7LYXlCO+UJSBv+F6kdTZpTlVetgqPaZWfEBOTgrcXfSQiJDQ5oPy
         Esg1eEvpCTX4lT7+EiFtinhuenQ+O2q1Jzq7euIFUiPt565uLFEP1JZnM/IC740x11F2
         6oClAnpA43v5NFFm14AqYmu94xH+BJoj2RKdebsoNWasjw3i4EFLtQ5NuqHsIJp+eEZd
         4ptRyuj8bFtqgaqlh7JCyIwvATeusJI3SpgvBXVWCImahhh5TblqUriRroXMEKdmIHEZ
         vFvmK/Iw+kXx7Jw1w4a/wxa3ibGoFjKiH2f749F3ZeEwcVAdMa3beAIKBbt0kwLs3l7q
         L5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVJi3JdRuECA0e/O5hxgdkoyepuiWVDKZzLGilKVEeAKB9Lr5es0OO/fyq5enoiIy49fx1s5nR3MNrKfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCABMSZwWvgkiCOz2wYJAaovAUbMcCRFqXcWNLS9W9mMhou1ci
	Zm27gld3yWkKqgdduuMiifS8RoQuMF6xXIQo+zNF6oeFdG1OuqX6GRIGH2LzWpg=
X-Gm-Gg: ASbGnctWms/jVWmgt+iMqOFkrj6Sk65r//Bk7JgYsEOiAgZBTJWH0zG4qgLFmOyRiX/
	WICttMtlogC3xD9WC88KE4zsFf2Ec6GGgYkqgXX3scMmziJheblRMUymzOAyEpRIwcXh0bzb5te
	5xaZ+1PmM3VSVD2gjZlwGUbPyQC3VQGhJPbfULjYTP1z5cA0LSA7sUfHrI1mPH2WQKUEjGNbHcY
	KN9MfMddKxRXqO09Os7peVq7o4sUocfVOHVTMrmxfXAVXuRzMQqucSAkDEy1v6PZCuqNwJhYfY+
	x6dMEtPua1horGcNchg48HQhBtMFADJmJH0IZzXu8q/oKC0/
X-Google-Smtp-Source: AGHT+IEQ9pK+JKMDBMS71i2ytNl3g5Iz5jsYozyFh9v4Ot2oPm70zEuu2n9VUWJTfr8L27VdCIYOXQ==
X-Received: by 2002:a05:6000:420e:b0:39c:1efc:44ed with SMTP id ffacd0b85a97d-3a074e42259mr527990f8f.7.1745580456083;
        Fri, 25 Apr 2025 04:27:36 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:84a3:2b0a:bdb8:ce08])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a02csm22002045e9.27.2025.04.25.04.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:27:35 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 25 Apr 2025 13:27:34 +0200
Message-Id: <D9FOMMGOGOZS.FN9LKYJAB9PD@ventanamicro.com>
Subject: Re: [PATCH v12 05/28] riscv: usercfi state for task and
 save/restore of CSR_SSP on trap entry/exit
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
 <cleger@rivosinc.com>, <broonie@kernel.org>, <rick.p.edgecombe@intel.com>,
 "Zong Li" <zong.li@sifive.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-5-e51202b53138@rivosinc.com>
 <D92WQWAUQYY4.2ED8JAFBDHGRN@ventanamicro.com>
 <aAl_HRk49lnseiio@debug.ba.rivosinc.com>
 <D9EUJBQ5OHN0.2KUJHGXK262TR@ventanamicro.com>
 <aAp7Un415hNqtshd@debug.ba.rivosinc.com>
In-Reply-To: <aAp7Un415hNqtshd@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_042737_985237_24417985 
X-CRM114-Status: GOOD (  40.07  )
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

MjAyNS0wNC0yNFQxMDo1NjozNC0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgQXByIDI0LCAyMDI1IGF0IDAxOjUyOjQzUE0gKzAyMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4yMDI1LTA0LTIzVDE3OjAwOjI5LTA3OjAwLCBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+PiBPbiBUaHUsIEFwciAxMCwgMjAyNSBhdCAwMTowNDoz
OVBNICswMjAwLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+Pj4yMDI1LTAzLTE0VDE0OjM5OjI0
LTA3OjAwLCBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+Pj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKPj4+Pj4gQEAgLTYyLDYgKzYyLDkgQEAgc3RydWN0IHRo
cmVhZF9pbmZvIHsKPj4+Pj4gIAlsb25nCQkJdXNlcl9zcDsJLyogVXNlciBzdGFjayBwb2ludGVy
ICovCj4+Pj4+ICAJaW50CQkJY3B1Owo+Pj4+PiAgCXVuc2lnbmVkIGxvbmcJCXN5c2NhbGxfd29y
azsJLyogU1lTQ0FMTF9XT1JLXyBmbGFncyAqLwo+Pj4+PiArI2lmZGVmIENPTkZJR19SSVNDVl9V
U0VSX0NGSQo+Pj4+PiArCXN0cnVjdCBjZmlfc3RhdHVzCXVzZXJfY2ZpX3N0YXRlOwo+Pj4+PiAr
I2VuZGlmCj4+Pj4KPj4+PkkgZG9uJ3QgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gcHV0IGFsbCB0
aGUgZGF0YSBpbiB0aHJlYWRfaW5mby4KPj4+Pmtlcm5lbF9zc3AgYW5kIHVzZXJfc3NwIGlzIG1v
cmUgdGhhbiBlbm91Z2ggYW5kIHRoZSByZXN0IGNhbiBjb21mb3J0YWJseQo+Pj4+bGl2ZSBlbHNl
d2hlcmUgaW4gdGFza19zdHJ1Y3QuCj4+Pj4KPj4+PnRocmVhZF9pbmZvIGlzIHN1cHBvc2VkIHRv
IGJlIGFzIHNtYWxsIGFzIHBvc3NpYmxlIC0tIGp1c3Qgc3Bhbm5pbmcKPj4+Pm11bHRpcGxlIGNh
Y2hlLWxpbmVzIGNvdWxkIGJlIG5vdGljZWFibGUuCj4+Pgo+Pj4gSSBjYW4gY2hhbmdlIGl0IHRv
IG9ubHkgaW5jbHVkZSBvbmx5IGB1c2VyX3NzcGAsIGJhc2UgYW5kIHNpemUuCj4+Cj4+Tm8gbmVl
ZCBmb3IgYmFzZSBhbmQgc2l6ZSBlaXRoZXIgLS0gd2UgZG9uJ3QgdG91Y2ggdGhhdCBpbiB0aGUg
Y29tbW9uCj4+ZXhjZXB0aW9uIGNvZGUuCj4KPiBnb3QgaXQuCj4KPj4KPj4+IEJ1dCBiZWZvcmUg
d2UgZ28gdGhlcmUsIHNlZSBiZWxvdzoKPj4+Cj4+PiAkIHBhaG9sZSAtQyB0aHJlYWRfaW5mbyBr
YnVpbGQvdm1saW51eAo+Pj4gc3RydWN0IHRocmVhZF9pbmZvIHsKPj4+ICAgICAgICAgIGxvbmcg
dW5zaWduZWQgaW50ICAgICAgICAgIGZsYWdzOyAgICAgICAgICAgICAgICAvKiAgICAgMCAgICAg
OCAqLwo+Pj4gICAgICAgICAgaW50ICAgICAgICAgICAgICAgICAgICAgICAgcHJlZW1wdF9jb3Vu
dDsgICAgICAgIC8qICAgICA4ICAgICA0ICovCj4+Pgo+Pj4gICAgICAgICAgLyogWFhYIDQgYnl0
ZXMgaG9sZSwgdHJ5IHRvIHBhY2sgKi8KPj4+Cj4+PiAgICAgICAgICBsb25nIGludCAgICAgICAg
ICAgICAgICAgICBrZXJuZWxfc3A7ICAgICAgICAgICAgLyogICAgMTYgICAgIDggKi8KPj4+ICAg
ICAgICAgIGxvbmcgaW50ICAgICAgICAgICAgICAgICAgIHVzZXJfc3A7ICAgICAgICAgICAgICAv
KiAgICAyNCAgICAgOCAqLwo+Pj4gICAgICAgICAgaW50ICAgICAgICAgICAgICAgICAgICAgICAg
Y3B1OyAgICAgICAgICAgICAgICAgIC8qICAgIDMyICAgICA0ICovCj4+Pgo+Pj4gICAgICAgICAg
LyogWFhYIDQgYnl0ZXMgaG9sZSwgdHJ5IHRvIHBhY2sgKi8KPj4+Cj4+PiAgICAgICAgICBsb25n
IHVuc2lnbmVkIGludCAgICAgICAgICBzeXNjYWxsX3dvcms7ICAgICAgICAgLyogICAgNDAgICAg
IDggKi8KPj4+ICAgICAgICAgIHN0cnVjdCBjZmlfc3RhdHVzICAgICAgICAgIHVzZXJfY2ZpX3N0
YXRlOyAgICAgICAvKiAgICA0OCAgICAzMiAqLwo+Pj4gICAgICAgICAgLyogLS0tIGNhY2hlbGlu
ZSAxIGJvdW5kYXJ5ICg2NCBieXRlcykgd2FzIDE2IGJ5dGVzIGFnbyAtLS0gKi8KPj4+ICAgICAg
ICAgIGxvbmcgdW5zaWduZWQgaW50ICAgICAgICAgIGEwOyAgICAgICAgICAgICAgICAgICAvKiAg
ICA4MCAgICAgOCAqLwo+Pj4gICAgICAgICAgbG9uZyB1bnNpZ25lZCBpbnQgICAgICAgICAgYTE7
ICAgICAgICAgICAgICAgICAgIC8qICAgIDg4ICAgICA4ICovCj4+PiAgICAgICAgICBsb25nIHVu
c2lnbmVkIGludCAgICAgICAgICBhMjsgICAgICAgICAgICAgICAgICAgLyogICAgOTYgICAgIDgg
Ki8KPj4+Cj4+PiAgICAgICAgICAvKiBzaXplOiAxMDQsIGNhY2hlbGluZXM6IDIsIG1lbWJlcnM6
IDEwICovCj4+PiAgICAgICAgICAvKiBzdW0gbWVtYmVyczogOTYsIGhvbGVzOiAyLCBzdW0gaG9s
ZXM6IDggKi8KPj4+ICAgICAgICAgIC8qIGxhc3QgY2FjaGVsaW5lOiA0MCBieXRlcyAqLwo+Pj4g
fTsKPj4+Cj4+PiBJZiB3ZSB3ZXJlIHRvIHJlbW92ZSBlbnRpcmUgYGNmaV9zdGF0dXNgLCBpdCB3
b3VsZCBzdGlsbCBiZSA3MiBieXRlcyAoODggYnl0ZXMKPj4+IGlmIHNoYWRvdyBjYWxsIHN0YWNr
IHdlcmUgZW5hYmxlZCkgYW5kIGFscmVhZHkgc3BhbnMgYWNyb3NzIHR3byBjYWNoZWxpbmVzLgo+
Pgo+Pkl0IGhhcyBvbmx5IDY0IGJ5dGVzIG9mIGRhdGEgd2l0aG91dCBzaGFkb3cgY2FsbCBzdGFj
aywgYnV0IGl0IHdhc3RlZCA4Cj4+Ynl0ZXMgb24gdGhlIGhvbGVzLgo+PmEyIGlzIHNvbWV3aGF0
IGFuIG91dGxpZXIgdGhhdCBpcyBub3QgdXNlZCBtb3N0IGV4Y2VwdGlvbiBwYXRocyBhbmQKPj5l
eGNsdWRpbmcgaXQgbWFrZXMgZXZlcnl0aGluZyBmaXQgbmljZWx5IGV2ZW4gbm93Lgo+Cj4gQnV0
IHdlIGNhbid0IGV4Y2x1ZGUgc2hhZG93IGNhbGwgc3RhY2suIEl0J2xsIGxlYWQgdG8gaW5jcmVh
c2VkIHNpemUgaWYgdGhhdAo+IGNvbmZpZyBpcyBzZWxlY3RlZC4gQSBzb2x1dGlvbiBoYXMgdG8g
d29yayBmb3IgYWxsIHRoZSBjYXNlcyBhbmQgbm90IGhhbGYKPiBoZWFydGVkIGVmZm9ydC4KCldl
IGNvdWxkIGRyb3AgYTAgb3IgdXNlcl9zcCBhbmQgcGxhY2UgdGhlIHR3byBpbnRzIG5leHQgdG8g
ZWFjaCBvdGhlciwKc2F2aW5nIGF0IGxlYXN0IDE2IGJ5dGVzLgoKKHVzZXJfc3AsIGEwLCBhMSwg
YW5kIGEyIGFyZSBqdXN0IHRlbXBvcmFyeSBzdG9yYWdlLiAgSSB0aGluayB3b3VsZCBiZQogZmlu
ZSB3aXRoIGp1c3QgdHdvIHRlbXBvcmFyaWVzICsga2VybmVsX3NwLCB0byBwcm92aWRlIHRocmVl
IHJlZ2lzdGVycwogZm9yIG5ld192bWFsbG9jX2NoZWNrIGFuZCB3ZSBuZXZlciBuZWVkIG1vcmUu
KQoKPj4+IGlmIHNoYWRvdyBjYWxsIHN0YWNrIHdlcmUgZW5hYmxlZCkgYW5kIGFscmVhZHkgc3Bh
bnMgYWNyb3NzIHR3byBjYWNoZWxpbmVzLiBJCj4+PiBkaWQgc2VlIHRoZSBjb21tZW50IGFib3Zl
IHRoYXQgaXQgc2hvdWxkIGZpdCBpbnNpZGUgYSBjYWNoZWxpbmUuIEFsdGhvdWdoIEkKPj4+IGFz
c3VtZWQgaXRzIHN0YWxlIGNvbW1lbnQgZ2l2ZW4gdGhhdCBpdCBhbHJlYWR5IHNwYW5zIGFjcm9z
cyBjYWNoZWxpbmUgYW5kIEkKPj4+IGRpZG4ndCBzZWUgYW55IHNwZWNpYWwgbWVudGlvbiBpbiBj
b21taXQgbWVzc2FnZXMgb2YgY2hhbmdlcyB3aGljaCBncmV3IHRoaXMKPj4+IHN0cnVjdHVyZSBh
Ym92ZSBvbmUgY2FjaGVsaW5lLiBTbyBJIGFzc3VtZWQgdGhpcyB3YXMgYSBzdGFsZSBjb21tZW50
Lgo+Pj4KPj4+IE9uIHRoZSBvdGhlciBoYW5kLCB3aGVuZXZlciBlbmFibGUvbG9jayBiaXRzIGFy
ZSBjaGVja2VkLCB0aGVyZSBpcyBhIGhpZ2gKPj4+IGxpa2VseWhvb2QgdGhhdCB1c2VyX3NzcCBh
bmQgb3RoZXIgZmllbGRzIGFyZSBnb2luZyB0byBiZSBhY2Nlc3NlZCBhbmQKPj4+IHRodXMgaXQg
YWN0dWFsbHkgbWlnaHQgYmUgaGVscGZ1bCB0byBoYXZlIGl0IGFsbCBpbiBvbmUgY2FjaGVsaW5l
IGR1cmluZwo+Pj4gcnVudGltZS4KPj4KPj5ZZXMsIGFsdGhvdWdoIGFjY2Vzc2luZyBlbmFibGUv
bG9jayBiaXRzIHdpbGwgYmUgcmVsYXRpdmVseSByYXJlLgo+Pkl0IHNlZW1zIGJldHRlciB0byBo
YXZlIHRoZSBvdmVyaGVhZCBkdXJpbmcgdGhyZWFkIHNldHVwLCByYXRoZXIgdGhhbiBvbgo+PmV2
ZXJ5IHRyYXAuCj4+Cj4+PiBTbyBJIGFtIG5vdCBzdXJlIGlmIGl0cyBoZWxwZnVsIHN0aWNraW5n
IHRvIHRoZSBjb21tZW50IHdoaWNoIGFscmVhZHkgaXMgc3RhbGUuCj4+Cj4+V2UgY291bGQgZml4
IHRoZSBob2xlcyBhbmQgYWxzbyB1c2Ugc3AgaW5zdGVhZCBvZiBhMCBpbiB0aGUKPj5uZXdfdm1h
bGxvY19jaGVjaywgc28gZXZlcnl0aGluZyB3b3VsZCBmaXQgYmV0dGVyLgo+Pgo+PldlIGFyZSBy
ZWFsbHkgY2xvc2UgdG8gZml0dGluZyBpbnRvIGEgc2luZ2xlIGNhY2hlLWxpbmUsIHNvIEknZCBw
cmVmZXIKPj5pZiBzaGFkb3cgc3RhY2sgb25seSBmaWxsZWQgdGhyZWFkX2luZm8gd2l0aCBkYXRh
IHRoYXQgaXMgdXNlZCB2ZXJ5Cj4+b2Z0ZW4gaW4gdGhlIGV4Y2VwdGlvbiBoYW5kbGluZyBjb2Rl
Lgo+Cj4gSSBkb24ndCBnZXQgd2hhdCdzIHRoZSBiaWcgZGVhbCBpZiBpdCByZXN1bHRzIGluIHR3
byBjYWNoZWxpbmVzLiBXZSBjYW4KPiAocmUpb3JnYW5pemUgZGF0YSBzdHJ1Y3R1cmUgaW4gYSB3
YXkgdGhlIG1vc3QgZnJlcXVlbnRseSBhY2Nlc3NlZCBtZW1iZXJzIGFyZQo+IHRvZ2V0aGVyIGlu
IGEgc2luZ2xlIGNhY2hlbGluZS4gV2UganVzdCBuZWVkIHRvIGZpbmQgdGhvc2UgbWVtYmVycy4K
ClllcywgYW5kIGJlY2F1c2UgdGhpcyBwYXRjaCBpcyByZW9yZ2FuaXppbmcgdGhlIHN0cnVjdHVy
ZSwgSSB0aG91Z2h0IGl0CndvdWxkIGJlIGJldHRlciB0byBkbyB0aGUgYW5hbHlzaXMgbm93LCBy
YXRoZXIgdGhhbiB0byBpbmN1ciBhZGRpdGlvbmFsCmRlYnQuCgp0aHJlYWRfaW5mbyBtZW1iZXJz
IGFyZSBhY2Nlc3NlZCBkdXJpbmcgdGhlIGZpcnN0IGluc3RydWN0aW9ucyBhZnRlciBhCnRyYXAu
ICBXZSB3YW50IHRvIG1heGltaXplIHRoZSBjaGFuY2UgdGhhdCB0aGUgZXhlY3V0aW9uIGRvZXNu
J3Qgc3RhbGwKdW50aWwgdWFyY2ggaGFzIHRpbWUgdG8gZW5nYWdlIGl0cyBjcnlzdGFsIGJhbGwu
Cgo+IEluIHRoZSBob3QgcGF0aCBvZiBleGNlcHRpb24gaGFuZGxpbmcsIEkgc2VlIGFjY2Vzc2Vz
IHRvIHB0X3JlZ3Mgb24gc3RhY2sgYXMKPiB3ZWxsLiBUaGVzZSBhcmUgZGVmaW5pdGxleSBkaWZm
ZXJlbnQgY2FjaGVsaW5lIHRoYW4gdGhyZWFkX2luZm8uCgpSaWdodCwgYW5kIHdlIGFsc28gYWNj
ZXNzIGNhY2hlLWxpbmVzIGZvciB0aGUgY29kZS4KCkkgZG9uJ3Qga25vdyBob3cgd2VsbCBlYWNo
IHVhcmNoIGtlZXBzIHRoZSBlYXJseSB0cmFwIGRhdGEvY29kZSBpbgpjYWNoZXMsIGJ1dCBpdCBk
b2Vzbid0IHNlZW0gbGlrZSBhIGJhZCBpZGVhIHRvIG1pbmltaXplIHRoZSBhbW91bnQgb2YKY2Fj
aGUtbGluZXMgdGhhdCBhcmUgYWNjZXNzZWQgZWFybHkgYWZ0ZXIgdHJhcC4KCj4gSSB1bmRlcnN0
YW5kIHRoZSBhcmd1bWVudCBvZiBvbmUgbWVtYmVyIGZpZWxkIGNyb3NzaW5nIGludG8gdHdvIGNh
Y2hlbGluZXMgY2FuCj4gaGF2ZSB1bmRlc2lyZWQgcGVyZiBlZmZlY3RzLiBJIGRvIG5vdCB1bmRl
cnN0YW5kIHJlYXNvbmluZyB0aGF0IHRocmVhZF9pbmZvCj4gZXhhY3RseSBoYXMgdG8gZml0IGlu
c2lkZSBvbmUgY2FjaGVsaW5lLgoKSSBhZ3JlZSB0aGF0IHdlIGNvdWxkIHByb2JhYmx5IGxpZnQg
dGhlIGNvbnN0cmFpbnQgZm9yIHNvbWUgdmFsdWVzIC0tCml0J3MgYSBsb3Qgb2YgcGVyZm9ybWFu
Y2UgbW9kZWxpbmcgYW5kIGNvbnZpbmNpbmcsIHRob3VnaC4uLgoKSW4gdGhpcyBzZXJpZXMsIEkg
dGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byBhdm9pZCBzcGxpdHRpbmcga2VybmVsX3NwCmFuZCBh
MC9hMSBpbnRvIHR3byBjYWNoZS1saW5lcy4gIGtlcm5lbF9zcCBhbmQgYTAvYTEgYXJlIGFjY2Vz
c2VkIHdpdGhpbgp0aGUgZmlyc3QgZmV3IGluc3RydWN0aW9ucy4KCj4gSWYgdGhpcyB3YXMgYWx3
YXlzIHN1cHBvc2VkIHRvIGZpdCBpbiBhIHNpbmdsZSBjYWNoZWxpbmUsIGNsZWFybHkgdGhpcwo+
IGludmFyaWFudCBpc24ndC93YXNuJ3QgbWFpbnRhaW5lZCBhcyBjaGFuZ2VzIHRyaWNrbGVkIGlu
LiBJIHdvdWxkIGxpa2UgdG8gc2VlCj4gd2hhdCBtYWludGFpbmVycyBoYXZlIHRvIHNheSBvciBz
b21lb25lIHdobyBkaWQgZGF0YSBhbmFseXNpcyBvbiB0aGlzLgoKSSBkb24ndCB0aGluayBpdCBp
cyBuZWNlc3NhcnkgdG8gZml4IHRoZSByZXN0LCBqdXN0IG5vdCBtYWtpbmcgdGhpbmdzCndvcnNl
IGlzIGFscmVhZHkgZ3JlYXQuCgo+PkkgdGhpbmsgd2UgY291bGQgZG8gd2l0aG91dCB1c2VyX3Nw
IGluIHRocmVhZF9pbmZvIGFzIHdlbGwsIHNvIHRoZXJlIGFyZQo+Pm90aGVyIHBhY2tpbmcgb3B0
aW9ucy4KPgo+IFN1cmUsIHByb2JhYmx5IHNvbWV3aGVyZSBpbiB0YXNrX3N0cnVjdC4gQnV0IGZh
Y3Qgb2YgdGhlIG1hdHRlciBpcyB0aGF0IGl0IGhhcwo+IHRvIGJlIHNhdmVkL3Jlc3RvcmUgZHVy
aW5nIGV4Y2VwdGlvbiBlbnRyeS9leGl0LiBCdXQgdGhlbiBsb2FkL3N0b3JlIHRvCj4gdGFza19z
dHJ1Y3QgaXMgZXNzZW50aWFsbHkgYSBkaWZmZXJlbnQgY2FjaGxpbmUuIE5vdCBzdXJlIHdoYXQg
d2Ugd2lsbCBhY2hpZXZlCj4gaGVyZT8KCnVzZXJfc3AgaXMgb25seSB0ZW1wb3JhcmlseSBzdG9y
YWdlIHNwYWNlIGluIHRocmVhZF9pbmZvLgpUaGUgc3AgcmVnaXN0ZXIgaXMgcmVzdG9yZWQgZnJv
bSBwdF9yZWdzLCBzbyB3ZSBjb3VsZCByZWZhY3RvciB0aGUgY29kZQp0byBkcm9wIHVzZXJfc3Ag
ZnJvbSB0aHJlYWRfaW5mby4KCmUuZy4gdXNlIGEwLCBhMSwgb3IgYTIgZm9yIHRoZSB0ZW1wb3Jh
cnkgc3RvcmFnZTogdXNlcl9zcCBpcyBub3QgZXZlbgp0aGUgdXNlcnNwYWNlIHNwLCBpdCBpcyBz
cCBvZiB0aGUgcHJldmlvdXMgc3AgInVzZXIiLCB3aGljaCBtaWdodCBoYXZlCmJlZW4gdGhlIGtl
cm5lbC4KCj4+QnR3LiBjb3VsZCBzc3AgYmUgYWRkZWQgdG8gcHRfcmVncz8KPgo+IEkgaGFkIHRo
YXQgZWFybGllci4gSXQgYnJlYWtzIHVzZXIgYWJpLiBBbmQgaXQgd2FzIGEgbm8gZ28uCgpUaGFu
a3MsIEkgd2FzIGFmcmFpZCBvZiB0aGF0LiA6KQoKV2UgbWlnaHQgd2FudCB0byBldmVudHVhbGx5
IHB1c2ggc3NwIHRvIHRoZSBzdGFjayB0byBmb2xsb3cgdGhlIHNhbWUKZGVzaWduIGZvciB0cmFw
IG5lc3RpbmcgYXMgc3AgaGFzLCBidXQgdGhhdCBjYW4gaGFwcGVuIHdoZW4gaW1wbGVtZW50aW5n
CnNzcCBmb3IgdGhlIGtlcm5lbC4gIFNxdWVlemluZyBpbnRvIHRocmVhZF9pbmZvIHNob3VsZCB3
b3JrIGZvciBub3cuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
