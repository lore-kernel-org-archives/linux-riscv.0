Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC758C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 06:32:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C20A222C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 06:32:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ugiai6mI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Mb7ILi/F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="m/oukO1M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C20A222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dI1iKPv1Rj9Fs0afOfot5FRJuLacjS5JSbHCOdT3TjI=; b=Ugiai6mILmIuW5
	5IWw9EM1UV9evPfZa1eXzEeIfX9JiatS4YWQgLEl4qe4RyNyKR3E6yRYDysbtjxS/CGNan2cEUgZE
	NExCygVS1PZRhkAti8VP52QVnR0fps3VqPuN8i2Sw+7JLOC7K3NVKUFUtMq+D7GwfsfJ2e5eT9RM9
	xiDxOBXSnrp1bibNNdDLOeX/Y1f1jtyE/RWR3GfgNsB3qfTS48LfMi0EyJ8IDP+4nHxYq9C/CwEm4
	os9jQBbCQSxYYxIZgUCAOnDJ1l91kHHklEujpyF2ZO2noh16ampbA2YGIncFbLxHOqdj2Se/kyA1C
	Q10UjdB783hg3eQ6EXYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gto5w-0006tg-Nq; Wed, 13 Feb 2019 06:32:32 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gto5s-0006lZ-NS
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 06:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550039549; x=1581575549;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h25QTCPdlhMfqtz+zmztEhyRxhdRVXagsuYHINwV8lo=;
 b=Mb7ILi/Fb1wUBBfPwAW4n/7BjTc6rAnVsfZgYEAiq+dewespUvRyzLEB
 ZbJnuw1ZHbpolp2t2/KTkrcM7X8WLd0kiiMiML8hbxWTKIvBmjSf1bk77
 h9TzcPphR8RLFxN/gI/05COmeu+EyLoJvUn0bFTFQ/+KmlFeiQcmIP7fz
 j9VLZrmTQIXYIDnSv03ujuUzjgEVybEGMhKOSFjrYGF5y0GCpOf90tRNu
 lDnDWAXi6PGAsPtKc6i1I32Yo4xoltjak0E9BMnwoci3HhOJ+MbyXsnET
 Xwy3JmuL3p3P85qEkiMYtwbf79utpsrlCHFbej5gSFDqnI2u/IAIgwQOT g==;
X-IronPort-AV: E=Sophos;i="5.58,364,1544457600"; d="scan'208";a="102859901"
Received: from mail-co1nam05lp2050.outbound.protection.outlook.com (HELO
 NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.50])
 by ob1.hgst.iphmx.com with ESMTP; 13 Feb 2019 14:32:25 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8qCA2Iv5UJ1d1yEkinn+T39/F/zEuxMl5ljAL1ZXGM=;
 b=m/oukO1MXLU7grl9pGZVN8I2FUBamNt5QjLOayGTVm80CiW6ckS6o+UFz6HK0QA6CoBVHj4s11n87w5YrZZWp+Hw02aUWci8Q1NTmwaL1NY0jZZa6O1lJPsr1mGtFrZ5UaqXXVljl8l/UTKimoL5mYQfr1TQ+TxQbzOFc8rJLuY=
Received: from DM6PR04MB6059.namprd04.prod.outlook.com (20.178.226.89) by
 DM6PR04MB5515.namprd04.prod.outlook.com (20.178.224.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.22; Wed, 13 Feb 2019 06:32:07 +0000
Received: from DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c]) by DM6PR04MB6059.namprd04.prod.outlook.com
 ([fe80::d006:5be7:c3f:ba6c%2]) with mapi id 15.20.1601.023; Wed, 13 Feb 2019
 06:32:07 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v4 2/6] RISC-V: Setup init_mm before parse_early_param()
