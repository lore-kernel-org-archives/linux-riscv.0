Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E53C3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 13:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KEZmxSTYisRO47UFBe/BHs5XHiLzTeW7+uj/5WOENPc=; b=2wqkAd5tCWxo8x
	h3v5N79Sli280EF/BDgNrEZfTmRtRR02IWmqwqcUEBnEKhysmiUs1B7xF/32hr/G8gKpnX+zYfcKP
	obYkvAfHbiQlSWVsQRyz7GtlPnLYQfc38RYHThsZ0mQWOLVpuKWc47mTUrYhpqm1cYi+6lzO4sooH
	VnWmdevC4+gtCTtYdvlHqnwqWWOBvTlJrfXefLTnLjGHyDtTWg9q+oGdiII3BZbc5qnBSRz7JrG89
	duY7oS+TSEcyDjRr4EAaHlORq+G2MKgm2WuS6LoNwVJFbsnVnaD7vhdVNzxr1zpw7mijjhjY7vNKX
	gU0cztQi1Zwy5hv7WoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU58D-0000000Dy5I-1aaW;
	Wed, 17 Jul 2024 13:55:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU58A-0000000Dy4d-1oEo
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 13:55:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4277a5ed48bso51337685e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 06:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721224540; x=1721829340; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y83H8RmAx7QVV9p+l8NUc1S/UNvUCiNXkhTxZU2ZpRc=;
        b=CjOX0M4YMZo6n8heG5D0KEkz99QnUA2nOmc8zg0P3f4wX/0pJSQnCasqXs8pu2aetE
         YdkAFsq70Tkg2Mn+JbtS/UbFJetZfRzTTKsZQjLM0l7hpo0wjRj0wQSIl2qke8wA6HyU
         bfVKawFOpFlUKuYrZc9XbpeBz7uprJy4MpGJtXKmiEeEhGfx5IN3KlsImmaMFVUuxhZb
         YrtcArgNtckDhkp/ZYcRyatOvVG8UJKSuUc7WsZNLxWB4YUnrqdl1+ANcIDSX8/fyJ/W
         YIy4fWYOGN9s46OThIxT81kuh0pZ+k1m+4mIfM6pthWlaypLxmJ7U1ze4OTUwRwc7ijg
         dJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721224540; x=1721829340;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y83H8RmAx7QVV9p+l8NUc1S/UNvUCiNXkhTxZU2ZpRc=;
        b=UqW9bqdPzzl5bk/eCiy/5u3oM02Mo8Pn/sNbyqvbuLJaHXBxHF3LZ1GSQN+gsBjYQY
         FRlY6iVX78sm/Mb9JlvdPVoB9M0zOurDmm2snQe3BV1EBhTOqylZJvRhA89s0ad9sKoj
         lvci5qC9/apYem01Xw7fW/wzEbJeIlGEjrhpzQwGqrQIhT3EjnoezylgHVjGLfqUQgGV
         MGY23WJmO+WlXvPPqPiqG8uWiM5efDnFb1pTmwJZm4vlWLQJye9JWo2O7DrfEJqizHOp
         qrvLXm6tl/tKrR8L6mjg3YyWIau2DYIH4Br3CZde/dG3LnOjDAyDUbLFRRYMCqppNuB3
         Z+ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW513Kza4gfT0KMGdoixNCdcCGRsFQxX7qfpcyGqYj0Oh2b43MXHSWYKlr4l3p9o7aW4ffjhhcjXdlDR1VB3KtJCf9DeKHkTvXbalDxVB2c
X-Gm-Message-State: AOJu0YwFCPXni63Kpn93WRgVFPTOCjAhb6DVQPGgfRtItmaBmd2lphBB
	X/P0WR9B0cPOtHeAD4v0CQ82mNLh2LzpwS6mbiNiJ42Da2W8Y5ck9dxD/IXjxkxPnVC6KR4gD28
	f
