Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9F8C5320E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2024 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCyCC90FsuNRyB4eaDBxVzVmJGSAePc9XF+CpNfQ2S8=; b=kdJhHPUEBhakml
	VFgxsN2tUU2A92CntG8Q+azm0otXtb4ey+Ix9M0dXZ8h/p9uY6EehEmfJzRUOURL0D6XR1DwsNdJH
	Ca+W6AlW6W9IJz6DdQFI1dshRXc9Hp5BM6loEGl8dqsFNxpcg9Pg3dLMpxL1U8oVrV8sIiSArALEJ
	SJxyxqr41pCYbfMkZOIGl2bKfIPw/d444hUttRvgJVrk9kdWm8mI9gnxposyASSu1j3Awc8VHL4US
	PaOEncljNgktWWwUjivpdWyUB7EY+ttm17b6mD0lqtx/cKv4MxOvGSd/3Nyn4qch85JoAzUpUWI9/
	eNkQOzQv23YYv/wg/kWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE2L-00000004Sk4-2ZO9;
	Sun, 25 Aug 2024 14:16:09 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE0p-00000004SGo-2clP
	for linux-riscv@lists.infradead.org;
	Sun, 25 Aug 2024 14:14:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-428e09ee91eso4317215e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 Aug 2024 07:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724595274; x=1725200074; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3V39aJFJWv5Ox+8nMTcg04luiBvVyWT65eor5O85K80=;
        b=RUmoLr72UQgXesvBIfd/CoGwtlkO+DeOXRhZvl3pZvt5H0rA2OrBPLtOpDoLCqe65M
         zNkoL8x2zZQWganiM9nx2RXQTwCp6auADEUZ6eQ5rFyZxNvJCViij0u3ASYqHeSQX2CW
         wAeB3Q0fbI9CNGnSIzKfa9TFta5RaL8r/brWUrVMwxb8zyhOeNC4SSzXHYFuBXygsRly
         TxzaMXE1tJIy5eTQbREn5netPusEeq5YtF2KMUoLnkXSKw/3HMWDk9stsGHTaNNp6YH5
         pdVekEyYDk4k6cws1SWOKPGVxVSW5AxuPNfctz9gV3PUW/4M/KGIsvmsIBE5Zzr5NI4j
         b6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724595274; x=1725200074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3V39aJFJWv5Ox+8nMTcg04luiBvVyWT65eor5O85K80=;
        b=JDqsbFWUNdeX2wK8XoDG2oxzVy16Jyd8+3cLEhdqa5X91MIfO0y2XleMUi0nlxKZxf
         ammy/f2rsPvGLUvp7l5OTUatQcxbGOJs8cBFkUARKtIt2f3WiQuTT1s+FTei4KrdVkdp
         e0ci4jyJ2r9O15Vfa7Bv+nBEA61kWH/7/dOq5dCW9g4tl/zRRy/wW4GYbseDkTqqPqZR
         Q0azsu3woGhcGHs+OTxZNK9mF2O86nlFtdUOJMsNXnYPs2Q09emFkprwI0QR2NnvfgEn
         Yk/bIsFH28x6vDV/wB9rIIaSEkPg816qcrEqlGV5qBWv6FUdYZzlXtuXvI5If7wfEWCf
         Jfiw==
X-Forwarded-Encrypted: i=1; AJvYcCV7nopvkO4HwybepUJKUoCI8xAocmK1JgvoFX4/d4XhbrnVhvlpxP1R1FsdST8vGOuNLShlov7JOev/tw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvAEhVSUdxEtsbdgIyR4W5Q9n2D04wlPlilInQMEXJZnFwslTj
	RHcbWJcsTC6BrJqQmomntNV6IAymuyoUhH/mnveIQoOUuV1QIj01r7XCZ2qKaCA=
