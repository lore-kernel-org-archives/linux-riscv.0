Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BB7CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 22:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFHiRPbE0rnckKs1hGDLrYEb1q+PR/J6TbG6BfeVQAQ=; b=Mnu8bbDI4twjHV
	XibNRxEw0md+jpCBKsGMjMjGKVQrLvz7d7MLhYbMYP0RUGoP2AHHkml8X0czn79u3X4a3L0ShuRQA
	nV4vRiU5NE1sBJF2uVfoj9iGT42enP1J2ia2C1FLjB699WO9h2HK8OmI5qLKcW5/YWkGzG6CbSpbf
	nvfHDvn8SfatAo3eoBW/IZhXtp5R8pPgJ2uwrMAAIyiezZ4+drUHPiszSu+dtrbu9BXb9AEgGJyXM
	Lb8JpFVi2/i2m3bY38pSffeFfp3AlyGw/aEApUhZ2YWdGvN/qJQS6Oq+Nu3drRsIXTTMC63AHxuZ5
	01w11ot2yeCx7b/QzsCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugjK-00000009IO8-34LE;
	Wed, 10 Apr 2024 22:47:46 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugj5-00000009IFr-1wy4
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 22:47:44 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-229661f57cbso3742000fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 15:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712789250; x=1713394050; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jexQJX0oM9fCmEvziBSolme7TKZ0EEYhwHpwJAChgvs=;
        b=BseC60YZh/heyg+ZO69oe2aXT/eY+OVNFOfXi33XAxAgGPEN/PzkuWInrvpZXsqBst
         yFs896q+AVZ4uQfmPpz7Fb84JdNiUaYB8YHzuPV+XwHI4xPE5SoKYjynTOqMlghGv6mj
         0HMpUcn3UOm1r9Sja6vOUEk0cKkHA1Cuqmugiq1e9sLHjgFRuAqqDhXKN/jPIu9KKys4
         3SwLVmCBLMQbQcNUy5B7QtqbYbdN13wyhm+E9RghygcxiezVFDftzYnyrjc8t6zVqRTF
         SLPgBPGPAqJwyFHXnfxR/M7VM0qvCSeU6ngmyQuxOPaecFpXiPvWgEQ37yaw/uo6gPqf
         t/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712789250; x=1713394050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jexQJX0oM9fCmEvziBSolme7TKZ0EEYhwHpwJAChgvs=;
        b=rnFm1LSN9EGWFikjgmptpWoD2U8MH61cgDRWKoYiH+fjqt/bmTZUwQl1JEoi0vJJxk
         KJhi2PAOFXjtqWnknzx6uQtY81D1AaR95l8QbANSg5aKth07N18YTBsLcMBAxcPmr4ZO
         XYKacE0GORCF6Hs/gJmYJRLv0Z7c2DVos7LPe+fFdD4KUX9Zm882rAm9ejX53ktDWaOt
         Korhot3lYukZs2XtQjugrd+tTI+zdDESGE4k9s5piqRGJTOriPeZcvgc6/W4l/6GAEAh
         AlEMNX4G+DSzXql7UcxIDzHA5S7m49AEQMsBkZCSKao3J+oOj6z/WFr5fmlLF+cIJRlr
         3Hgw==
X-Forwarded-Encrypted: i=1; AJvYcCUTCQ/I99bmNbQ0TziCjE1riSwJ8sfzXNd61chZ4UXZIY+CAyKzDTLGwGDLICkC2sm1PHFTvqlOkZMNi4HlKW6o0fkvFXRPZp+p0S7X35ZI
X-Gm-Message-State: AOJu0YyCOihPuqCKzt8QM07os7KBlVco2m0r5/HISk0zQRZkpAC6ehrn
	OwJOQpz4r6kKQ9K5Wh5mF2Qa6mnIXorHYN8SewunzpTVWrMnFz4WcscWSf1+yRc=
