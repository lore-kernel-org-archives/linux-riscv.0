Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8D1C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:15:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA60217FA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 08:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jmckWY+K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JvRPEA9d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="KVIwYya8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADA60217FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jauHJnIIqWA1g5DaM7x2fxkA51FArGRK2NjJeErPBy4=; b=jmckWY+KVumJdo
	bSB00HMUkg90jYTWRka4eNhQ5RxTkjbhfMkzaWzRjzp4XhZ7osBBYe55+ci1ku18JF14lcpI0fhFk
	IOrv1QmJcw8qaXd006XzbUQrWLgRV2QCly1Dt3ilZjMCG0ZugipWc6Ya3HMQYJOl/ZJEBmUhEjiOV
	4Xt2So4+bqwWNuDCIxyLUTN6V8NLPuStJdMRSgTnnxdc6NvszofSfKEWTFHMiHLeS1b7hxiuxZdOq
	54eo+JLoUIYajSvvjrV5uVDpFEqFyFSJkqwZTKu4YZ47KIQfKhCc99gfb7nA2Xh9rgNukizGrHL+u
	dZEPwW7haRyL0TsGaI/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJZXK-0007TF-MY; Thu, 25 Apr 2019 08:15:18 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJZXH-0007SR-Sw
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 08:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556180116; x=1587716116;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=dOKap9F1DRFrL8zrxjS+cuuGuDXC52fgyE/HodkUXFw=;
 b=JvRPEA9dEXzGNsiJC+Gt7ixe4nglkKZdA3/MztOi4QR7Jl6y9jgTdcnu
 000KXVNk6JzrYy5j8XzDupHpdK69+qUCqPDbk5JZfUP9LwiLzKu0Uo3OP
 PebsvQDTxmg91DiJRDWZmIHXH8vuplyjmXlxov7qZkM82xOccIQ1HPFg5
 RPBgVmjbBCUoHZGcth8hfcxid5P/V7tvrhV1xxzivtiPIyZznJy2dJUaw
 EQEbneTsCC5dZXDcrvNEMQT/Ok7LNGDvns1yCy4DdsiELoaKifcXjctOn
 fk4McM2go1YnTv6p33GY4I1yAPv5Q9n5raZNNNUx5ftyel2i9gM5x2xu7 Q==;
X-IronPort-AV: E=Sophos;i="5.60,393,1549900800"; d="scan'208";a="107997684"
Received: from mail-bn3nam01lp2059.outbound.protection.outlook.com (HELO
 NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.59])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 16:15:13 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOKap9F1DRFrL8zrxjS+cuuGuDXC52fgyE/HodkUXFw=;
 b=KVIwYya8XG4fIm5iucX/YtM5phfAFgkDKMZCJiFcABujoP0SaLCZNztakimOJePu5E0s2yXUj+zr7xx3W1BqY3LnJyg1P0UxAMPpwpiDJ0IUzcKcdHDRokNrm6ql3nPw+yePH7SY8Z+XxmvXYR+1WlEG1oo8DH7XTybYR11SbMA=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB6095.namprd04.prod.outlook.com (20.178.245.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Thu, 25 Apr 2019 08:15:10 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 08:15:10 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v5 0/3] Allow accessing CSR using CSR number
Thread-Topic: [PATCH v5 0/3] Allow accessing CSR using CSR number
Thread-Index: AQHU+z7/ZVaw1StUQE6eVlEZlMfgEw==
Date: Thu, 25 Apr 2019 08:15:10 +0000
Message-ID: <20190425081445.929-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::33) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ac8542d-2931-469c-8554-08d6c956224a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB6095; 
x-ms-traffictypediagnostic: MN2PR04MB6095:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB6095F45EC23A1A20DBF613B18D3D0@MN2PR04MB6095.namprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(366004)(39860400002)(376002)(136003)(199004)(189003)(26005)(81156014)(54906003)(386003)(14444005)(7736002)(97736004)(2616005)(6506007)(256004)(110136005)(478600001)(68736007)(6436002)(6486002)(316002)(71200400001)(71190400001)(14454004)(25786009)(2171002)(476003)(102836004)(72206003)(8676002)(4326008)(486006)(81166006)(2906002)(50226002)(44832011)(36756003)(99286004)(186003)(3846002)(52116002)(73956011)(64756008)(1076003)(66556008)(66446008)(5660300002)(8936002)(66476007)(66946007)(6512007)(6116002)(86362001)(66066001)(53936002)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6095;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: umPCnCKMmGEXEAgPR203yckInORXnaSSNEJesmLZ0p7r0lWRUXXggJnCIQFflpT+7qifiEtMLnB0pzx9badhNNwJIUzHdM9iPtG9XeEeu53PMGbES2GS1BKKJMkgmabmkeAUcAnkgISRYMRWq6M4K7lgzBdmuw1wAmRi3k9q+PPvb1YD5oKI6J1EThM/Fbues8wULp6O5cKBDrBF+ujgIUoRSvQN90SULAw0GKDqmoiOPBvAdsQpF8oh3qqTI566PznvEAKK9E/a2nf7eTAhmANnnrZ5PT57HxWl9ojmPOeCPP2T54AoBOwp/i98Vo9bA2wxsPirAwIhYYyOLV6KHCh5txe8n4c0IF+0HnprRc7oJ7oLkluxArCl4J0ZiDMBUm98NkqGVRAlJo6UeUtHQgQIEffHyscr3Wv+h4B1NpE=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac8542d-2931-469c-8554-08d6c956224a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 08:15:10.2585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_011516_161068_1A834FDE 
X-CRM114-Status: GOOD (  14.05  )
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

The patchset can be found in riscv_csr_number_v5 branch of
https//github.com/avpatel/linux.git

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
 arch/riscv/kernel/irq.c              |   8 +-
 arch/riscv/kernel/perf_event.c       |   4 +-
 arch/riscv/kernel/smp.c              |   2 +-
 arch/riscv/kernel/traps.c            |   6 +-
 arch/riscv/mm/fault.c                |   6 +-
 10 files changed, 111 insertions(+), 89 deletions(-)

--
2.17.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
