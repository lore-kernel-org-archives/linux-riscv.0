Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62F9C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:37:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B688120675
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:37:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ObtroXQu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="g2BUn5nb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="OMiEtW+X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B688120675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zYzxN9xl9wFVOR0ZUV2CTZV4N+ORMxm56AhdWLgDjl4=; b=ObtroXQuEc7VbS
	dtF3E5XnXB2eRLBzbsApHWaUlcA4nHFcrepBfFfdWXbnl3+wYl5onJ+BTCgFT2ZyztWybPMv5CXAC
	DJU50LdhK9IQ6Gx5iq080tQc9x7cCycmWX7rXh48RH/oA3/5Z0qVPs+CXtTNSB7c1GDLldIeBR/1k
	AM6x4FkoVRP7xrZgUVC54lCJ7ipLNPHeBRMedc/yKwpZfXUFGdPyC9eccHNfZcO91L/QJk/TU1Rxo
	ob8XQyJ3cAU9XebvgNm0NH6uGObKi7FRxfVY78fYMpgnB94/pAmNdMnCUIsuj830o9bP71Ayh5o35
	xbiu2as0flahKhiu+Lgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFy3D-0006lP-Cz; Mon, 15 Apr 2019 09:37:19 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFy39-0006kh-VU
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 09:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555321036; x=1586857036;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=uVc0rYrF6bkwZJkr0j51meyFXSxPSJ7x7pN5wFNzDPE=;
 b=g2BUn5nbxQ4Paa+0lFV/s5LIUGBhnbW0UQGOVvsq08u7KwtCVmI3fSX+
 dQxc9jccWZzcZVQ0CAxVq+NzKNkHgPo1TFHwgH5yRZBrcHuSXXeN5Bnc+
 zIOdgtdklnonj/hnSr5r1108al1xQRKFEnUEVND6W0j9iEL0H6oHd72z6
 k32S4NdV96dSNo1Fqjn11hcUqQlsruUmPP5Z1HB5+nUAnXWFGLLR9sV/G
 UPawwNNkMGvV/r8O+BMdI+pDLLtJ3PbsnCyAsv7id9UGrDcSdBj774jA/
 SUarSwQFwohg27TvKMe+qohWMJ/RM2qXkLHSbKZNhAcVCF/tM4sduaOyz g==;
X-IronPort-AV: E=Sophos;i="5.60,353,1549900800"; d="scan'208";a="107725747"
Received: from mail-bl2nam02lp2059.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.59])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2019 17:37:14 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVc0rYrF6bkwZJkr0j51meyFXSxPSJ7x7pN5wFNzDPE=;
 b=OMiEtW+XtgA74+26qyDhwbeKDthKfS+ar8BT0HvkOTJg18FDWGd6b/oTt2DqeqByCVg9ul6CBw5hjanncqTX5+YZm1asgMeSSqV0h+4i4OIkXIwVDGH/Q8mgpFUzVmUO6Ddzf29GGoAuOmxWdehfGFHaiJhEzf1Rsi2U7Cz0CGU=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5677.namprd04.prod.outlook.com (20.179.20.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Mon, 15 Apr 2019 09:37:12 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 09:37:12 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 0/3] Allow accessing CSR using CSR number
Thread-Topic: [PATCH v3 0/3] Allow accessing CSR using CSR number
Thread-Index: AQHU827N/wQBBtLuc024oFhZoiTi3Q==
Date: Mon, 15 Apr 2019 09:37:12 +0000
Message-ID: <20190415093648.7525-1-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 4c7a71c6-0587-4e54-8a7d-08d6c185efd9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR04MB5677; 
x-ms-traffictypediagnostic: MN2PR04MB5677:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB567722ECF82BD29AE9B8FCED8D2B0@MN2PR04MB5677.namprd04.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(136003)(346002)(376002)(39860400002)(199004)(189003)(4326008)(71200400001)(53936002)(71190400001)(26005)(476003)(86362001)(50226002)(186003)(5660300002)(54906003)(3846002)(6116002)(102836004)(97736004)(6512007)(2616005)(6486002)(316002)(105586002)(110136005)(36756003)(486006)(6436002)(2171002)(6506007)(386003)(478600001)(44832011)(8936002)(8676002)(68736007)(72206003)(81166006)(2906002)(7736002)(14444005)(256004)(99286004)(14454004)(25786009)(1076003)(52116002)(66066001)(305945005)(81156014)(106356001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5677;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7tlLPd2jDmQdBLW/ULXvdWWe+Ag3/3LNHJ0Ick07wFsTFld7ZnRwITx/Eq6AUpegK1YQlyqu6BcJOmlnNfTSvUWEBUbDyYGmf2vS3HTVI9VWSXiA1V7oOvWIrYj4MjU3GkwnxsRw369Z01NhrnROURXLyCaHRAiq4bBhc+kXzFs3duCz/bfYsAQBrpDpm5bMbp7DZNLBbbuhvQpCwVC2nhKGW9vduSPkQX6AdkD/4CUqAxuMcTz8DgPGijdf/9diWg1LIZbdBUfdat+2v8G6rMm2MGM7hExF2b7vK23gGU4vBYquX2KT1s3JiO6fYKPv41uW4HBn7X0zJ8KS6JGNxHDG7CmRkSE3XCx9OAZNHokOEkX4zfxcDXNo2dpeTzhWrlGK2aUeiFNTFvQ7dvCwhz5/wZAagQdEwCR0hzcHevs=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7a71c6-0587-4e54-8a7d-08d6c185efd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 09:37:12.3620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5677
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_023716_106389_6D920058 
X-CRM114-Status: GOOD (  14.55  )
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

The patchset can be found in riscv_csr_number_v3 branch of
https//github.com/avpatel/linux.git

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
 arch/riscv/kernel/irq.c              |  23 +----
 arch/riscv/kernel/perf_event.c       |   4 +-
 arch/riscv/kernel/smp.c              |   2 +-
 arch/riscv/kernel/traps.c            |   6 +-
 arch/riscv/mm/fault.c                |   6 +-
 10 files changed, 115 insertions(+), 104 deletions(-)

--
2.17.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
