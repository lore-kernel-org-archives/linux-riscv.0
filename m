Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1465AC25B75
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 01:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g91jZt8yERTqeM2BTva+TPAEl1G4QS73mnsji9WDO3g=; b=Q8RX8mHlmz2uXn
	C0sfVgWFJPHq9NPBOLM/sXmocDruP8JznltxaFDvogu7tF81nbn3NPzmCzhqYZhApoSGOz+CSB+tv
	wNrergl91762mPNVG83PD1DX0BXXnN1ovv6Tu+qzKDVasr91ZU7ZcTmFIwlup0xoAytYSXuPJaei/
	abhvGUSqPGx72Ahh+94Zf8bt4N2GND1pzheY4Z3WJ0XBO0U2nljliK+yQEByduMoJMk3nScGTbD7f
	xXB9nTJasJkdZ+BxF9FVBkIwOz2K4dHXuMLY+dX8cUexMCVoHmBxuM77G/3QjEyLpVHFUbKtdEGcC
	xXPwfB5ve/R0J1Pqn+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49rA-00000009H83-1Yud;
	Tue, 07 May 2024 01:43:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s49r1-00000009H1A-0RhZ
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 01:42:53 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ee42b97b32so9312355ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 May 2024 18:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715046166; x=1715650966; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1rtoP2W5LhxJ+J8dI0kYwFURphSK1JVHizOP2fywoc=;
        b=0zqR/RIzG5QvGcJgG2sWn2kBSFvoBwZiEKog8oLlHw5y9BuJ5UyLbJkWK3wA2zQ4aX
         /ig9VoK6TnI56KwYrDUQWm2i+SPK3i0jlLfzxDlg7Yd/nK+dHI4pkHkY9/d0ZZue/L2o
         bs4uKnGHVq7DuRXRxHe69De+HGxpJGKSPL0iaqmoPK+7vEWvEf3qh5Hf0HRvYoSH4aFG
         gorFansHBSmMRi59W+f8hekMNv0FoSZwW9AZBUPTEkd18ezaGA8V8bdVd53Nr6LPXov8
         qUG1SMM8MFAG9XjPo+uDh4dLqEw9zfi/Wdw3G6BoZLyy/qAyKGbMKnhgScoFgG42Ycz6
         cuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715046166; x=1715650966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1rtoP2W5LhxJ+J8dI0kYwFURphSK1JVHizOP2fywoc=;
        b=BNpR05c6OCwyoG8kpIMzkUVAHPUARQ376cbxhdzdcAJdHS+vKz1H9H7pfXYpmn50Qd
         IZjcCVyBvABCpf/ULAxj49zGvrZgnzjUU22WS7rLVOg9ZXc3bZwJJOF8wvOYpqGZ4z7b
         J74m/MiMRPiDCD3LxB20HH5ySI7gPmnAmsuEFM+ryQVCBP6I3RNbGPVzAyvyASNIB9Jm
         cbchmIu+L113gkoRMgcmFoKmrh5ZT6DWg3sKJSpNEVizfCylg1kLdJAL0yt5LGxlbXj/
         13CHIbHwwaDi8U7LBcs86z5sTerLCsAmto90ditvbWesvS3Kmg7TQdSinECAXeZK1VeQ
         L+QA==
X-Gm-Message-State: AOJu0YzpHPnS7x8fvWPlDQ/VPpxR8PPoJ3vmz8V372XZCr0vOnipqVaQ
	Zmi5r37iH1nBkABPl4J4r3OolsjhsUdpcBOKzgShYHMRdGwKJ4L57SWYn53F8Mo=
X-Google-Smtp-Source: AGHT+IEvpciP1sfAIndVjOWdRz7vLHFzpcSQrwQgsqgVau2eSxQs0m4E49rHQF2sOcXRyHJSXo6dDQ==
X-Received: by 2002:a17:90a:6fc7:b0:2aa:b57c:b178 with SMTP id e65-20020a17090a6fc700b002aab57cb178mr12019684pjk.34.1715046165806;
        Mon, 06 May 2024 18:42:45 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902dac800b001eb3f705ddasm8915311plx.255.2024.05.06.18.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:42:44 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 06 May 2024 18:40:45 -0700
Subject: [PATCH 4/8] riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_SVPBMT
 Kconfig option
MIME-Version: 1.0
Message-Id: <20240506-compile_kernel_with_extensions-v1-4-5c25c134c097@rivosinc.com>
References: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
In-Reply-To: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Song Liu <song@kernel.org>, 
 Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715046158; l=2246;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=a5uHrD6/CgdRcxiHblwyx5kXSDkE21WZp1cyzlXEWj4=;
 b=bnTpAsp3Zw5Pq5X+mO5DVW5pxHHKVy8FUw83Bk2bzxERC5XixN3igHc8XRzJzdAfFDd6F0ZpQ
 qURkHGNHFlyCgGYDPobEFSDYFLG17QZXDtd4VvfBloYF51Nv4e0BVtE
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_184251_183080_9C6EA0B0 
X-CRM114-Status: GOOD (  14.12  )
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

Svpbmt would not benefit from having PLATFORM_SUPPORTS_RISCV_ISA_SVPBMT
so just rename RISCV_ISA_SVPBMT to PLATFORM_MAY_SUPPORT_RISCV_ISA_SVPBMT
and move the definition to Kconfig.isa.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig     | 17 -----------------
 arch/riscv/Kconfig.isa | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 9c3a4347953b..22303a3ab59e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -484,23 +484,6 @@ config RISCV_ALTERNATIVE_EARLY
 	help
 	  Allows early patching of the kernel for special errata
 
-config RISCV_ISA_SVPBMT
-	bool "Svpbmt extension support for supervisor mode page-based memory types"
-	depends on 64BIT && MMU
-	depends on RISCV_ALTERNATIVE
-	default y
-	help
-	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
-	   page-based memory types) in the kernel when it is detected at boot.
-
-	   The memory type for a page contains a combination of attributes
-	   that indicate the cacheability, idempotency, and ordering
-	   properties for access to that page.
-
-	   The Svpbmt extension is only available on 64-bit cpus.
-
-	   If you don't know what to do here, say Y.
-
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Kconfig.isa b/arch/riscv/Kconfig.isa
index 37585bcd763e..50e217dc5719 100644
--- a/arch/riscv/Kconfig.isa
+++ b/arch/riscv/Kconfig.isa
@@ -168,3 +168,20 @@ config PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT
 	  not support Svnapot.
 
 endchoice
+
+config RISCV_ISA_SVPBMT
+	bool "Svpbmt extension support for supervisor mode page-based memory types"
+	depends on 64BIT && MMU
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
+	   page-based memory types) in the kernel when it is detected at boot.
+
+	   The memory type for a page contains a combination of attributes
+	   that indicate the cacheability, idempotency, and ordering
+	   properties for access to that page.
+
+	   The Svpbmt extension is only available on 64-bit cpus.
+
+	   If you don't know what to do here, say Y.

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
