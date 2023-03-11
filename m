Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41AAC61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 11:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/WTE/H75l6fsLoEim7PyMhDc5LbLQ6vH+U2WlaOGaSQ=; b=cp5EIP2bfi2nSu
	z1k12wNpjy6BWgKsrEUNjlH+i0nEYJDOHRUquGWxqEu9XrKRHQU2g/HN9IfsGLCFJhOyY4YQ4IAbD
	Vwj/U/SkrCD7mhOE6EoonKWB9saSJjbI/2nMlETASQVEUgFyaa3Pk7BQpilV66VcdjjGwuv9+7Cy5
	6ML7zu2icQ76h/Bo16gRFYkbUXInKLcMUfYUwYUGdlwrSNfmaxMyd5KQvCuQzV5jK+LsDU3si33og
	n4Zud6CzRdyTK3+f4dnZptqdPe4gbt/ULWKDBGqUYT5PRjig2NTnRBzu2wHk0yunb5m1dFz3yDq5+
	jLLNhNNbh/nGhqWs0gvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxAY-000Et5-VC; Sat, 11 Mar 2023 11:13:47 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxA2-000Ebh-D9
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 11:13:16 +0000
Received: by mail-ed1-x533.google.com with SMTP id cy23so30619866edb.12
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 03:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq77vQWPmqN0P1uClqWDA1EHy5/jRECv7qlu+zNRs6E=;
        b=wZhAnnIZeT7MXdc2zrQmCUUtQSrHgd18EBJULNpexDsCm+kAnXxTsna2cYJudLEItk
         EVVR7jB0HWSsrGexv1t8WRVbDv5wiS5X//Q0Q9UMBICgstFHLykEeIsMc6nwZy9fen4c
         faYhgqvPZW1XIDNVoq6yAs+68/2LWZRambKNXfznY0FiBh5/u7OEEQjVU3BHVid3UbSA
         i4E/T8AhOCumDQaXRrE4rCMBDIWT83vVj77CAWwhZhc1AfVj2SKQQVno+4LUVO4sqpa3
         AauuUHbFYJBBWl52L0yEnst547gn9FOMwbwMk80vK54jc9rhgbqlUzyOp0Iwc6+g4UB3
         tAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aq77vQWPmqN0P1uClqWDA1EHy5/jRECv7qlu+zNRs6E=;
        b=NiW0+ZcErXwVstIhBvZpsfFmwC00prfeyyI0CpiPlif19QCVEOZb7dxW/sY13u5vrs
         ElyGpdvLJmGQAJLwsm7Qlrh80Y4HwqAP4FcIuTlL/UPDvDUBDVFfbBRBhhxUXsweEij+
         uv3oTfXYfNPW0pheaa2VTBeit0vbCuaL0MzY6yZDjkVST+EyHnX0cRna5/hEljv9gXqf
         MGCWKTWiEyqlsMxczRP5KyVY3j87wkIKkkNvL03t5e0OBda0Jpx0xQbuYU+Rj1ixNc5C
         iXskR1VoEbpfU/rZw6aSikVTkQ8wo177eAPNx49Na8Vo7+FF5NeC2CLxMzSxenQs+bE+
         Km/Q==
X-Gm-Message-State: AO0yUKXGQGYw9c8Yh0N5uRtGL43R9KdTCMPv8pXCBj2oscn7KWeyrQFH
	L/0Hk2E3Er3UtBeWxF3QDnBgUw==
X-Google-Smtp-Source: AK7set+/rTdizsglqbDuXDqPYxb8+Sz15WC2l2nH3OBdecIwjfF3xVJtNxtd/pcpj3MJ2dwtHbkMww==
X-Received: by 2002:a17:906:52ca:b0:8ae:b008:9b5a with SMTP id w10-20020a17090652ca00b008aeb0089b5amr27143452ejn.69.1678533193246;
        Sat, 11 Mar 2023 03:13:13 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b008ee95ccfe06sm973189ejv.119.2023.03.11.03.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:13:12 -0800 (PST)
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
Subject: [PATCH 4/8] gpio: visconti: drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 12:13:03 +0100
Message-Id: <20230311111307.251123-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031314_500839_F4F9EC46 
X-CRM114-Status: GOOD (  14.18  )
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
Z3Bpby12aXNjb250aS5jOjE4NzozNDogZXJyb3I6IOKAmHZpc2NvbnRpX2dwaW9fb2ZfbWF0Y2ji
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0K
ClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwaW8vZ3Bpby12aXNjb250aS5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncGlvL2dwaW8tdmlzY29udGkuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXZpc2NvbnRp
LmMKaW5kZXggNWUxMDhiYTk5NTZhLi4xMGQ5ZGU0MWYyOWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3Bpby9ncGlvLXZpc2NvbnRpLmMKKysrIGIvZHJpdmVycy9ncGlvL2dwaW8tdmlzY29udGkuYwpA
QCAtMTk0LDcgKzE5NCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHZpc2NvbnRp
X2dwaW9fZHJpdmVyID0gewogCS5wcm9iZQkJPSB2aXNjb250aV9ncGlvX3Byb2JlLAogCS5kcml2
ZXIJCT0gewogCQkubmFtZQk9ICJ2aXNjb250aV9ncGlvIiwKLQkJLm9mX21hdGNoX3RhYmxlID0g
b2ZfbWF0Y2hfcHRyKHZpc2NvbnRpX2dwaW9fb2ZfbWF0Y2gpLAorCQkub2ZfbWF0Y2hfdGFibGUg
PSB2aXNjb250aV9ncGlvX29mX21hdGNoLAogCX0KIH07CiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVy
KHZpc2NvbnRpX2dwaW9fZHJpdmVyKTsKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
