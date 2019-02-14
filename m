Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAD_ENC_HEADER,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CA2C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:26:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5F3C2229F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:26:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mSJ17dgm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="gEVQxnfu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="NEUjeUMX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5F3C2229F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k3m3lnjlUc7EfXviEuE3lx8Dl8Do6m9vU9EOQVdy/do=; b=mSJ17dgmnwhu6r
	53+bFkmx9JKlIwZ/OWYDEzHMgdBSpcR+av3XMxRptmZFGQSCBI5qIW+tNsRYdK9BNV17plDYZLzei
	dLbu12s50C7fN0RpYgLrMvcs9P+QyQ8IIOaXT8s5tKShb+qgIkop//8T/NFnZLfe1gnPEuyAa/rVa
	pMpE9m+lslz5nYfctxKfKi1ePavTT0ly4JmzC1DYFKbjY91TTCXAxEoCel2xEdDxcIeKa0gEVFsfS
	W2SuZQmBBjg5fTKbJ72/URc9oAHptOh7st74XNfnkJ9B4hfsFedrDIPN/vGJw81fpfReEwqIPQMzz
	jvjKqWShy27dQJ0sJOkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guCLw-0007lJ-Su; Thu, 14 Feb 2019 08:26:40 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guCLt-0007jQ-B3
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 08:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550132797; x=1581668797;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=188S6yl2fqh64s+W7a0EGdZmcYxElWuqBPzqA3BEhQc=;
 b=gEVQxnfux6LRRuRtvS7kYZ3o8NRDwAQ1GqRJ69po2P1jt/kTJlOrAGFD
 h4m4JV/bhUtEq6HpxOYfjjGIr32CLwhjIo9SSXIUjKw46urnQ+uXv+Roe
 54H7dfufplhtxYFqADnwjhr8dn8JPtEYnxfY7a9Hl8z1AY4wj+iyP0ayR
 JkQ4XrksNzpLuC5dxDPyDETMacsqVZkM+IDwz2WzzeMy3emfAgu4dGZh8
 xJRWGXMYBiU9/QBvXH9bnmLv739oEzmOPuypCyXC77Z9lFAUhwo84Q8Ov
 0xhk6ZsewuhB1f0pQ/leRHzkUvb3j7Pq+CqiX5QQdzVG+qnlR7J3wXoY6 Q==;
X-IronPort-AV: E=Sophos;i="5.58,367,1544457600"; d="scan'208";a="106239140"
Received: from mail-sn1nam02lp2055.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.55])
 by ob1.hgst.iphmx.com with ESMTP; 14 Feb 2019 16:26:34 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9JbvdO5i8mxGq5hlWfoRUyCx0xhkZh6H3PzCq/g9hs=;
 b=NEUjeUMX7mdXTZZpRiywZ7QQ1KMqjv99xQj5hKOLFLCJb97n99p5TsE9Hd++y9ygNo0GigQJ5f8GxtYqIpCUi8n6t3vY988BNOI0HIhOhJNxc1dWJEA1QdVqkLqnhBUqlaOrjzbruQXTAOIsBxojIufGaTRcKgLIY+EZUVakYVM=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB4219.namprd04.prod.outlook.com (20.176.76.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Thu, 14 Feb 2019 08:26:33 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c%2]) with mapi id 15.20.1601.023; Thu, 14 Feb 2019
 08:26:33 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [GIT PULL] Fixmap support and MM cleanups
