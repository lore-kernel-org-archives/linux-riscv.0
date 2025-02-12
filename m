Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C9CC02198
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 00:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xnHkL2XHLP+bT0azQTdCeFYSZFhHbXnyKLH3tq7/y0=; b=ifUw5vW9fu7Y94
	zwXEwCkNKMYhIEX3GbNeZd9OiIlt6gmUd4RFyHb5eZUA0EXAQViVDQ7dra63r+sA+R91VhiXdfAcs
	isBMpDApysUgMmzhzVz6dbJOl/l4xM3cZOEUQo/Zsu/8BzcKObYMfy83y5yibXSLI3/iI4CCDU0rU
	Grdgl883RuY4/X8SNTAJSpyFiYJYEYmnf4934AofkJLbqXcZnaKyfErbZgcknevaN5Qv7vXgwtu6e
	6MWvS1rHHsvpxAD1J3ES7RucOaDBB33Rho1a2NC5Llm7gG0ViLR+bBgbzBsPGFOla6ODeUgSGpGhp
	Z2xO1yFkl1/4R74+XjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMow-00000009Fdr-2qmQ;
	Thu, 13 Feb 2025 00:11:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLmi-000000097k0-0QLX;
	Wed, 12 Feb 2025 23:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WnvvgxUa+KKbKiMSC06fC7YcvSohcjyPqj0goaa/usY=; b=ABZMAfQjii/wN6bjdC67QDPJJo
	RhNM6pLrQTMdBLWUXdG/oHKzcCwwRSLALgNE07WDoMWy59vFFRdcVGujI6lN65HUFbakg7Hf4SXZV
	r5enqsQUUPAP2Et/BnpLsX6qMkOaWGdUZ+8aBjNJjL4I1d1q90mQ1bM7gukNL6PdxLgkM/E3y03T/
	Dphufxj7ZafLWpJwNKT+zmKJ+EFlxGrOYIKnW09KW2m3pDQiDU0EpvZpLJ+c+J3Pm7tnUHiv2kyvb
	15vGJpTkRqluKeeRsIK05Vwcov4ijQbQknXFZ8HoDMqAjfhrpwBzWGuzPcjWXLd0aDe2DsdxhCg48
	7biUn7vw==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLme-00000000sHN-0OLt;
	Wed, 12 Feb 2025 23:04:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab7f2b3d563so56377666b.1;
        Wed, 12 Feb 2025 15:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739401481; x=1740006281; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WnvvgxUa+KKbKiMSC06fC7YcvSohcjyPqj0goaa/usY=;
        b=Ll3fM79w150YSFOt1KZOqotUjtvtPQMbQ0tWamUArXf56QQ0tS02sPeKKspKOHSqZR
         DL8I6U8fs8FnGSj74HKrIoV98tJiq2LpyucEZA3sU+UXCWP5wJXcUc84jqhADoYSxsOB
         OuH7sKR5cTzqJ+mHLLwZdlJUshUnpfYUsx+tHRP8uIX6ZNs3Oc3dDGg9CQX+7M475GNd
         XzShjn5hkrNhlIHrtbQTJ4kRLsXXNnqCmvykadBoEQn+vvdFY45FB5Lku43qrGoDP8qk
         bCTwb8p7O9CMHiqYBJNaEZicShPgrXNJT421ngYFR5JHpfNYgH0DYLYRFD2xRmcSggE1
         ni3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739401481; x=1740006281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WnvvgxUa+KKbKiMSC06fC7YcvSohcjyPqj0goaa/usY=;
        b=s7jX1VygcRXQ4KvoFlEECto4IlVfPH4NIukpkD37BZko0wTgTFzIKYPSHGZLqrebv8
         NDz/CPLVQOFfjrzS2dxhglG92DuefiahX0fiZZ0faLacgZD+dx4i5DCHw6ogTtClveCv
         sKztl4TVHADCRZRwJHAkawu2kClIg2q/vyvQcmEXxzqO9QTMwy5prsGavNJp9myRbmCw
         dHD41vnCtd/CMIYhOo0ozbsK5GVpYvpFX5a6ofl0dEOXVDaOdUEBNonZp7qhEhmfTqJO
         TQa/pJ4PEz9syRa7meHEbecQeIV4pdwc5Wum+ljCZKy0CHqp1vp8QTC85sbwG+qMJYgu
         56Gg==
