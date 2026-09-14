Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C39DC88E50
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yYFx6Dh7W5OGInWirWjLEgaP9fXlLx3hu7RT6wYxUeI=; b=mWoithrixJndoM
	owmO7gAeb4LF+UmARK4aiI4BrIoUx7xS7d+xQyHY2c1iT/9gLZXgs6eTqWhiLBGIBzhejWBOu10c7
	L8AQDCEzVbXG7AtOfBAZADW/y2z1L+8/MPj43aQIk37FG1Disa9P2Gl+fzZg9qgfzDjPnI+w61VsQ
	NsiTRNFEj9OKrit5/eGK0nmbOU9OLe385EqeJa6twDJ6RiGiSjJMm63Umelv16extqhBcXanSUtoz
	6kqbn/X2KMbOrjkuQ8fhRO301HV6JySIsuUsX9hdIhh4srxV/9Olg9zSe7raNbA62Wv2YDxtzdqiL
	KQ4PuwaMSIPYpqeirvJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61wZ-00000002iJ4-26EL;
	Mon, 14 Sep 2026 08:21:39 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61wV-00000002iIO-3wzp
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 08:21:38 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hjymD2zYyz4yjjJ;
	Mon, 14 Sep 2026 16:21:32 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 68E8LKW7034385;
	Mon, 14 Sep 2026 16:21:21 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 14 Sep 2026 16:21:23 +0800 (CST)
X-Zmail-TransId: 2afa6aa7ae83156-d7034
X-Mailer: Zmail v1.0
Message-ID: <20260914162123230u1y1M4UHrO8E-cU-opJ_7@zte.com.cn>
Date: Mon, 14 Sep 2026 16:21:23 +0800 (CST)
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <pjw@kernel.org>, <mikey@neuling.org>
Cc: <jiangfeng@kylinos.cn>, <pjw@kernel.org>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <mikey@neuling.org>, <zhang.yue5@zte.com.cn>,
        <david.laight.linux@gmail.com>
Subject: =?UTF-8?B?W1BBVENIIHYzXSByaXNjdjogbGliOiBGaXggWkJCIHN0cm5sZW4gd3JhcC1hcm91bmQgcmVncmVzc2lvbiBvbsKgaHVnZSBjb3VudHM=?=
X-MAIL: mse-fl1.zte.com.cn 68E8LKW7034385
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 14 Sep 2026 16:21:32 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA7AE8C.000/4hjymD2zYyz4yjjJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_012136_303043_697ACC47 
X-CRM114-Status: GOOD (  13.49  )
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

From: Shao Mingyin <shao.mingyin@zte.com.cn>

The aligned scan boundary is derived from the last valid byte,
(s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
strcat/strlcat pass when the destination size is not known at compile
time), s + count wraps around and the boundary lands before s, so the
ZBB path returns a bogus length.  The original implementation
(5ba15d419fab) had the same wrap-around in its (s + count) & ~7
boundary computation; after 5d588c684833 the wrapped boundary is caught
by the pre-loop guard "bgeu t0, t4, 2f", which then always exits for
aligned strings of 8 or more characters and strnlen() returns 8
instead of the real length.

This silently truncates strings built by fortified strcat: the dm
sysfs name attribute shows "live-bas" instead of "live-base", the
truncated name pollutes the udev database, and blivet/anaconda (as
well as LVM/dm-crypt/multipath userspace) break on RISC-V systems.

Detect the wrap-around and saturate the boundary to the top of the
address space, making the scan equivalent to strlen().  The saturation
is branchless (sltu/mask/or), so the normal path does not carry a taken
branch.  Normal counts are unaffected.

Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
Cc: stable@vger.kernel.org
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
Acked-by: Michael Neuling <mikey@neuling.org>
---
Changes in v3:
- Replace the taken branch in the saturation with a branchless
  sltu/mask/or sequence (David Laight).
- Update the Clobbers list for the additional t5 register.
- Michael's Acked-by is kept: the patch semantics are unchanged, only
  the saturation sequence is branchless now.

Changes in v2:
- Point Fixes: at the original implementation (5ba15d419fab) and reword
  the commit message accordingly: the wrap-around exists since the
  original implementation, 5d588c684833 only changed how it surfaces
  (Michael Neuling).
- Add Acked-by from Michael Neuling.

v2: https://lore.kernel.org/all/20260914145205778-sZJbZc1D-XBfWRXO2f-o@zte.com.cn/
v1: https://lore.kernel.org/all/20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn/

 arch/riscv/lib/strnlen.S | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
index a8911605c248..528ee7995969 100644
--- a/arch/riscv/lib/strnlen.S
+++ b/arch/riscv/lib/strnlen.S
@@ -67,7 +67,7 @@ strnlen_zbb:
 	 *   a1 - Max length of string
 	 *
 	 * Clobbers
-	 *   t0, t1, t2, t3, t4
+	 *   t0, t1, t2, t3, t4, t5
 	 */

 	/* If maxlen is 0, return 0. */
@@ -87,9 +87,22 @@ strnlen_zbb:
 	 * Aligned boundary.  Use the address of the last valid byte
 	 * (s + count - 1) to avoid loading a word past the count
 	 * boundary in the loop below.  count == 0 is handled above.
+	 *
+	 * Saturate the boundary when s + count wraps around (very large
+	 * counts, e.g. SIZE_MAX passed by FORTIFY strcat/strlcat with a
+	 * destination whose size is unknown at compile time).  Without
+	 * this, the wrapped boundary lands before s and the pre-loop
+	 * guard below always exits, returning a truncated length.
+	 * Saturating makes the scan equivalent to strlen().
+	 *
+	 * Keep the saturation branchless so that the normal path does
+	 * not carry a taken branch that could be mispredicted.
 	 */
 	add	t4, a0, a1
 	addi	t4, t4, -1
+	sltu	t5, t4, a0	/* Did s + count wrap around? */
+	sub	t5, zero, t5	/* -1 if wrapped, 0 otherwise */
+	or	t4, t4, t5	/* Saturate to the top of the address space */
 	andi	t4, t4, -SZREG

 	/* Get the first word.  */
-- 
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
