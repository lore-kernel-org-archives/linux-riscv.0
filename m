Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CACC4707D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 19:30:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E6B0613D8
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 19:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E6B0613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y8HXOXBX5wqylKqDR60JGQj77FDF1qOy/o96q8UBAig=; b=ClSqWjv9hjUNQHANbQ/hqrd0oT
	6vQCfGb6eOJTFjyBHYIHSlUE+Jex6M3OWOH8EQiDvTLaGuCLaWUTmLXIO5wgxoRgiwW71yxhKtXNR
	VHDFdBIrNCgmaMpXTskJ4fvi91zEhCTTeqz+hWfDBzWk0kGhdUhOzwMqmtL2zyxdZxsRCT0qXYVTI
	x7DytXwb2zxw6xUUHAaMa4yedUdbzl93t4ud55DI/tOv85d2Gc7ogmgsu/MV0FsliEYk0+8ILODFH
	QPtC0op8Rzkgm+umIIKPnu2uNRuK8qedXH9t2WA4wqe13bqlpCvG/pdEOGbBJZvEYn+eM77Ht/swN
	0D3WdfXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkAqM-000rcV-OY; Fri, 21 May 2021 19:29:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkAqH-000rbk-4T
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 19:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=W/zi/LtHS0XDym1cIKLNS5P4Tl2hUYuQ3Q4oc605Ruc=; b=PPgmS8fDmQqy1PVgy95szBSgEd
 4yvveC7Pv1e56z7zKRP8sREUyUCgCh5idzqH0O6oYz587/Dq3w2b+jv2hNa6v4Ha5kvoOCOueCmVW
 izMfFsrVsRnccs+KyWrypjpVpwKNX7FpR4M4HWIIZZsjSniCWQp0YzSNsnleZh04Uzpl1hT4M0rKW
 Fta36+dikuJGnNf4wRZQK1Io4986JPRI4mz3WD4CXE/bLsf8lNBOegGKBwXV+T3cGVNcUguXcpFA8
 74yX1mknNirGOGLBRHqb6wn7+ySmPYTzfxb5W/z+8G5WLUhPadHicN5bGOZDmqcKpAMfK5J4aEXB5
 qMV+R1IQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkAqE-00HNaM-Gi
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 19:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621625387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W/zi/LtHS0XDym1cIKLNS5P4Tl2hUYuQ3Q4oc605Ruc=;
 b=Cqwe/bY66ooJfR25I1soKntvmPfWhfa93TjsFgjp4hW4LSLWPG5yaN7AuLiADujpif+vuT
 nMJntlxsWoGP1gzQHn4uD5Wm2cDG5MTuy8D7WpwcRdHcggn+GHTOmTgeDb+bjxvdKWlSjA
 6u/n1Mbqm5lCezuoVJrunqQjbXz6Ejs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-7AgpTai_PMqCMkT-ryErUw-1; Fri, 21 May 2021 15:29:46 -0400
X-MC-Unique: 7AgpTai_PMqCMkT-ryErUw-1
Received: by mail-wr1-f71.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so9779602wrm.13
 for <linux-riscv@lists.infradead.org>; Fri, 21 May 2021 12:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W/zi/LtHS0XDym1cIKLNS5P4Tl2hUYuQ3Q4oc605Ruc=;
 b=jzSf0vhNPwZq2gT1d4YJAEUcnEm2bgRQdc6gfnmEK0za9BRZLL/kcxTEBeo04a6FbO
 KS7mMk9lLwXti2vMvVUpNS4N10NAnQg7x3/QqeWQGyaRH10TExzF4PuEIHnRQZjigQbL
 M6Nt7A7FDhULErKsOxj9iyNNeHRkxBHJCR+pxh/QwHowBpsHF9dJQ7SDd7UWtWIf3QT2
 tKsWGzfs3fn6fMheiTI6LNiWivTo9TyaqVhgyjaMAHaBNvxzTHEbBuUxfy3Bqa8lt/SE
 AbE35iolKXuP6g6vEEU081v2iQaSYjRPqq+iWzvMX3JXqbmY4xQStt82vAVyzO0zk2nD
 HsRA==
X-Gm-Message-State: AOAM532braklPXqj2VdgU050eysPYx60qI13uehd2DvVak3l7LPruf0k
 8FcLXkzZOFq1biAnI7ByQT9fyyq9B/7fc9nS/nuVbbm1CpYL3mOHzMfYdsM46fHNFy7vgoH3XNa
 VxCItKWCzmKzAznv1aHOFejLXdV+/
X-Received: by 2002:a05:600c:4b92:: with SMTP id
 e18mr10110501wmp.71.1621625384785; 
 Fri, 21 May 2021 12:29:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/OyYpeLIFQQtA9P7euza3ZHBvS4POGpr3Wcj1AR1IOx4wP4WYkmEu/V4dSruhwNMjfWVl2Q==
X-Received: by 2002:a05:600c:4b92:: with SMTP id
 e18mr10110469wmp.71.1621625384534; 
 Fri, 21 May 2021 12:29:44 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id s7sm434402wmh.35.2021.05.21.12.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 12:29:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Hans de Goede <hdegoede@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org
Subject: [PATCH 0/2] allow the sysfb support to be used in non-x86 arches
Date: Fri, 21 May 2021 21:29:04 +0200
Message-Id: <20210521192907.3040644-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_122950_637533_C5A540FB 
X-CRM114-Status: GOOD (  13.21  )
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

The x86 architecture platform has a Generic System Framebuffers (sysfb)
support, that register a system frambuffer platform devices. It either
registers a "simple-framebuffer" for the simple{fb,drm} drivers or legacy
VGA/EFI FB devices for the vgafb/efifb drivers.

Besides this, the EFI initialization code used by other architectures such
as aarch64 and riscv, has similar logic but only register an EFI FB device.

The sysfb is generic enough to be reused by other architectures and can be
moved out of the arch/x86 directory to drivers/firmware, allowing the EFI
logic used by non-x86 architectures to be folded into sysfb as well.

Patch #1 in this series do the former while patch #2 the latter. This has
been tested on x86_64 and aarch64 machines using the efifb, simplefb and
simpledrm drivers. But more testing will be highly appreciated, to make
sure that no regressions are being introduced by these changes.

Since this touches both arch/{x86,arm,arm64,riscv} and drivers/firmware, I
don't know how it should be merged. But I didn't find a way to split these.

Best regards,
Javier


Javier Martinez Canillas (2):
  drivers/firmware: move x86 Generic System Framebuffers support
  drivers/firmware: consolidate EFI framebuffer setup for all arches

 arch/arm/Kconfig                              |  1 +
 arch/arm/include/asm/efi.h                    |  5 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/efi.h                  |  5 +-
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/include/asm/efi.h                  |  5 +-
 arch/x86/Kconfig                              | 27 +-----
 arch/x86/kernel/Makefile                      |  3 -
 drivers/firmware/Kconfig                      | 30 +++++++
 drivers/firmware/Makefile                     |  2 +
 drivers/firmware/efi/Makefile                 |  2 +
 drivers/firmware/efi/efi-init.c               | 90 -------------------
 .../firmware/efi}/sysfb_efi.c                 | 79 +++++++++++++++-
 {arch/x86/kernel => drivers/firmware}/sysfb.c | 42 +++++----
 .../firmware}/sysfb_simplefb.c                | 31 ++++---
 .../x86/include/asm => include/linux}/sysfb.h | 34 +++----
 16 files changed, 182 insertions(+), 176 deletions(-)
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