Thread-Topic: [PATCH v4 2/6] RISC-V: Setup init_mm before parse_early_param()
Thread-Index: AQHUw2XXY56X4eWHMkuwX0WnD4R8rA==
Date: Wed, 13 Feb 2019 06:32:07 +0000
Message-ID: <20190213063127.28703-3-anup.patel@wdc.com>
References: <20190213063127.28703-1-anup.patel@wdc.com>
In-Reply-To: <20190213063127.28703-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::13) To DM6PR04MB6059.namprd04.prod.outlook.com
 (2603:10b6:5:129::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [129.253.179.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ed4c8e0-c26d-4f5a-47ba-08d6917cf972
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR04MB5515; 
x-ms-traffictypediagnostic: DM6PR04MB5515:
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR04MB5515;
 23:zJ0fRm00/9MUwR01jnNrYGUu+B/cpT+BI7OX1VY?=
 =?iso-8859-1?Q?8lhItQ5soJX+sYeoBeQ67k/sSDN8fO8M7zGIdsfaOY2/grKKH93tRG/iBr?=
 =?iso-8859-1?Q?KVsNfGevV+if7j6FSgrCjzRizNY5KR7we0WT75yiLE82sAPdC61PnNxbb8?=
 =?iso-8859-1?Q?31llYn4cI0ItrE1F79R22DzDHxr5Cc148+cRPyomeZ+IJukoBSJo8jBQB1?=
 =?iso-8859-1?Q?r61J2i8iDRz1JqTCUngEtsj5YQlJNaHSiGtw7JESlEEgmLoVSakHp2YRxB?=
 =?iso-8859-1?Q?8D5F32BsZ1cfQWNmT/FiuH/KlglUnDZkP7QwpTsmcubybKSxbzewoh1iib?=
 =?iso-8859-1?Q?fic+GNFSqbduUgPEc2xH22B9Quxja1nWSZ37qi7XF7vp35vxX9IyDl9ms3?=
 =?iso-8859-1?Q?ZkkhfBJtkh0s/vQcgajMmVLQTo6YwI65plZH02P97h+CB4eaKXD9g8RYN+?=
 =?iso-8859-1?Q?oAxuO8i6QBSxhJzqAEzCM7QmLzGOWG/q60tHloujHMkW5lnwXOaBrdt7ll?=
 =?iso-8859-1?Q?gpYNeejrk5cODbpP5iZYDdyeyQxRPur0bf9A6nvCgGMfvRjD4mFfk0e7ks?=
 =?iso-8859-1?Q?UT3JyJWyYHGnL/1WVY54sGUHG7YIAXXNuOvO1lPP47t/+ThWfsz2/mjDj+?=
 =?iso-8859-1?Q?IMrS4aeIyjWg0qNNMxbREtTC4HN+NyE5fYbV4SxW4dyKGTCRps2Ba6OtsZ?=
 =?iso-8859-1?Q?Uf+w8EwY/qsUdKkgv701XRQxXsdjvgrp8v9H0N+F5JKp+ZMCgPwA83K/CN?=
 =?iso-8859-1?Q?LfNTWbNIm7NT9dnjKIpu/TWy2MtvKlSL/gzDiPQvGK4tzoPfojga7KtLkW?=
 =?iso-8859-1?Q?/va1t20jchk0g+K8vxjRYf8EHNELPqAmttsa7idHTjDlPnhwfXxwBNUyhv?=
 =?iso-8859-1?Q?XxjAwTSlo+aMqUfdyaV7yt8wjYKbWouxteNw1QN76hMHebIQD0+afIxBsN?=
 =?iso-8859-1?Q?03vt4QMaufUdQHbozw4+soGnfUcyljli48KNPDrs97xeocsluqLuKisAht?=
 =?iso-8859-1?Q?gMbOwMq4y3nK6KwRwaIEO+TU3WAtXx15s+7uoPG31IB9AZtqgj0Kzuem7N?=
 =?iso-8859-1?Q?7xF+WOdCcbxKf4jzyXnQVIp730WmoOuv6im+7uonlX6KRyKy09Y0bklYmm?=
 =?iso-8859-1?Q?qedio6t3uSYKsx2vbk8r5DHG8wV8zPDXeJLRifD+Wqpchbz2uce+RP3+72?=
 =?iso-8859-1?Q?aAeOGPYXmF4GbvD339XnmlwpAyVvrnsKvgkveUMg88K1QLM77Xza7dllFh?=
 =?iso-8859-1?Q?BbOQctUeLlca5i9oGwiw6cO3XT0k9H5j2qR94yLdtEbSJp3+l5ubTMTVmc?=
 =?iso-8859-1?Q?FvAK08fhtuIOlIFCwjEtD2l?=
x-microsoft-antispam-prvs: <DM6PR04MB5515B33C63BC65B3369D68D38D660@DM6PR04MB5515.namprd04.prod.outlook.com>
x-forefront-prvs: 094700CA91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(39860400002)(346002)(396003)(376002)(199004)(189003)(1076003)(6512007)(2171002)(478600001)(72206003)(446003)(386003)(6346003)(2616005)(11346002)(102836004)(6506007)(476003)(2906002)(256004)(50226002)(4326008)(97736004)(14454004)(6486002)(110136005)(25786009)(6436002)(68736007)(316002)(44832011)(486006)(99286004)(36756003)(8936002)(186003)(6116002)(106356001)(81156014)(81166006)(8676002)(3846002)(86362001)(26005)(105586002)(71200400001)(71190400001)(66066001)(305945005)(53936002)(52116002)(7736002)(76176011)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB5515;
 H:DM6PR04MB6059.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z5K61Xf4Kf4a0zlwo1cfGlFQKMyi1Md1daORb9HUwnsHXoHAgf93qvQjf8NqxbITj6DhMzOOZCdbcnvoWXdeOj2WIkpGtkDeWZeGGSa4I53xnupstcNYpBOQq6uycEeQtjR3nzddRtR9tBaX7i2Ia62A2OMA5JqfvJIdSoARi/j2HY/p3OpSLZTC1nr4e3ubKWT8dj0iMLu0tdz6/BQKPPWGs4VMA0hMTexNvEJ3B4GCHccYijVY1flV7qOs+25XI5Hl3fshdCT+Lx+4rJ3g+ttDuIu655f9vcD8no1V8jpT7eKKVgJZ4Unh/jlwgE73CMR0E1CU3eovQLdUzjHxvFPrTF55KoK2rm6nz9koFW66hC2eJdIWOvkdIpb1KEVsNGggMMqv1bcwuUgt+YEPosw0ENGh1zFpM5248R/Ofdk=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed4c8e0-c26d-4f5a-47ba-08d6917cf972
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2019 06:32:03.6391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5515
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_223228_853588_F73D9195 
X-CRM114-Status: GOOD (  14.04  )
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

We should setup init_mm before doing parse_early_param() in setup_arch()
to be consistent with setup_arch() of other architectures such as x86,
ARM, and ARM64.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/setup.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 36f60b4d2147..9e6395b7d409 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -208,15 +208,15 @@ static void __init setup_bootmem(void)
 
 void __init setup_arch(char **cmdline_p)
 {
-	*cmdline_p = boot_command_line;
-
-	parse_early_param();
-
 	init_mm.start_code = (unsigned long) _stext;
 	init_mm.end_code   = (unsigned long) _etext;
 	init_mm.end_data   = (unsigned long) _edata;
 	init_mm.brk        = (unsigned long) _end;
 
+	*cmdline_p = boot_command_line;
+
+	parse_early_param();
+
 	setup_bootmem();
 	paging_init();
 	unflatten_device_tree();
@@ -235,4 +235,3 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_fill_hwcap();
 }
-
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
