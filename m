Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C790AD2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 11:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RllR8ydRH+CQ8JaP0Y5+KhAM87Sq7RYryCmPiVFtve4=; b=X7ewhbx+HiWlUg
	WspmX7tc3YS6vje/ZDvlPrtwZ5hgaxu5ndJJQEQ/TLkVl+mT0eVSTK4bX3t+BI24HrXyxH4u80V3x
	380NqdUca2dFGZWU76rEChR5Hh1lquFYA6YIP8Q57Fw1GI5SfAusFRdvnS9XU8kJw7ySGN+g2iCKo
	xjI/XEKZkWc4aAu4V5eZl53P/TqALc5ic6PQpRNH3ZYxTA6dgyw5nmLwHU+iGEhoY1NfXC1djFqD4
	98KnnosnPHuRAHcRGmN6W/tYX4nT7f9UnpfD4piBSjnQsMiiJX3HdLb09Mcn4Fo+HX/T3abW6+Fmb
	Lib24uB9vhBBW5nB3Cvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9dg-00000003g4f-3TBL;
	Tue, 20 Jan 2026 11:11:12 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9dd-00000003g3r-2eqD
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 11:11:11 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso3103077b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 03:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768907469; x=1769512269; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmdP9sVSN2cHqDVsJHM+ds9zx07/+5KgfWHAIVzEViY=;
        b=Z6r5l4N/caswf80MPtV7BIejeGfZ1968TATw93zeiAHEfEESGtjJVKKCvt9QItH+bo
         SopDidoVBDEMFF+wdJ1WwiWQ4Fczz7ZEoZwxSQrwl0/TBkgxf4cbfnqeiYe8uomyZg4g
         SpZisZ+1LG7maIIUOqMWZJ3Po6dVGN4RdVMPmVFdWQbqHxuAMpFBAnsMyVE5YKuF20Na
         fqTlRaDJmb6+6KUx4B1QOl6Zh52nd910XlXlZ7Y47HvUPD2xf5Tn8Cp+0f3RYsgzB1p6
         Uoi1+iUnA/u9m2cuK5N/gfRPIsq8uzOrFWzKLj/X7g58lBYCRtRwoPelbZvEa6oQlYNf
         cPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907469; x=1769512269;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmdP9sVSN2cHqDVsJHM+ds9zx07/+5KgfWHAIVzEViY=;
        b=gI6v+WIkCZofqRpzptuKxZv4JannqBh7Q/GeKAXBStDamkef6CTaamD5ULFa/TrniV
         P5QuDg3bE5w8aG2os4wwLpGGo4CPiKWmf3aYROiS779ZpVZvavVlHXaDlClsjAIQONG8
         b4qUyCyoKGPvCA41xuwPVww3ZbTHyut409+RnHvOzAOxcU7wHsUeNkB73IR49hCb/3D2
         pPYU7XYu2GdnVEnxnUqT7Sld5oBG8chDJglWyQG7bI8Wdyw+I1+omCmej+5NI2iq0Ib+
         whAKqgMzdReS4+AubzMHsnJ+rsnrbAir+swY/BAGXA23b5UIpN+m0Va6pwH0hxVi1DrX
         a20w==
X-Forwarded-Encrypted: i=1; AJvYcCXs/vlXjnaw39ROuCVuLHhQtzTG/pe4uOlToM4mTnl+Fw5JqEGSWfg5Uj8zV2U8PbozvII9gCdV9zwfHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXm8kvLwxtEuVVVPb204dPZ74hHX9sD+tgbgAdl06VEBDF5Kx3
	PTEemBHH2TSZV77PSRGk7FMgtpgWGTxaU8xao+i3cDU09MPJ3T3c+wUXpLlJ379fvX0=
