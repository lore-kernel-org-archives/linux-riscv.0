Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9523AC282E1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:50:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6359A2148D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:50:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hGMcRs05";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ETr+OE5o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="C5e+qWFQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6359A2148D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nuu8tYN9E5FFT9lor3aRhBCoYPVIPAmyztkiL+E1mzI=; b=hGMcRs05m9o1DW
	/bCWzMNty//djcSBAvI3zQ9G9UILTZWdh1Wj3C7fGQIok7dferknW5Z9WCxLOPU7FGnuyUpbvDgY6
	OxQUyWx5aevMINDGz9W+/OWKvFxZhJ42f7yf0Kjt3RErcRCJSaV/MF+1J5nf0osWHcAOMAlf4GuUe
	Rv2HM19UQsR4NRzaHFZXgjzRdbkihhk2ZQEpqhsj44xzt96VRBztlu2+JPxTMYPw+/B6RP8FQJtwt
	rG7bQnPp95avDgegXLNLyFQWRHVWqX4UVCnuTi5y8ceKbmgJkGp4Z5QvCopK/PMJag/iSL4+UM80u
	pzqHmhVrzUeAM1m1pcwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJXHX-0005wh-3L; Thu, 25 Apr 2019 05:50:51 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJXHT-0005tQ-GF
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 05:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556171448; x=1587707448;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qWrl5iluoHriyffRoGf9OGiYcTMqaJKbW95CDI7FhBc=;
 b=ETr+OE5oZ/0ygJTkOIr+m9aM1M1AXJRlf6y5rWPP4Mz1ONgmwRQCRwuX
 Zq+N7tEMDrPQXtCoI5AZOrGWX1a0yibPh3a07VmQM0yTAjol6yeWt5qsq
 u4xUKWcvzh52JuBr5S8BuiHUOsVe4i5QDEzBdjEx19L2njhgNqWLcBdbY
 DakSs6XgYGcWiCt+Zjxe/n27BLpy1a7ID8bhauRDX25y7yeDzf3hUa1+k
 r8WVsl8HnlfhN9+wiyNYYEDlfw6IpNhwgeg82A6j4DtkGzz7uBwIpW8Lo
 RkF4GJw0JUjA4eoC2fUGnrCCNfEDu9XxbCgk+7v5JgTqn1Zqudn67l9c0 w==;
X-IronPort-AV: E=Sophos;i="5.60,392,1549900800"; d="scan'208";a="111723165"
Received: from mail-dm3nam03lp2054.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.54])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 13:50:47 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWrl5iluoHriyffRoGf9OGiYcTMqaJKbW95CDI7FhBc=;
 b=C5e+qWFQdv6tdiAdsU/uBfAs85aUAOqOc5jlqMMYKfMLLwwlf5wjmmCuh8Yghyks6+WDMQsTxLmr9NRZPfWRIfX2MxDl8zWBCiI+0JQnNpAX1eGklduOFeIO+RLCRG2dZZEPDuJuGc1ofUgjR+x/KsPXcInerA9kzK++po4oWiM=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5552.namprd04.prod.outlook.com (20.178.247.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Thu, 25 Apr 2019 05:50:44 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 05:50:44 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v4 1/3] RISC-V: Use tabs to align macro values in asm/csr.h
Thread-Topic: [PATCH v4 1/3] RISC-V: Use tabs to align macro values in
 asm/csr.h
