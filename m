Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5BDCD4F37
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NepQpvOH+4xt0gNA8ogdHRAvI2G9jzgzcYvQGreCpOI=; b=YWp86yU4WSYYvy
	4VNtoLmO/d6xHfteYSsnCqHQG8YetezVcLPsF07aoVNjd8kJHvvzYHkSE+ftKf0T5Touo2vFggknI
	2Kd0Z5IJ6BmEOp1k/OLE5/+3pCB9ciFBn/HdI1np31KMzjOT/dTAZgs3mkdcGDWqKfYq+OazSw1NJ
	k/x0FKFAcB6zGdpTx/EoetMO8tYfNyYkjz4x6gj8rzC0bGceI0ai5XFspbYlrSIzY7kkaDrpNdaam
	RwvMeNv5Un9L3xsK6z6FbDgtrhzwvsmxSONhavu/klzYoF/PkUH//Fg6URQFXFN55wMAGlnJokcmD
	tTOD7378eKsQA0Si3GgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMR2-00000009kFO-1uuK;
	Thu, 13 Nov 2025 01:47:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQz-00000009k7W-3zYU
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Nov 2025 01:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wIyypInid2MwkGhGpFAF1f6X6i4zsYo4yuxmmc6uQIY=; b=a4u5gYt6yb181b54kddEuGXP81
	XQLMkopaE+pXMowUNzClFvSlI/mUbntTj+/4K+qei2UA7sYdayEyRouVQh/qmY6wTRW329Aa2yt1u
	xg+YxzKwE2Rb9xppEjifdMcClsGaHp47qGpvnXl7lGVX3N5vIckodMrWSH7BljnerIpfHHdr+h54J
	C2/0FyNFrOAvc0/yX68UKmV4zwHxJ+qxoG4wxKDE/I4fM7O18qYwJ3FobBJw+MmclXZ/j7cE3R8cF
	cH84RsPRjYD/S0NdlwOzXvC5NpsdjNe7BEzMsFqqFLM0QTx35LsmJ+jCLO3RUfw48a6sSv2gWQ2nZ
	VK4m+7qg==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQv-00000006mJ5-3MHN
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-297e264528aso2472195ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998451; x=1763603251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIyypInid2MwkGhGpFAF1f6X6i4zsYo4yuxmmc6uQIY=;
        b=DakX1fYCOEOjoa+9cCp2UmHX48A4o5aZNJbhVgKYZpOZY6hujDn1JJRVIunAjWmmIj
         zmJ4hRqOi57A6vAURSH1Rc5gQDiANBfVqfjzFOLN/R3jFAVcvCJ3BoBIKbpZLCoGWyop
         gZy+i6ZBks0MiFoVptujC9a1Tcabviy629DJXbQvXFFM/PjOHF4qipSMECaRaB7JlARv
         l4d5bp+kEkXVnTzro8bF392EVgGDu5eXnfJC8rsc/R3z+vKHOF8K8EmFmOAT53HO+TVB
         ORMgnRcxE7JphU15Sepftk9HKPAB7JnKsX33iVOOR2fsWkv2k/WzXtxtpOSEqnfoxOTk
         yElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998451; x=1763603251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wIyypInid2MwkGhGpFAF1f6X6i4zsYo4yuxmmc6uQIY=;
        b=YNqjj7bLGSo3EdQLIDKEjVuP7+TOX8KdQKiJez8CdN4O9bGQZ05Q5+3jjRAx/yb53F
         Z/sGahaVFaE2IHkFM3Q5oNT55rgQrxeE2FME4uVvFzy2RzSbJ+2eHLvstX9cnEbl/7WN
         1c5z/ctj4kZ6sqS7NF5/8oxqm6H+YcZlkXamnnXPSpKcLOeslA3vA0CtFiwrRBvu4Y4U
         DjKT5Srz5Q/Gsryfr8M2sJQ/pRtG/+Os9fgbQdMGb6CPUvhqYhIBKt21bHGLVPTUvETb
         samI3HgZxugetY+F5yB/4iZR810Dy3zCZa8GULS8p4zmeN/Ba0wPSlSQzeRaBNzzOt1D
         jSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwyqhoBzEJvVcjVX/FBScABWn3J+Fk4NdsOBgw9el3SdSwBfoWGTR7bMoPj/XpeDN4xRRQEk/CjtG4Ww==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDYrWTIF5Mny7pxy0HPw4sNSTT84e8lPSDICvGTt6Gbr42mTgs
	/oJcykmeDFrgiD9RffUDF66dfdycpgWQpPtiQu4HZxh8xhKuE4u1mz1GYcjvPuIHeTg=
