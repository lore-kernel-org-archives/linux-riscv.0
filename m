Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EE4C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:38:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76A45208E4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fvDq/wQa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AER/bTPn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="VQMQE2cb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76A45208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nuu8tYN9E5FFT9lor3aRhBCoYPVIPAmyztkiL+E1mzI=; b=fvDq/wQasmphe0
	KpO9sfEaKgT8BzN9Yv18sE/Tzc1TUvPLuqzYveWPpSHKBaIubCz0aDl6C80sk9zagEKQo/+uhcqzF
	5F6ko9Bc+vNNhK0vglFH07nm/yumSYIk1kQh27N7HRBMdwQNetlQIwg0rZYNlOQkOSV3m5sUDzFOa
	yVdRo1DwybkE3qa80gWZep2uzg4sJm8QgZa24Wsq9FNqz5aZUvlymTBGh1oUBrEDasqW/wBiIRsyJ
	pF/QvWvnT4Or7uuaCJvwJqzQQSG+A3q+N5SMPPSvQSYpPvUIne1eFirMkwahYCOzmu03RCDg8aj7W
	5vURvFagQK7kI2UOimuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJZu9-0006pe-Fw; Thu, 25 Apr 2019 08:38:53 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJZtq-0006Mk-6X
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 08:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556181515; x=1587717515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qWrl5iluoHriyffRoGf9OGiYcTMqaJKbW95CDI7FhBc=;
 b=AER/bTPngljpCJXBi8c75VxzDG0bg1jgVeQhouKsSn9+f+tBCfKl0MMR
 EPHvywcHtXQqoS7RmZzm5dG2dbV54tYRaDC6fGEQwb8x7lfO87th/N5pD
 cSXYBcTdId6wOuqS7ZIGswhq5/B4JhaC+ZbyVWQ38QXPLZFTF9MyDnRHm
 0eLkNqB6QPTf7pPKMZ1VYiCnJaSkNoiNTkmnqo9SRudMgPvlk4H/tIp+r
 gmHFXqzvHtGmCK4xChy8iJ4Qiv3Gym5nuhNnZUTtrog61SVRu5ayZTVPX
 iaeLZFDKvml7c1scmUzqv5JLHdoFqDbdQjhiDXBMfy4K7V366Iosoo7u9 A==;
X-IronPort-AV: E=Sophos;i="5.60,393,1549900800"; d="scan'208";a="106780573"
Received: from mail-co1nam03lp2057.outbound.protection.outlook.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.57])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 16:38:34 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWrl5iluoHriyffRoGf9OGiYcTMqaJKbW95CDI7FhBc=;
 b=VQMQE2cb/JnMGmI7ZF/nytSReL1Rq5YKSKJGtjg0dFd4h9pZR3OtsAGl8oHpoQm62qbx6ofhrF7MuLaExkDquIArIXKj/bUHhgHoMed5ylJEmfDatitANOvudKYg+0NopSazCXgy6vkAjytmmkXdvq9UfoJUo9QmufdwXz8LGQs=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5485.namprd04.prod.outlook.com (20.178.248.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Thu, 25 Apr 2019 08:38:31 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 08:38:31 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v6 1/3] RISC-V: Use tabs to align macro values in asm/csr.h
Thread-Topic: [PATCH v6 1/3] RISC-V: Use tabs to align macro values in
 asm/csr.h
Thread-Index: AQHU+0JCFWfNFu2mTUG+uCuJd9l6jg==
Date: Thu, 25 Apr 2019 08:38:30 +0000
Message-ID: <20190425083804.11991-2-anup.patel@wdc.com>
References: <20190425083804.11991-1-anup.patel@wdc.com>
In-Reply-To: <20190425083804.11991-1-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 8d06a88e-893a-49fb-5646-08d6c9596502
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5485; 
x-ms-traffictypediagnostic: MN2PR04MB5485:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB54857DD676AC8B199E3674208D3D0@MN2PR04MB5485.namprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(366004)(346002)(396003)(376002)(189003)(199004)(76176011)(66446008)(14444005)(186003)(6506007)(86362001)(14454004)(25786009)(44832011)(11346002)(6116002)(486006)(476003)(64756008)(386003)(3846002)(2171002)(66476007)(66556008)(316002)(5660300002)(54906003)(446003)(68736007)(256004)(102836004)(2906002)(52116002)(2616005)(110136005)(26005)(66946007)(53936002)(1076003)(4326008)(73956011)(6512007)(71190400001)(8936002)(36756003)(99286004)(81166006)(6486002)(66066001)(8676002)(6436002)(71200400001)(305945005)(72206003)(97736004)(7736002)(478600001)(50226002)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5485;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I2VXiQuSsQAcecLsxy3jS7cmvO46gnhzK8Pm6PGp5swsklGeUHrSxzWkbSWAnwLO0+pRp6UuWBVtSScOJReTEr9dSAM4y9mwqm6mzjoH3Ng+04NdjBel2B7RI7e+tIBXbBo7NSAIA4WEyvImFjQcn+PmSBeKJ4LkgGcv/PUKC2r8mkkPFcLt3C02De1ZCcNBZmZyOcXAf4Xagclc6wAugSjvXPd2UxW4rFPMdwxxjdw6lTcvBFPCieux6+6BDFh3Pyi1CyKBUe/nnV7gCG2j+PuxZ5VUQ2ntNs63NKxyn3456qTal1z3E8GqZ8ZpUeby0UOgpP1c6yT4KmeqqJU088KR5dgepoAuloi7fJ7FnCGsX1sSDd2yvl9Xn620rwMHghXRA6OA6SbrdkFhzj5/QlHCqS8cLvCejr9N3IQrsT8=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d06a88e-893a-49fb-5646-08d6c9596502
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 08:38:30.9142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_013834_290887_5B532900 
X-CRM114-Status: GOOD (  13.84  )
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
