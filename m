Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBEDC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 15:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlVOGy4ii8cw0CT80BBRVLBtjXP9te6hz2j7KGecT9g=; b=NpxnMS5wpOT0h3
	UpgWs0CWcw0tSH/j75BdRiWI5kqEHILjfxyT59I6XRU91l6uGVMPZIY6m/5nTy/hy6+4PoHulEwFU
	KrqiZEzBjiloGhXF7i+m+3VNYLz5N0uHW8TOJE4NS3iU2K0Nq4QIqm32kTv9fc8187wg/fk80wL98
	rw7CB6PaovH2D1oYlOnELm+O75PCtNlQeBb40w3WiDmq55NpWyJ/GdKEnqu9gm2vpNTp3ql+XxEYg
	KGjtGbLUX1AWpn6u94WVWXJyuWuHwQjnEGRLiNfneQXVM3wOxkgzyLoA7e79i8J11Lh0iGvC8EWOG
	aeAbRiXJ7/w+fIMKoElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqMJ-0000000HEmc-3P3K;
	Tue, 30 Jan 2024 15:49:11 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUqMH-0000000HEly-0joy
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 15:49:10 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5111e3b03dfso592287e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 07:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706629747; x=1707234547; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+iAX+0XDAGKyg/OxoIHj98F7+KIoOryAf80+ApbDSI=;
        b=iLUtUuogcgb7sjhpmi0uvajQ8XmHsOXejQCmOUHFXdoRxtzDIxXmeJYZStv8VRLTrZ
         NvKojIo/Ewg6azNkL3s5cKVsGNtmvxglHjKFO6t9QPJ2X2KNchzSFcAnTX8tp+7woVux
         AUiatQmpNC5b6J+xL15vRIWrt2iBGxNyrbmGFnN9LdXa8jDEsfzlCBSzWd1CVuFbHbhc
         y88RjHFUkNNwjiWhiz8FAhzzhfu8asiORIm8Gujg1xFl8RrY/QaaAMUthKByyX12VtM0
         4DXeKw3BxX7BqWZtV+uh3h6PmGghzVR0IA5gyWkQp+8v3FEo2MgpA6A+TzUdzwIGcqqk
         H0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706629747; x=1707234547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+iAX+0XDAGKyg/OxoIHj98F7+KIoOryAf80+ApbDSI=;
        b=TCXvTgPzl8xhNlVzUP1AROFi5al0OCS5pNau4pITnh7pS5l04qI5CqtsU+cpR4KZdg
         LY+Mk3HInoUuoFMv0GJyN8xuHJRGBMSrSxVSH5hGSFqPHzyWZGEbADHSo1JAOeT1cElJ
         kEd6NzcrYF4V474J+xdO2fh4JYkV/1oWKQFV4d08u0xrjZvEzKdQOQkFVYXYtiLqiqiv
         PWcSpOoSZ07UunoNCvqqX6inR1+ll2bZwoBEWamQBRVBAJVNV3yx+HkmNzenl+vp3nXi
         7suhWu9FTRKWNaOW+E6WVp+B5dhuCz2KqSSixIoEPBHuQeKspBAfQJL80n4cBZZ/XEOT
         fW/A==
X-Gm-Message-State: AOJu0YxhALYqnAEVt3gZ46tVQCprkJ+4DDIgk6cTnJy/Vb9VXdVI+Dg2
	cxSg3bbLuFyOwoeMVmNphHYv394CiZzqUBgpK0i4Ma/+E/H3YiBjPKYd4bueeELA6WUhcRDBBgP
	hv9ThuZA3EQA4wmKf/ESUnmkqVZruaT0CE30aPA==
X-Google-Smtp-Source: AGHT+IE8Aaq5BozdnokEQjokD/RT3HrTukjrHMTtCG2uwBHyTSoKgNcaMZilJknQTuf0dWoeasaBCIJhUzTmByVLbKo=
X-Received: by 2002:a19:e049:0:b0:510:e09:4518 with SMTP id
 g9-20020a19e049000000b005100e094518mr789410lfj.3.1706629747416; Tue, 30 Jan
 2024 07:49:07 -0800 (PST)
