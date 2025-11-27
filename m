Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41306D116E7
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 02:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+AFf2o0x3ZBzzd0vCbUvtV8Y4q0LtMIbBLT1yObQm0=; b=ng9mrH+L4pkhE4
	xd5FCd/I4r0qQxOUcHUoxJjdv+RYAiDLAH86qi3uYcEjRQH8OLb9w8FPOuVjRJwIXP/gezkZnYXzR
	e2c5FVnplHOICIy2Zd02qcL9mpbZ3j2qonhD1mI/9U6ga94/rC+omS3w7t8dpwXFQgYpIn4Q2ldEo
	IDtmY/yYLRFt8znRwVzvs61ipXz/qjNOyFR6yPWgMN1zuz0ngr/McWrbRHj7ag9elvoB2Wb8oV1hb
	oYyDoPEcaGiyqddYMcO504MSiA1kVWfjFPhottNZUWKp7SsKC4K0OOulYClZUT1M7yUeQcyJ0wkZJ
	9KPr0d0AT3S7SmQIE82w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORcX-0000000Ft6O-2qb1;
	Thu, 27 Nov 2025 02:20:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vORcV-0000000Ft5k-0Ij4
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 02:20:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-477aa218f20so1667155e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 18:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764210029; x=1764814829; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4URCfDbXaJDpqc3Jy/ygM5tnfYeP0a6DjdNrUnYNok=;
        b=KtPoM2OYhSd1gE3+UPfXeoJQ+jHC1e/ZwoswlhYVg5+bKh0VtvMZQ5n74X8eaqvlms
         C+aQOykzcczoWn/joGcfo1b+a4am6MOabN1Di5v1QLVQeLFbe+HvLY62gc+c+6G8t+yW
         +K79a3RLdPYwcYRWqVXzVaIJL/NRCxZdrGXfzwuFNyDCECOqjhpDf8pbv80LNk67BjaW
         6KyR6u47tB07uOAGNMpG25zw4DC3vLEMNVE6+Y4tmO3epFU/VAvz8uJL/TX6wcALltdQ
         zgKmFvlaX7mIOIopC6h1rquLrzFA+lEsY4TPP/09c0AjH4PLJzJQ/R9LJeGO0IqPw3uu
         vX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764210029; x=1764814829;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4URCfDbXaJDpqc3Jy/ygM5tnfYeP0a6DjdNrUnYNok=;
        b=TbJGp0D7z3G3XjzmIPuQvbPsm1M1n1TJjU1K6+i7mG/kMbdFhLqlGNi6s3O9hz1NPi
         NDf2udqEAj8EI3noNM/+2iOA1sQq3nNI+1nJvQTjweZo34Q52Y8Tf3FeoaKmqouH0gpE
         hyPBwW2ry53bMPVVymZHILpD+Oxw8BaAFxLnWUtecAl5VIGWzbn/DzNliu8blVmzIJYc
         +OZg4M3coqg4ImzBDkUUifnb0R0zjRe/HyT3+Br4co9ru2ER8jJmZyrk4Qwh+qPAwvbd
         TG1rnGjLWyw1xOrIAv1TPV9Bz4Xh9AU8ZVLwvHmt0fM7om+50rArhPEZDfmJa5rr5mKJ
         dClg==
X-Forwarded-Encrypted: i=1; AJvYcCVWBZGnz38lESoE6TR83FFu5Wb3GcIBwkZQY9GPjtxUVUTvHCZr4d6MYqdhUD3m65D7mYqwoGomX/2cuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGf39VKyc5nLk4DoI8unsSFFDNfcqBtFwn+eZUB1zYnv/TYfJG
	+uEsVqRd25J35OVvQZHQ3ZDcVs3IYUL2XgxXOqOdWM6tTXgwWcoEYEZVyGeg2tzRIvs=
