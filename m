Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436ADC10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 15:38:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12AB22171F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 15:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mSFuxCc+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ZrYJdbtR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="KovqMYxR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12AB22171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tG2Dn7zXxdar5abBYQ6YeWZuPX4viBY/d/aQ6pgpZ7A=; b=mSFuxCc+H9osH/
	83N/Gkeh6sN0tkbLnzAFCkYCcKanYcRZde8jXgNnuwoYIolL7KIjAj3vi7tj2kTq1ymjkP4n0xBhC
	VAn9jJyflqsBz9Y4Zr+GRLJfhv6sm6HpESgk/LUlf2FyydatU2gcMlWyg69PVG/4QyYT75yOMq1pl
	x/JCsdam5pIyI38a+hou3cWVO87EwKOzVqK9AgliRgtWGITK8CkqtYphE/unTsbv09D5hQolzERhK
	WEfSwwqFMz6bjCytaEgPooCAc0H3yReXkA2uIWRlGpEA2wi9ghluskAHoeZ4TvgsbO0Eu3fZdODOS
	UQW8Q36+HUCBHNK9/CxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFKk0-00007F-UZ; Sat, 13 Apr 2019 15:38:52 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFKjy-0008VV-A0
 for linux-riscv@lists.infradead.org; Sat, 13 Apr 2019 15:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555170017; x=1586706017;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4tHpfIdvi6qydRvKMDWyV6PYnG4LFA/c15iKLM1Fzss=;
 b=ZrYJdbtRVpNMg0saEnJ5metQMBBJ/LPmf8FEIo1sEPzy0x0vGEVIT5xs
 9n1CJ7S/AP4jvLSn+T8jntp1aGWO17JU/rT77pbrFxPCRb7J+vMQS8xLX
 LtwQjB3Rx041O3dmRuH8Y5Xlg1lf+FX7nptsCx2Q32MHXwPbzzQmW46Pf
 tVBjlrdD6MPYs4N4thAiE6D+WNnvNsy4bpl+m1gE9tgvlt380Cgg++Uyn
 a2YeOA35jgQ8i/BXQloD7gffSfP3qwYsRC73sXqj+eLJwLSFHOJDiJOFV
 uqxGTu0YsFoIS09kyXP54dKn6Sh8hvSiHwx30rqXgP4d60tqJUq1fAxam w==;
X-IronPort-AV: E=Sophos;i="5.60,345,1549900800"; d="scan'208";a="204828661"
Received: from mail-bl2nam02lp2055.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.55])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2019 23:39:58 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tHpfIdvi6qydRvKMDWyV6PYnG4LFA/c15iKLM1Fzss=;
 b=KovqMYxRCcWtxpXiAJ91DTTg4QaYjSXPiPf6ygQviRjDgR5amP09182JGU6HFKslrPmqRLuCsEWHPK2moo2XwQeOHbqGl+lyfnYgbYH9GNcmDlFaI1D+RyNcqxPZm3Iu2ny+3bTklU5+5Qxashc2I+iV2D2iEqYHYfNxnYIN+ks=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5501.namprd04.prod.outlook.com (20.178.245.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Sat, 13 Apr 2019 15:38:35 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1792.018; Sat, 13 Apr 2019
 15:38:35 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 1/3] RISC-V: Add separate asm/encoding.h for spec related
 defines
Thread-Topic: [PATCH v2 1/3] RISC-V: Add separate asm/encoding.h for spec
 related defines
