Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D43BC5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 20:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X97f9Mcem27sZXfYMbXob4d5ywb7yuqM8bdOULH10RI=; b=iH8OlTbWJisp2X
	jP7bamJbahkh0Ji55Acu6Yp7RN+Iy6x56ZDiLGIduHmzbuOCJOg/5vcygHgQyKFy0CpXlMu+t3xU/
	YZ3FN/McObmw3AOwSVBTCNI8jdMJPOJPGud2WsQ89b2R566KWeLGk3iQ6BJS70D6uEgVGkrRyAKoA
	4kMM+cXrSvY9i7hhKqhSgKkqp9HDLk5movsblLnk8orJnXCJ4P+s98p2ZQEr23C7yV3Y6MP+4vL5R
	11tBF3A8RlDOA3yJyNMvxLLXJ+nPcOaiRozd94NeUZEjUMsRhGDYa0EGWzS/YRWJOG4XTPtJwGpAK
	3o9dG+ovlZTo79nbwgkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf3dz-00000006iNY-3W5W;
	Tue, 27 Feb 2024 20:01:39 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf3dw-00000006iMP-45G0
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 20:01:38 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7c78b520bc3so172684739f.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 12:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709064096; x=1709668896; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JCoSqCHOuyJdrEXgcSRyyHnAhXtrU9sHKBBcP3u4W04=;
        b=l+KBnpr4DLGfOFLRkhSy63+u6lHcHwRyyfVDN4xQLzHi8D8uGggMnPVJF5BJHia5He
         ri+CRncfRYWtC6e32pE7fQwJJvun2esGormfW2zpumiyrlfVuSfpwHSGgvwS9D3k3nzE
         9Er84fhy2m/9KjvS7FA1HlONlG/Ub0+j2k51jP788H6omPp4I0giH+nhAfrVStwDep91
         cmfEMwzXduLFl1OnbC7JHaQAIPzQgpdiAmuKQ0CAHMQKImuC7Z+rkiMbt1yHyAw4UTX5
         XyG1wTt3Vk3VFmU88ovm94rP3jY6xuVj1SJwjUYLBsNq4ufdy7lPzmHUvQO4e8s6AIXn
         mAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709064096; x=1709668896;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JCoSqCHOuyJdrEXgcSRyyHnAhXtrU9sHKBBcP3u4W04=;
        b=QBcN0rlu1Sd5KGekaYfXT4s2DFIL41QXlaLvw8ig5WrLMAUPoo95f76ktW8PrDbo8G
         tytLzbn83wmp5VMljuyjXQHwVUS/BciNLSAM1WKHOTs4uuLXPOQGj8R5lT4JPI+Ix066
         LFizU27uYO7AhzV/IBtxeZ4iEVrLm9DDxHDxcEminTmByAt94oUk3rfBzEmnMC5MSHD/
         5dGJgrh09pejhpb7lZzgNG5NRFqFN/iwYRxMEpgiipiHknbKZQZJpo0gS1i34ssvwW3e
         hPbzhZaojy+AV1B0q48H92Hmw8AmhyC6ULdNC0Xso5FWm7SbsjCE9QeOVSZ+DArDw00V
         UMCg==
X-Forwarded-Encrypted: i=1; AJvYcCWUqnNh1aKBoHzNuy58p8/v5IUD8hKwBJSZz9qnxh2lsxYCUYy5gKI3G2QTEYTtZYXF1pI1JBJoeEMACQXfDc6I8RCVOMrRqvuR+CAF/byp
X-Gm-Message-State: AOJu0YysNhjJzUr4urBGapfZhkB5CStWKvgLor0On/tSIPWKnOcZFwMZ
	hREnULjHSicBbAzbPBxqA0hBvLh/pEnf8G0va4Td7eqY+VBilIGxs00KCAfyG3g=
X-Google-Smtp-Source: AGHT+IG5+tdMrZ2ON9H8ZpGLg3GIka4FUXbeapzA9mauWtoPzhwuW9kisXtyN8OVl6ignL92UATEaA==
X-Received: by 2002:a6b:3f8a:0:b0:7c7:97a0:d2f4 with SMTP id m132-20020a6b3f8a000000b007c797a0d2f4mr11694640ioa.9.1709064095809;
        Tue, 27 Feb 2024 12:01:35 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.200])
        by smtp.gmail.com with ESMTPSA id y90-20020a029563000000b004740d29b120sm1936267jah.111.2024.02.27.12.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 12:01:35 -0800 (PST)
