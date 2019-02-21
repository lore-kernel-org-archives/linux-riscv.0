Return-Path: <SRS0=eaTI=Q4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAD_ENC_HEADER,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD3CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 06:50:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE2E2086C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 06:50:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HRx+Jt1g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="fxYEswrG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="CRgxeAwU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE2E2086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ubzs+UFVLWq5gwD+e4DrK5BC7gQlwMr6b5Hw4Eizsko=; b=HRx+Jt1g5ZbhtE
	Oo/wNTTRM/RSNXxdAiZ5PjRFizhn6tewVWeznehLZjGa+CfTJwi8NxIPgnXSb0zddK4nO9YWAyZw9
	HVWwc4vKMfhUiCuVPQ524lkszwZPS+8BYzm4V2j8jJxU+QhrdZga+yufZ1NMLvBvtqgV33p1ZHMlF
	GZJuUlxwsI1naNMtgzS78zumFgESwDr/Y78gmSXIED1zFqBBiPNq4uzKX4Ks0rEP07/yDJEri0II1
	TUXbGeC7KQnp+CuCY068LQpdL+Kr+NXIYoQpZ+PxCkNt9d45dK98wIHAnwrRpfGj2Fj/7Yk6xseML
	hhs2eBhXiuZv0ZUeBSQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwiBU-0005UC-Ur; Thu, 21 Feb 2019 06:50:16 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwiBR-0005Tg-J9
 for linux-riscv@lists.infradead.org; Thu, 21 Feb 2019 06:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550731813; x=1582267813;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=UfhaXu/bXDZEWHA5Mx+pefu1Od3UP3U8jF48nUQxnPs=;
 b=fxYEswrGIhgLCMuAqRFI5WhmczexJ+OdgLLSNmasSSPGoNWnxVT17nzQ
 gKeU+M4hg9AubxHjTglncOcA46TTUDoVXR1NNXgw7K3CRWhtFB9lXEm55
 TMi1pZKuZaahQOPG85GlxvkOpZMd0amfdwXTYbkbLWozkLE/T7kvqE1fp
 /xoc6XnOdve1TfjFOSq14HOcUKEXz1T5JAtaBrNybGV6k8ssdnl6jtDqz
 qLlx0oguQdBXErQAthuMa9FNUcmDoic3Y7RnlUFSwawsgEtiZ8VrlbwSu
 c+87/DRX2oVCSDwRB14dOpCd1Pp1Q/8zpYQqhjoBgJrvPzu7AXV4B17Xg w==;
X-IronPort-AV: E=Sophos;i="5.58,394,1544457600"; d="scan'208";a="103573673"
Received: from mail-bn3nam01lp2059.outbound.protection.outlook.com (HELO
 NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.59])
 by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2019 14:50:10 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUYTmIdEpLuO2Elu2MYekYKKJSk0I7ZipCKEK+isNMg=;
 b=CRgxeAwUmWqcIOwUeDPdMkEnWtxXK/+4SbFUPVU/pmkXltR3vZAPATzb0iV2ORBKPd2tDufocNk3ED1tSq/2/KKlw2M0+KtaRMYrsr0X9DDo4sD5H6eMFu1phFI1Cx/zubvYOudz0oPYg9zspIAkSuYW/8WnAthfaQ+HpbVMino=
