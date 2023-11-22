Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879FEC61D9A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 03:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtOYGV07JIaU8VSmlDtbjQSlBQKQf4ydH1WW8Im0arc=; b=A2FqViOodC8Tx7
	onUXQcJVch8RclBeaIH/9DG/2ZnxX2ZxJ5FLa7sY9ml4w1A/JC9XmVUAZVjmWahLmsjJJJTvYE7w7
	daoZpWoL9X6py2P4PqWglHBC2XK3dLaherQRYYCvbyt6KmWWjwNc6Xg5HFbJ5XniU7Kob+TQ9Dw/N
	sTAbon9jop4y4MMaWEL3PaeECmiMo56Spu0ajKEY8m+zK0+EUnuIPd9HeFJWnhYPE3oYhsPZOq5MB
	RbfOa+8y436dkBhxa8Nl72AIOAjH+KjprDbGwsd18Q5xIFQHdutoTVLUMBXENwguoPHVT1s1TmWTq
	txXwQXc8Zr5LKvy2pFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dZU-000VlL-1A;
	Wed, 22 Nov 2023 03:06:36 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dZP-000Vik-0B
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 03:06:32 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6cbb71c3020so298312b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 19:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700622388; x=1701227188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Qgh5NSWFVqrYvvpg0jEH3io2ggLKyOiM/1ZRjzAMrY=;
        b=FP35+nks5v0gVTQTSM2zRyOm+1Ib0ItTpBmgNfuLdYI+hvbMtJ6xF5NAGFKpcrmZ58
         wWcvLwXf9Oz8P4PEGDPUdLxgrdzPyac3KNvmiYcjX7MCYtdQpDbUILBs3KjH1HHHtZWS
         2EJL+sP/MiovlthxtC6V8qtZChwFe1pr3SB3hRde3MG4kHt8rFVpmxXg8E5MlwXvLpF9
         SruEU7mo9ldKdooHyfsyco3hdiw3FE6+oRNgJNpjJfSYOFXss7hIGRC/W7qvAkHzcMg7
         UhmOMUcdrTDW3+SItAHDQ6c2b8sCY1QyjZqooJo1chhrTYKKFkbRFCwokW0Muw3Lam7X
         zAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700622388; x=1701227188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Qgh5NSWFVqrYvvpg0jEH3io2ggLKyOiM/1ZRjzAMrY=;
        b=EudTbtR0t7ksSNggJpsyVEyuTQx2X0T+sxE9oPiaWohH+phJJrIG656PZA0vUR9/wI
         JbCfLclmg0YK0Sjo+jv53E+ubEWSeyg48idw6wTTZHTgvybYp33ZnhlY5eGrgMkIFZ0V
         0qIlC9qpz7xNidpNr1psjRGCMosKTMu2qPfEFj9sj9+kbwzBkasvxzEa/+OYIKCsB3bi
         Wuoliqgx6VxV4w2SWbRhvrTprEOcrQVTXQa/qnGr5MttEJAEYc5kPuSqIyzSRLo7/vql
         dmFt9tDm4ETLVyb6lA+qd7BBjdrQartL2gddhv7RasDPpeWWxv1DGUFV6ghct7+hxCKc
         w1KQ==
X-Gm-Message-State: AOJu0YxQhC641rNLBNxc+BzV/arQFiMn0gbCbvCO5CWWDGwO+6KpbR34
	myNJ3QPSa1YF3ZEnGKYpWF0+fw==
X-Google-Smtp-Source: AGHT+IERIccwRaRQ+wlnx1zMjy0fsc3cDGpf4RjMA9LPr92p23dqVKDgXQEo3A0Wn14b3XN9NyJnpA==
X-Received: by 2002:a05:6a20:7da0:b0:17a:4871:63fd with SMTP id v32-20020a056a207da000b0017a487163fdmr1833586pzj.0.1700622388655;
        Tue, 21 Nov 2023 19:06:28 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s2-20020aa78282000000b006a77343b0ccsm8614917pfm.89.2023.11.21.19.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 19:06:28 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/3] riscv: Factor out riscv-march-y to a separate Makefile
Date: Tue, 21 Nov 2023 19:05:14 -0800
Message-ID: <20231122030621.3759313-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122030621.3759313-1-samuel.holland@sifive.com>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_190631_093667_3203A3E5 
X-CRM114-Status: GOOD (  13.07  )
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

Since it is not possible to incrementally add/remove extensions from the
compiler's ISA string by appending arguments, any code that wants to
modify the ISA string must recreate the whole thing. To support this,
factor out the logic for generating the -march argument so it can be
reused where needed.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Makefile     | 12 +-----------
 arch/riscv/Makefile.isa | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 11 deletions(-)
 create mode 100644 arch/riscv/Makefile.isa

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index a74be78678eb..c738eafe67a0 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -58,22 +58,12 @@ ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
 	KBUILD_LDFLAGS += --no-relax-gp
 endif
 
-# ISA string setting
-riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
-riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
-riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
-riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
-riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
-
 ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 KBUILD_CFLAGS += -Wa,-misa-spec=2.2
 KBUILD_AFLAGS += -Wa,-misa-spec=2.2
-else
-riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) := $(riscv-march-y)_zicsr_zifencei
 endif
 
-# Check if the toolchain supports Zihintpause extension
-riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
+include $(srctree)/arch/riscv/Makefile.isa
 
 # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
 # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
diff --git a/arch/riscv/Makefile.isa b/arch/riscv/Makefile.isa
new file mode 100644
index 000000000000..e10c77e26fe6
--- /dev/null
+++ b/arch/riscv/Makefile.isa
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# ISA string setting
+riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
+riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
+riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
+riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
+
+ifndef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
+riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) := $(riscv-march-y)_zicsr_zifencei
+endif
+
+# Check if the toolchain supports Zihintpause extension
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
