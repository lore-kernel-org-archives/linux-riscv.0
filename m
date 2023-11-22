Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBE8C61D92
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 03:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GYtLYqBrZ8LdexigyGDvgcDB4aETpRr3qiMRq7WQRmI=; b=TztKRWUdpWDPcj
	/3sDbzbwUu76TlxvIp/a7m8sqBh12sXcRV9Qden/Lz+p49WjgE1aF3tyvHul3VZzl2ZyK7Y8Ilp7v
	dxjQDWfWvlFuPp3oO2pBi1oDbyohiXS9p0SLkyxrtRwDx390wVVfiPsSMZkDpQLVo8W404YpZOibs
	mzH/2hYDeg/CgGBxsJwmD8ZAFxadQiFqSr1yFoPAH6H7WzJ/Jh9POPYTNJ7fbqEsKczOV8bX/cS3G
	0WSCXAbXot7DWcduGu1F7SpyBmRiMrzreBH5AHBCzg7BQnGmd5BGZ9b7xSSws0zQkSPN8Ern0lF8p
	hkjiD5Rp7IQaoxYD6NCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dZR-000VkW-0R;
	Wed, 22 Nov 2023 03:06:33 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5dZN-000ViT-2z
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 03:06:31 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3b83c4c5aefso286748b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 19:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700622385; x=1701227185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n4I/LD7GmsgMbduRtQjHbuBVYFqV+JeYB9eIa+Lz0UU=;
        b=b3ETVAGqExkP6vyv0fd0ZRZ8JRw4I/jAtSkM/fYNVWZiACgN6IXIv0Wspj5OPRnCNG
         AgcFVo1/iXN2FTHLbQzr4wkJX2ATe+RQAPoi0XoJhngUxR+1NlTuVTqHir1VCH+2p3qU
         Wf1JOHLLVFiFqfLZjPBkrK9owsIbICo2CNI2Mvo0qDTuB5uiyaO4wf9tKoJkAZlwl1tH
         1I4VO17j++jfVszv4S5IWqTZtB72dF7aFnUzfdEcjQiuqewh4SfErksvhCqBfvGcCWcW
         Fg3N8P4eVOxc2HH8CH99uBFYELhuG/1iJGzEFt1nHIX8nBtcXfyCYx3E/HyRnSsMJhIQ
         TtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700622385; x=1701227185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4I/LD7GmsgMbduRtQjHbuBVYFqV+JeYB9eIa+Lz0UU=;
        b=QOLzG6VhQ1CBkFTF3laiQf8vv4fDBsyowpnGG5yhq3DaIRMKYUSS69pky8AUv9a0+h
         Jt/SOtT/naArVP4Fn0/bih+vc/cW2W029j2y64nlz5zM8cQvAW92CTM5PfcfHGNnyfk8
         iz5fue7TblWHAxb/MLWWdo1ko5/QyeNLGJ3q1/xPVChUTZaGJb64nkMqC3LCxYvLEwK4
         82rElREXA6nVw+jcOZJM7eM1W3NqdLEL2ON2rOr0P6+D/IZwli9LOGFDrdJDWqj+PsXy
         iXpHRVrNF0scOuvIaqGGeLhVn61lGBtKI6xlLcgZ8jxN6Hyrr9+IpawQPMlo1HtKsLtJ
         sfag==
X-Gm-Message-State: AOJu0Ywf9VbUKXbrNO93Xh3y7Z06zxhLbntPItEsrJJ3LxExx8SnURdp
	fIiNGn3kvtGx9ii1RWo8BI32Cw==
X-Google-Smtp-Source: AGHT+IEIpXI2h8pXg+ykpqNNYZiarqi3t5LKkDhtbal14Y2nnzqjhX+0ng3mTUwJLxHE3tG0iOG9Lg==
X-Received: by 2002:a05:6808:bce:b0:3b8:3ec6:8a41 with SMTP id o14-20020a0568080bce00b003b83ec68a41mr673776oik.45.1700622383389;
        Tue, 21 Nov 2023 19:06:23 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s2-20020aa78282000000b006a77343b0ccsm8614917pfm.89.2023.11.21.19.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 19:06:23 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/3] riscv: Add kernel-mode FPU support for amdgpu
Date: Tue, 21 Nov 2023 19:05:12 -0800
Message-ID: <20231122030621.3759313-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_190629_985518_882AF37B 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

This series allows using newer AMD GPUs (e.g. Navi) on RISC-V boards
such as SiFive's HiFive Unmatched. Those GPUs need CONFIG_DRM_AMD_DC_FP
to initialize, which requires kernel-mode FPU support.

I'm sending these patches as one series so there is a user along with
the infrastructure being added. I assume patch 3 would be merged
separately, after patches 1-2 are merged.


Samuel Holland (3):
  riscv: Add support for kernel-mode FPU
  riscv: Factor out riscv-march-y to a separate Makefile
  drm/amd/display: Support DRM_AMD_DC_FP on RISC-V

 arch/riscv/Makefile                            | 12 +-----------
 arch/riscv/Makefile.isa                        | 15 +++++++++++++++
 arch/riscv/include/asm/switch_to.h             | 14 ++++++++++++++
 arch/riscv/kernel/process.c                    |  3 +++
 drivers/gpu/drm/amd/display/Kconfig            |  5 ++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c |  6 ++++--
 drivers/gpu/drm/amd/display/dc/dml/Makefile    |  6 ++++++
 drivers/gpu/drm/amd/display/dc/dml2/Makefile   |  6 ++++++
 8 files changed, 53 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/Makefile.isa

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
