Return-Path: <SRS0=TyRV=LT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCA8C2B9F4
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 13:10:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D936F61953
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 13:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D936F61953
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tI7HCu1LtFSL/so8R+dT5UoO4M0EivZwGF2z5ML0AuM=; b=zp7lH4fFZjv9p+
	/NZA0ezLB3uuUHOns+9xW/1OtiCBxsMYdZ3NhiQneupn+sHBqNThc72BwzP1IZvU51Xpqy2CyXWAb
	uB/iw/cLeC8a3BfXprbt03RKZaSbbq9uRSPzGFwgvh6kih8gOfXY9FKUddpA8AlJCjJVjLebVOB4X
	ScjeA4dPFSeBXilQ5CvIbFdC0dlaETqYxnD3yjyaN169T2KOiunlASitSaCLw6mwuHsqCgHJJvOes
	l+fFPzWNJFuMVqntp+aDjF8XAL9lhaIFV58T9IneRBD+7XUyY2LqzZZ2dh/vymqj6d5qA+r1tS8rg
	sWMhmV6cmk/ds6hGJPQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwlb2-001bM1-8D; Fri, 25 Jun 2021 13:10:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwlax-001bHz-An
 for linux-riscv@lists.infradead.org; Fri, 25 Jun 2021 13:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624626603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vvZL1fz2dwOb7Upqb55JPmmwYtiHqp1yiqdJ6Cauu30=;
 b=Kp+FTd4jNOfEZZUEp3XL0v2FO+yf4gf12HNpFYfVtS3t41oF54kGxXE1XbYV5w05dX/kNa
 9vK63RgaGWLAlm+PQsnwbRLGfiJqiiaozxZMc/zCaYySqZZSRHiVLjQa4yMWt4piqx4qtS
 scvW2gVhEBGreOUXDiXfUJYeFzu7TXk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-SRPgcPiqNJ2Hw-Tr7w74Cg-1; Fri, 25 Jun 2021 09:10:00 -0400
X-MC-Unique: SRPgcPiqNJ2Hw-Tr7w74Cg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h14-20020a05600c350eb02901dfc071c176so2691596wmq.3
 for <linux-riscv@lists.infradead.org>; Fri, 25 Jun 2021 06:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vvZL1fz2dwOb7Upqb55JPmmwYtiHqp1yiqdJ6Cauu30=;
 b=hOmkZYTkzvE260IPC2BCVgHKi4YKZOHc0zRFJx57hYb0qpsLldXIpwxu8OQKyUxvUD
 VZCakFC+eJrwLKHTcUjPHRpoNb6nezUJeV1mZulM0w1YLtti/36thtdSCZbJGyxVilxr
 s0vBGnq7ahP0uyJ2BTh30oHOttrhlohWgrdMS+KzW5LyaiKTXmF0AOVbihpmlGponmUD
 An4GuHwprnRALbzTSF6j5U7QJ3x+L3mgIcRyjw8rFzYsz7N1i+LoqVjXcYWiqYaWQ0JM
 1lDPbDKL8b4FO++wQYk1ObqTcwZTsxfR9UOU15HF/+FhKG7c+1IxsytvWEJDbOpUSb7F
 QCHQ==
X-Gm-Message-State: AOAM531CXsWVcd45/qpizO0SHtfgUANVJVP0/fKK67/LpAjZ+5mUE3XY
 m3ektQAlwZVNJBCVGcipj/tR1iuxs4Tp9JCUtj5QDVH04wnRqcfvXrZMsQgm9JkY4O2qmzif7Qj
 QOfrPB7wexpm3YnDcrpV6qKCGygDO
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr10869835wrt.95.1624626599108; 
 Fri, 25 Jun 2021 06:09:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxac5aAuPdj78okqR8e93aZVHiRH/QUWQDePxg/s70gh/LhsMF19zX80NB6m3SpVsyLwyMfkA==
X-Received: by 2002:a5d:4b88:: with SMTP id b8mr10869804wrt.95.1624626598911; 
 Fri, 25 Jun 2021 06:09:58 -0700 (PDT)
Received: from minerva.redhat.com ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id x7sm5995864wre.8.2021.06.25.06.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 06:09:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Russell King <linux@armlinux.org.uk>,
 linux-efi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Hans de Goede <hdegoede@redhat.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Atish Patra <atish.patra@wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v3 0/2] allow simple{fb,
 drm} drivers to be used on non-x86 EFI platforms
Date: Fri, 25 Jun 2021 15:09:45 +0200
Message-Id: <20210625130947.1803678-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_061007_500984_3FE571B9 
X-CRM114-Status: GOOD (  19.89  )
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
maintainers but the patches have already been acked by the x86 folks. Ard
Biesheuvel said that these could be merged through the EFI tree if needed.

Best regards,
Javier

Changes in v3:
- Add Borislav and Greg Acked-by tags.
- Also update the SYSFB_SIMPLEFB symbol name in drivers/gpu/drm/tiny/Kconfig.
- We have a a max 100 char limit now, use it to avoid multi-line statements.
- Figure out the platform device name before allocating the platform device.

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
 .../firmware/efi}/sysfb_efi.c                 | 78 +++++++++++++++-
 {arch/x86/kernel => drivers/firmware}/sysfb.c | 37 +++++---
 .../firmware}/sysfb_simplefb.c                | 33 ++++---
 drivers/gpu/drm/tiny/Kconfig                  |  4 +-
 .../x86/include/asm => include/linux}/sysfb.h | 32 +++----
 14 files changed, 180 insertions(+), 174 deletions(-)
 rename {arch/x86/kernel => drivers/firmware/efi}/sysfb_efi.c (84%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb.c (75%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb_simplefb.c (81%)
 rename {arch/x86/include/asm => include/linux}/sysfb.h (70%)

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
