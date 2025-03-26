Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84395C3600E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 22:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BDqF9BB36liElFrDIIyMr+/HxhKuuHZh0iI7Apq2oig=; b=LDwkT4VhLgKt5hRy4JyNX1FEbr
	+pRQqApAIB5MECJE/8nyBL19uv+DAXQ1Itc86d9JW7F6KNdtJycgvYFuXju04mIIv8nD7EUjyrlot
	EeK9dIYsy6JwlqgiAUMXLNP+NmGvQ3fkOO6an8i/r1leItFkXcnN4U29XZ0MYxqzqPvEMjhH7zJ9H
	DsBLNUo1lScJcbY9bcQDXNlvuHR9soERfcZbZ3skAl283/wHlnNlIYm3ztPEfyGwIqUaCiFiwzTDq
	kxGkz7uyJq3XdmkqtrfD8OzwmcrA1SFEFZn5Q9KThElEYDnNDdqFzr5kopMoWOkYNl3xyXVlwqc0d
	hY4wcnvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txZXL-00000009joL-0if5;
	Wed, 26 Mar 2025 22:47:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txZXH-00000009jnW-33Qq
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 22:47:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-227c7e57da2so6686995ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Mar 2025 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1743029266; x=1743634066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENYvbfpYW1FRwv+5fNWWoBDVfb51NMkn/35jJNBxxwA=;
        b=cDW2yTw3/cXwjAm6lJj1Ka2obQ1tuyflg9A34I0Lqus6iEEDGqEoPL3JSKY8RzZX5m
         Bih+tr3ZGq8I9feyROyeijjMAwdp1o0hGECXADISe3SbehEOnxFjE51488YL8PQr2KX2
         4UFSLgL2GLvYHN78CuxYdG/kcAwMVv7exht+bLeHLfHggF07g54aiIUnK+pLaylw9P39
         7njy8yKI7xNeq+7lFLOAzsj8SqhC7FOTEbcX1VmxzeH1CTgTLNIx3Zjmb6kgyOw3TyJM
         T1treoF5TekpNFWaQ+G+cRM9JjVke+YhzdKQKKE5C5Bo/f/ZoXy+CjKZozRlDXxphcXd
         fgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743029266; x=1743634066;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENYvbfpYW1FRwv+5fNWWoBDVfb51NMkn/35jJNBxxwA=;
        b=hh0ZwvaFd+zafw8oNfEfIaTjsCZkAPIy82xQ8wdRw+4XRXTRmI2og6F/mXgouihtKL
         51unADq540NU7Qg44SxZ2bxNtnoeWrwHwIsvX+dFpqYRRqlhjz1tlatfQCacexmuZoHm
         1vbZ3isfW8Z45RI0C/w6qV+Kttqu9yaKuX4CHBkyIFqH6uAyRIF3bVghcXzSqc7HtFkX
         L36/tQdNc3DmOQt12xGajwOGVp3KSs9xLzykWEcpc5viQr06Ra09JH3Bvh/eq0jk6LYS
         uxccOzFRcKaZudr1hyZ3/kXM28uREIxA8oSRG0czR4JqFc3ryNefKcRbk+IGIBF7f6Ra
         g/hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU2zAp3olgYZ6PaCk94oIK6jhNtl98KR54O7GuWxVS9ZAgQ4jTaDKWlZyhWWOyZ4YqVNMP1V94Up673w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzG4IXO9BTRCk34fyVenyXNkCLtvzidPR6DvX6XxT0P06s6mdoG
	Rfj1lXVfyLs3EsGSaZrO2E4KRBBAfS7AKdYUNldg5c4u8+IANjQ7w1ZA+F7XNrU=
X-Gm-Gg: ASbGncvT65HVCqHB8F1A7T2g4WrgGYzBc4K0JQ6UjL7LK2HwfoG3DIk+3RuuMq4l1RW
	KbmPM/Ki1SZw1Za1Pf2MnJSYRrI299yYktj9LTdetZ0ohEZTAwFwKb3tEBR4R3CWUk/g4DIEL1D
	32dxCfCoAWUQ1Qj4j07q6ho5WLrLz/2hbO2R9GOs/vpPgnQMsW+t6+ZBm0xQl6GdsjvHfKqKO+k
	GwAAame4UR6Sau21f5wQC1zlKVKrcwYBiC0VrEBXg5ZAlvLnm798ZYdmbErkMGxfPnuDyWqcueL
	XRt4mBuG9DnZsWozxpjxvfKiKDQox4gGVJF1YHLmRiDj13hNJ2ST
X-Google-Smtp-Source: AGHT+IEvXt3oSJ/F1fAesg3sth848fXdJQyiT5KFcCnd7670HL/7uTbeEUUKEITdtFQDQ4zqX3fqHg==
X-Received: by 2002:a05:6a00:3a1e:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-739610bdb9dmr1453432b3a.15.1743029266324;
        Wed, 26 Mar 2025 15:47:46 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390615618fsm13249198b3a.146.2025.03.26.15.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 15:47:45 -0700 (PDT)
