Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECBCC83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TB0QY2KavSGDPkws1xahK860cD5cgbvFrflJZtpZjzA=; b=qTtb4vlhqLBzAN
	tXvnVdfU2JlxcAJPZVlDQcA1izFA9ihxLsfIbCbNJ6i4LQPsVoyrHElB/orgp6r4VjpzeKKZvLD1x
	82/AT2nJpvqpIZlM8J06T6dHGbhlCtU8EnayVVsf7fxSruQw4KeyZ/lLr0bXkLQzRt4vnJyK53tKR
	eWIjkdzohuL3LEQk0+DN0AG8wk4uWIrNM9iqufQxHGEpevOa8fC558Qcxr8hCQhpnOyTB3Ffp8dTU
	bbP8pu+z5nBaPeaW2sLwp41hOTaVSqQLK3MKihwxfEqxQ9+rqu4p2oW4WzHBWCAo9DTf5XraRZykM
	pfgiPVJ+pmxdxmSXQb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOpP-0000000EfrF-27tE;
	Mon, 28 Jul 2025 14:27:47 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugOiG-0000000Eepb-2sAh
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 14:20:25 +0000
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-b3bdab4bf19so3785030a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753712423; x=1754317223; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZbPgCBxEfjAABl7BFhrPe8nrXtS6lUGZ8fQixqxipg=;
        b=fI60dUOYY+bIfnnZ1rzAIT3D9rlwswyauVzhnjeyFTS4zwY48U6IXIcj38sRqgpPga
         usIOfD4tbHk9+WEZ34yh4UxsKFrvSgZKcSY9DOeJz8dX8Tq+T3QmBRZbdVT2bDQpZu0J
         T3EG/kcrSjjCVMzBn2ib5wXYTL+1MFl/x5czBz0wRql8eseuolkWi6zeUKL14wVQuiBC
         RAGsb5l/xQK8kxgcCqoqTljGXFfORCYHLF5564YSK/5v4CjJHE3okIWdNlgR0nPBUv7U
         TxoxPHM8FQXrpqimSMsHUaKt8sZLEpQYcXb7/X/NVBNtMEAhXtAv6OfSDVNsBMs9ukBI
         KwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712423; x=1754317223;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZbPgCBxEfjAABl7BFhrPe8nrXtS6lUGZ8fQixqxipg=;
        b=SqyKiPghchZoERVHff4r+mfldIhsZIUq4w3WLeSICjYL/MrxGCDc32vsgHxp4fLHBQ
         NH61okLrci+DOyBlF4Q8yiFL5Cqnv/gi2oCqE9UFKNJ6CAjxVMRyLwJ89Hjti1pQ9VrW
         7XxhsEZUXXipT0exypluKFJ213Lb3FXPWi2vcFubttq19DrTg3vQYbs0ZayT0rP4N1/S
         N8I15gHlIYyx1QTyrSacC3/5q8Mhwy1iPRSnB+TC6NmRvuspIi/BWhE2BHU6HWHrTo6t
         yIhQ9LjT05LFd/A7mIqJIpBVEzBkUE5igWJmRU5BZqckSbzPY+AJR7zW+MeJEpihrowM
         gWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/q6g6M4bkn+MFrFzV1LPmlJuYNiNCS8jy6yxwHAh1INGU42QmSOQvZkdC138ovCOFeG19UipbFclgaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzU0PmqPd+wQGeg6xeRAVqdwfpv+KL18S3jPhJLPrgleghvYyP7
	m0jr7dcMoDmOOVhjBqj14oWlC832yQw2BTB1nZ7mrR7MmvGAaGZk8dLe
X-Gm-Gg: ASbGncvaGFF3q2p0ZkuTvoSXT6eZuAtCQtu86iVgvwAgfJm36cKP9ywPklEzG8EUhIn
	Xp4xnDOWUBprXQTgmiMrhi/Ze8QaIlK/RuhqxVkRo0b8OrWeqyk4+7tyCqTa/gaMrX1NyHQaLYQ
	NUvbBXMghruOZSjerO0/FEP23dTM0ItZB5FaffA4fjaVh3FHyCyBQDbc4WYiHU8f0efywrPIdH5
	7Uwo1OE0G1e3cgSD8t/p9eFG16givk9xCzeU0FD09P4+gZ74g6IXcXTI8Sqa+pvKSWTfWTWo5SW
	x3iXH59hqmbUuMVoLDIdtRML1S9S6jwxK6uXHK4+gZhP4+Y4jx0LsSXYBc+fmsZkcaYIdR8TyJ+
	KOPeLTnf0YocU5f90cdOHHhkfH0AZ2ebB
