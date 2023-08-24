Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F3CC6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 19:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w7gDrk1RLg9b4fsY2Bli6scFf8jepOlpGA+2RlrO/tQ=; b=L/XTkpyD2dP8R6
	u9vu4ZT1621LBldlwfJiS6jb7ILnRHVwIrmUiQK69CC2GWIiwzAQLRaomqbfca9fwQ0KZCd+K1Z2r
	RI4PWm3aHBxB18F+eZ+oTiTwyPpVbSUkbZN8JU3OT0+BGIeRERfM7j9+tBKpv7AsZgr8XsNeOQ7ma
	AVF7zYiRBx2/ow0DhSZuwldD9bF+dfM1S0n1uz0NJZvAga1uOT9py1rilmqjG+pjqmmrwPCrU6+IX
	n1SZ2XedmOisa4E1o2HnBrFmAzL/csMAzHjPpvnVg78+l3f1SmxpTyCCJ4lSGJLuHwrDjZVH0r+ov
	bct9Pv67U7lTd6n7q4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZFhe-003e9J-0g;
	Thu, 24 Aug 2023 19:09:10 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZFha-003e8t-1I
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 19:09:09 +0000
Received: from xmz-huawei.. (unknown [111.197.209.91])
	by APP-03 (Coremail) with SMTP id rQCowAAXHmbGqudkwlMABQ--.63174S2;
	Fri, 25 Aug 2023 03:08:55 +0800 (CST)
From: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Bin Meng <bmeng@tinylab.org>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org,
	Mingzheng Xing <xingmingzheng@iscas.ac.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] riscv: Fix build errors using binutils2.37 toolchains
Date: Fri, 25 Aug 2023 03:08:52 +0800
Message-Id: <20230824190852.45470-1-xingmingzheng@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAXHmbGqudkwlMABQ--.63174S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw15uF48Cw4ftFy5ZF1rXrb_yoW5Cw4fp3
	4fCFn8Kr1rWF1xJr10yr18W3WYgrZ5J39Igr4kXr4Uuws5ZrZrJ34vkr129rsFvrs7trZ5
	Zr4F9a1rWF1DAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHU
	DUUUUU=
X-Originating-IP: [111.197.209.91]
X-CM-SenderInfo: 50lqwzhlqj6xxhqjqxpvfd2hldfou0/1tbiCgUNCmTnYiSHfgAAs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_120906_814571_AC0BC0E1 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

When building the kernel with binutils 2.37 and GCC-11.1.0/GCC-11.2.0,
the following error occurs:

  Assembler messages:
  Error: cannot find default versions of the ISA extension `zicsr'
  Error: cannot find default versions of the ISA extension `zifencei'

The above error originated from this commit of binutils[0], which has been
resolved and backported by GCC-12.1.0[1] and GCC-11.3.0[2].

So fix this by change the GCC version in
CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC to GCC-11.3.0.

Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f0bae2552db1dd4f1995608fbf6648fcee4e9e0c [0]
Link: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ca2bbb88f999f4d3cc40e89bc1aba712505dd598 [1]
Link: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d29f5d6ab513c52fd872f532c492e35ae9fd6671 [2]
Fixes: ca09f772ccca ("riscv: Handle zicsr/zifencei issue between gcc and binutils")
Reported-by: Conor Dooley <conor.dooley@microchip.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
---

Then below are my test results after this fix:

gcc        binutils

10.5.0     2.35            ok
10.5.0     2.36            ok
10.5.0     2.37            ok
10.5.0     2.38            ok

11.1.0     2.35            ok
11.1.0     2.36            ok
11.1.0     2.37            ok
11.1.0     2.38            ok

11.2.0     2.35            ok
11.2.0     2.36            ok
11.2.0     2.37            ok
11.2.0     2.38            ok

11.3.0     2.35            ok
11.3.0     2.36            ok
11.3.0     2.37            ok
11.3.0     2.38            ok

11.4.0     2.35            ok
11.4.0     2.36            ok
11.4.0     2.37            ok
11.4.0     2.38            ok

12.1.0     2.35            ok
12.1.0     2.36            ok
12.1.0     2.37            ok
12.1.0     2.38            ok

12.2.0     2.35            ok
12.2.0     2.36            ok
12.2.0     2.37            ok
12.2.0     2.38            ok 

 arch/riscv/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 10e7a7ad175a..bea7b73e895d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -580,15 +580,15 @@ config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	  and Zifencei are supported in binutils from version 2.36 onwards.
 	  To make life easier, and avoid forcing toolchains that default to a
 	  newer ISA spec to version 2.2, relax the check to binutils >= 2.36.
-	  For clang < 17 or GCC < 11.1.0, for which this is not possible, this is
-	  dealt with in CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC.
+	  For clang < 17 or GCC < 11.3.0, for which this is not possible or need
+	  special treatment, this is dealt with in TOOLCHAIN_NEEDS_OLD_ISA_SPEC.
 
 config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	def_bool y
 	depends on TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
-	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b03be74bad08c382da47e048007a78fa3fb4ef49
-	depends on (CC_IS_CLANG && CLANG_VERSION < 170000) || (CC_IS_GCC && GCC_VERSION < 110100)
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d29f5d6ab513c52fd872f532c492e35ae9fd6671
+	depends on (CC_IS_CLANG && CLANG_VERSION < 170000) || (CC_IS_GCC && GCC_VERSION < 110300)
 	help
 	  Certain versions of clang and GCC do not support zicsr and zifencei via
 	  -march. This option causes an older ISA spec compatible with these older
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