X-Google-Smtp-Source: AGHT+IEOn6Lwjz9UGc6Bd48U+gnMDgs3sLUKiAjRWOATS2nwM6Fo4EkCFno7qAwuBenAB7Azyt3kyQ==
X-Received: by 2002:a05:600c:19c7:b0:426:61f6:2e38 with SMTP id 5b1f17b1804b1-427c2d0fc43mr12890225e9.35.1721224539936;
        Wed, 17 Jul 2024 06:55:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb449sm172590745e9.35.2024.07.17.06.55.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 06:55:39 -0700 (PDT)
Message-ID: <38be7954-5274-4c30-ab99-c076cfc5c563@linaro.org>
Date: Wed, 17 Jul 2024 15:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo
 SG2042 support
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, adrian.hunter@intel.com,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
 tingzhu.wang@sophgo.com
References: <cover.1718697954.git.unicorn_wang@outlook.com>
 <dcc060c3ada7a56eda02b586c16c47f0a0905c61.1718697954.git.unicorn_wang@outlook.com>
 <6e5ad808-f4ee-45c3-a1cc-009f2f1010b9@linaro.org>
 <MA0P287MB2822C4FB66C0CD31BED2E3B8FEA32@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <MA0P287MB2822C4FB66C0CD31BED2E3B8FEA32@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_065542_501218_465E7294 
X-CRM114-Status: GOOD (  10.04  )
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