Date: Wed, 26 Mar 2025 15:47:45 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Mar 2025 15:45:24 PDT (-0700)
Subject: Re: [PATCH 0/6] riscv: Relocatable NOMMU kernels
In-Reply-To: <60900b42-298c-4b9f-86cf-af31aa5a02d3@sifive.com>
CC: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  akpm@linux-foundation.org, Arnd Bergmann <arnd@arndb.de>, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-517c0318-c8fb-4c4a-aa0e-0d08f8d34d78@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_154748_031150_96542F54 
X-CRM114-Status: GOOD (  19.65  )
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

T24gV2VkLCAyNiBGZWIgMjAyNSAwNzoyMjo1MSBQU1QgKC0wODAwKSwgc2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbSB3cm90ZToKPiBIaSBQYWxtZXIsCj4KPiBPbiAyMDI1LTAyLTEzIDg6MTcgQU0s
IFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+PiBPbiBTYXQsIDI2IE9jdCAyMDI0IDEwOjEzOjUyIFBE
VCAoLTA3MDApLCBzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tIHdyb3RlOgo+Pj4gQ3VycmVudGx5
LCBSSVNDLVYgTk9NTVUga2VybmVscyBhcmUgbGlua2VkIGF0IENPTkZJR19QQUdFX09GRlNFVCwg
YW5kCj4+PiBzaW5jZSB0aGV5IGFyZSBub3QgcmVsb2NhdGFibGUsIG11c3QgYmUgbG9hZGVkIGF0
IHRoaXMgYWRkcmVzcyBhcyB3ZWxsLgo+Pj4gQ09ORklHX1BBR0VfT0ZGU0VUIGlzIG5vdCBhIHVz
ZXItdmlzaWJsZSBLY29uZmlnIG9wdGlvbiwgc28gaXRzIHZhbHVlIGlzCj4+PiBub3Qgb2J2aW91
cywgYW5kIHVzZXJzIG11c3QgcGF0Y2ggdGhlIGtlcm5lbCBzb3VyY2UgaWYgdGhleSB3YW50IHRv
IGxvYWQKPj4+IGl0IGF0IGEgZGlmZmVyZW50IGFkZHJlc3MuCj4+Pgo+Pj4gTWFrZSBOT01NVSBr
ZXJuZWxzIG1vcmUgcG9ydGFibGUgYnkgbWFraW5nIHRoZW0gcmVsb2NhdGFibGUgYnkgZGVmYXVs
dC4KPj4+IFRoaXMgYWxsb3dzIGEgc2luZ2xlIGtlcm5lbCBiaW5hcnkgdG8gd29yayB3aGVuIGxv
YWRlZCBhdCBhbnkgYWRkcmVzcy4KPj4+Cj4+Pgo+Pj4gU2FtdWVsIEhvbGxhbmQgKDYpOgo+Pj4g
wqAgcmlzY3Y6IFJlbW92ZSBkdXBsaWNhdGUgQ09ORklHX1BBR0VfT0ZGU0VUIGRlZmluaXRpb24K
Pj4+IMKgIHJpc2N2OiBBbGxvdyBOT01NVSBrZXJuZWxzIHRvIGFjY2VzcyBhbGwgb2YgUkFNCj4+
PiDCoCByaXNjdjogU3VwcG9ydCBDT05GSUdfUkVMT0NBVEFCTEUgb24gTk9NTVUKPj4+IMKgIGFz
bS1nZW5lcmljOiBBbHdheXMgZGVmaW5lIEVsZl9SZWwgYW5kIEVsZl9SZWxhCj4+PiDCoCByaXNj
djogU3VwcG9ydCBDT05GSUdfUkVMT0NBVEFCTEUgb24gcmlzY3YzMgo+Pj4gwqAgcmlzY3Y6IFJl
bW92ZSBDT05GSUdfUEFHRV9PRkZTRVQKPj4+Cj4+PiDCoGFyY2gvcmlzY3YvS2NvbmZpZ8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArLS0tCj4+PiDCoGFyY2gvcmlzY3YvTWFrZWZp
bGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAtCj4+PiDCoGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGFnZS5owqDCoMKgIHwgMjcgKysrKy0tLS0tCj4+PiDCoGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oIHzCoCA2ICstCj4+PiDCoGFyY2gvcmlzY3YvbW0vaW5pdC5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgOTcgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0KPj4+IMKgaW5jbHVkZS9hc20tZ2VuZXJpYy9tb2R1bGUuaMKgwqDCoMKgIHzCoCA4IC0tLQo+
Pj4gwqA2IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDgxIGRlbGV0aW9ucygtKQo+
Pgo+PiBJJ20gZ2V0dGluZyBzb21lIGJ1aWxkIGZhaWx1cmVzCj4+Cj4+IHJpc2N2NjQtdW5rbm93
bi1saW51eC1nbnUtbGQ6IGFyY2gvcmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEubzogcmVsb2Nh
dGlvbgo+PiBSX1JJU0NWX0hJMjAgYWdhaW5zdCBgdGxiX2ZsdXNoX2FsbF90aHJlc2hvbGQnIGNh
biBub3QgYmUgdXNlZCB3aGVuIG1ha2luZyBhCj4+IHNoYXJlZCBvYmplY3Q7IHJlY29tcGlsZSB3
aXRoIC1mUElDCj4+IHJpc2N2NjQtdW5rbm93bi1saW51eC1nbnUtbGQ6IGFyY2gvcmlzY3YvZXJy
YXRhL3RoZWFkL2VycmF0YS5vOiByZWxvY2F0aW9uCj4+IFJfUklTQ1ZfSEkyMCBhZ2FpbnN0IGBy
aXNjdl9jYm9tX2Jsb2NrX3NpemUnIGNhbiBub3QgYmUgdXNlZCB3aGVuIG1ha2luZyBhCj4+IHNo
YXJlZCBvYmplY3Q7IHJlY29tcGlsZSB3aXRoIC1mUElDCj4KPiBXaGF0IHRvb2xjaGFpbiBhbmQg
Y29uZmlnIGRvIHlvdSBzZWUgZmFpbHVyZXMgd2l0aD8gSSBoYXZlIHRyaWVkIGJ1aWxkaW5nIHRo
aXMKPiBzZXJpZXMgb24gdG9wIG9mIHY2LjE0LXJjNCB3aXRoIEdDQyAxNC4yLjEgYW5kCj4gICog
ZGVmY29uZmlnCj4gICogZGVmY29uZmlnICsgTk9NTVUgKyBTLW1vZGUKPiAgKiBkZWZjb25maWcg
KyBOT01NVSArIE0tbW9kZQo+ICAqIGRlZmNvbmZpZyArIDMyLWJpdAo+ICAqIGRlZmNvbmZpZyAr
IDMyLWJpdCArIE5PTU1VICsgUy1tb2RlCj4gICogZGVmY29uZmlnICsgMzItYml0ICsgTk9NTVUg
KyBNLU1vZGUKPiAgKiBub21tdV9rMjEwX2RlZmNvbmZpZwo+ICAqIG5vbW11X2syMTBfc2RjYXJk
X2RlZmNvbmZpZwo+ICAqIG5vbW11X3ZpcnRfZGVmY29uZmlnCj4gYW5kIGFsbCBzdWNjZWVkLgoK
cnYzMiBhbGxtb2Rjb25maWcgZG9lcyBpdC4KCkkgZG9uJ3QgYWN0dWFsbHkga25vdyB3aGF0J3Mg
Z29pbmcgb24sIGJ1dCBpdCBzZWVtcyB0aGF0IHNvbWV0aGluZyBpbiAKS2NvbmZpZyBsYW5kIGhh
cyBmbGlwcGVkIG92ZXIgYW5kIGVuZGVkIHVwIGJ1aWxkaW5nIG1lZGxvdyB3aXRoIHRoZXNlLiAg
ClRoZSBlcmF0YSBoYW5kbGluZyBjYW4ndCBiZSBwcm9wZXIgUElDIChzZWUgOGRjMmE3ZTgwMjdm
ICgicmlzY3Y6IEZpeCAKcmVsb2NhdGFibGUga2VybmVscyB3aXRoIGVhcmx5IGFsdGVybmF0aXZl
cyB1c2luZyAtZm5vLXBpZSIpKSwgYnV0IHRoYXQgCm9uZSB3YXMganVzdCB3cm9uZyAtLSB0aGV5
IG5lZWQgdG8gYmUgbWVkYW55LCBvdGhlcndpc2UgdGhleSdyZSAKdmVyeS1ub24tcmVsb2NhdGFi
bGUuCgpJIGZlZWwgbGlrZSBpdCdzIHBvc3NpYmxlIHRvIGNvbnN0cnVjdCBLY29uZmlncyB0aGF0
IGJyZWFrIHRoaXMgd2l0aG91dCAKeW91ciBwYXRjaCBzZXQsIGJ1dCBub3QgMTAwJSBzdXJlIHRo
ZXJlLiAgRWl0aGVyIHdheSBJIHNlbnQgYSBwYXRjaAo8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjUwMzI2MjI0NTA2LjI3MTY1LTItcGFsbWVyQHJpdm9zaW5jLmNvbS8+Cgo+Cj4gUmVn
YXJkcywKPiBTYW11ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
