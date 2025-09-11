Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78371CA1016
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drzzJWSPaof5+DjC7yrngFDn18T+VBV2a9Fw1H5tbTk=; b=kLNKe7vjnzFEks
	G6s42NkQ8l22ZGkh24IJ2cfXsh1YrTVrLZ9eTJ3O39r2dvMnLxdPZ1MQ5rq8fNkpbMcr/fSZCzuDg
	Bdjm0GBXTLC0RULWSJDNGtHOWTBdnq6CzKAogeQeqhkKWPHIpkJmcTNkb7elAVq3UW+nASE38F4Hj
	QAl6xadk9ZHJG0MIcLEJRHkfIVExXkAYCCsCChOclV8m7ZUE9G8XAP5xTeec1DeROFBBFpeIMoYqI
	dnNsB2KrcsyWHrp1xzXdSB/983ySdOZW4QgxZ+z4Jcy2ToZU/ab596xP040ac/odCUzMeGbxcLYpy
	lkG6kK0u4FSGGMkpwTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwauG-00000001Gmh-3ZaT;
	Thu, 11 Sep 2025 06:35:44 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwauC-00000001Gge-42W5
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 06:35:43 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CC195683EE;
	Thu, 11 Sep 2025 06:35:38 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 729E41372E;
	Thu, 11 Sep 2025 06:35:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7mSLGrptwmhCTQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 11 Sep 2025 06:35:38 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux.dev,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH 10/14] riscv/paravirt: use common code for paravirt_steal_clock()
Date: Thu, 11 Sep 2025 08:34:29 +0200
Message-ID: <20250911063433.13783-11-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911063433.13783-1-jgross@suse.com>
References: <20250911063433.13783-1-jgross@suse.com>
MIME-Version: 1.0
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: CC195683EE
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_233541_160243_E8440F95 
X-CRM114-Status: GOOD (  11.43  )
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

Remove the arch specific variant of paravirt_steal_clock() and use
the common one instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/riscv/Kconfig                |  1 +
 arch/riscv/include/asm/paravirt.h | 10 ----------
 arch/riscv/kernel/paravirt.c      |  7 -------
 3 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 51dcd8eaa243..8a7573aebaca 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1108,6 +1108,7 @@ config COMPAT
 config PARAVIRT
 	bool "Enable paravirtualization code"
 	depends on RISCV_SBI
+	select HAVE_PV_STEAL_CLOCK_GEN
 	help
 	  This changes the kernel so it can modify itself when it is run
 	  under a hypervisor, potentially improving performance significantly
diff --git a/arch/riscv/include/asm/paravirt.h b/arch/riscv/include/asm/paravirt.h
index 17e5e39c72c0..c49c55b266f3 100644
--- a/arch/riscv/include/asm/paravirt.h
+++ b/arch/riscv/include/asm/paravirt.h
@@ -3,16 +3,6 @@
 #define _ASM_RISCV_PARAVIRT_H
 
 #ifdef CONFIG_PARAVIRT
-#include <linux/static_call_types.h>
-
-u64 dummy_steal_clock(int cpu);
-
-DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
-
-static inline u64 paravirt_steal_clock(int cpu)
-{
-	return static_call(pv_steal_clock)(cpu);
-}
 
 int __init pv_time_init(void);
 
diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index d3c334f16172..5f56be79cd06 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -23,13 +23,6 @@
 #include <asm/paravirt.h>
 #include <asm/sbi.h>
 
-static u64 native_steal_clock(int cpu)
-{
-	return 0;
-}
-
-DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
-
 static bool steal_acc = true;
 static int __init parse_no_stealacc(char *arg)
 {
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
