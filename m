Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAE1EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 06:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Uy5Pp3wrB7oKjr7jO7dgfI53o/Bjg2AbiVQNb2VmXU=; b=Qp4R0VrbpW2W6J
	nmp6cIdSd+QOC/YMEhxvfR1m0w/f9OgGvFBBJPv/j8iF2VZ6dLyLrlK77FG648De5mfQhcoiA3jO3
	ZuDY96rImN5reuw5HRnWysXHgA/8hSvypGrDJYPYOCPjP5kI1PdyspOGWbs+19sBT77+3fZ3cgoOJ
	qz/nrKrOfHJPeBthHJ2fERnr/6LQZowuKf8EUY0cAF9Djbd+Cf4ndViDJ4B8NpUOdxTMZ+SFzVZJT
	ag8ta2nENwRrQgyPnNyjkAW90qoyR1APWvekRJLuWRjfu8W+X82k0SmjTm0xiwLBT9ptaA/i5UScN
	1BYf4YJqjvPyysiu7f2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHQo-001zOT-0u;
	Fri, 28 Jul 2023 06:58:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHQl-001zML-1J
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 06:58:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3141fa31c2bso1645199f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 23:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690527507; x=1691132307;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iftaUnOVi0WItO5ujzoJ74yz/u7rI0zj1tXOnX70SiU=;
        b=gnTkAf4jKjqvw3D0gLbYc3BVQKNvCUIJXKHHBHEq5LLEy0xMC3Wye8gy53UmiEdyMH
         8+zOqQyvd/pbLBQzM7VNhGyzRqc4JR7Mh1JZxilfeSoi8SozTrYIlKq1Tqx9PonbEJyQ
         nONzdxsCgAOgKvwaaNxQiMxaQz7NBTDJIpyNH+ZHdNOcwEGdwGVXorKtnvFiPHBpcEnn
         vbP+EtzBk5GXe8jDMCtcHt5/KZM+5yI33wsU6Lm3GKl6hpvtbF4DfQB+SJ5dV1qqnTZE
         FRStCo0U+/8FjqHemMjf6WtuFhUXremL6VRQ2wIocxkHgCjtVisvXdQDDxFneQ6p3KP0
         NO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690527507; x=1691132307;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iftaUnOVi0WItO5ujzoJ74yz/u7rI0zj1tXOnX70SiU=;
        b=fYcOXgLXzIq3C8n4cd/HHhJRajdYqCIuoxkH1VsetBsQHio+HIApxcg38BwTHs/ujA
         eTNeo97GsHNjjC7vqzZ6NMKZOm03xmu21Z6woj+iUIhFgvPTrnqjC9n+6tKqEMptO8NY
         rjK/CTk9hhIQxi0htetxjmjIkLNPHEa/RiSIPBOqBkOsUhb8Rj7RosjWXrmIWBOl4GcD
         fkLOxyFUMdHJFfbeVgNZLnMBG0hTkknnPQ3KizvReUd04bdp0qOhG7b7JgaisACwvznU
         aGjE6Kx4Slc9W+xDSt37NbAw55cs9aVWM4tkhFZN+9ymIc1oKzOnkdki2uSk8hKnolbC
         xGIQ==
X-Gm-Message-State: ABy/qLYKruqUap8g/i5E3Vg8420XKTZwFKpj7ykUtQtE+uIyFBmIHnGU
	PDz9uX3CPDgLbcTzIMvxnrqXsg==
X-Google-Smtp-Source: APBJJlH74MhrNj52K2JQ3OFV5R+EOUknys3ZEpt8lbO1nGVe2KfuEUWoAPNijHM7Yry2nXJj/++DrQ==
X-Received: by 2002:a5d:5589:0:b0:317:6ef1:7939 with SMTP id i9-20020a5d5589000000b003176ef17939mr1030919wrv.23.1690527507368;
        Thu, 27 Jul 2023 23:58:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id o3-20020adfe803000000b003143b7449ffsm345862wrm.25.2023.07.27.23.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 23:58:26 -0700 (PDT)
