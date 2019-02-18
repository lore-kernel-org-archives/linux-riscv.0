Return-Path: <SRS0=xQFv=QZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81815C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Feb 2019 21:08:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 561DC217F5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Feb 2019 21:08:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jj4A+Y9k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 561DC217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pca9+FXH3PNY7yDqg5weWzDxMFiEqwDvFL4V7oiurM0=; b=jj4A+Y9kj/O34R
	4RlyLs8J3vpJvURFfxU2V2pEHAgaaQh6KXyTKsFe6fIg2j+Wh7k03YnGF2Z4OrFgyJcKH2w/Z7CG+
	lJ86wgPQ1xmlZvXPWTFAk+7K+X0rvdK5hKtJSD1+XehX9ug4y+NG/j6SpTZRuda72J2LVe+bYhA/a
	Hx+aaP/nt+/MdSw0YTWFv0/mbSlSwGszILXcyYnkSyXRwn+v6EvBNP+hiGrsdevWUcJCreo0BZyZT
	NR9jnSlocJ7NOU1ifjIV48bOhGLjuTMIfdCvaIeDxXOz7+JMSXz7SuSifzciCHSymRejaqbyYcHMN
	lFz+w63Nmvcb/TTWSBAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvq9U-0006Nb-6W; Mon, 18 Feb 2019 21:08:36 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvq8n-0005PP-IF; Mon, 18 Feb 2019 21:07:55 +0000
Received: from wuerfel.lan ([109.192.41.194]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MekKJ-1hVzpn14AH-00akyl; Mon, 18 Feb 2019 22:07:30 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org
Subject: [PATCH 8/8] riscv: Use latest system call ABI
Date: Mon, 18 Feb 2019 22:07:12 +0100
Message-Id: <20190218210712.3503891-9-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190218210712.3503891-1-arnd@arndb.de>
References: <20190218210712.3503891-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ScKittBUPbtTQVR0D2l9QJ/Xwbz5RAo/fF1oCAct/9ud6octFcV
 h3yKXHywP14xKDxJaVLEsUWPE3OmqCjnG82aCB4NUdkfbVY7hwv4QqVPvKB1vAHJ19xcaO5
 3xAwwTl6rnM1agEMyLmSR6J//chNkfRHVVpRX4ULBuwjtaigY5FA4YB1h9617BWsOOYJd8J
 fZOQ9NbBzqv5qvep4QBaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o9dJBFc/2PE=:6OUQhfzYWqi4WunWGXaGYB
 f8vS8yA6t8rxXrEjV2+dgiT8v9CkTOE5ltkLO1zfySqpw9H5yP4F0tmidAyGQKJ18jc2Qyp94
 12pypKf9UmKVK0cryzzr6qL/Yd7V+vqidT+8nqsm9QdjbFqAc9oM7DNzuVibjvheQ575PHNon
 Mkcdar5U2VYCW9MNIVaGPXl7REnT6LfBbW7cKOSXDJ5Ueq6q+FqEBKs8oNtXSfKAtkQ6rlLAN
 rJhAaxiN2ekwUPA2db0cmGB6ORpu86ikvL7CCJ6phhyUf18Sj6Z+TlT/Jpe2HRzdBFxRSaYvQ
 DVhHv05ZNrwohLC1oTH7uSavLNKG003rJPSpe1+0gP2g1lBzc3paQSXYX+4pHayuHNOPwyeTt
 G0OOTppm5+VkOO8Duiax8ns/IvgW45ytBJ3BgpkjOjafbeOfmsyjSMoOzLv7IYCk+25Op6WFS
 YBBLvab8oC/VSpr/Kn6RGM+0ag37Y9rpso+qx6z4QOS9k+wtjuSC+9bVcCWGUWN0P253djT0F
 U8R9lm90BTHgXMmBSrCRhNsU8LQ/HJFHjt3A15sYM23jsPlBKWZl8GQeh4KXdeCjaJbGM4kgI
 gjI6yl7I8ImAunRYolHOLl+VULxe9YqMH94pqQHuIuu+TEguAJfxe5f4F4DYeHuKz1sxnZhts
 JD8zXIPwT20T6Or/Fu7ywh3ogDuoLSaL0IxeXGWpKnHv2g1KT62daFuvl0mG/exugc4Oc4PUZ
 HDKrpRF9L+odFkMf/xPku6J4TybLaPqhB2kBrQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_130754_002599_F4489AC8 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: linux-arch@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 arnd@arndb.de, yury.norov@gmail.com, linux-api@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vineet Gupta <vgupta@synopsys.com>,
 Guo Ren <guoren@kernel.org>, Greentime Hu <green.hu@gmail.com>,
 linux-hexagon@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Guan Xuetao <gxt@pku.edu.cn>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We don't yet have an upstream glibc port for riscv, so there is no user
space for the existing ABI, and we can remove the definitions for 32-bit
time_t, off_t and struct resource and system calls based on them,
including the vdso.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/Kconfig                   | 1 -
 arch/riscv/include/uapi/asm/unistd.h | 5 +----
 arch/riscv/kernel/vdso/Makefile      | 2 ++
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 09fa3a87bf30..feeeaa60697c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -11,7 +11,6 @@ config 32BIT
 
 config RISCV
 	def_bool y
-	select ARCH_32BIT_OFF_T if !64BIT
 	# even on 32-bit, physical (and DMA) addresses are > 32-bits
 	select PHYS_ADDR_T_64BIT
 	select OF
diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
index 486a288b454c..0e2eeeb1fd27 100644
--- a/arch/riscv/include/uapi/asm/unistd.h
+++ b/arch/riscv/include/uapi/asm/unistd.h
@@ -17,11 +17,8 @@
 
 #ifdef __LP64__
 #define __ARCH_WANT_NEW_STAT
-#endif /* __LP64__ */
 #define __ARCH_WANT_SET_GET_RLIMIT
-#ifndef __LP64__
-#define __ARCH_WANT_TIME32_SYSCALLS
-#endif
+#endif /* __LP64__ */
 
 #include <asm-generic/unistd.h>
 
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index eed1c137f618..fec62b24df89 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -2,9 +2,11 @@
 
 # Symbols present in the vdso
 vdso-syms  = rt_sigreturn
+ifdef CONFIG_64BIT
 vdso-syms += gettimeofday
 vdso-syms += clock_gettime
 vdso-syms += clock_getres
+endif
 vdso-syms += getcpu
 vdso-syms += flush_icache
 
-- 
2.20.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
