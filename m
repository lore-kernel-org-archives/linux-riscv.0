Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD5BC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viNA3TU86/Yw7+16ceInTolVFs+v6niaAGi19VoZH04=; b=rjPHrbijqxuPZM
	eg8hzP3hDz6qdT1OEzCkWqZTVeuU4fAy1yy7m5n3J7t/yy6AUcto0EchpdqjD2Who4GXEY0uGbXkr
	VmMmcys0A6XsFPoFvQ+CerdDPxShQT+8OvSkDTJOlCB/e+5z6BSBNYd6O9n4rmr6hmTAfzKkAZOpT
	c+jW7e9lKMFpP4jXhoDymZ4gaRrANd9C3xTWhOVG5b/gpLroucV2iPlIFOG2uZa5gXLxDOvN8sW3Q
	Gk8HOP0aDdkJSyVGHZqXbEqoUNfvAu/9qt6VLprchT/spRkmHuc6u52HkhblKPmjng8ZGlewyiRZI
	kppnKUJkXi5l3purSV0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogUnD-004CUN-UA; Thu, 06 Oct 2022 17:36:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogUnB-004CSq-1U
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 17:36:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B67D561A36;
	Thu,  6 Oct 2022 17:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DEAC433D7;
	Thu,  6 Oct 2022 17:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665077774;
	bh=GUqme/r7hbePZuQzyMvKMjER/L3r6OTCMSjziwbypbQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hB1YD1QsXMXEUG8+CI+yIvHJLLXcoRa28R6F7dyiEAtLgiMQIBASVBkqwjlyfuzFG
	 yT5j8D33eqwtp7xui9Cyz5HD0nCV6rKGbLVQNYJTgvw1wefN48tWSRovPei/2phycr
	 ZblITCOSvP9eI0XVai8y2ELGvw4JrEneHcXfH1LKorrfcF8hBUefacu4SotJT8FhEs
	 fkGDkn3xaWUirMVvO5InMxKZO6pdBCzfOKl8gsnqzdarcIXE+MKtv6hyl4OMAufsUt
	 7V5vOGUl+l4KpzMmo7g+bdOTPsWHohrw6oUqkQT5AKrWkhvJuG02GNoOJp6NClyhCL
	 Biktb2YOhAeIg==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] riscv: fix detection of toolchain Zicbom support
Date: Thu,  6 Oct 2022 18:35:20 +0100
Message-Id: <20221006173520.1785507-2-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006173520.1785507-1-conor@kernel.org>
References: <20221006173520.1785507-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_103617_182837_402E7FEA 
X-CRM114-Status: GOOD (  12.71  )
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

From: Conor Dooley <conor.dooley@microchip.com>

It is not sufficient to check if a toolchain supports a particular
extension without checking if the linker supports that extension too.
For example, Clang 15 supports Zicbom but GNU bintutils 2.35.2 does
not, leading build errors like so:

riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_c2p0_zicbom1p0_zihintpause2p0: Invalid or unknown z ISA extension: 'zicbom'

Convert CC_HAS_ZICBOM to TOOLCHAIN_HAS_ZICBOM & check if the linker
also supports Zicbom.

Reported-by: Kevin Hilman <khilman@baylibre.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1714
Link: https://storage.kernelci.org/next/master/next-20220920/riscv/defconfig+CONFIG_EFI=n/clang-16/logs/kernel.log
Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig  | 10 ++++++----
 arch/riscv/Makefile |  3 +--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d557cc50295d..6da36553158b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -401,14 +401,16 @@ config RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
-config CC_HAS_ZICBOM
+config TOOLCHAIN_HAS_ZICBOM
 	bool
-	default y if 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicbom)
-	default y if 32BIT && $(cc-option,-mabi=ilp32 -march=rv32ima_zicbom)
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zicbom)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zicbom)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 
 config RISCV_ISA_ZICBOM
 	bool "Zicbom extension support for non-coherent DMA operation"
-	depends on CC_HAS_ZICBOM
+	depends on TOOLCHAIN_HAS_ZICBOM
 	depends on !XIP_KERNEL && MMU
 	select RISCV_DMA_NONCOHERENT
 	select RISCV_ALTERNATIVE
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3fa8ef336822..3607d38edb4f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -57,8 +57,7 @@ toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zi
 riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
 
 # Check if the toolchain supports Zicbom extension
-toolchain-supports-zicbom := $(call cc-option-yn, -march=$(riscv-march-y)_zicbom)
-riscv-march-$(toolchain-supports-zicbom) := $(riscv-march-y)_zicbom
+riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICBOM) := $(riscv-march-y)_zicbom
 
 # Check if the toolchain supports Zihintpause extension
 toolchain-supports-zihintpause := $(call cc-option-yn, -march=$(riscv-march-y)_zihintpause)
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
