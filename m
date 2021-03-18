Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45E3C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 06:09:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E2E64F10
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 06:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E2E64F10
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2xZCF3JYSCq6fgpTW5R5587DzkBB2b5+rShtykeH1SM=; b=CHnJVNjf34RFo+ay+5gBLS6ta
	Z+p+84deDH8U6U1zmBes8VAo8DpU86JW2WfskAMV13iMWNQWnZBXGK2M28Sl1VvFUTt5NCquNdppx
	KRgMp98p8L7Q3Q2m3J6O/E2hJKLcFkA8ZTplhavr+DipDyRBBpHIE4LmAXFgXa2wGNWMLpVAgGO/L
	sYq2LutHYdFZR9FgFflRiUK9q+HAk/5u2hXYKx5MMjfCxtYuHWcB6sfv8P5IgBsLsBIdefDnjZ1xE
	RUSx2g2e+xpEj0+VsW8NyYaVzuEDaKTRJBmgSIKNCzG/RVmM9FzfHpg1R5gNhfivV3+Ph+mfc94Fg
	ZL0DJnlnA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMlqC-004aWj-TR; Thu, 18 Mar 2021 06:09:05 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMlpo-004aQi-SK
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 06:08:47 +0000
Received: by mail-pl1-x629.google.com with SMTP id h20so750753plr.4
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 23:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QOCh/TS5wxbMixJ7U1RoahsowYw6MPj7syv0qXToETI=;
 b=OSNnFQJ9g8WOy5HU5t5ON2uOn4RJGZMdvNEVS7gPDoKYMWj5hT9NOo4uNGCU1rGI24
 YDs3ITxQETXVdDATX47Mhz5PZWYxMB3D6sSosj3gAyn4DPOxJOqeVZlZRs53D+F6xWii
 sSOvo8gRXLWdiA37HtSSapyLmvChWTbOq5btpITekVRt5hgngQlRnliZm2+2cd5EnILC
 E8n47jJBgMYvijJr+8tS80hyq9gTssWkATn1tMJg0FxLMBQuneDDx/ci5KDdpNZypjAG
 LJQAoRliyLoG4BSiXQY0QeYDNgOK437xpOPo8m8oUULUoR3tYZLX3qw0/wB7up3/czEf
 Vx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOCh/TS5wxbMixJ7U1RoahsowYw6MPj7syv0qXToETI=;
 b=WYWm1EKGKoNhq1EiGU8VcfEAOYipgIih6QM2iu9oW1Fn06YDq4vw0kLTsAHQCHd+Ea
 dBjwGT1ZzAZzg1ek0OO7n7PNhp/Pusm+HKwRasnp5mvH0+qWkpUsiA3ar9r6NlZ1FN4Y
 poex+pfFwGY90uQdOdRraxCym1jsQ0P7XWTwTv5OkgbBWrRv4bYjjyxJ1l6/BsgYij5o
 0wvNMn250l75r7fQ5frWbW3xq/s3qr4XSthMdJ44fqUhg7cJUACZ9MNPm9fvNbHDLUE8
 y2yox1XUXK6qbZiBZ51CqfjFcOySH5C53RgDGePtPtY7OUa7LNVQDXcWTdiB6VAt9e67
 CYnQ==
X-Gm-Message-State: AOAM532niktvGCma0+T0OWOx9A78N6tqXyIScJb+Zkwm2/7KeY15KOB1
 v2vfE2JKaQObK8S+p9Ppl0r6hg==
X-Google-Smtp-Source: ABdhPJx16mWqhA7ExfAYAyXajYSVjGOiyGqdUj61KCpCqrNusOxlG5QHcFo4hqVoLue2bm3E0Fbd3Q==
X-Received: by 2002:a17:90a:9d82:: with SMTP id
 k2mr2541894pjp.48.1616047719436; 
 Wed, 17 Mar 2021 23:08:39 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 68sm967353pfd.75.2021.03.17.23.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 23:08:39 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.pieralisi@arm.com,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: [PATCH v2 3/6] MAINTAINERS: Add maintainers for SiFive FU740 PCIe
 driver
Date: Thu, 18 Mar 2021 14:08:10 +0800
Message-Id: <e32c9700ba07b6e07e7923c0e680b7f643cec8ee.1615954046.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1615954045.git.greentime.hu@sifive.com>
References: <cover.1615954045.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_060845_132593_A7EAA8F1 
X-CRM114-Status: UNSURE (   7.62  )
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
