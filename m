Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E977EC28B20
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 08:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8THDCtCqZzS/y4gb0Ye7eDIHNk7FEQYICw4Ib89XmHc=; b=J43vL6dN+C/hS+
	Z98XbhYDD1sR/ksmbgSc/wwuYuf8ChiDSll97Jg8p68cppgdi1Tbc5v6uVNL/kCx8zMvHuFwwJ55b
	li1udivCI8ODf+gMsfH53HzJ1SkFwL5ohnrj7mJvVU0YT01JP9yrd4P9vyoOfIWb9dH77vlCczhpJ
	D4VMcqnNjmwviodoTBR7jYCYPMYjfJfvC53vEfQjC4zOJNqslETqE7re1950m2ZPtD3nfr5iuESrr
	SWFKrbEKD1kkFcb66JmY6SFZ5qOXTQ2aD9wmopOXompJCYTcOH/D1w28RHJLgyUSsdMv6fLWaEuyW
	v6F4IFzVRHA0+wWEwKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztDN-00000005Udi-1UIN;
	Wed, 02 Apr 2025 08:12:49 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztDK-00000005Ucz-1yg9
	for linux-riscv@lists.infradead.org;
	Wed, 02 Apr 2025 08:12:47 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso11294071a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Apr 2025 01:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743581565; x=1744186365; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uFClo5NpaSQPbOCEBDtQuIKmuiL6KUEMZ4AGDOkwM64=;
        b=D2sriDLWTrX7d9x7Fu1PK8G8JQioMIx5ak5YGdVj0lTOpVrVie8oN1F8D62e4jpzfN
         r4AmrjVJa6coMA0hjnkrbOhoTk0CmQCU+byzwlNusyguu8/og+/65JBiKSQxBqp/iCng
         whkD0/VkZULRdEWjjIAhF8nXsEpZllf63KVNZzYGWgWE0ajdDZSkYenqhqrsWqEphUm3
         VWlMtDXow9+2Ttw3HCHDN6qmyO01cMuBBy1Mt/Okin8g7DALpHS3CfTp+1wrxoSFgEbF
         UuPoS2pxm272KFGDT4sv4D2ER/MarHn4PuRXbMQI1KoYbLoRcL+Qoc8OMX4r0PhdSdkY
         OxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581565; x=1744186365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uFClo5NpaSQPbOCEBDtQuIKmuiL6KUEMZ4AGDOkwM64=;
        b=nx2IR2l/LodHS2aoLytbzeb6OzUtyx5x+mCa+H4IqAbYr75WiBIg549EVq51QW78fu
         D1iIWY039uMu2x9xPcKqIfZolsJ7uMpJcIsGgDwNdF6gryeog8Z6Yu0YHtjeLVmR+lZ6
         lv17bzCb9+A6BpVJ6IgCJau0KB7ZhVfCyeRjA/fxT+jV3GtkRPBMYsTumEk0Q5KtuPns
         TiZ1y7rYiVoHTYicax2u06R3YYAItINeI1tnwZXTQpDuHx3xxtimwsHcg9E7dTYMtj2/
         tRU9QLYNnXvYWMomrAs/7rSrATghOy/RceoQ/MdCrmfWXdl8zL0BUg/dQL9j9w+X7P/w
         fmwA==
X-Gm-Message-State: AOJu0Yy9R8+nCBDPE5JyUc6iq5gKRzzoCe1dY32aCfDPSdP7dpXu5bkt
	pd/wuG74QpvFlP384eneRLjCDqa4Qy/lygcZOWeuAgSdb4zyvEoV
X-Gm-Gg: ASbGncvW6PYR/W8zWvKadwfDPRTKfIV8mostsl4I21LQzUjADPhEuFo9HNESxDixcHA
	62nE5R5bhsH3M/tiVeSZ7ix59NE0luqNHskpWZV9705Cz9+K7j1oChnQRZtGezzGHKSCNFrUjZZ
	h2svKKwkHBhVpPeDvgG+9jLEYy7696oFgYf3fPNDUFjn4WLTfF9jLMvsus2pDjMKI8hlJ+4qVX+
	jctoi+VvKGa5yyk+m/qzUOGvAIXyQThwzi34nJ/e9bXNryv/cZaFsUgYfKpGF5bznXlkA9aotKU
	z1IYggwW0kwBfdDjjWCpS/lg4k2pf+j9RWPQG2xDFjJVJdZEsw==
X-Google-Smtp-Source: AGHT+IEpSdkHYjFQR2Gfwl0QdoXfj8lmmQ7IFGbuutMi1vWfqJnUoHFCgfZFhJ8PhecXwrPNnI3cWA==
X-Received: by 2002:a17:90b:5288:b0:2f9:9ddd:68b9 with SMTP id 98e67ed59e1d1-3053215dab2mr19180859a91.26.1743581565466;
        Wed, 02 Apr 2025 01:12:45 -0700 (PDT)
