Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22DCC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 07:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dusJQQEKeNL9AaEqsZMstErVEY14/zN1fjlXzUABGEw=; b=0ExkIDBs2Jg8gT
	u3VlPBBEG2fBPzSmoKRTDo3ZKO4pZuHa2duG2wUlhIShuhf7yAhxy4Ima/a0gxi6wA27K2MWtLdUn
	FA22xaaruwhhuYSW2Zo/fOs5CbtxwW2INlu8fwn1RYh1pTgILcpHPRpYN4SKMF3/aUAtFyBIdSyKD
	yuFHFiFF4zcWiH6U3Bghi3YWWPV0Di6JXGNjqxY/jH/Co6MrW50WbknjeM69owZ17qmr7++ZcLQdz
	KMzpWJYiHX2qxtMUJLSNqeVCVYoZkdv2ayWkgRlCbkKuEMB4NDq4ox/J9k/8SqA646Bv2Q9tYmKTm
	OVwx5pHRF9MA5QQiQMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOuBj-00000009ItV-2Bd9;
	Wed, 03 Jul 2024 07:13:59 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOuBY-00000009Ins-2UFj
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 07:13:57 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ec89b67b95so5377541fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 00:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719990826; x=1720595626; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KN2K7tgPnaRdMlkcJsecCmouFwytLiuseqebs8rLJVU=;
        b=GRyhExikMXQI5Vj5B3uVi3x76EdaIhStW8MCVpMS+S32AJNDz/RE9+6wHqy+6fEr3O
         y7iq+YGJmD/pxo5zy++ZmGvaq0FBgvC1T+qZ0hFO/N4w1AktOrt+df24OmSJz2xOdsyd
         D5J5uQlSEldlYNNXvHyElGy6BqO2sDiRVtH64wRq2kBtmioYxU3Jq06suaXkXsBa+HS7
         JRF12tjA5SPQZ/w0vuo6n3Dv5+F7TBNomM6l+dds2WTTAyOTLLAmcQM+9FRdTH89FLCB
         j7O1Vu9MJAnGr91nN669n4x7vlswavpMUPPNkTlrX5+xkiGAm8ACWlsTFtSBDTQxsetG
         s04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719990826; x=1720595626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KN2K7tgPnaRdMlkcJsecCmouFwytLiuseqebs8rLJVU=;
        b=eR4tTZDKNnlFdvcmq2R+lBePyX39ud1qfIgfiaQxSfSoBZQRMIueGIej5gJ3vTGzAG
         Mz2KlwEn4vIktdMYSUQCoxoAD7U3ORbArite2W46gAYg5iEk3li2aFSuMjAauwNbVlsT
         jqU8NFpAc41g8J2lTEuulh46dOW2bAcSudEdqq1sL/H3j4Q57AeHu7fM8TeOp7TPtLnC
         MpEf0rN0oN/iaMW/WmFudMC6o5vqCrczZ0pQz7eu+N2gB1mez/uDCQyE5M7h5r9JQ+S0
         OgQYRXRsoRF5Q92vi9buAdsvGFx07aVaRK22hYtpgimsc1wU0HPdo+joxvXPf9H5HQ5H
         Wz6g==
X-Forwarded-Encrypted: i=1; AJvYcCWhKlEhSqtL5mgHQtfYa2jk1gLfHyHu9wGyHQiu6meO4l2XV9mrU3bR4vS7ynjGh6AMC0dy+VUbTZkd5NvTLQtQJfoy1y1I/bdXhb5asXVI
X-Gm-Message-State: AOJu0Yxs0YsZqaatejABpYobQMSQXAQo9b19lnS4s4VxxyxvbxI/DzAB
	8B6+OmRT+JvkMGocDhxyGiT+CqnRTvQTCdYv28tPCTSdtf4O/ihv1mEBSH3od38=
