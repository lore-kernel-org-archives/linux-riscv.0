Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B887AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 05:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/HO7oxHAIsSIeswKTwHag0jqGdtBBGxi89gtvDEYV8=; b=VU5M8avHenzYGW
	byg5TB4+XifZgP5JmpzKSCqpxBwM9ZHDko8KIl0NJ+36QWAbS8FSloCTUy7CX3SSdExbN5sDAs3XW
	jTFwVEq9uS30PHxfQjGTbKBGwJNE2LOCVpswq/Y1A93Z1BDNKflq1cpKsuPbMM5wsP534jyF7S1DD
	yczq/SXCt5zO7ndfxrW3i+AESwIh+CGlcaQTGsjEzkfXEnd+KkknpylAePbkXAUTO4WBcmrAtSCe4
	CdrRRefoTiNhQEPYq7aeyP/8905AubJec374SAPif/cBw/Lrzwrmuligbdp+pHKZn3NYMga2UFoKC
	dUaH0lPAQVMLkOwbaUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njwny-004jZx-PN; Thu, 28 Apr 2022 05:35:06 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njwnv-004jYE-4f; Thu, 28 Apr 2022 05:35:04 +0000
Received: by mail-ed1-x529.google.com with SMTP id k27so4235688edk.4;
 Wed, 27 Apr 2022 22:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q+eUJv9+G15IKxU6f/ds8z9ndhSiLJLYEEsP0KxbxHA=;
 b=ED+2Y6JfSdVUXkpMQIz27N8z4Q5f+APo0eGC7FPjO7L/C6/GDpmhoE4COt0l5gA7ge
 rH7ORahf3k4ZeKalAOKZmYX3t33EqRRDeOYe8Td09u4y7mGAtK+/BYl3i8Hyp6Qwx5HZ
 y7UN625BX4v8/r5BE/7EgXFTPS7T+FGcqiMARQHZcLrMtrIg3tG4UAbvbIJFWmgYFEAA
 AnR/gKZ78siMitch/BVJwDdJMd8e+ftMv/ojheDlyfufWsvfgPYZI49MIOdFVEZsg6FQ
 14VQSJ67DmT2bUWmAG95Yhl2tRx6nTeHMMA7n+3gT0Kk76W6QNFG2psxZZVM760BLUjs
 II2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q+eUJv9+G15IKxU6f/ds8z9ndhSiLJLYEEsP0KxbxHA=;
 b=SmLwWi6bOeK87KstBkG8kJObMm0Lasl+paa6GYYa0Sxj7S98ENF+WBtNyWEgYL0R49
 GbGQgSvYJl2KOiQno1qt2KA4ui9uDPCCCpYQr9Tbm82KkDuJSWmsJCc9tjMHN4+SXVi6
 S2g4OZL3PJBMql+R0VeWSRnI+b2shuNIJyocFJYSwvOUVfF53RNQxj/bFoN0IGKPWVym
 aX6MBfMHDYp/Nmd6BF+lhqBFL0YeY4ydvTOTaRKMGaCVtI/e3j+SH3wHBnZiLS6P2f1e
 BoIDiz+R5fX3viAg3/2YkSuw15DcOWjvgjfwuQ+pSJNErwJocpHWc3BMXMMFK0GJo1Cu
 n9RQ==
X-Gm-Message-State: AOAM532Y+Ra6z7tr4zTQduVIODBwt77gMdQDnmqXCLzfx5XCkXaY+Dgv
 ImqoN7/H0ZrSrGx9iWnuBvs=
X-Google-Smtp-Source: ABdhPJwRmhqGmKmdzX4KIXgkDoCMGASyY4aGra++WokhDjLD8F+KBZu9SF1mTqE2Q+aZ9CJOKTHcUQ==
X-Received: by 2002:a05:6402:5106:b0:425:f733:8d9b with SMTP id
 m6-20020a056402510600b00425f7338d9bmr15264075edd.326.1651124101019; 
 Wed, 27 Apr 2022 22:35:01 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 s2-20020a1709066c8200b006e4e1b1f875sm7884833ejr.199.2022.04.27.22.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 22:35:00 -0700 (PDT)
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
Subject: Re: [PATCH 4/5] iommu/sun50i: Add support for the D1 variant
Date: Thu, 28 Apr 2022 07:34:59 +0200
Message-ID: <2752686.88bMQJbFj6@jernej-laptop>
In-Reply-To: <20220428010401.11323-5-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org>
 <20220428010401.11323-5-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_223503_254284_06AC6B9D 
X-CRM114-Status: GOOD (  16.02  )
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

RG5lIMSNZXRydGVrLCAyOC4gYXByaWwgMjAyMiBvYiAwMzowMzo1OSBDRVNUIGplIFNhbXVlbCBI
b2xsYW5kIG5hcGlzYWwoYSk6Cj4gRDEgY29udGFpbnMgYW4gSU9NTVUgc2ltaWxhciB0byB0aGUg
b25lIGluIHRoZSBINiBTb0MsIGJ1dCB0aGUgRDEKPiB2YXJpYW50IGhhcyBubyBleHRlcm5hbCBy
ZXNldCBzaWduYWwuIEl0IGFsc28gaGFzIHNvbWUgcmVnaXN0ZXIKPiBkZWZpbml0aW9uIGNoYW5n
ZXMsIGJ1dCBub25lIHRoYXQgYWZmZWN0IHRoZSBjdXJyZW50IGRyaXZlci4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KClJldmlld2VkLWJ5
OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgoKQmVzdCByZWdhcmRz
LApKZXJuZWoKCj4gLS0tCj4gCj4gIGRyaXZlcnMvaW9tbXUvc3VuNTBpLWlvbW11LmMgfCA0ICsr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lvbW11L3N1bjUwaS1pb21tdS5jIGIvZHJpdmVycy9pb21tdS9zdW41MGktaW9tbXUu
Ywo+IGluZGV4IGI5ZTY0NGI5MzYzNy4uMWZiNzA3ZTM3ZmIzIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvaW9tbXUvc3VuNTBpLWlvbW11LmMKPiArKysgYi9kcml2ZXJzL2lvbW11L3N1bjUwaS1pb21t
dS5jCj4gQEAgLTk5OSwxMSArOTk5LDE1IEBAIHN0YXRpYyBpbnQgc3VuNTBpX2lvbW11X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UKPiAqcGRldikgcmV0dXJuIHJldDsKPiAgfQo+IAo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IHN1bjUwaV9pb21tdV92YXJpYW50IHN1bjIwaV9kMV9pb21tdSA9
IHsKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VuNTBpX2lvbW11X3ZhcmlhbnQg
c3VuNTBpX2g2X2lvbW11ID0gewo+ICAJLmhhc19yZXNldCA9IHRydWUsCj4gIH07Cj4gCj4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN1bjUwaV9pb21tdV9kdFtdID0gewo+ICsJ
eyAuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuMjBpLWQxLWlvbW11IiwgLmRhdGEgPSAKJnN1
bjIwaV9kMV9pb21tdSB9LAo+ICAJeyAuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNTBpLWg2
LWlvbW11IiwgLmRhdGEgPSAKJnN1bjUwaV9oNl9pb21tdSB9LAo+ICAJeyAvKiBzZW50aW5lbCAq
LyB9LAo+ICB9OwoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
