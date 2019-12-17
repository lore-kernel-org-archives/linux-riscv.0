Return-Path: <SRS0=UkPV=2H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7240CC2D0C5
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2019 04:07:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4895A2176D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2019 04:07:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P6zPVDPD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="w24mVjvH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4895A2176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/EeyVzDVQ/EXYLvR3izxdw4IrryrAjrJet7kKduLXL8=; b=P6zPVDPDfSDDEttPteZ5MBSo7X
	tdFv1LY9hl10sUcRxkbxLHePh+8oYvFhvQiUprKn5l+9g2haUnrueG6ppoU7wyuvor9QyloYlUI6S
	XKDnVdPOe1Bwf0ank2zxVSwDs8+rUtDT1FPKuR8tl6XJCy8StlfFRx9CWhoGE31jl4EObFN9cABhf
	uFmGhiOX8ETHLxH02OVjCwyDeE1LnwxIyTLGBGKgXAj64WCEhpSOqpUakDUKpiQ36iVMnZ0Tzd70N
	U7X0525cPcIsBk0JKIirc14o5rl7HF5OK/hbL6UdiA0BNyGOHL3qJB2bXSg5KirmoKYsHH8d7xs3W
	RJqfxtNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih48g-0000T4-4b; Tue, 17 Dec 2019 04:07:14 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih48d-0000Se-Mu
 for linux-riscv@lists.infradead.org; Tue, 17 Dec 2019 04:07:12 +0000
Received: by mail-pg1-x544.google.com with SMTP id k3so4903683pgc.3
 for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2019 20:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=/EeyVzDVQ/EXYLvR3izxdw4IrryrAjrJet7kKduLXL8=;
 b=w24mVjvHWS6xhPLizVIqdxluN56TOLjTe/dmRGHizGmJE1dJIi/SoIIp6crqLUCvDv
 RICPDQNNbi4T//ksVi2aE5X5XqWj1XzLXbSTxd7/XfxSXJMKTqBT7qgfOymP+yIZQEns
 X7/xSX9Zi3jgkO4ol08jz/owD79u5IzNCDyMbbyspy3chicGbLp45qG2wjQiphmv/Fm5
 7VofOExbYlW5SRXR6pEvw7dlRmy3kXq1p0Iidx3fnbtBU7DivpaD6KFcyFByK1Tw374Z
 yfa08geILbcjaiztnpNJwUxh3vET834kRuI3jn5tSGq7EsFCOBp43iGmkowt2tGfBNSa
 AB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/EeyVzDVQ/EXYLvR3izxdw4IrryrAjrJet7kKduLXL8=;
 b=g6DJOfFh5SArBRwyGS6CDXZ/CUFm7drmp0qHn8WDFKkf1XRAvcJvoLslXmTdU5dyWZ
 XEoNghNmSeTu0VbNl4CMgCpZo7YJvZoAWBE4b13FOPRjY7qtPcIHG1Mpe/6wAfQXehsd
 e9/g34WuVhI8VX5VtRPGTP9M9tuJ3A1vG82WQBmcu2RPOl3R7Kwdmp2DczE5UVjKIP7P
 cLn/W7PlhbeDjFsBU3Hapu1t46KxsHTq7b7qzDAg6f3xUeBLVtDZKwoTSwjTyKdj7XPu
 M6XGvr3KagIw3/EtQ6dXU6SCBQmgRMIogi4j7NC99YdpjVlkZHCECvFVgi3Bt9tMmaJd
 QMUw==
X-Gm-Message-State: APjAAAXBD7aQf1DfKs3HdqlBi+TShDBA93eg4Ld3ol7cTzAW8kTjthNN
 QkdC5E7s9CdIjKS7G72ZWjD7Lw==
X-Google-Smtp-Source: APXvYqxFBXZL0vNbgrX4e1e3py+mq6yo/2cpBe4nLVuK/VzX+a8+XIqlGiJ8aBFa2A1hNqvdkeLCyw==
X-Received: by 2002:a65:4142:: with SMTP id x2mr5763326pgp.393.1576555630925; 
 Mon, 16 Dec 2019 20:07:10 -0800 (PST)
Received: from rip.lixom.net (99-152-116-91.lightspeed.sntcca.sbcglobal.net.
 [99.152.116.91])
 by smtp.gmail.com with ESMTPSA id e11sm1032340pjj.26.2019.12.16.20.07.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Dec 2019 20:07:09 -0800 (PST)
From: Olof Johansson <olof@lixom.net>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv: export flush_icache_all to modules
Date: Mon, 16 Dec 2019 20:07:04 -0800
Message-Id: <20191217040704.91995-1-olof@lixom.net>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_200711_746721_56B8962C 
X-CRM114-Status: UNSURE (   8.93  )
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
Cc: Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This is needed by LKDTM (crash dump test module), it calls
flush_icache_range(), which on RISC-V turns into flush_icache_all(). On
other architectures, the actual implementation is exported, so follow
that precedence and export it here too.

Fixes build of CONFIG_LKDTM that fails with:
ERROR: "flush_icache_all" [drivers/misc/lkdtm/lkdtm.ko] undefined!

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/riscv/mm/cacheflush.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 8f19006866405..8930ab7278e6d 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -22,6 +22,7 @@ void flush_icache_all(void)
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
 }
+EXPORT_SYMBOL(flush_icache_all);
 
 /*
  * Performs an icache flush for the given MM context.  RISC-V has no direct
-- 
2.11.0


