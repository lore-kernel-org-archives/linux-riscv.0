Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB070C021A4
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 17:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKKDp8viNphOu6GhCO1v1uBhXHGIilJ++D7wc7iCESs=; b=pmy49Su/PzRxlT
	Mdv39uS2Ovnd6QRkAYBX3BGzWpHoWdWEfdo359fSstInZFBLPEG44O3N+URbbJSR2ObF+/id03RmE
	YrCtlj5UzCjoS5fWNkT3s8Ox+zpfSdhW0SL9MKMDB4Eb5RRzm1NWYD21KpE+N5jvzonGc8WO1eVJh
	q/Z299Pp/vlSZyRWvmF1lRHXja9Rav6YqOufkZ8KD9n4Tk9gPkEAzTZd0QdjjI/OyXYMCKk88n6Wz
	UTGP5Z+ng+FWf4qf2ORngqYJ9fCZ0Y8hdotgCWSOqDccHj6mf1Bqq7rdkbNG7ysyZT+zYRgIrhTEo
	1ChvW12Ep6EorRnzrNJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGuN-00000008OGy-30IH;
	Wed, 12 Feb 2025 17:52:23 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGma-00000008MkQ-2DFO;
	Wed, 12 Feb 2025 17:44:21 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aaec61d0f65so10244866b.1;
        Wed, 12 Feb 2025 09:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739382259; x=1739987059; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HrtreOGrFy6HHZfLsMe2zUZL1+PbB03myiiB0TLgJeY=;
        b=Gk/V4Q9e6l5USJK+MDd3VPJ9Wi44vtbvLAF894ZjAEq8oc6Nom+gTF/UFw5KGkhJiO
         sHIGxVRYn/XqjQmGuufM9CHHUUPHkhc9sE21b04WNOkIf35A0QE6vUsSof0A7UtzM40M
         sSL+yAJ3JjaQ0TWibaHWfcVT1ZrJAXqxSPeOl8G6R/BVnybgy4txl/jG0yP7pVVu8Ji4
         S/6TUnxkTroTZKIJzPtybrBHdjpa/7vdvZPy3WEW1wahAeciuq0uuZeACOb3/IUn7OBr
         zK6FDK1MbBez32nOoXLiIziIni2BirQk7YVChSa52vW8D2rPoz/03sNF0/rqvlnkx6Xv
         VVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739382259; x=1739987059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrtreOGrFy6HHZfLsMe2zUZL1+PbB03myiiB0TLgJeY=;
        b=m8pMET4ipQvziJkOZoCVcC/KXB8ynLbS/MqEskQ1MscRU4eAr4jN2oN6fpqIufzk2Z
         AJpkQ9BBHOwwvtXixrqZ6w2fTCOZ3Kb+8TscCtSzJ68m7y8D5eIGPWNvAAj4MrLoFfbj
         B2IjGhM6mb0nh4B/m6W/XhK0mnbEm6QkJCvmJxbEX1iDxaT/7jOTEBHGaDsvoql3ZKxS
         T9mZ4RSXFNYA31RRlYa1qaBhaMiWBA//3CRlvnLkxFMOQ54bYUClJsZ5B0eRQI0UwT0b
         85XZv40WiIHD26TtJKsEuJu1kO1MqDvQta9GyyzwBL6FvaDL5ccL4TzGrDIlyFXzsw8s
         1FYg==
X-Forwarded-Encrypted: i=1; AJvYcCXBXkbTK8fZbQU0+DG+eNSWwd5xjUF8qRq2/8icvKHmGg6Zo6VeEyV8kG7o6rrwoxtaLgFtWGKks7OhzD0=@lists.infradead.org, AJvYcCXfEkBIF36f6ctY6J0U/EiH9s+wex1k5nV2UZ2FLZVTlVqPkgp5Vp1TcSzyzPDE50kMrs48VDyj6UuH24IhWn4M@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3DVR1ODc58A/LZdrBJa6kp4rtOR07ZOfUiM3wDU/QddgaB6W4
	2lTiRaF7i0cP8TOeUs7r4jLdNU95f2XzlLc6Gqny0LTzWQzcB1V3
