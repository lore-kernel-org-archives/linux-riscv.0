Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEC9C369A6
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 12:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRyHlMqLo5gdchqBsO+aOoZPQfO1G3s28+qYyeJL/eg=; b=vTQqLPzygakaJO
	mq4PQDDTS2Nyf8z/vwhA9kKBVdADAivX++lPWCiJpxBB6SS9dIIZ0Y0KthOf0Bilvx7xdEIS5nX6v
	UF08PEd5GYPcQ2yv51q41kJxAE0jPxqOX5BHh9F9+oE2b+fW6IZpFpxvO/QlNVuqfaWdZc1EHQ5IT
	zQsAtJnLgSuiwR7kTxLAe2DnksqDfeeja4UpwYFJrdud+gX1WLgRGwvDN/e8dxHHUL5dknJSLSMZ0
	i4sl92C4qHwPGpCTW+Z06EOKeslw4G5CXERGQy0+CiiNoHzEFCWL0sTpdlUn7xLp60h09YDxJvmgC
	+ObHDOsOYbnsJvxqvyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r5W-0000000AVYk-1b6s;
	Thu, 10 Apr 2025 12:32:58 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r5D-0000000AVVv-3G39
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 12:32:40 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3feaedb39e9so219846b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 05:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744288359; x=1744893159; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GvSNTACO1SZCY31F0gRrZZq+wvkmlB8UFBxIZ9DVjtE=;
        b=ecAwMcq6BFFKkHvTvknM75kltZS5y2albxkgIzidf0majyboDHoVt5N1edlVr+kQ5n
         oz+mZvA8NddI/ii2/qSPTTt6rT+xpAzPa4AjePl01LoHaXgzgNxhIc9RgTT88P/q/A7O
         KVQCeyAJa5AsZLdYq7G0yXIE5bs78cNua6C8RddLdSz7pdkLtQ2gujJDmlKUujhO0IU7
         rAE9GcVmmcAveesxFg3ej2yNigO4CNHyrJrWUN8vwYNkkVFGnW1fBLzjeQ7TcR98SwER
         41u0ncehNCXgpL0tr7jKuPUf9dBHfxieas5tFPxbCHqVaZtxbs+S9YuHBfRljRHs58o9
         hYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288359; x=1744893159;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvSNTACO1SZCY31F0gRrZZq+wvkmlB8UFBxIZ9DVjtE=;
        b=EN645CKa7HpX2NZmiZZRJLuI32lEeqZjnc++OJSo/VeuHYhnhnwIwLQndZ68Hdndls
         2mbnozsb5DLQMNYsRUD9B4vGd+WbR+2KzoaoSzbRi1fuW6E+Tgi9nTVQtwbmfuOUvC8B
         4kJgOjj3Nw6IXD9I8wSSpeZ1qaz1Dcv9Z7DYFsSUuNFmt67yD9+ipDKVKdxJMt8joynX
         rXrKzOF8Tme15EMDRfWOu2zw3QKTEzrxbdV0WgU05XpnFQklIv2hEHqKTRUNSo5eUv0k
         LML4CnIIYKZEoyjhhKj/e1SAcAUpTpXWqq8q3MDW2hucJrXNMgu7tcX2x1FnBMbF00OU
         LlLA==
X-Forwarded-Encrypted: i=1; AJvYcCWX/gc11tH6mBtb/mzIOdneX45D03ZCEMEfdrRpHvS051PnUG2FNz37UK1LAA6ibIFNEQNJHMODI9QPzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2tbfjYlKfqOO3pyoD8jBkynuodP3GMcRfSWcgRNCbV7oBPPBB
	+kDpYAcqkqae5lE6f94PMo7f5PUrlimzPLE9dbjPV0mi1+3dafvm1rs+2vAOrk4=
