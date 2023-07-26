Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB6CC001DF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 17:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aPugvudyQmv9ei+hxSYN8wj2ftzJSrMlnGtp1GUzjH0=; b=YihEfyTpPdeOsQ
	GXJ4xKlQzZu+vBro81B+7ej8qvtIcCpLZMQtlxQkeupMaBXn1nT0DWLnvPWubkrpDgJt2GMIRx+5c
	J+cFuHVjYRQSz4PkJLmP7vdhgNdX7XuUKBIqIgNqVu5a8E64CAsskRamuuh4bYGYaQzuqMPV1Bjrh
	R2YGip6W5gKhOV5zwAghL/ZgsRL8x0faSL69JpoIf5mr4UviUTiDmKQMAux1tkmRoz1f8EQPJbpRZ
	NkJCm1HCAmGDAG8faqOKitJGiOG+bW6zLLoHJ1oDzRp6Lv6i348VnWTjYPglRsAa/kHD84fjGZItz
	mttQ2jiRXV/zD/yvwxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOiah-00BD4v-12;
	Wed, 26 Jul 2023 17:46:27 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOiad-00BD32-1n
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 17:46:25 +0000
Received: from xmz-huawei.. (unknown [114.249.159.178])
	by APP-03 (Coremail) with SMTP id rQCowABXd2TfW8Fkh6U1Dg--.53842S2;
	Thu, 27 Jul 2023 01:46:07 +0800 (CST)
From: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
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
	Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Subject: [PATCH v2] riscv: Handle zicsr/zifencei issue between gcc and binutils
Date: Thu, 27 Jul 2023 01:45:24 +0800
Message-Id: <20230726174524.340952-1-xingmingzheng@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXd2TfW8Fkh6U1Dg--.53842S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1kGry5ZFWrCrWUKryrCrg_yoWrJFWfpr
	ZxCryUGrs5X3ykGr1fJw4UW34Yyws5J3y8WrW7Kw15u3sxAFy0gr9Yyw42qFyUAFZ7Kw4q
	9w1S93ZYq3Z0yaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHU
	DUUUUU=
X-Originating-IP: [114.249.159.178]
X-CM-SenderInfo: 50lqwzhlqj6xxhqjqxpvfd2hldfou0/1tbiCQgECmTBJKN66QAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_104623_980538_F6CCC4AF 
X-CRM114-Status: GOOD (  11.46  )
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

Binutils-2.38 and GCC-12.1.0 bump[0] default ISA spec to newer version
20191213 which moves some instructions from the I extension to the
Zicsr and Zifencei extensions. So if one of the binutils and GCC exceeds
that version, we should turn on TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
to cope with the new changes.

The case of clang is special[1][2], where older clang versions (<17) need
to be rolled back to old ISA spec to fix it. And the less common case,
since older GCC versions (<11.1.0) did not support zicsr and zifencei
extension for -march, also requires a fallback to cope with it.

For more information, please refer to:
commit 6df2a016c0c8 ("riscv: fix build with binutils 2.38")
commit e89c2e815e76 ("riscv: Handle zicsr/zifencei issues between clang and binutils")
Link: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=98416dbb0a62579d4a7a4a76bab51b5b52fec2cd [0]
Link: https://lore.kernel.org/all/20230308220842.1231003-1-conor@kernel.org [1]
Link: https://lore.kernel.org/all/20230223220546.52879-1-conor@kernel.org [2]
Link: https://lore.kernel.org/all/20230725170405.251011-1-xingmingzheng@iscas.ac.cn
Signed-off-by: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
---

v2:
- Update the Kconfig help text and commit message.
- Add considerations for low version gcc case.

Sorry for the formatting error on my mailing list reply.

 arch/riscv/Kconfig | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..08afd47de157 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -570,24 +570,27 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
 config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	def_bool y
 	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
-	depends on AS_IS_GNU && AS_VERSION >= 23800
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=98416dbb0a62579d4a7a4a76bab51b5b52fec2cd
+	depends on GCC_VERSION >= 120100 || (AS_IS_GNU && AS_VERSION >= 23800)
 	help
-	  Newer binutils versions default to ISA spec version 20191213 which
-	  moves some instructions from the I extension to the Zicsr and Zifencei
-	  extensions.
+	  Binutils-2.38 and GCC-12.1.0 bump default ISA spec to newer version
+	  20191213 which moves some instructions from the I extension to the
+	  Zicsr and Zifencei extensions.
 
 config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	def_bool y
 	depends on TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
-	depends on CC_IS_CLANG && CLANG_VERSION < 170000
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b03be74bad08c382da47e048007a78fa3fb4ef49
+	depends on (CC_IS_CLANG && CLANG_VERSION < 170000) || \
+		   (CC_IS_GCC && GCC_VERSION < 110100)
 	help
-	  Certain versions of clang do not support zicsr and zifencei via -march
-	  but newer versions of binutils require it for the reasons noted in the
-	  help text of CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI. This
+	  Certain versions of clang (or GCC) do not support zicsr and zifencei via
+	  -march but newer versions of binutils require it for the reasons noted
+	  in the help text of CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI. This
 	  option causes an older ISA spec compatible with these older versions
-	  of clang to be passed to GAS, which has the same result as passing zicsr
-	  and zifencei to -march.
+	  of clang (or GCC) to be passed to GAS, which has the same result as
+	  passing zicsr and zifencei to -march.
 
 config FPU
 	bool "FPU support"
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
