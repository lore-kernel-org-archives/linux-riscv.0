Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA32FC10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 07:39:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A69E920850
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 07:39:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DYOzt2Jd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="As66JABl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Ax3A7Vq2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A69E920850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBan+CsNAevcAJYuz1vzmo0cclB90zwI1ab4wZuZuvw=; b=DYOzt2Jd7aVjlc
	NPyjWStysjeRA0ZP5LfmUOZAWbOH50P4gkacZma1UJHv1DvdO79HzNJjGHJmIROR4kPgldaHYGW6P
	Wjv0a8f9XHfFcmiNTjyw3p16Yf2ctLomjNtGFq+q93Wr/qJCIN73mG05DO7/JbaA/QUOhF76PP0XO
	NWC+Ws76su2zKhXnruGlyzybKfKSomGKaMbFDn/XWGXNj4914B9c3Y8thKs6i5WhNSeQjiIOf4rgi
	vIj/FYPMrCgTgjRFRGDlNTeNX/cqZ+5zadH8RJaQ2JZ8DDAe8ROooZYZlAngQGH3fP5ROli9N9XU9
	tCbXOpAtrVmD9OolzYgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFDGK-0003iJ-L0; Sat, 13 Apr 2019 07:39:44 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFDGG-0003f5-Bd
 for linux-riscv@lists.infradead.org; Sat, 13 Apr 2019 07:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555141183; x=1586677183;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mBA9bOg5ypIJFQF5ZkINkMazG6jw+o6/bZ+ER4Fr0/Q=;
 b=As66JABlgXGTPQlmcEH8aKiDTyWuldbReBCBDSkHwHkka97eoZfIseSB
 VhCty84lD/+AUAqR2An1JnPhXOC0SxrkPhQ9RNAT6qHfSsUuk7y0IGybq
 9fnP+pzgnsj6q2OT7Fe7E+3CDxpfU7t/VEltRukZPrNQyXe5Rpr8sj+1+
 Woh1gI9i27lNa5T8tj0Nj3UK5ydVxok0NKZ4EnPFkSHEKZASrHFk5yGi/
 wv8ywz0bvjuz9WcGKnm/BpLzqIXjjPytmN2vNz4PUrsZA+hezMRFs3cVY
 vG9Qpdu/6A4p0jylG0RrA83TfACsGbk6sTwygqvt0z68ddTqwQtplR/sD w==;
X-IronPort-AV: E=Sophos;i="5.60,344,1549900800"; d="scan'208";a="204791366"
Received: from mail-co1nam03lp2054.outbound.protection.outlook.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.54])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2019 15:39:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBA9bOg5ypIJFQF5ZkINkMazG6jw+o6/bZ+ER4Fr0/Q=;
 b=Ax3A7Vq2LAyirf5oeQGwVMLwPh+LGfVFGlHfJhRHPU7X55t2RKic2t1/2RjGZNWA3YzESdxUfFRG2JbhTst7vDltnEBRBmFWGvTKT2idpwSwH20BtABKVNmODa5g5MwJ3wBkIuneDOdhS2exMTU7fDI7fmf3Sr4DRQDZv7V1Rzc=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5613.namprd04.prod.outlook.com (20.178.255.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Sat, 13 Apr 2019 07:39:35 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1792.018; Sat, 13 Apr 2019
 07:39:35 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 1/3] RISC-V: Add separate asm/encoding.h for spec related
 defines
Thread-Topic: [PATCH 1/3] RISC-V: Add separate asm/encoding.h for spec related
 defines
