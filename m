Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD8FCFC282
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 13:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QkKfzy3sjeVjqxrReiKgtoPmK5mq0DYe83S3zopL23Q=; b=cuUKf36fIfDrri
	Y56NNPjbuQEH9nsSyumq9IbZ2ESUmMx4JXsOpkmUBRzXs9QewxkrEbOwpmuNJL2w8SINgaFa5ST5t
	YSksp+XB5RfBqyH7iVvMlilYpXA6BgL8qQEcqlnEOrIdmQ1FnNZgUaGdSPNsKByBY2B9Ns7Pqpqp1
	aJbqvicmAox6R9kZTYHGb17AMLbPgcuhyZuQxf8IxBXCxB7UZJECSPZOcMGpVAIxbAcPoK4fDx3yW
	gKLvHB4TvY6uQijekZKWKPuf7tfNh2oHB5z7Z4xz/wdqKaqVmNbDg1uSxngoI5oMLe4iHTMeYU7bh
	+6tsY2X4k4NaSjlJrpAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRct-00000008T88-0joA;
	Fri, 21 Nov 2025 13:56:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRcs-00000008T7R-0wsr
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Nov 2025 13:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CglNUSO0kp39x0UlCguyZYGnc05enMLut11VcQSN64E=; b=rEwdkvEzB+2MI48tPeo3G9cpsq
	1x9oNPUMn3DafHhXubGkbPqLJngNadtfNyLx+PNbj7ZOw4tFFKnvvG10/NLUNGFIsY5Cu3lLLzLoK
	SLVN3/1V4Hx/k7HdvdkYglmnlYAIvxKXem9PXuzoYOkD/lWN/fgJB6uTbnUHUmLz6cGyUl1CqRnG6
	52m3TfMq3nVk/XlYkm7DNwu4+H57/iGnVItkrdLSTt20a6wSuONLGapeZWjZ9QCpRCcQsyKBq/MkE
	RvTaQIi7hueRpkbIxuuq/pKAWcGG35jL8bfn3ouiuqFvaa8Sh3UjbluvMFxbGVNw+5mFj3QlZnhJ4
	1FtN5NlQ==;
Received: from smtp-out2.suse.de ([195.135.223.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMQlB-0000000Gtve-0rnZ
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 13:01:12 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 78E4121011;
	Fri, 21 Nov 2025 13:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763733391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CglNUSO0kp39x0UlCguyZYGnc05enMLut11VcQSN64E=;
	b=ufT4qNYQ5gJn0P/56UGQHy4wkKsoLKl6dHn7/8Fe7GwuN8UB63Gz62eT5GritqKeK4nUxx
	ECD4KPBpQFmyvZoXuYgJiFsXCdMzpN0d9qOVswonkfLvmzWfPO/lqWWp+HIxF7/EcgJm7o
	UOXNPtEq0a0fNiJqBgLm9XOvYTzZw7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763733391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CglNUSO0kp39x0UlCguyZYGnc05enMLut11VcQSN64E=;
	b=LvbvTzte+Fr3dlDAdooCBR/Ae/Q04Tk2pCZmTBhPYR1PDQXnhsk/0RSrDP8JwGaTPBB+ss
	xeJp0/hHNxkTIsDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ufT4qNYQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LvbvTzte
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763733391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CglNUSO0kp39x0UlCguyZYGnc05enMLut11VcQSN64E=;
	b=ufT4qNYQ5gJn0P/56UGQHy4wkKsoLKl6dHn7/8Fe7GwuN8UB63Gz62eT5GritqKeK4nUxx
	ECD4KPBpQFmyvZoXuYgJiFsXCdMzpN0d9qOVswonkfLvmzWfPO/lqWWp+HIxF7/EcgJm7o
	UOXNPtEq0a0fNiJqBgLm9XOvYTzZw7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763733391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CglNUSO0kp39x0UlCguyZYGnc05enMLut11VcQSN64E=;
	b=LvbvTzte+Fr3dlDAdooCBR/Ae/Q04Tk2pCZmTBhPYR1PDQXnhsk/0RSrDP8JwGaTPBB+ss
	xeJp0/hHNxkTIsDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21D133EA62;
	Fri, 21 Nov 2025 13:56:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uMELB49vIGkqdQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 13:56:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org,
	javierm@redhat.com,
	arnd@arndb.de
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
Subject: [PATCH 1/6] efi: earlycon: Reduce number of references to global screen_info
Date: Fri, 21 Nov 2025 14:36:05 +0100
Message-ID: <20251121135624.494768-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251121135624.494768-1-tzimmermann@suse.de>
References: <20251121135624.494768-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 78E4121011
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
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-CRM114-CacheID: sfid-20251121_130109_430316_189645D4 
X-CRM114-Status: GOOD (  14.84  )
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

Replace usage of global screen_info with local pointers. This will
later reduce churn when screen_info is being moved.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/efi/earlycon.c | 40 ++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
index d18a1a5de144..fac3a295c57f 100644
--- a/drivers/firmware/efi/earlycon.c
+++ b/drivers/firmware/efi/earlycon.c
@@ -32,12 +32,13 @@ static void *efi_fb;
  */
 static int __init efi_earlycon_remap_fb(void)
 {
+	const struct screen_info *si = &screen_info;
+
 	/* bail if there is no bootconsole or it was unregistered already */
 	if (!earlycon_console || !console_is_registered(earlycon_console))
 		return 0;
 
-	efi_fb = memremap(fb_base, screen_info.lfb_size,
-			  fb_wb ? MEMREMAP_WB : MEMREMAP_WC);
+	efi_fb = memremap(fb_base, si->lfb_size, fb_wb ? MEMREMAP_WB : MEMREMAP_WC);
 
 	return efi_fb ? 0 : -ENOMEM;
 }
@@ -71,12 +72,12 @@ static __ref void efi_earlycon_unmap(void *addr, unsigned long len)
 	early_memunmap(addr, len);
 }
 
-static void efi_earlycon_clear_scanline(unsigned int y)
+static void efi_earlycon_clear_scanline(unsigned int y, const struct screen_info *si)
 {
 	unsigned long *dst;
 	u16 len;
 
-	len = screen_info.lfb_linelength;
+	len = si->lfb_linelength;
 	dst = efi_earlycon_map(y*len, len);
 	if (!dst)
 		return;
@@ -85,7 +86,7 @@ static void efi_earlycon_clear_scanline(unsigned int y)
 	efi_earlycon_unmap(dst, len);
 }
 
-static void efi_earlycon_scroll_up(void)
+static void efi_earlycon_scroll_up(const struct screen_info *si)
 {
 	unsigned long *dst, *src;
 	u16 maxlen = 0;
@@ -99,8 +100,8 @@ static void efi_earlycon_scroll_up(void)
 	}
 	maxlen *= 4;
 
-	len = screen_info.lfb_linelength;
-	height = screen_info.lfb_height;
+	len = si->lfb_linelength;
+	height = si->lfb_height;
 
 	for (i = 0; i < height - font->height; i++) {
 		dst = efi_earlycon_map(i*len, len);
@@ -120,7 +121,8 @@ static void efi_earlycon_scroll_up(void)
 	}
 }
 
