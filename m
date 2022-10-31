Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45798FA3741
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 18:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vq/tr3dfxi0GABumE9EDZjUmW5CYDuj6J6cr8ab00l0=; b=rAp/+dkuyP5sXd
	WGXq7jDolm37te87Svc6plERKbbH35KoHU0xzi6O3M1UeOA5PGIi7/1lK7Ddnz5yT1AnxAGFkIdcS
	R3PjqCDvWeR3KKA4t6SIsWOsyDt78TOelvnXQ4nNkYF92bZxDdOdNAwthNaHgfpPl6khDICN3DXa9
	LVk7iCgSnZQGe6+9onUNXQccED83FjOyJBzuWkjQl0t70hrKB3zCor7zzZ0UMTex8/TK1KeUveaWI
	TjP7cgMyXs4Bko2mj9OKESkmOwPN86+fnjfE9pPibsBRtRy1PT08+pklP5vc6AfAATcN10bQF11Pj
	rbU7CeeqQdzXENq00k9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opZh7-00Dpjd-Pz; Mon, 31 Oct 2022 18:39:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opZh4-00DphK-Li
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 18:39:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA6D9613C5;
	Mon, 31 Oct 2022 18:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2632C433C1;
	Mon, 31 Oct 2022 18:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667241564;
	bh=It14nDJvTqCUwHf/PuycyXWi6Kbor6f6XNY4NSVwgLE=;
	h=From:To:Cc:Subject:Date:From;
	b=BjgfbnyQkRTF0+PkDkOegY6LaF3LwWV0vcYyqsL3bgIUuoftJO1AgskCxUc/LvLSI
	 lazDQKYdKatIhtRYHTVuw+X6AFDD77Lyt4q1Y/SL6I/JX5ELPVSSz9Z71+9UrYP1zX
	 yoYqsnCZFcs7RWp91IiXeSphXoUaimfoHtLHjKYBkginNuaa203nnreCe0/bx4aEor
	 bd4n2WrOnXiP2fP+ucM6f1vNqmPENJI71T19HHkxNPJLLylilyeRKtg3YREQvtpAjw
	 NRxBoDsnrHiW9c/W8ghfPvqdv9zYLUDaj7ChG6MmNFT8x+pjT4v68iO8vxVE1/mPx0
	 Ivtd/6+a33yzA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: vdso: fix build with llvm
Date: Tue,  1 Nov 2022 02:29:43 +0800
Message-Id: <20221031182943.2453-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_113930_773903_270B60F0 
X-CRM114-Status: GOOD (  13.35  )
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

Even after commit 89fd4a1df829 ("riscv: jump_label: mark arguments as
const to satisfy asm constraints"), building with CC_OPTIMIZE_FOR_SIZE
+ LLVM=1 can reproduce below build error:

  CC      arch/riscv/kernel/vdso/vgettimeofday.o
In file included from <built-in>:4:
In file included from lib/vdso/gettimeofday.c:5:
In file included from include/vdso/datapage.h:17:
In file included from
include/vdso/processor.h:10:
In file included from
arch/riscv/include/asm/vdso/processor.h:7:
In file included from
include/linux/jump_label.h:112:
arch/riscv/include/asm/jump_label.h:42:3: error:
invalid operand fo
r inline asm constraint 'i'
                "       .option push                            \n\t"
                ^
1 error generated.

I think the problem is when "-Os" is passed as CFLAGS, it's removed by
"CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os" which is
introduced in commit e05d57dcb8c7 ("riscv: Fixup __vdso_gettimeofday
broke dynamic ftrace"), thus no optimization at all for vgettimeofday.c
arm64 does remove "-Os" as well, but it forces "-O2" after removing
"-Os".

I compared the generated vgettimeofday.o with "-O2" and "-Os",
I think no big performance difference. So let's tell the kbuild not
to remove "-Os" rather than follow arm64 style.

vdso related performance can be improved a lot when building kernel with
CC_OPTIMIZE_FOR_SIZE after this commit, ("-Os" VS no optimization)

Fixes: e05d57dcb8c7 ("riscv: Fixup __vdso_gettimeofday broke dynamic ftrace")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index f2e065671e4d..84ac0fe612e7 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -30,7 +30,7 @@ obj-y += vdso.o
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 
 # Disable -pg to prevent insert call site
-CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
+CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
 
 # Disable profiling and instrumentation for VDSO code
 GCOV_PROFILE := n
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
