Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33452C36001
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 19:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3wNCZsaOM9Xvl+93haxc5O2CBsjWH3FPCJGd8OwjUNA=; b=wD/HO+O1yzk2Pm
	U8sEnNzjCS/Xu3YaIeg9b6EwdXL3aYpzK2Z5zWxLlc8gArn+2KS/YIQ0zRhUwAHmiJwP0qhLmrPqk
	T7GvJwEYrMqi5jD/jvvlR77yk8PJKgVO/laEOob2gwjF3UCOG5aJIhKmbc89/C9ZxJBM1EEnjOnLP
	z61dfpWpJ+8Al3qAQwhSM1Q8H5rc99pvqaHnXqA+pg9I98BS86N1JEtXVTVtumQQkAWcneeVP3/g5
	XZq6YigMn13udfjskcbZYbt5lcuHMLMjU4MOsy/KzN3qLfiyMP3jniVleMkpFBJX7zH7tvR2tILAk
	6/sYw54I8WkPPeoHKWcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvLp4-0000000D6MB-1chV;
	Thu, 20 Mar 2025 19:44:58 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvLp1-0000000D6K8-0frS
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 19:44:56 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-85dac9729c3so92620539f.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 12:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742499893; x=1743104693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AW49rekhn13ov0fYjoV+6+dgXQ3GIdWnPfM3LeEAqlk=;
        b=GNWRNOPMo4aDE6+Uex3KPN6zM3MUntCs+s6455FqQvQFBbLpXBbi648WjpAxhCf6Ln
         3PvgdEh0sEHLgbMSBd8CZ+wJLO7ZEBxm5p7tmPRXQHOKze9wQCyrt07fIV6dDjzb0Z5u
         sKJVRJhTXvrawUXVt+9QANCsU3h8UxgShPqI/LqM3sYFqGsizHdZx1mLwOUHmOfoQctD
         D+TmfhC74rGeFA6tyLJ4KnIBTtbXIDO6EIDPoM+hKwznw4EzxsiOYpSP34pFo3bthkxq
         iuf5E9/kea1roqqsKBtDySdcedNl/qNg0aFhJ/iJo0LbI/6z3VRlU3ELjdhDoytZhjdB
         BcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499893; x=1743104693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AW49rekhn13ov0fYjoV+6+dgXQ3GIdWnPfM3LeEAqlk=;
        b=wxmCz+Tk3cvhlsj1uZKw7MYkA9wfi/eKHAI2tU/dKpfSfCCTFFkd6bu5hknIqkM6wz
         Nl7SUwXxFcJyNEmuVIMpAESa4ThXNOg0HrnoBVbIoXMCM/ihtw0ZmbEfO8Aer5Lqngk5
         rK9GTQQX5iAV1zSoOa6DRa07Dmp7Zq4a094/w72Rm82KZrxBjrWyWdjwE0wi5vJIVKad
         cDcWvoG89YaI4ApKMsIAbFPDfmwNnFnW3Ficrss1Omnj2UDLUGmH8gEQzUqf/NhLd7D+
         wBTr6D6C1iPag/Lgx4J51qWczYpAByYy8XghfUJDH7FDQXF8sMDINGRwTy+NO8GaUbk8
         ZMTA==
X-Forwarded-Encrypted: i=1; AJvYcCX8hkPqWIFI4He6vgvEwOtO8SdFJsdmaVtAoJW1oXau7etdGByF8Wmh2nDvPhlZuUY86v4E/086kZlM9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxU7ebaGtmo9hug79ice6LbWkhOtYL7IzhhgTu2Wtp1jh+ifabU
	ZybPXehFRnLFOXQwweMCEQCb9u/iUVN8yz9lhio8kl7RHIS1D2uRPLLsYlUNag8=
X-Gm-Gg: ASbGncvUtpk8lI/nkTBma/WZqOq6FW6WXbPPrUFPxGSlLJtrIw3n2qkqd0lDE32vlFW
	Qb3P9/8fKPWEtNE7nNy0LclxSH8on/S+NVqHyOBjpXZzKe1VMc7DOA8liMxakoegxlKwl3V6vCI
	6rLtXPysSTmcNxs5RFoyflY7oWIBf2XKcSQGVBAcDBJknW2neoUBZ6FN8ue6Oya7/NIG+04Fuzb
	EprEScRpzF4SLObz0pphVqxGDxd33E6J4EcnVb3yXTbjwbXgIRwj8osKMy/tl+JBTv0rk3G62gQ
	r45GxRrfM0/geO5VrcUyD9vpdGkHmgMFaidZgBs2BAngEel35EPi9Fur8lGPDaWeezWwdHyTf2Z
	l0ditRHe+qcsgUK6ccWEPLYdQ
X-Google-Smtp-Source: AGHT+IFltPpVI0ACnzJTqj+VKPKw57T57QohZSAekfF3yS1ZRlpAvC4mmTtGWHjmmF2YmyCcadc1NQ==
X-Received: by 2002:a05:6602:4c83:b0:85b:3827:ecef with SMTP id ca18e2360f4ac-85e2cc5ebefmr62134439f.12.1742499893623;
        Thu, 20 Mar 2025 12:44:53 -0700 (PDT)
Received: from zoltan.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c40fsm8341439f.32.2025.03.20.12.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 12:44:53 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] clk: spacemit: add K1 reset support
Date: Thu, 20 Mar 2025 14:44:41 -0500
Message-ID: <20250320194449.510569-1-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_124455_471033_CCD3CB76 
X-CRM114-Status: GOOD (  11.02  )
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

This series adds reset controller support for the SpacemiT K1 SoC.
It is based on Linux v6.14-rc1.

It is built upon the clock controller driver that Haylen Chu
currently has out for review (currently at v5):
  https://lore.kernel.org/lkml/20250306175750.22480-2-heylenay@4d2.org/

It also depends on two commits that will land in v6.15: 5728c92ae1123
("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")
and 7ff4faba63571 ("pinctrl: spacemit: enable config option").

The first patch adds three more system controller CCU nodes to those
implemented by the SpacemiT K1.  The second updates the existing clock
driver with a structure used for OF match data, allowing both clocks
and resets to be specified.  The third provides code that implements
reset functionality.  The fourth defines groups of reset controls
implemented by the CCUs that have alraady been defined.  The fifth
makes it possible for a CCU to be defined with resets but no clocks.
The sixth defines three new CCUs which define only resets.  And the
last patch defines these additional syscon nodes in "k1.dtsi".

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v1

					-Alex

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: define struct k1_ccu_data
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 393 +++++++++++++++++-
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++
 4 files changed, 539 insertions(+), 19 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
