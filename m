Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B84CC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 15:38:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C10A208E3
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 15:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ob8KiPkc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="kAjuYb2+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="D6UFD9g2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C10A208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XFS2oKt6RSQTdvo2/nMErTyq7+NjoPYEKNOEsJUYOcg=; b=ob8KiPkcbKsYQP
	S5/9Iju2UGHNdZH3Ayh0+wEvDhRASzmKKUaesUugyZ1LNZVOkKvNzQzSXH49g9RFa3HChN3Wr5m7i
	4gq/7QVX2TxLBdusTs3qXTwh1dYt1idaMV3I44b/5zPHlps04/PNbjNEGF7rK7fByyGJRTQ6U5hq9
	Hoec4FtrohyLU+xmya5tePFW03jucffYS4xOCOY27WIIWCgh7gUkGxFRcvfgcMgRboGhcctrsnvhW
	cUwcobv3V4VC/QvhkELAMFmt4lwesS48kbhfkbhVckxeOOuOoy3fnfOb2oBWlcq7UXbtfo3XOqEpk
	LRoYiDsRCpL+5bUzk5yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFKjz-00004z-Bu; Sat, 13 Apr 2019 15:38:51 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFKjw-0008VV-P4
 for linux-riscv@lists.infradead.org; Sat, 13 Apr 2019 15:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555170015; x=1586706015;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=HBm7XEFzUIrSj1v9wAXJb/pP46PgFBLG/K9fLZGR2nw=;
 b=kAjuYb2+MtTFinUn1/54x4J7Sb2Bq9x4VcZ8I/w5wMlcs0P8RpRF1euX
 Gn/ckRNEV29wO2dIx0AWrZ1HDzKbu1dTJ5a0tCNCv8sgT3VbVo/OMtpFq
 KpWTR1UO9CIuyArkISFCBN0pyv3Qu8cd51NOcSndFbZ9hKgjloh5BFya4
 MiR4MUrs0LDgbHqHqDx1StTRHeUh5SfmwjUPljSJenb02NpTnhAPQG9Dv
 1XAL63+pkRJQBArPphdb4SBd9iVOqCFHpgkyh7Z1Xs5OTGHsjViAolNiI
 ssoQPTaLgI2qmbD/02z1CeG4FFxlxKTUUIDlet/n34WHa64d6q5LmImRE A==;
X-IronPort-AV: E=Sophos;i="5.60,345,1549900800"; d="scan'208";a="204828647"
Received: from mail-bl2nam02lp2055.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.55])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2019 23:39:52 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBm7XEFzUIrSj1v9wAXJb/pP46PgFBLG/K9fLZGR2nw=;
 b=D6UFD9g2snHFcbKwiqRVDzsr74hZ5tcUlQCXbfa+vnGr2B99MwkoWK/NKV3WBADvA8Sz7wDucZA2lw7cbAINL7E5aHysez1YCsuiZBKUIoyMWc8VkqBByeEFTgt3Qn8lZxbNk+biBzNNfxuBXHDTselDr1yLjBh1hVbc5IJMXFg=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5501.namprd04.prod.outlook.com (20.178.245.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Sat, 13 Apr 2019 15:38:31 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1792.018; Sat, 13 Apr 2019
 15:38:31 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 0/3] Allow accessing CSR using CSR number
Thread-Topic: [PATCH v2 0/3] Allow accessing CSR using CSR number
Thread-Index: AQHU8g7y5A6nUeaLGUqX2vf0HW87WQ==
Date: Sat, 13 Apr 2019 15:38:31 +0000
Message-ID: <20190413153807.116227-1-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: b731c6e2-0f2e-40fa-f018-08d6c02614b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5501; 
x-ms-traffictypediagnostic: MN2PR04MB5501:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB550153423BD035A1909105AB8D290@MN2PR04MB5501.namprd04.prod.outlook.com>
x-forefront-prvs: 00064751B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(2906002)(71190400001)(71200400001)(97736004)(50226002)(1076003)(186003)(68736007)(102836004)(8936002)(6486002)(86362001)(110136005)(54906003)(316002)(9456002)(78486014)(55236004)(4326008)(81166006)(81156014)(6506007)(386003)(5660300002)(26005)(8676002)(36756003)(105586002)(44832011)(106356001)(14444005)(256004)(3846002)(14454004)(478600001)(72206003)(6116002)(52116002)(6512007)(25786009)(99286004)(53936002)(486006)(2171002)(66066001)(7736002)(6436002)(476003)(305945005)(2616005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5501;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uvkf4/VlHTSZbRg/WxppSavsQfhFL9Ygh+sa1ms89B1TtQS26KR+LRp4NVPZH4wG/e4jcAFk8YKB701CkFkuCjjsDzNdA1JDQ9/xt/wV8S3VPWbvBpnE6AStkkUkPTAvoAlX3ylIz5JV90WHWKc38QESjtVhEez3fB0wokebkHjDQSKGvAZGKPvxTqXhHtiwnqcy9JFC8l6UD4XK2wobubTl0RZMpQtMlJ4kGZHNUwAvpXVvQEbOCHS7ybY+lg/IY6/EsYaV5Xo7t5DURcLi0YAsu/VECwYxnJ8VqxbSXewFGHUTcF33aIdCjW3dX01A+DSthNLKoz1KcRYKMzb145SprdUGdke8EAoYfQ8ZhYgSrwV3LY+1UL0SjXqyjKy/QpViF+aKutt5EWrebGX2kUXq0mk8VX5Siif1iTrgwlU=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b731c6e2-0f2e-40fa-f018-08d6c02614b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2019 15:38:31.2625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5501
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_083848_945966_F54EB357 
X-CRM114-Status: GOOD (  14.53  )
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

This patch series adds support to access CSR using both CSR name and
CSR numbers.

Also, we should prefer accessing CSRs using their CSR numbers because:
1. It compiles fine with older toolchains.
2. We can use latest CSR names in #define macro names of CSR numbers
   as-per RISC-V spec. (e.g. sptbr => CSR_SATP, sbadaddr => CSR_STVAL, etc.)
3. We can access newly added CSRs even if toolchain does not recognize
   newly addes CSRs by name. (e.g. BSSTATUS, BSIE, SSIP, etc.)

The patchset can be found in riscv_csr_number_v2 branch of
https//github.com/avpatel/linux.git

Changes since v1:
 - Squash PATCH2 into cpatch3
 - Added new PATCH2 to add interrupt related SCAUSE defines
   in asm/encoding.h

Anup Patel (3):
  RISC-V: Add separate asm/encoding.h for spec related defines
  RISC-V: Add interrupt related SCAUSE defines in asm/encoding.h
  RISC-V: Access CSRs using CSR numbers

 arch/riscv/include/asm/csr.h         | 67 +++-----------------
 arch/riscv/include/asm/encoding.h    | 95 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/irqflags.h    | 10 +--
 arch/riscv/include/asm/mmu_context.h |  7 +-
 arch/riscv/kernel/entry.S            | 22 +++----
 arch/riscv/kernel/head.S             | 12 ++--
 arch/riscv/kernel/irq.c              |  9 +--
 arch/riscv/kernel/perf_event.c       |  4 +-
 arch/riscv/kernel/smp.c              |  2 +-
 arch/riscv/kernel/traps.c            |  6 +-
 arch/riscv/mm/fault.c                |  6 +-
 11 files changed, 139 insertions(+), 101 deletions(-)
 create mode 100644 arch/riscv/include/asm/encoding.h

--
2.17.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
