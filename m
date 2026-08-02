Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C25C55162
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 17:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WWvk/NLBHayU0M0UtcF4u8txzdB2HC4/5MW3rrXSuSc=; b=DIdVcCVziOPA93
	rWCUPBTEQdOe6vVGRBmyMJhFs2Y/Jh90r8up273uozX70jaqjBLbnKlifrem/tbRfui8wk4OFEndK
	uSiyeD7nTgKWb2Y7x8Rw4q0gUUCUEWeQt6N2oknk7AuUmP0Y0SUr7T/U9tPhH2iTiHMHzez6RByDi
	fBg234kNhz1GEUrd22MrXIRhgWiCjB3AK1BMvSHcRnzdjYi45ItflFDU8bx6fYOADD52uIDSCosJz
	irvJlZP/3fo/kRRttTqOkC1t4MYMk3NsXMH32uh1sIpCUCQt0iBxHusEvNLRSIL/joMKduP3TuVib
	Dl2EPGTOkhrFLwoe/80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqaE2-0000000Fu3x-3u5x;
	Sun, 02 Aug 2026 17:43:50 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqaE0-0000000Fu3Z-1LY2
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 17:43:49 +0000
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d004f135b1so25705215ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 02 Aug 2026 10:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785692627; x=1786297427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFKIp+dilVhwH1i5aZzLKKk+gBZw8/UsY/+UeYQbT7Y=;
        b=eRD3yBfp01Sf8nUrlDPuJpmgyOfNNnLQ2fbwXgGDtvrcsUuK2aWQ0XUX6xlUZ9/PDL
         owT/9twGThfZyDxLFeCzgXUiLPUck37oQFzhUWkFmbi/FaXz49IK06RrvmcYtLdevVls
         yEBHb15FOCTGIjg6t8b1wuvHSXn9QDH97HWEcJ70TU+ogmyLxAm7nkFomOz2SK0r2K1n
         4UuFNgNdUp77AGf0uWJDbCk5P7mcLHQM8grhj+zxu4AGNrwYmNvLtHRbJ7T4FVfqL595
         ciN0QiggVeig4NDCTrpd0MfbW342I7tJnb31BYvGqPiOZPaW3g9k5LlSYK9sf29SVIk1
         Xl+A==
X-Forwarded-Encrypted: i=1; AHgh+Rp8/Xv2TGkOd1r8sfAC9gTRxZIDRmgaazjaS3k8AxERCxGOYYqQE6WcznZujejg80wjtjrIQxF9T9BHTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxW/d0Cfolf8/zXdjwlFNC82FK9troVDETMHwoZQQhBnf6eD+d0
	yKxLy6RCTV3RxbvDTXt68knaicEkmH8WqKCBTB5xAqyhDWyC1VVAbsFK
X-Gm-Gg: AR+sD10wlDmlUMKov3Dy+XUbfcEdVXCE2EXhU6/dO8tB0pSpxWDf/TY28dM0BUHjfiY
	CCVmnNntC64uhB1PiT6yE58nCAca6AjeA7w5eYsTJy1c7IHAhC2cyExEq5AoAxzTbyuofal8O3J
	OiJJHeiHu7Tb65Hpxr+S8S3vBauoXsDSp4tb2RYInLvpI/dITBzyqMx3957310Gi4LlyB7rFtM9
	rOkgTGMnUV/8V0doaQXaMpAeYZjk6FUoCmo06VRsPT4VrnJRbeo40FlNTJ9n1Hbn2RRC6IFVpMB
	6vfODhAPrAWtq6NBmkWzdOb+neF7CLfgOMPO02Y3Z75HNRTLfTvr4eODl1T5H1M/Q60SfmwUDkh
	af2EgldJItwU2oNlPviIzQGwemqrPGK07H4229HyACk00g5iynQtBzycSbcNFAH2pijzSj5RVvl
	HipVoNp4xk8EKYxgspKNe9CByDvDwUmLat+qg6WhgOW6B3/8EBkIJbr93y7BMWr4i8JRGSKQ0yF
	w1dF47QlAyuMCBE2/fDXlMcR1ROGyPty5wLVcu0dJ22Wkpc
X-Received: by 2002:a17:903:390b:b0:2cf:bfbb:61e2 with SMTP id d9443c01a7336-2d0524723b8mr69480925ad.39.1785692626770;
        Sun, 02 Aug 2026 10:43:46 -0700 (PDT)
Received: from localhost (37-72-172-174.static.hvvc.us. [37.72.172.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm28231366eec.20.2026.08.02.10.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 10:43:46 -0700 (PDT)
From: Fangrui Song <i@maskray.me>
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Fangrui Song <i@maskray.me>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] riscv/runtime-const: Disable linker relaxation for RUNTIME_MAGIC
Date: Sun,  2 Aug 2026 10:43:42 -0700
Message-ID: <20260802174342.597092-1-i@maskray.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_104348_382505_FC564395 
X-CRM114-Status: UNSURE (   9.01  )
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

Commit ee10b1028129 ("riscv/runtime-const: Replace open-coded
placeholder with RUNTIME_MAGIC") switched the lui + addi[w] placeholder
from hand-encoded immediates to %hi()/%lo() of RUNTIME_MAGIC.

GNU Assembler folds %hi()/%lo() of an absolute expression at assembly
time. LLVM's integrated assembler since 21.1 defers it to the linker
instead, which range checks it: on riscv64 R_RISCV_HI20 must fit a
signed 20-bit field, and RUNTIME_MAGIC (0x89ABCDEF) is a positive 64-bit
value rather than a sign-extended 32-bit one, so it does not:

    ld.lld: error: relocation R_RISCV_HI20 out of range: 563901 is not in
    [-524288, 524287]

The sequence is patched at runtime and its instruction offsets are
recorded via ".long 1b - .", so the linker must not touch it in the
first place. Add ".option norelax", as is already done for
ALTERNATIVE() and static keys; the integrated assembler then resolves
%hi()/%lo() itself and emits no relocation, restoring the exact
encoding the open-coded placeholder produced.

Fixes: ee10b1028129 ("riscv/runtime-const: Replace open-coded placeholder with RUNTIME_MAGIC")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://github.com/ClangBuiltLinux/linux/issues/2179
Signed-off-by: Fangrui Song <i@maskray.me>
---
Applies to tip/locking/core; the RISC-V tree (riscv/linux.git) does not
carry ee10b1028129.

 arch/riscv/include/asm/runtime-const.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index a472ebbf0971..ce2008bb5227 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -23,6 +23,7 @@
 	typeof(sym) __ret;						\
 	asm_inline(".option push\n\t"					\
 		".option norvc\n\t"					\
+		".option norelax\n\t"					\
 		"1:\t"							\
 		"lui	%[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"		\
 		"addi	%[__ret],%[__ret], %%lo(" RUNTIME_MAGIC ")\n\t"	\
@@ -47,6 +48,7 @@
 #define RISCV_RUNTIME_CONST_64_PREAMBLE				\
 	".option push\n\t"					\
 	".option norvc\n\t"					\
+	".option norelax\n\t"					\
 	"1:\t"							\
 	"lui	%[__ret], %%hi(" RUNTIME_MAGIC ")\n\t"		\
 	"lui	%[__tmp], %%hi(" RUNTIME_MAGIC ")\n\t"		\

base-commit: 5e601ab3615c86be7c4068ce992f94654693a032
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
