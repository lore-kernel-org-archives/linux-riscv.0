Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233F5C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 13:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bw70NevBGjaUFzJ3GM9WblYLg+1+pjVg4FU+jQJePpA=; b=acfYmowgZF4mtQ
	Mwjl39zEFXdr0S1piMzCXwqBH8BFXukvsDLKeTDLRAq2eZITKAiSapDrcZqVomLjMosHWG0N1QXT0
	dHhs51Da0eWtdtg9p51nd/lspp2wy69uLuqtmQXYLE7nu44GoZ4bht3iNTbt5r/wSFid42iHQHEAA
	hqT/QxNNv2/9k3pUcXsYcsJs9mlvNu36buB01tTVjSnPmGG4jq/MaEiA0GchkP1W78AL5DCYemSF2
	2c5H57bNwtegrvWzsybVoLeW2U8+y7BzcFX5CkvehMuFIsAN6qzuuPqY9Tf+06GruSIKeiduXdFGZ
	cdMkrh1sbtYf1QjsAGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thU8v-000000001RN-3xPC;
	Mon, 10 Feb 2025 13:48:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thU6l-00000000106-3r9v;
	Mon, 10 Feb 2025 13:45:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38dd93ace00so820979f8f.1;
        Mon, 10 Feb 2025 05:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739195154; x=1739799954; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B0QSMz5PoYwxWIMQ1TQSMM0I1UZCTAzfF9T8ctLhX2A=;
        b=QacjOUrIrxU70rIyz1DIzMTd1/d5nwNppVE5mQVdEEFq1ieG6pHaddsOWPTSBXcLj8
         KSB0AnDsjViY5P2xVjX3QAcRbetu14dQsxanzI46vsHpkSfXS48qX9Eo13I/ndRHXbwT
         6sX/XRUPx0SbAm/81IDEjsvwRSb+RG07mBxPxBHZaITCUl6+11r2zI0tBYBKYYRmcASq
         YHTq3AHA0pW1eveR4wDFltV7t7geJNQGRuu6Yyb9Tr3Dv9mCJa44Ww/2ljqIdIYxN03Z
         erHIYKdX5FXgIQfm8vM1a5t0qAQjY/gmNnl3SkWzv7UVsUHkyudCM9oCGta+WMBHo5D6
         gxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739195154; x=1739799954;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0QSMz5PoYwxWIMQ1TQSMM0I1UZCTAzfF9T8ctLhX2A=;
        b=K7FCH070ff35NfLELykj5VsVLEQCwjfKRwM+/PbaDc3HWTlnih/n4NneVxbcM0AG3k
         OFkT/ooBQqAdJ+5h+TWibB5RNtAyxwqL5aC96MaAsIkDimHBgv7hv2bX298BDCHNp+t6
         Pny8vMma8f3xOgVrHNkcuOmv5qdC1h+8rqu95JSbjkgCNrBTlJur0TT6DRPRD02/5hOW
         r8GfW2pSm1TlEU+QPIqxT0b5oER8r8OiIqhACY4tVoP/wKiNqY4yNfot4KKZ4aA47k0q
         mwvLRr4CKGkeCfJ47eIqkxgV6micGT0aQDxvQxh1O29l+YcKueDLdPHiKQzVO7HsOoWp
         lfTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0vv2jc9EQLmM737a723N8eN+uiME3IpKiBiqbBHPOwU1m/gObHilAgw1/zK3B87UGixRQ5nkpkFvJQ2NVj0Yo@lists.infradead.org, AJvYcCWBz9kwhGSebgPGQXUarnXbcWvVRCF3p5X1dk41rSUg15pTz3owpY6Wxj4ODa7JJf+nz6jzZVxKsJLa82U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz10er5fsEhWfHUkrxkGaHkObD6sdIJlKJn3ttHHlgxDiEujUaf
	cvz5rDKqMusjSk1WB+dvqLP+iN7uS0F/wzKpGmfNEAjdihaX8Pkc
X-Gm-Gg: ASbGncuU11VJ75VkczzRB5GDUHRWEAbD13VOaNphgMTwz1E+OlxjERQXKfa3pBYWUwR
	4LBNUbF+09vtFes74qg+McHvbuVEO+eact7gGs3kdLyCignpwqTROpaV3YvlCPyqUcvAtKBgyKM
	V1HLrY/QDCRNdKoa9hOP+rU9PR3Q02r4yL4p30BwRs7oxJLTq4Xz/DXT5P6PbtQDFUyIF0oajty
	uyrKMmsVTfiQpnYqk9NmiSV7+g0kq0ZKKh6Ogtt02CGsxIW4Ledq0NQsfMMliKaLpvSdYc2iAV8
	uDvTomwqgdLrE8B1hQ4pfl8Mejfx9rDw
