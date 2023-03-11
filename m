Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AA9C74A44
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 11:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1tAE83P613ntxmrDupNJ/lQP8Kn0MjpKM+oARMUEfc=; b=hf0iZ+RX1lP46W
	2ePcTfLG8LtuIZxU1qY9zhLlFCd+rICHPM9THg8jqn6Pm/jbOxpb2h54ACJ1Uj8sqlrIDlNGbobU3
	d3SIiPzCOwM1ZFPHQwjR3hX8BXwJEsKU7kUNqK6rjT4DulyKdzJX6cngHC1iPtJmfb2j2DaezhEcL
	RiDPr4haDvqMO8y/WNaeKR+IZFwkylfTupTCxhKi6uYK+4IQab7qHancFPsNOwaL+sIqB8NKlIzee
	TwERvSHYzA4HvafxtXYF0dCP/Rfd5ybWhEC25lqXpajhvQJyW046mpPHo4rY2Y3kgnDx8LQfS9wS6
	c/zHxZO+ipEebXBNRrcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxAI-000Ejv-2m; Sat, 11 Mar 2023 11:13:30 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxA0-000EZY-Ia
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 11:13:14 +0000
Received: by mail-ed1-x533.google.com with SMTP id r15so3535547edq.11
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 03:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKcG3ySBRe5JuI6NeHmlPILSvTUD+lUq9m6at8uAk5A=;
        b=n2Rvr7kl1IYJajnq0ldv2bkSaydwwJ3o1ZvlrlgBQKI0Xc9n/dtV7g0C9DOkOM/kCl
         i0mKGhJKduSBD3dJJXjgtnYvaxxkzgPU/xyR2+1QpPGKnK0c7AYrQ3JvwiKnZcNmgqn6
         VfCci2mLOlirUQEbj2a41FiOmbSGBMRO2c0SPI6ppJ0DmPTHielB4c5ff6AtRlkdH0QK
         MAB1G1WVWt4SaT4DZ3oq0dF0CWk5PzgS3EdugtyxMIc2IiwoP789e7oi0zQz+fyNn/52
         BadOh8pP/nQbg9PXDBK7XtbDb63kbAcIfTw+cRVH2RDgjg4y8yiRrJEjZFrg2Qty9Snp
         TLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKcG3ySBRe5JuI6NeHmlPILSvTUD+lUq9m6at8uAk5A=;
        b=v9k7ODus7n6roKTCloHulawma16vO5GxhEsTRh/d2jfmVEZUE6z3xb7kNg6fESwxs4
         ORUyg0VUg5vvx3pPOgleW4MKfvxfQICBol3kB43OPX91zllLxoHPdUfCAnQKQljC+XrA
         VMrN0RIsn2cJ/I01TquzyXAqYDCECDeYQ6fvv4EHInaZ1x/WWhpxwqs+NSOWEWXEXCfk
         3PCG+zA96gZQu2qk23eH4uN1deTwM/xyK0CRUxZ3rCVPbJNZgC4sovbdMdOwBz2c3z4B
         6WI7sW6TAOB3FlC2KcAd4AWnXN8sVfRDhaD8r4wKBIyxUzPqv/X2361D9rIDEHhUFtbz
         dj0g==
X-Gm-Message-State: AO0yUKWr5wrO/A9lTlE4jutmCIN5JBBrO+XlBcCdifycVWvuq6jc0icV
	65bwwf/VZLaeRD+BUPKODkfB8w==
X-Google-Smtp-Source: AK7set+YBcaMtvHO4ngFhPGNllDoFAkHQQFm1NFBgnehBp2jMGVV6Aj/CbmzzUXu/tDdio+14jWZJw==
X-Received: by 2002:a17:907:6da3:b0:878:50f7:a35a with SMTP id sb35-20020a1709076da300b0087850f7a35amr35308557ejc.72.1678533190497;
        Sat, 11 Mar 2023 03:13:10 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b008ee95ccfe06sm973189ejv.119.2023.03.11.03.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:13:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mun Yew Tham <mun.yew.tham@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Nandor Han <nandor.han@ge.com>,
	Semi Malinen <semi.malinen@ge.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/8] gpio: altera: drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 12:13:01 +0100
Message-Id: <20230311111307.251123-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031312_630373_41B12F6C 
X-CRM114-Status: GOOD (  13.99  )
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

VGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0YWJsZSBz
aG91bGQgYmUgYWx3YXlzCnVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBh
bnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQptYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZl
biB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgoKICBkcml2ZXJzL2dwaW8v
Z3Bpby1hbHRlcmEuYzozMjQ6MzQ6IGVycm9yOiDigJhhbHRlcmFfZ3Bpb19vZl9tYXRjaOKAmSBk
ZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQoKU2ln
bmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5h
cm8ub3JnPgotLS0KIGRyaXZlcnMvZ3Bpby9ncGlvLWFsdGVyYS5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncGlvL2dwaW8tYWx0ZXJhLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpby1hbHRlcmEuYwppbmRleCA5
OWUxMzdmODA5N2UuLmM5MTU4YjUyMzBmNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8t
YWx0ZXJhLmMKKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tYWx0ZXJhLmMKQEAgLTMzMCw3ICszMzAs
NyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBhbHRlcmFfZ3Bpb19vZl9tYXRjaCk7CiBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhbHRlcmFfZ3Bpb19kcml2ZXIgPSB7CiAJLmRyaXZl
ciA9IHsKIAkJLm5hbWUJPSAiYWx0ZXJhX2dwaW8iLAotCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9t
YXRjaF9wdHIoYWx0ZXJhX2dwaW9fb2ZfbWF0Y2gpLAorCQkub2ZfbWF0Y2hfdGFibGUgPSBhbHRl
cmFfZ3Bpb19vZl9tYXRjaCwKIAl9LAogCS5wcm9iZQkJPSBhbHRlcmFfZ3Bpb19wcm9iZSwKIAku
cmVtb3ZlCQk9IGFsdGVyYV9ncGlvX3JlbW92ZSwKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
