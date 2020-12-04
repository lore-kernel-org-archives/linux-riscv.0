Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00437C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 08:58:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA85222B6
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 08:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FA85222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cN76LO7AW40EtgVeydIrtYj+kl23bEijK5wjC55XjVo=; b=x8ayJkg/ZMeLgPuIt2wSQ8GSd
	7vD8HxhqPr/SGFqFql5+1Bin3mz4jJmrscctsKBk7kPO0/O8cx13fj+2UMAlPInuKGxsNELRjPmdx
	yGc89WyEUjGTf8Mwv71siJF6/67u0HBWDwacvA+g1HWBit/IG1mutwxMmVKrznE4+nkKtv6C7lh1y
	Y9//ztvPW+N0SFDVeJyn2R4GynabH/qdpZ3lAi8U9eF725k42xKzqOkXoYZqwAn/ZJHDNFwTONeOt
	/hm++fh5M6ShUoI1dsNRDrkS3aRWQvacOGrtxRbI7hB/gHF94xLFfSKe+IBKzdH8WQhOxY9PC2AFw
	uOsBZHQ2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl6vM-0002f5-KS; Fri, 04 Dec 2020 08:58:44 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl6vK-0002cr-DM
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 08:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607073487; x=1638609487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hd8ZmjId7vBbXQM1jz5+4Nu+51CF6i4iXNW7aRPTEWM=;
 b=N80Nl0Elbjp9OPnOj9C5GmB54CwsnyxOEMU6yQyH37alIef/UF85eWfW
 PQiFd9pDQwjK4Vfjo0CXf7LWfqyfYjZdzpA2R/Rgv6q5UnNUYbIG05vRA
 6oMIrEwaUlMtZCAUdoz76xavX9ymxf93ZM1GbuX/0NriV1fnBHktdvae1
 +EI5C4yFqIIVjv6STvULw2U0+xglZYAr0tsA27ashkNQpT5pXzP/Ig1h+
 nAjAZmLoVvguREUcHawzSReCmTBwuLIDl8o4jd4aXEfuHILmOvTKmeoKh
 VnKMnWQiMnlcNTPl3dbHzuHjujG74/arxJu50Pl9sr8SujfqBJwpmW1z+ w==;
IronPort-SDR: xVLExGgp2F0eiB7F1IU03l6crsyQKizXk9uiDWmWA49CBopG9r1yeKrF3zx2vqJarKmnEhZN9b
 jRgpwbqhTm+XnRcMmXfFxk2SFfX+uVjTYqvZLuh7OQEUsM7409rntrOoSfH0cHk6eJRz2WlBL3
 0uQ2IKY0OJCYHIPJuQXdquzm+MecXquZRKM5mu4vECO9qAclEKDFmS7KJHLoBd5JD6aeneo9z2
 4gi0UZD+HqdCKXrB5KfsmEl8QeBZrxYydVNMIZ+A6keONBEefztKfvFvaF+hwxSp0dqT4Y6vVs
 0vQ=
X-IronPort-AV: E=Sophos;i="5.78,392,1599494400"; d="scan'208";a="258129843"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Dec 2020 17:18:03 +0800
IronPort-SDR: aZUVpUul0ukgxsaC0Skf0K/tdb0brTnVqTkhAsz7bdlHrmg5DtWCU2kRbcPRo5/1Kqh/QYvtuw
 KM8PI7ChSt5sqx8faXpcnm7UZs1TzYdSA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 00:44:11 -0800
IronPort-SDR: YOD2hDxJzF7vnxvNHifPyI2Oz/45hnF4x7vnKsbiL5xlYmiL7JrCkysKlgtj+4NhYzIIZq7lHn
 cAyt4lJHnBqg==
WDCIronportException: Internal
Received: from cnf010505.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.200])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Dec 2020 00:58:39 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] RISC-V: Add Microchip PolarFire SoC kconfig option
Date: Fri,  4 Dec 2020 00:58:31 -0800
Message-Id: <20201204085835.2406541-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204085835.2406541-1-atish.patra@wdc.com>
References: <20201204085835.2406541-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_035842_649660_4E695868 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Bin Meng <bin.meng@windriver.com>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 Conor.Dooley@microchip.com, Rob Herring <robh+dt@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Ivan.Griffin@microchip.com,
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add Microchip PolarFire kconfig option which selects SoC specific
and common drivers that is required for this SoC.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Kconfig.socs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 8a55f6156661..148ab095966b 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,5 +1,12 @@
 menu "SoC selection"
 
+config SOC_MICROCHIP_POLARFIRE
+	bool "Microchip PolarFire SoCs"
+	select MCHP_CLK_PFSOC
+	select SIFIVE_PLIC
+	help
+	  This enables support for Microchip PolarFire SoC platforms.
+
 config SOC_SIFIVE
 	bool "SiFive SoCs"
 	select SERIAL_SIFIVE if TTY
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
