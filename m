Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A182CFD318
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 16:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9sgMluBUat5e/r/qSdLBkTVDdA9V5ubDmZXULBTET4=; b=zQ+kzr73LJtErD
	zsKdg7nmuOHrrzlMb0nuDyQCNIyE5toam+MDemeNOLX1hOJihaiKpbn38Q3uoH0VED8t/5DME72k4
	4fSyASHd19FSuieRg1CiHKVqUhfUIf9eRT3LqTC/bvXkMSfmNqmLlH9yLtmHn+PWUO6KyPy2OsIcW
	aspkJmf8J6oSw9ZHuoO7A8cD2O6VY7ym8rot01Iks8EHnNwy4rOfG7XWV6x4l/OlZpaKBXS8zpZUr
	zhXNfW/UhDzy5d5XQbip1VJbxjxpyNEizUPZZIE4prABWXMxnSibFK/Nw9/q9wPgZdj4r+IYPj+Vf
	JIlA1Bm7YbwFrB5hmymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZnS-0000000C28A-2iYe;
	Mon, 24 Nov 2025 16:52:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZnK-0000000C1y6-04mZ
	for linux-riscv@bombadil.infradead.org;
	Mon, 24 Nov 2025 16:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=; b=WzNs6Zcv3wGuBJN+x4hZWnytsu
	sQv9TfEOyDvbGLRqFwrnQQAC+oTOJ4XERLR2SxcOCkpaVgthoWtnZdlaPfOs1E4/mRyEQL/qe+L1k
	0Up5XbNtsb0vFNZkztTgEqnpvi0OwcnA8y7TRdYu8XsAJrU/nS4TZvmF3g127E/AqD6+y1vim9U/J
	GmNNPejJ61hKdZ2Mx8ZFzE2c3G3hEvjzNcy7ktr4P/rdOlOwqi/SAInm8YnJIf7MzE0G0iwTHc/W7
	+ZQO5f4dWYGb5W2ghiacRnOmUYAZ22sIQ8L73UZ+a1wkyE6Cu+sjA0T6Nru5c7iOSJMGVHQgrsn+1
	c22tuQHA==;
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYve-00000004864-1kTs
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 15:56:41 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3CBF6221C7;
	Mon, 24 Nov 2025 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764003088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=;
	b=USTSMD3di0zWAbvMvh0U0iSxZVNHEKbe74gZb3tLNPXEhDBJzlLLdwBX8iLcN/oVLiQXxU
	jd9FuQi1MULpJJCVAoBRKEjjk/tquFNbqjqeEeccM4WMyjHLm5SE4hEsNtcoEss4PgEj+M
	sTNy2SdOSjzt1XxIOr18frXnjg278wY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764003088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=;
	b=p4ZEFBOZwasoIGMm1XvU+zqP7yQeyxTaq2CJ6XHD4eB6fM9QWM9yelhH0/VSigYWkkyrtM
	gMKIaq3IJ/9TTRCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=USTSMD3d;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=p4ZEFBOZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764003088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=;
	b=USTSMD3di0zWAbvMvh0U0iSxZVNHEKbe74gZb3tLNPXEhDBJzlLLdwBX8iLcN/oVLiQXxU
	jd9FuQi1MULpJJCVAoBRKEjjk/tquFNbqjqeEeccM4WMyjHLm5SE4hEsNtcoEss4PgEj+M
	sTNy2SdOSjzt1XxIOr18frXnjg278wY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764003088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fyql6Tx9djnJiYcyVTN9LI7S1hn01itqY+i13dgaIEA=;
	b=p4ZEFBOZwasoIGMm1XvU+zqP7yQeyxTaq2CJ6XHD4eB6fM9QWM9yelhH0/VSigYWkkyrtM
	gMKIaq3IJ/9TTRCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C70613EA65;
	Mon, 24 Nov 2025 16:51:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gKYiLw+NJGm3GgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 24 Nov 2025 16:51:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org,
	javierm@redhat.com,
	arnd@arndb.de,
	richard.lyu@suse.com
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
Subject: [PATCH v2 07/10] efi: Refactor init_primary_display() helpers
Date: Mon, 24 Nov 2025 17:40:19 +0100
Message-ID: <20251124165116.502813-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251124165116.502813-1-tzimmermann@suse.de>
References: <20251124165116.502813-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 3CBF6221C7
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLtfyjk8sg4x43ngtem9djprcp)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_155638_534423_8EC56949 
X-CRM114-Status: GOOD (  12.81  )
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