X-Gm-Gg: AZuq6aIgD2R3tjV4E7rBmKavNGR/2tLaxSAXTSZiZr27TD27OoD7jVxuZyjpVUzWyEA
	cql3F5IUjHBmEGB+wrT624vpq+1Tk87qCGgNx5s7WjlBVarcamBefBW79+jWl6PPvuLaMnUUaw5
	vQYxvgS4f2v/QWoNOgvpN3S3U8whdpGwcj1NY5Mym0ES9U51svNB7yNYgHcdPvCsvdJZYgcn/Rg
	cisOE+GNRKLb017LjAU8k7NCLzfIa9Zfb4cWWEY56RAaMc5tDXX51wJtvL4THnBXwbXMpJ9DXtJ
	mnDPVwDgiWNteuW2usX08SIWmnqWO6pWFmN4/76gfHcc/0L7uoARiko7szLPNgu84xLsmUwXa0C
	3YQVbQdz6Ec3V7LgjMV4uN2UbNlGV1zo7dgSUbK71lV71twS5yjfxydeLdxDzDGVZTdzRXnZ1Dd
	fj5DX3awyMSQHO7V6gn2wUo3YG3YCnfPw=
X-Received: by 2002:a05:6a00:1797:b0:81f:9b0a:812a with SMTP id d2e1a72fcca58-81fa1780e68mr11976552b3a.14.1768907468605;
        Tue, 20 Jan 2026 03:11:08 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4015])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10efc6bsm11398349b3a.29.2026.01.20.03.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:11:08 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v3 0/4] reset: spacemit: Add support for SpacemiT K3 SoC
Date: Tue, 20 Jan 2026 19:10:48 +0800
Message-Id: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALhib2kC/2WOSw7CIBBAr9KwFsOn2NKV9zAuaBksMW0VkNQ0v
 btIY2J0+Sbz3syCPDgLHjXFghxE6+00JuC7AnW9Gi+ArU6MGGGCMibxlWMHHgKutWwrQcFwSVF
 avzkwds6p03ljB/dHKoZtiFrlAXfTMNjQFCPMAafqgVAq0VvorQ+Te+ZXIs3G/9VIMcGgFanKq
 tWg+dFZ3/mg3D6Vcyeyj5vapP5yWXJLUWnDuAAD8sdd1/UFdJX0pBABAAA=
X-Change-ID: 20251229-k3-reset-8d9b751ef391
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_031109_928009_C4A5AC69 
X-CRM114-Status: GOOD (  14.61  )
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

The clock driver changes, which defined new auxiliary device name
patterns for reset on K1 and K3, have been applied to the clock tree.
To facilitate merging, Yixun Lan has created an immutable tag
(spacemit-clkrst-v6.20-3) within his pull request to the clock
subsystem [1]. Hence, the dependencies mentioned in v2 have now
been deblocked, making the reset driver ready to be applied, if it
gets approval from review.

In this version (v3), the entire series has been rebased and tested
on top of the linux-next tag: next-20260119.

General informaiton about the series:

The K3 reset controller shares the same architecture as the K1. To
facilitate support for both and future SoCs, the existing K1 reset
driver is refactored with the following changes:

1. The existing K1 driver is moved to a dedicated 'drivers/reset/spacemit/'
   directory.
2. Common reset operations are extracted into reset-spacemit-common.{c,h}

The K3 driver is implemented using this common infrastructure.

Link: https://lore.kernel.org/linux-clk/20260114060410.3340540-1-yixun.lan@gmail.com/ [1]

Changes in v3:
 - Updated dependency status and base information.
 - Patch 1:
     Add Acked-by from Krzysztof and Alex.
 - Patch 2:
     Removed trailing blank line from Makefile.
 - Patch 1/2/3/4:
     Add Acked-by / Reviewed-by from Alex Elder.

- Link to v2: https://lore.kernel.org/r/20260108-k3-reset-v2-0-457df235efe9@riscstar.com

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
 drivers/reset/spacemit/Makefile                    |   5 +
 drivers/reset/spacemit/reset-spacemit-common.c     |  77 +++++++
 drivers/reset/spacemit/reset-spacemit-common.h     |  42 ++++
 .../reset-spacemit-k1.c}                           | 107 +---------
 drivers/reset/spacemit/reset-spacemit-k3.c         | 233 +++++++++++++++++++++
 include/dt-bindings/reset/spacemit,k3-resets.h     | 171 +++++++++++++++
 10 files changed, 583 insertions(+), 110 deletions(-)
---
base-commit: 6ada99659c6d6a0cde83e6c0f4ed0ef0ba1867e1
change-id: 20251229-k3-reset-8d9b751ef391

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
