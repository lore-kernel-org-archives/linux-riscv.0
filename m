Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A464C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 09:27:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E812A6198F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 09:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E812A6198F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2xZCF3JYSCq6fgpTW5R5587DzkBB2b5+rShtykeH1SM=; b=pjyWMMzzSqRjdMG5iGr6RysBB
	Pur4tSmoLqG/sKgLrx/d2J+y1PbzLjYF23iW2s2ao1YiFHCKIzn+BwzVghhzhFxl8P2gqCxFXHGW0
	PKVGxBajCrywztVc9fwxPkSvNQFq16MfUNvREUwpuTFzgcnXIwSy2PBvA8sHKqp9BCbl8I1wMKMaa
	LajdBfDqWq64kGnA++mt/San38znB+pxhIEvn4VxIA7XpaDbvAVyvHHNS8Gz7+QKQek/hNc/xhIg6
	MuQJjYotd6ht8WNFe0XliliVDa1mJ76Rg7S0sTN4wMQ9o3VsJqnI5Seaf0xIU1r2q5DbHGUuPj+vr
	7P1FeGHiQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRX7m-0067yh-KS; Wed, 31 Mar 2021 09:26:54 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRX7O-0067qu-Fp
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 09:26:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id h20so7600399plr.4
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 02:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QOCh/TS5wxbMixJ7U1RoahsowYw6MPj7syv0qXToETI=;
 b=kL+LFecEvpt1KnO0v7agfvuIZrBj13v+hAA+7CfceITGe55bf3KtOVcimzjYJK0dda
 Z4Aonvl50vLfXY5i5d+FtNe2JGr4omn6nUaMQGPM4c2dwSyl79wowtft/Gs9p99OgIXm
 Yz8q/krlDeqdTiVJ4exlQgIq78MwpN+/b12fb+u7B3iPCqAcvyNY/SeqOQd3x8NggLB8
 0V0RP59sUSdLfYcT3VBQ43iWOP2ntr1e9P4P1GOa6Rc1/R/hEq0ao6OdLj34czAQentX
 IPwcSvyiNZcdFiLSTj5ArL51+APRzUishwPt8Tj1gbEI5yAQtd8BzEX9TIbMk+Z0hXoN
 2ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOCh/TS5wxbMixJ7U1RoahsowYw6MPj7syv0qXToETI=;
 b=mcsIdBwqJ83UYzjJiWm3KAMR6GbR4WZtVaRuaQ39khATU4f2Zg6PNoUHGbmnho4W8m
 ZAqNefu1OF3be/3tzgTxFFdbAQiUprC9jlweq+qmLb1gFgo3bWccIcCszzdV9dpAyrq2
 HHmx7qF5wpKEhjRc/a3RZtAOCenu+rrIKVufzazvX9l8KF3r35zbDiQvZYCKeSvWMKbV
 ce1xUwyyD5viPICIicFAUVltDv4VwosEiQPzPc0Dxax7CgjQzfFyKfkMVYpmkYHVP8F0
 3hJOnJfosNaLosT7ch6p9Il6q24hK1EIG4af43tmpJRWLMKm6DH4Vv3/lmcw6qdCSFIM
 3Y6w==
X-Gm-Message-State: AOAM530n4+AYSOMo+Bj9iwjzA/Qh9CJUrpeem6QE20bihzPxa+wAi9x/
 MvhhwtTiLunqEOScMftPo6E7DA==
X-Google-Smtp-Source: ABdhPJwJBUQO0GYolGBKmMb0PNwoCaaef/TcsoGeIGfVSm95dZI6h9RQTlL+53ZjBRDGM5MvZe40cQ==
X-Received: by 2002:a17:90a:c28a:: with SMTP id
 f10mr2724003pjt.15.1617182788140; 
 Wed, 31 Mar 2021 02:26:28 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 143sm1726505pfx.144.2021.03.31.02.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 02:26:27 -0700 (PDT)
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
Subject: [PATCH v3 3/6] MAINTAINERS: Add maintainers for SiFive FU740 PCIe
 driver
Date: Wed, 31 Mar 2021 17:26:02 +0800
Message-Id: <20210331092605.105909-4-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331092605.105909-1-greentime.hu@sifive.com>
References: <20210331092605.105909-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_102630_947463_4ED7E0C7 
X-CRM114-Status: UNSURE (   7.83  )
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
