Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9984FCFD340
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 16:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfT/dY43PO5wpk477HakBDw0U5sQsHD6Cb4iIE/JbYA=; b=nkBu08qmRi28yH
	mkbGB+rNJs36VqGFHbHPY9Fx5RLbXhq6kCPYL56XLmGpmWMwgeVgxIV3+ZP343Tq6jXO7kvAmJnUF
	kR9EweFs4d3Dofy0RavoSwcJjB6Ze1m8GwM/nUOA4rGX+Jc0J458pRrZeRZXlkfCq9qWX7toaduf+
	PObsYEyg3Y+fnlTvu5gmHpk4R3TQlF3HVKsPVsDCDM8NT1ON7UUEBuQzngW8LGd7wsn8o1s0npMKQ
	4IDbjgvGdgI8YyrwmpGhHgqQOzl7SdDlAlCA7d3XLUvGL8w9FrUmDnMQK/P8Jv4cfRlypBvtEUYJl
	Y9wGCJAQlo2s5XbNHJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZmq-0000000C1TP-3ejJ;
	Mon, 24 Nov 2025 16:51:36 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZmo-0000000C1QY-2tEy
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 16:51:35 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D7C55BCFC;
	Mon, 24 Nov 2025 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764003086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgp8e/ztEk3SroGbIpTtvMrgmXHBuJDU6cXbgqWVfUM=;
	b=Mjj7YTSE2CNQAHx6GiiEpncnpu+0uHiuZsvI8v4sy3HAd/fVDlC5HwXs6HPOtrNcljRGXW
	SQFZpNiXCKB5r2dUvWMSBhCo+L/RfE6H+8qqUc/5rHDcFRaAF1siry7v0mNwLBSqY+3xEz
	IHqVQSv1TOOluAVtDjtCTF+RO+7cbYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764003086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgp8e/ztEk3SroGbIpTtvMrgmXHBuJDU6cXbgqWVfUM=;
	b=2KnGBlPWIty4FKH6sewksofS7nF0npLrqjLx7BNhcnqOVjhdnCaaCNjHu8To9L1DtF1JiJ
	GRNcb6HZOWds62Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764003086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgp8e/ztEk3SroGbIpTtvMrgmXHBuJDU6cXbgqWVfUM=;
	b=Mjj7YTSE2CNQAHx6GiiEpncnpu+0uHiuZsvI8v4sy3HAd/fVDlC5HwXs6HPOtrNcljRGXW
	SQFZpNiXCKB5r2dUvWMSBhCo+L/RfE6H+8qqUc/5rHDcFRaAF1siry7v0mNwLBSqY+3xEz
	IHqVQSv1TOOluAVtDjtCTF+RO+7cbYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764003086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgp8e/ztEk3SroGbIpTtvMrgmXHBuJDU6cXbgqWVfUM=;
	b=2KnGBlPWIty4FKH6sewksofS7nF0npLrqjLx7BNhcnqOVjhdnCaaCNjHu8To9L1DtF1JiJ
	GRNcb6HZOWds62Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E844F3EA65;
	Mon, 24 Nov 2025 16:51:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +LJANw2NJGm3GgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 24 Nov 2025 16:51:25 +0000
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
Subject: [PATCH v2 03/10] sysfb: Add struct sysfb_display_info
Date: Mon, 24 Nov 2025 17:40:15 +0100
Message-ID: <20251124165116.502813-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251124165116.502813-1-tzimmermann@suse.de>
References: <20251124165116.502813-1-tzimmermann@suse.de>
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
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_085134_879582_1A004FB7 
X-CRM114-Status: GOOD (  11.57  )
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

Add struct sysfb_display_info to wrap display-related state. For now
it contains only the screen's video mode. Later EDID will be added as
well.

This struct will be helpful for passing display state to sysfb drivers
or from the EFI stub library.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/linux/sysfb.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index 8527a50a5290..8b37247528bf 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -8,6 +8,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/screen_info.h>
 #include <linux/types.h>
 
 #include <linux/platform_data/simplefb.h>
@@ -60,6 +61,10 @@ struct efifb_dmi_info {
 	int flags;
 };
 
+struct sysfb_display_info {
+	struct screen_info screen;
+};
+
 #ifdef CONFIG_SYSFB
 
 void sysfb_disable(struct device *dev);
-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
