Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FEDC05053
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozOv9o67PNVqowMZQJrOwi6aSqjokZ5tpjSt6jgH4oQ=; b=aADvFXaFPVoTxT
	8dAyENAK2kcLvF33KOiRL7eaYrepmt+7cWSbMDbL4axkLAuHpgKi/FIXGNf6qpTUm9DKcLyb3rOFw
	dtgsQSNTlUqu/rYI56kYBLJD5NZHNV/Qr6sH2I2j4QT0hD0ZrmUa8UXS1Wtrf1lDE4SG/Zabd69XB
	DsXkBnwMPBrUlmWcixjBZsD0W0ggTE42yySg82tlSudRN96OXQRXxQstB2fSyi4BbPy2T8oG8Tn3Y
	mbBQj/bQpnImmi7a4AfBxbs5IOyDpAJWUr9fSx1HECdk978w6gv2EEDq5d4iCx2JrxgsT/Uby+bUi
	0NklfBg3GN96LwhNZpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqdD-00133a-09;
	Thu, 29 Jun 2023 12:20:15 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqcz-0012o5-0T;
	Thu, 29 Jun 2023 12:20:04 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4BAC6216DC;
	Thu, 29 Jun 2023 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688041196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXGU5X8lHgcy0xSrc3ZVVAstecW58Mhx3eVBaUQt3EA=;
	b=LkHGO7baJX3zJX0cf+a+c/FoUp4pImvT9g1shyK677YQqnqHTwkq2/nbPfpIMVxGT5xDkj
	aT1pTu4l3b7vpn/6c2VUCblTNZr1fAjD/lJ0StGaPRg75StQdS4Z+R+XnN2JzWnH/E34VU
	zK/QygQuma782ceDLn96pVDkn5oZtOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688041196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXGU5X8lHgcy0xSrc3ZVVAstecW58Mhx3eVBaUQt3EA=;
	b=5mRgVk1/pVfSDoygZItWVKC6R0IzmCwK6ZL98BBiHU3NrlL4mP9k6A6PayShKVnBSPBC2x
	88su8LwJ20TmyWBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD9EE13905;
	Thu, 29 Jun 2023 12:19:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CAVJMet2nWRlVAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:19:55 +0000
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
Subject: [PATCH 02/12] fbdev/sm712fb: Do not include <linux/screen_info.h>
Date: Thu, 29 Jun 2023 13:45:41 +0200
Message-ID: <20230629121952.10559-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629121952.10559-1-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_052001_376461_87B870FA 
X-CRM114-Status: GOOD (  11.44  )
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

Sm712fb's dependency on <linux/screen_info.h> is artificial in that
it only uses struct screen_info for its internals. Replace the use of
struct screen_info with a custom data structure and remove the include
of <linux/screen_info.h>.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Teddy Wang <teddy.wang@siliconmotion.com>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/sm712fb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index b7ad3c644e138..f929091da4e77 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -27,12 +27,17 @@
 #include <linux/uaccess.h>
 #include <linux/module.h>
 #include <linux/console.h>
-#include <linux/screen_info.h>
 
 #include <linux/pm.h>
 
 #include "sm712.h"
 
+struct smtcfb_screen_info {
+	u16 lfb_width;
+	u16 lfb_height;
+	u16 lfb_depth;
+};
+
 /*
  * Private structure
  */
@@ -829,7 +834,7 @@ static const struct modeinit vgamode[] = {
 	},
 };
 
-static struct screen_info smtc_scr_info;
+static struct smtcfb_screen_info smtc_scr_info;
 
 static char *mode_option;
 
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
