Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D0AC02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 15:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaN1c0LKQURJ4bp5rzWE/Hv9Acan1+TTf9kC0s0wdVc=; b=nYYTZCN1Mri5lb
	BKvf76PUaU0hH6vdDXZiuY/9T80yizgQ6QB8YvolESmlD4jeUfry3hSwlWv09N1QPLbp3e7xBiEP3
	TttyfnIj9fhNVVPMCpaJxkwnSpawDuBl1OYNqsQy0Bst/gf5lviJgqEje/WZz34hEpRpCgE1mfvR/
	llFezhjeBjF2i0K1xb57L7Iv99Qfi3Oxgn2H11c8wXvTR/koSuxsH/QFm+fzGFuRVts03JoFOghc0
	XWlp1mMdN2Ub5isup219NWU+39+NZMsMZyy25HFkhw5NhSZE0cZcUxr4LOLSujin5tH9HsekRixih
	6lvk0p7G2OpguH2+y5vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVHi-00000000Dq8-2Kb7;
	Mon, 10 Feb 2025 15:01:18 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVHg-00000000Dou-1m08;
	Mon, 10 Feb 2025 15:01:17 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab744d5e567so871949966b.1;
        Mon, 10 Feb 2025 07:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739199675; x=1739804475; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3M5idA8N7HpwZKk/3+pcrUsB6D7VU4LeXOhWq3Jgugs=;
        b=i9vJGl8waq2LZGphmC691ge2ELjGXUioiklVTGhzfU74ZYoG+pZY8wEzsazFlL8Pn1
         LbVJALkhAQqtcl8iFBYmccse5ToGhDcwZoPawCZUC5NwUo10U6qmVQ4sCLC6GOQUKFTd
         0J8teU12o7yy9F3hTreK4dLuQHY6mcojvtC6dlXoyQGEnuL3MLnC96+tg8+zC+mnUg0p
         YJOFcLCK9aFkzTxxS91zN4aG/tRQbV3l7uy2le3lxhRWMgWg5mxVSPf++lCOFIizALOq
         oAxPXdmaQhSUkkYF95vu+dBZB9tdwa1QiS0/9WPrD5KV1PEmVvx3G3qcOx6aniTV5xgE
         F86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199675; x=1739804475;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3M5idA8N7HpwZKk/3+pcrUsB6D7VU4LeXOhWq3Jgugs=;
        b=O08yOy17ylNUXRATzn9VcoeaPB3pAyWPqg+vrZK0ailmzaiPaGR5if21gqrS4+TxhG
         8ns1uskxJwheCYH0E/M6kHP2AeiP1HbKpfit/OMYNiltDBeM+nUESFdWMV9w8fysy9vV
         UODwKCEylp4kKU+/AQ/lWj7y1byh4ICj4sRIXlGd0m87sTdogw4HX5iGGMl39dBl2Svr
         rkfCoqn2TCoPkiFVkOLhnooX9rj9wl2zshYBluqyR5UfUebs490CHMEP9Oa9gH55H8c5
         68C8Q5Z6j1WUq201nXS0973nPKFEzVV1VAyeqSDYRR4tUWQ0gaaWAMyZ1YOQSApS3G5N
         G1Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUggiEaMfNvaGzX+D4ck+RB9qmXzetIuNgZSLSWVTJ/71D2eKvHt1b8+QgyUs8dOfuHXgulmqqdFmns73M=@lists.infradead.org, AJvYcCVk+A6Htyz7WUzlwF+IqB+p0VKUf1Uz5vlC9jXKP3wfDow2URJXc4in9LHdsM07cQ85Tey+hgLJ6NT/7tJkmjqa@lists.infradead.org
X-Gm-Message-State: AOJu0YzqN8byFq3+IND4IwWgtF1xmv3XcibrsuqngHsxxwYCSm8EjG4R
	HhIcUcAltCzvinWngmR/Q07UHzjzSvIXSnX4t4LvZEm7GTyiUvva
