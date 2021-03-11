Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37147C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 11:35:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3FCA64FAF
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 11:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3FCA64FAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i2rOctJBDUhnVbKh+CMN2I2TAaL32IHHNCQ4nxTMYaI=; b=ETLt/rQxT7JibY6gnsGVAyrmF5
	IS1c27Wc5KTkSax6+ZzuXbpTxpAM0D+cp9wWnM5wPRYj3AP52Dxd0ONUGsZVW4UvIt8vkddKaNK8+
	CSiSAQkEwIwWAVlbu+QimzeAbfqEFTmNl4d1jsNWa2RpCYQBhHjnPP9RLLOJoQkYPbZsPcyJDvwQR
	sjZA7y58sbA8/YI9b0iNFMPpxVJ66ZxJe2yRo5+8K1J5rWWFLRoQ9VUV9aqBjl8k3EDJiZ4SS6pu4
	dVDhtE662mEwdveTaSfwQXbqeAViNliJaYW50hAlVvkB1AbN928Od4CZfhPh4tnd5T6iP85QTNE9c
	U/IRUqFA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKJbI-008wYS-BA; Thu, 11 Mar 2021 11:35:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKJbE-008wXH-JR
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 11:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615462528; x=1646998528;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=0SiAXxZU9xTZalFZ8LLDzB+0PPRiu5p6gIrxTDHRm1M=;
 b=eA3DkwFNzdBuuemXqDuACNUFGe2HiJGNDO9ynYzEOkb74VEw6I9IV0Xe
 vXNxSncPi9xqC52NAHZOh8y4SSSfZfUbIhcn0NtbN+SL0EMKNUHWwBMrn
 2ibuqpd+LdtCc1C5J7u1XywECLXsh1k7AA6s61xHUqqVM1g9akjs06M/+
 tc6huC5xDYFyo2Ta8JLHqbnVf8kX0h3S64cRSTLpQHkjgMtzwu56S6B03
 vv/RsDHHWmyyVPSrZ4y/LwmTSUozRyLYpBiT6hRfVDCGfULdZk/ES9rWp
 xQ0+T6RfeCGC+qcWYGWs68qJYhyhz9ve5wm/6uMVc5kbCD5BLkbESR6ly g==;
IronPort-SDR: bZV3bhP16BqEqeySiF0SRfMpRSH9/C260M5QPO1Ov2ytY6MZNVM6HOpR9vaNUr72m64oXzggua
 BMGqgy23VsiaumpmWjfuketMhWwMlngz/ljJuDTSMrxPNrz4qRILPlfWqTIIBj/lYcEF2VFMnp
 tEObe/cM/KI67STDcV84PjoOu4R8fDUeRDWhkr02sL71/NhUeIYqK6li2hVJV+V246jM+QIUhW
 1IzxVA1SCF6mhXSc5wOUut8s60zfp2jGyjrgqgY0UtXp/4qsdVJdKXwH/2nEpsN6xts7lI/grz
 ir8=
X-IronPort-AV: E=Sophos;i="5.81,240,1610434800"; d="scan'208";a="112819487"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Mar 2021 04:35:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 11 Mar 2021 04:35:04 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 11 Mar 2021 04:35:02 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 5/5] MAINTAINERS: add entry for polarfire soc mailbox driver
Date: Thu, 11 Mar 2021 11:35:01 +0000
Message-ID: <20210311113501.15745-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_113528_978195_93A16F21 
X-CRM114-Status: UNSURE (   6.61  )
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
index 04590ba30340..a7d9e6f720ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15363,6 +15363,7 @@ M:	Lewis Hanly <lewis.hanly at microchip.com>
 M:	Cyril Jean <cyril.jean at microchip.com>
 L:	linux-riscv at lists.infradead.org
 S:	Supported
+F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