X-Google-Smtp-Source: AGHT+IH9uHWSiEXMVmzjpVAxMhboYo6LDwjJ5Xy7khI/V14PrgJYtGxDMf03BQTGcuTX+S72JWXzFg==
X-Received: by 2002:a05:6000:156e:b0:38d:c2d4:2399 with SMTP id ffacd0b85a97d-38dc9347ff2mr11108966f8f.41.1739195153957;
        Mon, 10 Feb 2025 05:45:53 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcd21fe18sm9233159f8f.91.2025.02.10.05.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 05:45:53 -0800 (PST)
Message-ID: <7fa3501bd59697e65ab1387e25cb815180c3378c.camel@gmail.com>
Subject: Re: [PATCH 02/10] riscv: dts: sophgo: cv18xx: Split into CPU core
 and peripheral parts
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley	
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>
Date: Mon, 10 Feb 2025 14:45:51 +0100
In-Reply-To: <dda5297c-fdf3-494f-854f-71a5000729e5@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-3-alexander.sverdlin@gmail.com>
	 <dda5297c-fdf3-494f-854f-71a5000729e5@kernel.org>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_054557_822042_D3A0747F 
X-CRM114-Status: GOOD (  16.36  )
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

VGhhbmtzIGZvciBxdWljayByZXZpZXcgS3J6eXN6dG9mIQoKT24gTW9uLCAyMDI1LTAyLTEwIGF0
IDA5OjQzICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDA5LzAyLzIwMjUg
MjM6MDYsIEFsZXhhbmRlciBTdmVyZGxpbiB3cm90ZToKPiA+IE1ha2UgdGhlIHBlcmlwaGVyYWwg
ZGV2aWNlIHRyZWUgcmUtdXNhYmxlIG9uIEFSTTY0IHBsYXRmb3JtIGJ5IHNwbGl0dGluZyBpdAo+
ID4gaW50byBDUFUtY29yZSBzcGVjaWZpYyBhbmQgcGVyaXBoZXJhbCBwYXJ0cy4KPiA+IAo+ID4g
QWRkIFNPQ19QRVJJUEhFUkFMX0lSUSgpIG1hY3JvIHdoaWNoIGV4cGxpY2l0bHkgbWFwcyBwZXJp
cGhlcmFsIG51YmVyaW5nCj4gPiBpbnRvICJwbGljIiBpbnRlcnJ1cHQtY29udHJvbGxlciBudW1i
ZXJpbmcuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFu
ZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gwqAgYXJjaC9yaXNjdi9ib290L2R0
cy9zb3BoZ28vY3YxODF4LmR0c2nCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4gPiDCoCBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHgtcGVyaXBoLmR0c2kgfCAzMTMgKysrKysrKysr
KysrKysrKysrCj4gPiDCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHguZHRzacKg
wqDCoMKgwqDCoMKgIHwgMzA1ICstLS0tLS0tLS0tLS0tLS0tCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5eXl5eXl5eXl5eClsxXQoKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBi
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTh4eC1wZXJpcGguZHRzaQo+ID4gQEAgLTAs
MCArMSwzMTMgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1Ig
TUlUKQo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIzIEppc2hlbmcgWmhhbmcgPGpz
emhhbmdAa2VybmVsLm9yZz4KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgSW5vY2hpIEFtYW90
byA8aW5vY2hpYW1hQG91dGxvb2suY29tPgo+ID4gKyAqLwo+ID4gKwo+ID4gKyNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sY3YxODAwLmg+Cj4gPiArI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2dwaW8vZ3Bpby5oPgo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9pcnEuaD4KPiA+ICsKPiA+ICsvIHsKPiA+ICsJb3NjOiBvc2NpbGxhdG9yIHsKPiA+
ICsJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOwo+IAo+IEkgcmVhbGx5IGRvdWJ0IHRoYXQg
ZXh0ZXJuYWwgb3NjaWxsYXRvciBpcyBhIHBlcmlwaGVyYWwuIFRoaXMgaXMgZWl0aGVyCj4gcGFy
dCBvZiBib2FyZCBvciB0aGUgU29DLgoKVGhpcyBpcyBhY3R1YWxseSBhIHByb2JsZW0gb2YgdGhl
IG9yaWdpbmFsIGN2MTh4eC5kdHNpIFsxXS4gRG8geW91IHRoaW5rCkkgbmVlZCB0byBmaXggaXQg
YXMgcGFydCBvZiBteSBzZXJpZXM/IFRoaXMgd291bGQgdG91Y2ggYWxsIHRoZSBwdXJlClJpc2NW
IGJvYXJkcyAodXNpbmcgQ1YxOHh4IFNvQ3MsIG5vdCBTRzIwMHggU29DcyksIHdoaWNoIEkgY291
bGQgYXZvaWQKb3RoZXJ3aXNlLgoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