Thread-Index: AQHU8cwKlbzvIohFq0mvMm3mh60qaw==
Date: Sat, 13 Apr 2019 07:39:35 +0000
Message-ID: <20190413073906.53676-2-anup.patel@wdc.com>
References: <20190413073906.53676-1-anup.patel@wdc.com>
In-Reply-To: <20190413073906.53676-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR0101CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::13) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [106.51.17.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bc891d2-eb75-4229-b73e-08d6bfe32cca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5613; 
x-ms-traffictypediagnostic: MN2PR04MB5613:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB56138FB96FEE1478DA9796138D290@MN2PR04MB5613.namprd04.prod.outlook.com>
x-forefront-prvs: 00064751B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(396003)(366004)(39860400002)(189003)(199004)(9456002)(44832011)(256004)(14444005)(78486014)(54906003)(14454004)(316002)(7736002)(1076003)(71200400001)(102836004)(25786009)(186003)(6116002)(50226002)(4326008)(71190400001)(5660300002)(110136005)(386003)(3846002)(8936002)(6506007)(2906002)(55236004)(478600001)(26005)(305945005)(2616005)(476003)(105586002)(72206003)(106356001)(486006)(76176011)(446003)(11346002)(52116002)(66066001)(6486002)(97736004)(53936002)(36756003)(81156014)(81166006)(99286004)(68736007)(6436002)(86362001)(6512007)(2171002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5613;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7BGWNSUbL//VYYrcuU5d5+PgDkfDvYu5SijdTl/RNKQYNZ9uCexJEUceCzWBSFMZfp5JDQmQ8UCBfAntXDD9ejCVy9vMGp5+G7NABSIantd1Boly/1RHbN+84GxncDn9oDYnYpMyBS1L71Xi+EJCy6zfcAzj/U715BagxAo7LIykfHDpW4FQJMiaC4aSXsqWJBfL5lUchdXodELeEuR2oK07BoIR2Ae8amQ4zg4rYM44YkmszJJ2jBt7ut2kQNUR1FdtegP/CEPFPIlky1/aVjaWlyCIZReABGui4DB66kHJYUxJauvsH8y/BF/nsNMCF6gag8bHq7g1MnHe9ye/YaF65A8nm6psZyShBgfpQnCQLzQ47awvAi6Z2tS6kof1MynQ9gHEisi2SAwGWAM/w4A9cJXzvIiui6O8NGKh608=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc891d2-eb75-4229-b73e-08d6bfe32cca
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2019 07:39:35.3170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_003940_434845_7915DAD6 
X-CRM114-Status: GOOD (  16.69  )
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
index 000000000000..8d8bf424847b
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
+#define SR_SIE	_AC(0x00000002, UL) /* Supervisor Interrupt Enable */
+#define SR_SPIE	_AC(0x00000020, UL) /* Previous Supervisor IE */
+#define SR_SPP	_AC(0x00000100, UL) /* Previously Supervisor */
+#define SR_SUM	_AC(0x00040000, UL) /* Supervisor may access User Memory */
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
+#define SR_SD   _AC(0x80000000, UL) /* FS/XS dirty */
+#else
+#define SR_SD   _AC(0x8000000000000000, UL) /* FS/XS dirty */
+#endif
+
+/* SATP flags */
+#if __riscv_xlen == 32
+#define SATP_PPN     _AC(0x003FFFFF, UL)
+#define SATP_MODE_32 _AC(0x80000000, UL)
+#define SATP_MODE    SATP_MODE_32
+#else
+#define SATP_PPN     _AC(0x00000FFFFFFFFFFF, UL)
+#define SATP_MODE_39 _AC(0x8000000000000000, UL)
+#define SATP_MODE    SATP_MODE_39
+#endif
+
+/* Interrupt Enable and Interrupt Pending flags */
+#define SIE_SSIE _AC(0x00000002, UL) /* Software Interrupt Enable */
+#define SIE_STIE _AC(0x00000020, UL) /* Timer Interrupt Enable */
+#define SIE_SEIE _AC(0x00000200, UL) /* External Interrupt Enable */
+
+#define EXC_INST_MISALIGNED     0
+#define EXC_INST_ACCESS         1
+#define EXC_BREAKPOINT          3
+#define EXC_LOAD_ACCESS         5
+#define EXC_STORE_ACCESS        7
+#define EXC_SYSCALL             8
+#define EXC_INST_PAGE_FAULT     12
+#define EXC_LOAD_PAGE_FAULT     13
+#define EXC_STORE_PAGE_FAULT    15
+
+#endif /* _ASM_RISCV_CSR_H */
-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
