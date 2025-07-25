Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49E0C83F26
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 07:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8CzSg2/ZZrnx7eEKxnL2JCm3R7JdRWJUHlIBo901j8=; b=mdlubXyDapWLun
	JT3FjaEPZ4r8iTQboNwyHu2eYaj/ouyt49zjDP1T1kkf+Ad+vGxgcs8Bu06WFZF0wOHGfnNUdUdIY
	YxSGcP28h1hb6ZjuM4vb2oppu3zHQeEHIFizGqeEZGPDuTiyHqSAfjEQMXu5RnpYb7ONSTB9JYYiE
	Yi5fLLJA1WIglFDKzGtPQvnRcsDz2618K/nziHhbC9jjTGpAmA3EXrTJyb8k4R9QEwJ9sh3tlu+ZD
	0kCLbhPwL7J/gxV0QWHBEhJGBSNS2eZ/EvDbvI3EZjkuGXMHghKSGRk7Zfn2m6hg7P1HHoqB6TKF2
	1W2s+W8wvwnh12LuuKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCR7-00000009DJn-3dsl;
	Fri, 25 Jul 2025 07:01:45 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCR5-00000009DJ0-20bl
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 07:01:44 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-af3322b7b9eso12158366b.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 00:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753426902; x=1754031702; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JpVKOJXR9kyoeqmQ1g7Wbt9QrQha91mnE2oeLb46rXU=;
        b=Va1RX6V3NqsorWA+ZLSe3L0PyLhub4GzEKBrNDkJzPeDucE39z975/6ErEhIbhSX++
         mfFOcwTclPq+/WSyhuvVKoa44/T/vc5nDwE8+jihY3J4Wue+cX9IbEBpc2yDXXwTLwZw
         GRHCJbHY5rh7idflzoYUTJnDRX7c1P1mQfJjlXvyivYMR7i3K2hgkqHnikIUS4bVrwiK
         am++Ugiu34I0Uv8jmtzDC/2pe5lhF6oqzqdVw/W0iVyxEPwyNnITE1YmmfrG1rDwhYqC
         tCaCfSn33a5K4t2UO4tf8w1d4gzPHARVjBqtKJVJFayVWU5VxAEjI5hlYd1v04Fbo6VY
         TpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753426902; x=1754031702;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpVKOJXR9kyoeqmQ1g7Wbt9QrQha91mnE2oeLb46rXU=;
        b=ZsAXtdmEDoQ+q1gBhnUP7ZiBWJJeUxInsRnBxVRDZkz842377ZnElvghcyuW9Hn90V
         g2qSsfZG5cwXYjeFZUdLMS0iDehC+NK+Sqzc6P6ckK5KKZ4OUKShTBJQ5SpIYVDQuhYi
         rwPv6zjCjSOy2x0w5FT14kxpWdO7bejzWfhdinchFKFvXj7OaJOlUrDXnMMktAaMRTgn
         kgijAFb1Ln1QIvaQfNH3ivy+bJWrg/D4GrTEZu4izbg2mN1MaOpFH377Cgpt5Otvpd19
         ZjVd1wBVrE42PEvIhgrd5+pvv52/TQDAnFCzwPUdW/S3fy65CkzIYdTA47t4s8Fst+jJ
         Z0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWWEpZvOqP5xzFfTHsDHCPqtW1yrbahHvnYm764oUXD+6f6jj/SQsGFIb12xA3tDHrO3V7BF8refzvCyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIkPGG8r2abUSpq3qXUVlLqavChvDGp8cP19Jy6x5GWku6VANi
	CwHq19T0hNhpZ+L708T4xv1zbcIDELx+5Ecc5r3XKigaIyqmb4hZflsgsiYBgAPWm+M=
