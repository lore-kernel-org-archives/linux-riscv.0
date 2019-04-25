Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3806C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:38:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91CDF208E4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:38:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uRs9zBLl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="LoStr+Y9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="VuwucUpt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91CDF208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bXwNsPGPxsvuoUIdQArbIim+cOii82iii7p1KMuYtrc=; b=uRs9zBLlyqOrhj
	y6aYk3nlxfNTza7FLtmg92Fpn2+VArpef+k0cyteFkS/7aJMpJdxocR4Gd5c56gKnmJWcjGQyMKMF
	D4oL++2PtMC7ujYnCntwM/NJYf0Grz/TioBaQN/w4CIy4tFyCLeBgwOece4TI4ZhSmp5pcONUzGjZ
	fhIfb/r1XYnjN7EZFJZP0IuRq/gyWXB9hvC+AxcQQv/Mzc0rEoEUZ8I8YrZpQ2dd0YMZP1VQpfUKW
	Mg3IKw6L2tkdyNaEIHJpZF6WSVwaGNHG7Ws9ncU4bI+KPGtYYENK6fjOcYnUX0l7gb13rh/JGCAyA
	4w5UVTZeClZ1H3HEXutA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJZto-0006Kh-5t; Thu, 25 Apr 2019 08:38:32 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJZtl-0006Jn-4V
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 08:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556181509; x=1587717509;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=BU3jWJhcqMptiOKubIpzVh0ucOgBAC1uG527PRawgLE=;
 b=LoStr+Y9diylGVHzKm/o/HpPkDbWgskBU9n/CgOZzX0d38fw2HfXbo2p
 0+CHaHlKkLp/MdK7dxKPDgUH74V0TmqRC4FGWxn2cETeEGHZz8c0XaefV
 pvf/yJSma6a6oPdk4hpQFUEn1eY4g8aAHo/wPB9nQZWxF9W860ASdOVtM
 CzyHBOXOzTbPfPmyeux6R4crezARis7GISCdYLW3K1pbeyRsOQQJi23Re
 SrgJ4NdtFYj/QvQwfZLAute8it1gR5hXdgBWtKUxk0RcJ4p9xGxep7QZk
 a01Jqtc/26ZIBIq81jijc1u/bRSNcJiEl7yAM8110kv2jhL0aeSPOSSb7 w==;
X-IronPort-AV: E=Sophos;i="5.60,393,1549900800"; d="scan'208";a="108506783"
Received: from mail-dm3nam03lp2057.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.57])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 16:38:28 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BU3jWJhcqMptiOKubIpzVh0ucOgBAC1uG527PRawgLE=;
 b=VuwucUptEow2Zk+rd/emUzhBgTOuVOBIGzy5hNckmsUDqOV6b2YIKuiH1D2U0nER49v9fC1OqRxrrgnWKZWyRBa1JIVgD/EJyJOmG+bASzXjLYSx+yyiJv0cvInqg7O9hVqRhtdBWRzATKMLqF1ymstxiaBCvCYUl0Pe37FIYLA=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5485.namprd04.prod.outlook.com (20.178.248.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Thu, 25 Apr 2019 08:38:25 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 08:38:25 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v6 0/3] Allow accessing CSR using CSR number
Thread-Topic: [PATCH v6 0/3] Allow accessing CSR using CSR number
Thread-Index: AQHU+0I/yOG3HNRdnEGYGUxzrL33Bg==
Date: Thu, 25 Apr 2019 08:38:24 +0000
Message-ID: <20190425083804.11991-1-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 6033ff1b-9dcc-4f0b-b25f-08d6c959618c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5485; 
x-ms-traffictypediagnostic: MN2PR04MB5485:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB54859E3AE4DD0FC0C83E41E88D3D0@MN2PR04MB5485.namprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(376002)(366004)(39860400002)(136003)(189003)(199004)(99286004)(36756003)(66066001)(8676002)(81166006)(6486002)(71190400001)(6512007)(8936002)(478600001)(7736002)(50226002)(81156014)(71200400001)(6436002)(97736004)(305945005)(72206003)(86362001)(14454004)(6506007)(14444005)(186003)(6116002)(486006)(44832011)(25786009)(66446008)(52116002)(2906002)(102836004)(4326008)(73956011)(66946007)(26005)(110136005)(2616005)(1076003)(53936002)(386003)(476003)(64756008)(3846002)(54906003)(68736007)(256004)(66476007)(66556008)(2171002)(5660300002)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5485;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FX9+LPL9BPMetvRhp9zVvTo/R7W9MUjYTg05roPNeAYwdv/EFEhUS4M5LHgXVThoezbjaZEXAUuDgeUZzKkEihYV+/iT11TTGMf1F9gEPcymKFksPJBvV0+vdaoN2yhjiCSgWzBlwFznSQWh7r+x4ysjdNtK/dTGyqHLwqVj7ayyKpVfr9DBtH0PkUE8x2sgW/1ioBgXvnEbTzaoAfgo5M9I0KKzaMBD6aUgwVGCTj0skB1xMO1R4115GL5aNJ2IWxI2I3YQF9TsaIT8aq3Dqf+BSxPzkg9QZJbasxlYWJRWQYwusN6j1l4T1bLjLvlr6BBsjMhNrIF0JEVSz83FQxgnBqAxXCMuNhSLBzyNxbfhQSyxPuN9wEVpdcWCanrjX/DpmEhbLZulAjN/5Qz9v5Q/q/qEmRDU/QNnHckN4/g=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6033ff1b-9dcc-4f0b-b25f-08d6c959618c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 08:38:24.8789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_013829_242879_8DD01A8A 
X-CRM114-Status: GOOD (  15.23  )
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

The patchset can be found in riscv_csr_number_v6 branch of
https//github.com/avpatel/linux.git

Changes since v5:
 - Drop redundant INTERRUPT_CAUSE_FLAG from kernel/irq.c

Changes since v4:
 - Express SCAUSE_IRQ_FLAG in-terms of __riscv_xlen

Changes since v3:
 - Keep old INTERRUPT_xyz defines in kernel/irq.c for PATCH2

Changes since v2:
 - Dropped PATCH1 which added asm/encoding.h
 - Added new PATCH1 which beautifies asm/csr.h by using tabs to
   align macro values

Changes since v1:
 - Squash PATCH2 into cpatch3
 - Added new PATCH2 to add interrupt related SCAUSE defines
   in asm/encoding.h

Anup Patel (3):
  RISC-V: Use tabs to align macro values in asm/csr.h
  RISC-V: Add interrupt related SCAUSE defines in asm/csr.h
  RISC-V: Access CSRs using CSR numbers

 arch/riscv/include/asm/csr.h         | 123 +++++++++++++++++----------
 arch/riscv/include/asm/irqflags.h    |  10 +--
 arch/riscv/include/asm/mmu_context.h |   7 +-
 arch/riscv/kernel/entry.S            |  22 ++---
 arch/riscv/kernel/head.S             |  12 +--
 arch/riscv/kernel/irq.c              |  16 +---
 arch/riscv/kernel/perf_event.c       |   4 +-
 arch/riscv/kernel/smp.c              |   2 +-
 arch/riscv/kernel/traps.c            |   6 +-
 arch/riscv/mm/fault.c                |   6 +-
 10 files changed, 111 insertions(+), 97 deletions(-)

--
2.17.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
