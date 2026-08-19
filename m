Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D9BC5B572
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aUZlRGV4m20vspN1XDbQE4q3sCiDv6scH8FJvKKB2bE=; b=x5aeadZRtvAFC0
	IaAwqWMe7bgO+JOndhVGmEcXFIEg0rMeU2OyxbdN00ynuLOE6IFYJzcXe33uBV9X8Ob7NQr3rUHWb
	PtNSc7x+PwCDoEi8fxakVD3KMKpNsNhFp7QxBBVXvn3xKnHJw/thO0uLnkVXpRi7iOHEYLSpnN+Rc
	/hjetdmCaYr0f+NRssqaxWt2WfGJI8k8to/ZyDpkHLtI/aER6VpNCTsAYl6ZaxTemwfdZoBF2BsSk
	TDZ8C66vfDg+1vn1yc5G5ey/2XwomyMyv/wRQVNsaRXX1HHc4YwuWzaSVg+hwwTl7Pq2L3BcPmd40
	WqzBYFvaS6GbFJP20N5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbVR-00000009IVS-2Ye6;
	Wed, 19 Aug 2026 08:18:41 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbVM-00000009IUp-45EL
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 08:18:39 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hPzwl3PFnz8XrrJ;
	Wed, 19 Aug 2026 16:18:31 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 67J8IIsJ026318;
	Wed, 19 Aug 2026 16:18:18 +0800 (+08)
	(envelope-from gao.rui@zte.com.cn)
Received: from mapi (szxl2zmapp07[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 19 Aug 2026 16:18:21 +0800 (CST)
X-Zmail-TransId: 2b096a8566cd883-ab3fa
X-Mailer: Zmail v1.0
Message-ID: <20260819161821053fNUWuvdGIo4HUBmxlcNfG@zte.com.cn>
Date: Wed, 19 Aug 2026 16:18:21 +0800 (CST)
Mime-Version: 1.0
From: <gao.rui@zte.com.cn>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jiangfeng@kylinos.cn>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSByaXNjdjogbGliOiBGaXggYWRkcmVzcyBvdmVyZmxvdyBkdWUgdG8gbGFyZ2UgY291bnQgdmFsdWVzIGluIHN0cm5sZW4gWkJCIHBhdGg=?=
X-MAIL: mse-fl2.zte.com.cn 67J8IIsJ026318
X-TLS: YES
X-ENVELOPE-SENDER: gao.rui@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 19 Aug 2026 16:18:31 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A8566D7.000/4hPzwl3PFnz8XrrJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_011837_366348_50105F98 
X-CRM114-Status: UNSURE (   9.64  )
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

Hi all,

This patch fixes an issue in the RISC-V ZBB optimized strnlen implementation.

Problem description: When using the ZBB optimized strnlen implementation, passing very large count values (such as SIZE_MAX) can cause address overflow and return incorrect results.

This issue was observed in device-mapper tests:

sh-5.2# dmsetup create testname9 --table "0 8 zero"
sh-5.2# cat /sys/block/dm-*/dm/name
testname
sh-5.2# dmsetup remove testname9

The overflow in strnlen caused failures in string handling during device-mapper operations.

Patch summary:
- Explicitly introduce the strnlen_generic label.
- Simplify the generic implementation loop.
- Add fallback logic in strnlen_zbb to redirect to the generic path when a0 + a1 overflows.
This ensures correct behavior for large count values and SIZE_MAX cases.

Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
---
 arch/riscv/lib/strnlen.S | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
index a8911605c248..04016e51e8b5 100644
--- a/arch/riscv/lib/strnlen.S
+++ b/arch/riscv/lib/strnlen.S
@@ -17,6 +17,7 @@ SYM_FUNC_START(strnlen)
 	__ALTERNATIVE_CFG("nop", "j strnlen_zbb", 0, RISCV_ISA_EXT_ZBB,
 		IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))

+strnlen_generic:

 	/*
 	 * Returns
@@ -27,15 +28,17 @@ SYM_FUNC_START(strnlen)
 	 *   a1 - Max length of string
 	 *
 	 * Clobbers
-	 *   t0, t1, t2
+	 *   t0, t1
 	 */
-	addi	t1, a0, -1
-	add	t2, a0, a1
+	mv	t1, a0
+
 1:
-	addi	t1, t1, 1
-	beq	t1, t2, 2f
+	beqz	a1, 2f
+	addi	a1, a1, -1
 	lbu	t0, 0(t1)
-	bnez	t0, 1b
+	beqz	t0, 2f
+	addi	t1, t1, 1
+	j	1b
 2:
 	sub	a0, t1, a0
 	ret
@@ -73,6 +76,13 @@ strnlen_zbb:
 	/* If maxlen is 0, return 0. */
 	beqz	a1, 3f

+	/*
+	 * Fallback to generic implementation when count is large enough to
+	 * cause address overflow in the ZBB optimized path
+	 */
+	add	t4, a0, a1
+	bltu	t4, a0, strnlen_generic		/* a0 + a1 overflow */
+
 	/* Number of irrelevant bytes in the first word. */
 	andi	t2, a0, SZREG-1

-- 
2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
