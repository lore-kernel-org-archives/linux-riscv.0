Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2DBC61DB9
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ZbGzpUCgizTO65/28xGQz/4vWFZZxz7wkLV3fKQGqA=; b=loyVQk+ZVcluzU
	ScGUq4B7AEy69clZNsMGcc2wxBKDz4eYxfi1Bz5xJ7u5kjyLwRfRIDlO0mySFTo14haGmKo+gU0fA
	QnCoUgtSnq8C/VblJf4HGPkzeXzR52xpJPy/mGzLm+khE/zkHjDI6d0ksv2wufS1KVHcudwMc3nP6
	x26dvnF46OtE0ZOUsUTk1ZYM4+1Nal5r/AXtdKPa3rZ0ao4PKfZLtagTF3fsrDKk9sGFEy5tWLSOT
	yQJfUZzzQVzfpU36HOreaGAja7c77EB5h/I5u7MDJQ2PzF27kbmhtu+Z0NHhQ7ICVtL2JXraX0RVL
	lOSAfQ8BRHwq6tI3L0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqRg-00000005DlA-3IUK;
	Fri, 28 Aug 2026 06:52:12 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqRd-00000005Dke-2ewC
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 06:52:11 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hWTZn5LvVz8Xrrl;
	Fri, 28 Aug 2026 14:52:01 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 67S6poI5046492;
	Fri, 28 Aug 2026 14:51:50 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 28 Aug 2026 14:51:52 +0800 (CST)
X-Zmail-TransId: 2af96a91300891e-d259a
X-Mailer: Zmail v1.0
Message-ID: <20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn>
Date: Fri, 28 Aug 2026 14:51:52 +0800 (CST)
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <pjw@kernel.org>, <mikey@neuling.org>
Cc: <jiangfeng@kylinos.cn>, <pjw@kernel.org>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <mikey@neuling.org>, <zhang.yue5@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSByaXNjdjogbGliOiBGaXggWkJCIHN0cm5sZW4gd3JhcC1hcm91bmQgcmVncmVzc2lvbiBvbiBodWdlIGNvdW50cw==?=
X-MAIL: mse-fl2.zte.com.cn 67S6poI5046492
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 28 Aug 2026 14:52:01 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A913011.002/4hWTZn5LvVz8Xrrl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_235209_835972_9AF09DC7 
X-CRM114-Status: UNSURE (   7.99  )
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

commit 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading past count
boundary") computes the aligned scan boundary from the last valid byte
(s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
strcat/strlcat pass when the destination size is not known at compile
time), s + count wraps around and the aligned boundary lands before s.
The pre-loop guard "bgeu t0, t4, 2f" then always exits for aligned
strings of 8 or more characters, and strnlen() returns 8 instead of
the real length.

This silently truncates strings built by fortified strcat: the dm
sysfs name attribute shows "live-bas" instead of "live-base", the
truncated name pollutes the udev database, and blivet/anaconda (as
well as LVM/dm-crypt/multipath userspace) break on RISC-V systems.

Detect the wrap-around and saturate the boundary to the top of the
address space, making the scan equivalent to strlen().  Normal counts
are unaffected.

Fixes: 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading past count boundary")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
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
