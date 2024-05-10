Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94548C25B10
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 06:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bD0MYWzhCmDa1CJdL0mT0dDDwCcarPSreuv0NfDzNN4=; b=AK9vGvVpkPO4FR
	msGMc+2ZaISLvbEpjaAsOcmr4jcKJXEGREOdZNDZFggj9YPdZBErFNQb5L2HXhqKEcVo+I2j/2c7L
	GCZLWUHi7oU7D881MQ0ief8++WYxRj84hANXaSbeqlg9HW36nqUnYotQt+vK759RqnIMNemSLs3ra
	0jelAQnGzgkwfUb3nXC8Cxw1dqcd4WMv0B0bEzRanQMjxpdm87j2Rl1cGpI5iwH40tlYp56unEK+N
	9NcbYW0wX+8wpRkesQjP8i094/6gYAhABegn0Ldb9epyNQ69gr1LmaRL6iGcxjJ4Wj/TiavM81b1W
	pUvICfHy9vCNvhe8sggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Jkp-00000004DKm-1izZ;
	Fri, 10 May 2024 06:29:15 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5JkV-00000004DFL-3HDi
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 06:29:01 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEdNR+tmiFh46glcNjBAzC77FOgymIT0T+/PVLfSL7s=;
	b=KlKiMcipyRc94KL8iUYbRAzqDlI4zs8Xq0+0noofqJFZ6+Z03rsQ/tF4lJiwSmnNfts+sU
	8VgiEbilBeb7VrQ1a4GLCg4nvx71oFzY60FJ8tiGoXdIc93bIDWulindNSZnSJfMQ+tkCh
	NQz+rdc35AIjljgR/yO2l6Uw9QVhAQtXnGKob3ZV28kguARX9tRT5SZL2dL1Qjk9Ub7Cde
	S1Enlqs49Y3EIlnKR+RdNQMFOvnxm6jsNl+Iq0ixzJR6X6bAOLH1khk5XuANTCRhWf9jJm
	ZPvasPVrCo//Ei8sYPI684zb2CwJPnUb/w+mqTkhMpuRZQT6Knf+kVjHztz/Ug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEdNR+tmiFh46glcNjBAzC77FOgymIT0T+/PVLfSL7s=;
	b=2loGTuDozASFvZvntEdkPWBdOcoOTNEpZ1di8OoSUp64VqGnYUJCfO7Qaj0Z0rr2ckLMSB
	JV/o/a3JJ/+/jPBQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 3/7] riscv: drop the use of XIP_OFFSET in XIP_FIXUP_OFFSET
Date: Fri, 10 May 2024 08:28:41 +0200
Message-Id: <e18d9e8e3540098617d8f5b14859158a63b78594.1715286093.git.namcao@linutronix.de>
In-Reply-To: <cover.1715286093.git.namcao@linutronix.de>
References: <cover.1715286093.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_232855_999329_48CBD0BF 
X-CRM114-Status: GOOD (  11.64  )
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

XIP_OFFSET is the hard-coded offset of writable data section within the
kernel.

By hard-coding this value, the read-only section of the kernel (which is
placed before the writable data section) is restricted in size.

As a preparation to remove this hard-coded macro XIP_OFFSET entirely, stop
using XIP_OFFSET in XIP_FIXUP_OFFSET. Instead, use CONFIG_PHYS_RAM_BASE and
_sdata to do the same thing.

While at it, also add a description for XIP_FIXUP_OFFSET.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/xip_fixup.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/xip_fixup.h b/arch/riscv/include/asm/xip_fixup.h
index b65bf6306f69..9ed2cfae09e0 100644
--- a/arch/riscv/include/asm/xip_fixup.h
+++ b/arch/riscv/include/asm/xip_fixup.h
@@ -9,8 +9,19 @@
 
 #ifdef CONFIG_XIP_KERNEL
 .macro XIP_FIXUP_OFFSET reg
-        REG_L t0, _xip_fixup
+	/* Fix-up address in Flash into address in RAM early during boot before
+	 * MMU is up. Because generated code "thinks" data is in Flash, but it
+	 * is actually in RAM (actually data is also in Flash, but Flash is
+	 * read-only, thus we need to use the data residing in RAM).
+	 *
+	 * The start of data in Flash is _sdata and the start of data in RAM is
+	 * CONFIG_PHYS_RAM_BASE. So this fix-up essentially does this:
+	 * reg += CONFIG_PHYS_RAM_BASE - _start
+	 */
+	li t0, CONFIG_PHYS_RAM_BASE
         add \reg, \reg, t0
+	la t0, _sdata
+	sub \reg, \reg, t0
 .endm
 .macro XIP_FIXUP_FLASH_OFFSET reg
 	la t0, __data_loc
@@ -19,7 +30,6 @@
 	add \reg, \reg, t0
 .endm
 
-_xip_fixup: .dword CONFIG_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - XIP_OFFSET
 _xip_phys_offset: .dword CONFIG_XIP_PHYS_ADDR + XIP_OFFSET
 #else
 .macro XIP_FIXUP_OFFSET reg
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
