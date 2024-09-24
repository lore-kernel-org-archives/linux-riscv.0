Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91062CF9C72
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 06:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5XtXu3oHOzGJM0Wl0OVGEMUgsIIrNVjaPWY2ER9zpx0=; b=VM1Bdt53aWi8zH
	gEAovo9e2p2i4Efjjz0qmN0MN2Mey/18j9avP/7GP47Uuawoi6EpRldmyzdsewj77Y08FJkK+xs/1
	Xp+QdCHJF0YVk3BoQoJ3y8669wVtgFrKfzwNLZz4sz0uWVhmI2bR3x3Xi9CnLcuzOdQwdYpuUlUDN
	zsEzCYLGQyrrk7Z59xP7Xoyp6ay+AiAOjkxcdCtJa0jMjB+voJYVzdb8XjnCue5VSDhf0j3i0+epi
	0mz2yKgB/E0LujwT3LpKDsCjs4BHAsU73kdMYrLfLjgtU2xFZppoTTBqigYnUB87TXCRxKy76Dexw
	HBoheaNnHj9X6lXr/+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssyff-00000001Acv-3hkZ;
	Tue, 24 Sep 2024 06:05:12 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssyfd-00000001Ac8-08Jc
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 06:05:10 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3a0cdd77dbeso11017505ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Sep 2024 23:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727157907; x=1727762707; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tvw3LV/Oa053/HRs5YyoBZtjEvrfytLSA0lSFHvT0vU=;
        b=jfnzireVJ5c+Hp+/kTM5SjWFrK7HgM1iQMfzLAVP1x5+mWtV31Hk2C7FK0Eh2huv7o
         7bn1dd/I/qTPLC0WCxcd9Q+KDttHignslnYdWgn/XxDNJ4E1ADnfeM/IMEerpaDGSDno
         Z6xCjj0HCRsEK2B5N+FVLF0BQk/qpl2yRcePsKvrp5ZK+0ZGFLJte+kiIfO8GDbQEogU
         l65AjzKUa93JAprb7Sa6tQwI0kEeXwemSnaW2EfS1YTDE1rFNtEqgjJL5P/JsDJRnZ6g
         30JaCsaX3a7kD+S2cYVosdclkfn0woPvCyrXDymV/pxW8fs73ooNSuH62BRRL0dxdISn
         syvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727157907; x=1727762707;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tvw3LV/Oa053/HRs5YyoBZtjEvrfytLSA0lSFHvT0vU=;
        b=CMirQEaDMpZ8HRj4SWPdedHbu9+vGX3TNJIRe9mh7iKl5gK8pnljDn/G0CS3PgWBkd
         gx8v/C834rM8tAkkO/+WrHAPkzxjKVc8O7plLsz0FJtoJYlirRHb+3+Ey5IkkDpwwKQ9
         AAxcynX8/A3TZxXnWJ0osDwWN3EL6exTPoRP7QNXL+uAQV0swQWRIbKXDa33pysX316r
         E4Sr4+X3tq5K/9BRzIiiaLs7WTqDKWQMXC+N2LW7WR0dfAYz2Zm3RDst+Ov2eBOlh7YQ
         6EEuwmX63fRnsdZrY8kUn6rD8AhMZ6g+44+S57Ov6WBlSuFZkg0FS2zgkBRcZfchkT5A
         djEg==
X-Forwarded-Encrypted: i=1; AJvYcCWtg/x7GuQv3yaZmGXDcCWj4ZBIv7A5J24D/RkS7XlJJKhx4SkBEzjCxuLxUU84kGh9haVGD5hx0OjS6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDU+uHNuUPf8Hce1UztszULmM9PVh0C5uCF31prDwh3KJTvo/u
	EXi06JQd2rEUBxwBVvOcwhILXB5AVq2EiUYoV3Mo9+Rd/OSMZNgXrZ6/59M8
X-Google-Smtp-Source: AGHT+IGpCNLo4QJ6irXwU5HSoyr7g5Dv9bZbIL8M1SDI74S0+MW58suHrJ1F4gQLr4eJvuE7YImsLw==
X-Received: by 2002:a05:6e02:1c04:b0:3a0:a0bd:f92b with SMTP id e9e14a558f8ab-3a0c9d251e7mr126778945ab.10.1727157906782;
        Mon, 23 Sep 2024 23:05:06 -0700 (PDT)
Received: from localhost ([188.253.115.253])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c7bcf2sm479624a12.84.2024.09.23.23.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:05:06 -0700 (PDT)
From: Junhui Liu <liujh2818@gmail.com>
X-Google-Original-From: Junhui Liu <liujh2818@outlook.com>
Subject: [PATCH 0/2] Add initial support for Canaan Kendryte K230 reset
 controller
Date: Tue, 24 Sep 2024 14:00:39 +0800
Message-Id: <20240924-k230-reset-v1-0-d0cdc11989eb@outlook.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIdV8mYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0Nz3WwjYwPdotTi1BLdVItkU4sUkyTLZCMLJaCGgqLUtMwKsGHRsbW
 1ALFe0xlcAAAA
X-Change-ID: 20240917-k230-reset-e8c58d4b9c28
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhui Liu <liujh2818@outlook.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727157904; l=793;
 i=liujh2818@outlook.com; s=20240831; h=from:subject:message-id;
 bh=7Bju4tPN08sK/lIov1ISdks7vzglYBiJ5e6Upqyixn4=;
 b=rqfaagOttMhupkn9HS8faJChX+Cedq+xMMDSoqNzCxRnRgQ5UrkJx2vU0QYF/y04JD8OCl7LY
 2Ln/MCdaITuD3LOiqhepTMbGZGHSejMadxQjueTFXNZm6p8c1hr4cOK
X-Developer-Key: i=liujh2818@outlook.com; a=ed25519;
 pk=UPJ4WEhX1Oe+1ABSe4UlisQyfljdECO+XeTLv1VxTuY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_230509_103092_98A8DCBE 
X-CRM114-Status: UNSURE (   7.84  )
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

This patch series add reset controller support for the Canaan Kendryte
K230 SoC.

Tested on CanMV-K230-V1.1 board.

---
Junhui Liu (2):
      dt-bindings: reset: Add support for canaan,k230-rst
      reset: canaan: Add reset driver for Kendryte K230

 .../devicetree/bindings/reset/canaan,k230-rst.yaml |  39 +++
 drivers/reset/Kconfig                              |   8 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-k230.c                         | 321 +++++++++++++++++++++
 include/dt-bindings/reset/canaan,k230-rst.h        |  90 ++++++
 5 files changed, 459 insertions(+)
---
base-commit: abf2050f51fdca0fd146388f83cddd95a57a008d
change-id: 20240917-k230-reset-e8c58d4b9c28

Best regards,
-- 
Junhui Liu <liujh2818@outlook.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
