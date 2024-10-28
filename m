Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF04D13593
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5tmEgiEQ1tC/+Us8Z0ec5P3IxMh67wX7E3X0gobj0s=; b=mrF0ZiBPrxyMJV
	qPrhllisFeVs0RAa0B/f3P+mhSVawoqKP2QdMSNQHHVYYnfA/Eqh5vpTfj5BmWwTStJoJ9BtY+GyN
	C594sXKZz0D68cu0+mbhobvZUE6Mi7wQ2RHbnEb+lopbHi2zrPV+9hvhzqjpCLSSRYYsPRHhBnS8r
	bdp1yyD6aPJiXwSgCi9EYHTqwu7TN8rFdW2z029WvbFwYqkfK4vU73/MR5PoqffBYkGBB040swILJ
	GF0+GAkP9eDb83twxKQfxnCqpEoZ07yW2j8Qc0ZOXLyZ6bqd/OPNllz3ByNteA8HfphDz0VwhTenZ
	++iGAqtUGN2lOWFexHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MWo-0000000AKDs-0Wle;
	Mon, 28 Oct 2024 09:59:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MIv-0000000AHMc-3icn
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 09:44:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4315eac969aso28251775e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730108691; x=1730713491; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYW2nBqpOT7rpdJAt6yBdXzUTt5ThWvwR8AKSh6PMWk=;
        b=U822/naicgAoDqjVDYn93b762dmxG9LNNnUMPREOQt91fgDTrJlevXviOCeuJLafQN
         SWePVlL2iQmXp/f9SOXMGcQC7Y/1dttgtyInxpNH/zK2lx/Ivd1dn8zmqO6b0YUSXaoh
         wtZKCY6Rh+tKUAdE8QA112NQOwXZ+QItzejOTUJFRObbPVsZR2bwmwrTFXzyGZspBKFB
         YNFjDW4rlovFFgMNzfNqRI0zLkdX1Za2ombB6Y+poSN97YtJs84jDRCGH7hh+Hx337IQ
         ZxkAQWDhr19OwXxR/mC+V0XhnQE3heeG7Nwvkbb3Kovwgo2BHEgT8FSaCoCuM6uQ0oY7
         9D+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730108691; x=1730713491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYW2nBqpOT7rpdJAt6yBdXzUTt5ThWvwR8AKSh6PMWk=;
        b=p0A3Zqcr21L4mHqCgwub+r+HKpc9V0HLvPoLGjZL+YWpi2M9fAShA5Tf9x5e0FdT2a
         TmCMynrRrTrRUHmoZQ3qWlij9Gtn5j5EcPXJPlXDv6fqwxdTnJZuO2XwH9fr7ZoNHKTR
         UXFe68ga/pctMRDpLiMpLk6JbtKcbT/+Lk2aH9M18hVaEZyWQoiOi4LfnrgGhAKsSdos
         FPicfl3T79MbunopuV507xRExn9Uu2KKMeXcXr2dIQ6ItnmYKZkiRCvzJKOIvt/Jofu0
         b9PBmNOcjDp8Plw153W821OXJwwfxwOBM+D0ms+X2yB0SEftaRzlsFd9j4J+5xKFvuSy
         B0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUcXnb6FKeqjyEWJhsCJqjN6O+HZ5W7/jQDmRQWLp/yeQDF/umLnfY736P1qkCaf413rJz2zTxpsfXrSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJfCK/xhW0VXMpKQZp6IOwZ1KrP+wgHLB+QUIb5YtN/1o/NJv3
	sD+j8R7ygRt7FxAw/rZo/eW1QgGOM20aqSEP5mfJaq8huyvVZZ1hk5DPo6ylEUU=
X-Google-Smtp-Source: AGHT+IEGI3A08qAUBhd5v0Oc5FZbvghNJQAwXWa8dsiUdujloWteFAWUVUDMhuvgj34CSetfJervcg==
X-Received: by 2002:a05:600c:4e8c:b0:431:7c25:8600 with SMTP id 5b1f17b1804b1-4318b587dd1mr99781975e9.2.1730108691401;
        Mon, 28 Oct 2024 02:44:51 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b70c44sm8958669f8f.80.2024.10.28.02.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 02:44:51 -0700 (PDT)
Message-ID: <5f7179ec-e4ce-4644-8a60-ce407a4d2f11@linaro.org>
Date: Mon, 28 Oct 2024 10:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clocksource/drivers/timer-riscv: Stop stimecmp
 when cpu hotplug
To: Nick Hu <nick.hu@sifive.com>, greentime.hu@sifive.com,
 zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Andrew Jones
 <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Sunil V L <sunilvl@ventanamicro.com>, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>
References: <20241028033928.223218-1-nick.hu@sifive.com>
 <20241028033928.223218-3-nick.hu@sifive.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241028033928.223218-3-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_024453_955433_ADDEE44F 
X-CRM114-Status: GOOD (  15.92  )
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

T24gMjgvMTAvMjAyNCAwNDozOSwgTmljayBIdSB3cm90ZToKPiBTdG9wIHRoZSB0aW1lciB3aGVu
IHRoZSBjcHUgaXMgZ29pbmcgdG8gYmUgb2ZmbGluZSBvdGhlcndpc2UgdGhlCj4gdGltZXIgaW50
ZXJydXB0IG1heSBiZSBwZW5kaW5nIHdoaWxlIHBlcmZvcm1pbmcgcG93ZXItZG93bi4KPiAKPiBT
dWdnZXN0ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MDgyOTAzMzkwNC40NzcyMDAtMy1uaWNrLmh1
QHNpZml2ZS5jb20vVC8jdQo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4KPiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiAt
LS0KPiAgIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyB8IDYgKysrKysrCj4gICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Y2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlz
Y3YuYwo+IGluZGV4IDQ4Y2U1MGM1ZjVlNi4uMTY2ZGVlMTRlNDZiIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3Vy
Y2UvdGltZXItcmlzY3YuYwo+IEBAIC0xMjcsNiArMTI3LDEyIEBAIHN0YXRpYyBpbnQgcmlzY3Zf
dGltZXJfc3RhcnRpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUpCj4gICBzdGF0aWMgaW50IHJpc2N2
X3RpbWVyX2R5aW5nX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQo+ICAgewo+ICAgCWRpc2FibGVfcGVy
Y3B1X2lycShyaXNjdl9jbG9ja19ldmVudF9pcnEpOwo+ICsJLyoKPiArCSAqIFN0b3AgdGhlIHRp
bWVyIHdoZW4gdGhlIGNwdSBpcyBnb2luZyB0byBiZSBvZmZsaW5lIG90aGVyd2lzZQo+ICsJICog
dGhlIHRpbWVyIGludGVycnVwdCBtYXkgYmUgcGVuZGluZyB3aGlsZSBwZXJmb3JtaW5nIHBvd2Vy
LWRvd24uCj4gKwkgKi8KPiArCXJpc2N2X2Nsb2NrX2V2ZW50X3N0b3AoKTsKPiArCj4gICAJcmV0
dXJuIDA7Cj4gICB9CgpTaG91bGQgaXQgbm90IGJlIHRoZSBvcHBvc2l0ZT8KCkZpcnN0IHN0b3Ag
dGhlIGNsb2NrIHdoaWNoIGNsZWFycyB0aGUgaW50ZXJydXB0IGFuZCB0aGVuIGRpc2FibGUgdGhl
IGlycT8KCgoKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8v
d3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVy
LmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFy
by1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