X-Gm-Gg: ASbGncsDj9ZuvJ2+ErR6B47nBEPRym3PRHx5O8hs5w9IZSb9XuF+67l2KzCi0edxzXd
	iqAzN2YC9a+PBp190mD2gOSb9dXlEn5QVuE+4BrAZqFmMxxkbP22SiQJF4cOfxY+iPjXGY1yi03
	t70u0nlZXo8vCHSTPGaT+Q+NNJxJm7IDtPO9UFOE2Vm2CQ3yb+q7GT/vCX64L8E3MzXMaGBg0x0
	dpkeVSQliM/TgnqBEtRwax/VyLLu+IrkrNx5bA6kKFKQEuQSlMEkk2qSQT3/KRLRHMnboaBR/p4
	3D3BUHP73wmampwhx/jtHeHN16gVEs1b
X-Google-Smtp-Source: AGHT+IHDvJX3+ekZa4vY1LIl/WMEIul6AD+KtHvHZm/OrLAAq1fRlkjI0uEBHS/oueveFzGr668vsg==
X-Received: by 2002:a17:906:6a29:b0:ab6:d4ce:5674 with SMTP id a640c23a62f3a-ab76e9dc14amr1858509166b.26.1739199672976;
        Mon, 10 Feb 2025 07:01:12 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cd7ffaa8sm122042766b.132.2025.02.10.07.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:12 -0800 (PST)
Message-ID: <03ff407fe68e46df4844e5dd244e7c609331af71.camel@gmail.com>
Subject: Re: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann	 <arnd@arndb.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Date: Mon, 10 Feb 2025 16:01:10 +0100
In-Reply-To: <0d5484d1-be83-4f38-befd-94d458b3aaa8@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
	 <0d5484d1-be83-4f38-befd-94d458b3aaa8@kernel.org>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_070116_467439_557A91ED 
X-CRM114-Status: GOOD (  19.79  )
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

