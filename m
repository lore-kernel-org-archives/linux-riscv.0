Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D5CC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 07:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mBgNMsqR8Znqzohv2U2U+siHqGM4su+VUbZkQ6Hxfc=; b=Gc+iHfkMs2f9kZ
	46n5+n0YAMfc+S4QO4gEhOAajJH24zxpo5KDj0GE8tHsaSWcuLNaHN+88OpSmJwdWH7e+oAM0pq+U
	ZtD30C0045vIX6yiiwC2MYOyY6cfTtMEJ0PPvC+vuLLXkt63Yab0+gJkX+Dh5RywNtIR6Ppv7RozS
	eST31e93/4O5D9wElJ/NfgEYKlBETAf8koUztvIbXdtey/dglZlJWnXIQ0CskOPM+3IkO9N+yNdy9
	3ZlxT3CyelTkdAUHEQACzbl1GGfKZl01N19S1rBnKcwSXmN7YTLQsIOpJRz+I+Q8HlRpziNmLGnUv
	SGaEe+W69H//oHiolwqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Kk5-00000004N9N-1AgY;
	Fri, 10 May 2024 07:32:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Jkc-00000004DHS-2Ubs
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 06:29:25 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMWfkp27OznWlNQgIqa8Ut1fqRBqjArqo7o6O8rXF3c=;
	b=D1+hk+OF8UMJ50ThKBUE/5x7fCrbI/A2VHxlcQXj5+opl/L9Lk/wssXdHNpOgyOpCrqe7k
	RK6UgKFvxiW3XSxDiHHtFo2/mo483XtcXG7rMPHNzKEMIrmwRond3J5kZ4uDNycQ5zy/tp
	re+TU7xKG5Kk5Y8fNdyMPRki9A9iPsqtcuqA/4C5Da6oKfVrHKdEeTeA7O4QcaFAmEqSnn
	gOS8YRgnY9p+lJvyUGMLVbwhfHXz/2t7uk27WLmpqO8wVTnTfCOelYrP4c09t7hiDNwINl
	Mu8Y+cYo3eiAtamovp7FrUmzLSilwK+QDp6DcnsCGIkHjSVbewY4JmptMgO8Lg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMWfkp27OznWlNQgIqa8Ut1fqRBqjArqo7o6O8rXF3c=;
	b=v/A+xlArdYtI8vanKBB9Z10cB1sPT4MYU2/62wU/eaFnr2Jy6vRwv/Wc+8oV6dpwWNpzIR
	xox45WumTacghaDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 7/7] riscv: remove limit on the size of read-only section for XIP kernel
Date: Fri, 10 May 2024 08:28:45 +0200
Message-Id: <9eea4b61f7b6300def3b6582d8e465ef4207501e.1715286093.git.namcao@linutronix.de>
In-Reply-To: <cover.1715286093.git.namcao@linutronix.de>
References: <cover.1715286093.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_232912_367906_B18C0310 
X-CRM114-Status: GOOD (  11.52  )
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
placed before the writable data section) is restricted in size. This causes
build failures if the kernel get too big (an example is in Closes:).

Remove this limit.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404211031.J6l2AfJk-lkp@intel.com/
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/pgtable.h    | 7 -------
 arch/riscv/kernel/vmlinux-xip.lds.S | 4 ++--
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index fbf342f4afee..75f4a92ea5bb 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -104,13 +104,6 @@
 
 #endif
 
-#ifdef CONFIG_XIP_KERNEL
-#define XIP_OFFSET		SZ_32M
-#define XIP_OFFSET_MASK		(SZ_32M - 1)
-#else
-#define XIP_OFFSET		0
-#endif
-
 #ifndef __ASSEMBLY__
 
 #include <asm/page.h>
diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
index 8c3daa1b0531..01f73f2ffecc 100644
--- a/arch/riscv/kernel/vmlinux-xip.lds.S
+++ b/arch/riscv/kernel/vmlinux-xip.lds.S
@@ -65,10 +65,10 @@ SECTIONS
  * From this point, stuff is considered writable and will be copied to RAM
  */
 	__data_loc = ALIGN(PAGE_SIZE);		/* location in file */
-	. = KERNEL_LINK_ADDR + XIP_OFFSET;	/* location in memory */
+	. = ALIGN(SZ_2M);			/* location in memory */
 
 #undef LOAD_OFFSET
-#define LOAD_OFFSET (KERNEL_LINK_ADDR + XIP_OFFSET - (__data_loc & XIP_OFFSET_MASK))
+#define LOAD_OFFSET (KERNEL_LINK_ADDR + _sdata - __data_loc)
 
 	_sdata = .;			/* Start of data section */
 	_data = .;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
