Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAE1D0D17F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 14:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xBFvg/BW78ydX+W17mZMED1yTp7CDGXn+V7PZSwXqHs=; b=EPleZx9/yGiz4A
	WdoBsN+/4d5dViI3BBr2LqJPHF5Ce5WsXGdpacYrhonPvaDOZsayEVoF28CraeJoV5Xml1E6xlQ7u
	lc6YbpsRWsdKzJ/4+/I0VfEjrRcxDW6XfHqAdYvhGiG+pKBshBU8om11by3PXjBRrtK4U5Z34P4ak
	0509mdLfsivAVP4oVxNf/XFCj6qjXis1Qi+VQwRwBDp9S7w9q+DxhSOu10TS12AWNj4fzMvw61xY5
	c2oCCd+IACGdDHwrmQ8O1F4nzlXmyAMVjUXGafRpuwvUwXbJjgi7bCQlRuy9fm/viPdIN2TdghCTY
	ipS5BELiFeWRiC+qYZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdquf-0000000HKT3-3Xgo;
	Thu, 08 Jan 2026 14:22:57 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdquc-0000000HKSK-2TEk
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 14:22:56 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso2370354b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 06:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767882173; x=1768486973; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vG0owjBEwvZUXN6LOKfNDq1Vj4x+0iuwUy6IyITQKNQ=;
        b=0MjDqJ2gJrkY9bjDf2cYiiDWKKwNpyY1dAx8p8qdFgKfdYnf5mdZzGCXraHwknNbuF
         MdtTZpagjZus9pLRaCMClCqN95YNktwKstRVxI7BcO0h/Bw+pzg5xYP4LHSUp65nAYgY
         t0e+ACyqeXGq6y++/PhbOodiOMY8XFNAuSb9TmuVtTKiqbC4Anf4Onnur3ncAw94o7sd
         9lp2ks5JENpQeu1krseGDmD0fOwcv3kX0yFE+xwFQl/+8YSQCoHHm3qtZw7TiHDNBJRs
         bPjyeOuKcWw0vPqGkUvRubhiG2FylnEfagatLQ+IIJODo2E9dIpyVRbi94ELx3KQOwKX
         wh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882173; x=1768486973;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vG0owjBEwvZUXN6LOKfNDq1Vj4x+0iuwUy6IyITQKNQ=;
        b=D7MogUuILj9vgEHW9a6sOHADdM9/q3zaNzeariyFeJ29sPWb4Ni1f3heA4Nlfnik8h
         t/xdCxIhcQq53YGUQCFQoL3zQmci6FnEAikuNsQXwf+7MaYiZjNwVOjQtDGX4M8aCMTs
         fMEINFigBnm2bFIvzhf9cRbthbtcFh4ptjwvLD9McmYZ7Y2Y9Lq5eh+lbVqltFvz44TB
         UrnUVT0dx1qMijdt+//cc93KwQXW6B4j0u985jD7vuZi3sqYE/tuW4KX48pDK6Pn+2Xp
         o7R2Z/Gk+q5PTxF/hXFfVTFi0AjVjtkaDVcHajxbqs2osYLTrQ00BUij/tPUOeactMkk
         Zqrw==
X-Forwarded-Encrypted: i=1; AJvYcCU8EvYS0Ik45gkGz7gtpFYpNqiNY7rBZqwYbFhaV7hthqBRrlFjMWqfNYuO7vnTs2OGD+zedzogG6urzA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6ICvyLQRfjGEXQHB06FnVDRw6hHRuiEXNoG5RHbxjSBdott02
	BOG3DqCDoeOJZ4I3IZULk0pmurHJVrcO7OiKCj4e/VwbPGhpI4DJrYfJ3CEasgcgTek=
X-Gm-Gg: AY/fxX6LHuP8vMNqmBeRcxGsFeKJqJLIHHEicW988/4j/R2H99II7UJGebIIBFv+T1B
	Mg2IloV4WwU8A8vKznoX7ec56emzHbqLNjOV6qGPGCSlHjN57MCXgVj1rrdeqMgaQG/3MsGim6A
	quY4lC8vuGVov0z3eMr/1eFrLy5VfvtIWL2ZmKpk/2Gp5rbqvhFnrblH1VdrHLqXTur3l9eUYUx
	f6ajWCTW3v1S3PiGBQIQ5+nqQ3KM2Tb5m+dJXCD/XHahs80AhuTrDfDls8KW14+ew3rwQau3Gul
	loq0caJKHONNsTlhPFrn6zaexFzaMGJMHyCA2MisiqffRDXXFSVZvendrm7/9ErEl8uxdOaGkRa
	HQSVfJCmihzfZjNSpzhbRkGcA2/lSzxXoZf18yhNBbFFc3YZAFeZyDGmOrWY3JOrsAkk+losICg
	DffJdl0WNSxRbK48K9pGwjQieyi/T/I+w=
X-Google-Smtp-Source: AGHT+IGhx3A/wj4Hk+582JwjqSFzDkdpdx1sot8ZL2RVpGltKUxE6QM8Lk2cKloIC492Mbf2xP4Tng==
X-Received: by 2002:a05:6a00:8c10:b0:7c2:60c6:8ca0 with SMTP id d2e1a72fcca58-81b7e92875emr4959062b3a.5.1767882173412;
        Thu, 08 Jan 2026 06:22:53 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e7c16sm7927906b3a.53.2026.01.08.06.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:22:52 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 0/4] reset: spacemit: Add support for SpacemiT K3 SoC