-static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h)
+static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h,
+				    const struct screen_info *si)
 {
 	const u32 color_black = 0x00000000;
 	const u32 color_white = 0x00ffffff;
@@ -145,13 +147,12 @@ static void efi_earlycon_write_char(u32 *dst, unsigned char c, unsigned int h)
 static void
 efi_earlycon_write(struct console *con, const char *str, unsigned int num)
 {
-	struct screen_info *si;
+	const struct screen_info *si = &screen_info;
 	u32 cur_efi_x = efi_x;
 	unsigned int len;
 	const char *s;
 	void *dst;
 
-	si = &screen_info;
 	len = si->lfb_linelength;
 
 	while (num) {
@@ -174,7 +175,7 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
 			x = efi_x;
 
 			while (n-- > 0) {
-				efi_earlycon_write_char(dst + x*4, *s, h);
+				efi_earlycon_write_char(dst + x*4, *s, h, si);
 				x += font->width;
 				s++;
 			}
@@ -207,10 +208,10 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
 			cur_line_y = (cur_line_y + 1) % max_line_y;
 
 			efi_y -= font->height;
-			efi_earlycon_scroll_up();
+			efi_earlycon_scroll_up(si);
 
 			for (i = 0; i < font->height; i++)
-				efi_earlycon_clear_scanline(efi_y + i);
+				efi_earlycon_clear_scanline(efi_y + i, si);
 		}
 	}
 }
@@ -226,22 +227,21 @@ void __init efi_earlycon_reprobe(void)
 static int __init efi_earlycon_setup(struct earlycon_device *device,
 				     const char *opt)
 {
-	struct screen_info *si;
+	const struct screen_info *si = &screen_info;
 	u16 xres, yres;
 	u32 i;
 
 	fb_wb = opt && !strcmp(opt, "ram");
 
-	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI) {
+	if (si->orig_video_isVGA != VIDEO_TYPE_EFI) {
 		fb_probed = true;
 		return -ENODEV;
 	}
 
-	fb_base = screen_info.lfb_base;
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		fb_base |= (u64)screen_info.ext_lfb_base << 32;
+	fb_base = si->lfb_base;
+	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+		fb_base |= (u64)si->ext_lfb_base << 32;
 
-	si = &screen_info;
 	xres = si->lfb_width;
 	yres = si->lfb_height;
 
@@ -266,7 +266,7 @@ static int __init efi_earlycon_setup(struct earlycon_device *device,
 
 	efi_y -= font->height;
 	for (i = 0; i < (yres - efi_y) / font->height; i++)
-		efi_earlycon_scroll_up();
+		efi_earlycon_scroll_up(si);
 
 	device->con->write = efi_earlycon_write;
 	earlycon_console = device->con;
-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
