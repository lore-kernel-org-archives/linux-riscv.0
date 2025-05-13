Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C2EC3ABC3
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 21:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RKlIrF05/i+rpWA95dwizOfCAI6G46XFUOV8o+WJ+es=; b=K+WK0/9tL/oSbj
	tkDUynmBnjZPff9Q/b019+p000mr3IgoASonZ2BNKDPpI7ERzipNaE2rVF4zJ5KloY2450RLfblqC
	o6qIHuCZJUAQvXZHxpRW0QMpqB3uB/eERsjp0vsWKi/4QS3XSUoDjNSYp83hzNLTYaWOnGhcA3Pow
	j9MshrWzdoAEUGG0BNc4L5PnaKQvFtR1uYRlawKTY+Y3yxYRJYcctwCdmuzc0zmbHB8gJFl7948og
	uxuD6YTFXwlmscpkUCYLrTVJqiNbsTY9OxHsAXWuchxTIVqnnFJKgf0qbftpPXz1IsUIk/Cqv2BLR
	w4omLyXElJ1dNJU7v+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExaN-0000000DbHt-2qIb;
	Tue, 13 May 2025 21:54:51 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExZO-0000000Db4H-1ldw
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 21:53:52 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-86192b64d0bso483916839f.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 May 2025 14:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747173229; x=1747778029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IoLEEBUGNiFTOGCb4OTLcURUXHh0Is7POKT/aDTs3Qk=;
        b=d2/R5TPwbs8RfBjNmzlIxylMJJqOelqwRUWnaZPKLz/ejLA33mSr2e7Hjjv1gzHJ9q
         YyARgL2QOGw+J7xlagL7B55ZXzlo+/3VPT8wR1FHm3MIOlfwS1sONJX3zgrAquJMdiBC
         EvW1P3WeXo8JeGI5a73rD497miB+8GIZwpX6bvSZqvjdmElJi5RcS5TBqU3ztSMg+6f/
         cqGpUPFwwGDc8zl9Kgrje3XddbdvJlnj8ZwFaSsHbJn/skulgWuWHrGjmrEqLEFr+507
         zt5LIPxsX9563nOyGTGfVGoVHmlkjgmOqJhI7PranAG8ydvoOKitaAvPrY6cGmIowv7y
         U1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173229; x=1747778029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoLEEBUGNiFTOGCb4OTLcURUXHh0Is7POKT/aDTs3Qk=;
        b=XCRC+14Rc4hccAXdXG7NQexqttP6k5w01xiXA17zYLD1FkiaGCAn72v6+6XydGaOY8
         IRSQWEaseXIgHWeVWclsqqquj0vVA0QXWpOaMdQimzROC7lpxWdCYVO/K7vCK5PMxdgT
         izDLmx7MAM62UKSLguBE2QNWy8yxWGDym2R6DDzctunWkMOU5NazV0C+ykVLYLRd7xpn
         fnUA74g4OhzAxk7xicI7Sxt+C/xLcjH2dNvjsPB6FX3G6THH9VfEM2QQsmlIp6ssU2FL
         Kloksuo9+uVkD5IEZvXEvtRJAsr+YjgXeC/KGB9gu2F8aPGgvgsc1L6qkdRoad40SKs2
         WbJw==
X-Forwarded-Encrypted: i=1; AJvYcCXh3ejQxIadOc6uMrRXsRCpjDYlouIYHF3kRqB/87gub3Au1bDvbTpipM9zKvszM8DyU/hCKTAtTWsd2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzqcprt2aIhuSh0jsvrH41ynmJDnzkz8OE4laPy4d+mlwOgP7J
	tB2Rv279qD3OvmvmB/tMJSrklzj1YkmfC8UV1q5aPlyhaTxphumyQifiFdT19ig=
X-Gm-Gg: ASbGnct3S7oG89ucKxM99fDA74UCg0wpqH/ZhIAhG6+3b8hs0bQHkv/rz6gef03leEq
	IP2IFzg9lyuE8Yg7+6fQiaGLZGuStPhpzaWENI8itLGK1LqEcrvRHnnBDN5HLn1Ejt52ZEzSzhU
	V4xJSzI6H6kwl6OwJ4U/J5WtcL6gx2d5fgf7n8WLkiLMNbAooWGadsQcOjre/h9YPm5P31nF8qD
	dgDUrDSJfI/PxGT6Zjx7U37lPXwQsmjpOb7Y/7QUSiGzWX3qeWyIuTiOl37rxk2HNh+B6012djq
	vEetvu6IlymHKXc/otJty/HxIihCRpt8sA5SETMg1B2X/1a7mco/q6QEFfE9pguSW3mLw8YLkSH
	mLhn83+kpMvtCOXHgXqcmv4fb
X-Google-Smtp-Source: AGHT+IGDBUqBNV1+C83bdeHkvMMC/RIROVFW0hAND3S6eCYJOwvoQKB1LZmfPoy/YugMmgpVIC3HiA==
X-Received: by 2002:a05:6602:3944:b0:85b:58b0:7ac9 with SMTP id ca18e2360f4ac-86a08e3dc6emr93279839f.10.1747173229345;
        Tue, 13 May 2025 14:53:49 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0dedsm239622539f.32.2025.05.13.14.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:53:48 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/6] reset: spacemit: add K1 reset support
Date: Tue, 13 May 2025 16:53:38 -0500
Message-ID: <20250513215345.3631593-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_145350_695423_006ED73E 
X-CRM114-Status: GOOD (  16.95  )
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
A SpacemiT reset controller is implemented as an auxiliary device
associated with a clock controller (CCU).  A new header file
holds definitions used by both the clock and reset drivers.

This code builds upon the clock controller driver from Haylen Chu.

No code has changed in this version, however two patches were
reworked while trying to separate the clock from the reset code:
  - Patch 4 is new, and consists of clock code that was previously
    found in patch 5 in v9
  - Patch 5 is now the result of squashing together two patches
    from v9 (what remained of patch 5 squashed into patch 4)

*** Stephen, because of various dependencies between the reset
    and clock code in this series, would you be willing to take
    patches 1-5 through the clock tree?  Philipp agreed this
    would be simplest and said he would ACK this.
*** Yixun, I am expecting the DTS changes in patch 6 will go
    through your tree.

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v10

					-Alex

Between version 9 and version 10:
  - Reviewed-by tags have been added to all patches
  - Patches 4 and 5 are changed as described above

Here is version 9 of this series.
  https://lore.kernel.org/lkml/20250512183212.3465963-1-elder@riscstar.com/

All other history is available at that link, so I won't reproduce
it again here.

Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  clk: spacemit: define three reset-only CCUs
  reset: spacemit: add support for SpacemiT CCU resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 296 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 ++++++++++
 9 files changed, 754 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: 3f7ca16338830d8726b0b38458b2916b3b303aad
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
