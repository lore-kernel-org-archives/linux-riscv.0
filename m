Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCFCC0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sAaqfqmyH61dJ8eqx1wgjOUCWEcPjiLmi14QZ63F/yQ=; b=PPW1NV6CAMB4xj
	kvz7rOJlaHq+dGzqT9TJ+0D1sRKGLlkf9AQnx68CfYiztxlhxG6nclDcTaXRtwpuSm9wdk5eQypUM
	zqFFA04M0WpipJj6tTHwF1p5DSogQ19zoTRXHYjoaM+4bEniz9GJrLt8Qwmw37FB8NmnOyLUZcKyF
	sbmzT2mX5AbU3KYCKTKXa6usvzc1VFhV/Sdl8zYfoZpL8r6TTuAWrykGc/kl7ymFLU/AalstaP0J0
	oMvREISRlszuEzF0PE5fjw8aSKl0rqzCM2duyI3/NsxxgC3FwdPiA9oI9tMbY+TUqNQB0ajpZ6K/w
	oPwPbi4U0tYQ1iKDqWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvf2b-00CXNe-2P;
	Wed, 25 Oct 2023 14:39:25 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvf2Z-00CXMZ-0X
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 14:39:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso5854895e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698244759; x=1698849559; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CB2fosNyHpnLw68d0tSWZGOJRnHryfe3IEs9QTF/RYI=;
        b=HHhMZSaeBIpaXDQq0glVyGws3BQkHmVoVWAbhgBwIEQs2cc6Q8xvr+Polx/YcOVHcJ
         ThY0m9NY3q0g4L4bI55Z4JB5XfxI8KfX91XYm6bw4DVpa/D/0S4YXITl1wBM1hMk4rn4
         EIjetBTPdmwwt3SIf5JDRdhik5aYe2iiMX2owP7P5MuqxvhzeE0vlPG1lHoOvHn5Uqam
         B/sy3L//YzOMAyMjPB0jHTQ1hwVQI0Xz+Gvo/XC70jou+SKMUDTcRv26vKn5VOc+bTX6
         oPviVwmZdQMLPHPDjp8gsatJhsWnMocnIZ+ayHxCuvwNNeJ6T/DXnsSx/00SKWTaMQir
         RA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698244759; x=1698849559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CB2fosNyHpnLw68d0tSWZGOJRnHryfe3IEs9QTF/RYI=;
        b=s+zoKcO5utAwPZ0Bn9Z5bS467i9QbCa9ZKmvu8bJx46aPmqVnTkxMWuo9PL/0gsDpK
         XewOITDPzG1DJGo6ubO12zVXv8HoT+95tMCo7EIVYzP2UMa520On5SvazxzzErJzMovV
         Nm5wD/j8fbcc60x3wLDSWZXfbaGquPV5+lzoA5m1Z/OJYh+JqHSFwF3uUBYZkLutbMHE
         FcS3ohmuv7AfcxTivnVOYardSV/7DhGbw6556Mqy+XViBKpR6QwFvIRI10bo9n5LeaAx
         ho6y9mpOrrmazLP7yGJZ8dGdIXzBIzwvvs8RodJOZ8umYoqkc5CNekgg8lnVjozgRBWJ
         FPag==
X-Gm-Message-State: AOJu0Yxh69P2uDJl7SBVfvDmTiS7VAs5gQG4ttAgbcynpxqW/ha6VkB7
	PKmXouAdytfsUKvvYtvYN50/dQ==
X-Google-Smtp-Source: AGHT+IGqXcpRVWBXo+8Ix92wajAH3UIGgltE405zdSv3Pgfz1FUcUSG0CISD+Q5m0T1OIr23+ANGxQ==
X-Received: by 2002:a05:600c:4fc6:b0:405:19dd:ad82 with SMTP id o6-20020a05600c4fc600b0040519ddad82mr15707940wmq.16.1698244758561;
        Wed, 25 Oct 2023 07:39:18 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id o12-20020a05600c4fcc00b0040775501256sm14774508wmq.16.2023.10.25.07.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 07:39:18 -0700 (PDT)