Received: from BN8PR04MB6050.namprd04.prod.outlook.com (20.178.214.224) by
 BN8PR04MB5539.namprd04.prod.outlook.com (20.178.217.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.15; Thu, 21 Feb 2019 06:50:08 +0000
Received: from BN8PR04MB6050.namprd04.prod.outlook.com
 ([fe80::f87a:cb97:e3a:b8e7]) by BN8PR04MB6050.namprd04.prod.outlook.com
 ([fe80::f87a:cb97:e3a:b8e7%4]) with mapi id 15.20.1622.020; Thu, 21 Feb 2019
 06:50:08 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [GIT PULL v2] Fixmap support and MM cleanups
Thread-Topic: [GIT PULL v2] Fixmap support and MM cleanups
Thread-Index: AQHUybGuArjN7zBqVkGm1hi0MfQz1w==
Date: Thu, 21 Feb 2019 06:50:08 +0000
Message-ID: <20190221064935.41843-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::31) To BN8PR04MB6050.namprd04.prod.outlook.com
 (2603:10b6:408:53::32)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [106.51.20.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6524832e-af02-4557-db5f-08d697c8d110
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:BN8PR04MB5539; 
x-ms-traffictypediagnostic: BN8PR04MB5539:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; BN8PR04MB5539;
 23:1QTKdd1LEihbdzapONAna5xdOERiNTO1kKxcsUS?=
 =?iso-8859-1?Q?2j7GIKJpxPwZFp9LbNUrUdb3VwVC2Wx/nGIYfAa3C8BM8jv/kFxIvA3GBo?=
 =?iso-8859-1?Q?X6BvBzz/xOMZyalQCvjeKHtAOdAaFG6OH16xNCMHOk8VeEYRTO0VC9vRQu?=
 =?iso-8859-1?Q?OW6y9UUIRVPBlEgbHwz9HMuL37czH4B37NOs2xIXIIbTS0Dik8YTqKVOfY?=
 =?iso-8859-1?Q?Aaw8qPk9C1TCJBFT4t+08SwAwKpcRYiJCW8EjN+y+dsppjXiyPF1qZxKzQ?=
 =?iso-8859-1?Q?p4xX2AY6CTytX8CqR7uOiSoOYzSHCJPfQZPbVDAcfrArq3KLzRrSFljkhy?=
 =?iso-8859-1?Q?OIgdsjYFRHS+uXaju95KgjCk3pmjoZACKRyEMvY6I6G9tYAwz3+YXws1Lq?=
 =?iso-8859-1?Q?dnBXPlA5m0JbGqNMKzxI1poBx1mMKfBuUmvb7MNHU6VO/G+gIPN8KxN5/A?=
 =?iso-8859-1?Q?BX01qvkLCU6cOfid36zW6Ju5aSW9AzSx9NQRLE3uDQAw0KeSFHbDCIlcg4?=
 =?iso-8859-1?Q?hd++oQzAoJ65UrCy8IoQCwaEJLFp58BjRlwybg8PnOYIuLKJE5TNTKSqVR?=
 =?iso-8859-1?Q?A46/J1//cwkXZoPkA29L+GvzXVB/kWk6In8JzHTPRD/OrIbrOLpwSFxkL5?=
 =?iso-8859-1?Q?f58iII1UK7q6cPq/sWifGqZ8FW0tf5UDbUbHEbBSUfWFveb+VQnXgPXoBh?=
 =?iso-8859-1?Q?NzNuxtZ8Hm8/lZE1s9/4T8FIYpYSUga7P80wLee7eOyVzsxIYt0Tmi4uVl?=
 =?iso-8859-1?Q?0lQ7yM0UUpfFcOrqlK0c2dN/uXEBCLZahNXxPU3CQY6qwimt5riRv1zbyY?=
 =?iso-8859-1?Q?oxx9Qsj/qRbXa4OP096t1FIUktVw3rrXCf/rtI1r5wYEit1qILpyn14u0H?=
 =?iso-8859-1?Q?nSuR+OYbhMnOoyHcv3A/vLbza9mGKIV3776HY31vjWtAT6CSi1wyElZlnl?=
 =?iso-8859-1?Q?ZTy9wnMRvBFvzU9Z9Ig3q8XpOSFsYH2OejdF+8E29Qi2fVjQOhz8pRYeXn?=
 =?iso-8859-1?Q?1BRrPU1FRr1KkmuRKhoBAFUDo8bFBp82X0dp8z3WBdR0eMDwzdhgOM+zz2?=
 =?iso-8859-1?Q?AF3l8JqtF7WeSO8KgkTO7gXUp07ihb1IXR5q1LRStfmz0n4vsOkyezI9jG?=
 =?iso-8859-1?Q?oo8DrdSwexlAYORi64c8qXJ3Cv6jq+xd64urXblKCtQl6evhW5iMSXWYCW?=
 =?iso-8859-1?Q?0YIP9GqajHr5GsaEI+kr92K3UNxrMVgnp6PAvCqkyfVSYHjf5KYdyR5qtD?=
 =?iso-8859-1?Q?Hs1G12WVhXrHCrOGRpdYVwH08G1y5p46BSDeyhvlooHWDzKHfKCG3prs9l?=
 =?iso-8859-1?Q?PJPlyzEnAiYNv3Q30OJGtXkfVCaYhb/FvWd3QZqFoVw9A=3D=3D?=
x-microsoft-antispam-prvs: <BN8PR04MB55399763D5022CDD8AE9C75A8D7E0@BN8PR04MB5539.namprd04.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(39860400002)(346002)(376002)(396003)(189003)(199004)(26005)(486006)(14454004)(186003)(476003)(71190400001)(44832011)(478600001)(2616005)(71200400001)(99286004)(52116002)(68736007)(2906002)(4326008)(25786009)(966005)(72206003)(78486014)(6916009)(102836004)(6506007)(386003)(105586002)(55236004)(9456002)(6486002)(3846002)(8936002)(8676002)(305945005)(5660300002)(97736004)(7736002)(53936002)(6512007)(256004)(36756003)(81156014)(86362001)(54906003)(6306002)(66066001)(81166006)(6436002)(316002)(6116002)(106356001)(1076003)(50226002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR04MB5539;
 H:BN8PR04MB6050.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s007dWyS8juh0KGJjRfXa28SHeu5g2Mjnz3aPG4C9sGHjdAJHpKcO9kcBCWbVpT9pbe5RrHqVXBHEzECZvq8XGM55wNOBRQQD33NfDSIgBFKjJvW1uPeU9l305ntSz6skpg1LFXD5d+s+4DnN0a3wSZL6U8DH0faAPyc3kj2dGvIzzG/fQuBUwQE534LLv52Xd9VLc+XbVv+cGwjyz945t7x0pAUEi3aONHgiP9SZgiaOeqqfqkTSjopmKvEXYQ9pUkskKfxelmcGOWMnoflhHzRC9l7qU9pz7oDHhBRBMpVK21p/h6Y7ZUGnKgHKG8t0y22Vmqdc/2DpIBryvJSCiPSA1Lh94SQP2UWBIa1xE5T6zPHMHmKwGauEGvDy6B1X79bnLCvgOyyZ7FDB3rI9UO6h09yrUU1F/b1EI5FKIM=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6524832e-af02-4557-db5f-08d697c8d110
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 06:50:05.8788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5539
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_225013_741545_F3815211 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 79a47bad61bb340aed94e73b471616b246b2ecf3:

  riscv: remove the HAVE_KPROBES option (2019-02-19 13:55:18 -0800)

are available in the Git repository at:

  https://github.com/avpatel/linux.git tags/riscv-fixmap-for-palmer

for you to fetch changes up to 823900cd01301c4720b23afa9f3d08036e07245a:

  RISC-V: Free-up initrd in free_initrd_mem() (2019-02-21 11:26:50 +0530)

----------------------------------------------------------------
This tag contains RISC-V fixmap patches based on for-next branch of
Palmer's gitrepo.

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
