Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064EBC25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 01:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8raYk5GLIU/oPkpOOMGGJ9K97V7hTWNr7aKk5eEPzfM=; b=qeTCzuZZVf/XgD
	3bLlvQVSL3pwMEkJVvq+aBZsxWRG6pcOPqFYQNjrm8ou9rhzVbE9zMGyAtA40T5tiEBWBdGCH++5z
	AsNQn8wZofFDeIZapE/1nlcu3ayET0+MBppB+yBY1oG5klCUV5okoABJ9Pw0cFIuFeXXAR5tlpCHA
	jBoOjbw4/5rzkFmieRAfmm2aFYIbRKFWeUNIlGaPc4MdUguAMUJPhsWDe5xEhK5RpLkKrPJwFYwSw
	VL9usfUpy6Lybti/9VrmCPIGoZAdOJNK5vy2qgHoD3g3ig6fflJ6WMUjOD8F089jBzZi44fXXvLHx
	0Odo7M+14Ap6984Dk1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEo-0000000Df2m-2x2G;
	Wed, 08 May 2024 01:36:54 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4WEk-0000000DeyC-2vkS
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 01:36:52 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f28bb6d747so2756280b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 18:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715132207; x=1715737007; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFSJQnmxYmfjoFDImtU4VL6iWxbfob1tPsjHMgxh4E4=;
        b=efRJos3A0Mj3RQ3DqpaX9+9CRy8NIprmCxfVXI9cIS0RzdFYNMyzG7FQftQTIVGTtw
         iEa1PvjZGGZEM/yYIiX8OPDYjwX8lofeKt214P/JBsvAX8QsOPUxilNKjEfHYTnoiaXD
         jM+HRHGafGB6eG/ySonK0vjiJWKq045WVtLTby9SnQJbt+sT6lXaCDspUPFbxbtVnSD3
         DJGMTIwkXXd67Tn0UiNkQGhtB5kDIDw31pYGQmwqfSl6mLVAIXqpdhR5jbTFn5w7BzD4
         yNUO1Vwgs476oD+NF1xY65ZFhuds+ZA7Mf5KaGYbXYIZdSX2hb9KV8fN1kuRICWGCPPy
         I2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715132207; x=1715737007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFSJQnmxYmfjoFDImtU4VL6iWxbfob1tPsjHMgxh4E4=;
        b=amHEPMglQFyzQQX8USF0cNNe705NlYL8PLCT8mPSOzGwJKfP5xxVKjD8KUw1VLvLvb
         mRliza++QVpub3HWY9KEvr69Fz94tFesZlYO6nso9CRyHfJLuPMamgbr6Oi8kUu0zaSS
         EWJUK0N4QW8Pf3X2A1OWFy3uZ9skDCoG9sW+ySIpF02ZqV+LuhCmVCcuycfAu4vVul0U
         YN3+chqn3t57XvGbiFF2E2p/p+GR12+bjYo6khXtvU2u/ZIwvSCfzzFZapnYHCt1T/RG
         TrtUX1DH6K1TWwKXPB9a7TqAt8Mep6go8yqGCztzNbaXT8T6emRIG6MB2XWs0KAg/13n
         mXXQ==
X-Gm-Message-State: AOJu0YxL8cgTvdAhfi3uHdXeabNMi88IVHbjDDaxDDZMhXvoFj00a/Bi
	pyFySN7gBCcW8FuMZUJfWp4Qcsl/pogF4S6t2pvu1fK+A2ClGoeybVMk2duvYbE=
X-Google-Smtp-Source: AGHT+IGyPdvmy6aV3B3L4umYWWDDY8xIoU7bUJV2TUBvLWRK8ohQMMF3SW0DKxfoVvgynUcDHsYrOA==
X-Received: by 2002:a05:6a21:2715:b0:1a9:5b1e:4f06 with SMTP id adf61e73a8af0-1afc8e045e8mr1232295637.52.1715132207095;
        Tue, 07 May 2024 18:36:47 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a265sm171994a91.10.2024.05.07.18.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 18:36:46 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 07 May 2024 18:36:30 -0700
Subject: [PATCH v2 4/8] riscv: Move RISCV_ISA_SVPBMT to Kconfig.isa
MIME-Version: 1.0
Message-Id: <20240507-compile_kernel_with_extensions-v2-4-722c21c328c6@rivosinc.com>
References: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
In-Reply-To: <20240507-compile_kernel_with_extensions-v2-0-722c21c328c6@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Song Liu <song@kernel.org>, 
 Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715132198; l=2196;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=hN6gBReRWF4tyaALzLlv0FO1iXf71FwbEQWuRR1cn6U=;
 b=rwmUivRGvDcoS+kvi09gdGx7PVj/grlp+Tad0aawkK1yi6IcKtZer2CtyNjel3SZbguaXYzst
 2GPHvUxb7LyAOvNrFFBjRTs73lBl91FO/UMmx/qaiWyoJ8A6E4MRt+T
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_183650_808501_EA859B8F 
X-CRM114-Status: GOOD (  14.51  )
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
so just move the definition of RISCV_ISA_SVPBMT to Kconfig.isa.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig     | 17 -----------------
 arch/riscv/Kconfig.isa | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3c1960e8cd7c..47a1d28bbb64 100644
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
