Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8733FC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 07:39:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E962084D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 07:39:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pkC/F7tt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="FvpIlR89";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="Ut37/hdg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50E962084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oHZHP2KeapeuHr7u3NATLEqHljeLeHHa60V56GdlSUM=; b=pkC/F7ttAI8gEV
	r2Alj/NlwspRp5G9M/aLfklaQMaOphty6d4qfEEw0G4sq/E933IVixhw3GRDctEUDyCd+EDDwFhWa
	iW4RySZN662YWaK4V3YSeEKsilhbh3gOPQsE2Fopvxu1zHnLKx7ZJXzILUxxcc5sqJMGx6zZONeG0
	E4LordHEccHhKaEY1yJZ+uvGNJ0fI/PFYAg/+GlbVClcLEWhx2bRnM2jZfaQusT1RwcuVNzyTDQ6A
	sP38M7rQFU/dN5a6oety3s4NIBM6NOvKtxNYpsqxncdNZWv4PPRJ4/PrfwqkfUz2GCXjlCjE1NA1k
	uYUL2/2L5JERKbubDL4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFDGI-0003fi-3Y; Sat, 13 Apr 2019 07:39:42 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFDGE-0003ek-Ky
 for linux-riscv@lists.infradead.org; Sat, 13 Apr 2019 07:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555141179; x=1586677179;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Vb0bSuVHfdsU4/lcEU6NRIjJZ60lVCyksQuRkLovrWk=;
 b=FvpIlR89W9jidah9eHgrCWQktECjqdgbOuHzQmsjQSIN5l4AXMlT6fjR
 ecxzNWfDIWKRxDi+Al7RRITBhZbH7CgRinluEW5eXluWGLgWh7ks/9wv0
 XXgDH4aAeE68PEvlpYRiWPKLZza2wC23RWVHcfznlQB0WWRxMuFVopqlh
 3LYi7uNuojKGbL4Ehv2IXV0VTsWQfNoSg+EzDo+shm0BeG5lKJqXtMMsB
 neU0YG2ak8awga4n/2N6EmdAHDsZiIRe+FtJLz7HxNemV+Q9VBbirllYz
 4jBjN4q2zppmCtGmW0n669zZgs8gN3J4nizGhhVdN+oNx3Ewg5id6EjGX A==;
X-IronPort-AV: E=Sophos;i="5.60,344,1549900800"; d="scan'208";a="107542548"
Received: from mail-co1nam03lp2057.outbound.protection.outlook.com (HELO
 NAM03-CO1-obe.outbound.protection.outlook.com) ([104.47.40.57])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2019 15:39:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vb0bSuVHfdsU4/lcEU6NRIjJZ60lVCyksQuRkLovrWk=;
 b=Ut37/hdgK+FdlzwcmlPrfGBMbWPui7IUrLHkyrVFX2PVwuUCUHYIHO5rEJMVS7UBW5ARXx888A6y//LeoKc3zTZR3BVoUOod2orz9fHSDJZI5zfzKJbCEpjuONasbITRm9cNTp7NwkB98eO9fslJ16Vbn9doxqHBiJr1Cfa3VIs=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5613.namprd04.prod.outlook.com (20.178.255.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Sat, 13 Apr 2019 07:39:31 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1792.018; Sat, 13 Apr 2019
 07:39:31 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 0/3] Allow accessing CSR using CSR number
Thread-Topic: [PATCH 0/3] Allow accessing CSR using CSR number
Thread-Index: AQHU8cwH7Edud1N9oEOsF2m/mlao1A==
Date: Sat, 13 Apr 2019 07:39:30 +0000
Message-ID: <20190413073906.53676-1-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: ebcbd522-0287-4475-9502-08d6bfe32a12
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5613; 
x-ms-traffictypediagnostic: MN2PR04MB5613:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB5613E3094CD4C7F3449D8DDD8D290@MN2PR04MB5613.namprd04.prod.outlook.com>
x-forefront-prvs: 00064751B6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(396003)(366004)(39860400002)(189003)(199004)(9456002)(44832011)(256004)(14444005)(78486014)(54906003)(14454004)(316002)(7736002)(1076003)(71200400001)(102836004)(25786009)(186003)(6116002)(50226002)(4326008)(71190400001)(5660300002)(110136005)(386003)(3846002)(8936002)(6506007)(2906002)(55236004)(478600001)(26005)(305945005)(2616005)(476003)(105586002)(72206003)(106356001)(486006)(52116002)(66066001)(6486002)(97736004)(53936002)(36756003)(81156014)(81166006)(99286004)(68736007)(6436002)(86362001)(6512007)(2171002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5613;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cHTI8gjhCjMlgGTWAKwaz85M/x3gEs7sKjnnCBM8giLMdLAXu+hIfQ7LwVk3jQ5kEYgGp566HKwhfcD32GaJzTODvy20OHBiYCsF1qBieeJeheMO5hyXVr4QJVXnK/r19jaWVjpi4N4u3ncTpuvYqazsBDj2ihYqt7o4qIstSfToJ4ZcU4JZUKLLG+6GshnHnLvHJzxrmm6oG1cVYf0VyuQ0i7/MtGxtN4PuEg4GxgKvYXoXrHjihOtozkL1DrQxggTqC+FtQ1WFfNO1EsDQ76IVmfwm+kXRshi8xkUQRJqrAmhhPotnKFEQwzqTKnJZpkA2COvHlzeCRwZ65JJJgkZ/0Mcj+PoH6zCrajte8b6UG3FJbPGKF7BnMTloWhreUvi1ac3U5vxiMrmAO+SNf9r8pinKmcf80M//jQrrA4U=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcbd522-0287-4475-9502-08d6bfe32a12
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2019 07:39:31.0260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_003938_798569_1FD52BA3 
X-CRM114-Status: GOOD (  14.96  )
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

The patchset can be found in riscv_csr_number_v1 branch of
https//github.com/avpatel/linux.git

Anup Patel (3):
  RISC-V: Add separate asm/encoding.h for spec related defines
  RISC-V: Add defines for CSR numbers
  RISC-V: Access CSRs using CSR numbers

 arch/riscv/include/asm/csr.h         |  67 +-----
 arch/riscv/include/asm/encoding.h    | 299 +++++++++++++++++++++++++++
 arch/riscv/include/asm/irqflags.h    |  10 +-
 arch/riscv/include/asm/mmu_context.h |   2 +-
 arch/riscv/kernel/entry.S            |  22 +-
 arch/riscv/kernel/head.S             |  12 +-
 arch/riscv/kernel/perf_event.c       |   4 +-
 arch/riscv/kernel/smp.c              |   2 +-
 arch/riscv/kernel/traps.c            |   6 +-
 arch/riscv/mm/fault.c                |   2 +-
 10 files changed, 338 insertions(+), 88 deletions(-)
 create mode 100644 arch/riscv/include/asm/encoding.h

--
2.17.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
