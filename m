Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C422C3600C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 01:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZyVMp72umUkLWWQQu8UWTpz5nlA82Xbzc1uqV3VhvBo=; b=nIQqyzSjpfWcQ9
	QLGv0i+j5ABmkR+zpE5i5v1lTTfCjtfrnRFfog6YfokqgI3nc0aIQ/kp8uQ+nHdMyU2i+m2FOqYEM
	9Pn0HhWS29Eui1jvUOi8sx0outeKFi8uncAPVyX0VJ1bzd/wWLax8Il0+vlAYj6xyjVWVYO+xVyrX
	+lF5grQtnzEvC6lFb70cjubWlDI1jzhrm82j9Lx+DqT9ssKudRFjIS7fuU5vdDRW3ycnXEq5qh6KB
	cg7DYLaPAwlPw89XgV1SehcTAotrqKZzQlzRB3Lz0LvH6NeSe1dktECQf28UP/mMGUttzn+9Ky2nI
	K2QHhDhINoV6GvvEunJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1axI-0000000G5Lt-0el5;
	Mon, 07 Apr 2025 01:07:16 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1axF-0000000G5Kk-0Tml
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 01:07:14 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4768f90bf36so35038441cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 18:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988032; x=1744592832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxGj95L/w2Qzs2Ze4BgVcXHP5P/GdsW8Q50TIa9jmhs=;
        b=E/Wy9sxLDDi4Pd1gRStt6Q0drP/ZnLhK556JnPLkvy8JuQUwoMvqBqdhEXqcQIoQp6
         rkiGAWKec3rzjTqqNCkQE8sDAUI5Qfkp2JeXv5OS4io5+4RqweAreZgeEiMn7kQ08wUU
         ZvFvIC6VOk/9hrKeAsHxYXOZyMfZnyAchyH/kQozCGUjicGmoAi1s9klAkBZwoqjwdm4
         VNoq76INMWourYlePjtkaVCkOZiUpypWjkJHoQxgEMluUcRW6bl7UVWVV5XjxV4ldyQw
         4ijg1bFb1CWfv9kR5O2LwXX2JZ78Grw51AOrUfcKfmf+kJ0C5AcIg9Grp7YC/yD8KQ8g
         HPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988032; x=1744592832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxGj95L/w2Qzs2Ze4BgVcXHP5P/GdsW8Q50TIa9jmhs=;
        b=QkOvNH+/taK/X2u4WeZx7r5porjTKmL+88jYoCs3GwOk4bBTKaosQjIzLSTSs9ON3y
         0pgLNPGd1vNB9K+EIrTXyzM6bI+vKTzeG3KEX4hhKRlbv+HUAJrLEhsu0Q2f/adbqY6k
         K4fHLsv1nmHpF0u9sglofo22rw+ygcf+tk7/zFXCGMM1AxjtncjuD63AXSDCdAFF6jew
         /gIlR12P79QejjsGper8dEtcBkYg7FG01OLE1+niYjd0M+CXhMShBl7sWEaPOUYRPUjF
         sFwVsaQjCjlmcwisOLXyXSkc/NgmZMBgN1/w1SvC+2Rne9W44vJEI6Y9gPZpU0kLRpZI
         wpjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzMMlQKaqXwU/zdtWjH2INJfunKmzRgjZuUp3TShfRhVQFzienuOSQ6HUpaSRLoYJY61uVYcfi5WNnBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCdDcJydezdXqaS0dia6R7pk+kS7prsQXhYQ/2IqHK7ROVC4R8
	5VUGfDuw5gSevqgT4UIDVoWpoUM9cM4kL3EGfojbMUNuOaTvf6Db
X-Gm-Gg: ASbGnctdq0hYiNoVP4N5jFSRahI/z7U3X8DSO1FTwF/CXUEUM9SawW0rAGPeLV02mhE
	W1sZyfrn3mDngjSz9B5WC3MLaL82PHgpFriAAKghuL1KCG+fbfx6besVFKHlP8/h4Sc+k95f0gP
	Jq/iGAmiZAXgmzfkC6JNo+OxH9rkfJKgZyt8hRSHgy27iZOboyXJnyoHybKuMHrSksB/U9g0Tzc
	V3uiepIKjxE/bWEjZmLF7YN/VxeIQ65EWDYUSiIF8O8e/N+om1P3kZ+8+vl2AEfOApZRxXqX/uZ
	7EJGUfjRiEXhcn4UFKoc
X-Google-Smtp-Source: AGHT+IHCyM7ZtX7jFmV5IRhKbjQ2Jxv7Idw4a15oEj0OBoQ/eDrGzMbPNQ9/4L42Cket5FjlilXjmg==
X-Received: by 2002:ac8:5aca:0:b0:476:6625:eed4 with SMTP id d75a77b69052e-479249abda4mr164123331cf.38.1743988031833;
        Sun, 06 Apr 2025 18:07:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-479364eaa28sm25496661cf.28.2025.04.06.18.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:11 -0700 (PDT)
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
	ghost <2990955050@qq.com>,
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
Subject: [PATCH 5/9] dt-bindings: hwmon: Add Sophgo SG2044 external hardware monitor support
Date: Mon,  7 Apr 2025 09:06:10 +0800
Message-ID: <20250407010616.749833-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_180713_153537_E1D66FC2 
X-CRM114-Status: GOOD (  10.55  )
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