X-Google-Smtp-Source: AGHT+IFFfAg0I5+WBGdENPKRIjqEUI5N8ZPdcwFhG3jl2OApcULLU4fNNmCI6KI3zwI9td0RSLoRcA==
X-Received: by 2002:a05:651c:1053:b0:2ec:4399:9be1 with SMTP id 38308e7fff4ca-2ee5e2a8b15mr62962181fa.0.1719990824955;
        Wed, 03 Jul 2024 00:13:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4258036d034sm124160185e9.43.2024.07.03.00.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 00:13:44 -0700 (PDT)
Message-ID: <af3152b6-adf7-40fa-b2a1-87e66eec45b0@rivosinc.com>
Date: Wed, 3 Jul 2024 09:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] RISC-V: Check Zicclsm to set unaligned access
 speed
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Jesse Taube <jesse@rivosinc.com>,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
 Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-5-jesse@rivosinc.com>
 <20240626-march-abreast-83414e844250@spud> <Zn3XrLRl/yazsoZe@ghost>
 <43941f48-9905-4b25-89ef-6ad75bf1a123@rivosinc.com>
 <20240701-ajar-italicize-9e3d9b8a0264@spud>
 <ef639748-3979-4236-b48d-c0c44e2d5ad2@rivosinc.com> <ZoR9swwgsGuGbsTG@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZoR9swwgsGuGbsTG@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_001348_873363_52C5A019 
X-CRM114-Status: GOOD (  29.50  )
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