Thread-Index: AQHU+yrS5qCEsm/uW0KGRwehDLe8cQ==
Date: Thu, 25 Apr 2019 05:50:44 +0000
Message-ID: <20190425055015.45487-2-anup.patel@wdc.com>
References: <20190425055015.45487-1-anup.patel@wdc.com>
In-Reply-To: <20190425055015.45487-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::25) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f01b9a42-4f95-491a-d74f-08d6c941f543
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5552; 
x-ms-traffictypediagnostic: MN2PR04MB5552:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB55521CC2532910451402F09D8D3D0@MN2PR04MB5552.namprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(376002)(346002)(136003)(396003)(199004)(189003)(6486002)(1076003)(2616005)(476003)(76176011)(14444005)(486006)(50226002)(256004)(66066001)(7736002)(305945005)(73956011)(2906002)(72206003)(14454004)(446003)(478600001)(11346002)(6436002)(3846002)(6116002)(66476007)(316002)(64756008)(66446008)(66556008)(66946007)(54906003)(110136005)(6512007)(8676002)(6506007)(386003)(71200400001)(71190400001)(186003)(86362001)(4326008)(102836004)(68736007)(2171002)(5660300002)(81166006)(26005)(81156014)(53936002)(8936002)(97736004)(52116002)(25786009)(99286004)(44832011)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5552;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: X3rkIkYsQLTxkozb/f4jM24DvHx/r5rB0DwHg4A/qr9NoHhwmnIvpBT2VfArLlk01uBRojDfeqaQ2dWN4douo9ecmihYM/fPF5qJ910BZr2ijO4hrwbiovnXgFlsvBBwyETd7fKQQQFmsuck2n9Dkequ/Fl1By2RoDhRnqpdV4HK/Z6JW+kSqfTJnae3m/vXqu1wJEXL489UcA4+hF2AzZD1Aex4mkV+afnehxUYAkZKw8aCXwyr9Ldk4EXjbG9qe14neIJBqBczui0mtGBLObnhtAAz0yY7U3cQ/+qKzbZe6JswBsPWbhfAgHvEqd1sJlmotIjgCho9rckRGb9zr7Sv1YN78DqyU8U/pC+X4ZyEjRFvLCXPunX3Fw4N9QHiPx17EQo6TrXMrDQhroZUQqb3GUtW8BMuZ1qDbX7JEPg=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01b9a42-4f95-491a-d74f-08d6c941f543
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 05:50:44.8758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_225047_983643_00C086B6 
X-CRM114-Status: GOOD (  14.14  )
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

The spacing between macro name and value is not consistent in
asm/csr.h. This patch beautifies asm/csr.h by using tabs to align
macro values instead of spaces.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/csr.h | 76 ++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 28a0d1cb374c..2ae54a7386f1 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -17,54 +17,54 @@
 #include <linux/const.h>
 
 /* Status register flags */
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
+#define SR_SIE		_AC(0x00000002, UL) /* Supervisor Interrupt Enable */
+#define SR_SPIE		_AC(0x00000020, UL) /* Previous Supervisor IE */
+#define SR_SPP		_AC(0x00000100, UL) /* Previously Supervisor */
+#define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
+
+#define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
+#define SR_FS_OFF	_AC(0x00000000, UL)
+#define SR_FS_INITIAL	_AC(0x00002000, UL)
+#define SR_FS_CLEAN	_AC(0x00004000, UL)
+#define SR_FS_DIRTY	_AC(0x00006000, UL)
+
+#define SR_XS		_AC(0x00018000, UL) /* Extension Status */
+#define SR_XS_OFF	_AC(0x00000000, UL)
+#define SR_XS_INITIAL	_AC(0x00008000, UL)
+#define SR_XS_CLEAN	_AC(0x00010000, UL)
+#define SR_XS_DIRTY	_AC(0x00018000, UL)
 
 #ifndef CONFIG_64BIT
-#define SR_SD   _AC(0x80000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
 #else
-#define SR_SD   _AC(0x8000000000000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
 #endif
 
 /* SATP flags */
-#if __riscv_xlen == 32
-#define SATP_PPN     _AC(0x003FFFFF, UL)
-#define SATP_MODE_32 _AC(0x80000000, UL)
-#define SATP_MODE    SATP_MODE_32
+#ifndef CONFIG_64BIT
+#define SATP_PPN	_AC(0x003FFFFF, UL)
+#define SATP_MODE_32	_AC(0x80000000, UL)
+#define SATP_MODE	SATP_MODE_32
 #else
-#define SATP_PPN     _AC(0x00000FFFFFFFFFFF, UL)
-#define SATP_MODE_39 _AC(0x8000000000000000, UL)
-#define SATP_MODE    SATP_MODE_39
+#define SATP_PPN	_AC(0x00000FFFFFFFFFFF, UL)
+#define SATP_MODE_39	_AC(0x8000000000000000, UL)
+#define SATP_MODE	SATP_MODE_39
 #endif
 
 /* Interrupt Enable and Interrupt Pending flags */
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
 
 #ifndef __ASSEMBLY__
 
-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
