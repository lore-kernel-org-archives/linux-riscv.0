Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D07CA0FE1
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c4YjMt20FhPXyGWao+vEAKwc21SZ10vd8YgdVhrwOFU=; b=ji50eu+RZ+Qqau
	Ls3fGygnfeqQTy+K/1xgSzMTySxF5zjgBPVfHkCoJ/xxD7iiSxp4sEshR+uTT67WDerTUeQu+O2P3
	PRPcRHnp9RSwjsZJ4I6Mnxtnq5mwSr7i6Y+fxU+TS4B1M8S5zVHedBGMmWIaGunJ/cjW6S64YcDGN
	7TsFruVDjQxKY3CXsrnx0voZbhv2n3JaOskGxCZT2xogJy0b+mQgEnqaCJHnjrLheJS8c6+LXVan6
	fpseyRYpu+qDRq4YU+fLpQ0wi0TX19FTWbXZQBWrB8pWywafBaqPUUiz4etiaf7EvbOBuIAC+UcXD
	bL9zToJlQ92ie2o5irGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2Xd-0000000Gc4F-3RpW;
	Thu, 21 Aug 2025 10:29:09 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0iR-0000000GGFC-2Mqf
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 08:32:12 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-61a483149e8so133306a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 01:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765130; x=1756369930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sRvAzDPMBGNTB2v30IPH7YjhXyJsEociQ69t9ryyTSo=;
        b=QmA0a4bhDFCxaX+oV5aZXeeQE0keG9UEOf6oy50IwWoiVp01sgSbQacTLS1OeYNAwq
         hYGud9RCtrjcgrJtghFPhcHVue5ABjaSwXrC/1dtiUGRZ8DnvgPAF2s/wDlBexkre7GF
         eqOqbwker4OL9BF88V8KQSzLbfDpZnr6glGZUX9Z88mktGkcHnu6JLxwRkmu5KrpLVAu
         lQ7F3d9315YE/Mzlt7bAF5RJFI2+hcOvpMUdiY6/sPcRvW435Dt2GSex8HLN8NV3QYqs
         ZKUi0lpqtiS834WS2iJUofXAoMFL5kIKc54ZKKcci/QrdV95Si5mW2KQD3s43uM8en6M
         2/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765130; x=1756369930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRvAzDPMBGNTB2v30IPH7YjhXyJsEociQ69t9ryyTSo=;
        b=LXAUcvH5X4M5qYvkhTCYLoaD5580ZqcCk3mKfctsWUs9vuMb9GlOmBiotsoYSIKN4K
         vv+7guix2MrGAdE8g2l/Xbj9aYkBpnjCQWwDtumHHrP37hvZXDm6gb1PEW43N1u6pCgT
         Nf0kxBhrxnqJjp7Vma3ZhgNKEB/AGUTy3dGA5BiTGblL4bFG50uyP5E2DnbyExXifKMm
         AVBC7N6duRZhstDMSXLid30r6mg7eaFmouArg8IPQJp9FTaNMIDAxGXpQnfPSxNVD56o
         VxSh78gwJcY02FJaExckA+RYVU9h6GfZtumEKPyltoeRhbHodGNZiv3QRYq7KjA33yFt
         uw+g==
X-Forwarded-Encrypted: i=1; AJvYcCX7RM17mLqw8NAAmP3k1SSO9p8oT4QFLJz2wmQ1dEBLmro+/7BlrxFXPyivCmsBDS4iAdXofaih+SbveQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzW6zXtD4CaVmUueXtTxIsP6cIfCG0v5DNeetakoEq2PS4z+wxT
	tKHgyY2NcS7gJiz58QUzjohjxxXdvxqK6Ivz4CD89/+japXQPA9/u/96eF/SoMOFTiQ=