Received: from [192.168.0.33] ([136.24.137.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0882sm102123625ad.75.2025.04.02.01.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 01:12:45 -0700 (PDT)
Message-ID: <0d7a300c-6c52-40c1-a3b6-f2cc60d23835@gmail.com>
Date: Wed, 2 Apr 2025 01:12:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Use kvmalloc_array on relocation_hashtable
To: Alexandre Ghiti <alex@ghiti.fr>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
References: <d9714824-810c-4dd8-aff4-d1431235702b@gmail.com>
 <20250402053408.14052-1-wgpierce17@gmail.com>
 <e24dcb5b-750f-4bab-b975-38753a619e3a@ghiti.fr>
Content-Language: en-US
From: William Pierce <wgpierce17@gmail.com>
In-Reply-To: <e24dcb5b-750f-4bab-b975-38753a619e3a@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_011246_561437_FF801909 
X-CRM114-Status: GOOD (  15.18  )
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

SGkgQWxleGFuZHJlLAoKT24gNC8xLzI1IDExOjU2IFBNLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6
Cj4gSGkgV2lsbCwKPiAKPiBPbiAwMi8wNC8yMDI1IDA3OjM0LCB3Z3BpZXJjZTE3QGdtYWlsLmNv
bSB3cm90ZToKPj4gRnJvbTogV2lsbCBQaWVyY2UgPHdncGllcmNlMTdAZ21haWwuY29tPgo+Pgo+
PiBUaGUgbnVtYmVyIG9mIHJlbG9jYXRpb25zIG1heSBiZSBhIGh1Z2UgdmFsdWUgdGhhdCBpcyB1
bmFsbG9jYXRhYmxlCj4+IGJ5IGttYWxsb2MuIFVzZSBrdm1hbGxvYyBpbnN0ZWFkIHNvIHRoYXQg
aXQgZG9lcyBub3QgZmFpbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogV2lsbCBQaWVyY2UgPHdncGll
cmNlMTdAZ21haWwuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMg
fCA1ICsrKy0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCj4+IGluZGV4IDQ3ZDBlYmVlYzkzYy4uYmFlM2RiNTA2
NDdjIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwo+PiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwo+PiBAQCAtNjQ4LDcgKzY0OCw3IEBAIHByb2Nlc3Nf
YWNjdW11bGF0ZWRfcmVsb2NhdGlvbnMoc3RydWN0IG1vZHVsZSAqbWUsCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBrZnJlZShidWNrZXRfaXRlcik7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoCAtwqDCoMKg
IGtmcmVlKCpyZWxvY2F0aW9uX2hhc2h0YWJsZSk7Cj4+ICvCoMKgwqAga3ZmcmVlKCpyZWxvY2F0
aW9uX2hhc2h0YWJsZSk7Cj4+IMKgIH0KPj4gwqAgwqAgc3RhdGljIGludCBhZGRfcmVsb2NhdGlv
bl90b19hY2N1bXVsYXRlKHN0cnVjdCBtb2R1bGUgKm1lLCBpbnQgdHlwZSwKPj4gQEAgLTc1Miw3
ICs3NTIsOCBAQCBpbml0aWFsaXplX3JlbG9jYXRpb25faGFzaHRhYmxlKHVuc2lnbmVkIGludCBu
dW1fcmVsb2NhdGlvbnMsCj4+IMKgIMKgwqDCoMKgwqAgaGFzaHRhYmxlX3NpemUgPDw9IHNob3Vs
ZF9kb3VibGVfc2l6ZTsKPj4gwqAgLcKgwqDCoCAqcmVsb2NhdGlvbl9oYXNodGFibGUgPSBrbWFs
bG9jX2FycmF5KGhhc2h0YWJsZV9zaXplLAo+PiArwqDCoMKgIC8qIE51bWJlciBvZiByZWxvY2F0
aW9ucyBtYXkgYmUgbGFyZ2UsIHNvIGt2bWFsbG9jIGl0ICovCj4+ICvCoMKgwqAgKnJlbG9jYXRp
b25faGFzaHRhYmxlID0ga3ZtYWxsb2NfYXJyYXkoaGFzaHRhYmxlX3NpemUsCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2YoKipy
ZWxvY2F0aW9uX2hhc2h0YWJsZSksCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPj4gwqDCoMKgwqDCoCBpZiAoISpy
ZWxvY2F0aW9uX2hhc2h0YWJsZSkKPiAKPiAKPiBMZXQncyBhZGQgYSBmaXhlcyB0YWc6Cj4gCj4g
Rml4ZXM6IDhmZDZjNTE0MjM5NSAoInJpc2N2OiBBZGQgcmVtYWluaW5nIG1vZHVsZSByZWxvY2F0
aW9ucyIpCj4gCj4gU2luY2UgQ2zDqW1lbnQgc3VnZ2VzdGVkIHRoaXMgc29sdXRpb246Cj4gCj4g
U3VnZ2VzdGVkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gCj4g
QW5kIGZpbmFsbHksIHRoaXMgbG9va3MgZ29vZCB0byBtZSBzbzoKPiAKPiBSZXZpZXdlZC1ieTog
QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IAo+IEl0J3MgYSBiaXQg
bGF0ZSBmb3IgcmMxIHNvIEknbGwgdGFrZSB0aGlzIG9uZSBmb3IgYSBuZXh0IHJjLgo+IAo+IFRo
YW5rcyBmb3IgdGhlIHBhdGNoIQo+IAo+IEFsZXgKPiAKPiAKClRoYW5rIHlvdSBmb3IgY2hlY2tp
bmcuIEkgd2lsbCBzZW5kIGEgdjIgd2l0aCB0aGVzZSBhZGRpdGlvbnMgYW5kCmEgbWlub3Igd2hp
dGVzcGFjZSBmaXggcmlnaHQgbm93LgoKLSBXaWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
