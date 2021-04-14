Return-Path: <SRS0=Cgvv=JL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F142C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 15:54:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BFC861220
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Apr 2021 15:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BFC861220
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Aw1yqwnKKKSymJ4/K3ttSJcnFK6JdioXrjz5uVbtBU=; b=ebyeTkR3sPd+NTREU5aGLUrkIM
	wXOAHYcHw/SRJLfh9020PxYlSmqxeRNyPvCjYoyXTD+QqAC3dm/v0V8mSnPLoevyWgBRE/we9tUWX
	HT7+Rr6wVOpnkwU3wBDOMfT7CacqVceiLbI4uwIsVNClZ42B+gFHM6+i8+xfti8d5/lX+KagjaRg/
	0hzUH5dmyAb5L/rZL49dC3ClOOgRFnYs1tqe9bcKRJfEWxZIKvhyJ01qgYxRSQB5tXcciWli7ZUh4
	ph8h07l4KIMDAm82C8O4Ypl+ZuSyj/w1E44Nf1O+O5pA2pVvnFWXW698WmAAYiu5dkAL+0hsPUe5J
	4jej53UA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWhqH-00D4VN-5G; Wed, 14 Apr 2021 15:54:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWhqD-00D4UR-Te
 for linux-riscv@desiato.infradead.org; Wed, 14 Apr 2021 15:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=voUoZlOnCVj/790CG/OF+li/hqfEY+voG0E40WsJ6LY=; b=Wu07at3SiJZum3GFbBy3W50/fH
 j0Bm3Q4nfWd5Z1BbpzNHDx+dX7zep6uMwDL/kOGb1/x9nPl6ONjCwBq/Wh7JRxXKJ/IseXqY9TYYB
 HlZOcVC574+07bxxoCBjsn6f0S5xnG9ypiEpEcJHR3W4mbd28Uz8KrqEK+sfC3W/WFI5rweOG3GCn
 pejXUr7UEBxeG7F8KTBjbjK5z1cwympzCWGvJYF5oMn+VdI+Aib5501EjwTU0uCLyd9Tx0pgvlC/I
 58dQUcZcKAAcGcAoepwnVo4YEa70Hj5qgOGpeDyAftWRUGc3pYrxHuhfxmMALN1Lzu/E18vL3FaVa
 eWbzbOQA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWhqB-007vGL-H0
 for linux-riscv@lists.infradead.org; Wed, 14 Apr 2021 15:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618415647; x=1649951647;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/KGk8I8m0j2VmOPYq7abEM0DKHicSdwT4puY/U8F15Y=;
 b=sOlxhM4z5XyN2zClnE+DAm2bFFIYRUNrmTpbJYWGT6S/m0kgs4LOSlfL
 Jv0BxuRIcknpg087eEQ+ui5rxm7JWnC19ZUk3nZO1DAzvfNNvsW9rCoYV
 OhIS9cLre88xTUiMshOB9jNgtk50+e1M+My1kJqetFqN28giWwxg2ZCAU
 5ciPKu42aq8BivKmZYgeKDpmoxqxqb+Dp1O4deD6I3cIyD2BB8fhE4n6Q
 YBOc7nqMpSCyqiR5+0n/yID1sxbAFtSCPF4UOTDie25iyRm7Y8jfX01Tr
 UdHAltkxDbY3nIXIxy0Z2nMGES15x4St1/6ZNl726Hl1BzEPx+XdicXLU A==;
IronPort-SDR: makIn7PkMyJY5XX2jaRoSn0KvBrJKDaW1zDoiOL6H/bT6eCssMrWiulXA06B0USqFRNdPs0g6l
 bKxfUEitsjTDgLSEqp56vDpM7kgmnXetwfTLKUooMBFbPkc0Y72PHKs8hsOnyiegwsYNdvFVg5
 gaFMDVcI8DWGWdXSFXDT5quZ8GFjI7iZZkanAOyoD2tbVYrTO+KjerzORORkLlzqPe5lFwjAlO
 Ji2dhaBoPOejgm6Nn34sXPrtMaRIWzjaEdfXe0vjbeyq30FxdJyMkhVlgZyOajVFdgfwigsRix
 R1Q=
X-IronPort-AV: E=Sophos;i="5.82,222,1613458800"; d="scan'208";a="110799902"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Apr 2021 08:54:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 14 Apr 2021 08:54:06 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 14 Apr 2021 08:54:03 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 5/5] MAINTAINERS: add entry for polarfire soc mailbox driver
Date: Wed, 14 Apr 2021 16:54:03 +0100
Message-ID: <20210414155403.29800-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_085407_644591_4600B9DF 
X-CRM114-Status: UNSURE (   7.16  )
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
index fc7eb045d65f..4b7590c5527d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15364,6 +15364,7 @@ M:	Lewis Hanly <lewis.hanly at microchip.com>
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
