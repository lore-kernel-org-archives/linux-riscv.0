Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8888FD730B7
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dd4OMwZtiTvLJzpHKhprul0Cv0ZfSDCy41jM9iCqh6A=; b=yFVDw1q0k8TSOZCQI+qUGLCAS4
	QIUVaZNe8Vlhj7u89VMQL028zlerlBrfFh53eXDJ1Mxn0iTrq7vKmxFS35SdA0wD2FKx4FWUDv70b
	WG3pe1Y4Pag/n4uAtUDFGcS4uPsTYo61VsGX45KzVhzmdGuvXOJBCP458CDKiQPQd9HOtwsBs6/Ot
	RrDxCcV/cy1sNDx9dvqo6QKBAoK33VyQ51PWpZbQQkVehlC24YXaAVfOSjHNX1Jwmqq7js/NbNeeH
	0USiQ7osZNmI+F2hlPbPZpZLtlopF/NpYalYfoKhnL8jQypbqRElWQIu7z42kkB+eovoiW5pS09ou
	OHVIpSgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZO6-00000001fEw-2RlW;
	Fri, 03 Apr 2026 07:56:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZO3-00000001fEY-2Thv
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 07:56:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C1F54418A;
	Fri,  3 Apr 2026 07:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6966C4CEF7;
	Fri,  3 Apr 2026 07:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775202974;
	bh=QWX7ACF7MfXiV09SgQFh5qTQ4GTnVw2pFbefikFwxHM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RYkX0eCLaOz2UKmv8BN/qj5xcBj3JvnnYLQ3uxqHcQiX8WGcCmlhECw883H/ppOy/
	 D0vXDvg7uuwOOMugCJwUkuaHu5pDU9F3QOxwLNuG3QYSHdgPj7j5BR+Xkm4xBFjBkw
	 NzCUiGyK/VMUrPUBs7K/zxhLnO7cI/xNsWZWusOTm4j7P0zxLWRjC1gMv7cifHGmjR
	 tpcp+xp/khyaZ3iQaki04GhWefZrtrxgsTLPSAGeTL2ix5M+0pd5nOnMztLtroE+rB
	 gTCxXHzEmF2v9PsgeSjkVj/4CvDmUA41Mjxn6SfufPVdtfN7EdFa2lTKejbBe0FSql
	 A/kpWBcbLRGWA==
Date: Fri, 3 Apr 2026 01:56:12 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andreas Schwab <schwab@suse.de>
cc: Michael Neuling <mikey@neuling.org>, pjw@kernel.org, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, alex@ghiti.fr, debug@rivosinc.com, 
    thecharlesjenkins@gmail.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ptrace: avoid BIT() in UAPI header
