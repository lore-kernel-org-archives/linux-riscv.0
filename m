Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CEFC433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:05:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F8936121F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 16:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F8936121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DLp38KjD+Q7MNCqyCi5dXAdeCH+r8IQ9UcXk/25tIek=; b=XMp5Slch3cJDgD7Lxv9Pj6ACq1
	9KujSBGcIV0NCCUIkb05gz1PoaZfBCBLtM09IpjEGH93MMrzwLKYTpTBfeDEuK8B2oIs7aA5VmlGh
	2SAdPZxQzhUJpV39S7eut7KcQ9TUBAw7/wv5wjWC58XZ233ngJ7LHUnMnyqJ+mAuqRBof1y72BIcn
	5fogAAG/OcjlE050l3Z8U8HEgFhN6WmNCA1uvviUksajJRZNHdvkSN4oeAEucB+PcnaYFoRxY4JBO
	fn4vQrYUVPHOt1E4U0wV5XDJLkP3NCD07THu2EV28XGoLvZ0O3qUmn5TR8nENDNkjxs4EsiTDt99b
	2adHrI4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVz4B-007CQz-1q; Mon, 12 Apr 2021 16:05:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVz35-007C9Y-Ep
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 16:04:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=m/CVxFoJwMOGAhgvs9GWvfDrvprtb5fTOeqBTFn1hig=; b=nmzF3WeO/7ThNFfa/UlYh1dJ/4
 jcrRt7L3TZRwByQe96ZdSjTG5xmOFsyHHVQn40cd2DiZiH6E8zPyl/1Nd7Qwsx/s9uYjM9GMWbUSK
 aeIAWTK8Osj47IP+Z8wBBQwuLWWii+1HESMkeZ9WlVrUa00HhBs6Yf7fOOU8DDvhMyPEMXW/hKcdJ
 aY6Hs7spKu2a5FAmQqiGV5ErY6BXMplsCsEr+itjjdxE79l3pX6TQpfZ4at9ylsneZbZCk8SG2LI+
 0Zzo1Bb8GLbP9WM5+4qyYCMFKjjSGExes/PNejA1of4hRlQ7xtB7Qj5GNKYQFnRdkjF+ZSfh5Xt+L
 B/YxpyBA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVz32-006NA3-Qw
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 16:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618243464; x=1649779464;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NtsbRnX9UZiSvfgBEYfn5sxNum6q9ycjRRfSv7Rnq1w=;
 b=p4tYjdznt93mgtHJGKSGFXK2ENKNMKXMpSse1Tbr/7u1leb8sOTC05xB
 ZF4yzLR5Q0zf5tD2MCjBg98KV8pEnRaoT65VF7EPbwZyRUa7ydNzVoIWK
 N2kV6tghPwchelfWwKkOgk2Kml+K/iNCqRadmljz52Vs5ZfUg6qyUZu1M
 TvRVsp912kiuPcIML1dEflC82s5s/dQI/cOAzX5ZB35GpIwH+lKTPKo8B
 qIlqxuP6XCCfaI3KHZPHnX362/RonqaF/H8CidH1DSnzeU5bY3XIzvfaf
 /RgR7ufCt5cIouHRIIg5GiOMEGuWL54wwHa5nYppV6Mbdou4MV1U4jwYl Q==;
IronPort-SDR: WAfHFwTkFGD2sCPhyDiM+VYGK7A0sP3rhyZILvCJYJ3dlxkXJxivG6ioMCuie+3v7GXXfcF3S8
 Z6qPEhK1LtEeS1vFS+ST2MDwhS71qeURjBVcTfzKZzRew5IiSOWYPVxEMpt/WmW99OYRzGhh57
 KhcSQtVC/P3zyHqCQdDdeVl7RczzX2sK0pgVTymx5cohIZ/36Gstx5IMhPwTN61caSOd/nnZRu
 ikq65kLeouLDIqVBHlf+tb4nC48/9Dv3lYPmgDRE3UZTyaPynJEqPFI7LlBD/T0FvdP77eFGWz
 16M=
X-IronPort-AV: E=Sophos;i="5.82,216,1613458800"; d="scan'208";a="116697957"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Apr 2021 09:04:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 12 Apr 2021 09:04:22 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 12 Apr 2021 09:04:20 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 5/5] MAINTAINERS: add entry for polarfire soc mailbox driver
Date: Mon, 12 Apr 2021 17:04:19 +0100
Message-ID: <20210412160419.19595-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_090424_901049_82660014 
X-CRM114-Status: UNSURE (   6.92  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add the mailbox driver to the existing MAINTAINERS entry for the polarfire
 soc

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8246a19a4fde..996d7d3b7d07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15357,6 +15357,7 @@ M:	Lewis Hanly <lewis.hanly at microchip.com>
 M:	Cyril Jean <cyril.jean at microchip.com>
 L:	linux-riscv at lists.infradead.org
 S:	Supported
+F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
