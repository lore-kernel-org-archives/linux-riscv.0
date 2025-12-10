Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8E1D3C929
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6CIS2VxjwNX6ZLXSY6T789f1k/JCyBHVw5Zp7enwEs=; b=nSE9wRm4gm0lFh
	ANP3PLquJ08bJfLIwcbrjK6+iR3KC7WzIhGkYAEyG3ZdfoUC8PaTA6KCjaXzwV7R+9UDdHtHZPxb1
	WE4/NbXICDIpuHvnlgtmtq3WMpUiAwD5XAP3GDzOvtND9PDeu4pa9Pz+4oflZMY/51BKWNahXjV2I
	B09z4mTlRXNiaX0MBReSs6009UZv6uI1MVsfvQRVvOE+5troPavsD1XAU0ZmQyAcpHdbTzDzNpb4a
	00n7Gf+FYHjQVfa/97u3A13RRpqC9NLScJ9KXaHBZeUZu31fal/+tjGt/7X7VUv0LbN6Rz0SW4tiN
	haWhRY35zszuIn4yV0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpP-0000000Fc5o-1wxC;
	Wed, 10 Dec 2025 16:14:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpM-0000000Fc41-1U18
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:14:10 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-298287a26c3so584065ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 08:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765383247; x=1765988047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IN+0Higah65/S0OE4unSZjOSg4pcnk5MJNS5zeLBR1I=;
        b=Vb/3+oTZK4yWTDhvbymN5DfShnPPFGoyBAhUJvcd2Cyy1G+W81ptMu4+sw7SdFsIOq
         XZIoPwcnikQClHVVdVWfb/mmO7ueHeEsFd4qlWcPbrBAraOJrmNTFr9q/AxT519cZYfC
         +drF0BT5x3UTgeYo9fMtTlNyRJI/PZJPyRQ+7lRzbLmEsOyQK8SPmpN07LGW/LjmXf7z
         oADI5Gl70vJGi8svzw1yik7CDlgUI5yc+Fc7axQAPtdNEHjBPtPhZ0bDK/BPMl/qnWG9
         6S5/F0hRRASdDmM7e6tIoqO0krIIkTkT1xem/gAznVEBAwQXgsMDI7Snrg0MKJAd+QL5
         Jatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383247; x=1765988047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IN+0Higah65/S0OE4unSZjOSg4pcnk5MJNS5zeLBR1I=;
        b=W0/fahiEmW4i21nU06b1AYRvhHaZy6eIdNZE2gbHLEsZN8/y7HtGLS9Rm2aOcjIfgg
         jR+9zx82t5gsh9p2tRMjx/95xEYM14zqaz/K2bQHD3mlxUjQYwJm2dF/aGzWp8qNDqx9
         spHqKtazqvEvPE6NkjFg9yO9gHQn/mGLFD5oZx4n7LQcrITSWyAfjuWsSfM2MA+A+BnJ
         FtEuSKddJtCAFd3VsfOQm3tTUPIoWrmyyeeIWOv5y2uEooywshjseoUMoxg6Oa3dlvS2
         lfrHwPvOonjw5CnXY7tjl/bJQFYt2kZfo3wNgeGa3qG8KSS56LGbEb5I4awHYU06USn5
         rm8w==
X-Gm-Message-State: AOJu0YyofNzrAaP5m6Knt2rCxXHZjcJtQpujJxqwCkcbDyG6pC0iU9vm
	VlMvNMhFXizc6ZuKgVefMlgcGhlGVq4kpK0BfVhhOH41arW1IDPUqPM0+FI4avjYsxIYAt9DyuZ
	QHwuf
X-Gm-Gg: ASbGncvnQxdQeXMoCVI25x5Hyi1xz5LXZ+9OyVGbFLBYNSqM/8dIy79lDhYqWtvPD+2
	XtgahkoUtgPRWej7GDAZszVCfl7sZFM5c/MFi+Zrc2kfc6ENyVrvRtRlV2DBzhCzDNAhQlo3f4K
	UhVYtkyqt3G3QS2x3T34sgOQI/zd/3FlM1t06L0rwCjcaHxJ8vXeUNrJS4RPUmg1WgS6lfF4ist
	m7SwwHJNOwm+PNqmF+GRV6QdUcJg2vicmiZwKNz3/+U9hTLySyRgXDCgMGreqklmozclwcSWG0m
	huj213OS7KZbLtHdWp/8qy9b6+MgyMV8q1UP+fM6IUUro9JKDmfSaTKkN6+CcrMyizMPWBEtyFA
	TjISACTrRX2pOdbefgxhufYXZjh54GojUSoi8G1onqdJ8UnKZg5I/lhArdxzQHzyHbcrkpUrNWq
	fK9WBdwpHzFqyOLeAx5ISNsGciELNxAtHZ4v3Zp96+KVqWkEuJHPDbEomBq+qBMZr8oB9RdggQV
	tABekL4iHOk