X-Google-Smtp-Source: AGHT+IHLiKUoeBUB4OwLHReX4a7dcUh2Eqxld9pK8ip3FgSpidJgLmLzuSWt1Fnkq1wrPVQWu86Qjg==
X-Received: by 2002:a05:6871:80a:b0:22d:f859:2225 with SMTP id q10-20020a056871080a00b0022df8592225mr3914938oap.6.1712789249782;
        Wed, 10 Apr 2024 15:47:29 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.167])
        by smtp.gmail.com with ESMTPSA id lf3-20020a0568700c4300b0022eba51882fsm75970oab.53.2024.04.10.15.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 15:47:29 -0700 (PDT)
Message-ID: <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com>
Date: Wed, 10 Apr 2024 17:47:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com>
 <87wmp4oo3y.fsf@linaro.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <87wmp4oo3y.fsf@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_154731_710366_CAF30581 
X-CRM114-Status: GOOD (  12.81  )
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

SGkgVGhpYWdvLAoKT24gMjAyNC0wNC0xMCA1OjIxIFBNLCBUaGlhZ28gSnVuZyBCYXVlcm1hbm4g
d3JvdGU6Cj4gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyaXRl
czoKPiAKPj4gTm93IHRoYXQgYWxsIHByZXZpb3VzbHktc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMg
c2VsZWN0Cj4+IEFSQ0hfSEFTX0tFUk5FTF9GUFVfU1VQUE9SVCwgdGhpcyBjb2RlIGNhbiBkZXBl
bmQgb24gdGhhdCBzeW1ib2wgaW5zdGVhZAo+PiBvZiB0aGUgZXhpc3RpbmcgbGlzdCBvZiBhcmNo
aXRlY3R1cmVzLiBJdCBjYW4gYWxzbyB0YWtlIGFkdmFudGFnZSBvZiB0aGUKPj4gY29tbW9uIGtl
cm5lbC1tb2RlIEZQVSBBUEkgYW5kIG1ldGhvZCBvZiBhZGp1c3RpbmcgQ0ZMQUdTLgo+Pgo+PiBB
Y2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+PiBSZXZp
ZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4+IFNpZ25lZC1vZmYtYnk6
IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+IAo+IFVuZm9ydHVu
YXRlbHkgdGhpcyBwYXRjaCBjYXVzZXMgYnVpbGQgZmFpbHVyZXMgb24gYXJtIHdpdGggYWxseWVz
Y29uZmlnCj4gYW5kIGFsbG1vZGNvbmZpZy4gVGVzdGVkIHdpdGggbmV4dC0yMDI0MDQxMC4KPiAK
PiBFcnJvciB3aXRoIGFsbHllc2NvbmZpZzoKPiAKPiAkIG1ha2UgLWogOCBcCj4gICAgIE89JEhP
TUUvLmNhY2hlL2J1aWxkcy9saW51eC1jcm9zcy1hcm0gXAo+ICAgICBBUkNIPWFybSBcCj4gICAg
IENST1NTX0NPTVBJTEU9YXJtLWxpbnV4LWdudWVhYmloZi0KPiBtYWtlWzFdOiBFbnRlcmluZyBk
aXJlY3RvcnkgJy9ob21lL2JhdWVybWFubi8uY2FjaGUvYnVpbGRzL2xpbnV4LWNyb3NzLWFybScK
PiAgICAg4ouuCj4gYXJtLWxpbnV4LWdudWVhYmloZi1sZDogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RtbC9kY24yMC9kY24yMF9mcHUubzogaW4gZnVuY3Rpb24gYGRjbjIwX3BvcHVs
YXRlX2RtbF9waXBlc19mcm9tX2NvbnRleHQnOgo+IGRjbjIwX2ZwdS5jOigudGV4dCsweDIwZjQp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2FlYWJpX2wyZCcKPiBhcm0tbGludXgtZ251ZWFi
aWhmLWxkOiBkY24yMF9mcHUuYzooLnRleHQrMHgyMTBjKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byBgX19hZWFiaV9sMmQnCj4gYXJtLWxpbnV4LWdudWVhYmloZi1sZDogZGNuMjBfZnB1LmM6KC50
ZXh0KzB4MjEyNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYWVhYmlfbDJkJwo+IGFybS1s
aW51eC1nbnVlYWJpaGYtbGQ6IGRjbjIwX2ZwdS5jOigudGV4dCsweDIxM2MpOiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBfX2FlYWJpX2wyZCcKPiBhcm0tbGludXgtZ251ZWFiaWhmLWxkOiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2NhbGNzL2Rjbl9jYWxjcy5vOiBpbiBmdW5j
dGlvbiBgcGlwZV9jdHhfdG9fZTJlX3BpcGVfcGFyYW1zJzoKPiBkY25fY2FsY3MuYzooLnRleHQr
MHgzOTApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2FlYWJpX2wyZCcKPiBhcm0tbGludXgt
Z251ZWFiaWhmLWxkOiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2NhbGNzL2Rj
bl9jYWxjcy5vOmRjbl9jYWxjcy5jOigudGV4dCsweDNhNCk6IG1vcmUgdW5kZWZpbmVkIHJlZmVy
ZW5jZXMgdG8gYF9fYWVhYmlfbDJkJyBmb2xsb3cKPiBhcm0tbGludXgtZ251ZWFiaWhmLWxkOiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sMi9kbWwyX3dyYXBwZXIubzogaW4gZnVu
Y3Rpb24gYG9wdGltaXplX2NvbmZpZ3VyYXRpb24nOgo+IGRtbDJfd3JhcHBlci5jOigudGV4dCsw
eGNiYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYWVhYmlfZDJ1bHonCj4gYXJtLWxpbnV4
LWdudWVhYmloZi1sZDogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbDIvZG1sMl90
cmFuc2xhdGlvbl9oZWxwZXIubzogaW4gZnVuY3Rpb24gYHBvcHVsYXRlX2RtbF9wbGFuZV9jZmdf
ZnJvbV9wbGFuZV9zdGF0ZSc6Cj4gZG1sMl90cmFuc2xhdGlvbl9oZWxwZXIuYzooLnRleHQrMHg5
ZTQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2FlYWJpX2wyZCcKPiBhcm0tbGludXgtZ251
ZWFiaWhmLWxkOiBkbWwyX3RyYW5zbGF0aW9uX2hlbHBlci5jOigudGV4dCsweGEyMCk6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYF9fYWVhYmlfbDJkJwo+IGFybS1saW51eC1nbnVlYWJpaGYtbGQ6
IGRtbDJfdHJhbnNsYXRpb25faGVscGVyLmM6KC50ZXh0KzB4YTU4KTogdW5kZWZpbmVkIHJlZmVy
ZW5jZSB0byBgX19hZWFiaV9sMmQnCj4gYXJtLWxpbnV4LWdudWVhYmloZi1sZDogZG1sMl90cmFu
c2xhdGlvbl9oZWxwZXIuYzooLnRleHQrMHhhOTApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBf
X2FlYWJpX2wyZCcKPiBtYWtlWzNdOiAqKiogWy9ob21lL2JhdWVybWFubi9zcmMvbGludXgvc2Ny
aXB0cy9NYWtlZmlsZS52bWxpbnV4OjM3OiB2bWxpbnV4XSBFcnJvciAxCj4gbWFrZVsyXTogKioq
IFsvaG9tZS9iYXVlcm1hbm4vc3JjL2xpbnV4L01ha2VmaWxlOjExNjU6IHZtbGludXhdIEVycm9y
IDIKPiBtYWtlWzFdOiAqKiogWy9ob21lL2JhdWVybWFubi9zcmMvbGludXgvTWFrZWZpbGU6MjQw
OiBfX3N1Yi1tYWtlXSBFcnJvciAyCj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy9ob21l
L2JhdWVybWFubi8uY2FjaGUvYnVpbGRzL2xpbnV4LWNyb3NzLWFybScKPiBtYWtlOiAqKiogW01h
a2VmaWxlOjI0MDogX19zdWItbWFrZV0gRXJyb3IgMgo+IAo+IFRoZSBlcnJvciB3aXRoIGFsbG1v
ZGNvbmZpZyBpcyBzbGlnaHRseSBkaWZmZXJlbnQ6Cj4gCj4gJCBtYWtlIC1qIDggXAo+ICAgICBP
PSRIT01FLy5jYWNoZS9idWlsZHMvbGludXgtY3Jvc3MtYXJtIFwKPiAgICAgQVJDSD1hcm0gXAo+
ICAgICBDUk9TU19DT01QSUxFPWFybS1saW51eC1nbnVlYWJpaGYtCj4gbWFrZVsxXTogRW50ZXJp
bmcgZGlyZWN0b3J5ICcvaG9tZS9iYXVlcm1hbm4vLmNhY2hlL2J1aWxkcy9saW51eC1jcm9zcy1h
cm0nCj4gICAgIOKLrgo+IEVSUk9SOiBtb2Rwb3N0OiAiX19hZWFiaV9kMnVseiIgW2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5rb10gdW5kZWZpbmVkIQo+IEVSUk9SOiBtb2Rwb3N0
OiAiX19hZWFiaV9sMmQiIFtkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUua29dIHVu
ZGVmaW5lZCEKPiBtYWtlWzNdOiAqKiogWy9ob21lL2JhdWVybWFubi9zcmMvbGludXgvc2NyaXB0
cy9NYWtlZmlsZS5tb2Rwb3N0OjE0NTogTW9kdWxlLnN5bXZlcnNdIEVycm9yIDEKPiBtYWtlWzJd
OiAqKiogWy9ob21lL2JhdWVybWFubi9zcmMvbGludXgvTWFrZWZpbGU6MTg3NjogbW9kcG9zdF0g
RXJyb3IgMgo+IG1ha2VbMV06ICoqKiBbL2hvbWUvYmF1ZXJtYW5uL3NyYy9saW51eC9NYWtlZmls
ZToyNDA6IF9fc3ViLW1ha2VdIEVycm9yIDIKPiBtYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAn
L2hvbWUvYmF1ZXJtYW5uLy5jYWNoZS9idWlsZHMvbGludXgtY3Jvc3MtYXJtJwo+IG1ha2U6ICoq
KiBbTWFrZWZpbGU6MjQwOiBfX3N1Yi1tYWtlXSBFcnJvciAyCgpJbiBib3RoIGNhc2VzLCB0aGUg
aXNzdWUgaXMgdGhhdCB0aGUgdG9vbGNoYWluIHJlcXVpcmVzIHJ1bnRpbWUgc3VwcG9ydCB0bwpj
b252ZXJ0IGJldHdlZW4gYHVuc2lnbmVkIGxvbmcgbG9uZ2AgYW5kIGBkb3VibGVgLCBldmVuIHdo
ZW4gaGFyZHdhcmUgRlAgaXMKZW5hYmxlZC4gVGhlcmUgd2FzIHNvbWUgcGFzdCBkaXNjdXNzaW9u
IGFib3V0IEdDQyBpbmxpbmluZyBzb21lIG9mIHRoZXNlCmNvbnZlcnNpb25zWzFdLCBidXQgdGhh
dCBkaWQgbm90IGdldCBpbXBsZW1lbnRlZC4KClRoZSBzaG9ydC10ZXJtIGZpeCB3b3VsZCBiZSB0
byBkcm9wIHRoZSBgc2VsZWN0IEFSQ0hfSEFTX0tFUk5FTF9GUFVfU1VQUE9SVGAgZm9yCjMyLWJp
dCBhcm0gdW50aWwgd2UgY2FuIHByb3ZpZGUgdGhlc2UgcnVudGltZSBsaWJyYXJ5IGZ1bmN0aW9u
cy4KClJlZ2FyZHMsClNhbXVlbAoKWzFdOiBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3No
b3dfYnVnLmNnaT9pZD05MTk3MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
