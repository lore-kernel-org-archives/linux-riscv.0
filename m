Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8062C282E1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:50:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E2E214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YfXSQPoT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ALTDfsEg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="R4TWqIA1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73E2E214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8IbJV7tmC1xR1RoCoMfrr0rfthdiIVzObPF+BAa/28s=; b=YfXSQPoTG3DoYf
	NxOZngZD+/W9oL/gFIvnxo6Wsoi7EogHD34LovD6IHWdEVak0pRym5gGY+YsgsmunwzR4YrATIPgV
	rYcuvlVI2EA5Wu4BiUW7FBUPQfdE+04fwy2D/Qd4OyGAMl0lRK2BCbcQTt5O4xMfgIieXJOylUL10
	kQnwqfTa44q1SYzMt8zyCiV+LFW5WEtGAYiPRMi7tLbZoLxvFknbOrqNgu+EsM2bzUaOz+7nnCNau
	wL8mulY7uJlhltqQgavA8tOWV3fMZFoaqo/6SdZV+yPvYGIZcnLo3XYPX/glGB73F+WHp386f7l0k
	d87YQRiIoY3D/Ij1CHRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJXHT-0005tq-FW; Thu, 25 Apr 2019 05:50:47 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJXHQ-0005tQ-6h
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 05:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556171444; x=1587707444;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=rpildqgy8o5UmVecA6pVi+IR582CkbrPqwkLNiXaLMk=;
 b=ALTDfsEgBRWHTudFZSpgSz/8m7LxdcZ+rFrFC5zikWO0vsFGdVfxutCI
 IDzSh/YETD2zWe8WXl+0qaHJIIk40T78CtkppKj7lVFcMLbag/OeABrPW
 fQj9NeB3IIL+GmgoP7GzXQ0/T9yZGAuL2zhbcqazSzirnwLk3VotmbT8s
 qJ8e/N/nSJ+/ogLuNz3gFyfMDGYQJ6FSIYOy45c4hFsD9BlW6kyXxiDjM
 96VvV4bmzItmD1aESad+eNrBErcsy7jP78gY1bk0mCfx4vAGO6gjmSej3
 3nhiP310tQpsdGW+WLjNLU7hPLAi1kejazj1lSsglqCWqJhg7c7qZQvcF g==;
X-IronPort-AV: E=Sophos;i="5.60,392,1549900800"; d="scan'208";a="111723154"
Received: from mail-dm3nam03lp2056.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.56])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 13:50:42 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpildqgy8o5UmVecA6pVi+IR582CkbrPqwkLNiXaLMk=;
 b=R4TWqIA1Mxj4SXl++c8puwQF5tGkFll8GcEylCCdTfqgqcmwXd4G5GQDyddNR4fF0iKmJWnzXQ1ZghtJKOj/5CY6mSvvZmNhsZOeONQYI21QshwQiuA6I3XkcaCJFPrDkM/Uq39VFr3DTUR8QMRaAeG3HucI3lNC8phObKDDmAU=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5552.namprd04.prod.outlook.com (20.178.247.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Thu, 25 Apr 2019 05:50:40 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 05:50:40 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v4 0/3] Allow accessing CSR using CSR number
Thread-Topic: [PATCH v4 0/3] Allow accessing CSR using CSR number
Thread-Index: AQHU+yrQT0ofH6i420urVRWglJkVYw==
Date: Thu, 25 Apr 2019 05:50:40 +0000
Message-ID: <20190425055015.45487-1-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 2dfedd7d-fdad-4e61-a25c-08d6c941f2b2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5552; 
x-ms-traffictypediagnostic: MN2PR04MB5552:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB5552A8B1DECD942A04CC1ACE8D3D0@MN2PR04MB5552.namprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(376002)(346002)(136003)(396003)(199004)(189003)(6486002)(1076003)(2616005)(476003)(14444005)(486006)(50226002)(256004)(66066001)(7736002)(305945005)(73956011)(2906002)(72206003)(14454004)(478600001)(6436002)(3846002)(6116002)(66476007)(316002)(64756008)(66446008)(66556008)(66946007)(54906003)(110136005)(6512007)(8676002)(6506007)(386003)(71200400001)(71190400001)(186003)(86362001)(4326008)(102836004)(68736007)(2171002)(5660300002)(81166006)(26005)(81156014)(53936002)(8936002)(97736004)(52116002)(25786009)(99286004)(44832011)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5552;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tfB/ucMA5oqtudkwCITOiNbCvr3NP+opL3G3JWhsT/+GmDHS4PvDsdw5oAMawF1a1wQfHq2y88qE9BWUM9LQKqkE36bri0gigbLWLuFHTox4wYcJxO5VfPK8Ug7Xw/0rXju4W0FSFwKY6vqxB0lNvZt9xvGac2WqIeB/uPUC59Xo9ntZmOxJHTJFHhtpChmRLl56M0NZVySkpLBl1mWyPp8I/MGR2NcTBrHzMwlraky1tyx9ki41gQ9pDgPn6M1O8EAfGSZIcpbTYOMc3ZNCWiFcoZn4PiPPvJ6ljexDBRkFzyhvzwB/RgVmp/7b+fvEtwMmv4mOQr1V+/Q7kBft1YDsrr8XWxpZZjPbQqBnOejB/0pDsVjKuj/7mM4kuoXPtCXuEsZluRG9o8Aob3RKyArZfHjXQmNy6BDfjlFw+38=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dfedd7d-fdad-4e61-a25c-08d6c941f2b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 05:50:40.5497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_225044_456980_0229D02B 
X-CRM114-Status: GOOD (  14.20  )
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

The patchset can be found in riscv_csr_number_v4 branch of
https//github.com/avpatel/linux.git

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

 arch/riscv/include/asm/csr.h         | 127 +++++++++++++++++----------
 arch/riscv/include/asm/irqflags.h    |  10 +--
 arch/riscv/include/asm/mmu_context.h |   7 +-
 arch/riscv/kernel/entry.S            |  22 ++---
 arch/riscv/kernel/head.S             |  12 +--
 arch/riscv/kernel/irq.c              |   8 +-
 arch/riscv/kernel/perf_event.c       |   4 +-
 arch/riscv/kernel/smp.c              |   2 +-
 arch/riscv/kernel/traps.c            |   6 +-
 arch/riscv/mm/fault.c                |   6 +-
 10 files changed, 115 insertions(+), 89 deletions(-)

--
2.17.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
