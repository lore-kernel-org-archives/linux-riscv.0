Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F47D11184
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 16:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9sgMluBUat5e/r/qSdLBkTVDdA9V5ubDmZXULBTET4=; b=XgcIVEmbQ+nlF4
	uq0EK9dbRhKrJXnVuB0n19Ht07AhnduChgPZRsA+SGxWtASVbKZIQgKLOLUJnXW0Te+Uy/GXdHtxp
	zQJfbVjkR85snAVnq9s/55HW0butZ0oOq1nWR2hPC73dOJLWm9lnPTJx5fmvhGjSkyGqioX6E9w6V
	N1iV3hYemQtHLBcaNaVX+mmrw+bG3DOOIF0YceQUR0RgqFAL8A1v40A0hC4F7GjWHv/cpkB3+PYjD
	m21HIhgzqrxUnEBAhAfluoZfr5gNGSz/Y3QZrJQ50jf44vgR+HEl3vA/vg5lRKK/NiETDZJr5+BoT
	TeY5g5VVxX+CTLaGSXQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI59-0000000FFX7-0j8f;
	Wed, 26 Nov 2025 16:09:27 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOI51-0000000FFN3-22RY
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 16:09:24 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BD778336FF;
	Wed, 26 Nov 2025 16:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764173342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=;
	b=Wpkbnc+k0kKvvGOiKFASknuCHCqghjFClurIlEXzjxaFqHELVQ18ekmIH7pnuJeBJLQ407
	pTIer8/y3bJVQ5gKGqrvsUfQ1GjTXzxbewPHof9trj42nfZ30iz/SnI+CZwHhSTEK3x1Z5
	2mFAAO2WcFoKtQ6dPTC9uOV/rZ+zstg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764173342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=;
	b=bgtGCIKZh4CqvNCsVl3HJZm+x/P4Cw5EpAZOcFW5B2qfb5488B7Cx5DD8qKd/IedRsBRKh
	FUMBQrGf+RdadgBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764173342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=;
	b=Wpkbnc+k0kKvvGOiKFASknuCHCqghjFClurIlEXzjxaFqHELVQ18ekmIH7pnuJeBJLQ407
	pTIer8/y3bJVQ5gKGqrvsUfQ1GjTXzxbewPHof9trj42nfZ30iz/SnI+CZwHhSTEK3x1Z5
	2mFAAO2WcFoKtQ6dPTC9uOV/rZ+zstg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764173342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=;
	b=bgtGCIKZh4CqvNCsVl3HJZm+x/P4Cw5EpAZOcFW5B2qfb5488B7Cx5DD8qKd/IedRsBRKh
	FUMBQrGf+RdadgBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FF643EA65;
	Wed, 26 Nov 2025 16:09:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EG4aEh4mJ2lnIgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 26 Nov 2025 16:09:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org,
	javierm@redhat.com,
	arnd@arndb.de,
	richard.lyu@suse.com,
	helgaas@kernel.org
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 7/9] efi: Refactor init_primary_display() helpers
Date: Wed, 26 Nov 2025 17:03:24 +0100
Message-ID: <20251126160854.553077-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
References: <20251126160854.553077-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLykjg6e7ifkwtw7jmpw7b9yio)];
	RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_080920_974653_37679E64 
X-CRM114-Status: GOOD (  12.91  )
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

Rework the kernel's init_primary_display() helpers to allow for later
support of additional config-table entries and EDID information. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/loongarch/kernel/efi.c     | 22 +++++++++++-----------
 drivers/firmware/efi/efi-init.c | 19 ++++++++++---------
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/loongarch/kernel/efi.c b/arch/loongarch/kernel/efi.c
index 638a392d2cd2..1ef38036e8ae 100644
--- a/arch/loongarch/kernel/efi.c
+++ b/arch/loongarch/kernel/efi.c
@@ -81,19 +81,19 @@ EXPORT_SYMBOL_GPL(sysfb_primary_display);
 
 static void __init init_primary_display(void)
 {
-	struct screen_info *si;
-
-	if (screen_info_table == EFI_INVALID_TABLE_ADDR)
-		return;
-
-	si = early_memremap(screen_info_table, sizeof(*si));
-	if (!si) {
-		pr_err("Could not map screen_info config table\n");
+	if (screen_info_table == EFI_INVALID_TABLE_ADDR) {
+		struct screen_info *si = early_memremap(screen_info_table, sizeof(*si));
+
+		if (!si) {
+			pr_err("Could not map screen_info config table\n");
+			return;
+		}
+		sysfb_primary_display.screen = *si;
+		memset(si, 0, sizeof(*si));
+		early_memunmap(si, sizeof(*si));
+	} else {
 		return;
 	}
-	sysfb_primary_display.screen = *si;
-	memset(si, 0, sizeof(*si));
-	early_memunmap(si, sizeof(*si));
 
 	memblock_reserve(__screen_info_lfb_base(&sysfb_primary_display.screen),
 			 sysfb_primary_display.screen.lfb_size);
diff --git a/drivers/firmware/efi/efi-init.c b/drivers/firmware/efi/efi-init.c
index d1d418a34407..ca697d485116 100644
--- a/drivers/firmware/efi/efi-init.c
+++ b/drivers/firmware/efi/efi-init.c
@@ -67,10 +67,9 @@ EXPORT_SYMBOL_GPL(sysfb_primary_display);
 
 static void __init init_primary_display(void)
 {
-	struct screen_info *si;
-
 	if (screen_info_table != EFI_INVALID_TABLE_ADDR) {
-		si = early_memremap(screen_info_table, sizeof(*si));
+		struct screen_info *si = early_memremap(screen_info_table, sizeof(*si));
+
 		if (!si) {
 			pr_err("Could not map screen_info config table\n");
 			return;
@@ -78,14 +77,16 @@ static void __init init_primary_display(void)
 		sysfb_primary_display.screen = *si;
 		memset(si, 0, sizeof(*si));
 		early_memunmap(si, sizeof(*si));
+	} else {
+		return;
+	}
 
-		if (memblock_is_map_memory(sysfb_primary_display.screen.lfb_base))
-			memblock_mark_nomap(sysfb_primary_display.screen.lfb_base,
-					    sysfb_primary_display.screen.lfb_size);
+	if (memblock_is_map_memory(sysfb_primary_display.screen.lfb_base))
+		memblock_mark_nomap(sysfb_primary_display.screen.lfb_base,
+				    sysfb_primary_display.screen.lfb_size);
 
-		if (IS_ENABLED(CONFIG_EFI_EARLYCON))
-			efi_earlycon_reprobe();
-	}
+	if (IS_ENABLED(CONFIG_EFI_EARLYCON))
+		efi_earlycon_reprobe();
 }
 
 static int __init uefi_init(u64 efi_system_table)
-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