X-Forwarded-Encrypted: i=1; AJvYcCW9ZvfE3nWo6H5cP/BWSNB8IpwoivDGEazwenL1n+tGgr5QTmsxc0jTe3PCQ/O92jRMS+W4eM2LZgtE3kr9Cj3L@lists.infradead.org, AJvYcCWwV+vyDsK1HhRqhkOF8d7nCQvuH5CF2A0xyKUQZggEOgaIP6Pk626SfyQQG97dyNIO0N13OVWoZkTGx44=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHJzcQExhSMiGIErJ71J2ClL4vcDLtNntjCI1q+8v6vF5OAh+Z
	iwWSyRUkS5qbQ1a6ZOk+sFvPliToMLzlyQroJMrHhEjIyqX5cAaf
X-Gm-Gg: ASbGncvcU7PadX2fAbHUU4bJ2TZFLAW+KDS46mx/FEIYB6pzt9LFRqvVNlNZWUTiQs0
	KbyPVGnjYin2wIsDZsToLnsEUwhzKNxJQQDN/aBW39u+xgdpPjOfDcJAWF4c7/jizStDAq9dTBt
	BRPRNkDfNEpYtU8/HszsUl0iY4B3MCNkyAXDm8RVZFl+XwTpvO80soeBgDSVQ3UoOuke7683dUt
	VBslvwlgJLoY0P5CN5wCin3WwO5S+mVYK/Zta5j0gBYUoa1m3GAd7NgiJkvcb241MVGFBUy7H5B
	WOQiS0/aEKj5GbbG5bPJg3H7JJvMFS0l
X-Google-Smtp-Source: AGHT+IE13NRMWydnWFjBAbDzcuJOpocvAbpPyYkr9ja8EJrYZQxfsWwpOeQrG6UZLNr7eU9mjShGdg==
X-Received: by 2002:a17:907:3f1c:b0:ab7:1816:e8a with SMTP id a640c23a62f3a-aba5018d61dmr111884266b.36.1739401480710;
        Wed, 12 Feb 2025 15:04:40 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53231f4dsm10687266b.23.2025.02.12.15.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:04:40 -0800 (PST)
