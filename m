Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1566FC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:37:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D414A20874
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uvfAcoRx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="XaSKsdrD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="KS/0jhRf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D414A20874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0W+spXI2fTyZt8o7OKn0MpWbFXUZCtRduCc/tOi8JDU=; b=uvfAcoRxj5gGVf
	t3db27uPPu1EqHKCyqK4IDCqt/PIfKinoEK4SeVeSAdIsyzoxeSuJpZd7IYitc7eNUB3xvq7vHHAS
	G+12vzbomfjOa0TlsgUFish6s+2al0FheU/PG1jUi+vpOYeCaqMnWImIQ1I6DuPtSfmAB9lj7oD8O
	YwF+iAdWZN1YPPhPr1nz2Q55cpYSkrt4tutPfUjFVkmFNOO5Cx6fi0bWp+zusuJ6NyNxbtfJXcxRj
	68E2OLSLf5MlelFR4ZLIMhomJecL0f75bCKxv71Dtwu3jf3w75CLHBs0K1FuHSGYUcNgR18xgZqCm
	2oCGFij0o1leGqxnnL8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFy3H-0006o1-Vg; Mon, 15 Apr 2019 09:37:23 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFy3E-0006lh-Du
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 09:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555321040; x=1586857040;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GURct/l0j0ccOvVnF08e5+y/fSWDYVQQbDkhSw4WGYE=;
 b=XaSKsdrDJmh4fq8jgFFEuhZ9scR3vrJ/jXhmo/GI/spZKOx1f8+Cfw8/
 AhtUZFUMTGE8siJpbFewU+BaCyXt6h+SbvCQ6UO8h2L9DhP7QbV7lRnfp
 Ym1/6WLeIZlxKxdSrtVtYe/NeWBVaepn8IPGjaT7k/u++8sH8P1KQWtDu
 Kc2mJcbOJs78xD017uc3uX5MxqlFbqoZoUlZGEsAOPN+7WMmZs9Rxxart
 nfqPwtrAtJ6UipDuvS1Tu6xLaPKiVgXDGzkcH0LQw6TapQcK9GwJjG1p+
 D4sDyozk8LsjiPB6B2iff/NfCJVfDggRMIZluc5UjsPpth2XtcYcvxBig g==;
X-IronPort-AV: E=Sophos;i="5.60,353,1549900800"; d="scan'208";a="105984895"
Received: from mail-bl2nam02lp2057.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.57])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2019 17:37:19 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GURct/l0j0ccOvVnF08e5+y/fSWDYVQQbDkhSw4WGYE=;
 b=KS/0jhRfcngha4K/Mx9fAJAVCggAhzXN7F3yKT8Ow1QriOTZZLoHcsRXTQx0qwSOG47/9cRvpn6TRYFmgTeor4M5EZiU2A9tdgAe9fvq1kflOc7MIwGQNnWMEn4A4HV3jO4KMDlWCuCSPCMjp2eFCPhIsQjMFfpsl+86Jte2afE=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5677.namprd04.prod.outlook.com (20.179.20.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Mon, 15 Apr 2019 09:37:17 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 09:37:17 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 1/3] RISC-V: Use tabs to align macro values in asm/csr.h
Thread-Topic: [PATCH v3 1/3] RISC-V: Use tabs to align macro values in
 asm/csr.h
Thread-Index: AQHU827QMDsNf/UZykGzHkCw81g5QQ==
Date: Mon, 15 Apr 2019 09:37:17 +0000
Message-ID: <20190415093648.7525-2-anup.patel@wdc.com>
References: <20190415093648.7525-1-anup.patel@wdc.com>
In-Reply-To: <20190415093648.7525-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:40::35) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82c757bb-8a19-41a8-744c-08d6c185f2d9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR04MB5677; 
x-ms-traffictypediagnostic: MN2PR04MB5677:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB56770F3FB972642C06C3531C8D2B0@MN2PR04MB5677.namprd04.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(4326008)(71200400001)(53936002)(71190400001)(26005)(476003)(86362001)(50226002)(186003)(5660300002)(54906003)(3846002)(6116002)(102836004)(97736004)(6512007)(2616005)(6486002)(316002)(105586002)(110136005)(36756003)(11346002)(486006)(6436002)(2171002)(6506007)(386003)(478600001)(44832011)(446003)(8936002)(8676002)(76176011)(68736007)(72206003)(81166006)(2906002)(7736002)(14444005)(256004)(99286004)(14454004)(25786009)(1076003)(52116002)(66066001)(305945005)(81156014)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5677;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kDTVSc/XcAQDWHRd2R+K23xqat3FSCzVJ3rDikGVnHJkGFLdHF8eaLbgm38DDJq/9FjHgy8GF+uG3kg/Ta2bUKAMMZpG3yvPRwVRLzYlI09L5nbdLnD3F7T5X8QfQ+Sp9yQHI2fusQYEbg5AsEnGL4kfjq2w6iV0q8RejwHDr4ry7dkfEAKp6UFBNf8JPwMnWTuf9TRVyCqCLJhCNldJTIz8Q8JCXvhm6ps4cwRWEVAsb3y7Qpv/HA6zN2fQ60IoYss4pRTsyB+9fWkRXNuHsO0eLhVVvkFKGXyhxRmwiCICUV96acq8+VATGti07iW5UH++pmc8YTRFIQCwvYuKt2LF5hjIjtR6bsIZHKIRMKE/ljTbh4lecRGd8FGpcMZ1xBj92YiwSTun3WgJAvuxN8ajeX1YkQjwR8RgiD3rTNE=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c757bb-8a19-41a8-744c-08d6c185f2d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 09:37:17.3846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_023720_511945_ECD6FAF3 
X-CRM114-Status: GOOD (  13.59  )
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
