Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2E1C46CA2
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 14:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=za9gmJOlGEdIVPmW5RzsI8eaiUK+0N637WNz+9ZMx2s=; b=Q5kMqlztUlAMcR
	vFsaZ1af78VptjXTEjpADHUeSmaAn0Zymq/my7bIZZi4HeeZO8qvT/XP9E+rHX34jfPbAKHqRpC3d
	uOh/mm6SSD750TElEeAuIQO0TbhF+pSLPLwIaRpvM1egikQJ8oqxyqXNL+h061PnZDas1r0j0gFTb
	o/3wp6X7xP9WJu8FSQrdYHSU30JTuFu7Y2dl0bYeK1VhbaC1JwEIUaiyablQant4K8YobcAsmHSCM
	90o/ca9nk8TIKlzf9QfSgtgSK+RNrfex0uGSAaTCmeTw24PnNkoaiBQ8GDkJqiJiyjycN1dOiRJOk
	BmOxUJ1FzwZNQCmqyG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9LV-003aFh-2H;
	Fri, 15 Dec 2023 14:39:21 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9LR-003aCP-0d
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 14:39:18 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 644533F2D5
	for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702651155;
	bh=5d0QhzVl7C6w8MyPA6on/NHcmfCtxfOh1Mcdqcw1JG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=bYyoIIIowGXb8//aNctKmzMiKCGa/JuSam238X5sqVLTTfamCwaOp7byQroAeLf2R
	 MkGlJ1IidyBUf0UKL/XL7gLyGGutEzIjB0ko1xeZiAXQx33oBqUs5rR27H8tyN8doy
	 S56IVYdK5c3wnNaOjB0LcJXycO+UoG0vZ1Fzj3pLP0xHCmq0mBaX2F3D0CQjs6C43O
	 3caJXM2Lf1rt2UZHjwgsajr48phtYwpKLhZjWSqaWc1/rW6iNpWNCdK9y2TtTXgLLj
	 sTbi/lhNSnPO3P6PNXoDdIxyoz6pdF8CcLgyTb95wYQ7kUwH1Bb06/6zXKQ4MmSWDK
	 aMxKWbDOXELwg==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a1da829c653so44935266b.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 06:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702651155; x=1703255955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5d0QhzVl7C6w8MyPA6on/NHcmfCtxfOh1Mcdqcw1JG8=;
        b=hzx5+9JfyJ+ZsNV/mRoZY4czdwHD4dI5pguitmtOmgjR+dIky+xddTtVSBF2HhBZ0x
         H7fg4YCUN3fmimLKNLUno9S0jbI3U89xGbfGQuY0rahsz1mQINEBSVa4niU2WtExeJ9V
         35UpL/P6GojLpf60KjkVxVbJcKSDEgIZsQjeYglOupwF7XaywlG/uIbqFTZnKMvJKt9f
         deEnQV43wWQkeJyvTPNNv66hFVNRp0r0znUAR05HHnU2ZCajGmOEVvvQ7rz2JusvytFG
         fj0QZRLg3hm0H3kY51cKgt5V08a4qyYnl9JpvXfG8LsFHcH3Sja2C/mmUGBTMEWQxKMp
         u4xw==
X-Gm-Message-State: AOJu0YwS8IMJyPjowx56raONeBbIKPt6OULNfW4xaRgVn4iL3ORrZWUr
	34Hmw4Lf3B6+8LixDRiL92/Fb2P3iC090hphPsSqd3EOZm2BSehLFCzzpQcHjs8MoyHpkF7kRyU
	uU0i2tYRYG8K4v2xr8c1ASX6toKajAXBYp0Xrl2H3v1fbFg==
X-Received: by 2002:a17:907:e88:b0:a1c:ad6e:f27b with SMTP id ho8-20020a1709070e8800b00a1cad6ef27bmr3397169ejc.78.1702651154973;
        Fri, 15 Dec 2023 06:39:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhb7PhCXQlTmlO8Dr2ltcQSzgklP4jZY0/NHHCOpfEFcHKcRabJYeTEWK6MtrnQyFAiYLIWg==
X-Received: by 2002:a17:907:e88:b0:a1c:ad6e:f27b with SMTP id ho8-20020a1709070e8800b00a1cad6ef27bmr3397152ejc.78.1702651154724;
        Fri, 15 Dec 2023 06:39:14 -0800 (PST)
Received: from stitch.. ([152.115.213.158])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm10789122ejc.73.2023.12.15.06.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:39:14 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v1 4/8] dt-bindings: gpio: dwapb: allow gpio-ranges
Date: Fri, 15 Dec 2023 15:39:02 +0100
Message-Id: <20231215143906.3651122-5-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_063917_373660_BC19A8A5 
X-CRM114-Status: GOOD (  10.98  )
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

Allow the generic gpio-ranges property so GPIOs can be mapped to their
corresponding pin. This way control of GPIO on pins that are already used
by other peripherals can be denied and basic pinconf can be done on pin
controllers that support it.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
index eefe7b345286..ab2afc0e4153 100644
--- a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
@@ -65,6 +65,8 @@ patternProperties:
         minItems: 1
         maxItems: 32
 
+      gpio-ranges: true
+
       ngpios:
         default: 32
         minimum: 1
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
