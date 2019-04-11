Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC038C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:26:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9C042070D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:26:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MlTncnSO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jtBPM0uK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9C042070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3SDcAKPX5SIFUZrVJdATw2tW7XEPhmhQhwTdovFm/c4=; b=MlTncnSO1w7fJ5
	hs1uxoGumCdNrjWRzo4q6Vm4TFuckG49T7jKdRr48qNcSa/lDBIO8GYcqIdXNQtt5p2ZqwqaIgPD5
	dKwag3FPTqamTHoEFmgAr9q8jz2Y7FqJm3Zyqml7R2IbF47YZUN+5PavmQfQMcYSPCRqnlecJRKyC
	qbTP7ZG0JC1ePh+kcQ/eKOTKTuEzpdH0im7H/HeaKbh3dNFiZ2gvNw2MJGJ3XXLIjyBRF8NyrNv58
	F11jZYDVsdeNzH/kr7jqB2k+CPx7FMXVssSBcBqqRcgp/IMZtDM4Egmw/ByIyLHl/SL9FglUEZmpm
	iwcVgMDFRXMNIVZApcIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEV2p-0003BX-C6; Thu, 11 Apr 2019 08:26:51 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEV2n-0003B8-0o
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 08:26:50 +0000
Received: by mail-pf1-x444.google.com with SMTP id h5so3119264pfo.0
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 01:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eI+tQazR5An6Y/OSr8wxU+9RbkrTFLTQCf+Sjow2u5c=;
 b=jtBPM0uKIksF0uxyGF7ie4zWZavYx1OXYnKFel0MgH3cgDyorOZqR5H2g21i0LDruB
 LRfSom10ilaADBXGQKIBLI/O4ojx23oDmtVXf5T5Opwb7PZOoBAi8ZqjTTc8RAIKdhsv
 kmHkjSKjGbxhKKSp6mKDL5sEDB9nlZj9s0sL9I8B8yxYwG9AQXZfng1lMgtQ4igJ44E4
 5YUEVTnlbqw1YXpggX2aqTlNKs3DeWJbmt3Yo8PqJhiIAdUXUNqi2J7QwcwvVNg3nXOi
 D+XYf45s4AJu9+4wLXc/Wy9b1+tQiIU/4NzxQH9xJliieBaOnBtTJlrNCzcXudSj4Doo
 hETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eI+tQazR5An6Y/OSr8wxU+9RbkrTFLTQCf+Sjow2u5c=;
 b=thogpFdvjoDsofLoci7QPjqSF/TsItIm735xZ/7vsTR4aPAOKhI35tjnyxcBqhT5IJ
 iVuUCD/NTUQ0bwf8phrbLecT3eRYMaZRcePwCH7S3/NUNz3PzTwZs11lzujTIiogTpm3
 RihT+JFyAHRPl/5e3gjE4bXwjI5VEp7npNCjBQ6MjEhrLPcO4USfLEBfGolDtT7Mwl77
 NdHuw9zjstlfAnseDm9/fUU2wJV4gwesHjmaQ4M63joBVZLU1K8x/8LlMLXfANpLePdR
 k3xqi47jW57a7x29uY4vrE+bKTwaKdzq+JxL5rLSDN6zDiNHUQbhypX7XZR0+8SfLUy1
 S3Qg==
X-Gm-Message-State: APjAAAVrGavwSbXnn+75tIUJ4WksqmLFm+pJwUNymIw3toOo6AXQbPmo
 D1+sIsrXpXYFzeIZXgRDNawQoA==
X-Google-Smtp-Source: APXvYqy2KN/ugGsiGTtSdgnZH7biVx1GMF+NrYkwSH4fgxSkHOCPM7MZ28Xt8L8KnRjx+ZrR6K4btw==
X-Received: by 2002:aa7:864a:: with SMTP id a10mr48652416pfo.181.1554971207324; 
 Thu, 11 Apr 2019 01:26:47 -0700 (PDT)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k65sm81608225pfb.68.2019.04.11.01.26.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 01:26:46 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sboyd@kernel.org,
 mturquette@baylibre.com
Subject: [PATCH v3 0/3] clk: add driver for the SiFive FU540 PRCI and PLLs it
 controls
Date: Thu, 11 Apr 2019 01:26:16 -0700
Message-Id: <20190411082618.3502-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_012649_136504_16FF303E 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

clk: add driver for the SiFive FU540 PRCI and PLLs it controls

Add a driver for the SiFive FU540 PRCI IP block, which handles clock and
some device reset control for the SiFive FU540 chip.  Also add a driver-
independent library for the Analog Bits Wide-Range PLL (WRPLL), used by
the PRCI driver to monitor and control the WRPLL instances on the FU540
chip.

Boot-tested on a SiFive HiFive Unleashed board, using BBL and the
open-source FSBL with a mainline-focused DTB.

This third version incorporates changes requested by Stephen Boyd
<sboyd@kernel.org> and Rob Herring <robh@kernel.org>.

This patch series is also available, along with the DT macro prerequisite
patch, at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/prci-v5.1-rc4


- Paul


Paul Walmsley (3):
  clk: analogbits: add Wide-Range PLL library
  dt-bindings: clk: add documentation for the SiFive PRCI driver
  clk: sifive: add a driver for the SiFive FU540 PRCI IP block

 .../bindings/clock/sifive/fu540-prci.txt      |  46 ++
 MAINTAINERS                                   |   6 +
 drivers/clk/Kconfig                           |   2 +
 drivers/clk/Makefile                          |   2 +
 drivers/clk/analogbits/Kconfig                |   2 +
 drivers/clk/analogbits/Makefile               |   1 +
 drivers/clk/analogbits/wrpll-cln28hpc.c       | 360 ++++++++++
 drivers/clk/sifive/Kconfig                    |  18 +
 drivers/clk/sifive/Makefile                   |   1 +
 drivers/clk/sifive/fu540-prci.c               | 630 ++++++++++++++++++
 include/linux/clk/analogbits-wrpll-cln28hpc.h |  96 +++
 11 files changed, 1164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
 create mode 100644 drivers/clk/analogbits/Kconfig
 create mode 100644 drivers/clk/analogbits/Makefile
 create mode 100644 drivers/clk/analogbits/wrpll-cln28hpc.c
 create mode 100644 drivers/clk/sifive/Kconfig
 create mode 100644 drivers/clk/sifive/Makefile
 create mode 100644 drivers/clk/sifive/fu540-prci.c
 create mode 100644 include/linux/clk/analogbits-wrpll-cln28hpc.h

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