In-Reply-To: <mvmjyutivg6.fsf@suse.de>
Message-ID: <52d5b30d-c15e-2dca-110d-d1ff78898c23@kernel.org>
References: <20260330024248.449292-1-mikey@neuling.org> <mvmjyutivg6.fsf@suse.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1642680336-1775202974=:2029891"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_005615_754018_499B65A3 
X-CRM114-Status: GOOD (  18.01  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1642680336-1775202974=:2029891
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 30 Mar 2026, Andreas Schwab wrote:

> On Mär 30 2026, Michael Neuling wrote:
> 
> > BIT() is not available in UAPI headers — the installed linux/bits.h
> > (UAPI version) does not define it. Replace BIT() with open-coded
> > (1UL << x) which is the standard practice for UAPI headers, and drop
> > the linux/bits.h include that was added by commit 98545620b0 ("riscv:
> > ptrace: Fix BIT() compilation issues").
> 
> There is also the _BITUL macro, which may be preferable.

Thanks everyone.  Below is what I ended up with.  I'll drop Charlie's two 
patches to avoid churn.


- Paul

From: Paul Walmsley <pjw@kernel.org>
Date: Thu, 2 Apr 2026 17:18:03 -0600
Subject: [PATCH] riscv: use _BITUL macro rather than BIT() in ptrace uapi and
 kselftests

Fix the build of non-kernel code that includes the RISC-V ptrace uapi
header, and the RISC-V validate_v_ptrace.c kselftest, by using the
_BITUL() macro rather than BIT().  BIT() is not available outside
the kernel.

Based on patches and comments from Charlie Jenkins, Michael Neuling,
and Andreas Schwab.

Fixes: 30eb191c895b ("selftests: riscv: verify ptrace rejects invalid vector csr inputs")
Fixes: 2af7c9cf021c ("riscv/ptrace: expose riscv CFI status and state via ptrace and in core files")
Cc: Andreas Schwab <schwab@suse.de>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>
Link: https://patch.msgid.link/20260330024248.449292-1-mikey@neuling.org
Link: https://lore.kernel.org/linux-riscv/20260309-fix_selftests-v2-1-9d5a553a531e@gmail.com/
Link: https://lore.kernel.org/linux-riscv/20260309-fix_selftests-v2-3-9d5a553a531e@gmail.com/
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/uapi/asm/ptrace.h                | 13 +++++++------
 .../selftests/riscv/vector/validate_v_ptrace.c      |  4 ++--
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 18988a5f1a63..70a74adad914 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -9,6 +9,7 @@
 #ifndef __ASSEMBLER__
 
 #include <linux/types.h>
+#include <linux/const.h>
 
 #define PTRACE_GETFDPIC		33
 
@@ -138,12 +139,12 @@ struct __sc_riscv_cfi_state {
 #define PTRACE_CFI_SS_LOCK_BIT	4
 #define PTRACE_CFI_SS_PTR_BIT	5
 
-#define PTRACE_CFI_LP_EN_STATE		BIT(PTRACE_CFI_LP_EN_BIT)
-#define PTRACE_CFI_LP_LOCK_STATE	BIT(PTRACE_CFI_LP_LOCK_BIT)
-#define PTRACE_CFI_ELP_STATE		BIT(PTRACE_CFI_ELP_BIT)
-#define PTRACE_CFI_SS_EN_STATE		BIT(PTRACE_CFI_SS_EN_BIT)
-#define PTRACE_CFI_SS_LOCK_STATE	BIT(PTRACE_CFI_SS_LOCK_BIT)
-#define PTRACE_CFI_SS_PTR_STATE		BIT(PTRACE_CFI_SS_PTR_BIT)
+#define PTRACE_CFI_LP_EN_STATE		_BITUL(PTRACE_CFI_LP_EN_BIT)
+#define PTRACE_CFI_LP_LOCK_STATE	_BITUL(PTRACE_CFI_LP_LOCK_BIT)
+#define PTRACE_CFI_ELP_STATE		_BITUL(PTRACE_CFI_ELP_BIT)
+#define PTRACE_CFI_SS_EN_STATE		_BITUL(PTRACE_CFI_SS_EN_BIT)
+#define PTRACE_CFI_SS_LOCK_STATE	_BITUL(PTRACE_CFI_SS_LOCK_BIT)
+#define PTRACE_CFI_SS_PTR_STATE		_BITUL(PTRACE_CFI_SS_PTR_BIT)
 
 #define PRACE_CFI_STATE_INVALID_MASK	~(PTRACE_CFI_LP_EN_STATE | \
 					  PTRACE_CFI_LP_LOCK_STATE | \
diff --git a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
index 3589549f7228..7ae6fede496f 100644
--- a/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
+++ b/tools/testing/selftests/riscv/vector/validate_v_ptrace.c
@@ -346,8 +346,8 @@ FIXTURE_TEARDOWN(v_csr_invalid)
 {
 }
 
-#define VECTOR_1_0		BIT(0)
-#define XTHEAD_VECTOR_0_7	BIT(1)
+#define VECTOR_1_0		_BITUL(0)
+#define XTHEAD_VECTOR_0_7	_BITUL(1)
 
 #define vector_test(x)		((x) & VECTOR_1_0)
 #define xthead_test(x)		((x) & XTHEAD_VECTOR_0_7)
-- 
2.51.0

--8323329-1642680336-1775202974=:2029891
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1642680336-1775202974=:2029891--

