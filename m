Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB68D39403
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 09:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKG0ua1AVvkrZ5Hp+wKwplfnKbM7y4X6j3kmDGv/s6Q=; b=4s14G1PqWm6cT3
	6+AaS+CpgfzUBbwp2/P7V8RqTS+AtRE48WOgWAumoTBUcDDYhe38UOzGHlgGAPra2ji32REZvOrGv
	w4mu4iMMys5QogW3ZKWBPo6aa9oDb+iebRPzmQMWqwd6bT6u9M7Ob7d473PxZXbU1n9H0dTLtKFKp
	kSQw6isSO73BfDRzEpLk3uCgeK3pr6CTP9/krlEns9EsCS16BucvyLz5cPLvtvmuCqTSd3qXzTGH9
	4g8M/lLvu3gqSO4PU+q1Ry8hpRwNXZtP65rrOW0F3vPCOm/O7/XdD7U9z9JBq2ymUKoHUBSqahxV2
	urVvn0voMEXTjUWGvhtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EGp-0000000HF4Y-2DRg;
	Thu, 02 Apr 2026 09:23:23 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EGm-0000000HF1c-1DkL
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 09:23:21 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4F5205BD70;
	Thu,  2 Apr 2026 09:23:11 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7D914A0B1;
	Thu,  2 Apr 2026 09:23:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MAfJJ341zmlVYAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 02 Apr 2026 09:23:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	arnd@arndb.de,
	ardb@kernel.org,
	ilias.apalodimas@linaro.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	deller@gmx.de
Cc: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Michael Kelley <mhklinux@outlook.com>,
	Saurabh Sengar <ssengar@linux.microsoft.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/8] hv: Select CONFIG_SYSFB only for CONFIG_HYPERV_VMBUS
Date: Thu,  2 Apr 2026 11:09:15 +0200
Message-ID: <20260402092305.208728-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402092305.208728-1-tzimmermann@suse.de>
References: <20260402092305.208728-1-tzimmermann@suse.de>
MIME-Version: 1.0
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 4F5205BD70
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_022320_467152_FF1BBE63 
X-CRM114-Status: GOOD (  10.04  )
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

Hyperv's sysfb access only exists in the VMBUS support. Therefore
only select CONFIG_SYSFB for CONFIG_HYPERV_VMBUS. Avoids sysfb code
on systems that don't need it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 96959283a58d ("Drivers: hv: Always select CONFIG_SYSFB for Hyper-V guests")
Cc: Michael Kelley <mhklinux@outlook.com>
Cc: Saurabh Sengar <ssengar@linux.microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-hyperv@vger.kernel.org
Cc: <stable@vger.kernel.org> # v6.16+
---
 drivers/hv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index 7937ac0cbd0f..2d0b3fcb0ff8 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -9,7 +9,6 @@ config HYPERV
 	select PARAVIRT
 	select X86_HV_CALLBACK_VECTOR if X86
 	select OF_EARLY_FLATTREE if OF
-	select SYSFB if EFI && !HYPERV_VTL_MODE
 	select IRQ_MSI_LIB if X86
 	help
 	  Select this option to run Linux as a Hyper-V client operating
@@ -62,6 +61,7 @@ config HYPERV_VMBUS
 	tristate "Microsoft Hyper-V VMBus driver"
 	depends on HYPERV
 	default HYPERV
+	select SYSFB if EFI && !HYPERV_VTL_MODE
 	help
 	  Select this option to enable Hyper-V Vmbus driver.
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
