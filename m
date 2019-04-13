Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101E6C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 07:39:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E5D2084D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 07:39:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C8LxKPLN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="e+E3xQ/S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="EWfU4JBz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0E5D2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnrnxdmRUhcEC3pxPnM5UXqCPLqzgoW9WhstimiYVeI=; b=C8LxKPLNAmhl6Y
	sB+LPmZSbRA+v1rzspPUCdhREJvfu77mZmgnrgbQ5hjtFpA3ZcH3NBzePSYRlDMKiBfsfcdxw38uD
	TSHoLeyeizsSPWHLseM2xg32ngunSiMrZNY7zcae5Z4sc5w7wkIKeAIK0vQPpTzae/+TFpJDzE9q5
	4tmyr1WJ/WSf0VaLEtQvVjzresLowVO4/mfdCm/UfZ9+YcZ3nGEJY97T9lMmfzlQeiHHbRM89pfTZ
	Gr3kBsNFThfaaAEbw7ILrVAWK0VYIzZgPbwrf91TkIMKQlGcRvZ9S8ra5FNaBLgVotOmj4jhbgI1d
	cEj9XjGQOuVCtefBGFTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFDGM-0003kT-FD; Sat, 13 Apr 2019 07:39:46 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFDGI-0003f5-Rs
 for linux-riscv@lists.infradead.org; Sat, 13 Apr 2019 07:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555141187; x=1586677187;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u//SCynSCgud0bx0mGIcYdxptw7XsOtXxjynWNC6eF8=;
 b=e+E3xQ/SxZLePlchO/7+rSDyWBOVOc/LGJvq54zJQE2rq/QYXA4SskXA
 8A+Su2+8UQqhr0COKd1rsj32pJUVSk8qOFVa1aboQF8uEcYyF4wNDq3VE
 H6fxNQQlWkDkBWjelawXvakZENLjLs5LQte1uCPlhJrJ9PCRtl12sk5YW
 3TFg447ca8Di+ab2ljZkaCaDyCIE6U9GugJNShIfnW+bEI5jX8wVJ3L33
 WDke8i9QzxFpVX48lqfjHrfNQISeOjvqlkdHhUjfn6xIagS324Sv0B7sC
 1E5S0eShCLf683wmZTR3Pb5HdEJo1DF4r0WUfkZLLh3ZWdJsM3ImGiB0D g==;
X-IronPort-AV: E=Sophos;i="5.60,344,1549900800"; d="scan'208";a="204791375"
Received: from mail-co1nam03lp2057.outbound.protection.outlook.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.57])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2019 15:39:45 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u//SCynSCgud0bx0mGIcYdxptw7XsOtXxjynWNC6eF8=;
 b=EWfU4JBzKv432b3vMWZSzvnEc0SpwfJspY5UC4Rl0GW+Q0PtO/JQgb7LrHxNj+mDeoEUlEJUikSf4xIGgx48OsAzYZkIcogCTrpwf10uLTarUwawyuOzDaOjvZaHn9nqiJvx2UvhrQkOtq9Th5wCGuhp3a4kYiPOMC6RDBYS+hQ=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5613.namprd04.prod.outlook.com (20.178.255.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Sat, 13 Apr 2019 07:39:39 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1792.018; Sat, 13 Apr 2019
 07:39:39 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 2/3] RISC-V: Add defines for CSR numbers
