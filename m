Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68553C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 09:23:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02DC420883
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 09:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ivqKzVby";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="NXWrUNWe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="LuUJWu8m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02DC420883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3JFO+7/KgeYLTXOMPM5sBneMawsx4zqG8ojbp40Ej88=; b=ivqKzVbypoqt+v
	eEIe5Sq+8KqcdOZH7Bid0RHhl+6dI95T2H1Aq3RFz47YvzwMIOBsErsyJp7lWZT7Hr1JjI+Dq/D1Y
	S5o+JdMo8+hDhIT2eAAD21YyAgDEjTwzNRpiHUZSW7Jxj0JItwkToPmO+8/mFCddj5PaHRlSbrZlE
	SgRtc+ycmeetgAC5SHP5fLIgvCDU9oo8kE5UzpC+IFXxvlLRCItwAiRsbGvMTwzSIfPo6D+VV9eZl
	iFDfobUK3BKhvRAPfIKGYJXGuzYS5vjl8FNYliiLKjZqi0Yb2gn6glvxg6s6dxciuBaFFX3oVMbfP
	QR27lK+KzrO8NkJ5FLyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Lox-0002YS-L1; Mon, 25 Mar 2019 09:23:07 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Lov-0002XO-33
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 09:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553505813; x=1585041813;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=25G8NyB2hkeOAgo8JCHMsFF51A+IPGMnPY+5sbvrbIM=;
 b=NXWrUNWefpLSTcTj4Sy+DDQ8YIQwH8HPZ9diTalht0KupDkekYmRzqct
 +gLv++KV71DEsch7Pf/qUiw1ycuWNAYICAqZpSOrYOVeafiwtSGaLc3Kz
 zOCk7Wao47CWO2amQqArOWzKVUgCjJJ/o1x7cVDBlxGuV10G81DjZZSgj
 5pJ9pQRKWuLZwbRTxZJ7/u7edfl932bjym3nmI2hqBIztiAKZfM8hNCpi
 gXhOfoyI5RMh1I4x/XNqCF52i4MjiOCohdoAI7ufPF1UGIYQ6hLXZkeHQ
 4IneoWmtOzNQx6qu2C7v6SWP6Z/kubjVi5eeV/sfTAqtyaVfu0FHLX6Wz w==;
X-IronPort-AV: E=Sophos;i="5.60,256,1549900800"; d="scan'208";a="202885084"
Received: from mail-dm3nam05lp2058.outbound.protection.outlook.com (HELO
 NAM05-DM3-obe.outbound.protection.outlook.com) ([104.47.49.58])
 by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2019 17:23:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQEa/S8KwUr9UAe7rdvDescD+WXEJUNmZvbpTshwfFA=;
 b=LuUJWu8mtVeR5K2x0mfvsuWjPwL7QEBx2Ys8SqdKm7A4kjBCSbXu+eJb0khRVX0gL1sle3GfwWuOQEvVigN7O1Epj6KB/ppDKZsNRVCMyrA3XhT7QIqL4SCQgc2luKHhotYEl2TGq9sMpN0dxxAPdGzFuJNbn76MAhEj3P0iETU=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB6141.namprd04.prod.outlook.com (20.178.246.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Mon, 25 Mar 2019 09:22:59 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::d197:7b59:7e0d:e819%4]) with mapi id 15.20.1730.019; Mon, 25 Mar 2019
 09:22:59 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 0/4] Boot RISC-V kernel from any 4KB aligned address
