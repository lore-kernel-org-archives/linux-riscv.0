Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A777C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 09:27:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07B82613C4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 09:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07B82613C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2xZCF3JYSCq6fgpTW5R5587DzkBB2b5+rShtykeH1SM=; b=LaTDOHQdqMCEqghhsfcubbfFT
	/u8LM7dU1MB7D2ghh6a9n625E6NQFCsmf5/Riyl+k8ptx7QycR+veXXNqGS+7g5w3ogZjgZDphbDT
	qYEskv3kUm10zJ617LhH7DNJvcNAHuDGCiM7nYQKHalw4dxkC9TlLuRxlLpkJ++tHmGwOPyF4EiSi
	SiAxngqrJKZqu6NwY5fa+Kqe3t/7YPPabsbgvUm5Wp7VUsz5XdatqMnZ1VR6iF1+hAueBbPgf+zou
	BN5F9HORatqgqZWc26dIDbtilHKG7CZRVVrx3zVFGFsHDeCnluqSX5Nb2AUfxyBkc1yZsz46Aqfu4
	ZjrHxuXxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lThz8-0020pq-9G; Tue, 06 Apr 2021 09:26:58 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lThz4-0020oh-NV
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 09:26:56 +0000
Received: by mail-pl1-x635.google.com with SMTP id t20so7130565plr.13
 for <linux-riscv@lists.infradead.org>; Tue, 06 Apr 2021 02:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QOCh/TS5wxbMixJ7U1RoahsowYw6MPj7syv0qXToETI=;
 b=lI5tVV2yDAzz7e1tnKcgvqSovfgVxfD18FAIeJjDz//r87E3zOaeTmrRK7bahyDyQH
 R9X+WHgEkguRKH29Zxorkw52MLCmvabrmYPy1rQ0ftmCD2ObkZsSNEiNSgVWbx/zghF8
 sxRSs0p8CU4E95PQvYQwcjVQZQlurTNLIgFDDWqhz+zPt33MRPebvbA4gqur571xoKBy
 7pXLxP3AyxiQqHGwehW4i/MCjWgUYSB8LuSSpQv5zqfRtOueMOLv5AdJjPjDSe9hWNwf
 wQr6oLmmS4pOok88qt7IKd8nUIPJQlWgcUA6FFzjAukUrxaWrC7SvRdl+PygbxiNTq4H
 QqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOCh/TS5wxbMixJ7U1RoahsowYw6MPj7syv0qXToETI=;
 b=Vwuc9JasGOZSWur7iSa2KusAkyhh30kiAvO1+OLgbv1ipCgiCHWXHk9wCHgb9QwxeY
 vGAeyG4GOSkt40yzqRnCk7lnC5Jy8+Zb9UoUbbJP9PYv/WbW0RBkxb8bVFD2BO2SHHMo
 dnk8NxoSJtacloAqYnxEhpMeRhqQLH6jVfHWtR9wJmkF8jJVhz8rl0BLqSeLPNNgWIRN
 GuKHdTgl3A7Egaj1gQmCnYRbb1xi6H9wUIyj7biE/Av3NIpUqN7RlP1bTDmrZBt6RfdF
 NXuk22Ed5fIRkLPtHPF+leBgroaxAeKW6yUfvbbZN7aLdDZj95qXGdxp/6ClRx44MXJ7
 +2aw==
X-Gm-Message-State: AOAM532r0DmYbqrsApWd+PnNYyyRvGH2eP/IEZjKCzyuZ3Cy0i+n2wBI
 Mu1RSxjtZeaa8iHpodKbn02sUw==
X-Google-Smtp-Source: ABdhPJyR+AncM1qKHlAzc7v8aepcx01Ey2zQhnySckLmGADxiw7G6zWwQDXO0ndDTD9JDdv9Twnm/w==
X-Received: by 2002:a17:90a:e00c:: with SMTP id
 u12mr3469120pjy.133.1617701213304; 
 Tue, 06 Apr 2021 02:26:53 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id w7sm13685589pff.208.2021.04.06.02.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 02:26:52 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: [PATCH v5 3/6] MAINTAINERS: Add maintainers for SiFive FU740 PCIe
 driver
Date: Tue,  6 Apr 2021 17:26:31 +0800
Message-Id: <20210406092634.50465-4-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406092634.50465-1-greentime.hu@sifive.com>
References: <20210406092634.50465-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_102654_842756_EBF9C7D7 
X-CRM114-Status: UNSURE (   7.76  )
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

Here add maintainer information for SiFive FU740 PCIe driver.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bfc1b86e3e73..4da888be6e80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13592,6 +13592,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
 F:	drivers/pci/controller/dwc/*imx6*
 
+PCI DRIVER FOR FU740
+M:	Paul Walmsley <paul.walmsley@sifive.com>
+M:	Greentime Hu <greentime.hu@sifive.com>
+L:	linux-pci@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
+F:	drivers/pci/controller/dwc/pcie-fu740.c
+
 PCI DRIVER FOR INTEL VOLUME MANAGEMENT DEVICE (VMD)
 M:	Jonathan Derrick <jonathan.derrick@intel.com>
 L:	linux-pci@vger.kernel.org
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