X-Google-Smtp-Source: AGHT+IHtegYM4BlLYXwS9tWAhPo7ODJPuXBsbqpjo4lyceFKEN4p/yLS5sVZ/sven5XQoNC9rK1+NA==
X-Received: by 2002:a17:903:2054:b0:23f:f68b:fa0b with SMTP id d9443c01a7336-23ff68bfc5cmr57909205ad.37.1753712423167;
        Mon, 28 Jul 2025 07:20:23 -0700 (PDT)
Received: from localhost ([2408:8256:2284:4127:de49:6dc9:a446:157a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23ffa4bc557sm36791405ad.116.2025.07.28.07.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 07:20:22 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/2] clk: spacemit: fix sspax_clk
Date: Mon, 28 Jul 2025 22:20:14 +0800
Message-Id: <20250728-k1-clk-i2s-v3-0-5d7579f02227@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB6Hh2gC/03Myw6CMBCF4Vchs3YIHSCoK97DsIAylQmXkhYJh
 vDuVuLC5X+S8+3g2Ql7uEc7OF7Fi51CpJcIdFdPT0ZpQwMllCeFKrBXqIcehTxyRgUZZW4qbyA
 cZsdGthN7VKE78Yt179Ne6bv+GKJ/ZiVMkMyVW8NpWzdZOcj02mI/15pHWWJtR6iO4/gAm3zi8
 60AAAA=
X-Change-ID: 20250717-k1-clk-i2s-e4272f1f915b
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yao Zi <ziyao@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753712415; l=1761;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=1PggnwSVufJ15eLoLiPtMJonLerZeCTUUrMLHt/MvWE=;
 b=8/rLwSFmfnZFKcqahbV5wIBUuymvjJZLulCrEK4AJqVN8GYHfpSpUo+qbM/Du5QUrTG29NJ8b
 ggVx5UlgBWuDTyPGviJ3GCGDdxHb5d8QjCYF9Y8HM990Ykcu7Pyhy3q
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_072024_730347_A2538E64 
X-CRM114-Status: UNSURE (   9.40  )
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

In the SpacemiT public document, when the FNCLKSEL field of
the APBC_SSPAX_CLK_RST register is 7 (3'b111),
which is a reserved value. And BIT3 of the same register is
a reserved bit.

But the documentation is incorrect. In reality, the value 7 (3'b111)
of FNCLKSEL is not reserved. Instead, it indicates that i2s_bclk is
selected as the parent clock. Similarly, bit 3 is not reserved either.
When FNCLKSEL is set to 7, bit 3 determines whether i2s_bclk is actually
enabled as the parent clock.

In all other cases (i.e., when FNCLKSEL is not 7), bit 3 has no effect.

Importantly, whenever FNCLKSEL is set to 7, bit 3 must also be set to 1,
otherwise the selection of i2s_bclk becomes invalid.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v3:
  - Fixing ABI-breaking behavior
  - Modify commit msgs
  - Link to v2: https://lore.kernel.org/r/20250722-k1-clk-i2s-v2-0-2f8edfe3dab4@linux.spacemit.com
---
Changes in v2:
  - Use virtual gate instead of new function for sspa
  - Add Suggested-by tag: Yao Zi
  - Add Fixes tag
  - Link to v1: https://lore.kernel.org/all/20250718-k1-clk-i2s-v1-1-e92c10fd0f60@linux.spacemit.com/

---
Troy Mitchell (2):
      dt-bindings: clock: spacemit: CLK_SSPA_I2S_BCLK for SSPA
      clk: spacemit: fix sspax_clk

 drivers/clk/spacemit/ccu-k1.c                  | 25 +++++++++++++++++++++----
 include/dt-bindings/clock/spacemit,k1-syscon.h |  2 ++
 2 files changed, 23 insertions(+), 4 deletions(-)
---
base-commit: 733923397fd95405a48f165c9b1fbc8c4b0a4681
change-id: 20250717-k1-clk-i2s-e4272f1f915b

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
