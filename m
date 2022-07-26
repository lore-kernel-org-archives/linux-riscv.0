Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71568C00140
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 17:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eloWFEE8b6k/L34jDpLD/HNAIfzjgkZ5A4pbZnrHkFo=; b=LT919hM4keA2S2
	npFnsV/lPtVRi4y9F/H9xyayHS4XT32fE7C1uFBN43KhmS/SBILQRopOpg/4iNzrZjHFNCSkCSOed
	5Ty0V1Ms30L2Keutiex1BqPqG/q996LjNvpnb/zre8Wzv4Ywhdf45aVgwV0vOIajkIIc7KCUaasQI
	CBL9M4uVU/8Yl6UfrvH0dNXg3a2BosDpKWWtTin8VWdtfnOvd6yWaCDxOtx3+nKC4xI7zVxN+0TCg
	qot7k3qWnZTaxa42J83lm/xcQS1Qe26m5L2++HieqtDS1lXACaz3JQEfWhWHIUmcCxMo0kmAhedSJ
	f42b/LauU1IElbEheB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGO2T-001GFp-H2; Tue, 26 Jul 2022 17:08:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGO2M-001G9f-W3
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 17:08:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id h8so21018838wrw.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Jul 2022 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jzo7E3iuffF68CMucGWsT/yGzhnjiXcilx74DK/3MzI=;
        b=PJwcnD/GOZLAyqo5HYBp+ugAHaWK3jD+s39TePD+rKuCuI6iI14Xay2w+UOL0js0v6
         LSBHiEPB44Ii2OaSGoDqNOVSO6rNg69fZ7u0WIM6Le6oRMF2IRUbOBE0P+5dIMhS9yGa
         QC+F0XyZryu1sFqAVoIRgh46Ge6GRHy1WkUhbRG8gjFB5aNyx26K2hN41i4YG7PvuOCR
         qf2apmc2qvQe6Azfk9JX5P9HelPwx7VJwIQamSA2IvtkS0pvhPy9Hm+mGBmhrdG9C2hq
         YvnISfSwHYV42XaarrfP6SM31clvkoOOFn/3MvggwSxR06Rcuh2QbKN3LYeFiRPBr0y1
         VnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jzo7E3iuffF68CMucGWsT/yGzhnjiXcilx74DK/3MzI=;
        b=cXEGQPI1yGfIzuSQYh3cobS685qGQ78rta6dFN0lTL3NDNuC6XleOwVQ/7TFqbvh5M
         FSoKXa8zSzdwqrd8f30eS5/DaAy0jOLT37R7o9OyBF3mpIiluapiOyYAzWoH8Vie3xCa
         Dn5x7yqfDnmSTOBI9K7Ar020vayVvWH1DFyjL8WLS9BdQs8mWDFL0srEjw4OIQfqZ81v
         NZZRzvCvvm4X+cQQIrnxWWnE9IRWUREt1L2HIW9tZlLQKr2IwPRf0HNUBmX/Am9d8qYf
         2F6y227D4kM0QcWRexGH77UD+d1caTGA40MnCEBVE6k+cD4wNE3lo+vBw+s09bl4ihQv
         C6UA==
X-Gm-Message-State: AJIora93k+XFedPcqTIfRLpjiIBt2iP3R2HJ8pJbM5mM9BYW3isIxWIE
	eqX2jX2q3cowRJ7XX5+MOxcHZw==
X-Google-Smtp-Source: AGRyM1tirn6tXbKRAXaMvkLrwVqgAF4lGynuVfCpdqZGZCoxCIG6G3hqB0PYq/iIx1kid07GWxSsVg==
X-Received: by 2002:adf:eec2:0:b0:21e:61cd:64c7 with SMTP id a2-20020adfeec2000000b0021e61cd64c7mr11543092wrp.324.1658855279436;
        Tue, 26 Jul 2022 10:07:59 -0700 (PDT)
Received: from henark71.. ([109.76.124.168])
        by smtp.gmail.com with ESMTPSA id r17-20020a5d52d1000000b0021d68a504cbsm14859618wrv.94.2022.07.26.10.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 10:07:58 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atul Khare <atulkhare@rivosinc.com>,
	Sagar Kadam <sagar.kadam@sifive.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] dt-bindings: sifive: add gpio-line-names
Date: Tue, 26 Jul 2022 18:07:26 +0100
Message-Id: <20220726170725.3245278-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726170725.3245278-1-mail@conchuod.ie>
References: <20220726170725.3245278-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_100803_054686_AF4EAE81 
X-CRM114-Status: GOOD (  10.28  )
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

From: Atul Khare <atulkhare@rivosinc.com>

Fix device tree schema validation messages like 'gpio-line-names'
does not match any of the regexes: 'pinctrl-[0-9]+' From schema: ...
sifive,gpio.yaml'.

The bindings were missing the gpio-line-names element, which was
causing the dt-schema checker to trip-up.

Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index 939e31c48081..fc095646adea 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -46,6 +46,10 @@ properties:
     maximum: 32
     default: 16
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
   gpio-controller: true
 
 required:
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