Thread-Topic: [GIT PULL] Fixmap support and MM cleanups
Thread-Index: AQHUxD7+GpKlJyMT6ESt0bwyaokOQA==
Date: Thu, 14 Feb 2019 08:26:33 +0000
Message-ID: <20190214082606.23268-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0082.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::22)
 To DM6PR04MB6059.namprd04.prod.outlook.com
 (2603:10b6:5:129::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0db4b46f-2ce6-4a03-f0c2-08d692562051
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB4219; 
x-ms-traffictypediagnostic: DM6PR04MB4219:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR04MB4219;
 23:+Esh6urdQ4ZXJOIK/f5tY48iMzSLdRrg4jPgeLo?=
 =?iso-8859-1?Q?KsLEJZ/0RpOZbXivMBhVd+KgkOgXTLipbzdcQgDaQi7T1Dpk3lXvOTGsqP?=
 =?iso-8859-1?Q?Qy5SuprX+QBN8JYBdd+RB5DUSehvgF8P7nj5vUCMVtyFND1XgFDbz6je7L?=
 =?iso-8859-1?Q?wrUAyQJ7o7FfFiSbWvFAX5qlbTrSVMYB4I7moiTZJ3oihw7CthNWkFS7rg?=
 =?iso-8859-1?Q?DzDRYskqhPk5bmzh1AFiVgPzG2ol1bESI1QSdoDyO1CAlzS9KXEhCkse3X?=
 =?iso-8859-1?Q?eh014kEfPIBrVlGWMYwQiFBWH/xX46Ajgt3Ca0YME8cefG5CNof94xQgwK?=
 =?iso-8859-1?Q?dncc2UFy2xAqcs/BJFEv1Eud7OWTuKGIZYy3HglKcXX1G5Du0zPF63IVkR?=
 =?iso-8859-1?Q?QmdCVauH4oAes50hj8+4/CCuaKcU7EYvJXYUzkPKNbDdmkLx2f0KdzmWgY?=
 =?iso-8859-1?Q?lKww3ZOPYtlMnFq5M5edPRvWJZsjWnouhAoZFgNmJeWgVgRcMhElxK4GSb?=
 =?iso-8859-1?Q?jXABVInHu+aDIxuCPUSxTj26ImYb4rdurT/XWJI5ET9pxYGQ/az/IMh4bS?=
 =?iso-8859-1?Q?q4dktlUBXOYF5gE/BiLCik5cQ8O0LhvqYTCf6u7yKIRqp6TpEyS8t93PrH?=
 =?iso-8859-1?Q?rENEJ/8JNMQv5U5DbllQtJEu1/dPQpuX0zEBQS7Q/652wJP0wNlgmyMFtx?=
 =?iso-8859-1?Q?YD27K/m9Zyk1gEzncjaf3v9JFhJQ5f1oSguh1n0wUil55r5jQjB1cDDfgd?=
 =?iso-8859-1?Q?krolCGCR9WJdNcVRpCMsnP/8xn73HmtJPVBNu70M3OpcDBVH6ZsoLTvTpy?=
 =?iso-8859-1?Q?UbimWZYwylCZu0q9bWIL3eT9oDK6HCGBpX8YaKh/3Mh+CL2kVVAZNZCcDx?=
 =?iso-8859-1?Q?9gkR2KI1BVVX+h4g/FThke+lCEFBCorVIQsVMtbVLsDM7fWQd1F4r/f76h?=
 =?iso-8859-1?Q?NgM3+p3kQqbX+U+w9o9wMzBQZpY0EmTDinoWj4shY58mb6CtIxTCiKijQC?=
 =?iso-8859-1?Q?yxyJ+iwER0PIhtOLco1MhDUEekL1pj0CFT1duoMFf2BpWeJzMtYhh5fkRg?=
 =?iso-8859-1?Q?kq3u8GsrrnzYBs52XBx5bofTiqkWxTgpABHW7ybTvwcNajzrgI0ZkB4jh6?=
 =?iso-8859-1?Q?3qZZew3HEfnchktoURKZ2TGzY4U6XMRXrPy4XvNdB7Sm93K2UgBYXYeT00?=
 =?iso-8859-1?Q?RJWoh7Qk5QOg9NTNsRbnrLrQZFIQq5iASrPId82UlBDQy8uxMMTrAWSwmx?=
 =?iso-8859-1?Q?XJeslAG9GgTaS0Zk3?=
x-microsoft-antispam-prvs: <DM6PR04MB4219193F4070102AD7006EBD8D670@DM6PR04MB4219.namprd04.prod.outlook.com>
x-forefront-prvs: 09480768F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(346002)(136003)(366004)(39860400002)(199004)(189003)(6916009)(8676002)(81166006)(81156014)(6436002)(486006)(44832011)(6306002)(14454004)(1076003)(8936002)(68736007)(2616005)(476003)(6512007)(186003)(105586002)(6486002)(54906003)(53936002)(316002)(106356001)(2906002)(386003)(6116002)(3846002)(478600001)(305945005)(26005)(71200400001)(256004)(71190400001)(966005)(66066001)(99286004)(52116002)(25786009)(7736002)(50226002)(6506007)(102836004)(86362001)(97736004)(4326008)(36756003)(72206003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4219;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mEXmiJo3RHSSVploq6GuPp7j8NS2yPdxZzi5ulQBBYqhAJX1v6gN4ndd+Dl4HMr6IVIyI4D0qjOzG/hrKMQjxadItGdz5O89cihec5lmEgTklSD1VdI897zLhhP7gCKTX9wuyfM9pv3VuLQARGDf5jXts0xhbfUcDqMEuUolw9bgG9dP1IovluDjLOEPDmD4RBX96i351Gyf5sOADjJsblfHMLYlMWEwfCBoW2ZLtBVJYEzxzvE1t5tTxF6Yk+ASlkN7qNXaj93QTwvktsN0cv5EoUpTlbhCrjVE2hkWM+PGy22QvTrrn+phFQatnyOaSvlvQCGBI6wXN76QxpuWFeVFY7YcXrzDh3ieJtt37aqG97nrobl/Wit86NOj2h6RDAnFwui1KOa8xXo289AYWRqBvC/8oes+QQ2UDDWxofY=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db4b46f-2ce6-4a03-f0c2-08d692562051
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2019 08:26:31.2157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_002637_517524_1CBB0421 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit d13937116f1e82bf508a6325111b322c30c85eb9:

  Linux 5.0-rc6 (2019-02-10 14:42:20 -0800)

are available in the Git repository at:

  https://github.com/avpatel/linux.git tags/riscv-fixmap-for-palmer-linux-5.0-rc6

for you to fetch changes up to 49f4f73f51bed5b840ea4f944cfb7f4fbc78a86a:

  RISC-V: Free-up initrd in free_initrd_mem() (2019-02-14 13:32:25 +0530)

----------------------------------------------------------------
This tag contains RISC-V fixmap patches.

----------------------------------------------------------------
Anup Patel (5):
      RISC-V: Setup init_mm before parse_early_param()
      RISC-V: Move setup_bootmem() to mm/init.c
      RISC-V: Move setup_vm() to mm/init.c
      RISC-V: Implement compile-time fixed mappings
      RISC-V: Free-up initrd in free_initrd_mem()

 arch/riscv/Kconfig               |   3 +
 arch/riscv/include/asm/fixmap.h  |  44 +++++++++++
 arch/riscv/include/asm/pgtable.h |   1 +
 arch/riscv/kernel/setup.c        | 130 +-------------------------------
 arch/riscv/mm/init.c             | 156 ++++++++++++++++++++++++++++++++++++++-
 5 files changed, 207 insertions(+), 127 deletions(-)
 create mode 100644 arch/riscv/include/asm/fixmap.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
