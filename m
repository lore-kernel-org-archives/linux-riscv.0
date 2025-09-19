Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E807CAC5A8
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpBPNYbWfJxWMay2wOtH3sAq/VdXEJ8qcomdKg1O9Q4=; b=CShig5lk5ei8Qa
	3GvBXSe3eR6t9g3g3/xkOKQCaR0uFohrY+Y+6mfQbkh9JF0l3kfA6hzu9R4wOkgu5puMN3ULTBDyF
	vOUcJBwgSYqCnODkluHs9TevCZXAKwJDwRZidfOt6OZ5DqVxzR5s3QMFWleoL5xGYlTVThYqdb9b4
	yMhLK8dX+f/XB8aS4LkPmdj/MhjDt0y0KUwGDB1jZz75LH7xgvj4L77hHSZK2cFiV2I5R238iVanz
	ul3Xzn6gGjibyr1P/6fTg0vWKnYy9KrxJsp2kiCgxy6CLgqy+tkYTFHZu8JqRFeiuikZE8PHF7suI
	5z7usROxJAUWjtHS/kTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzczL-00000003K4U-1rlS;
	Fri, 19 Sep 2025 15:25:31 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzczJ-00000003K2b-1pBW
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 15:25:30 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-88432e29adcso78430539f.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758295528; x=1758900328; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+umzzpBSRQEc1V/CcodsQfdMrH/eWztzCvjBjz+cu5I=;
        b=gkitzt0m9/eW+NATgkq2LUDrgJcyVTHgHumsChO8xqT+mu5Msa+6OEoBzsw6uMNhbv
         5xgo0zQhOMLPQHH+5ICZE6BJ+eHPiJnIyM/JwDflmp4ad7sVhFSsNSCMPFqMTUpRpgHj
         6N1kA4hUdkZKax6zxeal7wJ1DWtEqplVI9Bzk/MG6dAgoTTb+1ssyO6mWT8zT5Rtqb9f
         ewgNj/1lhFmaPjWCgtZNwURqAOTTkwxpmP1LrolNYGrWQQg1JLwpP7rbrpHMdSePfMnS
         WL7/qiMJfLxLM5bdO8RJwInrZ/VMNYy8KDnk2FcusdtxF80VElVxycOVKZuXBb2CmU+7
         w/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758295528; x=1758900328;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+umzzpBSRQEc1V/CcodsQfdMrH/eWztzCvjBjz+cu5I=;
        b=rnFJ1fG6E27+9oI/oJWVwidpD9EQGGAWqF6/3nsv5Mqd3M7+B2+3iv2yYJj33qihqE
         nlwLMxmI5MkplFj1U5F/uePekwi4ktBJ9D4KqFFm/M1g09XxnHDspFz4L726jiHZbLby
         VKO1fjvW03E3mvGjzPbz2Ua5yKuLxG9XAalDNH9CbSs1Pnk2PLun/bVpw62Szs5xw0hM
         JdKqaHMzpGI/LABY2Cw8u6RpZWvw5DTWR56t686gp0TuT9wPiRRMWnCZL0GzAmnJWr9B
         nkiy10kYhTnCT63rZmi6fY8mJ9CeTYH+oT8FEnK6ZH0xR66buC3WDC/htmZZ6Ptf+2YF
         KeSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVydG8MRzyR0bdozRzp9zQXjVwTGjGE2XAba2h7rMC0MXPAXvidk+1pJ/8bBLbAqQiXF/8uLZ1GLv13bA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmDHGFWZr1200lwalyh0dOO6l73PtX6L/y6XLMUrLfpvfkxXqk
	Lyoicy9mfW2kyJQtaWpLez0oYC7I5WF0h51un4SVgDGFSVzyjTgzv+zd6xsl2tE6q8w=
X-Gm-Gg: ASbGncv3eHne7IOgxm2/deCOrMzE7ePpzt1d6gI6M32HzuHYLVuKuPzQk8HcUkOzXV3
	nZBWj0sPA3r8VPnkEvOT13+Q/A0edVvS0RID29FGBnD39trKdRrW+R/h1LyAuRRrRIqzCPHLmJd
	pqC4ds8DtQhV8jyZSspaqweWewnFLf04Wc2GFoi1Rnn+9hUeo5BdlSd/0i+83WOuAJbxoCZ3otn
	PLL7xhFZ+k2cmlV1cQ+OcG/65V0RoEMqnJ+5UiLWLid+AunmvpHwxpoZzgcX7LoIWKxKvDIPn1X
	/ZL6Yb86EMgKWqVYUl5KgFNy754WSz6yoR8tX5W0AuAZjpsBe6mCqYCdlA7aqHRFmHjkwAo0Eli
	IQaN11FashQ2LWeuQ0inksI4LFmIErAa0MGc/l5LwK22qWtKU+A1PkLxkZLzHTw==
X-Google-Smtp-Source: AGHT+IEQ0mHzthbytAS8eyolftKz1JqkUaR4qV6jomifOWCNp485ZfecaLw2j1twDeq58dbQEdVFTw==
X-Received: by 2002:a05:6e02:1a08:b0:424:7e36:f863 with SMTP id e9e14a558f8ab-424819ab873mr53155285ab.30.1758295527989;
        Fri, 19 Sep 2025 08:25:27 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42482ad64d1sm10124555ab.41.2025.09.19.08.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 08:25:27 -0700 (PDT)