MIME-Version: 1.0
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <87r0hzuw87.fsf@all.your.base.are.belong.to.us> <87le87uulb.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2UYCKUBKggtM606orH2mBu_AbTdB5-R5AP1M0t-LsEbEQ@mail.gmail.com>
 <87cytjvybb.fsf@all.your.base.are.belong.to.us> <87ttmuq3m7.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87ttmuq3m7.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 30 Jan 2024 21:18:56 +0530
Message-ID: <CAK9=C2UEpbd+pHAMg-AuP-fTPZVho16u69oSjOHhsR11HTwiew@mail.gmail.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_074909_241166_1A678761 
X-CRM114-Status: GOOD (  28.26  )
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

T24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgODoxOOKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3Jp
dGVzOgo+Cj4gPiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JpdGVzOgo+
ID4KPiA+PiBPbiBUdWUsIEphbiAzMCwgMjAyNCBhdCAxOjIy4oCvUE0gQmrDtnJuIFTDtnBlbCA8
Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4+Cj4gPj4+IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QGtlcm5lbC5vcmc+IHdyaXRlczoKPiA+Pj4KPiA+Pj4gPiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JpdGVzOgo+ID4+PiA+Cj4gPj4+ID4+IFRoZSBSSVNDLVYgQUlBIHNw
ZWNpZmljYXRpb24gaXMgcmF0aWZpZWQgYXMtcGVyIHRoZSBSSVNDLVYgaW50ZXJuYXRpb25hbAo+
ID4+PiA+PiBwcm9jZXNzLiBUaGUgbGF0ZXN0IHJhdGlmaWVkIEFJQSBzcGVjaWZjYXRpb24gY2Fu
IGJlIGZvdW5kIGF0Ogo+ID4+PiA+PiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWlh
L3JlbGVhc2VzL2Rvd25sb2FkLzEuMC9yaXNjdi1pbnRlcnJ1cHRzLTEuMC5wZGYKPiA+Pj4gPj4K
PiA+Pj4gPj4gQXQgYSBoaWdoLWxldmVsLCB0aGUgQUlBIHNwZWNpZmljYXRpb24gYWRkcyB0aHJl
ZSB0aGluZ3M6Cj4gPj4+ID4+IDEpIEFJQSBDU1JzCj4gPj4+ID4+ICAgIC0gSW1wcm92ZWQgbG9j
YWwgaW50ZXJydXB0IHN1cHBvcnQKPiA+Pj4gPj4gMikgSW5jb21pbmcgTWVzc2FnZSBTaWduYWxl
ZCBJbnRlcnJ1cHQgQ29udHJvbGxlciAoSU1TSUMpCj4gPj4+ID4+ICAgIC0gUGVyLUhBUlQgTVNJ
IGNvbnRyb2xsZXIKPiA+Pj4gPj4gICAgLSBTdXBwb3J0IE1TSSB2aXJ0dWFsaXphdGlvbgo+ID4+
PiA+PiAgICAtIFN1cHBvcnQgSVBJIGFsb25nIHdpdGggdmlydHVhbGl6YXRpb24KPiA+Pj4gPj4g
MykgQWR2YW5jZWQgUGxhdGZvcm0tTGV2ZWwgSW50ZXJydXB0IENvbnRyb2xsZXIgKEFQTElDKQo+
ID4+PiA+PiAgICAtIFdpcmVkIGludGVycnVwdCBjb250cm9sbGVyCj4gPj4+ID4+ICAgIC0gSW4g
TVNJLW1vZGUsIGNvbnZlcnRzIHdpcmVkIGludGVycnVwdCBpbnRvIE1TSXMgKGkuZS4gTVNJIGdl
bmVyYXRvcikKPiA+Pj4gPj4gICAgLSBJbiBEaXJlY3QtbW9kZSwgaW5qZWN0cyBleHRlcm5hbCBp
bnRlcnJ1cHRzIGRpcmVjdGx5IGludG8gSEFSVHMKPiA+Pj4gPj4KPiA+Pj4gPj4gRm9yIGFuIG92
ZXJ2aWV3IG9mIHRoZSBBSUEgc3BlY2lmaWNhdGlvbiwgcmVmZXIgdGhlIEFJQSB2aXJ0dWFsaXph
dGlvbgo+ID4+PiA+PiB0YWxrIGF0IEtWTSBGb3J1bSAyMDIyOgo+ID4+PiA+PiBodHRwczovL3N0
YXRpYy5zY2hlZC5jb20vaG9zdGVkX2ZpbGVzL2t2bWZvcnVtMjAyMi9hMS9BSUFfVmlydHVhbGl6
YXRpb25faW5fS1ZNX1JJU0NWX2ZpbmFsLnBkZgo+ID4+PiA+PiBodHRwczovL3d3dy55b3V0dWJl
LmNvbS93YXRjaD92PXIwNzFkTDhaMHlvCj4gPj4+ID4+Cj4gPj4+ID4+IFRvIHRlc3QgdGhpcyBz
ZXJpZXMsIHVzZSBRRU1VIHY3LjIgKG9yIGhpZ2hlcikgYW5kIE9wZW5TQkkgdjEuMiAob3IgaGln
aGVyKS4KPiA+Pj4gPj4KPiA+Pj4gPj4gVGhlc2UgcGF0Y2hlcyBjYW4gYWxzbyBiZSBmb3VuZCBp
biB0aGUgcmlzY3ZfYWlhX3YxMiBicmFuY2ggYXQ6Cj4gPj4+ID4+IGh0dHBzOi8vZ2l0aHViLmNv
bS9hdnBhdGVsL2xpbnV4LmdpdAo+ID4+PiA+Pgo+ID4+PiA+PiBDaGFuZ2VzIHNpbmNlIHYxMToK
PiA+Pj4gPj4gIC0gUmViYXNlZCBvbiBMaW51eC02LjgtcmMxCj4gPj4+ID4+ICAtIEluY2x1ZGVk
IGtlcm5lbC9pcnEgcmVsYXRlZCBwYXRjaGVzIGZyb20gImdlbmlycSwgaXJxY2hpcDogQ29udmVy
dCBBUk0KPiA+Pj4gPj4gICAgTVNJIGhhbmRsaW5nIHRvIHBlciBkZXZpY2UgTVNJIGRvbWFpbnMi
IHNlcmllcyBieSBUaG9tYXMuCj4gPj4+ID4+ICAgIChQQVRDSDcsIFBBVENIOCwgUEFUQ0g5LCBQ
QVRDSDE0LCBQQVRDSDE2LCBQQVRDSDE3LCBQQVRDSDE4LCBQQVRDSDE5LAo+ID4+PiA+PiAgICAg
UEFUQ0gyMCwgUEFUQ0gyMSwgUEFUQ0gyMiwgUEFUQ0gyMywgYW5kIFBBVENIMzIgb2YKPiA+Pj4g
Pj4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMjExMjEx
MzU2NTMuMjA4NjExMjMzQGxpbnV0cm9uaXguZGUvKQo+ID4+PiA+PiAgLSBVcGRhdGVkIEFQTElD
IE1TSS1tb2RlIGRyaXZlciB0byB1c2UgdGhlIG5ldyBXSVJFRF9UT19NU0kgbWVjaGFuaXNtLgo+
ID4+PiA+PiAgLSBVcGRhdGVkIElNU0lDIGRyaXZlciB0byBzdXBwb3J0IHBlci1kZXZpY2UgTVNJ
IGRvbWFpbnMgZm9yIFBDSSBhbmQKPiA+Pj4gPj4gICAgcGxhdGZvcm0gZGV2aWNlcy4KPiA+Pj4g
Pgo+ID4+PiA+IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLCBBbnVwISBJJ20gc3RpbGwgcmV2
aWV3aW5nIHRoZSBwYXRjaGVzLgo+ID4+PiA+Cj4gPj4+ID4gSSdtIGhpdHRpbmcgYSBib290IGhh
bmcgaW4gdGV4dCBwYXRjaGluZywgd2l0aCB0aGlzIHNlcmllcyBhcHBsaWVkIG9uCj4gPj4+ID4g
Ni44LXJjMi4gSVBJIGlzc3Vlcz8KPiA+Pj4KPiA+Pj4gTm90IHRleHQgcGF0Y2hpbmchIE9uZSBj
cHUgc3Bpbm5pbmcgaW4gc21wX2NhbGxfZnVuY3Rpb25fbWFueV9jb25kKCkgYW5kCj4gPj4+IHRo
ZSBvdGhlcnMgYXJlIGluIGNwdV9yZWxheCgpLiBTbWVsbHMgbGlrZSBJUEkuLi4KPiA+Pgo+ID4+
IEkgdHJpZWQgYm9vdGVmaSBmcm9tIFUtQm9vdCBtdWx0aXBsZSB0aW1lcyBidXQgY2FuJ3QgcmVw
cm9kdWNlIHRoZQo+ID4+IGlzc3VlIHlvdSBhcmUgc2VlaW5nLgo+ID4KPiA+IFRoYW5rcyEgSSBj
YW4gcmVwcm9kdWNlIHdpdGhvdXQgRUZJLCBhbmQgc2ltcGxlciBjb21tYW5kLWxpbmU6Cj4gPgo+
ID4gcWVtdS1zeXN0ZW0tcmlzY3Y2NCBcCj4gPiAgIC1iaW9zIC9wYXRoL3RvL2Z3X2R5bmFtaWMu
YmluIFwKPiA+ICAgLWtlcm5lbCAvcGF0aC90by9JbWFnZSBcCj4gPiAgIC1hcHBlbmQgJ2Vhcmx5
Y29uIGNvbnNvbGU9dHR5MCBjb25zb2xlPXR0eVMwJyBcCj4gPiAgIC1tYWNoaW5lIHZpcnQsYWlh
PWFwbGljLWltc2ljIFwKPiA+ICAgLW5vLXJlYm9vdCAtbm9kZWZhdWx0cyAtbm9ncmFwaGljIFwK
PiA+ICAgLXNtcCA0IFwKPiA+ICAgLW9iamVjdCBybmctcmFuZG9tLGZpbGVuYW1lPS9kZXYvdXJh
bmRvbSxpZD1ybmcwIFwKPiA+ICAgLWRldmljZSB2aXJ0aW8tcm5nLWRldmljZSxybmc9cm5nMCBc
Cj4gPiAgIC1tIDRHIC1jaGFyZGV2IHN0ZGlvLGlkPWNoYXIwIC1zZXJpYWwgY2hhcmRldjpjaGFy
MAo+ID4KPiA+IEkgY2FuIHJlcHJvZHVjZSB3aXRoIHlvdXIgdXBzdHJlYW0gcmlzY3ZfYWlhX3Yx
MiBwbHVzIHRoZSBjb25maWcgaW4gdGhlCj4gPiBnaXN0IFsxXSwgYW5kIGFsbCBsYXRlc3QgUUVN
VS9PcGVuU0JJOgo+ID4KPiA+IFFFTVU6IDExYmU3MDY3N2M3MCAoIk1lcmdlIHRhZyAncHVsbC12
ZmlvLTIwMjQwMTI5JyBvZiBodHRwczovL2dpdGh1Yi5jb20vbGVnb2F0ZXIvcWVtdSBpbnRvIHN0
YWdpbmciKQo+ID4gT3BlblNCSTogYmI5MGE5ZWJmNmQ5ICgibGliOiBzYmk6IFByaW50IG51bWJl
ciBvZiBkZWJ1ZyB0cmlnZ2VycyBmb3VuZCIpCj4gPiBMaW51eDogZDliOWQ2ZWI5ODdmICgiTUFJ
TlRBSU5FUlM6IEFkZCBlbnRyeSBmb3IgUklTQy1WIEFJQSBkcml2ZXJzIikKPiA+Cj4gPiBSZW1v
dmluZyAiLGFpYT1hcGxpYy1pbXNpYyIgZnJvbSB0aGUgQ0xJIGFib3ZlIGNvbXBsZXRlcyB0aGUg
Ym9vdCAoaS5lLgo+ID4gcGFuaWNraW5nIGFib3V0IG1pc3Npbmcgcm9vdCBtb3VudCA7LSkpCj4K
PiBNb3JlIGNvbnRleHQ7IFRoZSBoYW5nIGlzIGR1cmluZyBhIGxhdGUgaW5pdGNhbGwsIHdoZXJl
IGFuIGZ0cmFjZSBkaXJlY3QKPiAocmVnaXN0ZXJfZnRyYWNlX2RpcmVjdCgpKSBtb2RpZmljYXRp
b24gaXMgZG9uZS4KPgo+IFN0b3AgbWFjaGluZSBpcyB1c2VkIHRvIGNhbGwgaW50byBfX2Z0cmFj
ZV9tb2RpZnlfY2FsbCgpLiBUaGVuIGludG8gdGhlCj4gYXJjaCBzcGVjaWZpYyBwYXRjaF90ZXh0
X25vc3luYygpLCB3aGVyZSBmbHVzaF9pY2FjaGVfcmFuZ2UoKSBoYW5ncyBpbgo+IGZsdXNoX2lj
YWNoZV9hbGwoKS4gRnJvbSAib25fZWFjaF9jcHUoaXBpX3JlbW90ZV9mZW5jZV9pLCBOVUxMLCAx
KTsiIHRvCj4gb25fZWFjaF9jcHVfY29uZF9tYXNrKCkgInNtcF9jYWxsX2Z1bmN0aW9uX21hbnlf
Y29uZChtYXNrLCBmdW5jLCBpbmZvLAo+IHNjZl9mbGFncywgY29uZF9mdW5jKTsiIHdoaWNoIG5l
dmVyIHJldHVybnMgZnJvbSAiY3NkX2xvY2tfd2FpdChjc2QpIgo+IHJpZ2h0IGJlZm9yZSB0aGUg
ZW5kIG9mIHRoZSBmdW5jdGlvbi4KPgo+IEFueSBpZGVhcz8gRGlzYWJsaW5nIENPTkZJR19ISURf
QlBGLCB0aGF0IGRvZXMgdGhlIGVhcmx5IGZ0cmFjZSBjb2RlCj4gcGF0Y2hpbmcgZml4ZXMgdGhl
IGJvb3QgaGFuZywgYnV0IGl0IGRvZXMgc2VlbSByZWxhdGVkIHRvIElQSS4uLgo+Ckxvb2tzIGxp
a2UgZmx1c2hfaWNhY2hlX2FsbCgpIGRvZXMgbm90IHVzZSB0aGUgSVBJcyAob25fZWFjaF9jcHUo
KQphbmQgZnJpZW5kcykgY29ycmVjdGx5LgoKT24gb3RoZXIgaGFuZCwgdGhlIGZsdXNoX2ljYWNo
ZV9tbSgpIGRvZXMgdGhlIHJpZ2h0IHRoaW5nIGJ5CmRvaW5nIGxvY2FsIGZsdXNoIG9uIHRoZSBj
dXJyZW50IENQVSBhbmQgSVBJIGJhc2VkIGZsdXNoIG9uIG90aGVyCkNQVXMuCgpDYW4geW91IHRy
eSB0aGUgZm9sbG93aW5nIHBhdGNoID8KCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2NhY2hl
Zmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jCmluZGV4IDU1YTM0ZjIwMjBhOC4u
YTNkZmJlNGRlODMyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYworKysg
Yi9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYwpAQCAtMTksMTIgKzE5LDE4IEBAIHN0YXRpYyB2
b2lkIGlwaV9yZW1vdGVfZmVuY2VfaSh2b2lkICppbmZvKQoKIHZvaWQgZmx1c2hfaWNhY2hlX2Fs
bCh2b2lkKQogeworICAgIGNwdW1hc2tfdCBvdGhlcnM7CisKICAgICBsb2NhbF9mbHVzaF9pY2Fj
aGVfYWxsKCk7CgorICAgIGNwdW1hc2tfYW5kbm90KCZvdGhlcnMsIGNwdV9vbmxpbmVfbWFzaywg
Y3B1bWFza19vZihzbXBfcHJvY2Vzc29yX2lkKCkpKTsKKyAgICBpZiAoY3B1bWFza19lbXB0eSgm
b3RoZXJzKSkKKyAgICAgICAgcmV0dXJuOworCiAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1JJ
U0NWX1NCSSkgJiYgIXJpc2N2X3VzZV9pcGlfZm9yX3JmZW5jZSgpKQotICAgICAgICBzYmlfcmVt
b3RlX2ZlbmNlX2koTlVMTCk7CisgICAgICAgIHNiaV9yZW1vdGVfZmVuY2VfaSgmb3RoZXJzKTsK
ICAgICBlbHNlCi0gICAgICAgIG9uX2VhY2hfY3B1KGlwaV9yZW1vdGVfZmVuY2VfaSwgTlVMTCwg
MSk7CisgICAgICAgIG9uX2VhY2hfY3B1X21hc2soJm90aGVycywgaXBpX3JlbW90ZV9mZW5jZV9p
LCBOVUxMLCAxKTsKIH0KIEVYUE9SVF9TWU1CT0woZmx1c2hfaWNhY2hlX2FsbCk7CgoKUmVnYXJk
cywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
