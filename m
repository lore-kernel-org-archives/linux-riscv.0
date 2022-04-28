Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93565C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 05:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvdjpGJDjKCgHI38JoEAdpxWOfmyV8ZDqpEkJXm+toE=; b=j/eJ17J4eQialI
	jCL+EJh2h08Wt4Lxtj7Agm9wY9FMpqL29Yjo74lL123/2gjRrADynG4kBPYDcYVLbwCymC4ssRSUo
	Y3STrXB5sOqHtaiQQdZjdU8/hnJ7sGzHYd1+HiD1YBFCgop6Qpgzp/fWMp7OLP3UXfg9qOcdGI/cV
	35xtm11Mu2M7I1LQFgxpA1x1HhNGOzbtUXPMedMsb7daOCg3axIAMrQ1O/VVyUPACQohL+e+j9eLz
	0FYfHXltLYBRC+4E1Nai2RlmSF1eCBA7wVJd5N9UyNikAx53IHBgosBxxD4dk4n+WmWhW4KKno1ob
	iQVWICfsTj7YOdq3J4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njwoN-004jio-0H; Thu, 28 Apr 2022 05:35:31 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njwoK-004jgv-G5; Thu, 28 Apr 2022 05:35:29 +0000
Received: by mail-ej1-x62f.google.com with SMTP id g6so7352055ejw.1;
 Wed, 27 Apr 2022 22:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n6GB1/WywBgvh+64+Tjj1z6mIuDmSgmvtpDpu9gTFhI=;
 b=Sk9QjBASR1ZDnIiWemIfYQHAyckj3WwUQ0Dk1x8vUbtZKw+Ps2RXC6ddu1yuaUfDpB
 gMi/A8uQw0hEu+F47+bjMp3t0QSCs67/abhdlEHByg/jPyQayH7pn4Niiz8YRh5dR/se
 xln6tUHCH2ERr0czmm5bEvYM2ukGDy9YomaBo1EqTSTx4xoNVJ08d1wBBXiam8xKQTnx
 m2eyYfCopyih6EYsIGG1jf7cGgoW/UdVQ6fuA03CTOCzsi1Xz/KgZtBjOu5G13Jw3OOq
 KE1LJORJpVZYpyh+W5+KQw59PhV/1nUPGPeM7fCd356wan6bL63d95Hnn1EfATYDBxWT
 v/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n6GB1/WywBgvh+64+Tjj1z6mIuDmSgmvtpDpu9gTFhI=;
 b=o2ue+/sAwmOyqjJJeykIOKTo0rKfCvM5lfLP9aB+b+em1bMsZ++DGs84makqKIZJ9P
 EkNCo69P3laXMo6TtNPfzb5fQ++zHBmbjhkgIPEKmSWXgzzXRb1NY99QiemtLT6+sFBN
 t/Cjb/VViYHVM+Qp31LCk3g3YpOto9c7MV4cIx1MULnoSSPl+ghmKZITpu9syUhl4FxK
 KuUS9Ef+TuAv1cBW+8eyWvnnMl9dPBVPa7TshjSPlaPyrjJYfk40nfFDhIOyW96g1wCu
 J6zkVQXp+BuozP9n7TN8PDsoG4d6xiBaTwWjz5+cNuSTjvQnlHrEFywJWN1A89Ep4t7u
 sGng==
X-Gm-Message-State: AOAM532DnbXzlVdPhV5/fHEdu7f1hI9XrUse5FxUz1igjLkCvpOfAEe2
 G5Zxiv9nvgb/90LFXbh4JwI=
X-Google-Smtp-Source: ABdhPJxOTXVpvT//Cj+0qyGctmcgG8tu4Sgrf5+zvtxXeIcbwKP79h4Ibc/zhuPFP2T8AkYgQw4Smw==
X-Received: by 2002:a17:907:72cd:b0:6f3:a068:a2ce with SMTP id
 du13-20020a17090772cd00b006f3a068a2cemr16041538ejc.563.1651124126336; 
 Wed, 27 Apr 2022 22:35:26 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 b6-20020aa7cd06000000b0042617ba63a9sm886885edw.51.2022.04.27.22.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 22:35:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org, Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/5] iommu/sun50i: Ensure the IOMMU can be used for DMA
Date: Thu, 28 Apr 2022 07:35:24 +0200
Message-ID: <1762951.8hzESeGDPO@jernej-laptop>
In-Reply-To: <20220428010401.11323-6-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org>
 <20220428010401.11323-6-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_223528_571660_99D9B3D9 
X-CRM114-Status: GOOD (  13.37  )
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

RG5lIMSNZXRydGVrLCAyOC4gYXByaWwgMjAyMiBvYiAwMzowNDowMCBDRVNUIGplIFNhbXVlbCBI
b2xsYW5kIG5hcGlzYWwoYSk6Cj4gU28gZmFyLCB0aGUgZHJpdmVyIGhhcyByZWxpZWQgb24gYXJj
aC9hcm02NC9LY29uZmlnIHRvIHNlbGVjdCBJT01NVV9ETUEuCj4gVW5zdXJwcmlzaW5nbHksIHRo
aXMgZG9lcyBub3Qgd29yayBvbiBSSVNDLVYsIHNvIHRoZSBkcml2ZXIgbXVzdCBzZWxlY3QKPiBJ
T01NVV9ETUEgaXRzZWxmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11
ZWxAc2hvbGxhbmQub3JnPgoKUmV2aWV3ZWQtYnk6IEplcm5laiBTa3JhYmVjIDxqZXJuZWouc2ty
YWJlY0BnbWFpbC5jb20+CgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKPiAtLS0KPiAKPiAgZHJpdmVy
cy9pb21tdS9LY29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L0tjb25maWcgYi9kcml2ZXJzL2lvbW11L0tj
b25maWcKPiBpbmRleCBjNzlhMGRmMDkwYzAuLjcwYTBiZmE2ZDkwNyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2lvbW11L0tjb25maWcKPiArKysgYi9kcml2ZXJzL2lvbW11L0tjb25maWcKPiBAQCAt
MjIzLDYgKzIyMyw3IEBAIGNvbmZpZyBTVU41MElfSU9NTVUKPiAgCWRlcGVuZHMgb24gQVJDSF9T
VU5YSSB8fCBDT01QSUxFX1RFU1QKPiAgCXNlbGVjdCBBUk1fRE1BX1VTRV9JT01NVQo+ICAJc2Vs
ZWN0IElPTU1VX0FQSQo+ICsJc2VsZWN0IElPTU1VX0RNQQo+ICAJaGVscAo+ICAJICBTdXBwb3J0
IGZvciB0aGUgSU9NTVUgaW50cm9kdWNlZCBpbiB0aGUgQWxsd2lubmVyIEg2IFNvQ3MuCgoKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