Thread-Topic: [PATCH 2/3] RISC-V: Add defines for CSR numbers
Thread-Index: AQHU8cwNIkf4KNdtNEqzdSdgrKw9+A==
Date: Sat, 13 Apr 2019 07:39:39 +0000
Message-ID: <20190413073906.53676-3-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 87916dea-b48f-48c0-3b96-08d6bfe32f5a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5613; 
x-ms-traffictypediagnostic: MN2PR04MB5613:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB5613ED958BA0D7FCC55B33508D290@MN2PR04MB5613.namprd04.prod.outlook.com>
x-forefront-prvs: 00064751B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(396003)(366004)(39860400002)(189003)(199004)(9456002)(44832011)(256004)(14444005)(78486014)(54906003)(14454004)(316002)(7736002)(1076003)(71200400001)(102836004)(25786009)(186003)(6116002)(50226002)(4326008)(71190400001)(5660300002)(110136005)(386003)(3846002)(8936002)(6506007)(2906002)(55236004)(478600001)(26005)(305945005)(2616005)(476003)(105586002)(72206003)(106356001)(486006)(76176011)(446003)(11346002)(52116002)(66066001)(6486002)(97736004)(53936002)(36756003)(81156014)(81166006)(99286004)(68736007)(6436002)(86362001)(6512007)(2171002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5613;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: N7iJBfA4o2e/4pLiqoud8PG8BEDTWqM9a2/M8fURfDIkB9+PKbeNrJbPGDk6aNuXFi9a/Ysgj2r8uqQzlRDTezfkrhyDSmtVxC1MN8SkvUyiZzmMPe94KZLuj4eQRZBlMzUqijA2o4jTahiMR1WTY2tMe5QdQQDLZgIZ7Og8KeS4SGe7bBnlSImxAHqLk/Ljuewp7TFyJ35RNuSxQfaEIGuZQlNAf34VnS8zeQ0vjOJmWViPfoLe5l9ziKKomb3KOQXONphLb2MTUxianve8m+T6nQX0T03SZhKeJWNM1efAURFnAvxxJ0ixBmX0Ega5W3CFU5+2XNBV1EpjXbeiJI1lRyf2YT3QomyWyF2ezxrrHa3GBL9zJxpGQX1vn3oh68UHNnJapiq6BZnXRBg3fyKrRw95jjezsn7Gj9uukMs=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87916dea-b48f-48c0-3b96-08d6bfe32f5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2019 07:39:39.6220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_003942_975680_F9DE5605 
X-CRM114-Status: GOOD (  12.91  )
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

Each CSR is encoded as 12bit number in RISC-V instructions. This patch
adds defines for CSR numbers to allow us access CSRs using CSR numbers.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/include/asm/encoding.h | 237 ++++++++++++++++++++++++++++++
 1 file changed, 237 insertions(+)

diff --git a/arch/riscv/include/asm/encoding.h b/arch/riscv/include/asm/encoding.h
index 8d8bf424847b..430e00a8edd0 100644
--- a/arch/riscv/include/asm/encoding.h
+++ b/arch/riscv/include/asm/encoding.h
@@ -49,6 +49,243 @@
 #define SIE_STIE _AC(0x00000020, UL) /* Timer Interrupt Enable */
 #define SIE_SEIE _AC(0x00000200, UL) /* External Interrupt Enable */
 
+#define CSR_USTATUS			0x0
+#define CSR_FFLAGS			0x1
+#define CSR_FRM				0x2
+#define CSR_FCSR			0x3
+#define CSR_CYCLE			0xc00
+#define CSR_UIE				0x4
+#define CSR_UTVEC			0x5
+#define CSR_USCRATCH			0x40
+#define CSR_UEPC			0x41
+#define CSR_UCAUSE			0x42
+#define CSR_UTVAL			0x43
+#define CSR_UIP				0x44
+#define CSR_TIME			0xc01
+#define CSR_INSTRET			0xc02
+#define CSR_HPMCOUNTER3			0xc03
+#define CSR_HPMCOUNTER4			0xc04
+#define CSR_HPMCOUNTER5			0xc05
+#define CSR_HPMCOUNTER6			0xc06
+#define CSR_HPMCOUNTER7			0xc07
+#define CSR_HPMCOUNTER8			0xc08
+#define CSR_HPMCOUNTER9			0xc09
+#define CSR_HPMCOUNTER10		0xc0a
+#define CSR_HPMCOUNTER11		0xc0b
+#define CSR_HPMCOUNTER12		0xc0c
+#define CSR_HPMCOUNTER13		0xc0d
+#define CSR_HPMCOUNTER14		0xc0e
+#define CSR_HPMCOUNTER15		0xc0f
+#define CSR_HPMCOUNTER16		0xc10
+#define CSR_HPMCOUNTER17		0xc11
+#define CSR_HPMCOUNTER18		0xc12
+#define CSR_HPMCOUNTER19		0xc13
+#define CSR_HPMCOUNTER20		0xc14
+#define CSR_HPMCOUNTER21		0xc15
+#define CSR_HPMCOUNTER22		0xc16
+#define CSR_HPMCOUNTER23		0xc17
+#define CSR_HPMCOUNTER24		0xc18
+#define CSR_HPMCOUNTER25		0xc19
+#define CSR_HPMCOUNTER26		0xc1a
+#define CSR_HPMCOUNTER27		0xc1b
+#define CSR_HPMCOUNTER28		0xc1c
+#define CSR_HPMCOUNTER29		0xc1d
+#define CSR_HPMCOUNTER30		0xc1e
+#define CSR_HPMCOUNTER31		0xc1f
+#define CSR_SSTATUS			0x100
+#define CSR_SIE				0x104
+#define CSR_STVEC			0x105
+#define CSR_SCOUNTEREN			0x106
+#define CSR_SSCRATCH			0x140
+#define CSR_SEPC			0x141
+#define CSR_SCAUSE			0x142
+#define CSR_STVAL			0x143
+#define CSR_SIP				0x144
+#define CSR_SATP			0x180
+
+#define CSR_BSSTATUS			0x200
+#define CSR_BSIE			0x204
+#define CSR_BSTVEC			0x205
+#define CSR_BSSCRATCH			0x240
+#define CSR_BSEPC			0x241
+#define CSR_BSCAUSE			0x242
+#define CSR_BSTVAL			0x243
+#define CSR_BSIP			0x244
+#define CSR_BSATP			0x280
+
+#define CSR_MSTATUS			0x300
+#define CSR_MISA			0x301
+#define CSR_MEDELEG			0x302
+#define CSR_MIDELEG			0x303
+#define CSR_MIE				0x304
+#define CSR_MTVEC			0x305
+#define CSR_MCOUNTEREN			0x306
+#define CSR_MSCRATCH			0x340
+#define CSR_MEPC			0x341
+#define CSR_MCAUSE			0x342
+#define CSR_MTVAL			0x343
+#define CSR_MIP				0x344
+#define CSR_PMPCFG0			0x3a0
+#define CSR_PMPCFG1			0x3a1
+#define CSR_PMPCFG2			0x3a2
+#define CSR_PMPCFG3			0x3a3
+#define CSR_PMPADDR0			0x3b0
+#define CSR_PMPADDR1			0x3b1
+#define CSR_PMPADDR2			0x3b2
+#define CSR_PMPADDR3			0x3b3
+#define CSR_PMPADDR4			0x3b4
+#define CSR_PMPADDR5			0x3b5
+#define CSR_PMPADDR6			0x3b6
+#define CSR_PMPADDR7			0x3b7
+#define CSR_PMPADDR8			0x3b8
+#define CSR_PMPADDR9			0x3b9
+#define CSR_PMPADDR10			0x3ba
+#define CSR_PMPADDR11			0x3bb
+#define CSR_PMPADDR12			0x3bc
+#define CSR_PMPADDR13			0x3bd
+#define CSR_PMPADDR14			0x3be
+#define CSR_PMPADDR15			0x3bf
+#define CSR_TSELECT			0x7a0
+#define CSR_TDATA1			0x7a1
+#define CSR_TDATA2			0x7a2
+#define CSR_TDATA3			0x7a3
+#define CSR_DCSR			0x7b0
+#define CSR_DPC				0x7b1
+#define CSR_DSCRATCH			0x7b2
+
+#define CSR_HSTATUS			0xa00
+#define CSR_HEDELEG			0xa02
+#define CSR_HIDELEG			0xa03
+#define CSR_HGATP			0xa80
+
+#define CSR_MCYCLE			0xb00
+#define CSR_MINSTRET			0xb02
+#define CSR_MHPMCOUNTER3		0xb03
+#define CSR_MHPMCOUNTER4		0xb04
+#define CSR_MHPMCOUNTER5		0xb05
+#define CSR_MHPMCOUNTER6		0xb06
+#define CSR_MHPMCOUNTER7		0xb07
+#define CSR_MHPMCOUNTER8		0xb08
+#define CSR_MHPMCOUNTER9		0xb09
+#define CSR_MHPMCOUNTER10		0xb0a
+#define CSR_MHPMCOUNTER11		0xb0b
+#define CSR_MHPMCOUNTER12		0xb0c
+#define CSR_MHPMCOUNTER13		0xb0d
+#define CSR_MHPMCOUNTER14		0xb0e
+#define CSR_MHPMCOUNTER15		0xb0f
+#define CSR_MHPMCOUNTER16		0xb10
+#define CSR_MHPMCOUNTER17		0xb11
+#define CSR_MHPMCOUNTER18		0xb12
+#define CSR_MHPMCOUNTER19		0xb13
+#define CSR_MHPMCOUNTER20		0xb14
+#define CSR_MHPMCOUNTER21		0xb15
+#define CSR_MHPMCOUNTER22		0xb16
+#define CSR_MHPMCOUNTER23		0xb17
+#define CSR_MHPMCOUNTER24		0xb18
+#define CSR_MHPMCOUNTER25		0xb19
+#define CSR_MHPMCOUNTER26		0xb1a
+#define CSR_MHPMCOUNTER27		0xb1b
+#define CSR_MHPMCOUNTER28		0xb1c
+#define CSR_MHPMCOUNTER29		0xb1d
+#define CSR_MHPMCOUNTER30		0xb1e
+#define CSR_MHPMCOUNTER31		0xb1f
+#define CSR_MHPMEVENT3			0x323
+#define CSR_MHPMEVENT4			0x324
+#define CSR_MHPMEVENT5			0x325
+#define CSR_MHPMEVENT6			0x326
+#define CSR_MHPMEVENT7			0x327
+#define CSR_MHPMEVENT8			0x328
+#define CSR_MHPMEVENT9			0x329
+#define CSR_MHPMEVENT10			0x32a
+#define CSR_MHPMEVENT11			0x32b
+#define CSR_MHPMEVENT12			0x32c
+#define CSR_MHPMEVENT13			0x32d
+#define CSR_MHPMEVENT14			0x32e
+#define CSR_MHPMEVENT15			0x32f
+#define CSR_MHPMEVENT16			0x330
+#define CSR_MHPMEVENT17			0x331
+#define CSR_MHPMEVENT18			0x332
+#define CSR_MHPMEVENT19			0x333
+#define CSR_MHPMEVENT20			0x334
+#define CSR_MHPMEVENT21			0x335
+#define CSR_MHPMEVENT22			0x336
+#define CSR_MHPMEVENT23			0x337
+#define CSR_MHPMEVENT24			0x338
+#define CSR_MHPMEVENT25			0x339
+#define CSR_MHPMEVENT26			0x33a
+#define CSR_MHPMEVENT27			0x33b
+#define CSR_MHPMEVENT28			0x33c
+#define CSR_MHPMEVENT29			0x33d
+#define CSR_MHPMEVENT30			0x33e
+#define CSR_MHPMEVENT31			0x33f
+#define CSR_MVENDORID			0xf11
+#define CSR_MARCHID			0xf12
+#define CSR_MIMPID			0xf13
+#define CSR_MHARTID			0xf14
+#define CSR_CYCLEH			0xc80
+#define CSR_TIMEH			0xc81
+#define CSR_INSTRETH			0xc82
+#define CSR_HPMCOUNTER3H		0xc83
+#define CSR_HPMCOUNTER4H		0xc84
+#define CSR_HPMCOUNTER5H		0xc85
+#define CSR_HPMCOUNTER6H		0xc86
+#define CSR_HPMCOUNTER7H		0xc87
+#define CSR_HPMCOUNTER8H		0xc88
+#define CSR_HPMCOUNTER9H		0xc89
+#define CSR_HPMCOUNTER10H		0xc8a
+#define CSR_HPMCOUNTER11H		0xc8b
+#define CSR_HPMCOUNTER12H		0xc8c
+#define CSR_HPMCOUNTER13H		0xc8d
+#define CSR_HPMCOUNTER14H		0xc8e
+#define CSR_HPMCOUNTER15H		0xc8f
+#define CSR_HPMCOUNTER16H		0xc90
+#define CSR_HPMCOUNTER17H		0xc91
+#define CSR_HPMCOUNTER18H		0xc92
+#define CSR_HPMCOUNTER19H		0xc93
+#define CSR_HPMCOUNTER20H		0xc94
+#define CSR_HPMCOUNTER21H		0xc95
+#define CSR_HPMCOUNTER22H		0xc96
+#define CSR_HPMCOUNTER23H		0xc97
+#define CSR_HPMCOUNTER24H		0xc98
+#define CSR_HPMCOUNTER25H		0xc99
+#define CSR_HPMCOUNTER26H		0xc9a
+#define CSR_HPMCOUNTER27H		0xc9b
+#define CSR_HPMCOUNTER28H		0xc9c
+#define CSR_HPMCOUNTER29H		0xc9d
+#define CSR_HPMCOUNTER30H		0xc9e
+#define CSR_HPMCOUNTER31H		0xc9f
+#define CSR_MCYCLEH			0xb80
+#define CSR_MINSTRETH			0xb82
+#define CSR_MHPMCOUNTER3H		0xb83
+#define CSR_MHPMCOUNTER4H		0xb84
+#define CSR_MHPMCOUNTER5H		0xb85
+#define CSR_MHPMCOUNTER6H		0xb86
+#define CSR_MHPMCOUNTER7H		0xb87
+#define CSR_MHPMCOUNTER8H		0xb88
+#define CSR_MHPMCOUNTER9H		0xb89
+#define CSR_MHPMCOUNTER10H		0xb8a
+#define CSR_MHPMCOUNTER11H		0xb8b
+#define CSR_MHPMCOUNTER12H		0xb8c
+#define CSR_MHPMCOUNTER13H		0xb8d
+#define CSR_MHPMCOUNTER14H		0xb8e
+#define CSR_MHPMCOUNTER15H		0xb8f
+#define CSR_MHPMCOUNTER16H		0xb90
+#define CSR_MHPMCOUNTER17H		0xb91
+#define CSR_MHPMCOUNTER18H		0xb92
+#define CSR_MHPMCOUNTER19H		0xb93
+#define CSR_MHPMCOUNTER20H		0xb94
+#define CSR_MHPMCOUNTER21H		0xb95
+#define CSR_MHPMCOUNTER22H		0xb96
+#define CSR_MHPMCOUNTER23H		0xb97
+#define CSR_MHPMCOUNTER24H		0xb98
+#define CSR_MHPMCOUNTER25H		0xb99
+#define CSR_MHPMCOUNTER26H		0xb9a
+#define CSR_MHPMCOUNTER27H		0xb9b
+#define CSR_MHPMCOUNTER28H		0xb9c
+#define CSR_MHPMCOUNTER29H		0xb9d
+#define CSR_MHPMCOUNTER30H		0xb9e
+#define CSR_MHPMCOUNTER31H		0xb9f
+
 #define EXC_INST_MISALIGNED     0
 #define EXC_INST_ACCESS         1
 #define EXC_BREAKPOINT          3
-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
