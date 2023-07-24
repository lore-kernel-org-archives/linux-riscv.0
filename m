Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3582FC04A94
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxV2J4thXGgcJenOhS3nXjig3kwllfflQ1Ph8paHpmQ=; b=v1qjE87SFhVpVd
	I2KNVFlxB4Gx3GL66ir/koyQA61QmFbPt5v0/9VpAgQF8rWCda+mO/y4Pn1lEqzETqsACKN9+UYlb
	uJH7QHl1XTJJcEYnObyHmNvN0xySJCQ0nl1GFoCK6J8/fbjvM9SWjLxsQUR4k4d0AUAdvNglD6gk0
	9/2Xfd7/hYf8ysrs8H6F2ApsZ764i2qOaZcp+4RcgW1klKIGVv4E8SK73J+E1sEQ+UBCy0noYBo2h
	MTIEHtMGb+xxLceWiL1Tf/mapevZhrqCikns4YMDRgcvQ/F1Hr+uWzp4BPZBN4formmFhEYDW+jBR
	KZVhmFysWyh/B7/Z2bsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzEz-004zhr-10;
	Mon, 24 Jul 2023 17:21:01 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzEr-004zdR-0c
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 17:20:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bb893e6365so10586695ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 10:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690219248; x=1690824048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yG6Fw3427yb+1A3z1UjhPjDu/XeyqKpB6skEHK30hAE=;
        b=jmO32zV7MyqDXvN5bP/2SuLkTtT38XiVZWCkqII0s9Z5i9H0ZJ6/OFVSuF8bKjVmFV
         lzuYRHvb8wVLEbrAyac1/IgtgXOuEApCTv4f6lGy9x5GF0oqdK9wO5Lz3PLC8jdQl54o
         YWjZ2VlcYpMYGQW+SBKxIinFp5SkICN9Hlo/9GzBwrgIxffsGHxAZx0PYzwp1GsS1fyl
         vXfIXoIYNwqBXmC6iy7H4ihFptx2/aeEIqJFv7hU6yi1QLXEhLpCebbhq90jSomoVmIi
         4EFbqERAo9kOOVtR4xAhnrmh0hfkoeKVdRG7khI9UFPi1SVJEpwf4o9009xg7DHUNPkx
         N4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690219248; x=1690824048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yG6Fw3427yb+1A3z1UjhPjDu/XeyqKpB6skEHK30hAE=;
        b=QiwBX/7cXBNF2BI+tWvmeJ0+PN+Oo3RPorETvp5GxxcNIiAlb66HYHcxNt025o1W5r
         SWa4dvWtCjuPC+JaEGtLJyVZ92JIHVaEUr9RAbxm7R43Nztdk0AY8BeWlE47w9Yvromv
         EVEFzOaBPwn2FShwge67nOECp9hZP7JFnGwboEW5raM0TRCY65ykfydNmE8VoiSlWa+9
         h4w41G9Z0ccgtfPMlf23mD6hPMwUjYCHM03qIduJtcnmYyQdyz2KFx44/N2yFoSaeUgw
         nNg0U4tBmdaZLOIRBj+PPkVvJofD1nQVe+lp+v3LG/ZuWP6vMTOXuBjzDzGVopMI4Ej6
         2Bqw==
X-Gm-Message-State: ABy/qLZRMGe7Jvf1xRQ+LFm/hKpeljTZJhjzmqGfRk0QPoOaA6eFQNwh
	qHCSkPP5+1OKJ5lLrtNuqU4uBw==
X-Google-Smtp-Source: APBJJlHXX6f8aSU2q7XTjWqD6MEPU2ep9lzFpSAwTPqEvRGH8trskBaYphPiUnho53oicuo7BT838A==
X-Received: by 2002:a17:902:7d93:b0:1b8:b26f:a6ac with SMTP id a19-20020a1709027d9300b001b8b26fa6acmr8556357plm.5.1690219248651;
        Mon, 24 Jul 2023 10:20:48 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:b55a:eeb0:a3a8:248e])
        by smtp.gmail.com with ESMTPSA id ij15-20020a170902ab4f00b001b9cf522c0esm146456plb.97.2023.07.24.10.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 10:20:48 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 24 Jul 2023 10:20:38 -0700
Subject: [PATCH v2 1/3] dt-bindings: riscv: Add BeagleV Ahead board
 compatibles
MIME-Version: 1.0
Message-Id: <20230722-upstream-beaglev-ahead-dts-v2-1-a470ab8fe806@baylibre.com>
References: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690219247; l=1043;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=WpzSzfYRuktV65/KrbeijV6SvDJPRaBdgv74PJSJApo=;
 b=VlVKSb6j60XCYtqQ4xA6mjMyq3wo5A4KCBV05ljq2zRQIKv58/TcihvJhR3H6bMpxp+zu5+ij
 5OAHc8kNWpyAtaZ8zN5FuYC6a67LkjHgnM9/nigLqONCu2WgqsIsHHV
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_102053_227262_C33F3E53 
X-CRM114-Status: UNSURE (   8.14  )
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

Document the compatible strings for the BeagleV Ahead board which uses
the T-Head TH1520 SoC.

Link: https://beagleboard.org/beaglev-ahead
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 Documentation/devicetree/bindings/riscv/thead.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
index e62f6821372e..301912dcd290 100644
--- a/Documentation/devicetree/bindings/riscv/thead.yaml
+++ b/Documentation/devicetree/bindings/riscv/thead.yaml
@@ -17,6 +17,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: BeagleV Ahead single board computer
+        items:
+          - const: beagle,beaglev-ahead
+          - const: thead,th1520
       - description: Sipeed Lichee Pi 4A board for the Sipeed Lichee Module 4A
         items:
           - enum:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