X-Google-Smtp-Source: AGHT+IHfK46v7u7eEqOcag0osBQ23eDRG13EMnU5VZ1bavuPhSTrBEmVb1TzlKvZ5dAAoeNgscf/Yg==
X-Received: by 2002:a05:7022:604:b0:11e:395:7dfc with SMTP id a92af1059eb24-11f296c8ba9mr1801860c88.28.1765383247383;
        Wed, 10 Dec 2025 08:14:07 -0800 (PST)
Received: from [127.0.1.1] (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm10364600c88.17.2025.12.10.08.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:14:07 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
X-Google-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Wed, 10 Dec 2025 08:13:44 -0800
Subject: [PATCH RFC 07/10] riscv: kconfig: Make vendor extensions tristate
MIME-Version: 1.0
Message-Id: <20251210-profiles-v1-7-315a6ff2ca5a@gmail.com>
References: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
In-Reply-To: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765383226; l=3908;
 i=thecharlesjenkins@gmail.com; s=20240124; h=from:subject:message-id;
 bh=oW54abbRysZHDMCyrE264IqhApYvMrvVoe7o3AdfEeo=;
 b=A2kGAVqVMr9wlv2Sb6EOoVmU3H2XBDyOEevuJaXq2h60+M/QGKVqHoFbj1fYiEmEFHrJZNmpb
 cNjKpYZs9+wCrNUE+zxNnJ2VpNB1Ny3yB+T8TQSEk7e59UdSxzTs6DL
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=eVndo3OHViAjwuqHqbJB4ZtzJzzvk/r6fUf84tZ3rw4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_081409_079030_9310E917 
X-CRM114-Status: GOOD (  11.37  )
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

Adjust the vendor extensions to use the same tristate selection as the
standard extensions. This will allow the vendor extensions to use the
same code paths as the standard extensions for discovery and
optimization.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/Kconfig.vendor                    | 25 ++++++++++++++++++++++---
 arch/riscv/kernel/vendor_extensions/Makefile | 22 +++++++++++++++-------
 drivers/perf/Kconfig                         |  2 +-
 3 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index 3c1f92e406c3..74155c5b642f 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -14,6 +14,20 @@ config RISCV_ISA_VENDOR_EXT_ANDES
 	  requested by hardware probing to be ignored.
 
 	  If you don't know what to do here, say Y.
+
+config RISCV_ISA_XANDESPMU
+	tristate "xandespmu extension support"
+	depends on NONPORTABLE || m
+	default m
+	help
+	  The Andes cores implement the PMU overflow extension very
+	  similar to the standard Sscofpmf and Smcntrpmf extension.
+
+	  Select "m" for boot-time detection for portability.
+
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+
+	  If you don't know what to do here, say m.
 endmenu
 
 menu "MIPS"
@@ -55,17 +69,22 @@ config RISCV_ISA_VENDOR_EXT_THEAD
 	  If you don't know what to do here, say Y.
 
 config RISCV_ISA_XTHEADVECTOR
-	bool "xtheadvector extension support"
+	tristate "xtheadvector extension support"
 	depends on RISCV_ISA_VENDOR_EXT_THEAD
 	depends on RISCV_ISA_V
 	depends on FPU
-	default y
+	depends on NONPORTABLE || m
+	default m
 	help
 	  Say N here if you want to disable all xtheadvector related procedures
 	  in the kernel. This will disable vector for any T-Head board that
 	  contains xtheadvector rather than the standard vector.
 
-	  If you don't know what to do here, say Y.
+	   Select "m" for boot-time detection for portability.
+
+	   Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+
+	   If you don't know what to do here, say m.
 endmenu
 
 endmenu
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index bf116c82b6bd..e5ef5219a050 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,9 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
-obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_MIPS)  	+= mips.o
-obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_MIPS)  	+= mips_hwprobe.o
-obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive.o
-obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive_hwprobe.o
-obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
-obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
+ifneq ($(filter y m,$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)),)
+obj-y	+= andes.o
+endif
+ifneq ($(filter y m,$(CONFIG_RISCV_ISA_VENDOR_EXT_MIPS)),)
+obj-y  	+= mips.o
+obj-y  	+= mips_hwprobe.o
+endif
+ifneq ($(filter y m,$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)),)
+obj-y	+= sifive.o
+obj-y	+= sifive_hwprobe.o
+endif
+ifneq ($(filter y m,$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)),)
+obj-y	+= thead.o
+obj-y	+= thead_hwprobe.o
+endif
diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 638321fc9800..dfbd02d28c3f 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -117,7 +117,7 @@ config STARFIVE_STARLINK_PMU
 
 config ANDES_CUSTOM_PMU
 	bool "Andes custom PMU support"
-	depends on ARCH_RENESAS && RISCV_ALTERNATIVE && RISCV_PMU_SBI
+	depends on ARCH_RENESAS && RISCV_ALTERNATIVE && RISCV_PMU_SBI && RISCV_ISA_XANDESPMU
 	default y
 	help
 	  The Andes cores implement the PMU overflow extension very

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