X-Gm-Gg: ASbGncvhXdRNgPUfpUA+Y1Xie08jeJZhDsxkTqj3zTVFo+Y4xYnjruU7TY/ulgZv6eI
	381nC38t5veoVC149UPeD4l6SXTMcLrd5OnmtXmqD+tpyvsSxZOaWwsBRNOHB1pZYaWvhV6Hp7T
	8QRqKhfKXhIzdayjTqpkCzI2/vr2NlepdZkDT+ma2tYlg5JJ4+TmzzFCTYDjwrzV21THC0/ATBq
	Yf19hVM5Gh+0nT+Te7lKOeGJPfvnPB/Y0S/XdNUSO547XaVvUAEhIFkso913kJ4rmCB1WhxL7g8
	MSvZ2Z1g/wKkdrUvWymtnRg86l55GRinodlcydyHqcqPUNuRFtK7Wj1sfAOo23FbK4dNeL60UCb
	+/4u8v7bmBGoj9MmU59Q9Ll0J5KOHGTheQn2zT0ZaWsB3Q1nx8MoFsEe1IaIT2czaEp7ByfMUjT
	j0K2sRdlYMtcpyxuvJqFvmyy1Umdm0Ai7n
X-Google-Smtp-Source: AGHT+IGspC1YV2yyiMXXnAe8/Td7EsFQhaqJU5qYzu5f0NQl+Us+ioM0vDMgGxEbw6PNx9+MNqPMRQ==
X-Received: by 2002:a05:600c:474b:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-477c01b494fmr204934695e9.19.1764210029052;
        Wed, 26 Nov 2025 18:20:29 -0800 (PST)
