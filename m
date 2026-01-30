Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA37E6BF30
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hf66RKIaNoEiWgClRsG143K+4hemtJa3rJgxErxGtG4=; b=2Dqregq6ZoB33F
	dv0jZJqHMjr7QOa2kvk9hFYkHUUSfdD1QbnbUI0NZ8LDbWVn8GvCh7yRJGXl6BpKlzngCNz7z+vpi
	Pgjdi3iL9GFVcA/pTWdOOOIW7NwDFZGQGCYhptq9ElhulJ9K/Z8pOiIfz0CFDc3sNJuMapLUYEJcp
	5TycYH8FOly5I0ojvcNlLXKgaANCUEui0GV5OCnskw9XV+5wlvh5CPPULQExgZNEpMBGvifNAfVz5
	596ZKO/pt1EcM62P/75BypiB0CHSEEQDBg7mE7nfkkJGkJjbkVGEwmncsykqClZY8ihSpplrfShtf
	Kl6JBNK35q02wxWSKa0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsdg-00000001nHl-23WC;
	Fri, 30 Jan 2026 17:50:36 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlsdd-00000001nGu-3Czb
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 17:50:35 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-649ae700ba0so585958d50.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 09:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769795432; x=1770400232; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqVc82Oy/ZflqXYTUlnweH/P2SRPYGdES/1mmOJBJfg=;
        b=BwS08Nf5+cOj/F5sM2bt9PjDnDLaJVnAkqAyPRHPMeq8rMO8C5JXotoSNvn0lSQxku
         dqh0Kf/AD4bYkQLw1Llt7XyzqnKvJfGhkPfRAhz72dLIbfKCyl7bU2OJnHfANdzOXYml
         xVYn6m7WLHaU83/C+LQb0JCxjRlq1UPnChz8XXHfUe7yN/v+BGLIB9rKcS/aI9nkMoPl
         wuJVwEdb+OTIQ02G8G1r/yx8t+BIbz+Dl9lar53fATpkdG16zOaNZGqD5+N6U4uTwy6l
         w6CfyS6BBomON8x/AcIf6Nl96vFrGvcTfgwbvBuahdVLti2ZLBCZKzk60z4hMfo4z9SL
         QP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769795432; x=1770400232;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqVc82Oy/ZflqXYTUlnweH/P2SRPYGdES/1mmOJBJfg=;
        b=P+bwrNjdThD6A9/F6Vp5fgHtczPVMt2ZfpXC9xwEQZg8H+DzSKfkV3B0AGf30bUwKn
         UbcmXzp2kMPEfW/+UZEMtF/0APyatJFDGKuzUNpNRXxbDxkTs3BgaqonRjsc6Khd9CXP
         NM93VE5jY/pi91ZHdbpsoZCln3vgceKY6J7rGaxxmP9SzFGLzJYwyrlPBDsu04iUf2ul
         0lMLUqPSzD+k/cfzGe9iQw2PhV4SUDIBPbcVVMcI+LysiARslN9SAmedYGZOyv3a24Hy
         vaHhyeMtF20CuWeAlxQJa+ztUpd0/xLRkL94rFnTpD22Dh1EKqP+1LfcQ351lO0qhz58
         QWPg==
X-Gm-Message-State: AOJu0Yy6BElQPzWy30S/ozrIbsk6S1jTvmy69SDmp75n4c+FILzSrv7z
	FbZ7iWOfl9dXJqb1w2LLwdIOZN698sPEH4t8bP9rDWLe0ARSV5KloMemmDfgyBWE5X0=