X-Gm-Gg: ASbGncukFi/WdET5MGLFbvvTHK8y27ioCHxhIRMs3ZPdXZlS3F0pkV+5m4LFtbv1Oot
	hsDAjQr2FRIcKstbDHOu9BR0LrWC6fDm7gUDHLDiuioke+3a+Mm84sYb1B8KrUZENZzureL/VcC
	fqd0DwGB3ABiRvTnYqM6GQss612iLyOGTnjZrSwyRYuZxoSOEq3819C6CDG23DwAlbOLda/60Qw
	PmnCR5YmbDOp3//DJqGLAz3ei+T1RLGfCui/twcjS+/YWgHeCxHqzMbMQMiIHcSbuHNCqTZi6pD
	NWK/Fs0zM7X2IF9yf0vVgU1hqMp/+lGD2vv6mxY6HIydw5lt2Uq97k1QFZAdi2HOawZ+beubCSQ
	TKDgE
X-Google-Smtp-Source: AGHT+IEJuAZEVXhBtSWrNjlEQvBiq7KT4K1Km9MSzZyjIkHUjkvVril1VSVFFBGM/J31v9xCTSVpWA==
X-Received: by 2002:a05:6808:7004:b0:3f7:f7b7:88b with SMTP id 5614622812f47-4007bcdc348mr1582330b6e.21.1744288358751;
        Thu, 10 Apr 2025 05:32:38 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f5b28basm505694eaf.36.2025.04.10.05.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:32:38 -0700 (PDT)
Message-ID: <0ed3ce4c-9be0-485b-a1ea-6a34931179db@riscstar.com>
Date: Thu, 10 Apr 2025 07:32:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
From: Alex Elder <elder@riscstar.com>
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
 <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
 <sl752im2sn5sz6yzc23ctprh3rwryuhgtggsaauxixn3b267ag@6sf5fahu6b5i>
 <20250410015549-GYA19471@gentoo>
 <f7cun6vh6lv7q2qdgba4a55wjv3v2pldl22xnrqxnurj3jlyk7@mvafnye3wv7m>
 <cb13c955-3994-4950-9c28-37703f749b0e@riscstar.com>
Content-Language: en-US
In-Reply-To: <cb13c955-3994-4950-9c28-37703f749b0e@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_053239_816173_CB3633D7 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

T24gNC8xMC8yNSA3OjMwIEFNLCBBbGV4IEVsZGVyIHdyb3RlOgo+IAo+IEknZCBsaWtlIHRvIHNl
ZSB0aGF0IGJlIHRoZSBvbmx5IHRoaW5nIHRoZXJlLCBhbmQgaGF2ZQo+IHZhcmlvdXMgU3BhY2Vt
aVQgbW9kdWxlcyBkZWZpbmUgZGVmYXVsdCB2YWx1ZXMgdGhhdAo+IGRlcGVuZCBvbiBBUkNIX1NQ
QUNFTUlUIChvciBfSzEpIGluIHRoZWlyIEtjb25maWcKPiBmaWxlLsKgIExpa2U6Cj4gCj4gIMKg
wqDCoCBjb25maWcgU1BBQ0VNSVRfSzFfQ0NVCj4gIMKgwqDCoMKgwqDCoMKgIHRyaXN0YXRlICJT
dXBwb3J0IGZvciBTcGFjZW1pVCBLMSBTb0MiCj4gIMKgwqDCoMKgwqDCoMKgIGRlcGVuZHMgb24g
QVJDSF9TUEFDRU1JVCB8fCBDT01QSUxFX1RFU1QKPiAgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdCBt
IGlmIEFSQ0hfU1BBQ0VNSVQKPiAKPiBJICp0aGluayogSGF5bGVuIHNhaWQgdGhhdCdzIHdoYXQg
aGUncyBnb2luZyB0byBkby7CoCBZb3UKPiBjb3VsZCBtYWtlIGl0ICJkZWZhdWx0IEFSQ0hfU1BB
Q0VNSVQiIHRvbywgdGhvdWdoIHRoYXQKPiBidWlsZHMgaXQgaW4gdG8gdGhlIGtlcm5lbC4KCk5v
cGUsIEkganVzdCByZXJlYWQgd2hhdCBoZSBzYWlkLCBhbmQgSSdtIG1pc3Rha2VuLiAgR28Kd2l0
aCB3aGF0J3MgcHJlZmVycmVkIGJ5IHRoZSBjbG9jayBtYWludGFpbmVycy4KCgkJCQkJLUFsZXgK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