T24gMTcvMDcvMjAyNCAxMDowMSwgQ2hlbiBXYW5nIHdyb3RlOgo+IAo+IE9uIDIwMjQvNi8xOCAx
NzozOSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMTgvMDYvMjAyNCAxMDozOCwg
Q2hlbiBXYW5nIHdyb3RlOgo+Pj4gRnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9v
ay5jb20+Cj4+Pgo+Pj4gU0cyMDQyIHVzZSBTeW5vcHN5cyBkd2Nuc2hjIElQIGZvciBTRC9lTU1D
IGNvbnRyb2xsZXJzLgo+Pj4KPj4+IFNHMjA0MiBkZWZpbmVzIDMgY2xvY2tzIGZvciBTRC9lTU1D
IGNvbnRyb2xsZXJzLgo+Pj4gLSBBWElfRU1NQy9BWElfU0QgZm9yIGFjbGsvaGNsayhCdXMgaW50
ZXJmYWNlIGNsb2NrcyBpbiBEV0NfbXNoYykKPj4+ICAgIGFuZCBibGNrKENvcmUgQmFzZSBDbG9j
ayBpbiBEV0NfbXNoYyksIHRoZXNlIDMgY2xvY2tzIHNoYXJlIG9uZQo+Pj4gICAgc291cmNlLCBz
byByZXVzZSBleGlzdGluZyAiY29yZSIuCj4+PiAtIDEwMEtfRU1NQy8xMDBLX1NEIGZvciBjcWV0
bWNsayhUaW1lciBjbG9ja3MgaW4gRFdDX21zaGMpLCBzbyByZXVzZQo+Pj4gICAgZXhpc3Rpbmcg
InRpbWVyIiB3aGljaCB3YXMgYWRkZWQgZm9yIHJvY2tjaGlwIHNwZWNpZmllZC4KPj4+IC0gRU1N
Q18xMDBNL1NEXzEwME0gZm9yIGNjbGsoQ2FyZCBjbG9ja3MgaW4gRFdDX21zaGMpLCBhZGQgbmV3
ICJjYXJkIi4KPj4+Cj4+PiBBZGRpbmcgZXhhbXBsZSBmb3Igc2cyMDQyLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+Pj4gLS0tCj4+
PiAgIC4uLi9iaW5kaW5ncy9tbWMvc25wcyxkd2Ntc2hjLXNkaGNpLnlhbWwgICAgICB8IDY5ICsr
KysrKysrKysrKystLS0tLS0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyks
IDIwIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbW1jL3NucHMsZHdjbXNoYy1zZGhjaS55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9zbnBzLGR3Y21zaGMtc2RoY2kueWFtbAo+Pj4gaW5k
ZXggNGQzMDMxZDk5NjVmLi5iNTNmMjA3MzNmNzkgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3NucHMsZHdjbXNoYy1zZGhjaS55YW1sCj4+PiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3NucHMsZHdjbXNoYy1z
ZGhjaS55YW1sCj4+PiBAQCAtMjEsNiArMjEsNyBAQCBwcm9wZXJ0aWVzOgo+Pj4gICAgICAgICAt
IHNucHMsZHdjbXNoYy1zZGhjaQo+Pj4gICAgICAgICAtIHNvcGhnbyxjdjE4MDBiLWR3Y21zaGMK
Pj4+ICAgICAgICAgLSBzb3BoZ28sc2cyMDAyLWR3Y21zaGMKPj4+ICsgICAgICAtIHNvcGhnbyxz
ZzIwNDItZHdjbXNoYwo+Pj4gICAgICAgICAtIHRoZWFkLHRoMTUyMC1kd2Ntc2hjCj4+PiAgIAo+
Pj4gICAgIHJlZzoKPj4+IEBAIC0yOSwyNSArMzAsNiBAQCBwcm9wZXJ0aWVzOgo+Pj4gICAgIGlu
dGVycnVwdHM6Cj4+PiAgICAgICBtYXhJdGVtczogMQo+Pj4gICAKPj4+IC0gIGNsb2NrczoKPj4g
V2lkZXN0IGNvbnN0cmFpbnRzIHN0YXkgaGVyZS4KPj4KPj4+IC0gICAgbWluSXRlbXM6IDEKPj4+
IC0gICAgaXRlbXM6Cj4+PiAtICAgICAgLSBkZXNjcmlwdGlvbjogY29yZSBjbG9jawo+Pj4gLSAg
ICAgIC0gZGVzY3JpcHRpb246IGJ1cyBjbG9jayBmb3Igb3B0aW9uYWwKPj4+IC0gICAgICAtIGRl
c2NyaXB0aW9uOiBheGkgY2xvY2sgZm9yIHJvY2tjaGlwIHNwZWNpZmllZAo+Pj4gLSAgICAgIC0g
ZGVzY3JpcHRpb246IGJsb2NrIGNsb2NrIGZvciByb2NrY2hpcCBzcGVjaWZpZWQKPj4+IC0gICAg
ICAtIGRlc2NyaXB0aW9uOiB0aW1lciBjbG9jayBmb3Igcm9ja2NoaXAgc3BlY2lmaWVkCj4+PiAt
Cj4+PiAtCj4+PiAtICBjbG9jay1uYW1lczoKPj4+IC0gICAgbWluSXRlbXM6IDEKPj4gV2lkZXN0
IGNvbnN0cmFpbnRzIHN0YXkgaGVyZS4KPiAKPiBoaSwgS3J6eXN6dG9mLAo+IAo+IFBsZWFzZSBh
c2sgeW91IGEgcXVlc3Rpb24gYWJvdXQgdGhpcyB3aWRlc3QgY29uc3RyYWludHMsIEkgd3JpdGUg
Cj4gYmluZGluZ3MgYXMgYmVsb3c6Cj4gCj4gYGBgeWFtbAo+IAo+IHByb3BlcnRpZXM6Cj4gCj4g
Li4uLi4uCj4gCj4gIMKgIGNsb2NrczoKPiAgwqDCoMKgIG1pbkl0ZW1zOiAxCj4gCj4gIMKgIGNs
b2NrLW5hbWVzOgo+ICDCoMKgwqAgbWluSXRlbXM6IDEKClNvIDEwMDAgY2xvY2tzIGlzIGNvcnJl
Y3Q/IFlvdSBjYW4gYWx3YXlzIGxvb2sgYXQgaGVscGZ1bCBleGFtcGxlcyBmcm9tCm15IHNsaWRl
cy4uLiBvciBhbm90aGVyIGV4YW1wbGU6CgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92Ni44L3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdWZzL3Fjb20s
dWZzLnlhbWwjTDEzMgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