Thread-Topic: [PATCH v3 0/4] Boot RISC-V kernel from any 4KB aligned address
Thread-Index: AQHU4uxWCkzKRHLO00ifgywaXRKzMQ==
Date: Mon, 25 Mar 2019 09:22:59 +0000
Message-ID: <20190325092234.5451-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::23) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28dca770-55dc-499a-5891-08d6b10378ab
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR04MB6141; 
x-ms-traffictypediagnostic: MN2PR04MB6141:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB614110EC25821FC9BBE76D618D5E0@MN2PR04MB6141.namprd04.prod.outlook.com>
x-forefront-prvs: 0987ACA2E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(346002)(39860400002)(396003)(366004)(199004)(189003)(68736007)(54906003)(66066001)(53936002)(110136005)(71200400001)(316002)(256004)(1076003)(50226002)(25786009)(8936002)(86362001)(72206003)(476003)(8676002)(3846002)(105586002)(5660300002)(4326008)(6512007)(305945005)(486006)(2906002)(478600001)(7736002)(106356001)(102836004)(81156014)(6116002)(99286004)(81166006)(386003)(44832011)(6486002)(2171002)(2616005)(6506007)(26005)(52116002)(6436002)(14454004)(97736004)(36756003)(71190400001)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB6141;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wzu4QgTPn6lqqRR6GN/hup32NRaDNGEWDiU0JSgutxdd9poU0OhKjci7L75RXDV2CVQ4rqLAtv3sDx0A0WCvLy1OY4j8J2ZB4KQAqbggp0eP1QD/+8ktxdPLgd4NHPt3j4NmjTEljcKrZ5LMP9Mg/5uIYhrZo7DTc3AFfFaA05TJqGaP94KihcIni3ju8U4IxPbNK77RLokWW1rOCAuKnoDMNyBxkv4QhMzTj03mAuHRjw00G50IzTOXY6XoO7d0BuRmy6bmnfSroi6+yAY/II+Yma6lY1k+modM5rQVtcfPi3w8RfWHLnHTl9GQcyVyH8rKfUDX9a2vbFFbgqfISQdR4bmHUBA+6cXDcjP4G2vIw4S7aSKPsrZNQ/D0jBeHvAhzagwkh5CCwz/fZQy3rTRt2UbXvFg+IWlHvzMiqdE=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28dca770-55dc-499a-5891-08d6b10378ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2019 09:22:59.3101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_022305_169309_59D56010 
X-CRM114-Status: GOOD (  14.25  )
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
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset primarily extends initial page table setup using fixmap
to boot Linux RISC-V kernel (64bit and 32bit) from any 4KB aligned address.

We also add 32bit defconfig to allow people to try 32bit Linux RISC-V
kernel as well.

The patchset is based on Linux-5.1-rc2 and tested on SiFive Unleashed
board and QEMU virt machine.

It can also be found in riscv_setup_vm_v3 branch of
https//github.com/avpatel/linux.git

Changes since v2:
- Dropped PATCH2 because we have separate fix for Linux-5.1-rcX
- Moved PATCH5 to PATCH2
- Moved PATCH4 to PATCH3
- The "Booting kernel from any 4KB aligned address" is now PATCH4

Changes since v1:
- Add kconfig option BOOT_PAGE_ALIGNED to enable 4KB aligned booting
- Improved initial page table setup code to select best/biggest
  possible mapping size based on load address alignment
- Added PATCH4 to remove redundant trampoline page table
- Added PATCH5 to fix memory reservation in setup_bootmem()

Anup Patel (4):
  RISC-V: Add separate defconfig for 32bit systems
  RISC-V: Fix memory reservation in setup_bootmem()
  RISC-V: Remove redundant trampoline page table
  RISC-V: Allow booting kernel from any 4KB aligned address

 arch/riscv/Kconfig                  |  12 +
 arch/riscv/configs/rv32_defconfig   |  84 +++++++
 arch/riscv/include/asm/fixmap.h     |   5 +
 arch/riscv/include/asm/pgtable-64.h |   5 +
 arch/riscv/include/asm/pgtable.h    |   5 +
 arch/riscv/kernel/head.S            |  14 +-
 arch/riscv/kernel/setup.c           |   4 +-
 arch/riscv/mm/init.c                | 376 +++++++++++++++++++++++-----
 8 files changed, 430 insertions(+), 75 deletions(-)
 create mode 100644 arch/riscv/configs/rv32_defconfig

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