X-Gm-Gg: AZuq6aJ48smL97gL/fYAFGr4Qy+xR7ExmJDj39ObqlVsLa2vJlZjxFeqAo8gerCL7c8
	zPqNtgED/bNBhc5+8JIJFeou54cLut27/LMQ3r93eN6dcGrLxJn7rJDv6yiTIJ6qzyoOJN97FNw
	TOBcunsJ+0IMvHI7dF8UQBLOk207c+DnCb2/EPal60yZcsm5BKAy6qeKO/ucjgA7hkDsovX5Km3
	Ni7PU3XZe7sxLGXthTTPbr1z7/VI33uyO/aOD+Mwtq0dW7tXxOzKbLDFK+rgSKXTMiEwJ/zSDww
	SxXeTbjfvtZI76S7GCEpx8G3lfjrglJSAuUmn1IuSrVm5xtiD0qG4yCcTsF31LBquBnfB+geWDX
	apczgXkI5qZPKEV5Lpw48sWcmPlMpc1RcDT038YWiMgScxuRQYzPOSklOzmZBNFyd6w8IaHC3lQ
	1QSBI7ejk0ADhkZiLOI3hU9uAJT6oLagOwRZApYPBDevvBLPyT8O9qEsXY3LdtTmy2+TSlvsz9D
	r34
X-Received: by 2002:a05:690c:2607:b0:78f:b163:782 with SMTP id 00721157ae682-7949e076330mr69517847b3.58.1769795431831;
        Fri, 30 Jan 2026 09:50:31 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960e0965sm3939108d50.13.2026.01.30.09.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 09:50:31 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v4 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Fri, 30 Jan 2026 11:50:20 -0600
Message-Id: <20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFzvfGkC/3XOwQrCMAyA4VeRnu1oWps5T76HeNhqpkVtpS1FG
 Xt3O0EYTI9/IF8ysEjBUmS71cACZRutdyU26xUzl9adidtTaSaFRAEgeZturUs2cnPz5hp5Lxp
 hoBHdFk+sbD0C9fb5EQ/H0hcbkw+vz4EM0/Rr6YWVgQteK42ENfRy2+19jFUiNxGBXKqMv7NJz
 XImyeVXWRbJIKoaUDWE+F9ScwmXkipSJwBBaa2hq39L4zi+ATP7AsNMAQAA
X-Change-ID: 20260112-atlantis-clocks-f090c190b86d
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
 bmasney@redhat.com
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_095033_868040_ACE4AF83 
X-CRM114-Status: GOOD (  14.21  )
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

This series adds support for a multifunctional register block
called PRCM in the Tenstorrent Atlantis SoC, whose main functionality
is to serve clocks and resets. This block is instantiated multiple
times in the SoC, with each block covering clock/resets from a
different subsystem. This series also adds a driver that covers clocks
and resets from the RCPU subsystem, which covers most low speed IO
interfaces found in the chip. The reset controller is implemented as
an auxiliary device of the clock controller and shares the same regmap
as it.

The first commit adds bindings documenting the PRCM block, along with
clock and reset indices. The second commit adds the reset controller
driver along with the auxdev definitions needed for it. The third commit
adds the clock controller driver, and the reset controller is created as
an auxdev of it.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

---
Changes in v4:
- Dropped !rcpu prcms and custom property used by them. Will be added
  later with rest of clock tree
- Link to v3: https://lore.kernel.org/r/20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com

Changes in v3:
- Fixed warnings reported by kernel test bot
- Addressed comments on reset driver bit set/unset value
- Changed auxdev macros to use inline functions
- Renamed bindings and clock driver to use block's name of "PRCM" rather
  than syscon
- Link to v2: https://lore.kernel.org/r/20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com

Changes in v2:
- Improve the documentation about the syscon block in bindings
- Implemented all clks using custom ops
- Removed custom lock/lock handling functions for regmap
- Addressed comments on header file ordering, newlines and typos
- Removed code for mux parent setting
- Squashed down multiple commits that added reset/auxdev separately
- Link to v1: https://lore.kernel.org/r/20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com

---
Anirudh Srinivasan (3):
      dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add Atlantis clock controller driver

 .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  54 ++
 MAINTAINERS                                        |   5 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/tenstorrent/Kconfig                    |  14 +
 drivers/clk/tenstorrent/Makefile                   |   3 +
 drivers/clk/tenstorrent/atlantis-prcm.c            | 941 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 160 ++++
 .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++
 include/soc/tenstorrent/atlantis-prcm.h            |  58 ++
 12 files changed, 1352 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260112-atlantis-clocks-f090c190b86d

Best regards,
-- 
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
