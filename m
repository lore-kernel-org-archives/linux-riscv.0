Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBABC001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPpU9DwKHlYyk9mGhIwPEZskML4Qm1DFM8JzcgZqLaY=; b=BCMgMmV8/VVrFm
	mdZSTsO1h5RMrIers072Wa6vrN6ImoUvWdAFJ4Ttftu3ncGoyPs1LX2GC/QRHIbhgxq64PfGhD1ft
	Covjqt0+lEFedsZOeAN3vR8ydlNAPQLxmVFhDvkcZOTkXD11OBQAKsmj4eBlMDraj3yEn/4o88Cu1
	6t+/6RdvUEezSCwMjVvT+I0OZQstYfHLzR9tqlnxD0hzn8bbX5xlYu1LirlHs3RTzHHsZzmjJ/svT
	XouTA8Up+pDNUyTPDF48k5NaoYUqkqlcmrqJOZc8kfkFIbQk1ReK+B4zbfs3JGZtP2CQncaYSdqxG
	nDN9z6eMW+eJ0rr45n2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUTW-00GFZj-0Y;
	Mon, 31 Jul 2023 15:06:22 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUTR-00GFRd-2I
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 15:06:20 +0000
Received: from xmz-huawei.. (unknown [111.197.209.91])
	by APP-03 (Coremail) with SMTP id rQCowACnrcW2zcdkoZmtDw--.21850S2;
	Mon, 31 Jul 2023 23:05:27 +0800 (CST)
From: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Bin Meng <bmeng@tinylab.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Subject: [PATCH] riscv: Handle zicsr/zifencei issue between gcc and binutils
Date: Mon, 31 Jul 2023 23:05:11 +0800
Message-Id: <20230731150511.38140-1-xingmingzheng@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731095534.22842-1-xingmingzheng@iscas.ac.cn>
References: <20230731095534.22842-1-xingmingzheng@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACnrcW2zcdkoZmtDw--.21850S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw4UGFyrury5GFWfKF1rJFb_yoW7ZFyUpr
	W3CFyDCr4Fga18Gr1fAw1UWw1Yyrs3J3ySgFW0kw1UGrnxJFyDKr9Yyw17XFyUZFn2grZ0
	vw1S9anYg3ZrAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
	XdbUUUUUU==
X-Originating-IP: [111.197.209.91]
X-CM-SenderInfo: 50lqwzhlqj6xxhqjqxpvfd2hldfou0/1tbiBwgJCmTHvEwkBQAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_080618_117206_D04C76DA 
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

Binutils-2.38 and GCC-12.1.0 bumped[0][1] the default ISA spec to the newer
20191213 version which moves some instructions from the I extension to the
Zicsr and Zifencei extensions. So if one of the binutils and GCC exceeds
that version, we should explicitly specifying Zicsr and Zifencei via -march
to cope with the new changes. but this only occurs when binutils >= 2.36
and GCC >= 11.1.0. It's a different story when binutils < 2.36.

binutils-2.36 supports the Zifencei extension[2] and splits Zifencei and
Zicsr from I[3]. GCC-11.1.0 is particular[4] because it add support Zicsr
and Zifencei extension for -march. binutils-2.35 does not support the
Zifencei extension, and does not need to specify Zicsr and Zifencei when
working with GCC >= 12.1.0.

To make our lives easier, let's relax the check to binutils >= 2.36 in
CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI. For the other two cases,
where clang < 17 or GCC < 11.1.0, we will deal with them in
CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC.

For more information, please refer to:
commit 6df2a016c0c8 ("riscv: fix build with binutils 2.38")
commit e89c2e815e76 ("riscv: Handle zicsr/zifencei issues between clang and binutils")
Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc [0]
Link: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=98416dbb0a62579d4a7a4a76bab51b5b52fec2cd [1]
Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5a1b31e1e1cee6e9f1c92abff59cdcfff0dddf30 [2]
Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=729a53530e86972d1143553a415db34e6e01d5d2 [3]
Link: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b03be74bad08c382da47e048007a78fa3fb4ef49 [4]
Link: https://lore.kernel.org/all/20230308220842.1231003-1-conor@kernel.org
Link: https://lore.kernel.org/all/20230223220546.52879-1-conor@kernel.org
Cc: <stable@vger.kernel.org>
Signed-off-by: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
---
 arch/riscv/Kconfig                     | 32 +++++++++++++++-----------
 arch/riscv/kernel/compat_vdso/Makefile |  8 ++++++-
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..10e7a7ad175a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -570,24 +570,30 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
 config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	def_bool y
 	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
-	depends on AS_IS_GNU && AS_VERSION >= 23800
-	help
-	  Newer binutils versions default to ISA spec version 20191213 which
-	  moves some instructions from the I extension to the Zicsr and Zifencei
-	  extensions.
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=98416dbb0a62579d4a7a4a76bab51b5b52fec2cd
+	depends on AS_IS_GNU && AS_VERSION >= 23600
+	help
+	  Binutils-2.38 and GCC-12.1.0 bumped the default ISA spec to the newer
+	  20191213 version, which moves some instructions from the I extension to
+	  the Zicsr and Zifencei extensions. This requires explicitly specifying
+	  Zicsr and Zifencei when binutils >= 2.38 or GCC >= 12.1.0. Zicsr
+	  and Zifencei are supported in binutils from version 2.36 onwards.
+	  To make life easier, and avoid forcing toolchains that default to a
+	  newer ISA spec to version 2.2, relax the check to binutils >= 2.36.
+	  For clang < 17 or GCC < 11.1.0, for which this is not possible, this is
+	  dealt with in CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC.
 
 config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	def_bool y
 	depends on TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
-	depends on CC_IS_CLANG && CLANG_VERSION < 170000
-	help
-	  Certain versions of clang do not support zicsr and zifencei via -march
-	  but newer versions of binutils require it for the reasons noted in the
-	  help text of CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI. This
-	  option causes an older ISA spec compatible with these older versions
-	  of clang to be passed to GAS, which has the same result as passing zicsr
-	  and zifencei to -march.
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b03be74bad08c382da47e048007a78fa3fb4ef49
+	depends on (CC_IS_CLANG && CLANG_VERSION < 170000) || (CC_IS_GCC && GCC_VERSION < 110100)
+	help
+	  Certain versions of clang and GCC do not support zicsr and zifencei via
+	  -march. This option causes an older ISA spec compatible with these older
+	  versions of clang and GCC to be passed to GAS, which has the same result
+	  as passing zicsr and zifencei to -march.
 
 config FPU
 	bool "FPU support"
diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 189345773e7e..b86e5e2c3aea 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -11,7 +11,13 @@ compat_vdso-syms += flush_icache
 COMPAT_CC := $(CC)
 COMPAT_LD := $(LD)
 
-COMPAT_CC_FLAGS := -march=rv32g -mabi=ilp32
+# binutils 2.35 does not support the zifencei extension, but in the ISA
+# spec 20191213, G stands for IMAFD_ZICSR_ZIFENCEI.
+ifdef CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
+	COMPAT_CC_FLAGS := -march=rv32g -mabi=ilp32
+else
+	COMPAT_CC_FLAGS := -march=rv32imafd -mabi=ilp32
+endif
 COMPAT_LD_FLAGS := -melf32lriscv
 
 # Disable attributes, as they're useless and break the build.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