X-Gm-Gg: ASbGncuNxAJTfPLtuYvVRruJJViYELOxyBJa4w5uHZhIztfkKhQKq4ZP3W4hYaUjPs1
	Ov3D5sWJMxHc0auz3/xgXtMiGOocj3GzdkhEjWIbg2oIUNugG6Qw00s55jENvrKunefLo7g+pGa
	YFk9xCX6HOB2Mwmcpn/sqU+JmDQE7yyffCNlY5VlP2mVrsEeRyP+ERp5+eewP1FjZ9ACml81G5C
	37dRubbuoMGfjSkpeWcFh69x/n/o8czg2unEcUDGU3op0Ni6c2CdRcFXS2HOkINMt9jeHK+0rKV
	w3S9/dKBgiN6+00m4Uc4BKFWBqMEOfFZWrRi++YXqp81L1qffCJCNBXaRvalcMSTYdM2H6eugQC
	CjsOTld9ZMy9C0Hyej+26cpFJsuOoDOolUt5Jh8Kc1Q==
X-Google-Smtp-Source: AGHT+IEnsvu+DtOBwQf2lbjIF393/Fbawzau8Up0k9C8FBeYnqVp9YHxSzUw1/E9eKPPhGd+l0fOfQ==
X-Received: by 2002:a17:907:2d2b:b0:ade:328a:95d1 with SMTP id a640c23a62f3a-af61cf97e45mr38902866b.10.1753426901599;
        Fri, 25 Jul 2025 00:01:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f44dfa7sm225087066b.82.2025.07.25.00.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 00:01:40 -0700 (PDT)
Message-ID: <8a5ade3f-a263-4ab6-add9-1640db29005e@linaro.org>
Date: Fri, 25 Jul 2025 09:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Matt Coster <Matt.Coster@imgtec.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
 <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
 <d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
 <e1a3d854-93bc-4771-9b8e-1639ca57b687@kernel.org>
 <d12fd4fb-0adb-40c4-8a0a-c685cd6327b3@samsung.com>
 <27068fd3-92b5-402b-9f3c-fd786db56668@kernel.org>
 <f25c1e7f-bef2-47b1-8fa8-14c9c51087a8@imgtec.com>
 <491b69ce-5a2f-4df1-95af-9318bbe6c9b0@samsung.com>
 <9c4f962d-6877-4a53-b0f3-218930f94e1e@imgtec.com>
 <07410f0c-8369-4683-9143-c79c6cb3f5b0@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <07410f0c-8369-4683-9143-c79c6cb3f5b0@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_000143_531899_D5B24328 
X-CRM114-Status: GOOD (  29.11  )
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

