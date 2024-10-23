Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BA9CDDE49
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 10:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQIA86MWfXKs0yJJkdlzZphWtAwhrCT51N2AOinJiLo=; b=dTJwHvwPis6KSU
	uhMuCP8v6YGju5aaaXWj1i8CCtPvKsiVLOPEw+Zh0lDEC1LA9ps4fwclwE6jnYzh5Otxn/kD7ewdB
	0w3rIZaY3ejH29ENqusy6l5fRhmFOhwxGFiWH+821u87yb6pbaJrhZdTABNceLanSEJKrC9/gq8dC
	YdTd4wYZITIIJ1G8HFWQysvD7OnTqTvzPjdwrcm5wf5QbcdfuTWdtZ2ixNEoeHAmXiLwtL3gwRQSO
	6g4RcfNJjZ/JH8rYNt9dYUQIM0iWdwNyjIrpnK2Yars1zhdi+H0rX7aENx0Z4sPJp29grhZozTvMi
	Tu1njJBa6uByauocpcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YTr-0000000Dxjy-47tu;
	Wed, 23 Oct 2024 10:20:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YMw-0000000Dwa7-29UL
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 10:13:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so67982895e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 03:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729678412; x=1730283212; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D0rjMh1Id9nhsW30frAC0nQPf7+TS+o8M3NpIefQEM=;
        b=gKbWqrObXEYhzxIGRuERj2MGvHsZV5JTmTOewERHwyAGslFX5SacnnCMUvlA7hZnR1
         9fgHXpFlAep+s76tJhgJAAFeOv8BSfDJrrrTEtVyLIyIZmAyvUjhlqJ0nrf57SP2NnC/
         xpPW9dYtad/ODrOryZ5eifQc+N05LaEwEnGM/GbIkKDCC+w42eKW5V5wkcLNwCbEnO7l
         Fz5NRrjyODG6qoo9HXgU3O9kk+kj0RIsFNUJC1IoMpA2XVynGJZrTUa9dhv3FCJdODVe
         UuZ1c35CjiCL/MxUJ17YmlRaunBUZW5M9sqhvzMh8SEW7GWyTxK4rnHkA6Tr3IoLMQ8N
         M7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729678412; x=1730283212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0D0rjMh1Id9nhsW30frAC0nQPf7+TS+o8M3NpIefQEM=;
        b=umUXQ37CfHli0GoPDupJKnzUWib2xdAwJt3k78PNBwjUJ9NAaP5Ni1WlG1BbwT8lRG
         QN5HoE9mpyqJdacM7PNS1XBrC/5+3RaryR5iS5IEu7w5RSCntZ1pNR4Gt25hFk38slHF
         s3I/sXKTl626/2pTLKtdW2LKapYF5FBBmRxqmoHOoQFEeyvbsvOo3/Cpua3c7dN9cacD
         k7VKsZeJGNzw2h3x2MjsV/uGrolRQWXFr2/qAosuCWRLM7y7oN5D+lq2SyGeRmc646L5
         yXqsqFy4YaI44LTJF7xuMufE22yTyFYG492/q02fTXnbyUILOTNYnyvcE9wzRMwfnWyL
         1xBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQldEeF6WQPKo3pyX4+ZMtdcNIo0c2yZJGy/shppylweDiwjbCIOYs8cTKbNA1iK833Xs6tX2rmNGjaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUM2MFALKTPmExLCsVSoWPoVBdzIBU6HwrU810JK+7+XoTeYX5
	dEDFtkmyzgvv9BAIRjkK+tlXd7wX+T0azQuwP4ejhE728J6v++6I
X-Google-Smtp-Source: AGHT+IEywc8szkUMHQDOljEex/6r3uy4FmMPF2bR5Hx5t6Pyhx6U8tx6rVawlFy2QLilLK8nOu8VOw==
X-Received: by 2002:a05:600c:3b16:b0:431:5ed4:7e7d with SMTP id 5b1f17b1804b1-4318415b482mr15586585e9.18.1729678411627;
        Wed, 23 Oct 2024 03:13:31 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef15:2100:888:d3c6:a442:4910? (p200300f6ef1521000888d3c6a4424910.dip0.t-ipconnect.de. [2003:f6:ef15:2100:888:d3c6:a442:4910])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a3805esm8648459f8f.9.2024.10.23.03.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 03:13:31 -0700 (PDT)
