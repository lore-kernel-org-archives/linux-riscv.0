Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B9EC0219B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 21:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tMMkvmanRqwlszC3JyKw+ffbBXizn37SqN+VMiwWsE=; b=4TRuMi5dScWAkY
	O9aho7oQ5ViIbvlAnfllMqmdFf5Hvj54sB1XUQY2bvJwNDxC7J+39WTBRRISsUzeySQceNhQGQk0K
	9eRqpj+mekHRKxP/381ZoxD0feKlrVc5BruUci6muA3M4qPtX3QmaXm+hE7xA+6n5x3UpJVqkId79
	AcQdhGEO40nFzjEe/A/7QbfaDFIdTG2qo3J2pOyt5al5AM5reMG/BVeaSAiaG/ojkgqrg7bkcgxfQ
	VcCZVs2RFHvYmXPOMkjASWpYoR0dtbuQvI+V+Okcto/0ABw6rOtf0HeRl9No72BbBExZjZuGApXjk
	umY5j570f//7TvD8JLUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxcz-00000005Jyi-0IFN;
	Tue, 11 Feb 2025 21:17:09 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thxcw-00000005Jxt-1Nzx
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 21:17:07 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ab7d451f7c4so265617966b.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 13:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739308625; x=1739913425; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kL4pLRpea7Cu+7ztNj7Yfeqe+//z5davQY0XpetXYu8=;
        b=im4jUzCQl78jtwRqv58zyJU0key6P3MyWQ+d6PtDcNUjvY6H0yO6inKypr/W/xuS8J
         eKM+VI6/W37FOb9FGk+tOg3OTD5wfglG2IuZgN1Ry6TpySkMSvl0RHwVIzKU/M0KPgZa
         RoV2Ou4i6DwditnJ28uAQi8seWzWty5YQP8k5Wyn0sJ3fAFIEy2Y7YtJjH6fFrU8bh6C
         20ArEvb7bKT8vvGo9kih+3kjYihLvnAOJSey/aj30J4l/doQ/4L9pDZPGNafKVJZAGW4
         Bp4oUYPopnMJKUrOz7yIJ8uudOfDnFmFCS1om3T5kJ//55X8aCRgYU5VyH2D4Ucjlh7e
         zScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739308625; x=1739913425;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kL4pLRpea7Cu+7ztNj7Yfeqe+//z5davQY0XpetXYu8=;
        b=Yk7LsiA4Jb+4HHGF52QWGeK7HqTVfHX9GNnjqFFo7j97NkaG883rWrGiEOjO4e1g0L
         Y3r0s5cwBSKFNcjvRH8b5pc22dB0g5bBfN/5SuvR9oWWBZrFyNWZ9elbhQbNYboyjl7c
         6xGY2U4hrZcZYbjDwS84OLhlV1WjKMGnTgSw3Td37rJVfgb+IvAeQENk6jlhpzFcmKV8
         ZxUo0LI5DcbtuUzbblIsRonJiRKbglv8GmjjX/MixwxyiYPGe8h81AmCKSjbyCOdaFAf
         Erj5IPJoSnEYQCiz6ypVdFmPZvPJeoTQzxItDu2ngL5UGCiby/fFF8nvtrjCqmtYaJSi
         3xqw==
X-Forwarded-Encrypted: i=1; AJvYcCXZpdaxRG7zteIXtNT5FfcPK/UkMgIqMszK7moDM1U6/e/mhTC8myYPMCeVcelO12h1gxJM/3cOPVEj9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy54CfIllbQI0bT+aeUdLhzEDiUEdoMqju22r+1VY070OTXKM+
	DWyVOsIplxG3gHIiimxI6RX/o173X38m1E6YUTn/IL9dc9gg2rjj
X-Gm-Gg: ASbGncv/3hYV1dMpOi68TdSL5uHmzUxNy2/Vjk1Fa6Nf8k48gE6cPRJJovfTRlyUydl
	V52unTuDu7C+OdK+vC7WUoNT8D21D+LiQSmPDjCB0zxFWwnBEe4scrpAvtmj6PvHLllEKQEX7J+
	z8NOmoZeEwcqdp4jA2pKbRtPQpyNz9fR1kjmt+QhS9deUg7szWN3EuUP81tlmR5V0aLuIRGPNcg
	2R+PakK0/DPlw9Im0ISH61/tNfK/StvR/ka67z9CaD+Qdg04O6WkrNiwxeZbVFUQ9j1Nq9FNkav
	2EouBglf1N9M7SFuQXmAJNxDM4iS+L/a
X-Google-Smtp-Source: AGHT+IGni2/bzHFeeZX8aVfgIY4iMRShws/1IbPt7a2N9AbncofAa7JiMPAeDkXCfvENazx3YMpJFQ==
X-Received: by 2002:a17:907:60d5:b0:ab6:eecb:41f0 with SMTP id a640c23a62f3a-ab7f34738a9mr42642166b.35.1739308624364;
        Tue, 11 Feb 2025 13:17:04 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7d18e006csm321274266b.52.2025.02.11.13.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 13:17:03 -0800 (PST)
Message-ID: <5d0f0f209194ca5ad1e4f93ab5fefd40484855e3.camel@gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: dlan@gentoo.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org, Krzysztof Kozlowski	
 <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Feb 2025 22:17:00 +0100
In-Reply-To: <20240428060848.706573-2-qiujingbao.dlmu@gmail.com>
References: <20240428060848.706573-1-qiujingbao.dlmu@gmail.com>
	 <20240428060848.706573-2-qiujingbao.dlmu@gmail.com>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_131706_372138_9F46637B 
