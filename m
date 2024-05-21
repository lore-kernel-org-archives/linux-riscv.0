Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F339FC25B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 13:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5G/eppKrJsWEcI/uEMOBErZw/QpFii55ws6XWkcnUE=; b=4Bk1rAFGRS9D5O
	2x6/4xsMANteN5K27AFnO2OpmthVoU69bM2k4lJk6xJVU/2u2sGDR6S3WzVIa5Xa4pFh+InN2s2Ya
	Ak5zw/jrrr9M0s3OdZUOQCKFgfj0T9H/IbCzg12NU6JmAMaLbzvAttiVC5W6WGUeNUUQRYaJTyHJK
	R3zMysvaHnjytHSi6cRVlM/i/NUtkUIq9iHnuMJUDUqCSs24dtNwacu1AqRMJa9dZEqZE426mAJhJ
	ZhIYqnJ445IdS0+uWZaC6o+mSxfGn4NhR56zBvpAClZm7GBO6YmjVnuCQWSna5R/oRDrY3eBxyEby
	Eeu5UYm4zbcPvz9dtdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PkE-000000001vU-1Qz9;
	Tue, 21 May 2024 13:41:34 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9PkB-000000001sj-3Obf
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 13:41:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-420298ff5b1so43117445e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716298884; x=1716903684; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+1xsVOenBqGRXV+vq+cVu4jiCpn+H/2Flnt09jmSX0=;
        b=FKoa8B6mA+/oEnGGTj0foTAOhvawB/5TkSalF8AwMkEKqVbvw+NF6i6SLA5FhPMTpU
         uZ3bxmJXj85ncePKse2i+8P7MZqLG9grGq9w25PeVjnBOoqai+sfvlSzDDrDc1Cvg7w+
         PSiU09fT9fH3WpUSxXQZ0wOmuF+6g8PoaekzXUWLygal8CddQIg9qD5+8tR/cVrwszHn
         jMWhPkSJXKeez2Gl3dUpNpYxWBmAP8l0YHMl9v3M0rbzhoWsKhiJNeMuh5o/0YrbJwGa
         pmiRg0ZMqp+gpVSIh8G3EZ7PwWewMZJ63V24kCINKw1T570sgBVKzOk8YfD1JqvSVdUU
         ptlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716298884; x=1716903684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+1xsVOenBqGRXV+vq+cVu4jiCpn+H/2Flnt09jmSX0=;
        b=cwQ6VcpMLW6B6arhWzRts5dmxQt5Zn8/CUGxc5S09w4+AI/aHWMJD+Q5oKx31Tlw57
         O1hMDAudmQmdakCGQkiuC5eaBrh5m3Xmv803N9Ij+xBuaD1kEbw2wyKNDfLvSVyIJr/W
         hwWfqQFfIImwlN/2O31X1ztKYxV4K2zEHFCfi8SMsbRAIfnQJ160wIHNFv+aoEEBv15/
         aBFAk+uzHVZs4Ykn8LBvx9AAGPQialG44P1qU/AnXtx0iLgi8GWkC2SYtLeM20s2PhLS
         ZI4MJBVaD+chqPUyoFNffUovpz16WGmDkWMy2NdC+TetC6n4pseSzn0K0Y19mYFNJocB
         eRqA==
X-Forwarded-Encrypted: i=1; AJvYcCWjWC/UITM7mE0YJcRi5MO32wVPCImegalE1gSz2UyyVx0osppr+sVASzRR3AuPL/xTtrUMiu6Iz0tgFnSpSJjPcgf2ldZOcgiEKgyTCLrJ
X-Gm-Message-State: AOJu0YzLy0ZYPSSRUQMFUbHZZghR498/YvPtFlNOJ2/WLsk9LzbI4Un4
	LZoPELI/Wu2cjyKfRutvPZbcUIX1hOJgUoZfJECxn+9ukq5L2qzdxoHdxFkb2l0Zb7EjrvNDSza
	UiM56Eeka/wjoYd3D4zCU3hcbzuv8hvVuKVrICQ==
X-Google-Smtp-Source: AGHT+IEHsbdyc9+JywKTd0t0PpMsBEzeUY13uoyr7VftCkfS7u3Z4jvNXqxJorAsuGUNCeaWmG6E1b/MXJC0vpgD+7A=
X-Received: by 2002:a05:600c:5601:b0:41a:adc3:f777 with SMTP id
 5b1f17b1804b1-41feaa38ec7mr320385465e9.16.1716298884332; Tue, 21 May 2024
 06:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240521114830.841660-1-bjorn@kernel.org> <20240521114830.841660-10-bjorn@kernel.org>