T24gMjMvMDcvMjAyNSAyMDoyNSwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4gCj4gCj4gT24g
Ny8yMy8yNSAxODo1MCwgTWF0dCBDb3N0ZXIgd3JvdGU6Cj4+IE9uIDIzLzA3LzIwMjUgMTc6MjYs
IE1pY2hhbCBXaWxjenluc2tpIHdyb3RlOgo+Pj4gT24gNy8yMy8yNSAxMTo0NSwgTWF0dCBDb3N0
ZXIgd3JvdGU6Cj4+Pj4gT24gMjUvMDYvMjAyNSAxNTo0MSwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPj4+Pj4gT24gMjUvMDYvMjAyNSAxNjoxOCwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6
Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IE9uIDYvMjUvMjUgMTU6NTUsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4+Pj4+Pj4gT24gMjUvMDYvMjAyNSAxNDo0NSwgTWljaGFsIFdpbGN6eW5za2kg
d3JvdGU6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIDYvMjQvMjUgMTU6NTMsIE1hdHQg
Q29zdGVyIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gMjMvMDYvMjAyNSAxMjo0MiwgTWljaGFsIFdpbGN6
eW5za2kgd3JvdGU6Cj4+Pj4+Pj4+Pj4gVXBkYXRlIHRoZSBpbWcscG93ZXJ2ci1yb2d1ZS55YW1s
IHRvIGluY2x1ZGUgdGhlIFQtSEVBRCBUSDE1MjAgU29DJ3MKPj4+Pj4+Pj4+PiBzcGVjaWZpYyBH
UFUgY29tcGF0aWJsZSBzdHJpbmcuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBUaGUgdGhlYWQsdGgx
NTIwLWdwdSBjb21wYXRpYmxlLCBhbG9uZyB3aXRoIGl0cyBmdWxsIGNoYWluCj4+Pj4+Pj4+Pj4g
aW1nLGltZy1ieG0tNC02NCwgYW5kIGltZyxpbWctcm9ndWUsIGlzIGFkZGVkIHRvIHRoZQo+Pj4+
Pj4+Pj4+IGxpc3Qgb2YgcmVjb2duaXplZCBHUFUgdHlwZXMuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
PiBUaGUgcG93ZXItZG9tYWlucyBwcm9wZXJ0eSByZXF1aXJlbWVudCBmb3IgaW1nLGltZy1ieG0t
NC02NCBpcyBhbHNvCj4+Pj4+Pj4+Pj4gZW5zdXJlZCBieSBhZGRpbmcgaXQgdG8gdGhlIHJlbGV2
YW50IGFsbE9mIGNvbmRpdGlvbi4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEFja2VkLWJ5OiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4+Pj4+Pj4+
Pj4gUmV2aWV3ZWQtYnk6IFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPgo+Pj4+
Pj4+Pj4+IFJldmlld2VkLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3
c2tpQGxpbmFyby5vcmc+Cj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5z
a2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPj4+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4+PiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcscG93ZXJ2ci1yb2d1ZS55
YW1sIHwgOSArKysrKysrKy0KPj4+Pj4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9ndWUueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvaW1nLHBvd2VydnItcm9n
dWUueWFtbAo+Pj4+Pj4+Pj4+IGluZGV4IDQ0NTBlMmU3M2IzY2NmNzRkMjlmMGUzMWUyZTY2ODdk
N2NiZTVkNjUuLjliMjQxYTBjMWY1OTQxZGM1OGExZTIzOTcwZjZkMzc3M2Q0MjdjMjIgMTAwNjQ0
Cj4+Pj4+Pj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9p
bWcscG93ZXJ2ci1yb2d1ZS55YW1sCj4+Pj4+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2dwdS9pbWcscG93ZXJ2ci1yb2d1ZS55YW1sCj4+Pj4+Pj4+Pj4gQEAg
LTIxLDYgKzIxLDExIEBAIHByb3BlcnRpZXM6Cj4+Pj4+Pj4+Pj4gICAgICAgICAgICAjIHdvcmsg
d2l0aCBuZXdlciBkdHMuCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAtIGNvbnN0OiBpbWcsaW1nLWF4
ZQo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgLSBjb25zdDogaW1nLGltZy1yb2d1ZQo+Pj4+Pj4+Pj4+
ICsgICAgICAtIGl0ZW1zOgo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgLSBlbnVtOgo+Pj4+Pj4+Pj4+
ICsgICAgICAgICAgICAgIC0gdGhlYWQsdGgxNTIwLWdwdQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAg
LSBjb25zdDogaW1nLGltZy1ieG0tNC02NAo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgLSBjb25zdDog
aW1nLGltZy1yb2d1ZQo+Pj4+Pj4+Pj4+ICAgICAgICAtIGl0ZW1zOgo+Pj4+Pj4+Pj4+ICAgICAg
ICAgICAgLSBlbnVtOgo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgIC0gdGksajcyMXMyLWdwdQo+
Pj4+Pj4+Pj4+IEBAIC05Myw3ICs5OCw5IEBAIGFsbE9mOgo+Pj4+Pj4+Pj4+ICAgICAgICBwcm9w
ZXJ0aWVzOgo+Pj4+Pj4+Pj4+ICAgICAgICAgIGNvbXBhdGlibGU6Cj4+Pj4+Pj4+Pj4gICAgICAg
ICAgICBjb250YWluczoKPj4+Pj4+Pj4+PiAtICAgICAgICAgICAgY29uc3Q6IGltZyxpbWctYXhl
LTEtMTZtCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgIGVudW06Cj4+Pj4+Pj4+Pj4gKyAgICAgICAg
ICAgICAgLSBpbWcsaW1nLWF4ZS0xLTE2bQo+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICAgIC0gaW1n
LGltZy1ieG0tNC02NAo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoaXMgaXNuJ3QgcmlnaHQg4oCTIEJY
TS00LTY0IGhhcyB0d28gcG93ZXIgZG9tYWlucyBsaWtlIEJYUy00LTY0LiBJIGRvbid0Cj4+Pj4+
Pj4+PiByZWFsbHkga25vdyB3aGF0IHRoZSByaWdodCB3YXkgdG8gaGFuZGxlIHRoYXQgaW4gZGV2
aWNldHJlZSBpcyBnaXZlbiB0aGUKPj4+Pj4+Pj4+IFRIMTUyMCBhcHBlYXJzIHRvIGV4cG9zZSBv
bmx5IGEgdG9wLWxldmVsIGRvbWFpbiBmb3IgdGhlIGVudGlyZSBHUFUsIGJ1dAo+Pj4+Pj4+Pj4g
dGhlcmUgYXJlIGRlZmluaXRlbHkgdHdvIHNlcGFyYXRlIGRvbWFpbnMgdW5kZXJuZWF0aCB0aGF0
IGFzIGZhciBhcyB0aGUKPj4+Pj4+Pj4+IEdQVSBpcyBjb25jZXJuZWQgKHNlZSB0aGUgYXR0YWNo
ZWQgc25pcHBldCBmcm9tIGludGVncmF0aW9uIGd1aWRlKS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBT
aW5jZSBwb3dlciBub2RlcyBhcmUgcmVmLWNvdW50ZWQgYW55d2F5LCBkbyB3ZSBqdXN0IHVzZSB0
aGUgc2FtZSBub2RlCj4+Pj4+Pj4+PiBmb3IgYm90aCBkb21haW5zIGFuZCBsZXQgdGhlIGRyaXZl
ciB1cC9kb3duLWNvdW50IGl0IHR3aWNlPwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBIaSBNYXR0LAo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiBUaGFua3MgZm9yIHRoZSB2ZXJ5IGhlbHBmdWwgaW5zaWdodC4gVGhhdCdz
IGEgZ3JlYXQgcG9pbnQsIGl0IHNlZW1zIHRoZQo+Pj4+Pj4+PiBTb0MncyBkZXNpZ24gcHJlc2Vu
dHMgYSB0cmlja3kgY2FzZSBmb3IgdGhlIGJpbmRpbmdzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIHNl
ZSB3aGF0IHlvdSBtZWFuIGFib3V0IHBvdGVudGlhbGx5IHVzaW5nIHRoZSBzYW1lIHBvd2VyIGRv
bWFpbiBub2RlCj4+Pj4+Pj4+IHR3aWNlLiBNeSBvbmx5IGhlc2l0YXRpb24gaXMgdGhhdCBpdCBt
aWdodCBiZSBhIGJpdCB1bmNsZWFyIGZvciBzb21lb25lCj4+Pj4+Pj4+IHJlYWRpbmcgdGhlIGRl
dmljZXRyZWUgbGF0ZXIuIFBlcmhhcHMgYW5vdGhlciBvcHRpb24gY291bGQgYmUgdG8gcmVsYXgK
Pj4+Pj4+Pj4gdGhlIGNvbnN0cmFpbnQgZm9yIHRoaXMgY29tcGF0aWJsZT8KPj4+Pj4+Pj4KPj4+
Pj4+Pj4gS3J6eXN6dG9mLCB3ZSdkIGJlIGdyYXRlZnVsIGZvciB5b3VyIHRob3VnaHRzIG9uIGhv
dyB0byBiZXN0IG1vZGVsIHRoaXMKPj4+Pj4+Pj4gc2l0dWF0aW9uLgo+Pj4+Pj4+Cj4+Pj4+Pj4K
Pj4+Pj4+PiBJdCdzIHlvdXIgaGFyZHdhcmUsIHlvdSBzaG91bGQgdGVsbCB1cywgbm90IG1lLiBJ
IGRvbid0IGtub3cgaG93IG1hbnkKPj4+Pj4+PiBwb3dlciBkb21haW5zIHlvdSBoYXZlIHRoZXJl
LCBidXQgZm9yIHN1cmUgaXQgaXMgbm90IG9uZSBBTkQgdHdvIGRvbWFpbnMKPj4+Pj4+PiB0aGUg
c2FtZSB0aW1lLiBJdCBpcyBlaXRoZXIgb25lIG9yIHR3bywgYmVjYXVzZSBwb3dlciBkb21haW5z
IGFyZSBub3QKPj4+Pj4+PiB0aGUgc2FtZSBhcyByZWd1bGF0b3Igc3VwcGxpZXMuCj4+Pj4+Pgo+
Pj4+Pj4gSGkgS3J6eXN6dG9mLCBNYXR0LAo+Pj4+Pj4KPj4+Pj4+IFRoZSBpbWcsYnhtLTQtNjQg
R1BVIElQIGl0c2VsZiBpcyBkZXNpZ25lZCB3aXRoIHR3byBzZXBhcmF0ZSBwb3dlcgo+Pj4+Pj4g
ZG9tYWlucy4gVGhlIFRIMTUyMCBTb0MsIHdoaWNoIGludGVncmF0ZXMgdGhpcyBHUFUsIHdpcmVz
IGJvdGggb2YgdGhlc2UKPj4+Pj4+IHRvIGEgc2luZ2xlIE9TIGNvbnRyb2xsYWJsZSBwb3dlciBn
YXRlIChjb250cm9sbGVkIHZpYSBtYWlsYm94IGFuZCBFOTAyCj4+Pj4+PiBjby1wcm9jZXNzb3Ip
Lgo+Pj4+Pgo+Pj4+PiBUaGlzIGhlbHBzLi4uIGFuZCBhbHNvIHNvdW5kcyBhIGxvdCBsaWtlIHJl
Z3VsYXRvciBzdXBwbGllcywgbm90IHBvd2VyCj4+Pj4+IGRvbWFpbnMuIDovCj4+Pj4KPj4+PiBB
cG9sb2dpZXMgZm9yIHRha2luZyBzbyBsb25nIHRvIGdldCBiYWNrIHRvIHlvdSB3aXRoIHRoaXMs
IEkgd2FudGVkIHRvCj4+Pj4gbWFrZSBzdXJlIEkgaGFkIHRoZSB3aG9sZSBwaWN0dXJlIGZyb20g
b3VyIHNpZGUgYmVmb3JlIGNvbW1lbnRpbmcgYWdhaW4uCj4+Pj4KPj4+PiBGcm9tIHRoZSBHUFUg
c2lkZSwgYSAidHlwaWNhbCIgaW50ZWdyYXRpb24gb2YgQlhNLTQtNjQgd291bGQgdXNlIHR3bwo+
Pj4+IHBvd2VyIGRvbWFpbnMuCj4+Pj4KPj4+PiBUeXBpY2FsbHksIHRoZXNlIGRvbWFpbnMgZXhp
c3QgaW4gc2lsaWNvbiwgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZXkKPj4+PiBhcmUgZXhwb3Nl
ZCB0byB0aGUgaG9zdCBPUywgYmVjYXVzZSB0aGUgU29DJ3MgcG93ZXIgY29udHJvbGxlciBtdXN0
IGhhdmUKPj4+PiBjb250cm9sIG92ZXIgdGhlbS4gQXMgcGFydCBvZiBub3JtYWwgb3BlcmF0aW9u
LCB0aGUgR1BVIGZpcm13YXJlIChhbHdheXMKPj4+PiBpbiBkb21haW4gImEiIG9uIFJvZ3VlKSB3
aWxsIHJlcXVlc3QgdGhlIHBvd2VyLXVwL2Rvd24gb2YgdGhlIG90aGVyCj4+Pj4gZG9tYWlucywg
aW5jbHVkaW5nIGR1cmluZyB0aGUgaW5pdGlhbCBib290IHNlcXVlbmNlLiBUaGlzIGFsbCBoYXBw
ZW5zCj4+Pj4gdHJhbnNwYXJlbnRseSB0byB0aGUgT1MuIFRoZSBHUFUgYmxvY2sgaXRzZWxmIGhh
cyBubyBwb3dlciBnYXRpbmcgYXQKPj4+PiB0aGF0IGxldmVsLCBpdCByZWxpZXMgZW50aXJlbHkg
b24gdGhlIFNvQyBpbnRlZ3JhdGlvbi4KPj4+Pgo+Pj4+IEhvd2V2ZXIsIGl0IHR1cm5zIG91dCAo
dW5rbm93biB0byBtZSB1bnRpbCB2ZXJ5IHJlY2VudGx5KSB0aGF0IHRoaXMKPj4+PiBmdW5jdGlv
bmFsaXR5IGlzIG9wdGlvbmFsLiBUaGUgaW50ZWdyYXRvciBjYW4gb3B0IHRvIGZvcmVnbyB0aGUK
Pj4+PiBwb3dlci1zYXZpbmcgZnVuY3Rpb25hbGl0eSBhZmZvcmRlZCBieSBmaXJtd2FyZS1jb250
cm9sbGVkIHBvd2VyIGdhdGluZwo+Pj4+IGFuZCBqdXN0IHRocm93IGV2ZXJ5dGhpbmcgaW50byBh
IHNpbmdsZSBkb21haW4sIHdoaWNoIGFwcGVhcnMgdG8gYmUKPj4+PiB3aGF0J3MgaGFwcGVuZWQg
aGVyZS4KPj4+Pgo+Pj4+IE15IG9ubHkgcmVtYWluaW5nIGlzc3VlIGhlcmUsIHRoZW4sIGlzIHRo
ZSBuYW1pbmcuIFNpbmNlIHRoaXMKPj4+PiBpbnRlZ3JhdGlvbiBkb2Vzbid0IHVzZSBkaXNjcmV0
ZSBkb21haW5zLCBzYXlpbmcgaXQgaGFzIG9uZSBkb21haW4KPj4+PiBjYWxsZWQgImEiIGlzbid0
IGNvcnJlY3QqLiBXZSBzaG91bGQgZWl0aGVyOgo+Pj4+Cj4+Pj4gIC0gRHJvcCB0aGUgbmFtZSBh
bHRvZ2V0aGVyIGZvciB0aGlzIGludGVncmF0aW9uIChhbmQgb3RoZXJzIGxpa2UgaXQKPj4+PiAg
ICB0aGF0IGRvbid0IHVzZSB0aGUgbG93LXBvd2VyIGZ1bmN0aW9uYWxpdHksIGlmIHRoZXJlIGFy
ZSBhbnkpLCBvcgo+Pj4KPj4+IEhpIE1hdHQsCj4+Pgo+Pj4gVGhhbmtzIGZvciB0aGUgZGV0YWls
ZWQgZXhwbGFuYXRpb24sIHRoYXQgY2xlYXJzIHRoaW5ncyB1cCBwZXJmZWN0bHkuCj4+Cj4+IEkn
bSBnbGFkIEkgY291bGQgZ2V0IHRvIHRoZSBib3R0b20gb2YgdGhpcyBvbmUsIGl0IHdhcyBib3Ro
ZXJpbmcgbWUgdG9vIQo+Pgo+Pj4KPj4+IEkgYWdyZWUgd2l0aCB5b3VyIGFzc2Vzc21lbnQuIERy
b3BwaW5nIHRoZSBwb3dlci1kb21haW4tbmFtZXMgcHJvcGVydHkKPj4+IGZvciB0aGlzIGludGVn
cmF0aW9uIHNlZW1zIGxpa2UgdGhlIGNsZWFuZXN0IHNvbHV0aW9uLiBBcyB5b3UgcG9pbnRlZAo+
Pj4gb3V0LCBzaW5jZSB0aGUgT1Mgc2VlcyBvbmx5IGEgc2luZ2xlLCB1bmRpZmZlcmVudGlhdGVk
IHBvd2VyIGRvbWFpbiwKPj4+IGdpdmluZyBpdCBhIG5hbWUgbGlrZSAiZ3B1IiB3b3VsZCBiZSBy
ZWR1bmRhbnQuIFRoaXMgYXBwcm9hY2ggY29ycmVjdGx5Cj4+PiBtb2RlbHMgdGhlIGhhcmR3YXJl
IHdpdGhvdXQgc2V0dGluZyBhIHBvdGVudGlhbGx5IGNvbmZ1c2luZyBwcmVjZWRlbnQuCj4+Cj4+
IFRoYXQgc2VlbXMgcmVhc29uYWJsZS4gSSB3YXMgdmVyeSBtdWNoIG9uIHRoZSBmZW5jZSBmb3Ig
dGhpcyBvbmUsIHNvCj4+IEknbGwgaGFwcGlseSBnbyBhbG9uZyB3aXRoIGRyb3BwaW5nIHRoZSBu
YW1lIGFsdG9nZXRoZXIuCj4+Cj4+IEp1c3QgdG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFuZCBjb3Jy
ZWN0bHksIHRoZSBjaGFuZ2UgaGVyZSB3b3VsZCBiZSB0bwo+PiBtb3ZlICJyZXF1aXJlZDogLSBw
b3dlci1kb21haW4tbmFtZXMiIGZyb20gImltZyxpbWctcm9ndWUiIHRvIGV2ZXJ5Cj4+IGNvbmRp
dGlvbmFsIGJsb2NrIHRoYXQgY29uc3RyYWlucyB0aGUgbnVtYmVyIG9mIGRvbWFpbnM/Cj4+Cj4+
IENhbiB3ZSBhZGQgbmVnYXRpdmUgY29uc3RyYWludHMgaW4gY29uZGl0aW9uYWxzPyBUaGVuIHdl
IGNvdWxkIGFkZAo+PiAicG93ZXItZG9tYWluLW5hbWVzOiBmYWxzZSIgdG8gdGhlICJ0aGVhZCx0
aDE1MjAtZ3B1IiBjb25kaXRpb25hbCBibG9jawo+PiBhbG9uZ3NpZGUgInBvd2VyLWRvbWFpbnM6
IG1heEl0ZW1zOiAxIi4KPiAKPiBZZWFoIHRoZSBkaWZmIHdpdGggdjcgd291bGQgbG9vayBsaWtl
IHNvOgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1
L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZ3B1L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwKPiBpbmRleCAyNjNjNDBjODQzOGUuLjMzODc0
NmYzOWNiYiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Z3B1L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZ3B1L2ltZyxwb3dlcnZyLXJvZ3VlLnlhbWwKPiBAQCAtODksNiArODksMTEg
QEAgYWxsT2Y6Cj4gICAgICAgICAgY29tcGF0aWJsZToKPiAgICAgICAgICAgIGNvbnRhaW5zOgo+
ICAgICAgICAgICAgICBjb25zdDogaW1nLGltZy1yb2d1ZQo+ICsgICAgICBub3Q6Cj4gKyAgICAg
ICAgcHJvcGVydGllczoKPiArICAgICAgICAgIGNvbXBhdGlibGU6Cj4gKyAgICAgICAgICAgIGNv
bnRhaW5zOgo+ICsgICAgICAgICAgICAgIGNvbnN0OiB0aGVhZCx0aDE1MjAtZ3B1CgpObywgZG9u
J3QgZG8gdGhhdC4gQW55d2F5LCBpZiB5b3UgYXJlIGdvaW5nIHRvIHJld3JpdGUgcGF0Y2gsIHlv
dSBNVVNUCmRyb3AgYWxsIHRhZ3MsIGRvY3VtZW50IGl0IGFuZCBleHBsaWNpdGx5IGFzayBmb3Ig
cmUtcmV2aWV3LgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
