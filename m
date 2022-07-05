Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC51C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdbavdUgh6XU0C7PnXgRxauc6xEDOFdWNqRkFANLF5Y=; b=rKrJwq0gri8gAl
	w0MgsF0DoYVAP7aLBO00TplTdsnfSuici2OqY6HjZLn7A9uYtztqQL5w/IGjSaeVnhvw1d9JWI6Fq
	1Qb9aHtbOXx9n0mZD7JDrkktYFI0DiBby5tlXKBK+z+QEuU5vewFloHo7Oak0kChWVBw3uxe9BEZU
	K6THB/uJKOJY4hFkWrSrAEEXfmqRfH9nOKkJZrkKzWD07vXPa2SfRrEzH0/FsM4hE1w/I2MGsOwVL
	AXM56bM48GymymekqP3y3c0ecABNeUika6geR03IO7cl/K8j7FYJeHeFjR6D2qXwYDWZopyRGNCWq
	5mfbcWpp9ecSOAuqTzLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pos-002qUo-H4; Tue, 05 Jul 2022 21:10:54 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pgC-002nIp-RK
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:01:59 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C840840A9A
	for <linux-riscv@lists.infradead.org>; Tue,  5 Jul 2022 21:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1657054909;
	bh=/+iqepEXJiQtf1kCLKBlcRYR4nyv6+zJPzgNc4qYD7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=tuwF+40dDEmeii9OYygVHsCAsWo0/mPU9e/ETx6+bJuCD7O/tLLlsTXSqobw2azVX
	 g87xpNpGWrsII8jiDat956WjQwzaEnhR/KUyKu33TLkPecv5uTRw9BX6v4l9I8PB4S
	 xdXX6VP67oFSEKSGlxq6tvV965RN9xniLIAwl3whAQcND6uNzqCk07qVze+mAtUlKv
	 RYTxw0C518tWqDPN6O0baEjFGQYDIOQ9f0ykwjFywAzsGK03BqN6SKRaJu5VBebE0c
	 7hGcUjLAX4oZG4Y8Kw5h84CoxtpDjQvLN1gHK0Vp82YIHiXNeajHPbSwG8adxP0WdP
	 MAMlgqcQ97cBQ==
Received: by mail-wm1-f72.google.com with SMTP id v8-20020a05600c214800b003a1819451b1so7286357wml.7
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+iqepEXJiQtf1kCLKBlcRYR4nyv6+zJPzgNc4qYD7Q=;
        b=jwCcorXvXc9QDuIRZqZlf3sp/whnvTetd/Q73EPl3yd1vxxvIM3aRvdpbghajEZMr9
         KnIJxqWINKkxW21z3+HmY27Wd1ADqdKrWOZF/ar/w8ZsKnG2afeiaovQlSE6TO2/i9R2
         BNZoHvSvaroswcKOQJrC2k8awzYiTn7ffnv10rdv8gD0lZNvnQ9t+Mb5Nte/SjDD51Ct
         jOTI1+lIJSm+emINJPbaerbAEboaU0Nbj18VSkO9BoOFr2HFGUnG0gfDqfnmHxChJ7E4
         xD8nF01W+6WpzJN+iiSZj+ib+6PbQMDS9XWhU6TJYWnk9OWkjdhQb+B9lhVt0oRtKN0o
         Qo3A==
X-Gm-Message-State: AJIora/aqv+/PBxh6PMAPn2L6FAFE6ug+2NB307q2HvYPe8C5KV2Dp8B
	ABxHAaYzb1QAj1TuLdoH0CiXBlnhW29gE6UggsC42E4gYPDjW+7PuHVn39iA/RdQqSOQGMvRR35
	BJa78bCeXvmmebmMhuAQJ2/gojp52YFiCgiKMpmR2uPZ3GA==
X-Received: by 2002:a5d:5f05:0:b0:21b:8ca0:6d3d with SMTP id cl5-20020a5d5f05000000b0021b8ca06d3dmr33987892wrb.382.1657054907933;
        Tue, 05 Jul 2022 14:01:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1voNkjmJLsItk4qX2FcCqMMV0I2vwoygxRWgEn1u2iRJAbKSZJmuQVNG8KjvMDWpNkZS4aZLA==
X-Received: by 2002:a5d:5f05:0:b0:21b:8ca0:6d3d with SMTP id cl5-20020a5d5f05000000b0021b8ca06d3dmr33987869wrb.382.1657054907727;
        Tue, 05 Jul 2022 14:01:47 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm2517667wru.28.2022.07.05.14.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:01:47 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Vincent Pelletier <plr.vincent@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ron Economos <w6rz@comcast.net>,
	Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Stephen L Arnold <nerdboy@gentoo.org>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	David Abdurachmanov <davidlt@rivosinc.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/4] dt-bindings: leds: pwm-multicolor: Add active-low property
Date: Tue,  5 Jul 2022 23:01:41 +0200
Message-Id: <20220705210143.315151-3-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_140157_072372_1AA35FC3 
X-CRM114-Status: UNSURE (   9.77  )
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

Add the active-low property to LEDs that are part of a multicolor LED
just like the regular PWM LEDs have.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../devicetree/bindings/leds/leds-pwm-multicolor.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
index 6625a528f727..8d614eaf5c5e 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
@@ -33,6 +33,10 @@ properties:
 
           pwm-names: true
 
+          active-low:
+            description: For PWMs where the LED is wired to supply rather than ground.
+            type: boolean
+
           color: true
 
         required:
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
