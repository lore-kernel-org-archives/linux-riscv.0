Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AA0CD4F3D
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 23:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4ksGwC9vVQHtYPgTtOeONDCpex9KyEgdf7deWb6uEI=; b=JLpyaFRatut+QJ
	Dy+xhosQHORJH+KmyGoFut/pzntLT0K1SOJuq/JV10A8qNNww6OpfDsIxEnYlke2wojQtl49ClFzM
	DzTq8kcYfyFJHFKAAUMbzE2QvisUVgSHRorQLK4rkgEkWo12tGv+8dXLkGutx7cBnfoh+wd+k+/CM
	X6wa0JbHddna7DYceE1K1kp9ZQfZFPljfKzvT8K+dpom5ciGTM9ZIaHC3LDFQu9qp1Tvk5cCh+w+V
	ebIFasZ+Ga5kTolD5jXjW6Q70YgYbPChKWOm7s141gHRVa6+mtye5Ovnlcm2rNWDH1bfuvo5UAMaM
	y7o1I+VByeVuzyy6maWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOkYT-0000000Dd0o-0ezz;
	Sun, 17 May 2026 23:05:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOkYQ-0000000DczH-3U1Y
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 23:05:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83C7C404B7;
	Sun, 17 May 2026 23:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFE0C4AF0C;
	Sun, 17 May 2026 23:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059150;
	bh=xt/hUeyba8w0CmJ8CXSb6hKOQbJSb9j0i1jLwFA91wA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vclbl3IT3wOblDXpomJab09F4LGnGTE3N74msN0m5v9afiVupdkx4tqBQ+aiGAjIv
	 8hxa/Jkchw+b0Te4x2YL1UsgEL8AyPw95deGcTryQWgICAt8KkNJmMT1UNbBKI7hSt
	 6/4CFyBT6tEFx6XMMawyQ0KYhBDwDSWmNgsC7//MFLMS376T6Y4/a2CKYjDqkVf9RX
	 0kPH8aR1jpItqqdH1vuPcVpr5swJ4GLs76BOqABYr/DFVRU9wA+rQW7ctJ6r54Fxzn
	 3Vm7+HD8/XdRdTMQj+dMR+jxcrTjfVlKw/BXASFKtCZhKCOFyaJR4BqaBe/WRCgE5z
	 /G0Nn4zKnvXyA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:11 -1000
Subject: [PATCH v2 08/16] riscv: Remove tautological condition from
 selection of ARCH_SUPPORTS_CFI
MIME-Version: 1.0
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-8-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272; i=nathan@kernel.org;
 h=from:subject:message-id; bh=xt/hUeyba8w0CmJ8CXSb6hKOQbJSb9j0i1jLwFA91wA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnhvVNZVOtHdfSCnRfhXW+EfikE6T7KH03J7cfrlnh
 VPKJLM6SlkYxLgYZMUUWaofqx43NJxzlvHGqUkwc1iZQIYwcHEKwET2qjIydLmylcT56KWrH82X
 zt31nZ358DXzJsfWrl3HFsgX/GJWYPhf1ueTY8JgeXmr3kSmuhbeF/NXKkzZJb3b000hWcZ67R4
 +AA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_160550_891836_ECFF24BC 
X-CRM114-Status: UNSURE (   8.90  )
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

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the condition of the selection of
CONFIG_ARCH_SUPPORTS_CFI is always true, so it can be removed.

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Kees Cook <kees@kernel.org>
Cc: linux-riscv@lists.infradead.org
Cc: linux-hardening@vger.kernel.org
---
 arch/riscv/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d235396c4514..7ffbf6032b61 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -61,8 +61,7 @@ config RISCV
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
-	# clang >= 17: https://github.com/llvm/llvm-project/commit/62fa708ceb027713b386c7e0efda994f8bdc27e2
-	select ARCH_SUPPORTS_CFI if (!CC_IS_CLANG || CLANG_VERSION >= 170000)
+	select ARCH_SUPPORTS_CFI
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_HUGETLBFS if MMU

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
