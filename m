Return-Path: <SRS0=aLlD=DX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CB7C43457
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2020 09:18:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83AF920872
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2020 09:18:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XAxduVpU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="b8sPn/iN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83AF920872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QW7LANgY9o1KJLbBOinA75IkIBAXcbNRTcQVe24GrVY=; b=XAxduVpU9zGafE2rjVmpcLdA4R
	cYZrGLui9yxptYliUxLrHDSyvEiueAKcmhRpnR4uj92/stumrK1eLHBLs3AG9NeEceRovfEPpEmWG
	TkVJuuV/FKsxN+PvkAmrmUYjxstm+pbG1QiXQPjPNxqWcki76HIo4Y7JwdfO6HVcP50BO3gQS4w8Y
	G1uz7+Y5i/1b4xGIR+Qkeebv5dpwhCJ6KMOQyrZUQHcHLtn0r5frnrhZjOcUIei31Td46VSz+uadP
	H9ERmEJQqI14Cm1OZiiASKnsDM6EfNo9uMiohGSLNcXIifuarujWTe0PUcFlHHukUPnGKAyNvTor1
	UaNXHMpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTLsj-0001ES-QL; Fri, 16 Oct 2020 09:18:37 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTLsh-0001D3-Rn
 for linux-riscv@lists.infradead.org; Fri, 16 Oct 2020 09:18:36 +0000
Received: by mail-pf1-x443.google.com with SMTP id x13so1126461pfa.9
 for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2020 02:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5VJmUi2hckCsijxBcYyhh03sDZwAMNbDuXEf/NPFrU4=;
 b=b8sPn/iNZ1hbUzVpPTulPn8fj7ufJEu2637RgBM8VxE9XMymWItCB/8oAIZlAU6V3/
 ulvQ0s3Md9tj7JuyvdmisQNwH1gF3Ai6rSu+/T85Tp0TE6mWavWcwznhxS+gOz/Nu6GA
 HbN28t9OrYj6QNZCpoOOzUPhs7YxQoXaG6WBxjMdcRHQYlvPof0W93p5qV8iFhlbSnlv
 4+Ggxl1o0nHi0nLrWdK6gSMnRvMkLEzHnkLJ/Vec/eL1MpzR5R6B8Rm2iadxTedPXf4W
 lvmgM5Mpe4S8y+at1XI++plh5fAmrOPNeDMCtEbjN3lOlGshcG7/gBv6jxKdXLE8OvFB
 MGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5VJmUi2hckCsijxBcYyhh03sDZwAMNbDuXEf/NPFrU4=;
 b=UnHe5yMM6YKS7uDYAZjX1gBT5flSNuIV0exh1KgUbOGtBnP3Qta9C87+er8eg1dIQy
 tU0xIyCk2ts9bDoZK0LuVWkfDu1RzFE6vY0pFbLXctTHItHLh6Gln3q0Ddn/OHpPQs4Y
 IcfQiS22NfGdifGQwk130XNJwEDIh7zPPczNBg1CwjqyzgRjwykU6paSIbddMJPIDDg5
 T8BIe6wdpQ0mI7f+Xo71d0SqvXfqvTejxB3/t+mpf9Dr1PXxa7FqngRatRKLxu6askEb
 ZqM7oXL8UzXgNEkcTwkFnuAfvx/elQzXAAjJqu8nrnRc7RmjKHeFVamFKHukpKU8oOXK
 plpA==
X-Gm-Message-State: AOAM532NeEHOTHS/NlhyQpP0vgP6BzqApXUviA8TW7Qf4Tx5jiEWw5wP
 DVTi+PNxwHRHwyEs6zVC3k/5Fg==
X-Google-Smtp-Source: ABdhPJxZY7syDdW76ZozIFq6p/RBmSoveEp5Ylw9O1uyIBddkks60ZtOQigzuvNjRHEcvFRBPIL0pw==
X-Received: by 2002:a63:6f46:: with SMTP id k67mr2230777pgc.296.1602839911585; 
 Fri, 16 Oct 2020 02:18:31 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h5sm2093263pfh.9.2020.10.16.02.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 02:18:31 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 0/4] clk: add driver for the SiFive FU740
Date: Fri, 16 Oct 2020 17:18:22 +0800
Message-Id: <cover.1602838910.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_051835_906553_9B4574CA 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a driver for the SiFive FU740 PRCI IP block, which handles more
clocks than FU540. These patches also refactor the original
implementation by spliting the dependent-code of fu540 and fu740
respectively.

Zong Li (4):
  clk: sifive: Extract prci core to common base
  clk: sifive: Use common name for prci configuration
  clk: sifive: Add a driver for the SiFive FU740 PRCI IP block
  clk: sifive: Refactor __prci_clock array by using macro

 arch/riscv/Kconfig.socs                       |   2 +-
 drivers/clk/sifive/Kconfig                    |   8 +-
 drivers/clk/sifive/Makefile                   |   5 +-
 drivers/clk/sifive/fu540-prci.c               | 618 +-----------------
 drivers/clk/sifive/fu540-prci.h               |  21 +
 drivers/clk/sifive/fu740-prci.c               | 102 +++
 drivers/clk/sifive/fu740-prci.h               |  21 +
 drivers/clk/sifive/sifive-prci.c              | 529 +++++++++++++++
 drivers/clk/sifive/sifive-prci.h              | 297 +++++++++
 include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
 10 files changed, 1032 insertions(+), 594 deletions(-)
 create mode 100644 drivers/clk/sifive/fu540-prci.h
 create mode 100644 drivers/clk/sifive/fu740-prci.c
 create mode 100644 drivers/clk/sifive/fu740-prci.h
 create mode 100644 drivers/clk/sifive/sifive-prci.c
 create mode 100644 drivers/clk/sifive/sifive-prci.h
 create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h

-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
