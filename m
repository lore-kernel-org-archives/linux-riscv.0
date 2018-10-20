Return-Path: <SRS0=U2Mo=NA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E02ECDE3D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Oct 2018 13:38:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 673F22152C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Oct 2018 13:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uDnl2PRm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ggF7jUHb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 673F22152C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fvr2ZzG/9yX34RcyfkzDyU+snsGcT1/Ebi/T3FiZweg=; b=uDnl2PRm0+E3Wu
	3MOqJ/BfNbOiS7EbPkuD+NLWcqLINIa60HDg3zOmFleMCCsf7uobM95I0DZgRg8B8trUrmj9dSqXS
	sYmUFJN3iApcxs6kT3OzR/mk9d9jQmXWzTqWZ/VgxassADO6HFFCg08clVvk3KlNweas2HCDChrbw
	a6Ihmlu8+mxecIL8il/PA8JnZbN8rYFCJjj4CvX344NbJQJkNQTN+DnHWPNme+3ZqVYwUjuXpiI1x
	yk+8ZAk/r7nBZUaCS4GV6Q6biRzSb+hAVxHiC01EoszeT2lEpdASHh7PdtMvQRyY62mbpWbndyzHu
	83N8Htxr+NfLVwbqmYKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDrSx-0005iP-9f; Sat, 20 Oct 2018 13:38:55 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDrSs-0005fU-1u
 for linux-riscv@lists.infradead.org; Sat, 20 Oct 2018 13:38:52 +0000
Received: by mail-wr1-x443.google.com with SMTP id q7-v6so12352532wrr.8
 for <linux-riscv@lists.infradead.org>; Sat, 20 Oct 2018 06:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RK1db71p1doYFuCGfEE1NLdP4LEETqtV01w8eRQfie0=;
 b=ggF7jUHbQPMBuzgjjE1ZSJ9H0neYUI42BFHKGWNXK7GgHTtct8R+T39RVP0cx41h3M
 L360cSFJLESd44XCP+s89e523uYEmm77QVO8RhAis+eMLTT11YlI3CBmLBkJyyWhOyl9
 jwF6OzRb9puvAQfqBA3ji19Pb5jBj5kmQs5urLofh92esCujfvmu9tlgbhZmP+DDVyxw
 2sB34Jx8KzJz5KsS9V7py3MmgFZMgCHcvyyPbLNfm8RGL2qqUgWXQOWDjqMByVmidS0K
 QcBx3k2OICAk3BGTb9Oh7woQxI7Hj5jya4WBxdlCK+fFkZt16DC24RfXHONj+KHg21N7
 i6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RK1db71p1doYFuCGfEE1NLdP4LEETqtV01w8eRQfie0=;
 b=BGDLOZ8QTRFt01wNI+N+bd2b4BFc8s7S0M4/i9hINWsHhN2eiQB2EM8A6U6cgggrq6
 VAr375T/OGrZkrKl1awzVrRBaMy+CUcqPeE30EQQfsgWjePzQLB8hynxOPopHOOyNK5Y
 qgdY876CPyzJwE9Z9hX/dLOPb9NWC5h7edGet3t4Z20zHvhZ8RYm7F2Jb5Pm4pWAiaW+
 v/hQFoCPIjCrHFpEDDKJUuDIzvGXw+vyTCUzMnM5XvTFJ2cF7os8ZF81xGxwg0eqyNRE
 niDLZasNJ5yIwgfekO7/2wKW5A0fmSzVfej4zaT7yuQQz4IhuFPUYOxW3UvFA961HPcB
 1s9A==
X-Gm-Message-State: AGRZ1gIX2Or3CkKp9NYFTUePESRC/P7Yy0t6At2vhx/ot9KiPIylraBK
 OaB1PJFt8Sm1iG/G+OB59br9Yw==
X-Google-Smtp-Source: AJdET5fai4n4Ip1a0hHB33795iEBz3hBXBP3ecQ6x/4i9IveVrF6RZUuoWlbXtxm2O0tkc3e8pKlyw==
X-Received: by 2002:adf:dd8d:: with SMTP id
 x13-v6mr8459254wrl.237.1540042717701; 
 Sat, 20 Oct 2018 06:38:37 -0700 (PDT)
Received: from viisi.sifive.com ([37.152.39.96])
 by smtp.gmail.com with ESMTPSA id f1-v6sm5227207wme.23.2018.10.20.06.38.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Oct 2018 06:38:36 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] clk: add driver for the SiFive FU540 PRCI and PLLs it
 controls
Date: Sat, 20 Oct 2018 06:38:21 -0700
Message-Id: <20181020133823.27103-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181020_063850_118468_C847B779 
X-CRM114-Status: GOOD (  13.33  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Stephen Boyd <sboyd@kernel.org>, "Wesley W . Terpstra" <wesley@sifive.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Megan Wachs <megan@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181020133821.dBiN1_WSe6Y9ZwuPYdRJUqgEDmaZKfSy0tk_yPKRg0I@z>

Add a driver for the SiFive FU540 PRCI IP block, which handles clock and
some device reset control for the SiFive FU540 chip.  Also add a driver-
independent library for the Analog Bits Wide-Range PLL (WRPLL), used by
the PRCI driver to monitor and control the WRPLL instances on the FU540
chip.

It's been a long time since I've worked on Linux clock code, so Mike &
Stephen, I'd appreciate a close look at the PRCI driver to make sure
what it's doing makes sense.

Boot-tested on a SiFive HiFive Unleashed board.  COREPLL rate changes
and notification were also tested on the same board.

This patch series is also available at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/prci-v4.19-rc7


Paul Walmsley (3):
  clk: analogbits: add Wide-Range PLL library
  dt-bindings: clk: add documentation for the SiFive PRCI driver
  clk: sifive: add a driver for the SiFive FU540 PRCI IP block

 .../bindings/clock/sifive/fu540-prci.txt      |  40 ++
 MAINTAINERS                                   |   6 +
 drivers/clk/Kconfig                           |   2 +
 drivers/clk/Makefile                          |   2 +
 drivers/clk/analogbits/Kconfig                |   3 +
 drivers/clk/analogbits/Makefile               |   2 +
 drivers/clk/analogbits/wrpll-cln28hpc.c       | 387 +++++++++++
 drivers/clk/sifive/Kconfig                    |  18 +
 drivers/clk/sifive/Makefile                   |   1 +
 drivers/clk/sifive/fu540-prci.c               | 634 ++++++++++++++++++
 include/linux/clk/analogbits-wrpll-cln28hpc.h |  99 +++
 include/linux/clk/sifive-fu540-prci.h         |  27 +
 12 files changed, 1221 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
 create mode 100644 drivers/clk/analogbits/Kconfig
 create mode 100644 drivers/clk/analogbits/Makefile
 create mode 100644 drivers/clk/analogbits/wrpll-cln28hpc.c
 create mode 100644 drivers/clk/sifive/Kconfig
 create mode 100644 drivers/clk/sifive/Makefile
 create mode 100644 drivers/clk/sifive/fu540-prci.c
 create mode 100644 include/linux/clk/analogbits-wrpll-cln28hpc.h
 create mode 100644 include/linux/clk/sifive-fu540-prci.h

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Wesley W. Terpstra <wesley@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Megan Wachs <megan@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
