Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04328C88E50
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 06:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3X8SmQyRYMbR1dvqaORchwnkE1rwot+WweYK7676hcY=; b=KwwbNiT8AKuyZC
	uS4wxRCIByUXMupSZHI2LauDzJkG6vxmKLxBb185r6cD9T+0/WfUScVCluo34ndy4/dYP/rfD84PE
	5YO6/T3s+PS56hYxNm+Ey9Etn2hkKRGNUTUtafGzW66HGjq0cb0QnTcHwiz4UujuBOeHJ3EULSEoo
	UQPkThR7Qwje9Jb3dw9PTmBpf5/36NuyKsdDjniAcX3ZHGgkQL3CthFF4kQVXf4tDCy11D4jB56A9
	t67uoimDAnSkToWQAF+9JGyokJKJdZMBay7NkvHNkIIC35MnU0//yknp4pnknqKHp8QA6zT1xU/J1
	E2tl8yqvMvzTlouNtSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60YF-00000002U7N-0ok5;
	Mon, 14 Sep 2026 06:52:27 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60YB-00000002U6a-3jiR
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 06:52:25 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hjwnH25FZz8XrrJ;
	Mon, 14 Sep 2026 14:52:19 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 68E6q3d9005879;
	Mon, 14 Sep 2026 14:52:04 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 14 Sep 2026 14:52:05 +0800 (CST)
X-Zmail-TransId: 2afa6aa7999509f-2d027
X-Mailer: Zmail v1.0
Message-ID: <20260914145205778-sZJbZc1D-XBfWRXO2f-o@zte.com.cn>
Date: Mon, 14 Sep 2026 14:52:05 +0800 (CST)
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <pjw@kernel.org>, <mikey@neuling.org>
Cc: <jiangfeng@kylinos.cn>, <pjw@kernel.org>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <mikey@neuling.org>, <zhang.yue5@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyXSByaXNjdjogbGliOiBGaXggWkJCIHN0cm5sZW4gd3JhcC1hcm91bmQgcmVncmVzc2lvbiBvbsKgaHVnZSBjb3VudHM=?=
X-MAIL: mse-fl2.zte.com.cn 68E6q3d9005879
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Mon, 14 Sep 2026 14:52:19 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA799A3.001/4hjwnH25FZz8XrrJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_235224_091356_54ACB5B4 
X-CRM114-Status: UNSURE (   9.77  )
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
address space, making the scan equivalent to strlen().  Normal counts
are unaffected.

Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
Acked-by: Michael Neuling <mikey@neuling.org>
---
Changes in v2:
- Point Fixes: at the original implementation (5ba15d419fab) and reword
  the commit message accordingly: the wrap-around exists since the
  original implementation, 5d588c684833 only changed how it surfaces
  (Michael Neuling).
- Add Acked-by from Michael Neuling.

v1: https://lore.kernel.org/all/20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn/

 arch/riscv/lib/strnlen.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
index a8911605c248..2451289ed0f9 100644
--- a/arch/riscv/lib/strnlen.S
+++ b/arch/riscv/lib/strnlen.S
@@ -87,9 +87,19 @@ strnlen_zbb:
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
 	 */
 	add	t4, a0, a1
 	addi	t4, t4, -1
+	bgeu	t4, a0, 1f
+	li	t4, -1
+1:
 	andi	t4, t4, -SZREG

 	/* Get the first word.  */
-- 
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
