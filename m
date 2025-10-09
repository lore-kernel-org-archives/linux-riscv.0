Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73F6CAC5BB
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WublC4BQnFoPfFEUArib4o+KfDufDo4JpqPZObWelZk=; b=lotn17bOapii8u
	hg02p23C0VcdmYzOHr3PL5QaajZg+POdJjvaX9zmB7TGA9tIVpE9xG4xhAjYGVlhPFkOiJwLvsYa5
	KSo0s5415ywQvkmQ7w2616jRH89k1Nh8sUfspbghK/IMuqeBQWtDG2xVOXtUbsbGfvravk7bZm5Hw
	VRD4b/8fHf/e5z0DwfUXJtivXiixZZzF/ALsxAUYe8SlffN1qP7Ru7he9OI3safFEXmc3GVHsMRGX
	2JQx5A9jmtRYQLfpQgcsInfNLU+EcXCiTaymZ8g+FRp5J/OC4FyMmkAZQ0CFs/9JJCgQBKFUnyy2W
	kWdP9c/5SJNdN0qe7bQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fw5-00000004zc6-3KIv;
	Thu, 09 Oct 2025 01:59:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fw4-00000004zaE-0zhs
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 Oct 2025 01:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=n103/Zzy6dOfBxJ4uy1kIK0G1FNuk9TvEmc6PK6Kghg=; b=lfWZp0/rlT89y4PXB0NAB7hx+O
	WCgc3MuKhGBnlIJnHKb+5a0Xui2sBKc96a3/9HF0UIIKFfyk9SUaWJWuqPqTPIy+0GExNswkKXdgS
	hgMZcFjDJx+VmIHMmvoMUN6hnAA+Kgkd3vNEjdpTJu8hkbW8AFffGGIvPhvjAxYZySuvCa3Rw9blx
	a+mIjdqRPlPkINUBioGP3b/OY0F3u+t3e9Jr7UmIVNPtJ1KIYDzlZn1psbMNhplcXNPmP+iD9gx9t
	xXT+GDYIYMVj20/YmCZuEb3/ZjliSNAxsNp41a88rYklKB8ed5depvh0ikXIRQCucBhipDv5lFLkI
	IYTPgC3A==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvs-000000014Fz-3NWw
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:59:13 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b5526b7c54eso236099a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975142; x=1760579942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n103/Zzy6dOfBxJ4uy1kIK0G1FNuk9TvEmc6PK6Kghg=;
        b=PA5rgm0YR9k2HW9i++++m00eW9Ho1rSzwLBmxDPJsdInEeJdKRIgE04gXXtddmTG4q
         RiTbi5EJXYiChG+lEUv5+CxFV0EyCz7whUlZ9XPZQgt58ALPqL9fg9QGoA7DyFfhW5mj
         BKiTyF675PUpCYwbT6nuL8T+NkTquV9sJfJhrO10F1v3OkAt4E0PW83iFV7eLGZUAYEJ
         fWc6wpi850HW6Q2Idu0cNbAd/TFm2t0utWCztO9TYzXgmMOu/OTLXH3Rok93n4eWSy07
         IGxPcjOt6D4Yhe9qzVNb7pKd9GmHA7ukVBp9RaUuMVR115KEGIXjGOuX0QJVAQ8/gUBz
         S7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975142; x=1760579942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n103/Zzy6dOfBxJ4uy1kIK0G1FNuk9TvEmc6PK6Kghg=;
        b=bOio3t2bFAEBmIRz5X7XuzBjR1Dqu8qYFPOV8i1LLgjbYifCOpbux7bMvDG+6piJYu
         laYCd6jMQDPXM6RQfd40O6lmWSOODPrzwLXOCMOa+xuUVNAkJQhUDneI5oR4HhkZrmaz
         KE13r4IB2MnSTihccM7eVW5sxujW6S67ZkSn+pOALCYsYSNEDjiuXpi2l4hjOEuIOk8g
         dRDfHKsmrs8l8bAPzGCHRHeCw6gtItJaHYMo3ygjUoCM98zePyUSnyitbZcBzj8/4Ec2
         Xnxn+/099Na9I2v10MSp7myx0F+q1fk8o8roZIYsy+19DxMjZdV+uusdqj6RrDmVnWRU
         ALIg==
X-Forwarded-Encrypted: i=1; AJvYcCV00Ri/cp5267EsvBMKm6iAU1x23jjbLjTV30hY8ZXZb2WqX2sXHUMUw3q59KqzvToTc40ZErGuHj4tQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo3yhAz+46r2Cy1uWsoNh/VYiZ2lqhXzBZBW7Mza9g387h0zPQ
	GfN+30uU3Odmz/HzacxyKymRC9AzrhJK1ThNIY/DQk07czR7/Whb2hNMyAWb5y1F0ek=
