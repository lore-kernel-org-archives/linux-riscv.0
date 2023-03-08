Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3725C678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 22:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9yTOfZ8G+Y7siVxkfwdy2pEQxBh03H42EGDNzivBwow=; b=xYN1co05VfOGO0
	Yf5OYR97ecU4UpcVhK5NF7sLt9Cd4X5r8Z0RF1YZiMqSflJVu0R0a2V+AgXUmy5uGNN6Be3e22mnL
	phxJr0/+trWfl2+QGepcfiLa4PeLJjv70E+HSWcFzsILUy9LBFf8sexl5FxFZ/St2DxFR+urV7ypN
	kyrqPR3eoFI3Cklm2eKpkDEE5AO4WpkUgutvnY9OBL6RbCOQXlMqvf3eUjmoQ7vkt6jjcfS7w6iv/
	WcCMpJ5RE9F0N1+m8/zqcgLbNbSgP8XO1UlBff0Z8qcQIcl2Zn3he9a9QZ7uAiYNFo8qbyt6As4gs
	thdlXGhf3/aQyXZ8wm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1yT-006vp5-6D; Wed, 08 Mar 2023 22:09:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1yO-006vob-Vb
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 22:09:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 936C4B81DDC;
	Wed,  8 Mar 2023 22:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27065C433EF;
	Wed,  8 Mar 2023 22:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678313361;
	bh=YjvsP3xGIY/OBQAOjH6ILlUgFSWUuguf/wwQlB08/I4=;
	h=From:To:Cc:Subject:Date:From;
	b=iIKyrvh24Sp1q+rzGLGhUtShBlWpH4yKtakn0yah+KrhBBVigUXGzDno4kYge1FLJ
	 oc6J5smYtnYDkK4Rh4F/pwUW+iavBWLfvIHzfuQFjg2flhoQ9bAWEV5TXru/KhVUpV
	 /nBBEDttzm+4WwDEX60wy2InRENdg5hDPggfjrMAavQd6tPJMLQBm+9MViorK3p6Fz
	 DFGM+0FziPJgD2Rdtp3SUjvWowVsTjMSnLlkAc4gWT4D++xz24fgSuDvqnSTv7jocc
	 m0eYCZgiI71B5YewaWPz1D6YkpTdIZ0sqXmaU5ksCU83o6kD0XXSkaUNpE4Vl0krNv
	 bs7IgLI5B7d5A==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	nathan@kernel.org,
	naresh.kamboju@linaro.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org,
	aurelien@aurel32.net,
	ndesaulniers@google.com,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2] RISC-V: remove I-extension ISA spec version dance
Date: Wed,  8 Mar 2023 22:08:43 +0000
Message-Id: <20230308220842.1231003-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5181; i=conor.dooley@microchip.com; h=from:subject; bh=e8x5OC9RRLdlP4Bz9tlTw5oReRU3raEf7fvxO+/8Qqc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmc7JkT3F6dDJv+KJ9VbMrZ2wITfxak7d+kki7OoP/we fBJawadjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk1HxGhjel8gVrmv8p/j1z pWhlp6tqiQ+/R+Fxi+u1qf7iDqF7FzEynMkMSfzrK+Eu7dZh/579XUjUi4l5Jya98KuV9u55dcm JGQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_140925_359987_5533C5A0 
X-CRM114-Status: GOOD (  17.76  )
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

The spec folk, in their infinite wisdom, moved both control and status
registers & the FENCE.I instructions out of the I extension into their
own extensions (Zicsr, Zifencei) in the 20190608 version of the ISA
spec [0].
The GCC/binutils crew decided [1] to move their default version of the
ISA spec to the 20191213 version of the ISA spec, which came into being
for version 2.38 of binutils and GCC 12. Building with this toolchain
configuration would result in assembler issues:
  CC      arch/riscv/kernel/vdso/vgettimeofday.o
  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
This was fixed in commit 6df2a016c0c8 ("riscv: fix build with binutils
2.38") by Aurelien Jarno, but has proven fragile.

Before LLVM 17, LLVM did not support these extensions and, as such, the
cc-option check added by Aurelien worked. Since commit 22e199e6afb1
("[RISCV] Accept zicsr and zifencei command line options") however, LLVM
*does* support them and the cc-option check passes.

This surfaced as a problem while building the 5.10 stable kernel using
the default Tuxmake Debian image [2], as 5.10 did not yet support ld.lld,
and uses the Debian provided binutils 2.35.
Versions of ld prior to 2.38 will refuse to link if they encounter
unknown ISA extensions, and unfortunately Zifencei is not supported by
bintuils 2.35.

Instead of dancing around with adding these extensions to march, as we
currently do, Palmer suggested locking GCC builds to the same version of
the ISA spec that is used by LLVM. As far as I can tell, that is 2.2,
with, apparently [3], a lack of interest in implementing a flag like
GCC's -misa-spec at present.

Add {cc,as}-option checks to add -misa-spec to KBUILD_{A,C}FLAGS when
GCC is used & remove the march dance.

As clang does not accept this argument, I had expected to encounter
issues with the assembler, as neither zicsr nor zifencei are present in
the ISA string and the spec version *should* be defaulting to a version
that requires them to be present. The build passed however and the
resulting kernel worked perfectly fine for me on a PolarFire SoC...

Link: https://riscv.org/wp-content/uploads/2019/06/riscv-spec.pdf [0]
Link: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/aE1ZeHHCYf4 [1]
Link: https://lore.kernel.org/all/CA+G9fYt9T=ELCLaB9byxaLW2Qf4pZcDO=huCA0D8ug2V2+irJQ@mail.gmail.com/ [2]
Link: https://discourse.llvm.org/t/specifying-unpriviledge-spec-version-misa-spec-gcc-flag-equivalent/66935 [3]
CC: stable@vger.kernel.org
Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I think Aurelien's original commit message might actually not be quite
correct? I found, in my limited testing, that it is not the default
behaviour of gas that matters, but rather the toolchain itself?
My binutils versions (both those built using the clang-built-linux
tc-build scripts which do not set an ISA spec version, and one built
using the riscv-gnu-toolchain infra w/ an explicit 20191213 spec version
set) do not encounter these issues.
From *my* testing, I was only able to reproduce the above build failures
because of *GCC* defaulting to a newer ISA spec version, and saw no
issues with CC=clang builds, where -misa-spec is not (AFAICT) passed to
gas.
I'm far from a toolchain person, so I am very very happy to have the
reason for that explained to me, as I've been scratching my head about
it all evening.

I'm also not super confident in my "as-option"ing, but it worked for me,
so it's gotta be perfect, right? riiight??

Changes from v1:
- entirely new approach to the issue
---
 arch/riscv/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 6203c3378922..2df7a5dc071c 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -57,10 +57,8 @@ riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 
-# Newer binutils versions default to ISA spec version 20191213 which moves some
-# instructions from the I extension to the Zicsr and Zifencei extensions.
-toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
-riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
+KBUILD_CFLAGS += $(call cc-option,-misa-spec=2.2)
+KBUILD_AFLAGS += $(call as-option,-Wa$(comma)-misa-spec=2.2)
 
 # Check if the toolchain supports Zihintpause extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