SGkgS3J6eXN6dG9mIQoKT24gTW9uLCAyMDI1LTAyLTEwIGF0IDA5OjQ1ICswMTAwLCBLcnp5c3p0
b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDA5LzAyLzIwMjUgMjM6MDYsIEFsZXhhbmRlciBTdmVy
ZGxpbiB3cm90ZToKPiA+IEFkZCBpbml0aWFsIGRldmljZSB0cmVlIGZvciB0aGUgU0cyMDAwIFNv
QyBieSBTT1BIR08gKGZyb20gQVJNNjQgUG9WKS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQWxl
eGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgo+ID4gLS0tCj4g
PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDAuZHRzaSB8IDc5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygr
KQo+ID4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvc29waGdvL3Nn
MjAwMC5kdHNpCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3NvcGhn
by9zZzIwMDAuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc29waGdvL3NnMjAwMC5kdHNpCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi40ZTUyMDQ4NmNi
ZTUKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc29waGdv
L3NnMjAwMC5kdHNpCj4gPiBAQCAtMCwwICsxLDc5IEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkKPiA+ICsKPiA+ICsjZGVmaW5lIFNPQ19QRVJJUEhF
UkFMX0lSUShucikJCUdJQ19TUEkgKG5yKQo+ID4gKwo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+Cj4gPiArI2luY2x1ZGUgPHJpc2N2L3Nv
cGhnby9jdjE4eHgtcGVyaXBoLmR0c2k+Cj4gPiArI2luY2x1ZGUgPHJpc2N2L3NvcGhnby9jdjE4
MXguZHRzaT4KPiA+ICsKPiA+ICsvIHsKClsuLi5dCgo+ID4gKwlnaWM6IGludGVycnVwdC1jb250
cm9sbGVyQDFmMDEwMDAgewo+IAo+IE1NSU8gbm9kZXMgYXJlIGFsd2F5cyBpbiB0aGUgc29jLgoK
SSB0aGluayBJJ3ZlIGxvb2tlZCBhIHdyb25nIGV4YW1wbGUgKG9yIGEgY291bnRlci1leGFtcGxl
KS4uLgokIGdyZXAgLVIgLVAgJ15cdFx0Y29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWExNS1naWMi
OycgKgphcm0vYm9vdC9kdHMvaW50ZWwvYXhtL2F4bTU1eHguZHRzaToJCWNvbXBhdGlibGUgPSAi
YXJtLGNvcnRleC1hMTUtZ2ljIjsKYXJtL2Jvb3QvZHRzL3RpL29tYXAvZHJhNy5kdHNpOgkJY29t
cGF0aWJsZSA9ICJhcm0sY29ydGV4LWExNS1naWMiOwphcm0vYm9vdC9kdHMvdGkvb21hcC9vbWFw
NS5kdHNpOgkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWExNS1naWMiOwphcm0vYm9vdC9kdHMv
bnZpZGlhL3RlZ3JhMTI0LmR0c2k6CQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTE1LWdpYyI7
CmFybS9ib290L2R0cy9udmlkaWEvdGVncmExMTQuZHRzaToJCWNvbXBhdGlibGUgPSAiYXJtLGNv
cnRleC1hMTUtZ2ljIjsKYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMTMyLmR0c2k6CQljb21w
YXRpYmxlID0gImFybSxjb3J0ZXgtYTE1LWdpYyI7CmFybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9z
MzJ2MjM0LmR0c2k6CQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTE1LWdpYyI7CmFybTY0L2Jv
b3QvZHRzL2FwbS9hcG0tc3Rvcm0uZHRzaToJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hMTUt
Z2ljIjsKYXJtNjQvYm9vdC9kdHMvYXBtL2FwbS1zaGFkb3djYXQuZHRzaToJCWNvbXBhdGlibGUg
PSAiYXJtLGNvcnRleC1hMTUtZ2ljIjsKCkJ1dCB0aGFua3MgZm9yIGNsYXJpZmljYXRpb24hCgo+
ID4gKwkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWExNS1naWMiOwo+ID4gKwkJaW50ZXJydXB0
LWNvbnRyb2xsZXI7Cj4gPiArCQkjaW50ZXJydXB0LWNlbGxzID0gPDM+Owo+ID4gKwkJcmVnID0g
PDB4MDFmMDEwMDAgMHgxMDAwPiwKPiA+ICsJCcKgwqDCoMKgwqAgPDB4MDFmMDIwMDAgMHgyMDAw
PjsKPiA+ICsJfTsKPiA+ICsKPiA+ICsJc29jIHsKPiAKPiBPdmVycmlkZSBieSBwaGFuZGxlL2xh
YmVsIGluc3RlYWQgb2YgZHVwbGljYXRpbmcuCj4gCj4gPiArCQlyYW5nZXM7Cj4gPiArCj4gPiAr
CQlwaW5jdHJsOiBwaW5jdHJsQDMwMDEwMDAgewo+ID4gKwkJCWNvbXBhdGlibGUgPSAic29waGdv
LHNnMjAwMC1waW5jdHJsIjsKPiA+ICsJCQlyZWcgPSA8MHgwMzAwMTAwMCAweDEwMDA+LAo+ID4g
KwkJCcKgwqDCoMKgwqAgPDB4MDUwMjcwMDAgMHgxMDAwPjsKPiA+ICsJCQlyZWctbmFtZXMgPSAi
c3lzIiwgInJ0YyI7Cj4gPiArCQl9Owo+ID4gKwl9Owo+ID4gK307Cj4gPiArCj4gPiArCj4gPiAr
JmNsayB7Cj4gPiArCWNvbXBhdGlibGUgPSAic29waGdvLHNnMjAwMC1jbGsiOwo+IAo+IAo+IFRo
YXQncyBkaXNjb3VyYWdlZCBwcmFjdGljZS4gSWYgeW91IG5lZWQgdG8gZGVmaW5lIGNvbXBhdGli
bGUsIGl0IG1lYW5zCj4gdGhlIGJsb2NrIGlzIG5vdCBzaGFyZWQgYmV0d2VlbiBkZXNpZ25zIGFu
ZCBtdXN0IG5vdCBiZSBpbiBjb21tb24gRFRTSS4KClRoYXQgZG9lc24ndCBjb21lIGZyb20gbXkg
c2VyaWVzLCB0aGF0J3MgaG93IG9yaWdpbmFsIGN2MTh4eC5kdHNpIGhhcyBiZWVuCmRlc2lnbmVk
LiBTYW1lIHF1ZXN0aW9uIGFzIGJlZm9yZTogZG8gSSBuZWVkIHRvIHJld29yayBpdCBpZiBJIHdp
bGwgbm90IGJlIGFibGUgdG8KdGVzdCB0aGUgY2hhbmdlcyAoSSBkb24ndCBldmVuIHBvc2VzcyB0
aGUgcmVsZXZhbnQgSFcpLiBCdXQgaWYgbm90LCBJIGhhdmUKdG8gYWRhcHQgdGhlIHNhbWUgcGF0
dGVybiBpbnRvIHRoZSBuZXcgc2cyMDAwLmR0c2kuCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
