Return-Path: <SRS0=0g6C=K3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F66C4708F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jun 2021 14:59:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93DD36128A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jun 2021 14:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93DD36128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uXPEDBeGvUvXPBPn8c2smlCzPZRbTwY7ZuXHfJgcTGI=; b=teXDnZ9J53anmQ
	A3uOXfA3JlYkKwwoUso2Vc5rGDIOAZfJHoG9nAgjZHUCRoMpAgCwMNMJ0D2srWKJo/Tny2K4slLbG
	tF/oWDEFBvgeAh5Elmu3sll/08qRIoRiIDSPxyGUH6ashZSGWWh8nMHTBbWK8M8/7KqARiaKsk6uy
	/rqiRoYt/FenwnycQExrUJfbILuFIzlll+EHg6oAOc5Qf6wjgWan+wRYh/onRe4jGu2oJJSYIyJWW
	35Xo4L/nbeI0BO24DuyZiVrvcqrykAWoiIBGaqnWjqrhxLpqbFbruOaY0+2CT+UEPv3pccTeXgtg0
	lJQ+VdlZRYQastu7hhyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo5ri-00H3VH-2q; Tue, 01 Jun 2021 14:59:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo5rf-00H3TD-Nr
 for linux-riscv@lists.infradead.org; Tue, 01 Jun 2021 14:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622559569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vBakIu1dQtk22INC/4X9gLrUw+kGXTDgbjVD36Rzgzs=;
 b=YeOH+ZU7dUx07FzkaochgoLDC3rTBP9xB91NWT22UK7FVPmrkeusLY10rnSbD2C5RU/D8L
 ySRhomMUxwlcyQMcF4q2oiOsqpnDpdT/89wWWRC9Bf9XFhJYmbcyjlJvHWGkKpHIcfbUpn
 pWKZtrvXK/CLsLtsEjWiEPXF0ZFVCTc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-zAFusT0cMUux1GcMethfCw-1; Tue, 01 Jun 2021 10:59:25 -0400
X-MC-Unique: zAFusT0cMUux1GcMethfCw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so3316104wrc.16
 for <linux-riscv@lists.infradead.org>; Tue, 01 Jun 2021 07:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vBakIu1dQtk22INC/4X9gLrUw+kGXTDgbjVD36Rzgzs=;
 b=il/0VWWH022hN6553QNxuASFFidI7CvWnrML1SZ/s9YaGrKMFgzeDoAY+yVVzjRHGf
 NHTemsZ4GsZuun508EUTFjMnPpP+1PSRfZOo8L30Av1ZNNFMWusAVr89brgstS070niz
 dSJKUKMF+S1HNeXODAzsCD/m2BGa//o00CZVzMT63OjcmRz/1wKOE2/xRLx08F5o9mLu
 7+85skjfx3GlKy1lhNAhMBrwTe7/KjnjpBWNLouCmMFA6LEK7OWfme7DlcxtaFbS/9vQ
 D2klXtqcWgPUS75XG9ISsQ1hhAXt3M0HnlXpZudCsfL1+fcWoEe7h7CoMsmYsTMXy6bp
 l5Uw==
X-Gm-Message-State: AOAM530fuurYfGCAoLN50/So8TLIw2ZiDuZG8V4TRWy2MMSW0oGTvHie
 JEOuPjGb0fO92HGAP4XX8kJgRsCFQ54+ya64stKmDmOOi2kwHkEYWSBaAdS2QiqkoVqKgK7Ai3C
 tcSvoj0MndLcDruZ9yjwjyyLd/K7T
X-Received: by 2002:a1c:282:: with SMTP id 124mr350824wmc.82.1622559564312;
 Tue, 01 Jun 2021 07:59:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9XbrF5UjA3Lkw2unmQqkjrGQdtKb1lFgUux9RmxthjhbwQ8B+MLPzmwDX65DDh6SYfSo0EA==
X-Received: by 2002:a1c:282:: with SMTP id 124mr350790wmc.82.1622559564069;
 Tue, 01 Jun 2021 07:59:24 -0700 (PDT)
Received: from minerva.redhat.com ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id h6sm3533153wrt.6.2021.06.01.07.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 07:59:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>, Peter Robinson <pbrobinson@gmail.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Borislav Petkov <bp@alien8.de>, Brijesh Singh <brijesh.singh@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Chester Lin <clin@suse.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Joerg Roedel <jroedel@suse.de>, John Stultz <john.stultz@linaro.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Juergen Gross <jgross@suse.com>,
 Kalle Valo <kvalo@codeaurora.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: [PATCH v2 0/2] allow simple{fb,
 drm} drivers to be used on non-x86 EFI platforms
Date: Tue,  1 Jun 2021 16:59:10 +0200
Message-Id: <20210601145912.774054-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_075931_879620_BC055DBF 
X-CRM114-Status: GOOD (  19.14  )
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

The simplefb and simpledrm drivers match against a "simple-framebuffer"
device, but for aarch64 this is only registered when using Device Trees
and there's a node with a "simple-framebuffer" compatible string.

There is no code to register a "simple-framebuffer" platform device when
using EFI instead. In fact, the only platform device that's registered in
this case is an "efi-framebuffer", which means that the efifb driver is
the only driver supported to have an early console with EFI on aarch64.

The x86 architecture platform has a Generic System Framebuffers (sysfb)
support, that register a system frambuffer platform device. It either
registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
VGA/EFI FB devices for the vgafb/efifb drivers.

The sysfb is generic enough to be reused by other architectures and can be
moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
logic used by non-x86 architectures to be folded into sysfb as well.

Patch #1 in this series do the former while patch #2 do the latter. It has
been tested on x86_64 and aarch64 machines using the efifb, simplefb and
simpledrm drivers. But more testing will be highly appreciated, to make
sure that no regressions are being introduced by these changes.

The series touches different subystems and will need coordination between
maintainers. Ard Biesheuvel said that can be merged through the EFI tree.

Best regards,
Javier

Changes in v2:
- Use default y and depends on X86 instead doing a select in arch/x86/Kconfig.
- Also enable the SYSFB Kconfig option when COMPILE_TEST.
- Improve commit message to explain why is useful for other arches to use this.
- Use "depends on" for the supported architectures instead of selecting it.
- Improve commit message to explain the benefits of reusing sysfb for !X86.

Javier Martinez Canillas (2):
  drivers/firmware: move x86 Generic System Framebuffers support
  drivers/firmware: consolidate EFI framebuffer setup for all arches

 arch/arm/include/asm/efi.h                    |  5 +-
 arch/arm64/include/asm/efi.h                  |  5 +-
 arch/riscv/include/asm/efi.h                  |  5 +-
 arch/x86/Kconfig                              | 26 ------
 arch/x86/kernel/Makefile                      |  3 -
 drivers/firmware/Kconfig                      | 32 +++++++
 drivers/firmware/Makefile                     |  2 +
 drivers/firmware/efi/Makefile                 |  2 +
 drivers/firmware/efi/efi-init.c               | 90 -------------------
 .../firmware/efi}/sysfb_efi.c                 | 79 +++++++++++++++-
 {arch/x86/kernel => drivers/firmware}/sysfb.c | 42 +++++----
 .../firmware}/sysfb_simplefb.c                | 31 ++++---
 .../x86/include/asm => include/linux}/sysfb.h | 34 +++----
 13 files changed, 180 insertions(+), 176 deletions(-)
 rename {arch/x86/kernel => drivers/firmware/efi}/sysfb_efi.c (84%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb.c (70%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb_simplefb.c (82%)
 rename {arch/x86/include/asm => include/linux}/sysfb.h (68%)

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
