Return-Path: <SRS0=olfB=IB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B207C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 15:34:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7219C64ECF
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 15:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7219C64ECF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gcvd0jK68SvYDVEMIb0sJW7C1c07tDLNHHDZnBh1aP0=; b=E7yPLIt+ngEY+kD5tmcuWFo8L
	Dwg/7g/MWUklp54UCHtAuBZmEckzB7GnMwcJ1yV3SEG07nyDOoYdZhExdAiDR6tHNWrOcs1kUDcwp
	wu3QCA3d/5Rqk3cHIUeOnIbn9BTvhvgV/UOKoRhnA1CbjXEESdQdQHveGZbl9UftEycJCGKG34KZJ
	EENC3OCuNCFdpj/5oO1mcthCpj1h98x3b9XPZvILMtTtxHPK9ZufdabBRTnr2CpQbMhNsDFDhrpsn
	g1JltCWHbEpQ2DHEshvTlOumwbjab3/Qqyo560on2aSr/l9Rhzqqi2s0XiISiX2KYKOivIBevddtF
	iW/Wv1VGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTWJ-005PHf-TJ; Wed, 03 Mar 2021 15:34:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSTl-0058BQ-9q
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 14:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description;
 bh=/USle6rtqTPO64EisM9sX8IiqldHS5gOFIC7i3hO5BU=; b=aF6p1uXnOb3X6TWAdYtzNEsfSn
 ttA2Cm+GVt1qM1dDyI42a21zgvCvJTMUPYDBwo1b9DLzuDiDu+1NQoVliKRRkWHffuRetI8+EJ+dl
 dGlt6JBpYKuqXapy9eHm72NXuTsrbCl1Nz6CewytDMncqJmvB3Z3ezFoYSrGgrvAkOWESSFjxFBdP
 cP/XMNEvCIMnIXW7u0eerbKisVtaRR3W204My6h+NzubWHWg8MjWxaZ+n/458C48YaJZ8tHREoVMb
 WIEh/XGCUDA1T2rWaJPIi+bRyzzoMOQJQpKRoe4NkyVSqz3l1tAZ/COcpgtwVIl2n6OvIL4zQaoZ3
 gAutgpJQ==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH2lg-00Gyhr-VX
 for linux-riscv@lists.infradead.org; Tue, 02 Mar 2021 11:00:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id k22so11817442pll.6
 for <linux-riscv@lists.infradead.org>; Tue, 02 Mar 2021 03:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/USle6rtqTPO64EisM9sX8IiqldHS5gOFIC7i3hO5BU=;
 b=LRtiAF9kbHh5VuCDJBNTBZRw0JqzCn2GorHa0OaGv3KuZF0ituHBFJPADTShwCpl9d
 6yigVY58onm1SZPyKwdir7rH63l99cfavgctu8xlWQoInrPFd1Fy8f2Creu4aJ4EDifF
 Ch4ZhnW9Ob1S+QS7KViyOQI1HKr+DJwKQ7kj0R2x7rtNHrEkndwu55//0+kP5FR/JKy6
 iNqOLo9t8C8yCSj7wQulxbUQJN71aYe8XHD0dSvE6s+Kl+u5n1oNj7sn8DAqcsRQtLmD
 CJR0zapJ3GDCfSbmHPExNCc1/czX5L1vXOXS46gDkagjf+JVz7VvMe0BIrbvP1CMpXgV
 XpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/USle6rtqTPO64EisM9sX8IiqldHS5gOFIC7i3hO5BU=;
 b=XH/kVc9BNUiAGLGVOGggN+QFMyKRLbyuBZ2ddv9vQo89O1RXXvMWoFZEag10jFRSZ3
 Qhyjt2SVbrEvYbNlwOh+XRf15fVmvyBYoZknf5jmqyLExXIDoWXDC97IOzGdandpr+YH
 ap/wvVei6x7AcMLDjNrzYH5799ijTvtybKg/4YIJoRRlbKMAilESBzZ0nFNjWAFyl8Cm
 B9r3H9Nh5CQImNHfR+/sRbFc43MwUKKsEGetyrnX727Htqlrvdb3kon485zCB1mAv+x4
 z4EtJ/cuIB66fZYEIbIEmvJybFEFb8/nnqXTlL3Fdr3jRwYBegmthLq0iZ/79eFh2uVD
 4fdA==
X-Gm-Message-State: AOAM531ChlaYMyoJb2hCC5irvXglcO25UnpaTjlQcKnkYktOFYluCP0D
 kYV/DBHTr1l8dx8NmL6wFFWMjw==
X-Google-Smtp-Source: ABdhPJzq5rLhprXNE/gziWlHFB0NKMzepHExLCYtN0zDKq662/9ZKusst83fZ3/drY3VyKZUYTvTjA==
X-Received: by 2002:a17:902:d893:b029:e3:f3ce:cc6a with SMTP id
 b19-20020a170902d893b02900e3f3cecc6amr3293615plz.28.1614682779630; 
 Tue, 02 Mar 2021 02:59:39 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id t26sm19500451pfq.208.2021.03.02.02.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:59:39 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.pieralisi@arm.com,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [RFC PATCH 3/6] MAINTAINERS: Add maintainers for SiFive FU740 PCIe
 driver
Date: Tue,  2 Mar 2021 18:59:14 +0800
Message-Id: <ee829f3f47cd15a2d91a0090b4b6d6746c2e4ec7.1614681831.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1614681831.git.greentime.hu@sifive.com>
References: <cover.1614681831.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_110046_005891_9C13FAD8 
X-CRM114-Status: UNSURE (   7.20  )
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
2.30.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
