Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A9CEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F94CiidyLeZnci25jpGkgGtUtNa59j8v7XzRa/sn1nU=; b=qEDXR3FN+fNywI
	pegg8BLCSlg/iCfBtObayfm/3Aa7TYmFliUBtjMT9RcQq+lhI0nIId6Hy84O/3QY4PXyOc2E8RtFX
	TOB7n+JJBbTZ9drTiqKh6AxT+mEeYPnbGZnMABd7whIa9ifQ/O2cAZxnwgJq2J6dxCMAurlxnSbHa
	TDkpZs1up8yyd4Yh6LmATaPxwH7T1XF++T0qrK9H3a92Og0FShKmYNdxqtgzf4D1I25+Oag0wpuwY
	QrLkKZX/lhDmIM494zmQ+gXfa+kMbiAQ6AfXdlsxNVBw0pcX7qylJr6dNYK7TWBWQ8VfceYw/ZHHL
	9WofmEXHdYHAWSqAOWnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqdA-00130R-0C;
	Thu, 29 Jun 2023 12:20:12 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqcy-0012oU-2G;
	Thu, 29 Jun 2023 12:20:02 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 52FDB1FD68;
	Thu, 29 Jun 2023 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688041197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VSCnNOTIHcBHYP1H47mhSWWMU/cUgjzIXzIZqp//59s=;
	b=JGOebDL4XjP7zTfKng4P+h6jtTTgakd2fjixPEvmz/HdvzbYOg1LD8peXmLP0KwXI3FUzx
	9ccjQzWoVuNCFHnkDDDbq3+AKuSJLX39AmuIZpfRBb96CPOqEJ5FQ7RbtqMNbiFXZeA/wl
	pCwVkAFVOTNLvMhnEKrzdAem0Ahs6hE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688041197;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VSCnNOTIHcBHYP1H47mhSWWMU/cUgjzIXzIZqp//59s=;
	b=PW/o667y7EHsEjtoqDiPRKJQ3VACKqdZligZ3HBaVCmmMwC0zrBZm6NldMzu/wXTM544nR
	IeOPLeAMnpTux8Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D192513905;
	Thu, 29 Jun 2023 12:19:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wNs2Mux2nWRlVAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:19:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arch@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>
Subject: [PATCH 04/12] staging/sm750fb: Do not include <linux/screen_info.h>
Date: Thu, 29 Jun 2023 13:45:43 +0200
Message-ID: <20230629121952.10559-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629121952.10559-1-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_052000_941382_56095B18 
X-CRM114-Status: UNSURE (   8.79  )
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

The sm750fb driver does not need anything from <linux/screen_info.h>.
Remove the include statements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Teddy Wang <teddy.wang@siliconmotion.com>
---
 drivers/staging/sm750fb/sm750.c        | 1 -
 drivers/staging/sm750fb/sm750_accel.c  | 1 -
 drivers/staging/sm750fb/sm750_cursor.c | 1 -
 drivers/staging/sm750fb/sm750_hw.c     | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 55e302a27847d..c260f73cf570a 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -14,7 +14,6 @@
 #include <linux/mm_types.h>
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
-#include <linux/screen_info.h>
 #include <linux/console.h>
 
 #include "sm750.h"
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 24b9077a634a6..44b9e3fe3a41d 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -14,7 +14,6 @@
 #include <linux/pagemap.h>
 #include <linux/console.h>
 #include <linux/platform_device.h>
-#include <linux/screen_info.h>
 
 #include "sm750.h"
 #include "sm750_accel.h"
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index 43e6f52c2551f..eea4d1bd36ce7 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -14,7 +14,6 @@
 #include <linux/pagemap.h>
 #include <linux/console.h>
 #include <linux/platform_device.h>
-#include <linux/screen_info.h>
 
 #include "sm750.h"
 #include "sm750_cursor.h"
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 55cb00e8b0d1c..71247eaf26eef 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -17,7 +17,6 @@
 #include <asm/mtrr.h>
 #endif
 #include <linux/platform_device.h>
-#include <linux/screen_info.h>
 #include <linux/sizes.h>
 
 #include "sm750.h"
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
