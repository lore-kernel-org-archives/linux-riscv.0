Return-Path: <SRS0=tyFd=RF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C3CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2019 08:30:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D16152085A
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2019 08:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V8JcQhfF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXcsaFVN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D16152085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NVUtX+Hn0uaZBpPd1CP7E+GFOXnaHrlYYUCBSx5zM6c=; b=V8JcQhfFSfIJNi
	Fd6sBZuRrGFs02CZ33FF1zYoZe54nQX7e3aoMvNIPZPRKruSmuPLw9mTFyAivz7kwMQzTwfsYxdzO
	dSuIYIF1Hy9WBReG31SgEUYdcF7Vwe5x4xsIOzfoO8Iz2dNgHrQRgUI3WaD7Lqx+mnugJPDxfppqs
	4kANv+TgLuvsxJ87ONVl1N5o6ZmhKW1bRSM0iuhkSDFYLiGqN7AywFgNDAKERSps7iSOcggmPMBV/
	kvquPnj4usr67ctNr/aRDd6oX9q9SY/WIKTPWFOmxetFUzKzUeMH71piVghRnXuS3k9SSO6e2SKiU
	iv7S5rwYwjqpTLaxWn2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h002I-0000nG-TT; Sat, 02 Mar 2019 08:30:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h002F-0000mp-Ux
 for linux-riscv@lists.infradead.org; Sat, 02 Mar 2019 08:30:21 +0000
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 069852085A;
 Sat,  2 Mar 2019 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1551515419;
 bh=UGxqqZ3WB7P0o3Fpml8xwCPBgYV1FDEPI++DNHuVoLI=;
 h=Subject:To:Cc:From:Date:From;
 b=oXcsaFVNqsFwOKksa+q+Um2vOOdUeqxBqH5m4blxsHZEQQsyv4UKg5QZwLxT6h+VW
 dS0PpuI7xSn5ZQv8SJFpxRy0SGoWRrhhgvXTp6TL04JLUZ8QXQqlsCkULV27DcB2Pl
 nu9L5Y7MU53wOQaJFWXx0WPyUKoybzb7t11IDbJA=
Subject: Patch "MIPS: fix truncation in __cmpxchg_small for short values" has
 been added to the 4.19-stable tree
To: gregkh@linuxfoundation.org, linux-mips@linux-mips.org,
 linux-riscv@lists.infradead.org, michaeljclark@mac.com,
 patches@groups.riscv.org, paul.burton@mips.com
From: <gregkh@linuxfoundation.org>
Date: Sat, 02 Mar 2019 09:30:06 +0100
Message-ID: <15515154068204@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190302_003020_022076_CC41C586 
X-CRM114-Status: GOOD (  12.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    MIPS: fix truncation in __cmpxchg_small for short values

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mips-fix-truncation-in-__cmpxchg_small-for-short-values.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 94ee12b507db8b5876e31c9d6c9d84f556a4b49f Mon Sep 17 00:00:00 2001
From: Michael Clark <michaeljclark@mac.com>
Date: Mon, 11 Feb 2019 17:38:29 +1300
Subject: MIPS: fix truncation in __cmpxchg_small for short values

From: Michael Clark <michaeljclark@mac.com>

commit 94ee12b507db8b5876e31c9d6c9d84f556a4b49f upstream.

__cmpxchg_small erroneously uses u8 for load comparison which can
be either char or short. This patch changes the local variable to
u32 which is sufficiently sized, as the loaded value is already
masked and shifted appropriately. Using an integer size avoids
any unnecessary canonicalization from use of non native widths.

This patch is part of a series that adapts the MIPS small word
atomics code for xchg and cmpxchg on short and char to RISC-V.

Cc: RISC-V Patches <patches@groups.riscv.org>
Cc: Linux RISC-V <linux-riscv@lists.infradead.org>
Cc: Linux MIPS <linux-mips@linux-mips.org>
Signed-off-by: Michael Clark <michaeljclark@mac.com>
[paul.burton@mips.com:
  - Fix varialble typo per Jonas Gorski.
  - Consolidate load variable with other declarations.]
Signed-off-by: Paul Burton <paul.burton@mips.com>
Fixes: 3ba7f44d2b19 ("MIPS: cmpxchg: Implement 1 byte & 2 byte cmpxchg()")
Cc: stable@vger.kernel.org # v4.13+
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/mips/kernel/cmpxchg.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/arch/mips/kernel/cmpxchg.c
+++ b/arch/mips/kernel/cmpxchg.c
@@ -54,10 +54,9 @@ unsigned long __xchg_small(volatile void
 unsigned long __cmpxchg_small(volatile void *ptr, unsigned long old,
 			      unsigned long new, unsigned int size)
 {
-	u32 mask, old32, new32, load32;
+	u32 mask, old32, new32, load32, load;
 	volatile u32 *ptr32;
 	unsigned int shift;
-	u8 load;
 
 	/* Check that ptr is naturally aligned */
 	WARN_ON((unsigned long)ptr & (size - 1));


Patches currently in stable-queue which might be from michaeljclark@mac.com are

queue-4.19/mips-fix-truncation-in-__cmpxchg_small-for-short-values.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
