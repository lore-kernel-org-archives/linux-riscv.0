Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1677CC7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMbBo8o2WXGJm+TQNfzORi7NsUXmyYGr3OgWLmXpTSo=; b=4vEuk4128N4cjg
	IhF+ZXPNLs4niWgz5NpMcbJPDXMaFMiNTjR6ofJHq8v+BsNj+Xz2c20LK8P2ZE1o39/Efnthbwp7F
	l2tabUL4O0bGcT1h4IUGaxytPo82hsNYFyFg+cAz0SD5ITgnYn6gNm3PzEl2F2L+bH33ZBJbRfcBC
	J+Pn75iKIsVmnvFf8QhUc4Ii3wTCl8Irglh390w+hrJUrMA7zjxV2pTzgXVLuAdjBSISpIsgPRVYc
	DRpmiw7ESKyeKTB0w+f8lKF+rGTk1vWlgbuV7jM3spMdO1rDrvHopo1XHkqySMXMMTN2vRZQocRbk
	0+3Y8c9sq+Sytfps/wsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CLU-00G0MH-0c;
	Mon, 05 Jun 2023 15:42:12 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CLQ-00G0Hn-1G
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:42:10 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-65131e85be4so4878233b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979726; x=1688571726;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3oGenUq2RmcAiga8rk96QsXqWKk89kTrI2+LG1B6lNo=;
        b=hQZT1Syqd3WtW8aZx2yL/w89kYn6X8sgyQjCm8QWqksNUZOcoovtC3D3JKxG7IrK70
         DacMox7pscej6plzIkxm9QISF6CSw5o8B2RYzAnKgNBhFIim/pAoZO8+kz1jfvDA7t+2
         ToQdoWsTEdq+EFz6n5LTWOQPGGw266O1UreTXy/f8aC3wvaBXq4qFXRrGcXZqQif615L
         MqkMD+a23PbI87CKTXHgEOzqNfq56zWReyp/iXOhjOizh7jXOlpi+ph3+aIVoH6ft+vz
         vHAfHvXIO9R3XIxFnGR3cU/u2qPOmkdie7B218Ah+q7l/PSSML/BTKH6NpWTk4DO8tm0
         Quaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979726; x=1688571726;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3oGenUq2RmcAiga8rk96QsXqWKk89kTrI2+LG1B6lNo=;
        b=ksM3gX4w/loRXultGoVJi9a/6PdnF4u6mGLwFD8WDbHTr8jyxMcU5cwJ0G1fO9Yidi
         /OOeehBdyuLwyF9GZe21OeTsEgsrm3FOkE21UxlGsqb4or5EXG/bUHRIbIDEIIsEixBo
         DeNytmsL68JXJkY8v4Ix0u3vfhHgTLM13W4SPmc/eVsmkp63+Ptn1z/WztmR7sJqsMyC
         CZEjDEt4XZdMQdtHa2iL8JXmFh7jmI3gt64z6z40IYIIJ7GP6gZtf5v1DUtJ98Z23MI/
         sbgJiw6LPHZNqcFZ+Dp8qDatNdwFe2Yfa3qi5ld/6eurPAN+jmoYUf0IE6Pd2LaIZoJE
         JqSw==
X-Gm-Message-State: AC+VfDxjm/Sitg0gakQWDN4mZaTkXHJcQdZLCuuEyCvzFPMPztnNOCi+
	H2H2w/63wy6foRrRyvbmH3nVXWB79pjN4mC34HLM+A5vpBg3HyaNkoomMvGEoNh5xrw0/oKt3u0
	gXAo7cDZyYz0S4mIXXk7bQxAezjybSc7ja5lW7dUVNiZK0IKHgDrRnIseMGO7EOHd6o51cHXGzS
	+qZqHsB8FWzpxHSsY=
X-Google-Smtp-Source: ACHHUZ6/3qltkidsVKYwQs6O3CFhkrECdKQdl6va7midlwG7wplu8QV7xOfVwrVED1s5/OkG1YraQA==
X-Received: by 2002:a17:902:ea04:b0:1a9:b8c3:c2c2 with SMTP id s4-20020a170902ea0400b001a9b8c3c2c2mr9570619plg.37.1685979725981;
        Mon, 05 Jun 2023 08:42:05 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:42:05 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next v21 24/27] riscv: Enable Vector code to be built
Date: Mon,  5 Jun 2023 11:07:21 +0000
Message-Id: <20230605110724.21391-25-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084208_475254_43608C47 
X-CRM114-Status: GOOD (  11.26  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

This patch adds configs for building Vector code. First it detects the
reqired toolchain support for building the code. Then it provides an
option setting whether Vector is implicitly enabled to userspace.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changelog v20:
 - s/RISCV_V_DISABLE/RISCV_ISA_V_DEFAULT_ENABLE/ for better
   understanding (Conor)
 - Update commit message (Conor)
Changelog V19:
 - Add RISCV_V_DISABLE to set compile-time default.
---
 arch/riscv/Kconfig  | 31 +++++++++++++++++++++++++++++++
 arch/riscv/Makefile |  6 +++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1019b519d590..f3ba0a8b085e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -466,6 +466,37 @@ config RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_V
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
+	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
+	depends on AS_HAS_OPTION_ARCH
+
+config RISCV_ISA_V
+	bool "VECTOR extension support"
+	depends on TOOLCHAIN_HAS_V
+	depends on FPU
+	select DYNAMIC_SIGFRAME
+	default y
+	help
+	  Say N here if you want to disable all vector related procedure
+	  in the kernel.
+
+	  If you don't know what to do here, say Y.
+
+config RISCV_ISA_V_DEFAULT_ENABLE
+	bool "Enable userspace Vector by default"
+	depends on RISCV_ISA_V
+	default y
+	help
+	  Say Y here if you want to enable Vector in userspace by default.
+	  Otherwise, userspace has to make explicit prctl() call to enable
+	  Vector, or enable it via the sysctl interface.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0fb256bf8270..6ec6d52a4180 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -60,6 +60,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
 
 ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 KBUILD_CFLAGS += -Wa,-misa-spec=2.2
@@ -71,7 +72,10 @@ endif
 # Check if the toolchain supports Zihintpause extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 
-KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
+# Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
+# matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
+KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
+
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
 KBUILD_CFLAGS += -mno-save-restore
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
