Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E70C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KyxE7Oopv7jdp3aCgZoOj7n5J0/fRo5l8chvSua7cUc=; b=cg3qBhQW6L46mp
	ttlXHiY7ZkTxeD8MuDQE6j4cLjkAzByxBXouibYStVoZJgi+OyIenwhUImK3rABPgccxIoVzzhrN/
	2hK6EnZ4uLihYIbFzOpBwt7/yW1Ym3jVjJh2throdO7wx+MOpgOYiIOfsqEOi/XbL6S4JxANbn71q
	aRwHQ0s6879DCASc3ZNkZMXjnV4O1JiOWp2ujJn0miN3Nj2YW958hKqBs1XZUxctCAyDiRFJdmOaa
	x5fgZ+xhyPBLMwIY20LvhpeAlFSD5ZmeHF0GHvmBRtcnn/yulIc6dzCrpxaRZKPen61WzjxPKwIFw
	uGHmdWtu2R4UJD9f2Tpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKey-002uhB-1P;
	Tue, 09 May 2023 10:33:32 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKev-002uaE-10
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:33:30 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64115e652eeso41451502b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628408; x=1686220408;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tnXXiygjZrZ2nYQZcu1XSE2OAbXCB6jkIWrGS8Lz/3Q=;
        b=IR3iXP3SDmxJ/rPrizGRos8/ObgSjWdTQdkW3fRxoUTzbLKnjqc6Oxcb4DF3Izln/H
         8AZCqVbmImpoC/l8GrCzcLTxwa9Yj0xuj7D7Mz92ec7BjELInCJJy4gTVvUyxRezuR9M
         zECoLoEU7mNOq/xHSu1cs2GlytbDOJ99vYIq6fKDvMMPITHlthy/2Etb1HKrvQbZKfH7
         zNqNIAuNfFLRuuOdHiRmq5X7sKkq7aQVhUSPztHNLZzAyXBFv/pLq5Ti0KZzSlajA2x8
         +a1PoFgQDzIMM2X1ZE5rNn3sm4MsTMxGs4F+tCatjRS79wZfXqrM4xL0Q3Havcq/b5nO
         oPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628408; x=1686220408;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnXXiygjZrZ2nYQZcu1XSE2OAbXCB6jkIWrGS8Lz/3Q=;
        b=CdIg9iedAN9p3isps01QBvFIiF6R9Ny6mIR/w3rjX0jKiTVmS4obtYv5MZQJ0FvXrt
         cfTmvgdo8pgxDKNDWVvUBtHtfpkebXHfhfBbosf4nfgZUe6QGP+WjwL9gPZ25Zrsc6LL
         5RIvJ/o+bK4ghKoYrMaRR6AEoHUBy2bSeNTG7BeIqiwK51PYaeZ1WHySmkYaeFh8V3bp
         cXOLXvDd5Ox0UICWQ+LOUYSfhF7sqR9U43FzAeHqGVhdTQm0jQ7WoCWILo29rB9DQYQT
         HT84zq1DxEBm9YXauDIk8/GuC2PXPUQ7El6Zs5HX0GsrkLACLVzD1se6XJVUV0A5Kt10
         pY6g==
X-Gm-Message-State: AC+VfDwJmkdzycWZfyasNHvFoAwyzgulMiqvrj8MA9dZ6aRRsv4eqceJ
	yVHw9ZmbVGNqC+VjUuIRI3CBu8ZziQvixnkWRq968W2e8R5PLMs4AgaEd2d5IS1tnjnHQmRAhDq
	Qqp3uEQCbZmrreVzfCb8UKG1izTJapovNmtx25YIo98G21vei8H8cG6FpWYz85/FpS/bpGFS8Y/
	UKQyc6C4GwjxWg
X-Google-Smtp-Source: ACHHUZ5H9al3o7R9DVJ8noKHqXN/Z6PK0n9zsnGfLVf4cZOf/4z90B0NyME5n2HJdo21x+D4YU0/wg==
X-Received: by 2002:a17:902:d505:b0:1a6:f93a:a136 with SMTP id b5-20020a170902d50500b001a6f93aa136mr22651724plg.22.1683628408433;
        Tue, 09 May 2023 03:33:28 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:33:27 -0700 (PDT)
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
Subject: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
Date: Tue,  9 May 2023 10:30:32 +0000
Message-Id: <20230509103033.11285-24-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033329_356356_97F8A939 
X-CRM114-Status: GOOD (  12.18  )
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

This patch adds a config which enables vector feature from the kernel
space.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Suggested-by: Atish Patra <atishp@atishpatra.org>
Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog V19:
 - Add RISCV_V_DISABLE to set compile-time default.

 arch/riscv/Kconfig  | 31 +++++++++++++++++++++++++++++++
 arch/riscv/Makefile |  6 +++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1019b519d590..fa256f2e23c1 100644
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
+config RISCV_V_DISABLE
+	bool "Disable userspace Vector by default"
+	depends on RISCV_ISA_V
+	default n
+	help
+	  Say Y here if you want to disable default enablement state of Vector
+	  in u-mode. This way userspace has to make explicit prctl() call to
+	  enable Vector, or enable it via sysctl interface.
+
+	  If you don't know what to do here, say N.
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
