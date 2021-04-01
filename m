Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED94AC433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 06:01:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9949061029
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 06:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9949061029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2xZCF3JYSCq6fgpTW5R5587DzkBB2b5+rShtykeH1SM=; b=DnKZbr3uiZ5sHOVw0jS96ewNM
	EmB3xKY4ZSvT1E+bWzQWOx+2ekXpWPndpbPpbvRkCl7RDQlVZc55yFnQSEy7QNbyfK6nfjo/DCo/T
	aWP/hBJ8ZCzCGwXZIMuiGN+LYp0jk2lOJjTKQvl6yJoflvD7FSFmbB5xGIxqh9ejBKaueoxUi/VJn
	GmFs1p/8eiqdvVwTX//G+T3t9LDcANnGb06tLnwzduU1usw+kbJeVAqbWFvyHyjh8fT+qyemNjL6o
	AueOgCaDx0zvtahYsLfQ7PXViExhxldn8oEQwjABlqu7xkFee9Z2CtOZs/oH4ptbhyugzAO335nDR
	U3ycuiK3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRqOM-008dNZ-Nu; Thu, 01 Apr 2021 06:01:18 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRqOI-008dMg-Dg
 for linux-riscv@lists.infradead.org; Thu, 01 Apr 2021 06:01:16 +0000
Received: by mail-pl1-x630.google.com with SMTP id v8so461619plz.10
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 23:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QOCh/TS5wxbMixJ7U1RoahsowYw6MPj7syv0qXToETI=;
 b=iPjWyKtkwhzUHTxPcjnT4icYgXJ7zeDUmfzg9v5YkSf5p3CwKPx6bI7A7SoN6Syojb
 +X/YcY+mMV2reL7FiisXXKwUCnCFbegv+dR+mgozFG9QthGF/cvRGbx4ItscX/pzmjSr
 YdbNQIUOdkiZRfFVSyX/4vhaHdDRmeClwLKm5jF38Bg9Qh6oQWsn3wuwt2HjMpzI2teg
 XligTyJSVmA/gqRO4F3zNX/TjnOr+h7Iqv5vJaQSsxNnWsyDRJqxd9sd+35b2VkgwnDC
 1ox57sHJ1mYlfIf7EduwYwidHRP+6Rw4en/UcSGLsJ1HHBChwm1dc2jcws0hzVnRp1PB
 sKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOCh/TS5wxbMixJ7U1RoahsowYw6MPj7syv0qXToETI=;
 b=IzR+mgPxVeygu1w6k5gfPoRv8XTQ9qPJrFY153QJQQaqUvzT+2if/dLEDBWhtd/BvA
 joLSsSCpsQUm86p0Iae6BUeWJsVGHV7Iat7HE2NWb7r2XjuR9bbtrl+kJo5m0yfGnecZ
 4+RUHNgZY5VtaXF1VKryzbK5NZqMIlumVLyEs/iyDeKggcd7DbFtiqPf0es/eYgbrb89
 WHXH6TfipNnyaFNHb5jN8uXi7InzU8xGytUtUl2qfSiKR+0kcW+9xZQKXsMis3m33HA1
 0slJj6R6rm3aB1iWCbZwGkRFFFFa6dupLoOWEyfrgFXGSBeXF/cn6sAQ/G9knqqqUZTA
 oxCw==
X-Gm-Message-State: AOAM5307y0I3RD6FS1r6+YPhLrrEa5E8NTyB26uC8LdHUwEfNi2oq5o+
 WZKkRigx146YguETSFEx4bRbHw==
X-Google-Smtp-Source: ABdhPJy4PCdLb+qz9XgaXNOzMe05wTqJNbB/uYxc86af5nogDmNs+NbnIcxuL9wZclBB8UWU1DpfJQ==
X-Received: by 2002:a17:90b:3551:: with SMTP id
 lt17mr7247531pjb.1.1617256872902; 
 Wed, 31 Mar 2021 23:01:12 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a6sm4037328pfc.61.2021.03.31.23.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 23:01:12 -0700 (PDT)
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
Subject: [PATCH v4 3/6] MAINTAINERS: Add maintainers for SiFive FU740 PCIe
 driver
Date: Thu,  1 Apr 2021 14:00:51 +0800
Message-Id: <20210401060054.40788-4-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401060054.40788-1-greentime.hu@sifive.com>
References: <20210401060054.40788-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_070114_522966_4177B817 
X-CRM114-Status: UNSURE (   7.55  )
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
