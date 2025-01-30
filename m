Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC64C0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 22:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TubmSrwRi/TCfWi2WGQBNH4XIGRnJUjKLSO17age/XE=; b=G+2inD9aGfPaUs
	UNwHIXnTyVs/tdRZDETrPXb++t1kc59e+7a7fC1r5cCdLGqWdTAqxOJQVsPvnSIqY7E2YgUqCP478
	Ha0ynaJHEdKEn5ICj4GE2/WgOdboxP5ckF1xOM6WDj5a4gVX9PvqWDzX3qc/ooZ+U4c7EYMvHxk6h
	XIfkSJAGjWALfqhnBgH8YAS09aRUlqD3NOqFpIg5b2Q9hjJoHwpYFM5P/oSvpufdFrjVL6xWGARIC
	IMclpTqMC9cpVq2qGa4QCxfGKeTlX0gqp+4Aw3XW0+zC2XikeZQMRA2SwWtSzY+Cl+Q8ZRPGDbUxZ
	tU7unb7AFET0u04DlDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tddUu-00000009kFn-0QAt;
	Thu, 30 Jan 2025 22:58:56 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tddUq-00000009kEe-3dPm
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 22:58:54 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-21ddb406f32so21394635ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 14:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738277931; x=1738882731; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iqrirXyAiJow4eUPN0yWoilteak1+pXXR1BTytYKwjs=;
        b=jiQc4AmRVfLgtVX3D/U7L5Da/o7ohvdrBf/1XdK+xS+N+PaN0sMzLNOSGH54qZ4Y+Z
         GO5N7ZUm3YlY/ABlUgVnMOUVWVDVOA7NjbQiD3TzBmYyG+B/6XTUSBCx+5rhUbCD0W/S
         L5vgpOUKyEzDC1CnXBXdl6ecanHq2cnUsQ8sNAzKUMV526OH7R+jIlBoL4Yd+DaKZDu0
         vhjSCUoypQQR24iyNCOgDaSY4RMxhEmSgRV8g7CAZVLw7yYES+Dl/QOR3XWsABnnZD6u
         Y2eqIi5OWTDrBMb4xYoXJcTKXYYupF8nV00TpxMQ65Xbo6QRmrugiq0GIFYLd0dV3lQO
         x2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738277931; x=1738882731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqrirXyAiJow4eUPN0yWoilteak1+pXXR1BTytYKwjs=;
        b=uK5QT55rdxolDdivkBLRPCfORsX/oGMugUjAwn3DoGmXr7HKTjxczV3O9XxmFmqg7f
         lxfz67/SqahE6k69y93wxg6d9VrKymSdqlR2igh8SDr0Trll9gmp+KwJh7eSKXGR3KB2
         zn6Fxjl6mpgGiyu2N9LwIwD8ZvjxjM9C4ZAYSYmtLsIYSSunOzR71gBZeFBpmjwgf5u0
         sVmPjcf0t8jsl+F7QKPlvXyCsajmQcxE4Dsbq8nHmW01Z4QAQJKxmJeeoMb0ED0kffpr
         VWQKgPmdP/PZ7/njmKTnOZJDy4+8HK7XBtUOKfXZDyAq7vl4zpQNwyrcM47WXf5oiKU5
         nA5g==
X-Forwarded-Encrypted: i=1; AJvYcCW+wZ1nkIVYbF3PFIBLyYqpcdufj6G3Bi2D4mX+9VblWG4zmcpT/1qhH2DxqPP9YrFSIfF5JsjOEwR4gQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPnAQpAjp+EX0iwvvnkBCzzAJzBgukodWBSLehnNV9zOh9fFC+
	+F9u7Dlh83E8qEN8IkSfF4dxqfEd6uUKdt/E+ECD2gK0LvoxKNoUnPLhSZYeSHE=
X-Gm-Gg: ASbGncsM69O+D2xiSpVGtmOFNpapIgmiW4XtnFap+zeKEODBOtJUrssf55RRyNAUUH2
	oo2Z4B8lugVyIMGkR/i7NKZ6x8D36K1UudcXJUqn4wHI5no+AeFO49ouVnBEedREBM87VZTRgsJ
	DJIRWF/ZWJqaWZfUXuwDI9KtFfjqLzqVTk9R/dau+AifIRJgXYI0pAJoq/kXujjgvOSIa2DVGbu
	DY6PPl5yjhBfE5JMnr+Ys41DK2T5AAqlmo8jr9rmsF6u3ZAVP94RSfajH6NP1bTv0/+8mw6LSNQ
	50dnm6Eevg==
X-Google-Smtp-Source: AGHT+IHYG+kmnkJ+gnSZiRaOKEhXPOUeShSwAFPSZgtsxgjBVvqKWV5HeZeT27pl7Y4bSuSI8Ka2Tw==
X-Received: by 2002:a17:903:18c:b0:216:49b1:fadc with SMTP id d9443c01a7336-21dd7deeef3mr132651725ad.42.1738277931641;
        Thu, 30 Jan 2025 14:58:51 -0800 (PST)
