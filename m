Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D09C27C40
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 22:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJ5Ruxm/JbQlBWc3F7xrIpJpgvc+xN7xiO6b/3qeQjk=; b=wUsOGy7CME5Ynk
	ZVkX+CWu3wmHHLY/w1MqyxqyqtnfsAhiV/kJlcoteJk8Thy6FhqYZEeVRXgAysL1PQfGrqdYax86+
	aYyVJJSxaD+KchhmQwXy6R65F4AtctHLatQxXHRN8onuuAgo9d78o4Pbts0jobo7M5vCGh37dB4kJ
	7wqQ7uG52h2tv5SJOP+gUL3iMa0YoP3u8dWCl9Nd8sTploKtT0ZhVppBHj8RxxenHAvV+HgmzJwDN
	FaFMJIXX6Mfzh40m2DyEdMQdtcn6JghmMXl7KmPRigqvQ/Q/sIxKo2QYkAa3/FosTm2Sn3qo6zhTg
	dxfQN003evvJ1H32NHtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vSi-003AlH-1p;
	Wed, 22 Nov 2023 22:12:48 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vSa-003Ahi-0A;
	Wed, 22 Nov 2023 22:12:41 +0000
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-35b2144232bso851505ab.3;
        Wed, 22 Nov 2023 14:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700691159; x=1701295959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQrmqAZcdIuXmqszFM5kR+KdU7shYUbjsm44jbecVtk=;
        b=NoW4lMtETEwuHAUrPRR1TPRzADLcEccIC0kaKVhZUeNP3tsvIIKtiJuWuRsQn5OtnS
         C4X5LEfWNaARkMMtNqlwCDsM4o0fel837a4AatP3hnBcDgjo8VQSCf7+Ywii+vaHmA6L
         i14k3b1tjyNrS13eLJXb8hKws7elMXWGOCayb7remGNR+EWomsIHuMouvIrXr7z1PBqM
         ydEWVVblA+Fcn0gSqOQDy9O/nqT8KqWnBrxMqeJ4y8ZwcroVo/pGZvPpGeieFOOqCVk2
         IkqZoXsHrzfkB/3xhSCusEy3QTLAvkitAsNcY/v/GyCNjr4pjbHQytanifqoIhPNLKmz
         MbSw==
X-Gm-Message-State: AOJu0Ywr+Lm1+gbX8D5RTm0Uo4ZJ2SY36xwnBl1BI32k/y5N0eqj7led
	og4DokANlhygkMX+j14Q3Q==
X-Google-Smtp-Source: AGHT+IGj21a13xz1WqdS/H6Nqa3rnnJqU98fDkeH4YoBfe8sZRN0UwRgSamoEKVV6rR3nWw7fbCw5w==
X-Received: by 2002:a92:c5cb:0:b0:35b:110f:8127 with SMTP id s11-20020a92c5cb000000b0035b110f8127mr3639999ilt.26.1700691159445;
        Wed, 22 Nov 2023 14:12:39 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y17-20020a056e02119100b0035b19b773b8sm159259ili.59.2023.11.22.14.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:12:38 -0800 (PST)
Received: (nullmailer pid 2753842 invoked by uid 1000);
	Wed, 22 Nov 2023 22:12:33 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Nov 2023 15:12:35 -0700
Subject: [PATCH v2 4/4] arm/arm64: dts: samsung: Always enable extra W=1
 warnings
MIME-Version: 1.0
Message-Id: <20231122-dtc-warnings-v2-4-bd4087325392@kernel.org>
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
In-Reply-To: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_141240_086420_4F2D3FFB 
X-CRM114-Status: GOOD (  10.30  )
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

Samsung platforms are clean of W=1 dtc warnings, so enable the warnings
by default. This way submitters don't have to remember to run a W=1
build of the .dts files and the grumpiness of the maintainers can be
reduced.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Use new variable name
---
 arch/arm/boot/dts/samsung/Makefile  | 3 +++
 arch/arm64/boot/dts/exynos/Makefile | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
index 7becf36656b1..fffc5c45d441 100644
--- a/arch/arm/boot/dts/samsung/Makefile
+++ b/arch/arm/boot/dts/samsung/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+KBUILD_EXTRA_WARN_DTC=1
+
 dtb-$(CONFIG_ARCH_EXYNOS3) += \
 	exynos3250-artik5-eval.dtb \
 	exynos3250-monk.dtb \
diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index 6e4ba69268e5..9cb188ef470d 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+KBUILD_EXTRA_WARN_DTC=1
+
 dtb-$(CONFIG_ARCH_EXYNOS) += \
 	exynos5433-tm2.dtb		\
 	exynos5433-tm2e.dtb		\

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