Message-ID: <d0e70434-e273-4799-c5ec-bbee1b3f5cc7@linaro.org>
Date: Wed, 25 Oct 2023 16:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 2/3] clocksource: Add JH7110 timer driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Walker Chen <walker.chen@starfivetech.com>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20231019053501.46899-1-xingyu.wu@starfivetech.com>
 <20231019053501.46899-3-xingyu.wu@starfivetech.com>
 <3f76f965-7c7b-109e-2ee0-3033e332e84b@linaro.org>
 <bb819333-52d3-49fc-9bb9-1a227bd5ca8f@starfivetech.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <bb819333-52d3-49fc-9bb9-1a227bd5ca8f@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_073923_204927_619AF892 
X-CRM114-Status: GOOD (  23.49  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CkhpIFhpbmd5dSwKCgpPbiAyNS8xMC8yMDIzIDExOjA0LCBYaW5neXUgV3Ugd3JvdGU6Cj4gT24g
MjAyMy8xMC8yNCAyMjo1NiwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4+Cj4+IEhpIFhpbmd5dSwK
Pj4KPj4KPj4gT24gMTkvMTAvMjAyMyAwNzozNSwgWGluZ3l1IFd1IHdyb3RlOgo+Pj4gQWRkIHRp
bWVyIGRyaXZlciBmb3IgdGhlIFN0YXJGaXZlIEpINzExMCBTb0MuCj4+Cj4+IEFzIGl0IGlzIGEg
bmV3IHRpbWVyLCBwbGVhc2UgYWRkIGEgcHJvcGVyIG5pY2UgZGVzY3JpcHRpb24gZXhwbGFpbmlu
ZyB0aGUgdGltZXIgaGFyZHdhcmUsIHRoYW5rcy4KPiAKPiBPSy4gV2lsbCBhZGQgdGhlIGRlc2Ny
aXB0aW9uIGluIG5leHQgdmVyc2lvbi4KPiAKPj4KPj4+IFNpZ25lZC1vZmYtYnk6IFhpbmd5dSBX
dSA8eGluZ3l1Lnd1QHN0YXJmaXZldGVjaC5jb20+Cj4+PiAtLS0KPj4+ICDCoCBNQUlOVEFJTkVS
U8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNyAr
Cj4+PiAgwqAgZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnwqDCoMKgwqDCoMKgwqAgfMKgIDEx
ICsKPj4+ICDCoCBkcml2ZXJzL2Nsb2Nrc291cmNlL01ha2VmaWxlwqDCoMKgwqDCoMKgIHzCoMKg
IDEgKwo+Pj4gIMKgIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItamg3MTEwLmMgfCAzODAgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+ICDCoCA0IGZpbGVzIGNoYW5nZWQsIDM5OSBp
bnNlcnRpb25zKCspCj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xvY2tzb3Vy
Y2UvdGltZXItamg3MTEwLmMKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUwo+Pj4gaW5kZXggN2E3YmQ4YmQ4MGU5Li45MWMwOWIzOTkxMzEgMTAwNjQ0Cj4+PiAt
LS0gYS9NQUlOVEFJTkVSUwo+Pj4gKysrIGIvTUFJTlRBSU5FUlMKPj4+IEBAIC0yMDQ3Myw2ICsy
MDQ3MywxMyBAQCBTOsKgwqDCoCBNYWludGFpbmVkCj4+PiAgwqAgRjrCoMKgwqAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3N0YXJmaXZlLGpoNzExMC10ZG0ueWFtbAo+
Pj4gIMKgIEY6wqDCoMKgIHNvdW5kL3NvYy9zdGFyZml2ZS9qaDcxMTBfdGRtLmMKPj4+ICDCoCAr
U1RBUkZJVkUgSkg3MTEwIFRJTUVSIERSSVZFUgo+Pj4gK006wqDCoMKgIFNhbWluIEd1byA8c2Ft
aW4uZ3VvQHN0YXJmaXZldGVjaC5jb20+Cj4+PiArTTrCoMKgwqAgWGluZ3l1IFd1IDx4aW5neXUu
d3VAc3RhcmZpdmV0ZWNoLmNvbT4KPj4+ICtTOsKgwqDCoCBTdXBwb3J0ZWQKPj4+ICtGOsKgwqDC
oCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc3RhcmZpdmUsamg3MTEw
LXRpbWVyLnlhbWwKPj4+ICtGOsKgwqDCoCBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLWpoNzEx
MC5jCj4+PiArCj4+PiAgwqAgU1RBUkZJVkUgSkg3MVgwIENMT0NLIERSSVZFUlMKPj4+ICDCoCBN
OsKgwqDCoCBFbWlsIFJlbm5lciBCZXJ0aGluZyA8a2VybmVsQGVzbWlsLmRrPgo+Pj4gIMKgIE06
wqDCoMKgIEhhbCBGZW5nIDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2guY29tPgo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2NvbmZpZyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvS2Nv
bmZpZwo+Pj4gaW5kZXggMGJhMGRjNGVjZjA2Li44MjFhYmNjMWU1MTcgMTAwNjQ0Cj4+PiAtLS0g
YS9kcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcKPj4+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3Vy
Y2UvS2NvbmZpZwo+Pj4gQEAgLTY0MSw2ICs2NDEsMTcgQEAgY29uZmlnIFJJU0NWX1RJTUVSCj4+
PiAgwqDCoMKgwqDCoMKgwqAgaXMgYWNjZXNzZWQgdmlhIGJvdGggdGhlIFNCSSBhbmQgdGhlIHJk
Y3ljbGUgaW5zdHJ1Y3Rpb24uwqAgVGhpcyBpcwo+Pj4gIMKgwqDCoMKgwqDCoMKgIHJlcXVpcmVk
IGZvciBhbGwgUklTQy1WIHN5c3RlbXMuCj4+PiAgwqAgK2NvbmZpZyBTVEFSRklWRV9KSDcxMTBf
VElNRVIKPj4+ICvCoMKgwqAgYm9vbCAiVGltZXIgZm9yIHRoZSBTVEFSRklWRSBKSDcxMTAgU29D
Igo+Pj4gK8KgwqDCoCBkZXBlbmRzIG9uIEFSQ0hfU1RBUkZJVkUgfHwgQ09NUElMRV9URVNUCj4+
Cj4+IFlvdSBtYXkgd2FudCB0byB1c2UgQVJDSF9TVEFSRklWRSBvbmx5IGlmIHRoZSBwbGF0Zm9y
bSBjYW4gbWFrZSB0aGlzIHRpbWVyIG9wdGlvbmFsLiBPdGhlcndpc2UsIHNldCB0aGUgb3B0aW9u
IGZyb20gdGhlIHBsYXRmb3JtIEtjb25maWcgYW5kIHB1dCB0aGUgYm9vbCAiYmxhIGJsYSIgaWYg
Q09NUElMRV9URVNUCj4gCj4gWWVzLCB0aGlzIHRpbWVyIG9ubHkgYmUgdXNlZCBvbiB0aGUgU3Rh
ckZpdmUgU29DLiBTbyBJIGludGVuZCB0byBtb2RpZnkgdG8gdGhpczoKPiAKPiBib29sICJUaW1l
ciBmb3IgdGhlIFNUQVJGSVZFIEpINzExMCBTb0MiIGlmIENPTVBJTEVfVEVTVAo+IGRlcGVuZHMg
b24gQVJDSF9TVEFSRklWRQoKSW4gdGhpcyBjYXNlLCB5b3Ugc2hvdWxkIGNoYW5nZSB0aGUgcGxh
dGZvcm0gY29uZmlnIGFuZCBzZWxlY3QgdGhlIHRpbWVyIApmcm9tIHRoZXJlLiBSZW1vdmUgdGhl
IGRlcGVuZHMgb24gQVJDSF9TVEFSRklWRSBzbyBpdCBpcyBwb3NzaWJsZSBlbmFibGUgCmNyb3Nz
IHRlc3QgY29tcGlsYXRpb24uIE90aGVyd2lzZSBDT01QSUxFX1RFU1Qgd2lsbCBub3Qgd29yayBv
biBvdGhlciAKcGxhdGZvcm1zLgoKWyAuLi4gXQoKPj4+ICtzdHJ1Y3Qgamg3MTEwX2Nsa2V2dCB7
Cj4+PiArwqDCoMKgIHN0cnVjdCBjbG9ja19ldmVudF9kZXZpY2UgZXZ0Owo+Pj4gK8KgwqDCoCBz
dHJ1Y3QgY2xvY2tzb3VyY2UgY3M7Cj4+PiArwqDCoMKgIGJvb2wgY3NfaXNfdmFsaWQ7Cj4+PiAr
wqDCoMKgIHN0cnVjdCBjbGsgKmNsazsKPj4+ICvCoMKgwqAgc3RydWN0IHJlc2V0X2NvbnRyb2wg
KnJzdDsKPj4+ICvCoMKgwqAgdTMyIHJhdGU7Cj4+PiArwqDCoMKgIHUzMiByZWxvYWRfdmFsOwo+
Pj4gK8KgwqDCoCB2b2lkIF9faW9tZW0gKmJhc2U7Cj4+PiArwqDCoMKgIGNoYXIgbmFtZVtzaXpl
b2YoImpoNzExMC10aW1lci5jaFgiKV07Cj4+PiArfTsKPj4+ICsKPj4+ICtzdHJ1Y3Qgamg3MTEw
X3RpbWVyX3ByaXYgewo+Pj4gK8KgwqDCoCBzdHJ1Y3QgY2xrICpwY2xrOwo+Pj4gK8KgwqDCoCBz
dHJ1Y3QgcmVzZXRfY29udHJvbCAqcHJzdDsKPj4+ICvCoMKgwqAgc3RydWN0IGpoNzExMF9jbGtl
dnQgY2xrZXZ0W0pINzExMF9USU1FUl9DSF9NQVhdOwo+Pgo+PiBXaHkgZG8geW91IG5lZWQgc2V2
ZXJhbCBjbG9jayBldmVudHMgYW5kIGNsb2NrIHNvdXJjZXMgPwo+IAo+IFRoaXMgdGltZXIgaGFz
IGZvdXIgY291bnRlcnMgKGNoYW5uZWxzKSB3aGljaCBydW4gaW5kZXBlbmRlbnRseS4gU28gZWFj
aCBjb3VudGVyIGNhbiBoYXZlIGl0cyBvd24gY2xvY2sgZXZlbnQgYW5kIGNsb2NrIHNvdXJjZSB0
byBjb25maWd1cmUgZGlmZmVyZW50IHNldHRpbmdzLgoKVGhlIGtlcm5lbCBvbmx5IG5lZWRzIG9u
ZSBjbG9ja3NvdXJjZS4gVXN1YWxseSBtdWx0aXBsZSBjbG9ja2V2ZW50cyBhcmUgCnBlci1jcHUg
YmFzZWQgc3lzdGVtLgoKVGhlIGRyaXZlciBkb2VzIG5vdCBzZWVtIHRvIGhhdmUgYSBwZXIgY3B1
IHRpbWVyIGJ1dCBqdXN0IGluaXRpYWxpemluZyAKbXVsdGlwbGUgY2xvY2tldmVudHMgd2hpY2gg
d2lsbCBlbmQgdXAgdW51c2VkLCB3YXN0aW5nIGVuZXJneS4KCgotLSAKPGh0dHA6Ly93d3cubGlu
YXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+
IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8
aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
