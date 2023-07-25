Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABC2C001DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q6otr2Fg2xERukDQ/7pldMs+NXCbXPE+y3F2ETifQyA=; b=1/+fGWnZhH8buW
	A4ykRJoV1iGOShOH7ER1vhrFRPRfB/01/ZVdvQY3ztXptRPBx5rWz7n1pGhhps70beZp+90kffpj9
	ZC0NJOGdk7cCvM+lp/9bMo/aUvwOjFIqwKqqvmLIOSD8vtNpiDKAhUkZGi2krLks9ec7W6OwqZpke
	r/s5nGK+l9V17NswAtWeOiXEXKPvkhHLR9JgYpv6ivmJfO/7vdhAxukrTSQDLHZUySVGBLRKTsF0n
	xgIblQPwCs83dAyCFriWb+YQJBb141zsj8stjnyObAuVZWSsHgFFMafxMr2Z0kY5yV9UeEzWj+Qiy
	RPELVr/nV1SEteDstDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOLSy-0087kl-2E;
	Tue, 25 Jul 2023 17:04:56 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOLSt-0087j9-2x
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 17:04:54 +0000
Received: from xmz-huawei.. (unknown [114.249.159.178])
	by APP-05 (Coremail) with SMTP id zQCowADnbuuXAMBkSR2gDg--.49620S2;
	Wed, 26 Jul 2023 01:04:24 +0800 (CST)
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
	Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Subject: [PATCH] riscv: Handle zicsr/zifencei issue between gcc and binutils
Date: Wed, 26 Jul 2023 01:04:05 +0800
Message-Id: <20230725170405.251011-1-xingmingzheng@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowADnbuuXAMBkSR2gDg--.49620S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr1DWw4UWFy3tr1UXryftFb_yoW5Xw1Dpa
	9xAFn5Crs5X3yxC34rA34UWr1YvrZ5K3yagr17Gw15urs3Za4kKrWvvw4IqFyDAFZ7Kw4U
	Zr1fuasYgwn8XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: 50lqwzhlqj6xxhqjqxpvfd2hldfou0/1tbiBwIDCmS-00lwhgAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_100452_346611_45A73914 
X-CRM114-Status: GOOD (  10.88  )
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

When compiling the kernel with the toolchain composed of GCC >= 12.1.0 and
binutils < 2.38, default ISA spec used when building binutils and GCC, the
following build failure will appear because the
CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI is not turned on.
(i.e, gcc-12.1.0 and binutils-2.36, or gcc-12.3.0 and binutils-2.37, use
default ISA spec.)

  CC      arch/riscv/kernel/vdso/vgettimeofday.o
  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:79: Error: unrecognized opcode `csrr a5,0xc01'

Binutils has updated the default ISA spec version, and the community has
responded well to this[1][2][3], but it appears that this is not over yet.

We also need to consider the situation of binutils < 2.38 but
GCC >= 12.1.0, since the combination between different versions of GCC and
binutils is not unique, which is to some extent flexible. GCC release
12.1.0 updated the default ISA spec version in GCC commit[4].

For more information, please refer to:

commit 6df2a016c0c8 ("riscv: fix build with binutils 2.38")
commit e89c2e815e76 ("riscv: Handle zicsr/zifencei issues between clang and binutils")

[1]: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/aE1ZeHHCYf4
[2]: https://lore.kernel.org/all/20230308220842.1231003-1-conor@kernel.org
[3]: https://lore.kernel.org/all/20230223220546.52879-1-conor@kernel.org
[4]: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=98416dbb0a62579d4a7a4a76bab51b5b52fec2cd

Signed-off-by: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
---
 arch/riscv/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..b49cea30f6cc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -570,11 +570,15 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
 config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	def_bool y
 	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
-	depends on AS_IS_GNU && AS_VERSION >= 23800
+	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=98416dbb0a62579d4a7a4a76bab51b5b52fec2cd
+	depends on CC_IS_GCC && GCC_VERSION >= 120100 || \
+		   AS_IS_GNU && AS_VERSION >= 23800
 	help
 	  Newer binutils versions default to ISA spec version 20191213 which
 	  moves some instructions from the I extension to the Zicsr and Zifencei
 	  extensions.
+	  Similarly, GCC release 12.1.0 has changed the default ISA spec version to
+	  20191213, so the above situation requires this option to be enabled.
 
 config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	def_bool y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