X-Google-Smtp-Source: AGHT+IGxaU5SPPeM8id8GkXJPuRmYySTf3YFVPhWqsLL0MARUSWhix2AIa7U5LEypfPKdiEqh4SA5A==
X-Received: by 2002:a05:600c:3b8b:b0:426:67e0:3aa with SMTP id 5b1f17b1804b1-42acc8d50f1mr32658585e9.1.1724595273921;
        Sun, 25 Aug 2024 07:14:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5162347sm122556045e9.23.2024.08.25.07.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 07:14:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 25 Aug 2024 16:14:24 +0200
Subject: [PATCH 1/5] reset: berlin: fix OF node leak in probe() error path
MIME-Version: 1.0
Message-Id: <20240825-reset-cleanup-scoped-v1-1-03f6d834f8c0@linaro.org>
References: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
In-Reply-To: <20240825-reset-cleanup-scoped-v1-0-03f6d834f8c0@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Antoine Tenart <atenart@kernel.org>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Damien Le Moal <dlemoal@kernel.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=joVnS8DmY0g4Y+2gErHi2Nv91aaUMO657tgyX7t8ZFA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyzxCjY77hkWpo20MJfyjjnVxsKR95SKAeU/iu
 Y3zJ4/suN+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZss8QgAKCRDBN2bmhouD
 1/knD/9qX7o6/PZtVNH2lJW8W33eM3FNJFkdfkdS5NFkRnuq3XXEzDEAZLSSv6V/pWOYUEuiS0n
 OO6zl+0bae9XYGJi++SiuGPQBh8B6+5oRMSq2NNF+xcAkq18NJzU7HMi1wR2G6O9qauYQfvL+UD
 JR8TFFHdo+8DEObsVCOEA2ODYNY1+T4ABgXQqfOICeeQyWedx3g7BQ+Wn1ixGEQtvOjACRMjJ6H
 bKo3D7lFjZQ4sMrVTvkRv5UDVx82kBcS+g7QaTMefWaT6V4//kJojlV9rB3XmoOPSxHb1SEbdkr
 /+O5k2BFjG6wnjIwZhEKCBw5l25Y3IHD+ocwkt12CnOffinirDqQOiZ3yQlq2vQdLYxO9dT9hJl
 cysTeZ4B5BSfg2PpfjKB0ItoTeUldc2ZF+5CrO/8AgCxvyvumSAslG0SGGbpjeyX8bdx60Dxkxt
 iy843maH30+bYknaIMDKuY0lwb6p+fCtPR5/fnDhZp2j1wagrZmfZqux4PR3Cs8SUWAcyzH3/bR
 GwOdyZKbYs3Gqgt3kKrUdRs4rOpOhVHA2lsf846AVXufeF7FDtpYav5WtOTno+vngsU5cDeD1n7
 FV0UCpBnyGd61GcPxxbr1VvPpn+WnqXlRmZ4eCApcxWKPsDCn1TdmUg9Ib0+TTu7rEZ9/BJMBpH
 xTPG14fHg7JSC/Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_071435_699768_BA1276CA 
X-CRM114-Status: GOOD (  11.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Driver is leaking OF node reference on memory allocation failure.
Acquire the OF node reference after memory allocation to fix this and
keep it simple.

Fixes: aed6f3cadc86 ("reset: berlin: convert to a platform driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/reset/reset-berlin.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-berlin.c b/drivers/reset/reset-berlin.c
index 2537ec05ecee..578fe867080c 100644
--- a/drivers/reset/reset-berlin.c
+++ b/drivers/reset/reset-berlin.c
@@ -68,13 +68,14 @@ static int berlin_reset_xlate(struct reset_controller_dev *rcdev,
 
 static int berlin2_reset_probe(struct platform_device *pdev)
 {
-	struct device_node *parent_np = of_get_parent(pdev->dev.of_node);
+	struct device_node *parent_np;
 	struct berlin_reset_priv *priv;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	parent_np = of_get_parent(pdev->dev.of_node);
 	priv->regmap = syscon_node_to_regmap(parent_np);
 	of_node_put(parent_np);
 	if (IS_ERR(priv->regmap))

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