X-Gm-Gg: ASbGncsPxPf8QZiWtZT0ereE8gne16PNh2MuVLvoHN2nxTaDpmMtXsc2eaRQCxk3Ygg
	oP1lNPqhhlMdEpTBx/vpp8SlrLBualXr1TfdzhlIJIfzQilNqEH+YsOjev+C0Uz+oHOX537O4xW
	/MBfQbtEONbbVYanx6/77weSF3gyqKUmv93JBM3EjElYo9yrD7Idw/JaDz+1MeLkRRk+/gG1YfJ
	3IW1XtW0dh0m+Y0MpZNMqUDzfYbhG8UIqZCf4JCtnb7uVVlykeD4waqdubi8ONLD2BxcWWi/D8F
	u7sCC5cL0AVTr1wIyv0FD4rsqEvr9ZjLIsAXTgO+JePLxPPdcizX7rkHHcGvIFCqzfYXDsCnqj5
	QiYnC4W0khXpaC1NUCqAmkpYZACGPhuX0QLbuN24+JBoJNKKCTWnUSySsMsTZRPXWw5QAq9fLXh
	JhMZ2rGNtuIjPfRRiWOBpl3w==
X-Google-Smtp-Source: AGHT+IGhzNzxLSTgH/bqs1xeC15DK1E1CUXXoyAWh/vc5uUnq6cTBbEqNw4BT6XDJfCz+C9XpqJ0wg==
X-Received: by 2002:a17:902:ec84:b0:268:cc5:5e4e with SMTP id d9443c01a7336-2984ed30d0dmr70448205ad.1.1762998450749;
        Wed, 12 Nov 2025 17:47:30 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:30 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: devicetree@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 21/22] riscv: dts: starfive: jh7100: Use physical memory ranges for DMA
Date: Wed, 12 Nov 2025 17:45:34 -0800
Message-ID: <20251113014656.2605447-22-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_014734_041824_4B27F42C 
X-CRM114-Status: GOOD (  14.23  )
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

Changes in v3:
 - Fix the entry number of the paired region in the DT
 - Keep the ERRATA_STARFIVE_JH7100 option but update its description

Changes in v2:
 - Move the JH7100 DT changes from jh7100-common.dtsi to jh7100.dtsi
 - Keep RISCV_DMA_NONCOHERENT and RISCV_NONSTANDARD_CACHE_OPS selected

 arch/riscv/Kconfig.errata                     |  9 +++----
 arch/riscv/Kconfig.socs                       |  2 ++
 .../boot/dts/starfive/jh7100-common.dtsi      | 24 -------------------
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  4 ++++
 4 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 46a353a266e5..be5afec66eaa 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -77,13 +77,11 @@ config ERRATA_SIFIVE_CIP_1200
 	  If you don't know what to do here, say "Y".
 
 config ERRATA_STARFIVE_JH7100
-	bool "StarFive JH7100 support"
+	bool "StarFive JH7100 support for old devicetrees"
 	depends on ARCH_STARFIVE
 	depends on !DMA_DIRECT_REMAP
 	depends on NONPORTABLE
 	select DMA_GLOBAL_POOL
-	select RISCV_DMA_NONCOHERENT
-	select RISCV_NONSTANDARD_CACHE_OPS
 	select SIFIVE_CCACHE
 	default n
 	help
@@ -93,7 +91,10 @@ config ERRATA_STARFIVE_JH7100
 	  cache operations through the SiFive cache controller.
 
 	  Say "Y" if you want to support the BeagleV Starlight and/or
-	  StarFive VisionFive V1 boards.
+	  StarFive VisionFive V1 boards with older devicetrees that reserve
+	  memory for DMA using a "shared-dma-pool". If your devicetree has
+	  the "riscv,physical-memory-regions" property, you should instead
+	  enable RISCV_ISA_XLINUXMEMALIAS and use a portable kernel.
 
 config ERRATA_THEAD
 	bool "T-HEAD errata"
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 848e7149e443..a8950206fb75 100644
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
index ae1a6aeb0aea..47d0cf55bfc0 100644
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
index 7de0732b8eab..c7d7ec9ed8c9 100644
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
+		<0x10 0x00000000 0x08 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY | PMR_ALIAS(0)) 0x0>;
 
 	cpus: cpus {
 		#address-cells = <1>;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