X-Gm-Gg: ASbGncsj4tIQ+wfejqPeC6ZtzEjJ4CJLOdW3VfA1EyK3FIJfQ+6G6dyIxghX99y5pEs
	ZTXzopXKFDRGaWAFrYadvO8WAKpPQ0gHPh+EImmy6g1eukHYsfmGEIYNkC0lO5IS5r7f3XImGV7
	l1ryyWASYzh6EZAsJ8zKnxDhB7JjaFEDkNAOvoAokHrCWvZQ+d5u3jnf/SeM5q82jwNkHtqCzqx
	pO4H+hzd8o1wnMwHTrqSat3L/6CripdPL8Uk0zUMorcXb2w1BTGjSwhYs5kxb3/bwi+8Z6NzYbo
	4YmFcJeQ7eIngnv+YEszP4n9saYwMVUU
X-Google-Smtp-Source: AGHT+IGXiN90fqBBtXBKAJxfVWN6FjbS5WH82cFrumS6AyosF6uuHB+mpyekgQzZiYjWjwTT1PPBcw==
X-Received: by 2002:a17:907:da3:b0:ab7:cc43:c52a with SMTP id a640c23a62f3a-aba501ab6aemr1428966b.52.1739382258565;
        Wed, 12 Feb 2025 09:44:18 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ba97704dsm719671166b.107.2025.02.12.09.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:44:18 -0800 (PST)
Message-ID: <26ddcdaadd777f170dbab51ab840c899f0edde24.camel@gmail.com>
Subject: Re: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto
 <inochiama@gmail.com>, 	soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Haylen Chu	 <heylenay@outlook.com>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley	
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Chao Wei	
 <chao.wei@sophgo.com>
Date: Wed, 12 Feb 2025 18:44:15 +0100
In-Reply-To: <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
	 <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
	 <uvy62iqzul6kajzsmiaovdzogftcsc5b53cswkv4cbxh4w6som@32libbd7kffq>
	 <708cdc497b8474609989395dbf8a0898037a22de.camel@gmail.com>
	 <33654180-5488-4601-9103-8e4218c4a198@kernel.org>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_094420_567318_16A4A52C 
X-CRM114-Status: GOOD (  26.11  )
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