Message-ID: <33f16905-baab-47e8-a92f-d2543b69d704@sifive.com>
Date: Tue, 27 Feb 2024 14:01:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes v3 1/2] riscv: Fix enabling cbo.zero when running
 in M-mode
Content-Language: en-US
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 Stefan O'Rear <sorear@fastmail.com>, stable@vger.kernel.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240214090206.195754-1-samuel.holland@sifive.com>
 <20240214090206.195754-2-samuel.holland@sifive.com>
 <20240214-661604d82db4ef137540b762@orel>
 <579c9f3f-8c28-4e4e-88ce-9f266597b7bd@ghiti.fr>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <579c9f3f-8c28-4e4e-88ce-9f266597b7bd@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_120137_137347_208698D5 
X-CRM114-Status: GOOD (  17.80  )
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

SGkgQWxleCwKCk9uIDIwMjQtMDItMjcgMTo0OCBQTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+
IEhpIFNhbXVlbCwKPiAKPiBPbiAxNC8wMi8yMDI0IDEwOjI4LCBBbmRyZXcgSm9uZXMgd3JvdGU6
Cj4+IE9uIFdlZCwgRmViIDE0LCAyMDI0IGF0IDAxOjAxOjU2QU0gLTA4MDAsIFNhbXVlbCBIb2xs
YW5kIHdyb3RlOgo+Pj4gV2hlbiB0aGUga2VybmVsIGlzIHJ1bm5pbmcgaW4gTS1tb2RlLCB0aGUg
Q0JaRSBiaXQgbXVzdCBiZSBzZXQgaW4gdGhlCj4+PiBtZW52Y2ZnIENTUiwgbm90IGluIHNlbnZj
ZmcuCj4+Pgo+Pj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+Pj4gRml4ZXM6IDQzYzE2
ZDUxYTE5YiAoIlJJU0MtVjogRW5hYmxlIGNiby56ZXJvIGluIHVzZXJtb2RlIikKPj4+IFJldmll
d2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+Pj4gU2lnbmVk
LW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4+PiAt
LS0KPj4+Cj4+PiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPj4+Cj4+PiDCoCBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2Nzci5owqDCoCB8IDIgKysKPj4+IMKgIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYyB8IDIgKy0KPj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3NyLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4+PiBpbmRleCA1MTAwMTQwNTFm
NWQuLjI0NjhjNTU5MzNjZCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3NyLmgKPj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPj4+IEBAIC00MjQs
NiArNDI0LDcgQEAKPj4+IMKgICMgZGVmaW5lIENTUl9TVEFUVVPCoMKgwqAgQ1NSX01TVEFUVVMK
Pj4+IMKgICMgZGVmaW5lIENTUl9JRcKgwqDCoMKgwqDCoMKgIENTUl9NSUUKPj4+IMKgICMgZGVm
aW5lIENTUl9UVkVDwqDCoMKgIENTUl9NVFZFQwo+Pj4gKyMgZGVmaW5lIENTUl9FTlZDRkfCoMKg
wqAgQ1NSX01FTlZDRkcKPj4+IMKgICMgZGVmaW5lIENTUl9TQ1JBVENIwqDCoMKgIENTUl9NU0NS
QVRDSAo+Pj4gwqAgIyBkZWZpbmUgQ1NSX0VQQ8KgwqDCoCBDU1JfTUVQQwo+Pj4gwqAgIyBkZWZp
bmUgQ1NSX0NBVVNFwqDCoMKgIENTUl9NQ0FVU0UKPj4+IEBAIC00NDgsNiArNDQ5LDcgQEAKPj4+
IMKgICMgZGVmaW5lIENTUl9TVEFUVVPCoMKgwqAgQ1NSX1NTVEFUVVMKPj4+IMKgICMgZGVmaW5l
IENTUl9JRcKgwqDCoMKgwqDCoMKgIENTUl9TSUUKPj4+IMKgICMgZGVmaW5lIENTUl9UVkVDwqDC
oMKgIENTUl9TVFZFQwo+Pj4gKyMgZGVmaW5lIENTUl9FTlZDRkfCoMKgwqAgQ1NSX1NFTlZDRkcK
Pj4+IMKgICMgZGVmaW5lIENTUl9TQ1JBVENIwqDCoMKgIENTUl9TU0NSQVRDSAo+Pj4gwqAgIyBk
ZWZpbmUgQ1NSX0VQQ8KgwqDCoCBDU1JfU0VQQwo+Pj4gwqAgIyBkZWZpbmUgQ1NSX0NBVVNFwqDC
oMKgIENTUl9TQ0FVU0UKPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4+IGluZGV4IDg5OTIwZjg0
ZDBhMy4uYzViMTNmN2RkNDgyIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPj4+IEBA
IC05NTAsNyArOTUwLDcgQEAgYXJjaF9pbml0Y2FsbChjaGVja191bmFsaWduZWRfYWNjZXNzX2Fs
bF9jcHVzKTsKPj4+IMKgIHZvaWQgcmlzY3ZfdXNlcl9pc2FfZW5hYmxlKHZvaWQpCj4+PiDCoCB7
Cj4+PiDCoMKgwqDCoMKgIGlmIChyaXNjdl9jcHVfaGFzX2V4dGVuc2lvbl91bmxpa2VseShzbXBf
cHJvY2Vzc29yX2lkKCksCj4+PiBSSVNDVl9JU0FfRVhUX1pJQ0JPWikpCj4+PiAtwqDCoMKgwqDC
oMKgwqAgY3NyX3NldChDU1JfU0VOVkNGRywgRU5WQ0ZHX0NCWkUpOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIGNzcl9zZXQoQ1NSX0VOVkNGRywgRU5WQ0ZHX0NCWkUpOwo+Pj4gwqAgfQo+Pj4gwqAgwqAg
I2lmZGVmIENPTkZJR19SSVNDVl9BTFRFUk5BVElWRQo+Pj4gLS3CoAo+Pj4gMi40My4wCj4+Pgo+
PiBBZnRlciBvdXIgYmFjayBhbmQgZm9ydGggb24gaG93IHdlIGRldGVybWluZSB0aGUgZXhpc3Rl
bmNlIG9mIHRoZSAqZW52Y2ZnCj4+IENTUnMsIEkgd29uZGVyIGlmIHdlIHNob3VsZG4ndCBwdXQg
YSBjb21tZW50IGFib3ZlIHRoaXMKPj4gcmlzY3ZfdXNlcl9pc2FfZW5hYmxlKCkgZnVuY3Rpb24g
Y2FwdHVyaW5nIHRoZSBbY3VycmVudF0gZGVjaXNpb24uCj4+Cj4+IFNvbWV0aGluZyBsaWtlCj4+
Cj4+IMKgIC8qCj4+IMKgwqAgKiBXaGlsZSB0aGUgW21zXWVudmNmZyBDU1JzIHdlcmVuJ3QgZGVm
aW5lZCB1bnRpbCBwcml2IHNwZWMgMS4xMiwKPj4gwqDCoCAqIHRoZXkncmUgYXNzdW1lZCB0byBi
ZSBwcmVzZW50IHdoZW4gYW4gZXh0ZW5zaW9uIGlzIHByZXNlbnQgd2hpY2gKPj4gwqDCoCAqIHNw
ZWNpZmllcyBbbXNdZW52Y2ZnIGJpdChzKS4gSGVuY2UsIHdlIGRvbid0IGRvIGFueSBhZGRpdGlv
bmFsCj4+IMKgwqAgKiBwcml2IHNwZWMgdmVyc2lvbiBjaGVja3Mgb3IgQ1NSIHByb2JlcyBoZXJl
Lgo+PiDCoMKgICovCj4gCj4gCj4gSSB3YXMgYWJvdXQgdG8gcmVhZCB0aGUgd2hvbGUgZGlzY3Vz
c2lvbiBpbiB2MiB0byB1bmRlcnN0YW5kIHRoZSB2My4uLnRoYW5rIHlvdQo+IERyZXcgOikgSSB0
aGluayBpdCByZWFsbHkgbWFrZXMgc2Vuc2UgdG8gYWRkIHRoaXMgY29tbWVudCwgZG8geW91IGlu
dGVuZCB0byBkbwo+IHNvIFNhbXVlbD8KClllcywgSSBhbSBhYm91dCB0byBzZW5kIGEgdjQgd2l0
aCB0aGUgY2hhbmdlcyBmcm9tIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uLAppbmNsdWRpbmcgYSBS
SVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRyBiaXQgc3BlY2lmaWNhbGx5IGZvciB0aGUgcHJlc2Vu
Y2Ugb2YgdGhlClttc11lbnZjZmcgQ1NSIGFuZCBhIGNvbW1lbnQgbGlrZSB0aGUgYWJvdmUuCgpS
ZWdhcmRzLApTYW11ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
