Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49672C001DD
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85lScxcHJvuOrmxBm8SjQRkHZt+q3O4ryD+J7Rf9jm8=; b=DnNUatce0p6HKd
	OvbMb8QrKCa7YpiT+xpfR2uUsGI36yjjTP2NiWnr7h+DCunRjxPSMShhVT/x7sBur5RgXOvXgb/YB
	m7Or5u7vH+ww3XGxBFjAXXShIfaNYpziN5gjRwXtDZQMVR6LlRvmNeuYVHj/aGtp8HO2qUN4m1iv0
	LLyKH/m5g4sSBdHdWeUPdu5d9Qz5e1MamzHII2heEvAxyXoXGKo5By2KjS4qohNMyCtZ9+yC1b9Lw
	ONbOWiPF5O/vGbfHXu00APCziX7oAbDFGxWmR0Dp1QXaroEBQAiyLByL3BSv/C3p6u/FTvX2bEnI3
	lOxKwVAOnteDgXGDHsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqdm-0013l1-0W;
	Thu, 29 Jun 2023 12:20:50 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqd3-0012uO-2h;
	Thu, 29 Jun 2023 12:20:10 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CC89C2189A;
	Thu, 29 Jun 2023 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688041202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q1EPhwvEq31eQQzrYtIsQXTt/XpY0djP9Otjk0JmQCc=;
	b=Dub84nZmbr1BGiuBX3aLZCTa/8FoWtNS4BzLIrTk5qvczeKCFX53em1kSbWeLcAyIspbMx
	j6KHULUkYWyNqKDLvuCO97srdnBXPf6V9M5RJtPm/H/f0wvATtksA3VMvLECaNAMn8RMxS
	gxDb1nO4bNmBncRGAjcZ0s/8rYkvx4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688041202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q1EPhwvEq31eQQzrYtIsQXTt/XpY0djP9Otjk0JmQCc=;
	b=3Y1jfeE0PeJBr+WAivUH1Npe9jamuIgzZi4hsiB1oUlsIjSgHaYMy5c5OmGy6U7+S8zHKp
	tX1gbKFXmHiTluBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 59C8213905;
	Thu, 29 Jun 2023 12:20:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EFS5FPJ2nWRlVAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:20:02 +0000
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
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 12/12] fbdev/core: Define empty fb_firmware_edid() in <linux/fb.h>
Date: Thu, 29 Jun 2023 13:45:51 +0200
Message-ID: <20230629121952.10559-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629121952.10559-1-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_052006_036598_15D1996F 
X-CRM114-Status: UNSURE (   9.86  )
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

Move the empty declaration of fb_firmware_edid() to <linux/fb.h>.
Follow common style and avoid the overhead of exporting the symbol.
No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/video/fbdev/core/fbmon.c |  7 +------
 include/linux/fb.h               | 10 +++++++++-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 9ae063021e431..d45bd8a18c2f2 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -1496,13 +1496,8 @@ const unsigned char *fb_firmware_edid(struct fb_info *info)
 
 	return edid;
 }
-#else
-const unsigned char *fb_firmware_edid(struct fb_info *info)
-{
-	return NULL;
-}
-#endif
 EXPORT_SYMBOL(fb_firmware_edid);
+#endif
 
 EXPORT_SYMBOL(fb_parse_edid);
 EXPORT_SYMBOL(fb_edid_to_monspecs);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 5ffd2223326bf..e949532ffc109 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -761,7 +761,6 @@ extern int fb_get_mode(int flags, u32 val, struct fb_var_screeninfo *var,
 extern int fb_validate_mode(const struct fb_var_screeninfo *var,
 			    struct fb_info *info);
 extern int fb_parse_edid(unsigned char *edid, struct fb_var_screeninfo *var);
-extern const unsigned char *fb_firmware_edid(struct fb_info *info);
 extern void fb_edid_to_monspecs(unsigned char *edid,
 				struct fb_monspecs *specs);
 extern void fb_destroy_modedb(struct fb_videomode *modedb);
@@ -774,6 +773,15 @@ extern int of_get_fb_videomode(struct device_node *np,
 extern int fb_videomode_from_videomode(const struct videomode *vm,
 				       struct fb_videomode *fbmode);
 
+#if defined(CONFIG_FIRMWARE_EDID)
+const unsigned char *fb_firmware_edid(struct fb_info *info);
+#else
+static inline const unsigned char *fb_firmware_edid(struct fb_info *info)
+{
+	return NULL;
+}
+#endif
+
 /* drivers/video/modedb.c */
 #define VESA_MODEDB_SIZE 43
 #define DMT_SIZE 0x50
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