SGkgCgpPbiBXZWQsIDIwMjUtMDItMTIgYXQgMTc6NDYgKzAxMDAsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4gPiA+ID4gTWFrZSB0aGUgcGVyaXBoZXJhbCBkZXZpY2UgdHJlZSByZS11c2Fi
bGUgb24gQVJNNjQgcGxhdGZvcm0gYnkgbW92aW5nIENQVQo+ID4gPiA+IGNvcmUgYW5kIGludGVy
cnVwdCBjb250cm9sbGVycycgcGFydHMgaW50byB0aGUgcmVzcGVjdGl2ZSBwZXItU29DIC5kdHNp
Cj4gPiA+ID4gZmlsZXMuCj4gPiA+ID4gCj4gPiA+ID4gQWRkIFNPQ19QRVJJUEhFUkFMX0lSUSgp
IG1hY3JvIHdoaWNoIGV4cGxpY2l0bHkgbWFwcyBwZXJpcGhlcmFsIG51YmVyaW5nCj4gPiA+ID4g
aW50byAicGxpYyIgaW50ZXJydXB0LWNvbnRyb2xsZXIgbnVtYmVyaW5nLgo+ID4gPiA+IAo+ID4g
PiA+IEhhdmUgYSBuaWNlIHJlZmFjdG9yaW5nIHNpZGUtZWZmZWN0IHRoYXQgInBsaWMiIGFuZCAi
Y2xpbnQiICJjb21wYXRpYmxlIgo+ID4gPiA+IHByb3BlcnR5IGlzIG5vdCBzcGVjaWZpZWQgb3V0
c2lkZSBvZiB0aGUgY29ycmVzcG9uZGluZyBkZXZpY2UgaXRzZWxmLgo+ID4gPiA+IAo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdt
YWlsLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiBDaGFuZ2Vsb2c6Cj4gPiA+ID4gdjI6Cj4gPiA+
ID4gLSBpbnN0ZWFkIG9mIGNhcnZpbmcgb3V0IHBlcmlwaGVyYWxzJyBwYXJ0LCBjYXJ2ZSBvdXQg
QVJDSC1zcGVjaWZpY3MgKENQVQo+ID4gPiA+IGNvcmUsIGludGVycnVwdCBjb250cm9sbGVycykg
YW5kIHNwcmVhZCB0aGVtIGFtb25nIDMgU29DIC5kdHNpIGZpbGVzIHdoaWNoCj4gPiA+ID4gaW5j
bHVkZWQgY3YxOHh4LmR0c2k7Cj4gPiA+ID4gLSBkZWZpbmUgYSBsYWJlbCBmb3IgdGhlICJzb2Mi
IG5vZGUgYW5kIHVzZSBpdCBpbiB0aGUgbmV3bHkgaW50cm9kdWNlZCBEVHM7Cj4gPiA+ID4gCj4g
PiA+ID4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2nCoMKgwqAgfCA2
NCArKysrKysrKysrKystLS0KPiA+ID4gPiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2
MTgxMmguZHRzacKgwqDCoCB8IDY0ICsrKysrKysrKysrKy0tLQo+ID4gPiA+IMKgYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vY3YxODF4LmR0c2nCoMKgwqDCoCB8wqAgMiArLQo+ID4gPiA+IMKg
YXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxOHh4LWNwdS5kdHNpIHwgNTcgKysrKysrKysr
KysrKysKPiA+ID4gPiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTh4eC5kdHNpwqDC
oMKgwqAgfCA5MSArKysrKystLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gwqBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NvcGhnby9zZzIwMDIuZHRzacKgwqDCoMKgIHwgNjQgKysrKysrKysrKysrLS0tCj4g
PiA+ID4gwqA2IGZpbGVzIGNoYW5nZWQsIDI0MCBpbnNlcnRpb25zKCspLCAxMDIgZGVsZXRpb25z
KC0pCj4gPiA+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3Bo
Z28vY3YxOHh4LWNwdS5kdHNpCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29w
aGdvL2N2MTgwMGIuZHRzaQo+ID4gPiA+IGluZGV4IGFhMWY1ZGYxMDBmMC4uZWVmMjg4NGIzNmY5
IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIu
ZHRzaQo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRz
aQo+ID4gPiA+IEBAIC0zLDYgKzMsOCBAQAo+ID4gPiA+IMKgICogQ29weXJpZ2h0IChDKSAyMDIz
IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiA+ID4gPiDCoCAqLwo+ID4gPiA+
IMKgCj4gPiA+ID4gKyNkZWZpbmUgU09DX1BFUklQSEVSQUxfSVJRKG5yKQkoKG5yKSArIDE2KQo+
ID4gPiA+ICsKPiA+ID4gPiDCoCNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwt
Y3YxODAwYi5oPgo+ID4gPiA+IMKgI2luY2x1ZGUgImN2MTh4eC5kdHNpIgo+ID4gPiA+IMKgCj4g
PiA+ID4gQEAgLTE0LDIyICsxNiw2MiBAQCBtZW1vcnlAODAwMDAwMDAgewo+ID4gPiA+IMKgCQly
ZWcgPSA8MHg4MDAwMDAwMCAweDQwMDAwMDA+Owo+ID4gPiA+IMKgCX07Cj4gPiA+ID4gwqAKPiA+
ID4gCj4gPiA+ID4gLQlzb2Mgewo+ID4gPiA+IC0JCXBpbmN0cmw6IHBpbmN0cmxAMzAwMTAwMCB7
Cj4gPiA+ID4gLQkJCWNvbXBhdGlibGUgPSAic29waGdvLGN2MTgwMGItcGluY3RybCI7Cj4gPiA+
ID4gLQkJCXJlZyA9IDwweDAzMDAxMDAwIDB4MTAwMD4sCj4gPiA+ID4gLQkJCcKgwqDCoMKgwqAg
PDB4MDUwMjcwMDAgMHgxMDAwPjsKPiA+ID4gPiAtCQkJcmVnLW5hbWVzID0gInN5cyIsICJydGMi
Owo+ID4gPiAKPiA+ID4gCj4gPiA+ID4gKwljcHVzOiBjcHVzIHsKPiA+ID4gPiArCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKPiA+ID4gPiArCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ID4gPiArCQl0
aW1lYmFzZS1mcmVxdWVuY3kgPSA8MjUwMDAwMDA+Owo+ID4gPiA+ICsKPiA+ID4gPiArCQljcHUw
OiBjcHVAMCB7Cj4gPiA+ID4gKwkJCWNvbXBhdGlibGUgPSAidGhlYWQsYzkwNiIsICJyaXNjdiI7
Cj4gPiA+ID4gKwkJCWRldmljZV90eXBlID0gImNwdSI7Cj4gPiA+ID4gKwkJCXJlZyA9IDwwPjsK
PiA+ID4gPiArCQkJZC1jYWNoZS1ibG9jay1zaXplID0gPDY0PjsKPiA+ID4gPiArCQkJZC1jYWNo
ZS1zZXRzID0gPDUxMj47Cj4gPiA+ID4gKwkJCWQtY2FjaGUtc2l6ZSA9IDw2NTUzNj47Cj4gPiA+
ID4gKwkJCWktY2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47Cj4gPiA+ID4gKwkJCWktY2FjaGUtc2V0
cyA9IDwxMjg+Owo+ID4gPiA+ICsJCQlpLWNhY2hlLXNpemUgPSA8MzI3Njg+Owo+ID4gPiA+ICsJ
CQltbXUtdHlwZSA9ICJyaXNjdixzdjM5IjsKPiA+ID4gPiArCQkJcmlzY3YsaXNhID0gInJ2NjRp
bWFmZGMiOwo+ID4gPiA+ICsJCQlyaXNjdixpc2EtYmFzZSA9ICJydjY0aSI7Cj4gPiA+ID4gKwkJ
CXJpc2N2LGlzYS1leHRlbnNpb25zID0gImkiLCAibSIsICJhIiwgImYiLCAiZCIsICJjIiwgInpp
Y250ciIsICJ6aWNzciIsCj4gPiA+ID4gKwkJCQkJwqDCoMKgwqDCoMKgICJ6aWZlbmNlaSIsICJ6
aWhwbSI7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJCQljcHUwX2ludGM6IGludGVycnVwdC1jb250cm9s
bGVyIHsKPiA+ID4gPiArCQkJCWNvbXBhdGlibGUgPSAicmlzY3YsY3B1LWludGMiOwo+ID4gPiA+
ICsJCQkJaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gPiA+ID4gKwkJCQkjaW50ZXJydXB0LWNlbGxz
ID0gPDE+Owo+ID4gPiA+ICsJCQl9Owo+ID4gPiA+IMKgCQl9Owo+ID4gPiA+IMKgCX07Cj4gPiA+
ID4gwqB9Owo+ID4gPiAKPiA+ID4gTWFrZSBhbGwgc29jIGRlZmluaXRpb24gaW5jbHVkZSB0aGUg
Y29tbW9uIGNwdSBmaWxlLiAKPiA+ID4gTm90IGp1c3QgY29weSBpdC4KPiA+IAo+ID4gSSB3YXMg
YWN0aW5nIGFjY29yZGluZyB0byBLcnp5c3p0b2YncyBzdWdnZXN0aW9uOgo+ID4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvc29jL2QzYmEwZWE1LTA0OTEtNDJkNS1hMThlLTY0Y2YyMWRmNjk2Y0Br
ZXJuZWwub3JnLwo+ID4gCj4gPiBLcnp5c3p0b2YsIEkgY2FuIG5hbWUgdGhlIGZpbGUgY3YxOHh4
LWNwdS1pbnRjLmR0c2kgYW5kIHBhY2sgQ1BVIGNvcmUgKyBpbnRlcnJ1cHQKPiA+IGNvbnRyb2xs
ZXJzIGludG8gaXQuIFdvdWxkIGl0IG1ha2Ugc2Vuc2U/Cj4gCj4gCj4gSSBkb24ndCB1bmRlcnN0
YW5kIHRoZSBvcmlnaW5hbCBzdWdnZXN0aW9uLgoKVGhpcyBpcyB0aGUgc25pcHBldCBpbiBxdWVz
dGlvbjoKCi0tLVsgY3V0IF0tLS0KI2RlZmluZSBTT0NfUEVSSVBIRVJBTF9JUlEobnIpCSgobnIp
ICsgMTYpCgovIHsKCWNwdXM6IGNwdXMgewoJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXpl
LWNlbGxzID0gPDA+OwoJCXRpbWViYXNlLWZyZXF1ZW5jeSA9IDwyNTAwMDAwMD47CgoJCWNwdTA6
IGNwdUAwIHsKCQkJY29tcGF0aWJsZSA9ICJ0aGVhZCxjOTA2IiwgInJpc2N2IjsKCQkJZGV2aWNl
X3R5cGUgPSAiY3B1IjsKCQkJcmVnID0gPDA+OwoJCQlkLWNhY2hlLWJsb2NrLXNpemUgPSA8NjQ+
OwoJCQlkLWNhY2hlLXNldHMgPSA8NTEyPjsKCQkJZC1jYWNoZS1zaXplID0gPDY1NTM2PjsKCQkJ
aS1jYWNoZS1ibG9jay1zaXplID0gPDY0PjsKCQkJaS1jYWNoZS1zZXRzID0gPDEyOD47CgkJCWkt
Y2FjaGUtc2l6ZSA9IDwzMjc2OD47CgkJCW1tdS10eXBlID0gInJpc2N2LHN2MzkiOwoJCQlyaXNj
dixpc2EgPSAicnY2NGltYWZkYyI7CgkJCXJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKCQkJcmlz
Y3YsaXNhLWV4dGVuc2lvbnMgPSAiaSIsICJtIiwgImEiLCAiZiIsICJkIiwgImMiLCAiemljbnRy
IiwgInppY3NyIiwKCQkJCQkgICAgICAgInppZmVuY2VpIiwgInppaHBtIjsKCgkJCWNwdTBfaW50
YzogaW50ZXJydXB0LWNvbnRyb2xsZXIgewoJCQkJY29tcGF0aWJsZSA9ICJyaXNjdixjcHUtaW50
YyI7CgkJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKCQkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47
CgkJCX07CgkJfTsKCX07Cn07Cgomc29jIHsKCWludGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+OwoJ
ZG1hLW5vbmNvaGVyZW50OwoKCXBsaWM6IGludGVycnVwdC1jb250cm9sbGVyQDcwMDAwMDAwIHsK
CQlyZWcgPSA8MHg3MDAwMDAwMCAweDQwMDAwMDA+OwoJCWludGVycnVwdHMtZXh0ZW5kZWQgPSA8
JmNwdTBfaW50YyAxMT4sIDwmY3B1MF9pbnRjIDk+OwoJCWludGVycnVwdC1jb250cm9sbGVyOwoJ
CSNhZGRyZXNzLWNlbGxzID0gPDA+OwoJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47CgkJcmlzY3Ys
bmRldiA9IDwxMDE+OwoJfTsKCgljbGludDogdGltZXJANzQwMDAwMDAgewoJCXJlZyA9IDwweDc0
MDAwMDAwIDB4MTAwMDA+OwoJCWludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmNwdTBfaW50YyAzPiwg
PCZjcHUwX2ludGMgNz47Cgl9Owp9OwotLS1bIGN1dCBdLS0tCgpJbm9jaGkncyBwcm9wb3NhbCBp
cyB0byBwdXQgaXQgaW50byBzZXBhcmF0ZSBjdjE4eHgtY3B1LWludGMuZHRzaSBhbmQKaW5jbHVk
ZSB0aGUgbGF0dGVyIGluIDMgb3RoZXIgU29DLXNwZWNpZmljIC5kdHNpcy4gSW4gdjIgSSd2ZSBq
dXN0CmR1cGxpY2F0ZWQgdGhlIGFib3ZlIHNuaXBwZXQgMyB0aW1lcyAocmVmZXIgdG8gZGlmZnN0
YXQgYWJvdmUpLgoKV2hhdCBhcmUgeW91ciB0aG91Z2h0cz8gSW4gUmVuZXNhcyBldmVyeXRoaW5n
IGlzIGR1cGxpY2F0ZWQsIEkgYmVsaWV2ZS4KU29waGdvIG91dHNvdXJjZXMgbXVjaCBzbWFsbGVy
IHNuaXBwZXRzIGludG8gLmR0c2kgKHJlZmVyIHRvIGN2MTgxeC5kdHNpKS4gCgo+IElub2NoaSwg
cGxlYXNlIHRyaW0gdW5uZWNlc3NhcnkgY29udGV4dCBmcm9tIHJlcGxpZXMuCgotLSAKQWxleGFu
ZGVyIFN2ZXJkbGluLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