Received: from r1chard (1-169-246-18.dynamic-ip.hinet.net. [1.169.246.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b20b5d6sm67743a91.6.2025.11.26.18.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 18:20:28 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 27 Nov 2025 10:20:20 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
	javierm@redhat.com, arnd@arndb.de, helgaas@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 0/9] arch,sysfb,efi: Support EDID on non-x86 EFI
 systems
Message-ID: <aSe1ZBXa3JBidhem@r1chard>
References: <20251126160854.553077-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_182031_162422_EC871E33 
X-CRM114-Status: GOOD (  23.77  )
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

Hi Thomas,

I am attempting to test this patch series but encountered merge conflicts when applying it to various trees.
Could you please clarify the specific base commit (or branch/tag) this series was generated against?

When testing on the next branch on commits 7a2ff00 and e41ef37, I hit a conflict on PATCH v3 4/9:
patching file drivers/pci/vgaarb.c
Hunk #2 FAILED at 557.
1 out of 2 hunks FAILED -- rejects in file drivers/pci/vgaarb.c

When testing against 3a86608 (Linux 6.18-rc1), the following conflicts occurred:
patching file drivers/gpu/drm/sysfb/efidrm.c
Hunk #1 FAILED at 24.
1 out of 2 hunks FAILED -- rejects in file drivers/gpu/drm/sysfb/efidrm.c
patching file drivers/gpu/drm/sysfb/vesadrm.c
Hunk #1 FAILED at 25.
1 out of 2 hunks FAILED -- rejects in file drivers/gpu/drm/sysfb/vesadrm.c

Please let me know the correct base, and I will retest.

Thanks,
Richard Lyu

On 2025/11/26 17:03, Thomas Zimmermann wrote:
> Replace screen_info and edid_info with sysfb_primary_device of type
> struct sysfb_display_info. Update all users. Then implement EDID support
> in the kernel EFI code.
> 
> Sysfb DRM drivers currently fetch the global edid_info directly, when
> they should get that information together with the screen_info from their
> device. Wrapping screen_info and edid_info in sysfb_primary_display and
> passing this to drivers enables this.
> 
> Replacing both with sysfb_primary_display has been motivate by the EFI
> stub. EFI wants to transfer EDID via config table in a single entry.
> Using struct sysfb_display_info this will become easily possible. Hence
> accept some churn in architecture code for the long-term improvements.
> 
> Patches 1 and 2 reduce the exposure of screen_info in EFI-related code.
> 
> Patch 3 adds struct sysfb_display_info.
> 
> Patch 4 replaces scren_info with sysfb_primary_display. This results in
> several changes throught the kernel, but is really just a refactoring.
> 
> Patch 5 updates sysfb to transfer sysfb_primary_display to the related
> drivers.
> 
> Patch 6 moves edid_info into sysfb_primary_display. This resolves some
> drivers' reference to the global edid_info, but also makes the EDID data
> available on non-x86 architectures.
> 
> Patches 7 and 8 add support for EDID transfers on non-x86 EFI systems.
> 
> Patch 9 cleans up the config-table allocation to be easier to understand.
> 
> v3:
> - replace SCREEN_INFO table entry (Ard)
> - merge libstub patch into kernel patch
> v2:
> - combine v1 of the series at [1] plus changes from [2] and [3].
> 
> [1] https://lore.kernel.org/dri-devel/20251121135624.494768-1-tzimmermann@suse.de/
> [2] https://lore.kernel.org/dri-devel/20251015160816.525825-1-tzimmermann@suse.de/
> [3] https://lore.kernel.org/linux-efi/20251119123011.1187249-5-ardb+git@google.com/
> 
> Thomas Zimmermann (9):
>   efi: earlycon: Reduce number of references to global screen_info
>   efi: sysfb_efi: Reduce number of references to global screen_info
>   sysfb: Add struct sysfb_display_info
>   sysfb: Replace screen_info with sysfb_primary_display
>   sysfb: Pass sysfb_primary_display to devices
>   sysfb: Move edid_info into sysfb_primary_display
>   efi: Refactor init_primary_display() helpers
>   efi: Support EDID information
>   efi: libstub: Simplify interfaces for primary_display
> 
>  arch/arm64/kernel/image-vars.h                |  2 +-
>  arch/loongarch/kernel/efi.c                   | 38 ++++-----
>  arch/loongarch/kernel/image-vars.h            |  2 +-
>  arch/riscv/kernel/image-vars.h                |  2 +-
>  arch/x86/kernel/kexec-bzimage64.c             |  4 +-
>  arch/x86/kernel/setup.c                       | 16 ++--
>  arch/x86/video/video-common.c                 |  4 +-
>  drivers/firmware/efi/earlycon.c               | 42 +++++-----
>  drivers/firmware/efi/efi-init.c               | 46 ++++++-----
>  drivers/firmware/efi/efi.c                    |  4 +-
>  drivers/firmware/efi/libstub/Makefile         |  2 +-
>  drivers/firmware/efi/libstub/efi-stub-entry.c | 36 +++++++--
>  drivers/firmware/efi/libstub/efi-stub.c       | 49 +++++++----
>  drivers/firmware/efi/libstub/efistub.h        |  7 +-
>  .../firmware/efi/libstub/primary_display.c    | 41 ++++++++++
>  drivers/firmware/efi/libstub/screen_info.c    | 53 ------------
>  drivers/firmware/efi/libstub/zboot.c          |  6 +-
>  drivers/firmware/efi/sysfb_efi.c              | 81 ++++++++++---------
>  drivers/firmware/sysfb.c                      | 13 +--
>  drivers/firmware/sysfb_simplefb.c             |  2 +-
>  drivers/gpu/drm/sysfb/efidrm.c                | 14 ++--
>  drivers/gpu/drm/sysfb/vesadrm.c               | 14 ++--
>  drivers/hv/vmbus_drv.c                        |  6 +-
>  drivers/pci/vgaarb.c                          |  4 +-
>  drivers/video/Kconfig                         |  8 +-
>  drivers/video/fbdev/core/fbmon.c              |  8 +-
>  drivers/video/fbdev/efifb.c                   | 10 ++-
>  drivers/video/fbdev/vesafb.c                  | 10 ++-
>  drivers/video/fbdev/vga16fb.c                 |  8 +-
>  drivers/video/screen_info_pci.c               |  5 +-
>  include/linux/efi.h                           |  9 ++-
>  include/linux/screen_info.h                   |  2 -
>  include/linux/sysfb.h                         | 23 ++++--
>  include/video/edid.h                          |  4 -
>  34 files changed, 321 insertions(+), 254 deletions(-)
>  create mode 100644 drivers/firmware/efi/libstub/primary_display.c
>  delete mode 100644 drivers/firmware/efi/libstub/screen_info.c
> 
> 
> base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
> -- 
> 2.51.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