X-Gm-Gg: ASbGnctPQaVMd7C/ZNaybZfgxQpGWXjnMC2QjXLvqXndco50Z20A33oy9riCFTDg2Cy
	TWPOMq3X2Pbr5Lh9awHDWUOq89DFa77KSK6ZwsB1oPurFqdG3tI3KJWm6MdrmIAzG8Q6Amk0x0+
	/C67dwI+tOYqVYr8LU5tHmQEj+F24qbVXjKZf9yGS8rEL5Fx/oXkQMm4wEg/98qc71CqA5Eb+ig
	pIsRIhCkCSNpMN7A2e/qQOTqyChcohKx9cdS4QZeWC7Sygz7OjAiyQNJI3Qdltk6ywF9X95xVo0
	F3BV3VNzOVVtqYKI8hQD+noSexCV+MLQk4NbvUjbU5VXwt+M1nglxX8otggoNdK5bzHYQH+hXH2
	wlLx6KAuoIMk1i5kRLobxaVrDbzbS+aqBMN6YzyD5hutrX/tyEHFyDqUlSDfAItFpCAsQ
X-Google-Smtp-Source: AGHT+IFWJLoMlJoGXelrIQt9ocniJALkCftXGohMVp8CEHqCZlMQayonVPQ6X5ZOtEekzhDbe0VYyw==
X-Received: by 2002:a17:903:1a03:b0:269:8059:83ab with SMTP id d9443c01a7336-290272e1ccamr67703105ad.51.1759975141970;
        Wed, 08 Oct 2025 18:59:01 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:59:01 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 17/18] riscv: dts: starfive: jh7100: Use physical memory ranges for DMA
Date: Wed,  8 Oct 2025 18:57:53 -0700
Message-ID: <20251009015839.3460231-18-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_025907_089869_41135B94 
X-CRM114-Status: GOOD (  15.21  )
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

JH7100 provides a physical memory region which is a noncached alias of
normal cacheable DRAM. Now that Linux can apply PMAs by selecting
between aliases of a physical memory region, any page of DRAM can be
marked as noncached for use with DMA, and the preallocated DMA pool is
no longer needed. This allows portable kernels to boot on JH7100 boards.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Move the JH7100 DT changes from jh7100-common.dtsi to jh7100.dtsi
 - Keep RISCV_DMA_NONCOHERENT and RISCV_NONSTANDARD_CACHE_OPS selected

 arch/riscv/Kconfig.errata                     | 19 ---------------
 arch/riscv/Kconfig.socs                       |  2 ++
 .../boot/dts/starfive/jh7100-common.dtsi      | 24 -------------------
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  4 ++++
 4 files changed, 6 insertions(+), 43 deletions(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index e318119d570de..62700631a5c5d 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -53,25 +53,6 @@ config ERRATA_SIFIVE_CIP_1200
 
 	  If you don't know what to do here, say "Y".
 
-config ERRATA_STARFIVE_JH7100
-	bool "StarFive JH7100 support"
-	depends on ARCH_STARFIVE
-	depends on !DMA_DIRECT_REMAP
-	depends on NONPORTABLE
-	select DMA_GLOBAL_POOL
-	select RISCV_DMA_NONCOHERENT
-	select RISCV_NONSTANDARD_CACHE_OPS
-	select SIFIVE_CCACHE
-	default n
-	help
-	  The StarFive JH7100 was a test chip for the JH7110 and has
-	  caches that are non-coherent with respect to peripheral DMAs.
-	  It was designed before the Zicbom extension so needs non-standard
-	  cache operations through the SiFive cache controller.
-
-	  Say "Y" if you want to support the BeagleV Starlight and/or
-	  StarFive VisionFive V1 boards.
-
 config ERRATA_THEAD
 	bool "T-HEAD errata"
 	depends on RISCV_ALTERNATIVE
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 848e7149e4435..a8950206fb750 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -50,6 +50,8 @@ config SOC_STARFIVE
 	bool "StarFive SoCs"
 	select PINCTRL
 	select RESET_CONTROLLER
+	select RISCV_DMA_NONCOHERENT
+	select RISCV_NONSTANDARD_CACHE_OPS
 	select ARM_AMBA
 	help
 	  This enables support for StarFive SoC platform hardware.
diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
index ae1a6aeb0aeaa..47d0cf55bfc02 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
@@ -42,30 +42,6 @@ led-ack {
 		};
 	};
 
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		dma-reserved@fa000000 {
-			reg = <0x0 0xfa000000 0x0 0x1000000>;
-			no-map;
-		};
-
-		linux,dma@107a000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x10 0x7a000000 0x0 0x1000000>;
-			no-map;
-			linux,dma-default;
-		};
-	};
-
-	soc {
-		dma-ranges = <0x00 0x80000000 0x00 0x80000000 0x00 0x7a000000>,
-			     <0x00 0xfa000000 0x10 0x7a000000 0x00 0x01000000>,
-			     <0x00 0xfb000000 0x00 0xfb000000 0x07 0x85000000>;
-	};
-
 	wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 7de0732b8eabe..34ff65d65ac7e 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -7,11 +7,15 @@
 /dts-v1/;
 #include <dt-bindings/clock/starfive-jh7100.h>
 #include <dt-bindings/reset/starfive-jh7100.h>
+#include <dt-bindings/riscv/physical-memory.h>
 
 / {
 	compatible = "starfive,jh7100";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	riscv,physical-memory-regions =
+		<0x00 0x80000000 0x08 0x00000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY) 0x0>,
+		<0x10 0x00000000 0x08 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY | PMR_ALIAS(1)) 0x0>;
 
 	cpus: cpus {
 		#address-cells = <1>;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