Message-ID: <ca775631-4e45-4a58-8f30-133cfbba854e@riscstar.com>
Date: Fri, 19 Sep 2025 10:25:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
From: Alex Elder <elder@riscstar.com>
To: Yao Zi <ziyao@disroot.org>, Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-4-elder@riscstar.com>
 <20250918133209-GYB1273705@gentoo.org> <aMwYRGjTdbQCJf3S@pie>
 <c32cc8da-6703-496f-b30f-4961aa811869@riscstar.com>
Content-Language: en-US
In-Reply-To: <c32cc8da-6703-496f-b30f-4961aa811869@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_082529_605315_B972584A 
X-CRM114-Status: GOOD (  15.00  )
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

T24gOS8xOC8yNSAxMToyMiBBTSwgQWxleCBFbGRlciB3cm90ZToKPiBPbiA5LzE4LzI1IDk6MzMg
QU0sIFlhbyBaaSB3cm90ZToKPj4+IC4uIGVtLCBzbyB0aGUgU1BJIHdpbGwgdXNlIHBkbWEsIHRo
ZW4gcHJvYmFibHkgeW91IHNob3VsZCBhbHNvIGFkanVzdCAKPj4+IEtjb25maWcgdG8KPj4+IHNl
bGVjdCBQRE1BIGRyaXZlcj8KPj4gVGhlIGRyaXZlciBzZWVtcyB0byBkZXBlbmQgb24gdGhlIGdl
bmVyaWMgRE1BIGVuZ2luZSBBUEkgb25seSwgSU9XLAo+PiB0aGVvcmV0aWNhbGx5IGl0IHNob3Vs
ZCB3b3JrIHdpdGggb3RoZXIgRE1BIGNvbnRyb2xsZXIgYXMgd2VsbC4gQW5kIGl0J3MKPj4gZXZl
biBjYXBhYmxlIHRvIG9wZXJhdGUgd2l0aG91dCBETUEgKHNlZSBrMV9zcGlfZG1hX3NldHVwKCkp
Lgo+Pgo+PiBEZXBlbmRlbmN5IHRvIFBETUEgcmVhbGx5IGRvZXNuJ3Qgc2VlbSBzb21ldGhpbmcg
c2hvdWxkIGJlIGVuZm9yY2VkIGluCj4+IEtjb25maWc6IGl0IGRvZXNuJ3QgZXhpc3QgaW4gY29k
ZSBsZXZlbCwgYW5kIHRoZSBkcml2ZXIgaXMgYWN0dWFsbHkgbW9yZQo+PiBmbGV4aWJsZS4KPiAK
PiBZb3UncmUgcmlnaHQgb24gYm90aCBwb2ludHMuwqAgVGhlIGNvZGUgZG9lc24ndCAqcmVxdWly
ZSogUERNQSB0bwo+IG9wZXJhdGUgY29ycmVjdGx5ICh0byBteSBrbm93bGVkZ2UpLgo+IAo+IFlp
eHVuLCB3aGF0IGRvIHlvdSB0aGluaz8KPiAKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLUFsZXgKCkkgZGlkIHNvbWUgZXhwZXJpbWVudHMuICBDdXJyZW50bHksIGlm
IEkgYnVpbGQgYSBrZXJuZWwgd2l0aApTUElfU1BBQ0VNSVRfSzEgZW5hYmxlZCAobW9kdWxlIG9y
IGJ1aWx0LWluKSBidXQgTU1QX1BETUEKbm90IHNldCwgdGhlIEsxIFNQSSBkcml2ZXIgcHJvYmUg
ZG9lc24ndCBjb21wbGV0ZS4gIFRoZSByZWFzb24KaXMgdGhhdCBkbWFfcmVxdWVzdF9jaGFuKCkg
cmV0dXJucyAtRVBST0JFX0RFRkVSLCBub3QgImtub3dpbmciCnRoYXQgdGhlIG5lZWRlZCBkcml2
ZXIgd2lsbCBuZXZlciBzaG93IHVwLgoKRm9yIG5vdyBJIGhhdmUgYWRkZWQgYSBjYWxsIHRvIElT
X0VOQUJMRUQoQ09ORklHX01NUF9QRE1BKSBpbgpkZXZtX2sxX3NwaV9kbWFfc2V0dXAoKSwgYW5k
IGlmIGl0J3Mgbm90IGVuYWJsZWQgaXQgd2lsbApyZXR1cm4gMCAodG8gaW5kaWNhdGUgImFsbCBp
cyB3ZWxsLCBidXQgd2Ugd29uJ3QgdXNlIERNQSIpLgoKVGhhdCBkb2Vzbid0IGFsbG93IGZvciBh
IGRpZmZlcmVudCBETUEgb3B0aW9uLCBidXQgaXQgZG9lcwphbGxvdyB0aGUgZHJpdmVyIHRvIHdv
cmsgd2l0aG91dCBhbiBleHBsaWNpdCBkZXBlbmRlbmN5Cm9uIHRoZSBNTVBfUERNQSAodmlhIEtj
b25maWcpLgoKCQkJCQktQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
