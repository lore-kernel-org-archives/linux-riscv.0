Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDEBC61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwcYuQAlIyMlomS6DxjcvPsaJNeijMfon+hcLNtY3Ng=; b=ir6ZSa8+prMjLB
	DxPSRwnn3VQ8XeBLNZJOKemyv1VuD8+MV4DOcG9M0whRxHC+dU/kbp1JVlKOsh092utrbu4T7PdHb
	Tgdh4WmhmLiPiMCCYhaJJooYzonuf2IoEW/c7z1/fazJG5Z+hPgbHriv43hnDI8uTjAS7TtWExd4N
	5ZEe4aoOR4O9tot6Ia10elBo53wyt3rRAMwtVui4T2c04dT9VGbXfTmWyGOI6hss2FTWXG96CZT9c
	kCe/VB5hXFSQsrObB7Nup7iHFXCA0R2Ec9pVQmrCPCvbIg30gFNKKlOjGcFikc3M5pK/dSsKxIGpE
	xEKUhKMd1Uy4hDFvjZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxfR-000OdM-Jc; Sat, 11 Mar 2023 11:45:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxfG-000OXa-KV
	for linux-riscv@bombadil.infradead.org; Sat, 11 Mar 2023 11:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5rB3q6hozgVfcdPrbsf67fNWfSHcvZZqXt4YDenx5ZE=; b=WiVmGrJmfLw5nCiAjKFZ2OfqMB
	gJatkIcUz3dKC9YJsR/5g7zFRyjJ+xGRhA9sCY8TT0Qv1kLpd7cVVHBt5fO2FTIossj5bZfeJNrrZ
	n0pRcO28tX6QdfTWxdh9dqazmp42H6e7iZq9yyiLxu3fKF0Ps0whKtxpg/HoJ6iR8BgA3cbWy1iE3
	ddqHE/XIhu6c58siZR6BUZcNa66Vk2AlfFHnhFAUpNhhbts4O4NmM7ArhBsE9p+jwsNcTrMbQUmK3
	j9s0LbK4GW2ewuZ+nemBd/ON1smT268SuyQ4JRta7WPXC5owWhdHlRPS3kRU7YEdo9hEf5bXpx5eg
	Y87WgqsA==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paxA7-000j0Q-1y
	for linux-riscv@lists.infradead.org;
	Sat, 11 Mar 2023 11:13:22 +0000
Received: by mail-ed1-x536.google.com with SMTP id k10so30631491edk.13
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 03:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rB3q6hozgVfcdPrbsf67fNWfSHcvZZqXt4YDenx5ZE=;
        b=aR94cJVoY8K4fjPFcZX1W2Np8gTXFJjYSQFlXozjBDUfwYPGSwW5v/z2JMbYAb6PrV
         zvI8CVyNbm8DQWlo/jPMGrZOOEYh+8xzf6zcwtEtKo2YYnAdSWrWI37lG2nUP4WXW8ji
         z9oa3Xqhq6tE+3BhZT8REto2kEPxkpt76BtKLIgPfaWA8OhMI1iv0Pkxbnc3B06hyfai
         bZmGvnKCEWNwnCweyCire/5fdZ3VL05AgWek3S561QdETMTDBza1e0MByy7W8T2LBzlA
         FBaPIxdIPNItOV0d+1VPl1Qwzoqk8pRI0VXM4aAzqAc7oLnJq6+UwC7O0c70IRtCEDUN
         SGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rB3q6hozgVfcdPrbsf67fNWfSHcvZZqXt4YDenx5ZE=;
        b=6/T17Svcxl1y1vqiha6mSxbTC2Mlqo4SiXKDlPD2LFRBKH4WpunG1y9U4XF1eoT1N5
         atZv6fJCBvGU7gtZC6XX/lkZk0gPgXj8t6gVr3rmw8qEXn1hqr2nBb+ZPb+2mUE2+0yw
         7bn7DG42E/hjep3K9+LbRKQni1t5z5O/hSxLxoJogPrv89YuEzsJrqq7bng7rARMlNLa
         7RtCYhpKaijVIQ26N77dO59jwzwYwVNrMK6zIqj0vo+yXE9xBh81UavJxo+aIk8n45Ex
         cAh6YTwOLT3AUgp7e0FwyoMfgDd22rkE+KBknUbj694i++sZII7tbuPX6h25OCAWT++8
         Q5SQ==
X-Gm-Message-State: AO0yUKWpBTHlJ8khEvlTQtkMpyE2TdYZB5N4OYLEnYn9dZi44vA1nZQV
	reQp9UHkz6+VdoZvvkhGxOIvgg==
X-Google-Smtp-Source: AK7set89JC1vv0eQfsiqhM1cfuy+WEUarXTfD53+WNNyBec5EzYrz2984z8U96HUMhNZHJ58eIlczQ==
X-Received: by 2002:a17:907:6d86:b0:879:ab3:2864 with SMTP id sb6-20020a1709076d8600b008790ab32864mr32513247ejc.24.1678533197638;
        Sat, 11 Mar 2023 03:13:17 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906bc4b00b008ee95ccfe06sm973189ejv.119.2023.03.11.03.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:13:17 -0800 (PST)
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
Subject: [PATCH 8/8] gpio: raspberrypi-exp: mark OF related data as maybe unused
Date: Sat, 11 Mar 2023 12:13:07 +0100
Message-Id: <20230311111307.251123-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_111319_857661_318D5526 
X-CRM114-Status: GOOD (  12.11  )
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

VGhlIGRyaXZlciBjYW4gYmUgY29tcGlsZSB0ZXN0ZWQgd2l0aCAhQ09ORklHX09GIG1ha2luZyBj
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBkcml2ZXJzL2dwaW8vZ3Bpby1yYXNwYmVycnlwaS1leHAu
YzoyMzc6MzQ6IGVycm9yOiDigJhycGlfZXhwX2dwaW9faWRz4oCZIGRlZmluZWQgYnV0IG5vdCB1
c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQtb2ZmLWJ5OiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Ci0tLQogZHJp
dmVycy9ncGlvL2dwaW8tcmFzcGJlcnJ5cGktZXhwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8v
Z3Bpby1yYXNwYmVycnlwaS1leHAuYyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXJhc3BiZXJyeXBpLWV4
cC5jCmluZGV4IDNjNDE0ZTAwMDVmYy4uZWNiMGQzODAwZGZlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwaW8vZ3Bpby1yYXNwYmVycnlwaS1leHAuYworKysgYi9kcml2ZXJzL2dwaW8vZ3Bpby1yYXNw
YmVycnlwaS1leHAuYwpAQCAtMjM0LDcgKzIzNCw3IEBAIHN0YXRpYyBpbnQgcnBpX2V4cF9ncGlv
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIGRldm1fZ3Bpb2No
aXBfYWRkX2RhdGEoZGV2LCAmcnBpX2dwaW8tPmdjLCBycGlfZ3Bpbyk7CiB9CiAKLXN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJwaV9leHBfZ3Bpb19pZHNbXSA9IHsKK3N0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJwaV9leHBfZ3Bpb19pZHNbXSBfX21heWJlX3VudXNl
ZCA9IHsKIAl7IC5jb21wYXRpYmxlID0gInJhc3BiZXJyeXBpLGZpcm13YXJlLWdwaW8iIH0sCiAJ
eyB9CiB9OwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
