Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C551EC25B4F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 00:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hIYOOGfaZ/JNpqGvy2zbIIwEhv8ZDY2Q1zgL0OVD1w=; b=doVevwiOKDHSK4
	JMgAjJIJQoS7kHY6FHEqIWy5Y1fDOugBYr3rgSTBAZQddV4u7hsfom2yc1P+9nP8zxlNkIxAE2JFd
	TnQ2B+RByBgbbynSup8BHZitZd5kPlrAEFzKnBDxj98nNLRAeHZphODEolKhAOfNfoxTPOLjiviKV
	tbXeXrDnPJ3ChOWE435NWZNwElqA3uXATOzcgIpi0iIXQbDY3M6gzoBbOerCB3EYunJ59mtL+v8EB
	Xw+fh0wnM2/j46Bb9xycq5hqOoQQ6zDGBba7/d+m0CBhwYngvQwBLSunhoUt4saohp7H+GlWgkWAP
	WY3yv17FDiV9fjMlKqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4rwA-0000000HRLp-0bhB;
	Thu, 09 May 2024 00:47:06 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4rvt-0000000HRDa-2Ymc;
	Thu, 09 May 2024 00:46:57 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4df265f634aso128619e0c.3;
        Wed, 08 May 2024 17:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715215607; x=1715820407; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HutaMr4YNAQdV0piVG8U9fxjw32ZuJHu11VAl/8knE=;
        b=apIj4kwxYzIDwkW9Rd1OFS9OvT2+sev1qFBh+ePYaecGyf7fWo0M6ACPECwtPNiUhG
         0VHzi51mAyz+0IpPB3aQpgd+nFoETCPnK3HtHYhr99ovhOUoJ0vI4lxsB8+WlneEo7UX
         YzYhX/Cdh6ye14Ql8EJtEWlSUwvmGWfzq0uJ1ruEuLl37g3nJwxMg17Q6dA/C6TcqgLB
         pV+2AT+PyRBZJ/1DUz4s5QwUdj82EHppC/y1plYKcqaMZQnG9OOxAVGO/HcwRWdxhV96
         r70yyVFRBgDx2ix56iZOm8l+mkgwB7dwUUaTJ6L9TK0nj58F6n/x4UNvuwWeHf1jCm3I
         UJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715215607; x=1715820407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HutaMr4YNAQdV0piVG8U9fxjw32ZuJHu11VAl/8knE=;
        b=wv3fB+ZEDSXukBn5koIqURB0MSxaaK//rN4pJeWf4+yLs/48ZlPpS2uhCSAnbIxCTZ
         i0bjmK81nlk6wqDyEsOhxD+zjfWYjsbm9q2es5Z5NwBMVXZq02My3EMWZMqPL5fSvduu
         uhtf+2ac+bML0Bw6rBc0mlz8RrJJP0e/QDI15BZ/7zmirxEXD/eSYitYiBmrkA+kRadx
         FRn/JDL3Lu9xEPySDzl49B2jTQVc32BiaBnLOIZsnqfWkSQcz+jQzHkDb6m2FNjsJWOa
         p1EEz7erxj2B0CxXVDFLIdBELoN/08VMlHj8M2HMbYoTUJwcktgtNyaCxVMYAtv1h0wv
         Icsw==
X-Forwarded-Encrypted: i=1; AJvYcCWICC6c9aHYD1jqwax9gMHMvydnFJYEa5+BjIoScVBYOGzhu6nIOsvKDo59ktGgjIJ6/lYu7raxWPISBKYAvmbz0DETPU3i+pyyV52CJy/GAP40mpDIgHqInOAvH0D5ELu65bIdPxj7hMhVaikR4tFcN7OxmtnNZ3hBqSqdkbLvlTDmy+HllmwEBdmT86n9HEVWAlqg
X-Gm-Message-State: AOJu0YzMDK+G/R7l1BcjzPc5/rOICqCyapP9wtJ+FRUwkwlvC5hDlgiM
	7pd/0XOJXv2i3Q5tC6NkuFOgiFfFvPkH/7V5uuxXjib9BxBLl3uaZJgOXYTk56fW7j4efmEdt5+
	wNGeJkfU5hYREcaUZP4Chtrndhkc=