Message-ID: <f81545a095136cd64b1991bae4027ad1dfe9597f.camel@gmail.com>
Subject: Re: [PATCH] iio: Fix build error for ltc2664
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Jinjie Ruan	
 <ruanjinjie@huawei.com>, jic23@kernel.org, lars@metafoo.de, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	nuno.sa@analog.com, conor.dooley@microchip.com,
 michael.hennerich@analog.com, 	anshulusr@gmail.com, sunke@kylinos.cn,
 kimseer.paller@analog.com, 	linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org
Date: Wed, 23 Oct 2024 12:17:49 +0200
In-Reply-To: <ae939f90-c23f-483b-b4bc-70891d0de167@gmail.com>
References: <20241023082309.1002917-1-ruanjinjie@huawei.com>
	 <ae939f90-c23f-483b-b4bc-70891d0de167@gmail.com>
User-Agent: Evolution 3.54.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_031334_574321_080E963A 
X-CRM114-Status: GOOD (  16.82  )
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

T24gV2VkLCAyMDI0LTEwLTIzIGF0IDEwOjQxICswMjAwLCBKYXZpZXIgQ2FycmFzY28gd3JvdGU6
Cj4gT24gMjMvMTAvMjAyNCAxMDoyMywgSmluamllIFJ1YW4gd3JvdGU6Cj4gPiBJZiBSRUdNQVBf
U1BJIGlzIG4gYW5kIExUQzI2NjQgaXMgeSwgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvciBvY2N1
cnM6Cj4gPiAKPiA+IAlyaXNjdjY0LXVua25vd24tbGludXgtZ251LWxkOiBkcml2ZXJzL2lpby9k
YWMvbHRjMjY2NC5vOiBpbgo+ID4gZnVuY3Rpb24gYGx0YzI2NjRfcHJvYmUnOgo+ID4gCWx0YzI2
NjQuYzooLnRleHQrMHg3MTQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvCj4gPiBgX19kZXZtX3Jl
Z21hcF9pbml0X3NwaScKPiA+IAo+ID4gU2VsZWN0IFJFR01BUF9TUEkgZm9yIExUQzI2NjQgdG8g
Zml4IGl0Lgo+ID4gCj4gPiBGaXhlczogNGNjMmZjNDQ1ZDJlICgiaWlvOiBkYWM6IGx0YzI2NjQ6
IEFkZCBkcml2ZXIgZm9yIExUQzI2NjQgYW5kCj4gPiBMVEMyNjcyIikKPiA+IFNpZ25lZC1vZmYt
Ynk6IEppbmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+Cj4gPiAtLS0KPiA+IMKgZHJp
dmVycy9paW8vZGFjL0tjb25maWcgfCAxICsKPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9kYWMvS2NvbmZpZyBiL2Ry
aXZlcnMvaWlvL2RhYy9LY29uZmlnCj4gPiBpbmRleCA0NWUzMzdjNmQyNTYuLmFlNmQwNGM3NThk
MSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaWlvL2RhYy9LY29uZmlnCj4gPiArKysgYi9kcml2
ZXJzL2lpby9kYWMvS2NvbmZpZwo+ID4gQEAgLTM4MSw2ICszODEsNyBAQCBjb25maWcgTFRDMjY2
NAo+ID4gwqAJdHJpc3RhdGUgIkFuYWxvZyBEZXZpY2VzIExUQzI2NjQgYW5kIExUQzI2NzIgREFD
IFNQSSBkcml2ZXIiCj4gPiDCoAlkZXBlbmRzIG9uIFNQSQo+ID4gwqAJc2VsZWN0IFJFR01BUAo+
ID4gKwlzZWxlY3QgUkVHTUFQX1NQSQo+IAo+IFNob3VsZCB5b3Ugbm90IHJlcGxhY2UgUkVHTUFQ
IHdpdGggUkVHTUFQX1NQSSBpbnN0ZWFkPwoKWWVzLCBJIHRoaW5rIHNvLi4uwqBUaGUgY29tbWl0
IHRpdGxlIGNvdWxkIGFsc28gYmUgaW1wcm92ZWQKCiJpaW86IGRhYzoga2NvbmZpZzogLi4uIgoK
V2l0aCB0aGF0OgoKUmV2aWV3ZWQtYnk6IE51bm8gU2EgPG51bm8uc2FAYW5hbG9nLmNvbT4KCj4g
Cj4gCj4gPiDCoAloZWxwCj4gPiDCoAnCoCBTYXkgeWVzIGhlcmUgdG8gYnVpbGQgc3VwcG9ydCBm
b3IgQW5hbG9nIERldmljZXMKPiA+IMKgCcKgIExUQzI2NjQgYW5kIExUQzI2NzIgY29udmVydGVy
cyAoREFDKS4KPiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gSmF2aWVyIENhcnJhc2NvCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