Date: Thu, 08 Jan 2026 22:22:13 +0800
Message-Id: <20260108-k3-reset-v2-0-457df235efe9@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJW9X2kC/32QzW6EMAyEXwXlXKM4hJ+gqtr3qPYQEgPRLqRNK
 Gq14t0b4LaVehzL89kzDxYpOIqszR4s0Oqi83MS4iVjZtTzQOBs0kxwUaIQCm4FBIq0QGNVV5d
 IfaGQpfWPQL37PlDv11MH+vxKxOUcsoli1AexzV5PICqOokGVS8lVLQDBzd6MTk/6Mkza3XPjp
 7cd/2yuOPIGeAU3BHO/Qdqb/AyrBA6dtn1VlEoVtrgMNC/e5z4M/3BSqh2ylskthUbsaqlt2Ty
 7Ox3pOOWWNlurHBUEI9med3Rx8eHnaHLFI/Df0lZMB8hqXsu6s5TeCy6auOiwB2XXbdt+AWxYk
 mmTAQAA
X-Change-ID: 20251229-k3-reset-8d9b751ef391
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_062254_638770_550345F3 
X-CRM114-Status: GOOD (  11.34  )
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

This series adds support for the reset controller found on the SpacemiT
K3 SoC.

The K3 reset controller shares the same architecture as the K1. To
facilitate support for both and future SoCs, the existing K1 reset
driver is refactored with the following changes:

1. The existing K1 driver is moved to a dedicated 'drivers/reset/spacemit/'
   directory.
2. Common reset operations are extracted into reset-spacemit-common.{c,h}

The K3 driver is implemented using this common infrastructure.

This patchset is based on v6.19-rc4 and depends on the K3 clock drirver
patchset [3] and the K1 common clock work [2] and [1]:

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/lkml/20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org/ [2]
Link: https://lore.kernel.org/lkml/20260108-k3-clk-v5-0-42a11b74ad58@gentoo.org/ [3]
Link: https://lore.kernel.org/all/cc1cb833-2c4a-4e20-a50d-109a4919e274@riscstar.com/ [4]

Changes in v2:
 - Patch 1:
     Update the commit message to explain the why.
     Update the spacemit,k1-syscon.yaml to point to k3 reset IDs
     header file.
 - Patch 3:
     Use dev->driver->owner for the reset controller owner instead of
     THIS_MODULE to fix the module reference counting issue pointed out
     by Krzysztof Kozlowski.
 - Patch 3 and 4:
     Update the K1_AUX_DEV_ID and K3_AUX_DEV_ID macros to a simpler but direct
     form, one benefit is to improve the code readability. More discussion
     can be found in Link [4].
Link to v1: https://lore.kernel.org/r/20251229-k3-reset-v1-0-eda0747bded3@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (4):
      dt-bindings: soc: spacemit: Add K3 reset support and IDs
      reset: Create subdirectory for SpacemiT drivers
      reset: spacemit: Extract common K1 reset code
      reset: spacemit: Add SpacemiT K3 reset driver

 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   8 +-
 drivers/reset/Kconfig                              |  12 +-
 drivers/reset/Makefile                             |   2 +-
 drivers/reset/spacemit/Kconfig                     |  36 ++++
 drivers/reset/spacemit/Makefile                    |   6 +
 drivers/reset/spacemit/reset-spacemit-common.c     |  77 +++++++
 drivers/reset/spacemit/reset-spacemit-common.h     |  42 ++++
 .../reset-spacemit-k1.c}                           | 107 +---------
 drivers/reset/spacemit/reset-spacemit-k3.c         | 233 +++++++++++++++++++++
 include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++++
 10 files changed, 584 insertions(+), 110 deletions(-)
---
base-commit: f10c325a345fef0a688a2bcdfab1540d1c924148
change-id: 20251229-k3-reset-8d9b751ef391
prerequisite-message-id: <20251219012819.440972-1-inochiama@gmail.com>
prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474
prerequisite-message-id: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
prerequisite-patch-id: 96cd13293b888c05f400daf529c3cacf17ddf002
prerequisite-patch-id: 5f6579799919c4e2e12c8c836ac4164b00ccaaa3
prerequisite-patch-id: 11e8d5cbe6f3610aa362dc0051b3173001d0a5f4
prerequisite-patch-id: 622d6606913609be04f66006609550e8c3e7f22b
prerequisite-message-id: <20260108-k3-clk-v5-0-42a11b74ad58@gentoo.org>
prerequisite-patch-id: 44a51fa6a6f0f9d2c5b7bf3295f3272d6bb7005a
prerequisite-patch-id: dce85ac6e4e94b1d2622a8231ddab3de766373ff
prerequisite-patch-id: af1fb571f0d19d72e69dd41d15fc2dbd730b17c7
prerequisite-patch-id: 1318bffbbe6044cb4ef0f77c6756ff96d69ecdf3
prerequisite-patch-id: 8856cecc299cdffcd18acf9a7476175a4d65e62e

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