X-CRM114-Status: GOOD (  13.50  )
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

VGhhbmtzIGZvciB5b3VyIHBhdGNoIEppbmdiYW8hCgpPbiBTdW4sIDIwMjQtMDQtMjggYXQgMTQ6
MDggKzA4MDAsIEppbmdiYW8gUWl1IHdyb3RlOgo+IEFkZCBSVEMgZGV2aWNldHJlZSBiaW5kaW5n
IGZvciBTb3BoZ28gQ1YxODAwIFNvQy4KPiAKPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEpp
bmdiYW8gUWl1IDxxaXVqaW5nYmFvLmRsbXVAZ21haWwuY29tPgoKVmVyaWZpZWQgYWdhaW5zdCBT
RzIwMDAgVFJNIFsxXSwgdGhlIGJpbmRpbmdzIG1ha2Ugc2Vuc2UgdG8gbWUuCgpSZXZpZXdlZC1i
eTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoKWzFd
IGh0dHBzOi8vZ2l0aHViLmNvbS9zb3BoZ28vc29waGdvLWRvYy9yZWxlYXNlcy9kb3dubG9hZC9z
ZzIwMDAtdHJtLXYxLjAxL3NnMjAwMF90cm1fZW4ucGRmCgotLS0KPiDCoC4uLi9iaW5kaW5ncy9y
dGMvc29waGdvLGN2MTgwMC1ydGMueWFtbMKgwqDCoMKgwqDCoCB8IDUzICsrKysrKysrKysrKysr
KysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCj4gwqBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9zb3BoZ28sY3Yx
ODAwLXJ0Yy55YW1sCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9ydGMvc29waGdvLGN2MTgwMC1ydGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ydGMvc29waGdvLGN2MTgwMC1ydGMueWFtbAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iMzZiNTFhNjkxNjYKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9zb3BoZ28sY3Yx
ODAwLXJ0Yy55YW1sCj4gQEAgLTAsMCArMSw1MyBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+
ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3J0Yy9zb3BoZ28sY3YxODAwLXJ0
Yy55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMKPiArCj4gK3RpdGxlOiBSZWFsIFRpbWUgQ2xvY2sgb2YgdGhlIFNvcGhnbyBDVjE4
MDAgU29DCj4gKwo+ICtkZXNjcmlwdGlvbjoKPiArwqAgUmVhbCBUaW1lIENsb2NrIChSVEMpIGlz
IGFuIGluZGVwZW5kZW50bHkgcG93ZXJlZCBtb2R1bGUKPiArwqAgd2l0aGluIHRoZSBjaGlwLCB3
aGljaCBpbmNsdWRlcyBhIDMyS0h6IG9zY2lsbGF0b3IgYW5kIGEKPiArwqAgUG93ZXIgT24gUmVz
ZXQvUE9SIHN1Ym1vZHVsZS4gSXQgY2FuIGJlIHVzZWQgZm9yIHRpbWUgZGlzcGxheQo+ICvCoCBh
bmQgdGltZWQgYWxhcm0gZ2VuZXJhdGlvbi4gSW4gYWRkaXRpb24sIHRoZSBoYXJkd2FyZSBzdGF0
ZQo+ICvCoCBtYWNoaW5lIHByb3ZpZGVzIHRyaWdnZXJpbmcgYW5kIHRpbWluZyBjb250cm9sIGZv
ciBjaGlwCj4gK8KgIHBvd2VyIG9uLCBvZmYsIGFuZCByZXNldC4KPiArCj4gK21haW50YWluZXJz
Ogo+ICvCoCAtIEppbmdiYW8gUWl1IDxxaXVqaW5nYmFvLmRsbXVAZ21haWwuY29tPgo+ICsKPiAr
YWxsT2Y6Cj4gK8KgIC0gJHJlZjogcnRjLnlhbWwjCj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICvCoCBj
b21wYXRpYmxlOgo+ICvCoMKgwqAgY29uc3Q6IHNvcGhnbyxjdjE4MDAtcnRjCj4gKwo+ICvCoCBy
ZWc6Cj4gK8KgwqDCoCBtYXhJdGVtczogMQo+ICsKPiArwqAgaW50ZXJydXB0czoKPiArwqDCoMKg
IG1heEl0ZW1zOiAxCj4gKwo+ICvCoCBjbG9ja3M6Cj4gK8KgwqDCoCBtYXhJdGVtczogMQo+ICsK
PiArcmVxdWlyZWQ6Cj4gK8KgIC0gY29tcGF0aWJsZQo+ICvCoCAtIHJlZwo+ICvCoCAtIGludGVy
cnVwdHMKPiArwqAgLSBjbG9ja3MKPiArCj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UK
PiArCj4gK2V4YW1wbGVzOgo+ICvCoCAtIHwKPiArwqDCoMKgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPiArCj4gK8KgwqDCoCBydGNANTAyNTAwMCB7
Cj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic29waGdvLGN2MTgwMC1ydGMiOwo+ICvC
oMKgwqDCoMKgwqDCoCByZWcgPSA8MHg1MDI1MDAwIDB4MjAwMD47Cj4gK8KgwqDCoMKgwqDCoMKg
IGludGVycnVwdHMgPSA8MTcgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gK8KgwqDCoMKgwqDCoMKg
IGNsb2NrcyA9IDwmb3NjPjsKPiArwqDCoMKgIH07CgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
