Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58B7C369B2
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Apr 2025 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3GUxDH/mhMqxfz8ZPQMZFMmBg2WXrcB0G4XGcLAdkA=; b=jkixNyUMO/FiFH
	oK/JQ1d3Bu60PDrw6+dKhxB8Jxg58miHXtF/zS0VI6OvlDFu4qxDTw/XGWukWOgmAWrb8KFf5phEf
	P7+nzmCo8B674G1LOdYP/hy5rcWmZKE+6U8X70bp5HkGtCbI+683JZvmiLIs5a7tbtfa8eONHG922
	uK5OXyhr/UFJ51IVdo00+Z75d9+BhsaWYijcQIFqlwtFHHnsZg+NTgZwUfK9c58kIWjX5eBC5mALR
	KoQ4XlEJqi6VPv6jNLNXq89E+IdHF9EyUVGG1R5k557nqhhunaOgk3wNjFFjBLYS0G5iKynXOAWMD
	xBaFUgMo1WE3N/2A221Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vy-00000000GGS-1Bsb;
	Sun, 13 Apr 2025 22:36:14 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vv-00000000GCh-2sML
	for linux-riscv@lists.infradead.org;
	Sun, 13 Apr 2025 22:36:12 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so46375006d6.0
        for <linux-riscv@lists.infradead.org>; Sun, 13 Apr 2025 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583770; x=1745188570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytUlfm8qXlr28wKDzJ5vAM4ffHx7bGxIhY9dR92BS0k=;
        b=jQuBpz4hiUG7kUxIMm/QxjPUDiVyYq0ZTvxg6djeP71Yi8tdZfYxbtWSaEerXlI7O9
         f025WKZhSg3HUL6UqBq9PsMnUpacbgq5NIh0BvdYnCy9Fvksv8qjvA6E36MUsSy61Kus
         aOEHG6KtVpe89fR0cAs6CK8B+xdlP8q1Gdsezop+4Qwh2QK8NtOHBSYleYRgMqPn480E
         RVHyo3jCNLxtE4tx2VKuqzRNJvEl2LbTEbyrQ9HuKc4Gtp3t0Ph+eu6yqSrC2wTOXKh0
         xgSUSRNO+JAV35Kv1PohqiJo+m1P4l0HwLsh1zDeIy465aFVuhN/Fftz1JSxofKM9JT1
         viBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583770; x=1745188570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytUlfm8qXlr28wKDzJ5vAM4ffHx7bGxIhY9dR92BS0k=;
        b=cfvy+s2za51ki0HsfZ1j5WmUuEx/9IUTAStct1b51qfw2qKFM6voTICx7EBH08/xSu
         nHwPU37Fb2s0sD911HZ276PENrInqqchmxYtHhTSbS83rXy75pxPVFurt135Lpv5BPhb
         ewAuX3NT6nqBaQlF1Nr6/y8rhtRaKjkcVBPGqF5LKym08giJ1pnOnOmGrifY3BjCDEpl
         zVq8KZZ1FOgeDKHDtpYnGdItqvXaRylIkD8d4wa0VXCad4e/MlqxndZ9mpCXvvNJEmgL
         lRXy3uv9FIToK3AGiLtrGEMzihz9heqbUadIgrZUYJY6+SxFws+CQs5+v93D0K/ewCDB
         eeXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9spJfC5DOYjdDc0RuMaJrb3AYUX1Ibf15h2NPLwJxc61QlhlG5+T100C8O77eKSgmiGtZPUobO8Bd2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa+Dd5Bs5ZvTzF6yuPChRQIjN550TrAXS58b9fuxxjiyIVG5JB
	aBaStXJow+c1dCRXK5uAgVsKsR7X1k0pez55M6Wf70KS6ZC+gOZj
X-Gm-Gg: ASbGncscXJ63h4wnGfVeYG3KrmDtfy4Ho5vzNCQL+nDd2hWfViECvWGkiDEssDikASt
	rSSpabGU+hVwsJ2y37a/KFbXmMxU+n4KtbAl+u9oJhm7con7KMhXzBrzQWhJvfCNTkwpnn7nuTP
	9b9IJi1wdiv/xc80dCvkdl1hWas4YnIKetOPzd6vVuCvVjp8BBzkmCAV/Tj2CY4kaV2Stxb+0VE
	0sFFdTjkHHiua26fZu77k5RKAWMgiTz1Q58kKBmwMkS0tRHsfEWfXWc+4EgCHkjGu5U92skHQ2U
	SCLYKdkvlcQ53ENG
X-Google-Smtp-Source: AGHT+IEcPAAd/YdhD+Atm2W3Vnu34/pb8kOdXsK5MR1PkYT0dx5fqZg9D+xlK38+CA7lSZP33riAiw==
X-Received: by 2002:a05:6214:da5:b0:6e2:485d:fddd with SMTP id 6a1803df08f44-6f21413e725mr180382056d6.1.1744583770550;
        Sun, 13 Apr 2025 15:36:10 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0dea104f4sm71033126d6.110.2025.04.13.15.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:10 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 06/10] dt-bindings: hwmon: Add Sophgo SG2044 external hardware monitor support
Date: Mon, 14 Apr 2025 06:35:00 +0800
Message-ID: <20250413223507.46480-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_153611_770175_BA5D6D69 
X-CRM114-Status: GOOD (  10.25  )
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

The MCU device on SG2044 exposes the same interface as SG2042, which is
already supported by the kernel.

Add compatible string for monitor device of SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
index f0667ac41d75..b76805d39427 100644
--- a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
+++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: sophgo,sg2042-hwmon-mcu
+    oneOf:
+      - items:
+          - const: sophgo,sg2044-hwmon-mcu
+          - const: sophgo,sg2042-hwmon-mcu
+      - const: sophgo,sg2042-hwmon-mcu
 
   reg:
     maxItems: 1
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