X-Google-Smtp-Source: AGHT+IF79LXSq4NewTC5DFVGeNH4TGRK7B023rxeM+UTTC9bpQ7D2OYFXWiN0Dal3DjFVZkbQyCweJ7ZkvtSI8S33PY=
X-Received: by 2002:a05:6122:7cb:b0:4d8:797b:94df with SMTP id
 71dfb90a1353d-4df6929c091mr4383063e0c.2.1715215607538; Wed, 08 May 2024
 17:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240508191931.46060-1-alexghiti@rivosinc.com> <20240508191931.46060-2-alexghiti@rivosinc.com>
In-Reply-To: <20240508191931.46060-2-alexghiti@rivosinc.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 9 May 2024 12:46:35 +1200
Message-ID: <CAGsJ_4xayC4D4y0d7SPXxCvuW4-rJQUCa_-OUDSsOGm_HyPm1w@mail.gmail.com>
Subject: Re: [PATCH 01/12] mm, arm64: Rename ARM64_CONTPTE to THP_CONTPTE
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ard Biesheuvel <ardb@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_174649_811703_C8C1D3E9 
X-CRM114-Status: GOOD (  20.56  )
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

T24gVGh1LCBNYXkgOSwgMjAyNCBhdCA3OjIw4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSBBUk02NF9DT05UUFRFIGNvbmZpZyByZXBy
ZXNlbnRzIHRoZSBjYXBhYmlsaXR5IHRvIHRyYW5zcGFyZW50bHkgdXNlCj4gY29udHB0ZSBtYXBw
aW5ncyBmb3IgVEhQIHVzZXJzcGFjZSBtYXBwaW5ncywgd2hpY2ggd2lsbCBiZSBpbXBsZW1lbnRl
ZAo+IGluIHRoZSBuZXh0IGNvbW1pdHMgZm9yIHJpc2N2LCBzbyBtYWtlIHRoaXMgY29uZmlnIG1v
cmUgZ2VuZXJpYyBhbmQgbW92ZQo+IGl0IHRvIG1tLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFu
ZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL2FybTY0L0tj
b25maWcgICAgICAgICAgICAgICB8IDkgLS0tLS0tLS0tCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9h
c20vcGd0YWJsZS5oIHwgNiArKystLS0KPiAgYXJjaC9hcm02NC9tbS9NYWtlZmlsZSAgICAgICAg
ICAgfCAyICstCj4gIG1tL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgOSArKysrKysr
KysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L0tjb25maWcgYi9hcmNoL2FybTY0L0tjb25maWcK
PiBpbmRleCBhYzJmNmQ5MDZjYzMuLjlkODIzMDE1YjRlNSAxMDA2NDQKPiAtLS0gYS9hcmNoL2Fy
bTY0L0tjb25maWcKPiArKysgYi9hcmNoL2FybTY0L0tjb25maWcKPiBAQCAtMjIyNywxNSArMjIy
Nyw2IEBAIGNvbmZpZyBVTldJTkRfUEFUQ0hfUEFDX0lOVE9fU0NTCj4gICAgICAgICBzZWxlY3Qg
VU5XSU5EX1RBQkxFUwo+ICAgICAgICAgc2VsZWN0IERZTkFNSUNfU0NTCj4KPiAtY29uZmlnIEFS
TTY0X0NPTlRQVEUKPiAtICAgICAgIGJvb2wgIkNvbnRpZ3VvdXMgUFRFIG1hcHBpbmdzIGZvciB1
c2VyIG1lbW9yeSIgaWYgRVhQRVJUCj4gLSAgICAgICBkZXBlbmRzIG9uIFRSQU5TUEFSRU5UX0hV
R0VQQUdFCj4gLSAgICAgICBkZWZhdWx0IHkKPiAtICAgICAgIGhlbHAKPiAtICAgICAgICAgV2hl
biBlbmFibGVkLCB1c2VyIG1hcHBpbmdzIGFyZSBjb25maWd1cmVkIHVzaW5nIHRoZSBQVEUgY29u
dGlndW91cwo+IC0gICAgICAgICBiaXQsIGZvciBhbnkgbWFwcGluZ3MgdGhhdCBtZWV0IHRoZSBz
aXplIGFuZCBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzLgo+IC0gICAgICAgICBUaGlzIHJlZHVjZXMg
VExCIHByZXNzdXJlIGFuZCBpbXByb3ZlcyBwZXJmb3JtYW5jZS4KPiAtCj4gIGVuZG1lbnUgIyAi
S2VybmVsIEZlYXR1cmVzIgo+Cj4gIG1lbnUgIkJvb3Qgb3B0aW9ucyIKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L3BndGFibGUuaAo+IGluZGV4IDdjMjkzOGNiNzBiOS4uMTc1OGNlNzFmYWU5IDEwMDY0NAo+IC0t
LSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gKysrIGIvYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBAQCAtMTM2OSw3ICsxMzY5LDcgQEAgZXh0ZXJuIHZvaWQg
cHRlcF9tb2RpZnlfcHJvdF9jb21taXQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVf
dCAqcHRlcCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwdGVfdCBvbGRf
cHRlLCBwdGVfdCBuZXdfcHRlKTsKPgo+IC0jaWZkZWYgQ09ORklHX0FSTTY0X0NPTlRQVEUKPiAr
I2lmZGVmIENPTkZJR19USFBfQ09OVFBURQoKSXMgaXQgbmVjZXNzYXJpbHkgVEhQPyBjYW4ndCBi
ZSBodWdldGxiIG9yIG90aGVycz8gSSBmZWVsIFRIUF9DT05UUFRFCmlzbid0IGEgZ29vZCBuYW1l
LgoKPgo+ICAvKgo+ICAgKiBUaGUgY29udHB0ZSBBUElzIGFyZSB1c2VkIHRvIHRyYW5zcGFyZW50
bHkgbWFuYWdlIHRoZSBjb250aWd1b3VzIGJpdCBpbiBwdGVzCj4gQEAgLTE2MjIsNyArMTYyMiw3
IEBAIHN0YXRpYyBpbmxpbmUgaW50IHB0ZXBfc2V0X2FjY2Vzc19mbGFncyhzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSwKPiAgICAgICAgIHJldHVybiBjb250cHRlX3B0ZXBfc2V0X2FjY2Vzc19m
bGFncyh2bWEsIGFkZHIsIHB0ZXAsIGVudHJ5LCBkaXJ0eSk7Cj4gIH0KPgo+IC0jZWxzZSAvKiBD
T05GSUdfQVJNNjRfQ09OVFBURSAqLwo+ICsjZWxzZSAvKiBDT05GSUdfVEhQX0NPTlRQVEUgKi8K
Pgo+ICAjZGVmaW5lIHB0ZXBfZ2V0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fcHRl
cF9nZXQKPiAgI2RlZmluZSBzZXRfcHRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF9fc2V0X3B0ZQo+IEBAIC0xNjQyLDcgKzE2NDIsNyBAQCBzdGF0aWMgaW5saW5lIGlu
dCBwdGVwX3NldF9hY2Nlc3NfZmxhZ3Moc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gICNk
ZWZpbmUgX19IQVZFX0FSQ0hfUFRFUF9TRVRfQUNDRVNTX0ZMQUdTCj4gICNkZWZpbmUgcHRlcF9z
ZXRfYWNjZXNzX2ZsYWdzICAgICAgICAgICAgICAgICAgX19wdGVwX3NldF9hY2Nlc3NfZmxhZ3MK
Pgo+IC0jZW5kaWYgLyogQ09ORklHX0FSTTY0X0NPTlRQVEUgKi8KPiArI2VuZGlmIC8qIENPTkZJ
R19USFBfQ09OVFBURSAqLwo+Cj4gIGludCBmaW5kX251bV9jb250aWcoc3RydWN0IG1tX3N0cnVj
dCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgICAgICAgICAgICAgICAgICAgIHB0ZV90ICpw
dGVwLCBzaXplX3QgKnBnc2l6ZSk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vTWFrZWZp
bGUgYi9hcmNoL2FybTY0L21tL01ha2VmaWxlCj4gaW5kZXggNjA0NTQyNTY5NDViLi41MmExYjIw
ODI2MjcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9tbS9NYWtlZmlsZQo+ICsrKyBiL2FyY2gv
YXJtNjQvbW0vTWFrZWZpbGUKPiBAQCAtMyw3ICszLDcgQEAgb2JqLXkgICAgICAgICAgICAgICAg
ICAgICAgICAgICA6PSBkbWEtbWFwcGluZy5vIGV4dGFibGUubyBmYXVsdC5vIGluaXQubyBcCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjYWNoZS5vIGNvcHlwYWdlLm8gZmx1
c2gubyBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpb3JlbWFwLm8gbW1h
cC5vIHBnZC5vIG1tdS5vIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRleHQubyBwcm9jLm8gcGFnZWF0dHIubyBmaXhtYXAubwo+IC1vYmotJChDT05GSUdfQVJNNjRf
Q09OVFBURSkgICAgKz0gY29udHB0ZS5vCj4gK29iai0kKENPTkZJR19USFBfQ09OVFBURSkgICAg
ICArPSBjb250cHRlLm8KPiAgb2JqLSQoQ09ORklHX0hVR0VUTEJfUEFHRSkgICAgICs9IGh1Z2V0
bGJwYWdlLm8KPiAgb2JqLSQoQ09ORklHX1BURFVNUF9DT1JFKSAgICAgICs9IHB0ZHVtcC5vCj4g
IG9iai0kKENPTkZJR19QVERVTVBfREVCVUdGUykgICArPSBwdGR1bXBfZGVidWdmcy5vCj4gZGlm
ZiAtLWdpdCBhL21tL0tjb25maWcgYi9tbS9LY29uZmlnCj4gaW5kZXggYzMyNTAwM2Q2NTUyLi5m
ZDRkZTIyMWExYzYgMTAwNjQ0Cj4gLS0tIGEvbW0vS2NvbmZpZwo+ICsrKyBiL21tL0tjb25maWcK
PiBAQCAtOTg0LDYgKzk4NCwxNSBAQCBjb25maWcgQVJDSF9IQVNfQ0FDSEVfTElORV9TSVpFCj4g
IGNvbmZpZyBBUkNIX0hBU19DT05UUFRFCj4gICAgICAgICBib29sCj4KPiArY29uZmlnIFRIUF9D
T05UUFRFCj4gKyAgICAgICBib29sICJDb250aWd1b3VzIFBURSBtYXBwaW5ncyBmb3IgdXNlciBt
ZW1vcnkiIGlmIEVYUEVSVAo+ICsgICAgICAgZGVwZW5kcyBvbiBBUkNIX0hBU19DT05UUFRFICYm
IFRSQU5TUEFSRU5UX0hVR0VQQUdFCj4gKyAgICAgICBkZWZhdWx0IHkKPiArICAgICAgIGhlbHAK
PiArICAgICAgICAgV2hlbiBlbmFibGVkLCB1c2VyIG1hcHBpbmdzIGFyZSBjb25maWd1cmVkIHVz
aW5nIHRoZSBQVEUgY29udGlndW91cwo+ICsgICAgICAgICBiaXQsIGZvciBhbnkgbWFwcGluZ3Mg
dGhhdCBtZWV0IHRoZSBzaXplIGFuZCBhbGlnbm1lbnQgcmVxdWlyZW1lbnRzLgo+ICsgICAgICAg
ICBUaGlzIHJlZHVjZXMgVExCIHByZXNzdXJlIGFuZCBpbXByb3ZlcyBwZXJmb3JtYW5jZS4KPiAr
Cj4gIGNvbmZpZyBBUkNIX0hBU19DVVJSRU5UX1NUQUNLX1BPSU5URVIKPiAgICAgICAgIGJvb2wK
PiAgICAgICAgIGhlbHAKPiAtLQo+IDIuMzkuMgoKVGhhbmtzCkJhcnJ5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
