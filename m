Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76416C43462
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:00:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0F12613D2
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0F12613D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ToNR1ghhUtJ1CFmpPMMLumPbHXnFd62M+B01H8l9jCk=; b=bhk4FYGRsf49EY/9u+XPYwNnX
	j2GXab3iy7bvJ5zgIz5sD2hcg2ibgj3LH1noQhSn3qdjOPl/B+zLBqN768Af+dQYYpgMauUDaTbfQ
	cyPPJy0KgMWsTv4G1kW0zfpKNVTY7LFm6wR/neiPhB7ypwrgC4l3wjvT5Oo4ROnKNITq3B4ZRuFSc
	VHOlzk2GegQJxSlV7YtIcG7o/xN8RAGF3gE+ncLsuRUlYKEHgSkmLJnHKXPx4DmjLH1dXVOFCSJW+
	atvXfW45MjFiuCFX3doYH2l2x7PG52Qr5tbR6rSLtnaZClr6Z5n2hMX1d4/Mu6Kb0kcWXUyVP1uVB
	jiw/MEKxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldsn8-00G22Q-VC; Tue, 04 May 2021 11:00:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsn0-00G1zd-1O
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 11:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:Content-Type:Content-ID:Content-Description;
 bh=/8pWgDAkL2aH5HxBeFWnGEqaMXG/w/n3EThO0NrEYI8=; b=BwZ4+qMCAiVolbsDRKg12nQiiu
 3heLdpeHETef/Bx/nrK4Stavqzk36PvNkDPryCdGVYR5FlAStdM1CfeX3TuXzzvh5LwGlRK8OvvzC
 jp6NdnEurw2j+g7E9Qnc+8WU1AROMkTL0zw0ZGuSoNW32n+FrJPl0bDX4QfWVYtwGT7+9kkhRCNHV
 rBg50ahlvfilQzbGmIpdXpBfPIWqAN1yETENh8T0/jzefx3oK23LavuyAWuMP92MBiGIgxDcxKcMF
 y0I+fipp/n7uOahzydIBW9CDo5G0HJgW81Ufn5xTUW3qhrBNYxv8XJ9BoBM66MuCBxiBSxfR77T6M
 xGNh9K/g==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsmx-003utJ-LV
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 11:00:28 +0000
Received: by mail-pg1-x536.google.com with SMTP id i14so6487502pgk.5
 for <linux-riscv@lists.infradead.org>; Tue, 04 May 2021 04:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/8pWgDAkL2aH5HxBeFWnGEqaMXG/w/n3EThO0NrEYI8=;
 b=gh/OHnpKwH6RKRNye83k3AGygPaflR2nHxihaD22pHgHno+5ENGuL+zrFTPIwwWA98
 nL8BHptQYSNKHAE1o3NFCdjBjxI8atrCq8dXOqROOh2jm/P5ecP6+nNfFrQwqhXDWqy+
 3sY8dVrZUnxoZhUIpgcwywXdSfEJUSNTTlxTeUz0bJ60nA78imSm9nBSvDSSdN34Gqnk
 2kgs3IeR0RKW4PsUudP/BYAGX9tofthv7T/Q8BNTKkgSnMFUsgM5FppWFp590FCbKqLW
 kS5S2jsLcIpLQcVsmSpP0vfDwVz66dXbE8BRwXeHRwYoK7lsolbpnAG+w31+flZpTc8/
 FAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/8pWgDAkL2aH5HxBeFWnGEqaMXG/w/n3EThO0NrEYI8=;
 b=XUSsaNtkmIZaQNAD+KsSV9LOsL8WWpK0pzRLbyav936G619BwGy2EjiPrOrnjc4VzD
 yS4PwjWdjGcWLgqipHF1nCOh8IZR03vnj1YcdQrt/YJZDXYVhUOCNQ11Y65WmUs2n7l+
 YpojM9HCX55lt4ikSNvxG6idJbNyxL2B9mcv97tWJJRSMUSjMyK92EOCmpvrawtCW4fy
 xUk3AiHfCzR/2uNdOdn5/jlxalXbWfpQ3cQ0G31j2pRU7WafPl4nTACUDvMXS+EesgOh
 hDefD1Nq9S0hoj1PboybTeRw9fPUAnKUKbrKRTNSZ0vt4k645en7QVRES2ZqgXaS2TRy
 diBQ==
X-Gm-Message-State: AOAM532aJPaiWbINHTTavXYl3B3siL9tb4KBR+1Pw2DP3TFfyisPM6Qx
 VI97cSmVAV8XpZ4SyWapNphZfXHfz+Qw/Q==
X-Google-Smtp-Source: ABdhPJzx7MRK7z4DjDkyawneHjJP95Uic1KfKF3GSUDWjeuLP93J/B6bqQwBntv0ppCaTb0kt4n3mw==
X-Received: by 2002:a63:e63:: with SMTP id 35mr22406556pgo.27.1620126025696;
 Tue, 04 May 2021 04:00:25 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id k17sm11762529pfa.68.2021.05.04.04.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 04:00:25 -0700 (PDT)
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
Subject: [PATCH v6 3/6] MAINTAINERS: Add maintainers for SiFive FU740 PCIe
 driver
Date: Tue,  4 May 2021 18:59:37 +0800
Message-Id: <20210504105940.100004-4-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504105940.100004-1-greentime.hu@sifive.com>
References: <20210504105940.100004-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_040027_720173_4B53E471 
X-CRM114-Status: UNSURE (   8.22  )
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
index 9450e052f1b1..295711c81bef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13699,6 +13699,14 @@ S:	Maintained
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
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
