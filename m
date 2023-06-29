Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42377C0502B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pxst0uGLn6yFD75EEKCqMIZt+teik/uEP643lfFmK7s=; b=v6YSIyL/hw3u1F
	6qeGzED+lzwN5dRLuA0ObGrlZOgN76yktNJr3SR7Anm+zBRLOLFksmNfrggwjBS8TTuYULPzHPR59
	791G2OSuaSEMDF+4tY7XynCWH6wFgBxLMnGVL6unSVX+Td/AlZveNMQ5d4j/R9OiM3UfXjkiz9wqv
	/rnUDyVtyihr7RpiYbqZ+bcEdGCIAyfP2Z9dO7jmSxiwIQteW4CcRFqF7oSeMsi4Qc44Nzk7z/gur
	earDV83TsIBG+Nu9gb+tuJX7+bkateVUSLr/Cq5Z0vwEjjifmHd5ReaSiTRk2zmiO6I5M95uy+9+t
	4QLTqAg1v/m8BbJqoX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqdT-0013MQ-13;
	Thu, 29 Jun 2023 12:20:31 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqd1-0012sZ-1s;
	Thu, 29 Jun 2023 12:20:08 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 524A81FD69;
	Thu, 29 Jun 2023 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688041202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8M3t+sIilpS+dvhDHVydT9EOWn+SooUMabnf/LFMHbo=;
	b=ZbROsLIJAkfIR/+jRVLDcd83SvH5cZmugk8kZwgL9JSMI/gKbyQR3HtKCm4o42ShuZpYkk
	PpOlJkUDBbcOuQ/YbZW1LarrlsmuvA7IRfwyIlPCdp7XjLFZCUf5QkBgkeK4CAQiyu6q+p
	rHluDhQg1B0za6ZvhP208NqkrxcQvWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688041202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8M3t+sIilpS+dvhDHVydT9EOWn+SooUMabnf/LFMHbo=;
	b=3Hj6UbEAQMoFiqqs75ilDIpvJONgA2he7Vj193adp37UYAYmUsCXwiE0RCS1+n5Jev4Itq
	c8ZFL5Xhnj0s4yAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D74B113905;
	Thu, 29 Jun 2023 12:20:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8BuiM/F2nWRlVAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:20:01 +0000
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
Subject: [PATCH 11/12] fbdev/core: Protect edid_info with CONFIG_ARCH_HAS_EDID_INFO
Date: Thu, 29 Jun 2023 13:45:50 +0200
Message-ID: <20230629121952.10559-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629121952.10559-1-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_052003_794526_C2ACF12D 
X-CRM114-Status: GOOD (  11.24  )
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

Guard usage of edid_info with CONFIG_ARCH_HAS_EDID_INFO instead
of CONFIG_X86. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/video/fbdev/core/fbmon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 35be4431f649a..9ae063021e431 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -1480,17 +1480,19 @@ int fb_validate_mode(const struct fb_var_screeninfo *var, struct fb_info *info)
 		-EINVAL : 0;
 }
 
-#if defined(CONFIG_FIRMWARE_EDID) && defined(CONFIG_X86)
+#if defined(CONFIG_FIRMWARE_EDID)
 const unsigned char *fb_firmware_edid(struct fb_info *info)
 {
 	unsigned char *edid = NULL;
 
+#if defined(CONFIG_ARCH_HAS_EDID_INFO)
 	/*
 	 * We need to ensure that the EDID block is only
 	 * returned for the primary graphics adapter.
 	 */
 	if (fb_is_primary_device(info))
 		edid = edid_info.dummy;
+#endif
 
 	return edid;
 }
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