Thread-Index: AQHU8g7103phegeQY0uauk1U9R6nkg==
Date: Sat, 13 Apr 2019 15:38:35 +0000
Message-ID: <20190413153807.116227-2-anup.patel@wdc.com>
References: <20190413153807.116227-1-anup.patel@wdc.com>
In-Reply-To: <20190413153807.116227-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR0101CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::18) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [106.51.17.210]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d856da29-0045-4588-4d39-08d6c0261766
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5501; 
x-ms-traffictypediagnostic: MN2PR04MB5501:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB5501B20DD56AB1FD7D8322A98D290@MN2PR04MB5501.namprd04.prod.outlook.com>
x-forefront-prvs: 00064751B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(2906002)(71190400001)(71200400001)(97736004)(50226002)(1076003)(186003)(68736007)(102836004)(8936002)(6486002)(86362001)(110136005)(54906003)(316002)(9456002)(78486014)(55236004)(4326008)(81166006)(81156014)(6506007)(386003)(5660300002)(26005)(8676002)(36756003)(105586002)(44832011)(106356001)(14444005)(256004)(76176011)(3846002)(14454004)(478600001)(72206003)(6116002)(52116002)(6512007)(25786009)(99286004)(53936002)(11346002)(446003)(486006)(2171002)(66066001)(7736002)(6436002)(476003)(305945005)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5501;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +cApNlaprpSNpdpfy/jj43atMEcryZ3KbCk8sjdOF3f1lS76Obsn1IxHOLNN3SwmLrWMRBs/Ud2A+9HV91YQ2tTwP46D2+EH/jMWbDOUf+W1BmQuQp5sWszdGKv0BHDxit2n02e4x5LtmTuSplub9mK5bdIOemUBTVtu/4KPQUfSdtg0EFfCbsRTZTThmDoQn2fIMPKjOJm50c6fQkaPnNjRWU4fmQip2XRuqZnlWjLft2HKEwycoZMogrkQIo2jsy9IFaU5PL0vQ7ilLQzz9VTlYENLZPc1tQ/nsmmio81oo2UaWYvjagfoFTGlaVJN6waOWKL3l05HBgj75ujyi0lI6qyeRxy7su+9hw+GoNUXhWqqRXI08jxU56935NpFVTefpGegWPXCjVX6Oz/sfTOI5/D8y4sqUKrCFO37Xf0=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d856da29-0045-4588-4d39-08d6c0261766
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2019 15:38:35.6556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5501
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_083850_453060_9DFE34E4 
X-CRM114-Status: GOOD (  16.80  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

It's better to have all RISC-V spec related defines in one place
so this patch adds separate asm/encoding.h for such defines which
can be included in assembly as well as C code.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/include/asm/csr.h      | 52 +-------------------------
 arch/riscv/include/asm/encoding.h | 62 +++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 51 deletions(-)
 create mode 100644 arch/riscv/include/asm/encoding.h

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 28a0d1cb374c..8cf698e39463 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -14,57 +14,7 @@
 #ifndef _ASM_RISCV_CSR_H
 #define _ASM_RISCV_CSR_H
 
-#include <linux/const.h>
-
-/* Status register flags */
-#define SR_SIE	_AC(0x00000002, UL) /* Supervisor Interrupt Enable */
-#define SR_SPIE	_AC(0x00000020, UL) /* Previous Supervisor IE */
-#define SR_SPP	_AC(0x00000100, UL) /* Previously Supervisor */
-#define SR_SUM	_AC(0x00040000, UL) /* Supervisor may access User Memory */
-
-#define SR_FS           _AC(0x00006000, UL) /* Floating-point Status */
-#define SR_FS_OFF       _AC(0x00000000, UL)
-#define SR_FS_INITIAL   _AC(0x00002000, UL)
-#define SR_FS_CLEAN     _AC(0x00004000, UL)
-#define SR_FS_DIRTY     _AC(0x00006000, UL)
-
-#define SR_XS           _AC(0x00018000, UL) /* Extension Status */
-#define SR_XS_OFF       _AC(0x00000000, UL)
-#define SR_XS_INITIAL   _AC(0x00008000, UL)
-#define SR_XS_CLEAN     _AC(0x00010000, UL)
-#define SR_XS_DIRTY     _AC(0x00018000, UL)
-
-#ifndef CONFIG_64BIT
-#define SR_SD   _AC(0x80000000, UL) /* FS/XS dirty */
-#else
-#define SR_SD   _AC(0x8000000000000000, UL) /* FS/XS dirty */
-#endif
-
-/* SATP flags */
-#if __riscv_xlen == 32
-#define SATP_PPN     _AC(0x003FFFFF, UL)
-#define SATP_MODE_32 _AC(0x80000000, UL)
-#define SATP_MODE    SATP_MODE_32
-#else
-#define SATP_PPN     _AC(0x00000FFFFFFFFFFF, UL)
-#define SATP_MODE_39 _AC(0x8000000000000000, UL)
-#define SATP_MODE    SATP_MODE_39
-#endif
-
-/* Interrupt Enable and Interrupt Pending flags */
-#define SIE_SSIE _AC(0x00000002, UL) /* Software Interrupt Enable */
-#define SIE_STIE _AC(0x00000020, UL) /* Timer Interrupt Enable */
-#define SIE_SEIE _AC(0x00000200, UL) /* External Interrupt Enable */
-
-#define EXC_INST_MISALIGNED     0
-#define EXC_INST_ACCESS         1
-#define EXC_BREAKPOINT          3
-#define EXC_LOAD_ACCESS         5
-#define EXC_STORE_ACCESS        7
-#define EXC_SYSCALL             8
-#define EXC_INST_PAGE_FAULT     12
-#define EXC_LOAD_PAGE_FAULT     13
-#define EXC_STORE_PAGE_FAULT    15
+#include <asm/encoding.h>
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/riscv/include/asm/encoding.h b/arch/riscv/include/asm/encoding.h
new file mode 100644
index 000000000000..29699705dc36
--- /dev/null
+++ b/arch/riscv/include/asm/encoding.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2015 Regents of the University of California
+ * Copyright (C) 2019 Western Digital Corporation or its affiliates.
+ */
+
+#ifndef _ASM_RISCV_ENCODING_H
+#define _ASM_RISCV_ENCODING_H
+
+#include <linux/const.h>
+
+/* Status register flags */
+#define SR_SIE		_AC(0x00000002, UL) /* Supervisor Interrupt Enable */
+#define SR_SPIE		_AC(0x00000020, UL) /* Previous Supervisor IE */
+#define SR_SPP		_AC(0x00000100, UL) /* Previously Supervisor */
+#define SR_SUM		_AC(0x00040000, UL) /* Supervisor may access User Memory */
+
+#define SR_FS           _AC(0x00006000, UL) /* Floating-point Status */
+#define SR_FS_OFF       _AC(0x00000000, UL)
+#define SR_FS_INITIAL   _AC(0x00002000, UL)
+#define SR_FS_CLEAN     _AC(0x00004000, UL)
+#define SR_FS_DIRTY     _AC(0x00006000, UL)
+
+#define SR_XS           _AC(0x00018000, UL) /* Extension Status */
+#define SR_XS_OFF       _AC(0x00000000, UL)
+#define SR_XS_INITIAL   _AC(0x00008000, UL)
+#define SR_XS_CLEAN     _AC(0x00010000, UL)
+#define SR_XS_DIRTY     _AC(0x00018000, UL)
+
+#ifndef CONFIG_64BIT
+#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
+#else
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
+#endif
+
+/* SATP flags */
+#ifndef CONFIG_64BIT
+#define SATP_PPN	_AC(0x003FFFFF, UL)
+#define SATP_MODE_32	_AC(0x80000000, UL)
+#define SATP_MODE	SATP_MODE_32
+#else
+#define SATP_PPN	_AC(0x00000FFFFFFFFFFF, UL)
+#define SATP_MODE_39	_AC(0x8000000000000000, UL)
+#define SATP_MODE	SATP_MODE_39
+#endif
+
+/* Interrupt Enable and Interrupt Pending flags */
+#define SIE_SSIE	_AC(0x00000002, UL) /* Software Interrupt Enable */
+#define SIE_STIE	_AC(0x00000020, UL) /* Timer Interrupt Enable */
+#define SIE_SEIE	_AC(0x00000200, UL) /* External Interrupt Enable */
+
+#define EXC_INST_MISALIGNED	0
+#define EXC_INST_ACCESS		1
+#define EXC_BREAKPOINT		3
+#define EXC_LOAD_ACCESS		5
+#define EXC_STORE_ACCESS	7
+#define EXC_SYSCALL		8
+#define EXC_INST_PAGE_FAULT	12
+#define EXC_LOAD_PAGE_FAULT	13
+#define EXC_STORE_PAGE_FAULT	15
+
+#endif /* _ASM_RISCV_ENCODING_H */
-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