Message-ID: <be748338-987b-d474-d040-82af7cfb5f01@linaro.org>
Date: Fri, 28 Jul 2023 08:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Content-Language: en-US
To: Eric Lin <eric.lin@sifive.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, greentime.hu@sifive.com, vincent.chen@sifive.com
References: <20230720135125.21240-1-eric.lin@sifive.com>
 <20230720135125.21240-2-eric.lin@sifive.com>
 <cbf0a8fd-3479-1684-fe90-81f2159804ef@linaro.org>
 <CAPqJEFr5h+5+F4TdNuRMaWsrmeedbfGgbgd9wh8sUUQsj2Pw-A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPqJEFr5h+5+F4TdNuRMaWsrmeedbfGgbgd9wh8sUUQsj2Pw-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_235831_454119_6078B1A3 
X-CRM114-Status: GOOD (  16.16  )
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

T24gMjgvMDcvMjAyMyAwODowMSwgRXJpYyBMaW4gd3JvdGU6Cj4gSGkgS3J6eXN6dG9mLAo+IAo+
IE9uIEZyaSwgSnVsIDIxLCAyMDIzIGF0IDQ6MzXigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCj4g
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDIwLzA3LzIw
MjMgMTU6NTEsIEVyaWMgTGluIHdyb3RlOgo+Pj4gVGhpcyBhZGQgWUFNTCBEVCBiaW5kaW5nIGRv
Y3VtZW50YXRpb24gZm9yIFNpRml2ZSBQcml2YXRlIEwyCj4+PiBjYWNoZSBjb250cm9sbGVyCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRXJpYyBMaW4gPGVyaWMubGluQHNpZml2ZS5jb20+Cj4+PiBS
ZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6
IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPj4KPj4KPj4gLi4uCj4+Cj4+PiArcHJvcGVy
dGllczoKPj4+ICsgIGNvbXBhdGlibGU6Cj4+PiArICAgIGl0ZW1zOgo+Pj4gKyAgICAgIC0gY29u
c3Q6IHNpZml2ZSxwbDJjYWNoZTEKPj4KPj4gSSBzdGlsbCBoYXZlIGRvdWJ0cyB0aGF0IGl0IGlz
IG5vdCB1c2VkIGluIGFueSBTb0MuIFRoaXMgaXMgd2hhdCB5b3UKPj4gc2FpZCBsYXN0IHRpbWU6
ICJpcyBub3QgcGFydCBvZiBhbnkgU29DLiIKPj4gSWYgbm90IHBhcnQgb2YgYW55IFNvQywgdGhl
biB3aGVyZSBpcyBpdD8gV2h5IGFyZSB5b3UgYWRkaW5nIGl0IHRvIHRoZQo+PiBrZXJuZWw/Cj4+
Cj4gCj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBJIGRpZG4ndCBkZXNjcmliZSBpdCBjbGVh
cmx5IGxhc3QgdGltZS4KPiBDdXJyZW50bHksIHdlIGhhdmUgdHdvIGhhcmR3YXJlIHZlcnNpb25z
IG9mIHBsMmNhY2hlOiBwbDJjYWNoZTAgYW5kIHBsMmNhY2hlMS4KPiBUaGUgcGwyY2FjaGUwIGlz
IHVzZWQgaW4gdW5tYXRjaGVkIGJvYXJkIFNvQy4gVGhlIHBsMmNhY2hlMSBpcwo+IHV0aWxpemVk
IGluIG91ciBpbnRlcm5hbCBGUEdBIHBsYXRmb3JtIGZvciBldmFsdWF0aW9uOyBpdCdzIG91ciBj
b3JlCj4gSVAuCgpBbmQgd2h5IGRvIHlvdSBhZGQgYmluZGluZ3MgZm9yIHNvbWUgaW50ZXJuYWwg
RlBHQSBJUCBibG9jayB3aGljaCBkb2VzCm5vdCBpbnRlcmZhY2Ugd2l0aCBhbnkgU1c/CgpCZXN0
IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
