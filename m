Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4970CC6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 11:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sqg7STBc1rqCduWZ/nqH30ifQpx1zMA3d1KEPBJTkCU=; b=IkqOEgpY5NqS6E
	18hs5Ui4k/w6in64f0a9pWjQBul3QWvrezHeqHbQnNOY9S/DMNu8ZuXMOIdwDQGGaK9qZnzgstpND
	qFG48r7rDrh516ixuMvyqEd9SAD3Y6VYjtwCbzWY0Tf8mFTZnEm3P7Vp6+ZtWDGmtbzvBY/vwGBAl
	9ovqG3iEHyxE/nMHjxpE4axzjOY7veN+1YLy6AP4FP90zdwNr5WaPEVD6Ecjc+U6OHZXuYCzHQL2s
	cP9HglFLJ9oGdUS/A2/Vv0fdfSFnLVzxkVSEQr1deRvaSDb+l+KU0NHSLhzIpJtKn1gQfsyMRlltN
	RR6Z5s9tiPwybr60cHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxAp-000F46-Aj; Sat, 11 Mar 2023 11:14:03 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxA3-000EaS-LY
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 11:13:18 +0000
Received: by mail-ed1-x52e.google.com with SMTP id da10so30799399edb.3
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 03:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wsjEFg411f3j1GspmCDAJvrOGJIOzP6/PbM4Sd3D2A=;
        b=XhfSoLEog6AUz2J6PG6GYohg6cYoVFocyuaGxSFjpkU1pCGqvxorZPijHHSMQi/xKo
         /P0LizNb/zLTXk+vbMrXMpGlmU+jdQg9dAiHeT8/aCRS1sbq6HffoLTmD1eu2YwMS/IX
         sGWA2Y7kTrdUsfwemZA10Gc43Rln2DPpIUAymagKYYysvnv0ZlUBY1Y8/0xWSsB0iOAa
         RAyY7ZOUWIpAX/CnRWX4PdK6wCHSLVHpqv47VIufbYQPX7BYtdCqnYDsQ2HiOT+BgoX1
         TM9CKg3QC0oqE9ZS/8HLT++P2NsNRrZ7VLUs0EbKFvIh6Im+cCvKfF4NPdtAWmOf4MKj
         wQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wsjEFg411f3j1GspmCDAJvrOGJIOzP6/PbM4Sd3D2A=;
        b=wU8+b5nLWDf3ZRrZlEsIZUi8WY7LkdAaDmD1A/9zbaFkbwFEU9DQ7CoFeW3rRu6Sz5
         gwrnvXqntdCSbyEO1GJfXaFm0XoYU14Crw/TNDMtxlQfSefIlwYtuD63D6XgKtQ7Qg8J
         U57wV2QqpAFqtPZoQZ/s038/7xAZ0H3E4+xHAHdHppj5O5RCejhiMpq7eRDQBuv57JgE
         04zX4OjdtSiHiTfe0A62BZczWPyPPfGTWfLfzbOT392jASe76g6ef50S3tQ1+3QV8rVV
         g1t40pb6wHubRA6d5kDRhht9NdH89Q59DkzvbbQgUi77s2EhmN2OS32yo9c6dMwjkqsr
         LSDQ==
X-Gm-Message-State: AO0yUKUAhtfvKrxhzqU7CvbUHs57d09Va54PJ4ixms4s/UQruVcLnYyl
	WsRwhEy0F08/XKa8AZV0bBnPtw==
X-Google-Smtp-Source: AK7set8+yT6UzSrYOGn3LNs3My65y6SinT09SwukP5nlfb5NWOHN8GOPBLSL/652xN3+evwtWbuaFA==
X-Received: by 2002:a17:906:7f8c:b0:921:5cce:6592 with SMTP id f12-20020a1709067f8c00b009215cce6592mr1057307ejr.59.1678533195246;
        Sat, 11 Mar 2023 03:13:15 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b008ee95ccfe06sm973189ejv.119.2023.03.11.03.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:13:14 -0800 (PST)
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
Subject: [PATCH 6/8] gpio: sama5d2-piobu: drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 12:13:05 +0100
Message-Id: <20230311111307.251123-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031315_764459_D2E41666 
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
Z3Bpby1zYW1hNWQyLXBpb2J1LmM6MjMwOjM0OiBlcnJvcjog4oCYc2FtYTVkMl9waW9idV9pZHPi
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0K
ClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby1zYW1hNWQyLXBpb2J1LmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwaW8vZ3Bpby1zYW1hNWQyLXBpb2J1LmMgYi9kcml2ZXJzL2dwaW8vZ3Bp
by1zYW1hNWQyLXBpb2J1LmMKaW5kZXggM2U5NWRhNzE3ZmM5Li43NjdjMzNhZTMyMTMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvLXNhbWE1ZDItcGlvYnUuYworKysgYi9kcml2ZXJzL2dw
aW8vZ3Bpby1zYW1hNWQyLXBpb2J1LmMKQEAgLTIzNiw3ICsyMzYsNyBAQCBNT0RVTEVfREVWSUNF
X1RBQkxFKG9mLCBzYW1hNWQyX3Bpb2J1X2lkcyk7CiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBzYW1hNWQyX3Bpb2J1X2RyaXZlciA9IHsKIAkuZHJpdmVyID0gewogCQkubmFtZQkJPSAi
c2FtYTVkMi1waW9idSIsCi0JCS5vZl9tYXRjaF90YWJsZQk9IG9mX21hdGNoX3B0cihzYW1hNWQy
X3Bpb2J1X2lkcykKKwkJLm9mX21hdGNoX3RhYmxlCT0gc2FtYTVkMl9waW9idV9pZHMsCiAJfSwK
IAkucHJvYmUgPSBzYW1hNWQyX3Bpb2J1X3Byb2JlLAogfTsKLS0gCjIuMzQuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
