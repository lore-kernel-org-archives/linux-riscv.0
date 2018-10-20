Return-Path: <SRS0=U2Mo=NA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26F6ECDE3D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Oct 2018 13:50:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A34CF204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 20 Oct 2018 13:50:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j1ZB2KOl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hLHJWG8A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A34CF204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rf86SC6xymuclL0z+2Anb01v5vY9Ny8kv6AVGb0xaC4=; b=j1ZB2KOlhk7wOl
	pNVYiMadBXeBzxAju9n3YEHRb6HiB8l12nNq4c9Y14p/zYEYVLRxilLiGwL3+yCfz/15OR0NZN98m
	TNZpxbGGvnL1Iat7ihKjKZLMFG6Vm9/1MQhenDQ+/YQ5vGr2c8tBs52uudlmrlaiUnwTB15nCjndq
	KAJIWE3qY8z2Y2IxVo0DvYYGlVo9nY/V1zDX5WDNlQi2msKgWszsZR9RWL9DYtKhyWwdEkqRqtnCH
	I0MmeCJn1OxIeuAAWHXmm/YzfpDXJluzLjdu5CT+D3hQYhV3YTTxuyZKDOK2lQY+Q1+q/e5VrpGCD
	p3oSTecqIW/OX+ihgogA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDreT-00023r-Ih; Sat, 20 Oct 2018 13:50:49 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDreP-00022M-4z
 for linux-riscv@lists.infradead.org; Sat, 20 Oct 2018 13:50:47 +0000
Received: by mail-wm1-x343.google.com with SMTP id a8-v6so6128020wmf.1
 for <linux-riscv@lists.infradead.org>; Sat, 20 Oct 2018 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LlbabcyQd1j/wICcOq6oJhFka402EV/LPkkjkVKQIUg=;
 b=hLHJWG8ATbbUnsr+VLWBYj85dk2wCVNErURhl2WpGrKPNcu84h0I+Po/hAOxAzRcXh
 q8uK6Aut6yUPuEKh2KOShDrhH+LPaBo0H+ae4E6humcFaeCJ5wzJ5UDorW/XnqHY8KUZ
 L2FNg2QPFtTiaMEDExRD8mgCsjvpbrumEPj8B1dxR8yL/+1/+fCZj2xd/KPRX18Tgcvg
 YAFpoMucVxUsgXYoSznTVvENRNTRVL1uQrXM79ADktBh6I0dQLbOCuK15snY9fPkhLvG
 phxh5Ss2X2WnDA2HRGpucmCd3Njp36ICbzZBaitx6qGs7Ov3Gi2rpkR1HgB/8POQAhEu
 sb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LlbabcyQd1j/wICcOq6oJhFka402EV/LPkkjkVKQIUg=;
 b=jN/9o1rzSM5kILdE52dFhHHbTYsSkurYciID4pcAYIV6BHSc5qZd6B3norh3K+svjE
 sRNsOGFrFq2t7A3DdOQU5Nog3bwlasz9mqs9KBel2KxG0qqYcaUNiJJ5J4cuHby86zIW
 ExPSQ4Pf8ngel05uXfOK10xoJnRnb+wCmUnrem6ey3YM9gKBGbvRcViSTq7e0OgIkC2U
 YVUWuj5a1qijyXdbEw8Js9R9Ipys/XvIUDoOj2ZoYBA2P4TBBj5Ii7S73QqFFp0TZngW
 9rbVBHBzn0dgS385fiZNZihCx3iC5nA6ngQ1CSs9CE5m/VZug/OqeUT3T53+J+XUQcEP
 8jXQ==
X-Gm-Message-State: ABuFfohuoae/iYpiYXIM3W7l/HVFpENaftp6pHRpx6944zL1whYb0sgd
 UsNbwB1WAvAxTGkpQfx6CxaC8g==
X-Google-Smtp-Source: ACcGV63StSgMHPhXytIVulh7lSgv9KF4DTrx0iLRWBJmnl1yLvDiNn6Fyc7tov+0pZqHpU2MvLKHuA==
X-Received: by 2002:a1c:1fcd:: with SMTP id
 f196-v6mr8968379wmf.19.1540043433471; 
 Sat, 20 Oct 2018 06:50:33 -0700 (PDT)
Received: from viisi.sifive.com ([37.152.39.96])
 by smtp.gmail.com with ESMTPSA id o4-v6sm16906615wrj.45.2018.10.20.06.50.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Oct 2018 06:50:32 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] clk: add driver for the SiFive FU540 PRCI and PLLs it
 controls
Date: Sat, 20 Oct 2018 06:50:21 -0700
Message-Id: <20181020135024.28573-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181020_065045_239629_0E826D94 
X-CRM114-Status: GOOD (  13.60  )
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
Message-ID: <20181020135021.6LpxFV740NPITMG8g0_KHLf0Dae00KtWr_3lRglL8GQ@z>

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

This second version corrects the DT binding documentation patch; an
out-of-date version of that patch was sent with the first version.

This patch series is also available at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/prci-v4.19-rc7


Paul Walmsley (3):
  clk: analogbits: add Wide-Range PLL library
  dt-bindings: clk: add documentation for the SiFive PRCI driver
  clk: sifive: add a driver for the SiFive FU540 PRCI IP block

 .../bindings/clock/sifive/fu540-prci.txt      |  43 ++
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
 12 files changed, 1224 insertions(+)
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