In-Reply-To: <20240521114830.841660-10-bjorn@kernel.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 21 May 2024 15:41:13 +0200
Message-ID: <CAHVXubirHPj1pZhU7sFxFTzBWz_Psf5uts9y3Dji-a03nb=_iw@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] riscv: mm: Add support for ZONE_DEVICE
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_064131_872148_8EC1D4B7 
X-CRM114-Status: GOOD (  20.11  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMjEsIDIwMjQgYXQgMTo0OeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMu
Y29tPgo+Cj4gWk9ORV9ERVZJQ0UgcGFnZXMgbmVlZCBERVZNQVAgUFRFcyBzdXBwb3J0IHRvIGZ1
bmN0aW9uCj4gKEFSQ0hfSEFTX1BURV9ERVZNQVApLiBDbGFpbSBhbm90aGVyIFJTVyAocmVzZXJ2
ZWQgZm9yIHNvZnR3YXJlKSBiaXQKPiBpbiB0aGUgUFRFIGZvciBERVZNQVAgbWFyaywgYWRkIHRo
ZSBjb3JyZXNwb25kaW5nIGhlbHBlcnMsIGFuZCBlbmFibGUKPiBBUkNIX0hBU19QVEVfREVWTUFQ
IGZvciByaXNjdjY0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2
b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAg
IHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaCAgIHwgMjAgKysr
KysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMu
aCB8ICAxICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICB8IDE3ICsr
KysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGlu
ZGV4IDI3MjRkYzJhZjI5Zi4uMGI3NDY5OGM2M2M3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
S2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC0zNiw2ICszNiw3IEBAIGNv
bmZpZyBSSVNDVgo+ICAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX05PTl9PVkVSTEFQUElOR19BRERS
RVNTX1NQQUNFCj4gICAgICAgICBzZWxlY3QgQVJDSF9IQVNfUE1FTV9BUEkKPiAgICAgICAgIHNl
bGVjdCBBUkNIX0hBU19QUkVQQVJFX1NZTkNfQ09SRV9DTUQKPiArICAgICAgIHNlbGVjdCBBUkNI
X0hBU19QVEVfREVWTUFQIGlmIDY0QklUICYmIE1NVQo+ICAgICAgICAgc2VsZWN0IEFSQ0hfSEFT
X1BURV9TUEVDSUFMCj4gICAgICAgICBzZWxlY3QgQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVAgaWYg
TU1VCj4gICAgICAgICBzZWxlY3QgQVJDSF9IQVNfU0VUX01FTU9SWSBpZiBNTVUKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUtNjQuaAo+IGluZGV4IDIyMWE1YzFlZTI4Ny4uYzY3YTliYmZkMDEw
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5oCj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmgKPiBAQCAtNDAwLDQgKzQwMCwy
NCBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlICpwZ2RfcGFnZShwZ2RfdCBwZ2QpCj4gICNk
ZWZpbmUgcDRkX29mZnNldCBwNGRfb2Zmc2V0Cj4gIHA0ZF90ICpwNGRfb2Zmc2V0KHBnZF90ICpw
Z2QsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcyk7Cj4KPiArI2lmZGVmIENPTkZJR19UUkFOU1BBUkVO
VF9IVUdFUEFHRQo+ICtzdGF0aWMgaW5saW5lIGludCBwdGVfZGV2bWFwKHB0ZV90IHB0ZSk7Cj4g
K3N0YXRpYyBpbmxpbmUgcHRlX3QgcG1kX3B0ZShwbWRfdCBwbWQpOwo+ICsKPiArc3RhdGljIGlu
bGluZSBpbnQgcG1kX2Rldm1hcChwbWRfdCBwbWQpCj4gK3sKPiArICAgICAgIHJldHVybiBwdGVf
ZGV2bWFwKHBtZF9wdGUocG1kKSk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgaW50IHB1ZF9k
ZXZtYXAocHVkX3QgcHVkKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiArc3Rh
dGljIGlubGluZSBpbnQgcGdkX2Rldm1hcChwZ2RfdCBwZ2QpCj4gK3sKPiArICAgICAgIHJldHVy
biAwOwo+ICt9Cj4gKyNlbmRpZgo+ICsKPiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfUEdUQUJMRV82
NF9IICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS1iaXRz
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oCj4gaW5kZXggMTc5YmQ0
YWZlY2U0Li5hOGY1MjA1Y2VhNTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLWJpdHMuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS1i
aXRzLmgKPiBAQCAtMTksNiArMTksNyBAQAo+ICAjZGVmaW5lIF9QQUdFX1NPRlQgICAgICAoMyA8
PCA4KSAgICAvKiBSZXNlcnZlZCBmb3Igc29mdHdhcmUgKi8KPgo+ICAjZGVmaW5lIF9QQUdFX1NQ
RUNJQUwgICAoMSA8PCA4KSAgICAvKiBSU1c6IDB4MSAqLwo+ICsjZGVmaW5lIF9QQUdFX0RFVk1B
UCAgICAoMSA8PCA5KSAgICAvKiBSU1csIGRldm1hcCAqLwo+ICAjZGVmaW5lIF9QQUdFX1RBQkxF
ICAgICBfUEFHRV9QUkVTRU5UCj4KPiAgLyoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IGlu
ZGV4IDc5MzNmNDkzZGI3MS4uMDJmYWRjMjc2MDY0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgKPiBAQCAtMzg3LDYgKzM4NywxMyBAQCBzdGF0aWMgaW5saW5lIGludCBwdGVfc3BlY2lh
bChwdGVfdCBwdGUpCj4gICAgICAgICByZXR1cm4gcHRlX3ZhbChwdGUpICYgX1BBR0VfU1BFQ0lB
TDsKPiAgfQo+Cj4gKyNpZmRlZiBDT05GSUdfQVJDSF9IQVNfUFRFX0RFVk1BUAo+ICtzdGF0aWMg
aW5saW5lIGludCBwdGVfZGV2bWFwKHB0ZV90IHB0ZSkKPiArewo+ICsgICAgICAgcmV0dXJuIHB0
ZV92YWwocHRlKSAmIF9QQUdFX0RFVk1BUDsKPiArfQo+ICsjZW5kaWYKCk5vdCBzdXJlIHlvdSBu
ZWVkIHRoZSAjaWZkZWYgaGVyZS4KCj4gKwo+ICAvKiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9y
ZHByb3RlY3QocHRlX3QgcHRlKSAqLwo+Cj4gIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX3dycHJv
dGVjdChwdGVfdCBwdGUpCj4gQEAgLTQyOCw2ICs0MzUsMTEgQEAgc3RhdGljIGlubGluZSBwdGVf
dCBwdGVfbWtzcGVjaWFsKHB0ZV90IHB0ZSkKPiAgICAgICAgIHJldHVybiBfX3B0ZShwdGVfdmFs
KHB0ZSkgfCBfUEFHRV9TUEVDSUFMKTsKPiAgfQo+Cj4gK3N0YXRpYyBpbmxpbmUgcHRlX3QgcHRl
X21rZGV2bWFwKHB0ZV90IHB0ZSkKPiArewo+ICsgICAgICAgcmV0dXJuIF9fcHRlKHB0ZV92YWwo
cHRlKSB8IF9QQUdFX0RFVk1BUCk7Cj4gK30KPiArCj4gIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRl
X21raHVnZShwdGVfdCBwdGUpCj4gIHsKPiAgICAgICAgIHJldHVybiBwdGU7Cj4gQEAgLTcxMSw2
ICs3MjMsMTEgQEAgc3RhdGljIGlubGluZSBwbWRfdCBwbWRfbWtkaXJ0eShwbWRfdCBwbWQpCj4g
ICAgICAgICByZXR1cm4gcHRlX3BtZChwdGVfbWtkaXJ0eShwbWRfcHRlKHBtZCkpKTsKPiAgfQo+
Cj4gK3N0YXRpYyBpbmxpbmUgcG1kX3QgcG1kX21rZGV2bWFwKHBtZF90IHBtZCkKPiArewo+ICsg
ICAgICAgcmV0dXJuIHB0ZV9wbWQocHRlX21rZGV2bWFwKHBtZF9wdGUocG1kKSkpOwo+ICt9Cj4g
Kwo+ICBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3BtZF9hdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwg
dW5zaWduZWQgbG9uZyBhZGRyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG1k
X3QgKnBtZHAsIHBtZF90IHBtZCkKPiAgewo+IC0tCj4gMi40MC4xCj4KCk90aGVyd2lzZSwgeW91
IGNhbiBhZGQ6CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