Message-ID: <de4d99bf89f78a0a6e0a81dc6062af5e85d762aa.camel@gmail.com>
Subject: Re: [PATCH v3 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley	
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Chao Wei	
 <chao.wei@sophgo.com>
Date: Thu, 13 Feb 2025 00:04:39 +0100
In-Reply-To: <x4zncooa3lmyf2bikowjw7oabz66dhhbxl44cmujzzkwaslcl5@tj3l2u7e4akx>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
	 <20250212224347.1767819-2-alexander.sverdlin@gmail.com>
	 <x4zncooa3lmyf2bikowjw7oabz66dhhbxl44cmujzzkwaslcl5@tj3l2u7e4akx>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_230444_643093_21EE903A 
X-CRM114-Status: GOOD (  28.17  )
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

SGkgSW5vY2hpIQoKT24gVGh1LCAyMDI1LTAyLTEzIGF0IDA2OjU0ICswODAwLCBJbm9jaGkgQW1h
b3RvIHdyb3RlOgo+IE9uIFdlZCwgRmViIDEyLCAyMDI1IGF0IDExOjQzOjMzUE0gKzAxMDAsIEFs
ZXhhbmRlciBTdmVyZGxpbiB3cm90ZToKPiA+IE1ha2UgdGhlIHBlcmlwaGVyYWwgZGV2aWNlIHRy
ZWUgcmUtdXNhYmxlIG9uIEFSTTY0IHBsYXRmb3JtIGJ5IG1vdmluZyBDUFUKPiA+IGNvcmUgYW5k
IGludGVycnVwdCBjb250cm9sbGVycycgcGFydHMgaW50byBuZXcgY3YxOHh4LWNwdS5kdHNpIGFu
ZAo+ID4gY3YxOHh4LWludGMuZHRzaS4KPiA+IAo+ID4gQWRkIFNPQ19QRVJJUEhFUkFMX0lSUSgp
IG1hY3JvIHdoaWNoIGV4cGxpY2l0bHkgbWFwcyBwZXJpcGhlcmFsIG51YmVyaW5nCj4gPiBpbnRv
ICJwbGljIiBpbnRlcnJ1cHQtY29udHJvbGxlciBudW1iZXJpbmcuCj4gPiAKPiA+IE9uIFJpc2NW
IHNpZGUgdGhpcyBwYXRjaCBoYXMgYmVlbiBkdGMtY29tcGlsZS10ZXN0ZWQgb25seS4gSVJRIG51
bWJlcnMKPiA+IHN1YnN0aXR1dGlvbiB3aXRoIFNPQ19QRVJJUEhFUkFMX0lSUSgpIGhhcyBiZWVu
IHNjcmlwdGVkIGluIHZpbS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFN2ZXJk
bGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2Vsb2c6
Cj4gPiB2MzoKPiA+IC0gJmNwdXMgbm9kZSBoYXMgYmVlbiBtb3ZlZCBpbnRvIGN2MTh4eC1jcHUu
ZHRzaSwgJnBsaWMgYW5kICZjbGludCBub2Rlcwo+ID4gd2VyZSBtb3ZlZCBpbnRvIGN2MTh4eC1p
bnRjLmR0c2kgdG8gcmVkdWNlIGNvZGUgZHVwbGljYXRpb247Cj4gPiB2MjoKPiA+IC0gaW5zdGVh
ZCBvZiBjYXJ2aW5nIG91dCBwZXJpcGhlcmFscycgcGFydCwgY2FydmUgb3V0IEFSQ0gtc3BlY2lm
aWNzIChDUFUKPiA+IGNvcmUsIGludGVycnVwdCBjb250cm9sbGVycykgYW5kIHNwcmVhZCB0aGVt
IGFtb25nIDMgU29DIC5kdHNpIGZpbGVzIHdoaWNoCj4gPiBpbmNsdWRlZCBjdjE4eHguZHRzaTsK
PiA+IC0gZGVmaW5lIGEgbGFiZWwgZm9yIHRoZSAic29jIiBub2RlIGFuZCB1c2UgaXQgaW4gdGhl
IG5ld2x5IGludHJvZHVjZWQgRFRzOwo+ID4gCj4gPiDCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9jdjE4MDBiLmR0c2nCoMKgwqDCoCB8IDI4ICsrKystLS0KPiA+IMKgIGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvc29waGdvL2N2MTgxMmguZHRzacKgwqDCoMKgIHwgMjggKysrKy0tLQo+ID4gwqAg
YXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODF4LmR0c2nCoMKgwqDCoMKgIHzCoCAyICst
Cj4gPiDCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHgtY3B1LmR0c2nCoCB8IDM2
ICsrKysrKysrCj4gPiDCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHgtaW50Yy5k
dHNpIHwgMjMgKysrKysrCj4gPiDCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHgu
ZHRzacKgwqDCoMKgwqAgfCA5MSArKysrKystLS0tLS0tLS0tLS0tLS0KPiA+IMKgIGFyY2gvcmlz
Y3YvYm9vdC9kdHMvc29waGdvL3NnMjAwMi5kdHNpwqDCoMKgwqDCoCB8IDM0ICsrKystLS0tCj4g
PiDCoCA3IGZpbGVzIGNoYW5nZWQsIDEzNyBpbnNlcnRpb25zKCspLCAxMDUgZGVsZXRpb25zKC0p
Cj4gPiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3Yx
OHh4LWNwdS5kdHNpCj4gPiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0
cy9zb3BoZ28vY3YxOHh4LWludGMuZHRzaQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3Bo
Z28vY3YxODAwYi5kdHNpCj4gPiBpbmRleCBhYTFmNWRmMTAwZjAuLjlmYjdkZDJkYWIxOCAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaQo+ID4g
KysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNpCj4gPiBAQCAtMyw4
ICszLDEyIEBACj4gPiDCoMKgICogQ29weXJpZ2h0IChDKSAyMDIzIEppc2hlbmcgWmhhbmcgPGpz
emhhbmdAa2VybmVsLm9yZz4KPiA+IMKgwqAgKi8KPiA+IMKgIAo+ID4gKyNkZWZpbmUgU09DX1BF
UklQSEVSQUxfSVJRKG5yKQkoKG5yKSArIDE2KQo+ID4gKwo+ID4gwqAgI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL3BpbmN0cmwvcGluY3RybC1jdjE4MDBiLmg+Cj4gPiArI2luY2x1ZGUgImN2MTh4eC1j
cHUuZHRzaSIKPiA+IMKgICNpbmNsdWRlICJjdjE4eHguZHRzaSIKPiA+ICsjaW5jbHVkZSAiY3Yx
OHh4LWludGMuZHRzaSIKPiA+IMKgIAo+ID4gwqAgLyB7Cj4gPiDCoMKgCWNvbXBhdGlibGUgPSAi
c29waGdvLGN2MTgwMGIiOwo+ID4gQEAgLTEzLDE3ICsxNywyMyBAQCBtZW1vcnlAODAwMDAwMDAg
ewo+ID4gwqDCoAkJZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPiA+IMKgwqAJCXJlZyA9IDwweDgw
MDAwMDAwIDB4NDAwMDAwMD47Cj4gPiDCoMKgCX07Cj4gPiArfTsKPiA+ICsKPiAKPiA+ICsmc29j
IHsKPiA+ICsJZG1hLW5vbmNvaGVyZW50Owo+ID4gwqAgCj4gPiAtCXNvYyB7Cj4gPiAtCQlwaW5j
dHJsOiBwaW5jdHJsQDMwMDEwMDAgewo+ID4gLQkJCWNvbXBhdGlibGUgPSAic29waGdvLGN2MTgw
MGItcGluY3RybCI7Cj4gPiAtCQkJcmVnID0gPDB4MDMwMDEwMDAgMHgxMDAwPiwKPiA+IC0JCQnC
oMKgwqDCoMKgIDwweDA1MDI3MDAwIDB4MTAwMD47Cj4gPiAtCQkJcmVnLW5hbWVzID0gInN5cyIs
ICJydGMiOwo+ID4gLQkJfTsKPiA+ICsJcGluY3RybDogcGluY3RybEAzMDAxMDAwIHsKPiA+ICsJ
CWNvbXBhdGlibGUgPSAic29waGdvLGN2MTgwMGItcGluY3RybCI7Cj4gPiArCQlyZWcgPSA8MHgw
MzAwMTAwMCAweDEwMDA+LAo+ID4gKwkJwqDCoMKgwqDCoCA8MHgwNTAyNzAwMCAweDEwMDA+Owo+
ID4gKwkJcmVnLW5hbWVzID0gInN5cyIsICJydGMiOwo+ID4gwqDCoAl9Owo+ID4gwqAgfTsKPiA+
IMKgIAo+IAo+IFRoZSBvcmlnaWFubCAvc29jIHBhdGggY2FuIGJlIHVzZWQgdG8gb3ZlcnJpZGUg
dGhpbmdzLCAKPiB3aHkgY2hhbmdlIGl0IHRvIHRoZSByZWZlcmVuY2UgYXJjaG9yPyBJIHNlZSBu
byBjaGFuZ2UKPiBmb3IgaXQuCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9zb2MvZDNiYTBlYTUt
MDQ5MS00MmQ1LWExOGUtNjRjZjIxZGY2OTZjQGtlcm5lbC5vcmcvClRoZSBjb3JyZXNwb25kaW5n
IGxhYmVsIGlzIGJlaW5nIGludHJvZHVjZWQgaW4gY3YxOHh4LmR0c2kuCgo+ID4gKyZjbGsgewo+
ID4gKwljb21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDAtY2xrIjsKPiA+ICt9Owo+ID4gKwo+ID4g
wqAgJnBsaWMgewo+ID4gwqDCoAljb21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDBiLXBsaWMiLCAi
dGhlYWQsYzkwMC1wbGljIjsKPiA+IMKgIH07Cj4gPiBAQCAtMzEsNyArNDEsMyBAQCAmcGxpYyB7
Cj4gPiDCoCAmY2xpbnQgewo+ID4gwqDCoAljb21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDBiLWNs
aW50IiwgInRoZWFkLGM5MDAtY2xpbnQiOwo+ID4gwqAgfTsKPiA+IC0KPiA+IC0mY2xrIHsKPiA+
IC0JY29tcGF0aWJsZSA9ICJzb3BoZ28sY3YxODAwLWNsayI7Cj4gPiAtfTsKPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MTJoLmR0c2kgYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NvcGhnby9jdjE4MTJoLmR0c2kKPiA+IGluZGV4IDhhMWI5NWM1MTE2Yi4uZjIz
YzRkZDY2ODdkIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3Yx
ODEyaC5kdHNpCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MTJoLmR0
c2kKPiA+IEBAIC0zLDEwICszLDE0IEBACj4gPiDCoMKgICogQ29weXJpZ2h0IChDKSAyMDIzIElu
b2NoaSBBbWFvdG8gPGlub2NoaWFtYUBvdXRsb29rLmNvbT4KPiA+IMKgwqAgKi8KPiA+IMKgIAo+
ID4gKyNkZWZpbmUgU09DX1BFUklQSEVSQUxfSVJRKG5yKQkoKG5yKSArIDE2KQo+ID4gKwo+ID4g
wqAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+ID4g
wqAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1jdjE4MTJoLmg+Cj4gPiAr
I2luY2x1ZGUgImN2MTh4eC1jcHUuZHRzaSIKPiA+IMKgICNpbmNsdWRlICJjdjE4eHguZHRzaSIK
PiA+IMKgICNpbmNsdWRlICJjdjE4MXguZHRzaSIKPiA+ICsjaW5jbHVkZSAiY3YxOHh4LWludGMu
ZHRzaSIKPiA+IMKgIAo+ID4gwqAgLyB7Cj4gPiDCoMKgCWNvbXBhdGlibGUgPSAic29waGdvLGN2
MTgxMmgiOwo+ID4gQEAgLTE1LDE3ICsxOSwyMyBAQCBtZW1vcnlAODAwMDAwMDAgewo+ID4gwqDC
oAkJZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPiA+IMKgwqAJCXJlZyA9IDwweDgwMDAwMDAwIDB4
MTAwMDAwMDA+Owo+ID4gwqDCoAl9Owo+ID4gK307Cj4gPiArCj4gPiArJnNvYyB7Cj4gCj4gPiAr
CWRtYS1ub25jb2hlcmVudDsKPiAKPiBJIHRoaW5rIHRoaXMgY2FuIGJlIG1vdmVkIGludG8gY3Yx
OHh4LWNwdS5kdHNpIGZpbGUsIGFuZCBsZXQKPiBhbGwgU29DcyBzaGFyZSBpdC4KCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3NvYy9kM2JhMGVhNS0wNDkxLTQyZDUtYTE4ZS02NGNmMjFkZjY5NmNA
a2VybmVsLm9yZy8KCklmIFNPQ19QRVJJUEhFUkFMX0lSUSgpIGRvZXNuJ3QgYmVsb25nIHRvIC1j
cHUuZHRzaSwgdGhlbiAiZG1hLW5vbmNvaGVyZW50OyIKcHJvYmFibHkgbmVpdGhlci4uLgoKPiA+
IC0Jc29jIHsKPiA+IC0JCXBpbmN0cmw6IHBpbmN0cmxAMzAwMTAwMCB7Cj4gPiAtCQkJY29tcGF0
aWJsZSA9ICJzb3BoZ28sY3YxODEyaC1waW5jdHJsIjsKPiA+IC0JCQlyZWcgPSA8MHgwMzAwMTAw
MCAweDEwMDA+LAo+ID4gLQkJCcKgwqDCoMKgwqAgPDB4MDUwMjcwMDAgMHgxMDAwPjsKPiA+IC0J
CQlyZWctbmFtZXMgPSAic3lzIiwgInJ0YyI7Cj4gPiAtCQl9Owo+ID4gKwlwaW5jdHJsOiBwaW5j
dHJsQDMwMDEwMDAgewo+ID4gKwkJY29tcGF0aWJsZSA9ICJzb3BoZ28sY3YxODEyaC1waW5jdHJs
IjsKPiA+ICsJCXJlZyA9IDwweDAzMDAxMDAwIDB4MTAwMD4sCj4gPiArCQnCoMKgwqDCoMKgIDww
eDA1MDI3MDAwIDB4MTAwMD47Cj4gPiArCQlyZWctbmFtZXMgPSAic3lzIiwgInJ0YyI7Cj4gPiDC
oMKgCX07Cj4gPiDCoCB9Owo+ID4gwqAgCj4gPiArJmNsayB7Cj4gPiArCWNvbXBhdGlibGUgPSAi
c29waGdvLGN2MTgxMC1jbGsiOwo+ID4gK307Cj4gPiArCj4gPiDCoCAmcGxpYyB7Cj4gPiDCoMKg
CWNvbXBhdGlibGUgPSAic29waGdvLGN2MTgxMmgtcGxpYyIsICJ0aGVhZCxjOTAwLXBsaWMiOwo+
ID4gwqAgfTsKPiA+IEBAIC0zMyw3ICs0MywzIEBAICZwbGljIHsKPiA+IMKgICZjbGludCB7Cj4g
PiDCoMKgCWNvbXBhdGlibGUgPSAic29waGdvLGN2MTgxMmgtY2xpbnQiLCAidGhlYWQsYzkwMC1j
bGludCI7Cj4gPiDCoCB9Owo+ID4gLQo+ID4gLSZjbGsgewo+ID4gLQljb21wYXRpYmxlID0gInNv
cGhnbyxjdjE4MTAtY2xrIjsKPiA+IC19Owo+ID4gCj4gPiBbLi4uXQo+ID4gCj4gCj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxOHh4LWludGMuZHRzaSBiL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTh4eC1pbnRjLmR0c2kKPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjkwODE3OTkzYTMyNgo+ID4gLS0tIC9k
ZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxOHh4LWludGMu
ZHRzaQo+ID4gQEAgLTAsMCArMSwyMyBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMCBPUiBNSVQpCj4gPiArLyoKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgSmlz
aGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAy
MyBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAb3V0bG9vay5jb20+Cj4gPiArICovCj4gPiArCj4g
PiArJnNvYyB7Cj4gPiArCWludGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+Owo+ID4gKwo+ID4gKwlw
bGljOiBpbnRlcnJ1cHQtY29udHJvbGxlckA3MDAwMDAwMCB7Cj4gPiArCQlyZWcgPSA8MHg3MDAw
MDAwMCAweDQwMDAwMDA+Owo+ID4gKwkJaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmY3B1MF9pbnRj
IDExPiwgPCZjcHUwX2ludGMgOT47Cj4gPiArCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiA+ICsJ
CSNhZGRyZXNzLWNlbGxzID0gPDA+Owo+ID4gKwkJI2ludGVycnVwdC1jZWxscyA9IDwyPjsKPiA+
ICsJCXJpc2N2LG5kZXYgPSA8MTAxPjsKPiA+ICsJfTsKPiA+ICsKPiA+ICsJY2xpbnQ6IHRpbWVy
QDc0MDAwMDAwIHsKPiA+ICsJCXJlZyA9IDwweDc0MDAwMDAwIDB4MTAwMDA+Owo+ID4gKwkJaW50
ZXJydXB0cy1leHRlbmRlZCA9IDwmY3B1MF9pbnRjIDM+LCA8JmNwdTBfaW50YyA3PjsKPiA+ICsJ
fTsKPiA+ICt9Owo+IAo+IAo+IEkgdGhpbmsgdGhpcyBmaWxlIGNhbiBiZSBtZXJnZWQgaW4gdG8g
Y3YxOHh4LWNwdS5kdHNpLgo+IGNsaW50IGFuZCBwbGljIGlzIG1vcmUgbGlrZSBhIGNvcmUgc3Bl
Y2lmaWMgZGV2aWNlLgoKWWVzLCB0aGlzIGNhbiBiZSBkb25lIG5vdywgYXMgbG9uZyBhcyBTT0Nf
UEVSSVBIRVJBTF9JUlEoKSByZW1haW5zCm91dHNpZGUgb2YgdGhlIC1jcHUtaW50Yy5kdHNpLi4u
CgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
