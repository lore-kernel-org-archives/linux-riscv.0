Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABFFC4743C
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 16:04:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C439661059
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 16:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C439661059
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gK3IHqA1ui4q28M/69BRx41cVKKu39O7W1M7zTuRbNw=; b=iSX8M6YcP7B1DO
	t/UKoYhX6+fLJzDegsLBBiSNIBvslu0LdSLlDsr5VlE7PzQqe1V2NkhrUtQhvLntZAeUv5fwolHb8
	CbarHC/lRWRm8L4ATdGJt90X0O7m7PCbDrxmT2lBT8zFxry3satO7bvTl0ZKIdmuCg34bIBP/eQnp
	+UH8nYeiUE8eCz0vxUsq1Rp+1ZrAGvWGJH/byLyPbI1GiPTFQTd5U6rpRPDazAqmX0o62urqAQ2JQ
	HmKNKrY9zWhL7TQNl+UkWT3Jtmxqp1/hUcUNyYlzvh48Q4XWEDzVfWXBMuUnwNCAD1bA/orrOMmsy
	mEc2mmnAnTmyS4Ud2uSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvMP1-00410p-B5; Mon, 21 Jun 2021 16:03:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvMOz-0040zc-2G
 for linux-riscv@lists.infradead.org; Mon, 21 Jun 2021 16:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624291436; x=1655827436;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4nksVGJc59kKQoPCASmg1lsIewXyAyJELl1qHWXP4GA=;
 b=QF+3HpmPPNaI3q8MA2G+2ubbALFV8Idb36TEwFuGZ2sIDGZLygSz4mzA
 fqh7dG9kzAEFXclVK+v3w9bQChqIm/aShYbgiln9LihqhVYl5l3oKB3gq
 ae1nymZ0/uIBQ4RC8SwokvP+VZDrIpNE7a78aOIo+R204/GtOTpHUnCmQ
 XBUV992hkKIU7Td9BJGLj49uxx+od1laVK6XgJnm0pIcyN0xdjmHkvTYk
 JJzIrWIqPPqrMcoThbXukSZOvTNTRr9txW2R6BKXtcBfjNx9WVJtLp/5Z
 JDOXyeZlAtVsSHBvMPbj2/iF0jXCSTNJQSg2HCA/nCRFGEhqqu98gp4fi g==;
IronPort-SDR: a4qcGuMO8VfPlGi0BrPCWcLr8jz1DNb30GgxhXKhnKOSrAJMGDndDUSntRAecU3qf580/m2rOZ
 B7fS2R0l2r07Foj4b3EJ6B2G2c0PJ8WRW33VWN3WFOO8J6dq0HH94UGCt0shqGiR8/KXBW4HGi
 p/7RAHDKShCZSd7sT8POQT3jyqjOCBj7ByiWQFSpUn5R8SnqI1D3YSM7T9BkinctmaloM8I6Pq
 WM/MojRhVf8FJH16CgAsf6KAidNq47/CY9MgPyPmMTM4VaDs7jtD3r4MfhEnGI60zDRj3yu9k2
 kDA=
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; d="scan'208";a="119478484"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Jun 2021 09:03:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 21 Jun 2021 09:03:55 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 21 Jun 2021 09:03:53 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 5/5] MAINTAINERS: add entry for polarfire soc mailbox
Date: Mon, 21 Jun 2021 17:03:52 +0100
Message-ID: <20210621160352.5543-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_090357_212164_F00D9E83 
X-CRM114-Status: UNSURE (   5.75  )
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

Add Lewis Hanly as a maintainer for the Microchip SoC
directory and the system services mailbox driver

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c5ee008301a..dc549a60fddc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15705,6 +15705,14 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
+M:	Lewis Hanly <lewis.hanly@microchip.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/soc/microchip/
+F:	include/soc/microchip/mpfs.h
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