X-Gm-Gg: ASbGncvSSYOjBUs09Egz/MNiSXZyWVyoplrtxcqcwhjaAgFwXzkPz2NCd2A6hhSQIPj
	r/0kutw1J6mJuhI7qG53tqgCMKOgtmEHW/SeCn9CADahhCfaaP+C9XYiS5hifvIKtsoXQUFiNmd
	KMcLBXa4bvs5SaHfch75XoIvEOv8yluDlZJEm+WY3dFxFvHftFQbF73BWQ5gRkjHTKWRbxL7ayO
	ChxYnvN50utuVJA7ulAwYwIjE3oweMMBl3swSQPaT+FJ0DR4C/JVuRHC7wCGVvzUAxljIezLOS4
	KeXAAYqytxD+FZTQ9rB4zDI47Uvbo3IH2cQBN0SGeEZNm0ZjiyiKh6ihVP2VKwKSpOnnbhUNoKn
	eANPsecje4jUJB4DbWfBncqDeF25xZ3UGlA==
X-Google-Smtp-Source: AGHT+IF0yeyXaXIgpuu1Hv3lLvysTAldvCSV3g0j/RrKOaK78LX/7Pw9plJf47pUTviNVdCxtnVOUg==
X-Received: by 2002:a05:6402:40ce:b0:61a:1fb2:3297 with SMTP id 4fb4d7f45d1cf-61bf8752115mr668450a12.5.1755765129957;
        Thu, 21 Aug 2025 01:32:09 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a75778077sm4761880a12.35.2025.08.21.01.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:32:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: i2c: spacemit,k1-i2c: Minor whitespace cleanup in example
Date: Thu, 21 Aug 2025 10:32:06 +0200
Message-ID: <20250821083205.46600-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=tmlq5TL4b9hR5e4/dbfvMZDDic0MixP/CpVI5rMMnYM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoptmFHk9waBle4RJFYoExNjWScWzn/KVPJWdEW
 BqaXrS6HQ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbZhQAKCRDBN2bmhouD
 1x42D/485/LVTQzYX1z8T4Dqq80f8hCQ+UNg/m5AB19ZV8QDVlKt9PxBtXSYVlrqlxXdGQNHCSt
 LFf2hNYV4kNJJ+h0no1myzXlxiZ9WTZgrMxi30rVtI45a7F/oSaDRvYeXuqO/Gdrn1mUYd7Y1Vj
 Q624yu1hlY7YZwuj3XOyCFCMLLRSfOVmhJWLqJwGuS+4KCFfrb2YepHxi8ASZ5xbpWadcUj7OhQ
 Da4NJRGWPR9PkJh0O1u6HIMIrmWv6xW68tYEvSV/VwZDAwAXvUsVWLDBtnGz5o/+5+1bz+5Fxmp
 fJv8nRx5XnfNkhPbNzy2v4fbLJPdl/V+txbIcpSstL4K6TzBime+E1H9TBfD6AFS25ZgnpnIVyo
 oopwye1lfa3leqALpx+l6SRr5R7w8FrZmfK0C0IsV19Lk7eJTPxl9R8KnfFKAtVe/xoLmH2Uo9r
 SjR6c2JH5JL2VNFDmgTG0VZ8OqKsFy+neJ7tqzWI7vbMCJL/xY9eyVORr+41/QyeLu7poqivik2
 nrquKx1qCgtciT1Oxcxi0H3v+KiNp/l/hVlnJEdHfpZ/u76Z4tZ7UOeiksLT+jWbXUObKM8Mi7B
 3LUIMoaw9qrvLJnSb58pUofJauL/oGGv23A0Xq9P6+uQZZtC7HyScojqleglxnzrviIq027h+hS h63Oi1GCs8FPyPQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_013211_609798_27C0532C 
X-CRM114-Status: UNSURE (   9.47  )
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

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index 3d6aefb0d0f1..c1a3004df71d 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -53,7 +53,7 @@ examples:
         reg = <0xd4010800 0x38>;
         interrupt-parent = <&plic>;
         interrupts = <36>;
-        clocks =<&ccu 32>, <&ccu 84>;
+        clocks = <&ccu 32>, <&ccu 84>;
         clock-names = "func", "bus";
         clock-frequency = <100000>;
     };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