Received: from ghost ([2001:428:6405:1e0:cd5c:b7b4:1f3d:62bb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7885sm18881625ad.54.2025.01.30.14.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 14:58:50 -0800 (PST)
Date: Thu, 30 Jan 2025 14:58:49 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v3] riscv: Fix the PAUSE Opcode for MIPS P8700.
Message-ID: <Z5wEKS9q8-nYPO7h@ghost>
References: <20250129131703.733098-1-arikalo@gmail.com>
 <20250129-museum-slider-3bb634d124de@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250129-museum-slider-3bb634d124de@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_145853_114253_2102681C 
X-CRM114-Status: GOOD (  28.72  )
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

T24gV2VkLCBKYW4gMjksIDIwMjUgYXQgMDQ6MTk6NThQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFdlZCwgSmFuIDI5LCAyMDI1IGF0IDAyOjE3OjAzUE0gKzAxMDAsIEFsZWtzYW5k
YXIgUmlrYWxvIHdyb3RlOgo+ID4gRnJvbTogRGpvcmRqZSBUb2Rvcm92aWMgPGRqb3JkamUudG9k
b3JvdmljQGh0ZWNncm91cC5jb20+Cj4gPiAKPiA+IFRoZSByaXNjdiBNSVBTIFA4NzAwIHVzZXMg
YSBkaWZmZXJlbnQgb3Bjb2RlIGZvciBQQVVTRS4KPiA+IEl0IGlzIGEg4oCYaGludOKAmSBlbmNv
ZGluZyBvZiB0aGUgU0xMSSBpbnN0cnVjdGlvbiwgd2l0aCByZD0wLCByczE9MCBhbmQKPiA+IGlt
bT01LiBJdCB3aWxsIGJlaGF2ZSBhcyBhIE5PUCBpbnN0cnVjdGlvbiBpZiBubyBhZGRpdGlvbmFs
IGJlaGF2aW9yCj4gPiBiZXlvbmQgdGhhdCBvZiBTTExJIGlzIGltcGxlbWVudGVkLgo+IAo+IFlv
dSBzYXkgcDg3MDAsIGJ1dCB0aGUgZXJyYXR1bSB3aWxsIGJlIGFwcGxpZWQgb24gYWxsIHN5c3Rl
bXMgdGhhdCBhcmUKPiBpZGVudGlmaWVkIGFzIHVzaW5nIGEgbWlwcyBjcHUuIFdoeSdzIHRoYXQ/
Cj4gCj4gPiArdm9pZCBtaXBzX2VycmF0YV9wYXRjaF9mdW5jKHN0cnVjdCBhbHRfZW50cnkgKmJl
Z2luLAo+ID4gKwkJCQkJICAgICBzdHJ1Y3QgYWx0X2VudHJ5ICplbmQsCj4gPiArCQkJCQkgICAg
IHVuc2lnbmVkIGxvbmcgYXJjaGlkLAo+ID4gKwkJCQkJICAgICB1bnNpZ25lZCBsb25nIGltcGlk
LAo+ID4gKwkJCQkJICAgICB1bnNpZ25lZCBpbnQgc3RhZ2UpCj4gPiArewo+ID4gKwlzdHJ1Y3Qg
YWx0X2VudHJ5ICphbHQ7Cj4gPiArCj4gPiArCUJVSUxEX0JVR19PTihFUlJBVEFfTUlQU19OVU1C
RVIgPj0gUklTQ1ZfVkVORE9SX0VYVF9BTFRFUk5BVElWRVNfQkFTRSk7Cj4gPiArCj4gPiArCWlm
IChzdGFnZSA9PSBSSVNDVl9BTFRFUk5BVElWRVNfRUFSTFlfQk9PVCkKPiA+ICsJCXJldHVybjsK
PiA+ICsKPiA+ICsJZm9yIChhbHQgPSBiZWdpbjsgYWx0IDwgZW5kOyBhbHQrKykgewo+ID4gKwkJ
aWYgKGFsdC0+dmVuZG9yX2lkICE9IE1JUFNfVkVORE9SX0lEKQo+ID4gKwkJCWNvbnRpbnVlOwo+
ID4gKwo+ID4gKwkJaWYgKGFsdC0+cGF0Y2hfaWQgPj0gRVJSQVRBX01JUFNfTlVNQkVSKSB7Cj4g
PiArCQkJV0FSTigxLCAiTUlQUyBlcnJhdGEgaWQ6JWQgbm90IGluIGtlcm5lbCBlcnJhdGEgbGlz
dFxuIiwKPiA+ICsJCQkgICAgIGFsdC0+cGF0Y2hfaWQpOwo+ID4gKwkJCWNvbnRpbnVlOwo+ID4g
KwkJfQo+ID4gKwo+ID4gKwkJbXV0ZXhfbG9jaygmdGV4dF9tdXRleCk7Cj4gPiArCQlwYXRjaF90
ZXh0X25vc3luYyhBTFRfT0xEX1BUUihhbHQpLCBBTFRfQUxUX1BUUihhbHQpLCBhbHQtPmFsdF9s
ZW4pOwo+ID4gKwkJbXV0ZXhfdW5sb2NrKCZ0ZXh0X211dGV4KTsKPiA+ICsJfQo+ID4gK30KPiAK
PiA+IGRpZmYgLS1naXQgYS90b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vz
c29yLmggYi90b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKPiA+
IGluZGV4IDY2MmFjYTAzOTg0OC4uODgwZjI2YTI0ZjY5IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oCj4gPiArKysgYi90b29scy9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKPiA+IEBAIC0xNCw3ICsxNCwx
MCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgY3B1X3JlbGF4KHZvaWQpCj4gPiAgCV9fYXNtX18gX192
b2xhdGlsZV9fICgiZGl2ICUwLCAlMCwgemVybyIgOiAiPXIiIChkdW1teSkpOwo+ID4gICNlbmRp
Zgo+ID4gIAo+ID4gLSNpZmRlZiBDT05GSUdfVE9PTENIQUlOX0hBU19aSUhJTlRQQVVTRQo+ID4g
KyNpZmRlZiBDT05GSUdfRVJSQVRBX01JUFNfUDg3MDBfUEFVU0VfT1BDT0RFCj4gPiArICAgIC8q
IE1JUFMgUDg3MDAgcGF1c2Ugb3Bjb2RlICovCj4gPiArICAgIF9fYXNtX18gX192b2xhdGlsZV9f
ICgiLjRieXRlIDB4MDA1MDEwMTMiKTsKPiA+ICsjZWxpZiBDT05GSUdfVE9PTENIQUlOX0hBU19a
SUhJTlRQQVVTRQo+ID4gIAkvKgo+ID4gIAkgKiBSZWR1Y2UgaW5zdHJ1Y3Rpb24gcmV0aXJlbWVu
dC4KPiA+ICAJICogVGhpcyBhc3N1bWVzIHRoZSBQQyBjaGFuZ2VzLgo+IAo+IFdoYXQgYWJvdXQg
d2hlbiB0aGUgZXJyYXR1bSBpcyBlbmFibGVkIGFuZCB0aGUgdG9vbGNoYWluIHN1cHBvcnRzCj4g
WmloaW50cGF1c2U/CgpTbyB0aGUgb3RoZXIgd2F5IHRvIGRvIHRoaXMgaXMgaGF2aW5nIGFuIGh3
cHJvYmUgY2FsbCB0byBjaGVjayBpZiB0aGUKY3VycmVudGx5IHJ1bm5pbmcgcHJvY2Vzc29yIGlz
IGVmZmVjdGVkIGJ5IHRoaXMuIEhvd2V2ZXIgSSB3YXMgY29uY2VybmVkCmFib3V0IHRoZSBwZXJm
b3JtYW5jZSBwZW5hbHR5IG9mIGNhbGxpbmcgaHdwcm9iZSBoZXJlIGluIHRoZSBwcmV2aW91cwp2
ZXJzaW9uIHNvIEkgaGFkIHN1Z2dlc3RlZCB0byB1c2UgYSBmbGFnIGluc3RlYWQgc28gdGhlcmUg
aXMgbm90IHRoZQpwZW5hbHR5IG9uIG90aGVyIGFyY2hpdGVjdHVyZXMuIFRoaXMgZG9lcyBtYWtl
IGl0IGludmFsaWQgdG8gZW5hYmxlCnRoaXMgZXJyYXRhIGluIHRoZSBkZWZjb25maWcuIFRoaXMg
aXMgYSBwcmVjZWRlbnQgZm9yIGhvdyB3ZSB3YW50IHRvCmhhbmRsZSBlcnJhdGEgaW4gdG9vbHMu
Cgo+IFdoeSBkb24ndCB5b3UgdXNlIHRoZSBzYW1lIGltcGxlbWVudGF0aW9uIGFzIHRoZSAhdG9v
bHMKPiBjb3B5IG9mIHRoZSBoZWFkZXI/IChJJ20gbm90IHN1cmUgd2h5IHRoZXkncmUgZGlmZmVy
ZW50IGluIHRoZSBmaXJzdAo+IHBsYWNlKS4KCkl0IGlzIGRpZmZlcmVudCBiZWNhdXNlIHRoZSBo
ZWFkZXJzIGluIHRvb2xzIGFyZSB1c2Vyc3BhY2Ugc28gaXQgZG9lc24ndAptYWtlIHNlbnNlIHRv
IGhhdmUgYWx0ZXJuYXRpdmVzLgoKLSBDaGFybGllCgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
