Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C170FE7E36C
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BL0Ednh7KdJCLiVnZvTOJTLdj8pXChz6VlvZ2VIzNZo=; b=XpB59tjfr5hsux
	2GQuT/IKhK3xD+47HkAiBMjsQHXgU9YtEq1/8VKBk7Wgcan4ajEtVqoRc0l/wJTpFUQwZAe6II9yX
	l1eytODqWYFqAO3NuMy/SUxkGwoFEo/DkFpmXQlFXNi7uD9t3lO5v+lAw2RnDROLEHUvltI2qZPnU
	Q3NQwImJJ0mKueAChlskhjJjWZLMo3GhCmy9R1gR+AuFSqSjT8VNjDO1Ykp1hZWeheEtcjOdYtxeO
	B/1rfhGLoSWEui7PpLwq8JmxIwB2xnwg/r1y90dV6aVv3h5Lm2IykYlKlld/Axy1T0ixUkPbgJabV
	1GCTpchw1vzzCzrMcUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cVQ-00000001vmN-0wYQ;
	Fri, 03 Apr 2026 11:16:04 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8cVN-00000001vlW-1EC4
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 11:16:02 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8a23f802e0cso30024606d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 04:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775214960; x=1775819760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=PArbSFR5bBcNTu/WNb9xuTUhKPgFmTeR+aPcK/FAhzGonYhFbNiE2YeqVn6l2RGoJ0
         iKJG/RSDbmU6wtrdLzFjwjDUZGBF3NYkiT1XF+u8ktx3dvElkyxdriOa+sTuotqz8Sqa
         A9I1cQ9BdWG0aHy4DT8cAzI/BPrW1/Eg7fIqqSqP0ZWFq2Xa8h6ZbyWWtk9M92MJ43gY
         xlEvaLyjuDZ/4ldhhDxMd4Q7N19LZ46J2RIzLqOelprc2VG439C7Ea+6akn79qObOPii
         NGzVI8a8lxj9RCurQn5htO2FZY8jBs+YcSxO9jip+96FDB5QemEaf8m2el+lvTCJgaOZ
         d+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775214960; x=1775819760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=NainsLzalPW3Q1MEch7awyP9gw9MDWEl8JGE3zorCGJaQTjmjEPMvy8Xz6wRKnotVe
         iyzBnTs4/D1y8FU3H1EylRzAEQy/CLHEnkQI/f7fScZR5MATt4KvJ9BoLXia4icNgI7h
         LwsCF3QgU3hFhxr53RviU6xXQ4iVS2KGjS6ByJkYFdt43ntzp+3d9qyW/f2wDljN401s
         fN1YFj5C3zEboPAHQiJzNCtCl/P71sPNOp44NOgmqY4zBN8ueM+3NgSvJHnyd1HDnvM3
         Q7yGa2s65fyl5RjLYocka0d56oHeneO9Afe/H619K1FIA6cITz1QozXtOsdtEvkqeTS7
         oNcw==
X-Forwarded-Encrypted: i=1; AJvYcCU5agV5DC9d2eM/M8KSe1ipWO0/D7RG+iclfCi0f4HoOCsBcl9otuyADWrcmyulaCsEVGS2/t4RtyRiMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY6x/zmJoJ4lQIWpT1F1VY+I/eSGip+UcuM82Ngql19MBRafum
	a1hESEBrkC6AbeIe2T9y1Ep6Tk31YRDv6fDf22or2qnRwpRlYMR59dWj
X-Gm-Gg: AeBDietHa9UOGvHbI/2UdIpGxr6Ww6T2B8ZXoD1pJfUtz0wFUJuRDqntKUWZZZQKJwN
	QOtTDgMucPwepDqM53mCo4Pq9CgUukd81XqzZOkSccjmrreKJ7HTdXv1bxShJajw1wN0NBACGDd
	Z0TtsivuVcRV61roubmGYt3rQEgjoftufXKzsn0gVOLGyfKHUi0l+97hIk3d4Ul7mbWHdVcfszL
	XIisN4+H3tHkcHxXduswYWTErY3YIMebYUCmmHsCJMQ3iMP/Zwyw4ei4C1k8fRLMYqc7pdyZP9c
	VHpN1X9+NCvVapQ2odtPLkDKYYS0XslNyjdslKQtoIDo1hOfb+8qjtugSAEHfyB1sMGup2rVtZH
	6m29t3gfWBdKpJYO0xlNIBap5DZHbMsLorjIUVeuIStW6ZqYRuokBcuW+J1stSOUbEZV0i06PBH
	gr+X8/zIpzO29FlAqh/VlWlf6mj0gi
X-Received: by 2002:a05:6214:5b03:b0:89c:cacd:244a with SMTP id 6a1803df08f44-8a7020c0f64mr41263286d6.5.1775214959993;
        Fri, 03 Apr 2026 04:15:59 -0700 (PDT)
Received: from sleek.hsd1.nh.comcast.net ([2603:3005:1473:4000::71a3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974e8e8esm45319836d6.43.2026.04.03.04.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:15:59 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Fri,  3 Apr 2026 07:15:12 -0400
Message-ID: <20260403111516.379795-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403111516.379795-1-josh.milas@gmail.com>
References: <20260403111516.379795-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_041601_355430_E0FDAA6F 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
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

Document the compatible strings for the Milk-V Duo S board [1]
which uses the SOPHGO SG2000 SoC.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51f..0b6fbab48b743 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo-s
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
