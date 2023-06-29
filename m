Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF13C0502B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9pRjTJduTGAutBm8gMtd0fW56bB4xIKiAmwIRxn+Xd4=; b=fx1Ufq0BgpXqF6
	yU2DqMvXRD3X9Dy0uXvQXhEdTjaVWpjca9plXfEZ90tcmfrDpKUGgQzN/n5efhtXLyCHvat7JtQ9q
	tfcMT9BYaLyafitzIsadrxp7UkR0X5gmUn3mmzh1CLuNYJSjzLp/NpobhAiJysMve/zP8KsqL2rLV
	Rr/61CzXXBy+xmlmuwQndCn3ORi4n2MsJn/XY+38F/HkXN0WWCLuQT6gnKd2Yf9m/jKDbAkXaubfY
	8Ib5sT+g07AQRW+/24ndzMrpHOy/ZJhRBcBHEEkBINuHxlnThKZr4T9OtT+3kAcFoflX+/1YMAAqW
	O/Ymi00x0rz7vmWjvhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqdD-00134J-2b;
	Thu, 29 Jun 2023 12:20:15 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqcy-0012nh-2K;
	Thu, 29 Jun 2023 12:20:04 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4573E1F8D6;
	Thu, 29 Jun 2023 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688041195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nwKCg0ASpMSj/N7nk6+LAWl9eqN5SgDZ9SSsI3CKIes=;
	b=ifsv+rsuemSFYPhJ/STIdTvx6x75qUEhLLGZ2g9AvONK3jL91ZNzeWNAtZraZVcGWThcHM
	EfQbM+qs5azyCMPqS9sZhBhwKPyBWCHJQhLVHCTMFRSDdi3SXNdEiGVeBJdlRqG6pE2rO7
	z3oGS2FeItnucroHvhtx1EF9mKdmXIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688041195;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nwKCg0ASpMSj/N7nk6+LAWl9eqN5SgDZ9SSsI3CKIes=;
	b=E6n/U6MQ4f+3rPbM2UsNu1qwtOXOlMais+WpB4FpCxfnJZvfgaxmYOknSshObU0+YcztfQ
	wODdqbuTw1DsqWBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CCBF713905;
	Thu, 29 Jun 2023 12:19:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1lzwMOp2nWRlVAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:19:54 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/12] arch,fbdev: Move screen_info into arch/
Date: Thu, 29 Jun 2023 13:45:39 +0200
Message-ID: <20230629121952.10559-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_052000_928696_00DEAFA9 
X-CRM114-Status: GOOD (  14.64  )
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

The variables screen_info and edid_info provide information about
the system's screen, and possibly EDID data of the connected display.
Both are defined and set by architecture code. But both variables are
declared in non-arch header files. Dependencies are at bease loosely
tracked. To resolve this, move the global state screen_info and its
companion edid_info into arch/. Only declare them on architectures
that define them. List dependencies on the variables in the Kconfig
files. Also clean up the callers.

Patch 1 to 4 resolve a number of unnecessary include statements of
<linux/screen_info.h>. The header should only be included in source
files that access struct screen_info.

Patches 5 to 7 move the declaration of screen_info and edid_info to
<asm-generic/screen_info.h>. Architectures that provide either set
a Kconfig token to enable them.

Patches 8 to 9 make users of screen_info depend on the architecture's
feature.

Finally, patches 10 to 12 rework fbdev's handling of firmware EDID
data to make use of existing helpers and the refactored edid_info.

Tested on x86-64. Built for a variety of platforms.

Future directions: with the patchset in place, it will become possible
to provide screen_info and edid_info only if there are users. Some
architectures do this by testing for CONFIG_VT, CONFIG_DUMMY_CONSOLE,
etc. A more uniform approach would be nice. We should also attempt
to minimize access to the global screen_info as much as possible. To
do so, some drivers, such as efifb and vesafb, would require an update.
The firmware's EDID data could possibly made available outside of fbdev.
For example, the simpledrm and ofdrm drivers could provide such data
to userspace compositors.

Thomas Zimmermann (12):
  efi: Do not include <linux/screen_info.h> from EFI header
  fbdev/sm712fb: Do not include <linux/screen_info.h>
  sysfb: Do not include <linux/screen_info.h> from sysfb header
  staging/sm750fb: Do not include <linux/screen_info.h>
  arch: Remove trailing whitespaces
  arch: Declare screen_info in <asm/screen_info.h>
  arch/x86: Declare edid_info in <asm/screen_info.h>
  drivers/firmware: Remove trailing whitespaces
  drivers: Add dependencies on CONFIG_ARCH_HAS_SCREEN_INFO
  fbdev/core: Use fb_is_primary_device() in fb_firmware_edid()
  fbdev/core: Protect edid_info with CONFIG_ARCH_HAS_EDID_INFO
  fbdev/core: Define empty fb_firmware_edid() in <linux/fb.h>

 arch/Kconfig                                  | 12 +++++++
 arch/alpha/Kconfig                            |  1 +
 arch/arm/Kconfig                              |  1 +
 arch/arm/kernel/efi.c                         |  2 ++
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/kernel/efi.c                       |  1 +
 arch/csky/Kconfig                             |  1 +
 arch/hexagon/Kconfig                          |  1 +
 arch/ia64/Kconfig                             |  5 +--
 arch/loongarch/Kconfig                        |  1 +
 arch/mips/Kconfig                             |  1 +
 arch/nios2/Kconfig                            |  1 +
 arch/powerpc/Kconfig                          |  1 +
 arch/riscv/Kconfig                            |  1 +
 arch/sh/Kconfig                               |  7 ++--
 arch/sparc/Kconfig                            |  1 +
 arch/x86/Kconfig                              |  2 ++
 arch/xtensa/Kconfig                           |  1 +
 drivers/firmware/Kconfig                      |  3 +-
 drivers/firmware/efi/Kconfig                  |  1 +
 drivers/firmware/efi/libstub/efi-stub-entry.c |  2 ++
 drivers/firmware/efi/libstub/screen_info.c    |  2 ++
 drivers/gpu/drm/Kconfig                       |  1 +
 drivers/hv/Kconfig                            |  1 +
 drivers/staging/sm750fb/sm750.c               |  1 -
 drivers/staging/sm750fb/sm750_accel.c         |  1 -
 drivers/staging/sm750fb/sm750_cursor.c        |  1 -
 drivers/staging/sm750fb/sm750_hw.c            |  1 -
 drivers/video/console/Kconfig                 |  2 ++
 drivers/video/fbdev/Kconfig                   |  4 +++
 drivers/video/fbdev/core/fbmon.c              | 34 ++++++-------------
 drivers/video/fbdev/i810/i810-i2c.c           |  2 +-
 drivers/video/fbdev/intelfb/intelfbdrv.c      |  2 +-
 drivers/video/fbdev/nvidia/nv_i2c.c           |  2 +-
 drivers/video/fbdev/savage/savagefb-i2c.c     |  2 +-
 drivers/video/fbdev/sm712fb.c                 |  9 +++--
 include/asm-generic/Kbuild                    |  1 +
 include/asm-generic/screen_info.h             | 18 ++++++++++
 include/linux/efi.h                           |  3 +-
 include/linux/fb.h                            | 10 +++++-
 include/linux/screen_info.h                   |  2 +-
 include/linux/sysfb.h                         |  3 +-
 include/video/edid.h                          |  3 --
 43 files changed, 105 insertions(+), 47 deletions(-)
 create mode 100644 include/asm-generic/screen_info.h


base-commit: d2f0af8472494398a42153684b790b723a79f143
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