CgpPbiAwMy8wNy8yMDI0IDAwOjIyLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gT24gTW9uLCBK
dWwgMDEsIDIwMjQgYXQgMDQ6MjA6MTVQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
Pgo+Pgo+PiBPbiAwMS8wNy8yMDI0IDE1OjU4LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBN
b24sIEp1bCAwMSwgMjAyNCBhdCAwOToxNTowOUFNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3Jv
dGU6Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDI3LzA2LzIwMjQgMjM6MjAsIENoYXJsaWUgSmVua2lucyB3
cm90ZToKPj4+Pj4gT24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgMDM6Mzk6MTRQTSArMDEwMCwgQ29u
b3IgRG9vbGV5IHdyb3RlOgo+Pj4+Pj4gT24gTW9uLCBKdW4gMjQsIDIwMjQgYXQgMDg6NDk6NTdQ
TSAtMDQwMCwgSmVzc2UgVGF1YmUgd3JvdGU6Cj4+Pj4+Pj4gQ2hlY2sgZm9yIFppY2Nsc20gYmVm
b3JlIGNoZWNraW5nIGZvciB1bmFsaWduZWQgYWNjZXNzIHNwZWVkLiBUaGlzIHdpbGwKPj4+Pj4+
PiBncmVhdGx5IHJlZHVjZSB0aGUgYm9vdCB1cCB0aW1lIGFzIGZpbmRpbmcgdGhlIGFjY2VzcyBz
cGVlZCBpcyBubyBsb25nZXIKPj4+Pj4+PiBuZWNlc3NhcnkuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3NpbmMuY29tPgo+Pj4+Pj4+IC0tLQo+
Pj4+Pj4+IFYyIC0+IFYzOgo+Pj4+Pj4+ICAtIE5ldyBwYXRjaCBzcGxpdCBmcm9tIHByZXZpb3Vz
IHBhdGNoCj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gIGFyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9h
Y2Nlc3Nfc3BlZWQuYyB8IDI2ICsrKysrKysrKysrKysrLS0tLS0tLS0KPj4+Pj4+PiAgMSBmaWxl
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Pj4+Pj4KPj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4+Pj4+Pj4gaW5k
ZXggYTlhNmJjYjAyYWNmLi4zMjlmZDI4OWI1YzggMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4+Pj4+Pj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jCj4+Pj4+Pj4gQEAgLTI1OSwyMyAr
MjU5LDMxIEBAIHN0YXRpYyBpbnQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19zcGVlZF9hbGxfY3B1
cyh2b2lkKQo+Pj4+Pj4+ICAJa2ZyZWUoYnVmcyk7Cj4+Pj4+Pj4gIAlyZXR1cm4gMDsKPj4+Pj4+
PiAgfQo+Pj4+Pj4+ICsjZWxzZSAvKiBDT05GSUdfUklTQ1ZfUFJPQkVfVU5BTElHTkVEX0FDQ0VT
UyAqLwo+Pj4+Pj4+ICtzdGF0aWMgaW50IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWRfYWxs
X2NwdXModm9pZCkKPj4+Pj4+PiArewo+Pj4+Pj4+ICsJcmV0dXJuIDA7Cj4+Pj4+Pj4gK30KPj4+
Pj4+PiArI2VuZGlmCj4+Pj4+Pj4gIAo+Pj4+Pj4+ICBzdGF0aWMgaW50IGNoZWNrX3VuYWxpZ25l
ZF9hY2Nlc3NfYWxsX2NwdXModm9pZCkKPj4+Pj4+PiAgewo+Pj4+Pj4+IC0JYm9vbCBhbGxfY3B1
c19lbXVsYXRlZCA9IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKTsK
Pj4+Pj4+PiArCWJvb2wgYWxsX2NwdXNfZW11bGF0ZWQ7Cj4+Pj4+Pj4gKwlpbnQgY3B1Owo+Pj4+
Pj4+ICsKPj4+Pj4+PiArCWlmIChyaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lT
QV9FWFRfWklDQ0xTTSkpIHsKPj4+Pj4+PiArCQlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkgewo+
Pj4+Pj4+ICsJCQlwZXJfY3B1KG1pc2FsaWduZWRfYWNjZXNzX3NwZWVkLCBjcHUpID0gUklTQ1Zf
SFdQUk9CRV9NSVNBTElHTkVEX0ZBU1Q7Cj4+Pj4+Pgo+Pj4+Pj4gLSBjb25zdDogemljY2xzbQo+
Pj4+Pj4gICBkZXNjcmlwdGlvbjoKPj4+Pj4+ICAgICBUaGUgc3RhbmRhcmQgWmljY2xzbSBleHRl
bnNpb24gZm9yIG1pc2FsaWduZWQgc3VwcG9ydCBmb3IgYWxsIHJlZ3VsYXIKPj4+Pj4+ICAgICBs
b2FkIGFuZCBzdG9yZSBpbnN0cnVjdGlvbnMgKGluY2x1ZGluZyBzY2FsYXIgYW5kIHZlY3Rvcikg
YnV0IG5vdCBBTU9zCj4+Pj4+PiAgICAgb3Igb3RoZXIgc3BlY2lhbGl6ZWQgZm9ybXMgb2YgbWVt
b3J5IGFjY2Vzcy4gRGVmaW5lZCBpbiB0aGUKPj4+Pj4+ICAgICBSSVNDLVYgUlZBIFByb2ZpbGVz
IFNwZWNpZmljYXRpb24uIAo+Pj4+Pj4KPj4+Pj4+IERvZXNuJ3QsIHVuZm9ydHVuYXRlbHksIHNh
eSBhbnl3aGVyZSB0aGVyZSB0aGF0IHRoZXkncmUgYWN0dWFsbHkgZmFzdCA6KAo+Pj4+Pgo+Pj4+
PiBPaCBubyEgVGhhdCBpcyB1bmZvcnR1bmF0ZSB0aGF0IHRoZSBJU0EgZG9lcyBub3QgZXhwbGlj
aXRseSBjYWxsIHRoYXQKPj4+Pj4gb3V0LCBidXQgSSB0aGluayB0aGF0IGFjY2VwdGFibGUuCj4+
Pj4+Cj4+Pj4+IElmIGEgdmVuZG9yIHB1dHMgWmljY2xzbSBpbiB0aGVpciBpc2Egc3RyaW5nLCB0
aGV5IHNob3VsZCBleHBlY3QKPj4+Pj4gc29mdHdhcmUgdG8gdGFrZSBhZHZhbnRhZ2Ugb2YgbWlz
YWxpZ25lZCBhY2Nlc3Nlcy4gRkFTVCBpcyBvdXIgc2lnbmFsIHRvCj4+Pj4+IHRlbGwgc29mdHdh
cmUgdGhhdCB0aGV5IHNob3VsZCBlbWl0IG1pc2FsaWduZWQgYWNjZXNzZXMuCj4+Pj4KPj4+PiBB
RkFJSywgWmljY2xzbSBpcyBub3QgZXZlbiBhbiBJU0EgZXh0ZW5zaW9uLCBzaW1wbHkgYSBwcm9m
aWxlCj4+Pj4gc3BlY2lmaWNhdGlvbiB3aGljaCBtZWFucyB0aGF0IG9ubHkgdGhlIGV4ZWN1dGlv
biBlbnZpcm9ubWVudCB3aGljaAo+Pj4+IHByb3ZpZGVzIHRoZSBwcm9maWxlIHN1cHBvcnQgbWlz
YWxpZ25lZCBhY2Nlc3NlcyAoY2YKPj4+PiBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gt
cHJvZmlsZXMvbWVzc2FnZS81NikuCj4+Pgo+Pj4gSSBkdW5ubywgdGhlIHNwZWNpZmljYXRpb24g
c3RhdHVzIHBhZ2UgdXNlZCB0byBkZXNjcmliZSBpdCBhcyBhbgo+Pj4gZXh0ZW5zaW9uOgo+Pj4g
aHR0cHM6Ly93aWtpLnJpc2N2Lm9yZy9kaXNwbGF5L0hPTUUvU3BlY2lmaWNhdGlvbitTdGF0dXMr
LStIaXN0b3JpY2FsCj4+PiBNeSB1bmRlcnN0YW5kaW5nIHdhcyB0aGF0IHRoZXNlIGNvdWxkIGJl
IGNvbnNpZGVyZWQgZXh0ZW5zaW9ucywganVzdAo+Pj4gbGlrZSB3ZSBhcmUgY29uc2lkZXJpbmcg
c3ZhZGUgdG8gYmUgb25lLgo+Pj4KPj4+PiAuIEkgZG9uJ3QgdGhpbmsgd2UKPj4+PiBjYW4gZXh0
cmFwb2xhdGUgdGhhdCB0aGUgbWlzYWxpZ25lZCBhY2Nlc3NlcyB3aWxsIGJlIGZhc3QgYXQgYWxs
Lgo+Pj4KPj4+IFRoYXQgaXMgbXkgb3BpbmlvbiBvbiBpdCB0b28uIElmIGl0IGRvZXNuJ3Qgc2F5
ICJmYXN0IiBhbmQgZ2l2ZSBhCj4+PiBkZWZpbml0aW9uIGZvciB3aGF0IHRoYXQgbWVhbnMgaW4g
dGhlIGJpbmRpbmcsIHRoZW4gd2UgY2FuJ3QgYXNzdW1lIHRoYXQKPj4+IGl0IGlzIGZhc3QuIEkn
bSBhbHNvIHdhcnkgb2YgZXh0ZW5kaW5nIGRlZmluaXRpb25zIG9mIGV4dGVuc2lvbnMgaW4gdGhl
Cj4+PiBiaW5kaW5nLCBiZWNhdXNlIGEpIEkgYW0gOTAlIHN1cmUgdGhhdCBwZW9wbGUgd3JpdGlu
ZyBkZXZpY2V0cmVlcyBkb24ndAo+Pj4gY2FyZSBhbmQgYikgaXQnZCBiZSBhIHBvdGVudGlhbCBk
aWZmZXJlbmNlIGJldHdlZW4gRFQgYW5kIEFDUEkgd2l0aG91dCBhCj4+PiByZWFsIGp1c3RpZmlj
YXRpb24gKHVubGlrZSB0aGUgemtyIG9yIHN2YWRlL3N2YWR1IHNpdHVhdGlvbnMpLgo+Pgo+PiBC
VFcsIHRoZSBwcm9maWxlIHNwZWMgWzFdIGhhcyBhIG5vdGUgdGhhdCBzdGF0ZXMgdGhlIGZvbGxv
d2luZyBmb3IgWmljY2xzbToKPj4KPj4gIkV2ZW4gdGhvdWdoIG1hbmRhdGVkLCBtaXNhbGlnbmVk
IGxvYWRzIGFuZCBzdG9yZXMgbWlnaHQgZXhlY3V0ZQo+PiBleHRyZW1lbHkgc2xvd2x5LiBTdGFu
ZGFyZCBzb2Z0d2FyZSBkaXN0cmlidXRpb25zIHNob3VsZCBhc3N1bWUgdGhlaXIKPj4gZXhpc3Rl
bmNlIG9ubHkgZm9yIGNvcnJlY3RuZXNzLCBub3QgZm9yIHBlcmZvcm1hbmNlLiIKPj4KPj4gV2hp
Y2ggd2FzIGFsc28gcXVvdGVkIGluIHBhdGNoIDEsIHNvIEkgZ3Vlc3MgdGhhdCBzZXR0bGVzIGl0
Lgo+IAo+IFRoZSBpbnRlbnRpb24gaGVyZSB3YXMgdG8gYWxsb3cgdmVuZG9ycyB0byBjb25maWd1
cmUgYW4gb3B0aW9uIHRvIHNraXAKPiB0aGUgcHJvYmluZy4gVGhpcyBleHRlbnNpb24gZG9lcyBu
b3Qgc2VlbSB1c2VmdWwgYXMgaXQgaXMgd3JpdHRlbiEgQSB3YXkKPiBhcm91bmQgdGhpcyB3b3Vs
ZCBiZSB0byBhZGQgYSBrZXJuZWwgYXJnIHRvIHNldCB0aGUgYWNjZXNzIHNwZWVkIGJ1dAo+IG1h
eWJlIGl0IGRvZXNuJ3QgbWF0dGVyLiBGb3IgdGhlIHNha2Ugb2YgdGhpcyBwYXRjaCwgaXQgbG9v
a3MgbGlrZSB3ZQo+IHNob3VsZCBnZXQgcmlkIG9mIHRoaXMgWmljY2xzbSBjaGVjay4KCkkgdGhp
bmsgYSBwYXJhbWV0ZXIgY291bGQgYmUgYXBwcm9wcmlhdGUgZm9yIHZlbmRvcnMgdGhhdCB3YW50
IHRvIHNraXAKdGhlIHByb2JpbmcgYW5kIGdhaW4gYSBiaXQgb2YgdGltZSBvbiBib290IHRpbWUu
IE90aGVyIG9wdGlvbnMgYWxyZWFkeQpleGlzdHMgdG8gZm9yY2Ugc3BlY2lmaWMgc2V0dGluZ3Mg
c28sIHdoeSBub3QgIQoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gLSBDaGFybGllCj4gCj4+Cj4+
IFRoYW5rcywKPj4KPj4gQ2zDqW1lbnQKPj4KPj4gTGluazoKPj4gaHR0cHM6Ly9naXRodWIuY29t
L3Jpc2N2L3Jpc2N2LXByb2ZpbGVzL2Jsb2IvbWFpbi9zcmMvcHJvZmlsZXMuYWRvYz9wbGFpbj0x
I0w1MjQKPj4gWzFdCj4+Cj4+Pgo+Pj4+PiBUaGlzIGFsbG93cyBmb3IgYSBnZW5lcmljIGtlcm5l
bCwgbGlrZSB0aGUgb25lIGEgZGlzdHJvIHdvdWxkIGNvbXBpbGUsIHRvCj4+Pj4+IHNraXAgdGhl
IHByb2Jpbmcgd2hlbiBib290aW5nIG9uIGEgc3lzdGVtIHRoYXQgZXhwbGljaXRseSBjYWxsZWQg
b3V0Cj4+Pj4+IHRoYXQgdGhlIGhhcmR3YXJlIHN1cHBvcnRzIG1pc2FsaWduZWQgYWNjZXNzZXMu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
