Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB358E7FDC2
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 19:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eYhRDvFydzgcOoJk95pLgbPb7AsF3f6NWoPtZCzgkBY=; b=bimjjTOPKG7wcX
	Vy5pxWIwCf5m8rf9Lwvs1h9MmLRT1gJGlElQv5ELzpRoNh4GCvHVszDh78m4Yk0qV8M8BiS5Gy9KY
	JbyT5ov2X8ClTfdO0PFFGsBHH5iV2OaSXVy6i/ZwP0OwlQhsaAKZHQSTOEbrw7ol8v0pgenm36/Nn
	6M6DxQm2MnAop10OTJ6lV+G5ygCzilo2itd6loGWQ17LDF23RVNsyFNJ6QzyE+0x3xxe0aWB0h3Ry
	Oefx2xFTxFSG58r/CIRs6UW1/9QPogcV+1BZK3p4YlSPLyb68P80iTxcviJ3slJlOheQziQsNCSxT
	DWQHcyFo0GGR2GF15u0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzsz-00000005YJ2-2g7H;
	Mon, 02 Feb 2026 19:47:01 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzsx-00000005YIA-1dVw
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 19:47:00 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-794ed669269so1857267b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 11:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770061618; x=1770666418; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u82dPfWkZFveIydXJfE5pfWEOGw2ni/TqG+rcgpwY6Q=;
        b=HoxAxBEPICuJQ1nQOw4P3Cw3GfEG5MinQbjavRm8T09Sxek1Hl/AoR1hVfRaI/U6Zn
         G7fpZqaqZaVJzpBVCDsgFPFTts+t7LAec+PCH7BSX948rlYdMCM5tke8yGp+xZbX3nUw
         TuQz/9TFarPkuNVUO6rXfUdW/Blorm7QkxTJ+WpKWjawe9094i1y3uSDOYux4aeyisSh
         aOMSJ3KRzvsSJiM1M91YV1UNGSozRNiVOdJqGj4J9r9/GZjEITFFzPJgBZbJJxuHKAJT
         U0AMQIePYpm5RWW0wlYhJRVnr9ERqV3shDQRJgilJSEAIgkgAksU4ICTlFfO1VACzwEv
         Do9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061618; x=1770666418;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u82dPfWkZFveIydXJfE5pfWEOGw2ni/TqG+rcgpwY6Q=;
        b=XiiXio3mHBKAJO8976YA7BLuH7MB8H1l//tDTQ45JierCRwmTo6THUamDvQbP5znym
         kZqZcvimOUHExnK7P6oWgVn+VG1spl8evudXl/5kLX2kpb8o7xT9mxIUrxSJkZSGlyLe
         D23m9H1R3cD8ujRvBU/7okB++5dKqG9k+nYQG43aU1rO21hS1ng6PATpsx1eO8T5ZMnl
         0QuQhXp0AHhPlxdZ+FYoWXBY+Mf0sJ8lUc3ku/W5pIzBiNDHAYS6vqVwoiqlekBKvyqt
         lsrPwmfoyoU8yJv/0sA5PkaNkDVmGcZfW+NwNuNOm2bKlxt5DGelEYP/8S3qks22jHbo
         oibQ==
X-Gm-Message-State: AOJu0Yy5zIxXl3Bpk70PD6Ef1HdMORcLJcy2KoBoBzEpHTil031To++a
	5AlJJQnjvHANJn4E93UFqitr+h2AbKFFlRyG4JVkgz6djmVIIk5WZG+6rCA78J4yt0U=
X-Gm-Gg: AZuq6aJDG3swB3V9LbVugiiy6p1w0/9AYPiHy2gcjxvibNOrFsK6CbceShLHKeiin1M
	IuXSSmBpXOUe6kFf7C3HJQLmb1H/tD8ZsoJ86pp/7mnelS40D8qzKkMGAN4C3ARn3s2RwVS54o2
	eUqFfPyFS80sufx4sWigPHpR4FiwyTmLIEIIV6UIxZxOZp8MZ3FsGi//XhLErVZvIiJXZE+sxG/
	WN5CnDc2BB3dvJCYzzAsljS8xifH2pdqOC2RPHXnlYqZFxF6Y6JTX7dgm7ksowtlHodR2i847Uq
	tg/RDarWNTiuThgO+2JbTSVbv0e3/MZfVQddDiIk40LM/zpqewuBSkxJW8OHD6jCN04gXbvnZLm
	+yv/GTqvVs2DQJh5ICkO6a8MKZ64c5WxgDO/N6Ku0z5s3WRpmMY4gF/2cXhWuZuGAJpuYeZ9Nuu
	vuEGm2/xgTodxJf0EZzi7JMfOOFyXuweDrczGjyeDsb8S77HqvxRPq6lmKf2KiW4WqVk2lWEb2
X-Received: by 2002:a81:b813:0:b0:794:bc47:df1 with SMTP id 00721157ae682-794ecdcb28fmr4723137b3.22.1770061617857;
        Mon, 02 Feb 2026 11:46:57 -0800 (PST)
Received: from [192.168.5.15] ([50.231.163.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794cd7241c0sm39493667b3.24.2026.02.02.11.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:46:57 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v5 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Mon, 02 Feb 2026 13:46:48 -0600
Message-Id: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACj/gGkC/3XOwWrDMAyA4VcpPtfFkmOl2WnvMXpIHGU1a+1hG
 9NR8u5zCoVA2uMv0CfdReLoOImP3V1ELi654GuY/U7Yc++/WbqxtkCFpABQ9vnS++yStJdgf5K
 cVKcsdGo40ijq1m/kyd0e4tep9tmlHOLf40CBZfq0zMYqIJVstSGmFiY8Dp8hpUNmvxCRfT7Yc
 BWLWnAl4farglWyRLoF0h0TvZf0WqKtpKs0KCDQxhgY2vdSs5K02kpNlRoa2eBosMPmtTTP8z8
 Q+nFelgEAAA==
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
X-CRM114-CacheID: sfid-20260202_114659_457262_3D6B1280 
X-CRM114-Status: GOOD (  15.59  )
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
Changes in v5:
- Replaced to_atlantis_*/hw_to_atlantis_* macros with static inline functions in clk and reset driver
- Add Rb tags from Philipp Zabel
- Link to v4: https://lore.kernel.org/r/20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com

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
 drivers/clk/tenstorrent/atlantis-prcm.c            | 945 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 163 ++++
 .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++
 include/soc/tenstorrent/atlantis-prcm.h            |  58 ++
 12 files changed, 1359 insertions(+)
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
